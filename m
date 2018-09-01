From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/17] mt76 patches 2018-08-24 v2
Date: Sat, 1 Sep 2018 09:47:58 +0200
Message-ID: <20180901074757.GB3719@redhat.com>
References: <1535381791-14908-1-git-send-email-sgruszka@redhat.com>
 <CAM0KTbB5k54BvA2UOmoss-PuGtgHE_SGy2cG4n4ROxPH7kxYXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAM0KTbB5k54BvA2UOmoss-PuGtgHE_SGy2cG4n4ROxPH7kxYXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Aug 29, 2018 at 02:26:44AM +0000, Sid Hayn wrote:
> dhcpcd_prestartinterface: t2uh: No space left on device
> t2uh: waiting for carrier
> 
> the same happens with just ifconfig up:
> 
> SIOCSIFFLAGS: No space left on device

I think I found bug that could result in this. Please test
below patch:

https://github.com/sgruszka/wireless-drivers-next/commit/be446879afd6b0e315691e379a2aa4412f05884e.patch

Thanks
Stanislaw
