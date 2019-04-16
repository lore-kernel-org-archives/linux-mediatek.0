From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [v2 PATCH 1/6] usb: xhci-mtk: get optional clock by
 devm_clk_get_optional()
Date: Tue, 16 Apr 2019 12:12:58 +0200
Message-ID: <20190416101258.GA26091@kroah.com>
References: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Apr 10, 2019 at 02:47:24PM +0800, Chunfeng Yun wrote:
> Use devm_clk_get_optional() to get optional clock
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  drivers/usb/host/xhci-mtk.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 60987c787e44..026fe18972d3 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -206,19 +206,6 @@ static int xhci_mtk_ssusb_config(struct xhci_hcd_mtk *mtk)
>  	return xhci_mtk_host_enable(mtk);
>  }
>  
> -/* ignore the error if the clock does not exist */
> -static struct clk *optional_clk_get(struct device *dev, const char *id)
> -{
> -	struct clk *opt_clk;
> -
> -	opt_clk = devm_clk_get(dev, id);
> -	/* ignore error number except EPROBE_DEFER */
> -	if (IS_ERR(opt_clk) && (PTR_ERR(opt_clk) != -EPROBE_DEFER))

Are you sure about this?

devm_clk_get_optional() does not check for -EPROBE_DEFER, so you just
changed the functionality of this code.  Is that ok?  If so, please call
it out explicitly in your changelog comment when you resend this.

thanks,

greg k-h
