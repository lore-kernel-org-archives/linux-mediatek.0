From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] mt76x0: run vco calibration for each channel configuration
Date: Wed, 19 Sep 2018 15:03:52 +0300
Message-ID: <87worh1yon.fsf@kamboji.qca.qualcomm.com>
References: <20180907211312.17918-1-lorenzo.bianconi@redhat.com>
        <20180918114356.GB15285@redhat.com>
        <20180918120234.GD15285@redhat.com>
        <871s9r2d3g.fsf@kamboji.qca.qualcomm.com>
        <CAM0KTbAPHPK04SntA9UL0rGaaNjTy=E2hRoO7xiRkbMcq9b7Sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM0KTbAPHPK04SntA9UL0rGaaNjTy=E2hRoO7xiRkbMcq9b7Sw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
        (Sid Hayn's message of "Tue, 18 Sep 2018 10:26:09 -0400")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> mt76x0 isn't in 4.18 at all, it's being added in 4.19 isn't it?  I'm
> not sure you can call it a regression, but adding a new driver with a
> known bug that breaks an entire use case (monitor mode) seems silly
> when a small and tested fix is available.  Pretty please.

Unfortunately it's not that simple as you think. And do take into
account that the maintainers need to deal with a lot of patches and
email so keeping things simple is important.

And please do not top post:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#do_not_top_post_and_edit_your_quotes

-- 
Kalle Valo
