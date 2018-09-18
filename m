From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] mt76x0: run vco calibration for each channel
 configuration
Date: Tue, 18 Sep 2018 14:02:35 +0200
Message-ID: <20180918120234.GD15285@redhat.com>
References: <20180907211312.17918-1-lorenzo.bianconi@redhat.com>
 <20180918114356.GB15285@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180918114356.GB15285-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: nbd-Vt+b4OUoWG0@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Sep 18, 2018 at 01:43:56PM +0200, Stanislaw Gruszka wrote:
> On Fri, Sep 07, 2018 at 11:13:12PM +0200, Lorenzo Bianconi wrote:
> > According to vendor sdk, vco calibration has to be executed
> > for each channel configuration whereas mcu calibration has to be
> > performed during channel scanning. This patch fixes the mt76x0
> > monitor mode issue since in that configuration vco calibration
> > was never executed
> > 
> > Fixes: 10de7a8b4ab9 ("mt76x0: phy files")
> > Tested-by: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> Acked-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

For the record this is 4.19 material.
