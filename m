From: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mt76x[02]u 802.11w support
Date: Thu, 13 Dec 2018 09:26:09 -0500
Message-ID: <CAM0KTbBUXJsBfO0=hQgeTGVteym6iuObdyNynWumQnnGY0L3wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Per a conversation with Lorenzo, it seems that 802.11w for mt76x[02]u
has only been fixed in 4.20.  As 4.19 is a LTS kernel, I'd like to
request that work be backported.  While the improvements in 4.20 and
4.21 are already fairly obvious, a lot of people will be running 4.19
for years to come.  This is good hardware, with a working driver
(thanks team) but in the next few months excitement is going to turn
toward WPA3 which requires working 802.11w.

Pretty please backport 802.11w support to 4.19

Thanks,
Zero
