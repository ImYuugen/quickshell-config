// Mix col1 with col2 by mix_ratio (0 == col1, 1 == col2)
function mix(col1, col2, mix_ratio = 0.5) {
    const mix_num = (n1, n2) => n1 * mix_ratio + n2 * (1 - mix_ratio);
    const [ red, green, blue, alpha ] = [
        mix_num(col1.r, col2.r),
        mix_num(col1.g, col2.g),
        mix_num(col1.b, col2.b),
        mix_num(col1.a, col2.a),
    ];
    return Qt.rgba(red, green, blue, alpha);
}

// Makes a color more transparent by strength (0 does nothing, 1 is transparent)
function transparentize(col, strength = 0) {
    return Qt.rgba(col.r, col.g, col.b, col.a * (1 - strength));
}

// Inverts a color...
function invert(col) {
    return Qt.rgba(1 - col.r, 1 - col.g, 1 - col.b, col.a);
}
