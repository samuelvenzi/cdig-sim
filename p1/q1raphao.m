s = tf('s')

Gs = 1/(s*(s+0.25))
Gcs = (0.4578*(s+0.25))/(s+0.8)
Gs*Gcs
Ys = feedback(Gs*Gcs,1)
pole(Ys)
stepinfo(Ys)