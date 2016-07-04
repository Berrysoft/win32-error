@echo off
cargo graph --dev-deps true --dev-line-color red --dev-line-style dotted --dev-shape round 2>&1 > graph.dot
dot -Tpng > cargo-graph.png graph.dot
del graph.dot
