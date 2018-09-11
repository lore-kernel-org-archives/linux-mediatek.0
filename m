From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 00/22] mt76 patches 2018-09-04
Date: Tue, 11 Sep 2018 17:19:37 +0300
Message-ID: <87h8iwru9y.fsf@purkki.adurom.net>
References: <1536072075-6990-1-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536072075-6990-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Stanislaw
        Gruszka's message of "Tue, 4 Sep 2018 16:40:53 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> More mt76x0/mt76x2 integration.
>
> This set is quite big but I would like to move patches upstream
> from my github tree as fast as possible. I have there 42 more
> ready to post patches from me and Lorenzo.
> https://github.com/sgruszka/wireless-drivers-next/commits/mt76x0-draft-v3
>
> Note this set include:
> "mt76x0: fix wrong usage of wcid_mask in remove_interface"
> patch with I posted as fix for 4.19 . I assume this will be
> auto (or manually?) merged when -next will go to 4.20.

The problem is that having two identical patches with different commit
ids will confuse git and can create annoying merge conflicts. A much
safer approach is that the patch is first applied to wireless-drivers
and then I merge wireless-drivers into wireless-drivers-next. I'm
planning to do that in a day or two, I was away for a long weekend so
lagging behind again.

But the patch "mt76x0: fix wrong usage of wcid_mask in remove_interface"
should be dropped from this series. But Felix is planning to send all
pending mt76 to me via a pull request anyway so you don't need to worry
about this.

-- 
Kalle Valo
