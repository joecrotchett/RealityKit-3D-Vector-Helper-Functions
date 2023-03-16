import RealityKit

extension SIMD3 where Scalar == Float {
    static let up: Self = .init(0, 1, 0)
    static let down: Self = .init(0, -1, 0)
    static let forward: Self = .init(0, 0, -1)
    static let back: Self = .init(0, 0, 1)
    static let right: Self = .init(1, 0, 0)
    static let left: Self = .init(-1, 0, 0)
    
    func distance(from other: SIMD3<Float>) -> Float {
        return simd_distance(self, other)
    }
    
    func angle(other: SIMD3<Float>) -> Float {
        atan2f(other.x - self.x, other.z - self.z) + Float.pi
    }
    
    func vector(to b: SIMD3<Float>) -> SIMD3<Float> {
        b - self
    }

    var length: Float { 
        simd_distance(self, .init())
    }

    var isNaN: Bool {
        x.isNaN || y.isNaN || z.isNaN
    }

    var normalized: SIMD3<Float> {
        self / length
    }

    var isVertical: Bool {
        dot(self, Self.up) > 0.9
    }
}
