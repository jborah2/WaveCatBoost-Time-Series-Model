library(caretForecast)
library(readxl)
rank_ew <- read_excel("C:/jintu/DATA/Predictions/Plotting/AVPs.xlsx", sheet='1day')
rank_ew
forecast_waveletnn <- rank_ew$`Predicted NO2 CPCB` #fore_warnnx$fit_warnnx$Finalforecast
forecast_waveletnn
#test
con_tst <- rank_ew$`Actual NO2 CPCB`
con_tst
# Calculation of residuals
resid_chn <- abs(forecast_waveletnn - con_tst)
resid_chn
conf_waveletnn <- conformalRegressor(resid_chn, sigmas = NULL)
conf_waveletnn
## S3 method for class 'conformalRegressor'
conf_pred <- predict(
  conf_waveletnn,
  y_hat = forecast_waveletnn,
  sigmas = NULL,
  confidence = 0.95,
  y_min = -Inf,
  y_max = Inf
)
conf_pred
library(writexl)
write_xlsx(conf_pred, "C:/jintu/DATA/Predictions/Plotting/CPCB/1d NO2 CPCB.xlsx")
