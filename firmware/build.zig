const std = @import("std");
const Target = std.Target;
const Zig = std.zig;
const Builder = std.build.Builder;
const FeatureSet = std.Target.Cpu.Feature.Set;

pub fn build(b: *Builder) void {
    var features = FeatureSet.empty;

    const target = Zig.CrossTarget{
        .cpu_arch = Target.Cpu.Arch.riscv32,
        .os_tag = Target.Os.Tag.freestanding,
        .abi = Target.Abi.none,
        .cpu_features_sub = std.Target.riscv.cpu.baseline_rv32.features,
        .cpu_features_add = features,
    };

    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("firmware", "src/boot.zig");

    exe.setTarget(target);
    exe.setBuildMode(mode);

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}