From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 04/11] mt76x0: usb files
Date: Mon, 23 Jul 2018 09:38:35 +0300
Message-ID: <87va96tq1g.fsf@purkki.adurom.net>
References: <1530771142-4118-1-git-send-email-sgruszka@redhat.com>
        <1530771142-4118-5-git-send-email-sgruszka@redhat.com>
        <20180705150519.GB17524@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180705150519.GB17524-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org> (Lorenzo
        Bianconi's message of "Thu, 5 Jul 2018 17:05:20 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> On Jul 05, Stanislaw Gruszka wrote:
>> Add usb files of mt76x0 driver.
>> 
>> Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

[...]

>> +static int mt76x0_suspend(struct usb_interface *usb_intf, pm_message_t state)
>> +{
>> +	struct mt76x0_dev *dev = usb_get_intfdata(usb_intf);
>> +
>> +	mt76x0_cleanup(dev);
>
> Is it necessary to deallocate rx queue here in case of a system suspend?

BTW it would really helpful to others if you could edit your quotes. It
takes some time to find your oneliner from a 450 line message.

-- 
Kalle Valo
