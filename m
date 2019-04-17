From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [v2 PATCH 1/6] usb: xhci-mtk: get optional clock by
 devm_clk_get_optional()
Date: Wed, 17 Apr 2019 13:53:28 +0800
Message-ID: <1555480408.10179.202.camel@mhfsdcap03>
References: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
         <20190416101258.GA26091@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416101258.GA26091@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-04-16 at 12:12 +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 10, 2019 at 02:47:24PM +0800, Chunfeng Yun wrote:
> > Use devm_clk_get_optional() to get optional clock
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: no changes
> > ---
> >  drivers/usb/host/xhci-mtk.c | 19 +++----------------
> >  1 file changed, 3 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index 60987c787e44..026fe18972d3 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -206,19 +206,6 @@ static int xhci_mtk_ssusb_config(struct xhci_hcd_mtk *mtk)
> >  	return xhci_mtk_host_enable(mtk);
> >  }
> >  
> > -/* ignore the error if the clock does not exist */
> > -static struct clk *optional_clk_get(struct device *dev, const char *id)
> > -{
> > -	struct clk *opt_clk;
> > -
> > -	opt_clk = devm_clk_get(dev, id);
> > -	/* ignore error number except EPROBE_DEFER */
> > -	if (IS_ERR(opt_clk) && (PTR_ERR(opt_clk) != -EPROBE_DEFER))
> 
> Are you sure about this?
> 
> devm_clk_get_optional() does not check for -EPROBE_DEFER, so you just
> changed the functionality of this code.  Is that ok?  
Yes, checking for -ENOENT covers more error cases than -EPROBE_DEFER,
and the original purpose also wants to ignore non-exist clock

> If so, please call
> it out explicitly in your changelog comment when you resend this.
I'll add it in next version

Thanks a lot

> 
> thanks,
> 
> greg k-h
