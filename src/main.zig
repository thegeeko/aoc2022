const std = @import("std");
const day1 = @import("1/main.zig");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    while (true) {
        try stdout.print("Enter Day No. Plz: ", .{});
        const bare_line = try stdin.readUntilDelimiterAlloc(
            std.heap.page_allocator,
            '\n',
            32,
        );
        defer std.heap.page_allocator.free(bare_line);

        var day_num = std.fmt.parseInt(u8, bare_line, 10) catch {
            try stdout.print("Enter a valid day plz: ", .{});
            continue;
        };

        try switch (day_num) {
            1 => day1.main(),
            else => std.log.debug("Invalid", .{}),
        };
    }
}
