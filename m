From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [ANN] mt76x0 usb driver
Date: Tue, 17 Apr 2018 00:30:59 +0200
Message-ID: <CAJ0CqmWQX0+dCyGwf9EYO=+X9mjadDMHq1tUR8oaxH-HyMGUyg@mail.gmail.com>
References: <20180409141032.GA9247@redhat.com> <alpine.LNX.2.00.1804092042320.8369@T420s>
 <20180410101359.GA4220@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180410101359.GA4220-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, =?UTF-8?Q?Jakub_Kici=C5=84ski?= <moorray3-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Apr 10, 2018 at 12:14 PM, Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi
>
> On Mon, Apr 09, 2018 at 08:45:20PM +0200, Hans Ulli Kroll wrote:
>> here are my changes for working 5Ghz band and more USB ID's form my side
>
> I applied the changes and pushed to github repo.
>
> Thanks
> Stanislaw

Hi all,

brief update on mt76x2u support in mt76 driver: I added the support
for tx/rx data channels and I am able to successfully connect to an
unencrypted AP.
I extended the usb utility layer that can be used to support mt76x0 in
mt76 driver. Moreover I reused as mach as I can mt76x2 routines since
the register map is pretty similar with the one used by mt7612u and
similar chipsets (for the moment I just exported requested symbols).
Next steps are add encryption support and improve driver stability.

Regards,
Lorenzo
