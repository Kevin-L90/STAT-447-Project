data {
  int<lower=0> N;
  int<lower=0> y[N];
  vector[N] x;
  vector[N] x2;
}

parameters {
  real alpha;
  real beta1;
  real beta2;
}

model {
  alpha ~ normal(0, 10);
  beta1 ~ normal(0, 1);
  beta2 ~ normal(0, 1);

  y ~ poisson_log(alpha + beta1 * x + beta2 * x2);
}

generated quantities {
  vector[N] mu;
  for (n in 1:N)
    mu[n] = exp(alpha + beta1 * x[n] * beta2 * x2[n]);
}