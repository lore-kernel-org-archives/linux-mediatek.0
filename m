From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [ANN] mt76x0 usb driver
Date: Mon, 9 Apr 2018 16:10:32 +0200
Message-ID: <20180409141032.GA9247@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Jakub =?utf-8?B?S2ljacWEc2tp?= <moorray3-5tc4TXWwyLM@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi

I would like to announce mt76x0 driver for MT7610U USB dongles:

https://github.com/sgruszka/mt76x0

mt76x0 is based on Jakub's mt7601u mac80211 driver and is intended to be
integrated in the linux kernel.

Currently only Linksys AE6000 (ID 13b1:003e) in on USB id's list
and 5GHz does not work.

I would like to integrate the driver to kernel via mt76 driver, i.e.
add USB hooks and mt76x0 mac/phy code to mt76. This will open
possibility to develop support for mt76x2 USB devices as well as mt76x0
PCIe devices in mt76.

I would also like to establish some better collaboration with Mediatek
in order to having their present and future wireless hardware be
supported in the mainline kernel.

Thanks
Stanislaw
