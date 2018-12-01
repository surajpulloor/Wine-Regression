function val = sigmoid(z)
    val = 1 ./ (1 + e.^-z);