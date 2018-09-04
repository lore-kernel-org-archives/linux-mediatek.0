From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mt76x0 bug report
Date: Tue, 4 Sep 2018 23:04:29 +0200
Message-ID: <CAJ0CqmWAqdB8Og7fabLDeZnzFO5Aw5Qd0cYGaLrs7Ls-zM_yQw@mail.gmail.com>
References: <CAM0KTbBJuhuEyuZB_z_BcDSeXa-CJ+NwupssS2jLx0pJ0KXQGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM0KTbBJuhuEyuZB_z_BcDSeXa-CJ+NwupssS2jLx0pJ0KXQGQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

>
> I have one mt76x2u (Alfa AWUS036ACM) and a few mt76x0.
>
> I've noticed two additional issues in my testing.
>
> First issue, is that it appears the mt76x0 devices don't work properly
> in monitor mode.  Sometimes they seem to monitor one channel properly,
> but nothing else.  The mt76x2u works great, channel control, lots of
> packets, etc.

Could you elaborate a little bit please? how can you reproduce the issue?
just add an interface in monitor mode and run a scan?

>
> Second issue, and frankly a very minor one, is that the TP-Link T1U
> (which is a 5GHz only device) still thinks it has support for 2.4GHz,
> both in managed and monitor mode.

I guess it depends on eeprom values. Could you please enable debug
messages a paste
syslog output?

>
> Lastly, I already mentioned in the other thread, but it would be
> awesome if firmware version was available to ethtool.
>

Ack, I will take care of it
Regards,

Lorenzo

> Thanks for all your hard work on this,
> Zero
