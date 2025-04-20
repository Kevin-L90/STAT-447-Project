data {
  int<lower=0> N;
  int<lower=0> y[N];
  vector[N] x;
}

parameters {
  real alpha;
  real beta;
}

model {
  alpha ~ normal(0, 10);
  beta ~ normal(0, 1);

  y ~ poisson_log(alpha + beta * x);
}

generated quantities {
  vector[N] y_pred;
  for (n in 1:N)
    y_pred[n] = poisson_log_rng(alpha + beta * x[n]);
}