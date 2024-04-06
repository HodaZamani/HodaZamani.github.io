function p = GetAlpha
beta = rand;
kappa = ceil( 3 * (rand.^3) );
switch kappa
    case 1, p = beta .^ 2;
    case 2, p = 2*(1-beta) * beta;
    case 3, p = (1-beta) .^ 2;
end