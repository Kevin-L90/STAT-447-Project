data {
  int<lower=1> n;
  int counts[n];
  real time[n];
}

parameters {
  real<lower=0,upper=200> theta1;
  real<lower=0,upper=10> theta2;
  real<lower=0,upper=2 * pi()> theta3;
}

model {
  for (i in 1:n) {
    counts[i] ~ poisson(theta1 * (sin(theta2 * time[i] + theta3) + 1.1));
  }
}