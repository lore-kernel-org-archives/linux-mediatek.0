From: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/17] mt76 patches 2018-08-24 v2
Date: Mon, 3 Sep 2018 02:45:16 +0000
Message-ID: <CAM0KTbD9E1jq23d17DiPxzRD21tPVCs96BOBr=UUyZ64r+ddfQ@mail.gmail.com>
References: <1535381791-14908-1-git-send-email-sgruszka@redhat.com>
 <CAM0KTbB5k54BvA2UOmoss-PuGtgHE_SGy2cG4n4ROxPH7kxYXA@mail.gmail.com> <20180901074757.GB3719@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180901074757.GB3719-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

YES.  That fixed the issue for me.  Confirmed across 4 affected
devices and 1 unaffected device (mt76x2u driver).  After this patch
the issue is resolved.  Thanks for working with me.

I haven't completed all my testing, but the only other thing I've
noticed so far is that firmware version isn't available in ethtool,
while the majority of devices it is.  If you can please squeeze that
in before 4.19 drops it would be great to help with tracking and
debugging when needed.

Thanks,
Zero
On Sat, Sep 1, 2018 at 7:48 AM Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Wed, Aug 29, 2018 at 02:26:44AM +0000, Sid Hayn wrote:
> > dhcpcd_prestartinterface: t2uh: No space left on device
> > t2uh: waiting for carrier
> >
> > the same happens with just ifconfig up:
> >
> > SIOCSIFFLAGS: No space left on device
>
> I think I found bug that could result in this. Please test
> below patch:
>
> https://github.com/sgruszka/wireless-drivers-next/commit/be446879afd6b0e315691e379a2aa4412f05884e.patch
>
> Thanks
> Stanislaw
