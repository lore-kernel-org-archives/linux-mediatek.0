From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 11/11] mt76: Kconfig and Makefile for mt76x0 driver
Date: Fri, 6 Jul 2018 12:32:44 +0200
Message-ID: <20180706103244.GA2033@redhat.com>
References: <1530771142-4118-1-git-send-email-sgruszka@redhat.com>
 <1530771142-4118-12-git-send-email-sgruszka@redhat.com>
 <20180705145018.GA17524@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180705145018.GA17524-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jul 05, 2018 at 04:50:19PM +0200, Lorenzo Bianconi wrote:
> On Jul 05, Stanislaw Gruszka wrote:
> > +obj-$(CONFIG_MT76x0U)    += mt76x0.o
> > +
> > +mt76x0-objs	= \
> > +	usb.o init.o main.o mcu.o trace.o dma.o eeprom.o phy.o \
> 
> There is no main.c source file, is it a leftover from previous implementation?
> Moreover compiling the driver (and fixing conflicts with mt76x2u) I have:
> 
> ERROR: "mt76x0_ops" [drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.ko] undefined!

I somehow missed the patch adding main.c .

Stanislaw
