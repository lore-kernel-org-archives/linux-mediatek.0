From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 00/14] Add mt76x0 driver
Date: Wed, 01 Aug 2018 11:19:10 +0300
Message-ID: <87in4u8poh.fsf@kamboji.qca.qualcomm.com>
References: <1533040864-9026-1-git-send-email-sgruszka@redhat.com>
        <87y3dqzga9.fsf@purkki.adurom.net>
        <20180801081346.GA4794@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180801081346.GA4794-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org> (Lorenzo Bianconi's
        message of "Wed, 1 Aug 2018 10:13:47 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> On Aug 01, Kalle Valo wrote:
>> Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:
>> 
>> > Add mt76x0 driver for MT7610U based USB dongles. Currently driver
>> > support only STA mode.
>> >
>> > mt76x0 is based on Jakub's mt7601u driver already included
>> > in the kernel. I would like the driver be integrated as part
>> > of mt76 (instead of separate driver in mediatek dir like mt7601u)
>> > to utilize mt76 code for adding support for MT76x0 PCIe devices
>> > in further development.
>> 
>> So what's the future for mt7601u, are we going to delete it? What's
>> Jakub's opinion about all this? And what's the delta featurewise between
>> mt7601u and this driver? Which one will be loaded by default?
>
> I think we can integrate mt7601u in mt76 as soon as mt76x0 is merged since the
> code path is pretty similar. Jakub what do you think? (That was actually on my
> ToDo list :))
>
> For the moment I guess both drivers can coexist since the
> usb_device_id lists seem different

Ah, I didn't realise that. I was exactly worried that if we would now
have two drivers supporting same device ids, but very good if that's not
the case.

-- 
Kalle Valo
