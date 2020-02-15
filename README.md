# headbutt

[![GitHub license](https://img.shields.io/badge/license-Apache%202-blue.svg?style=flat-square)](https://raw.githubusercontent.com/hamaluik/headbutt/master/LICENSE)
[![Build Status](https://img.shields.io/travis/hamaluik/headbutt.svg?style=flat-square)](https://travis-ci.org/hamaluik/headbutt)

A GJK and EPA collision engine made with pure [Haxe](http://haxe.org/).

## Usage

Create either 2D shapes or 3D shapes by implementing the appropriate interface: `headbutt.twod.Shape` / `headbutt.threed.Shape`. Or use one of the pre-defined shapes given in `headbutt.twod.shapes` / `headbutt.threed.shapes`:

* 2D
  * `Circle`
  * `Line`
  * `Rectangle`
  * `Polygon`
* 3D
  * `Sphere`
  * `Line`
  * `Box`
  * `Polyhedron`

Then, instantiate an instance of the appropriate `Headbutt`:

```haxe
var hb2 = new headbutt.twod.Headbutt();
var hb3 = new headbutt.threed.Headbutt();
```

Next, check shapes for intersections:

```haxe
if(hb2.test(shapeA, shapeB)) { /*...*/ }
if(hb3.test(objectA, objectB)) { /*...*/ }
```

Alternatively, calculate intersections (**note:** intersection calculations haven't been implemented in 3D yet!):

```haxe
var penetration: Null<Vec2> = hb2.intersect(shapeA, shapeB);
```

## API

[API documentation is available.](https://hamaluik.github.com/headbutt/)

## Benchmarks

Benchmarks were run for each target using the results from `haxe bench.hxml`. The
benchmarks were collected on a Ryzen 3600 CPU with 32 GB of DDR4 3200 MHz ram.

| Test | Intersect | Cpp (μs/iter) | Hashlink (μs/iter) | Node/Javascript (μs/iter) | Python (μs/iter) | Interp (μs/iter) |
|:-----|:---------:|---------:|-------:|-------:|-------:|-------:|
| line/line | ✔ |0.5 ± 0.1 | 4.4 ± 0.1 | 0.3 ± 1.1 | 18.6 ± 0.1 | 10.8 ± 0.1 |
| line/line | ✗ | 0.3 ± 0 | 2.5 ± 0.1 | 0.2 ± 0.6 | 12 ± 0.1 | 6.8 ± 0 |
| circ/circ | ✔ | 0.5 ± 0.1 | 5.5 ± 0.1 | 0.3 ± 0.9 | 23.8 ± 0.1 | 12.8 ± 0.1 |
| circ/circ | ✗ | 0.2 ± 0 | 0.9 ± 0 | 0.1 ± 0.3 | 4.5 ± 0.1 | 2.6 ± 0 |
| pent/pent | ✔ | 0.6 ± 0.1 | 7.5 ± 0.1 | 0.4 ± 1.1 | 55.4 ± 0.2 | 24.5 ± 0.1 |
| pent/pent | ✗ | 0.2 ± 0 | 1.9 ± 0 | 0.1 ± 0.3 | 15.1 ± 0.3 | 6.7 ± 0 |
