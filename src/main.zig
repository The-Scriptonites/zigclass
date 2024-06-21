const std = @import("std");
const fs = std.fs; // @import("std").fs;

pub fn main() anyerror!void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us {s} in this {s}, {s}.\n", .{ "codebase", "here", "world", "lovely-cat" });
    // {s} = string
    // {c} = character (u8)
    // {d} = number
    // {any} = guess
    // Anonymous struct == Tuple

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    try stdout_file.print("We work here\n", .{});
    funny_function();
    // var bw = std.io.bufferedWriter(stdout_file);
    // const stdout = bw.writer();

    // try stdout.print("Run `zig build test` to run the tests.\n", .{});

    // try bw.flush(); // don't forget to flush!
}

fn funny_function() void {
    std.debug.print("duh\n", .{});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

test funny_function {
    try std.testing.expectEqual(u32, 444, 111);
}