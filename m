From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] mt76x0: run vco calibration for each channel
 configuration
Date: Wed, 19 Sep 2018 13:24:18 +0200
Message-ID: <20180919112416.GA24594@redhat.com>
References: <20180907211312.17918-1-lorenzo.bianconi@redhat.com>
 <20180918114356.GB15285@redhat.com>
 <20180918120234.GD15285@redhat.com>
 <871s9r2d3g.fsf@kamboji.qca.qualcomm.com>
 <CAM0KTbAPHPK04SntA9UL0rGaaNjTy=E2hRoO7xiRkbMcq9b7Sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAM0KTbAPHPK04SntA9UL0rGaaNjTy=E2hRoO7xiRkbMcq9b7Sw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Sep 18, 2018 at 10:26:09AM -0400, Sid Hayn wrote:
> mt76x0 isn't in 4.18 at all, it's being added in 4.19 isn't it?  I'm
> not sure you can call it a regression, but adding a new driver with a
> known bug that breaks an entire use case (monitor mode) seems silly
> when a small and tested fix is available.  Pretty please.

Patch conflict with pending mt76 -next patches. Apply it and rebase
all other patches on top of it, is a lot of work. I agree with
Kalle that it will be better to apply this patch on top of -next
and CC stable. Problem should be fixed in 4.19.1 or 4.19.2 .

Regards
Stanislaw
