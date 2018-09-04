From: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mt76x0 bug report
Date: Tue, 4 Sep 2018 17:33:48 +0000
Message-ID: <CAM0KTbBJuhuEyuZB_z_BcDSeXa-CJ+NwupssS2jLx0pJ0KXQGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

I have one mt76x2u (Alfa AWUS036ACM) and a few mt76x0.

I've noticed two additional issues in my testing.

First issue, is that it appears the mt76x0 devices don't work properly
in monitor mode.  Sometimes they seem to monitor one channel properly,
but nothing else.  The mt76x2u works great, channel control, lots of
packets, etc.

Second issue, and frankly a very minor one, is that the TP-Link T1U
(which is a 5GHz only device) still thinks it has support for 2.4GHz,
both in managed and monitor mode.

Lastly, I already mentioned in the other thread, but it would be
awesome if firmware version was available to ethtool.

Thanks for all your hard work on this,
Zero
