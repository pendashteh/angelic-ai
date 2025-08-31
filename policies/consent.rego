package consent

default allow := false

allow {
  input.purpose == "book_food_relief"
  input.consents.booking == true
  time.now_ns() < input.consents.expiry_ns
}

deny[msg] {
  not allow
  msg := "Consent missing/expired for booking."
}
