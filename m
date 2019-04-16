From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [v2 PATCH 1/6] usb: xhci-mtk: get optional clock by
 devm_clk_get_optional()
Date: Tue, 16 Apr 2019 12:15:06 +0200
Message-ID: <20190416101506.GB26091@kroah.com>
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
> -		opt_clk = NULL;
> -
> -	return opt_clk;
> -}
> -
>  static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
>  {
>  	struct device *dev = mtk->dev;
> @@ -229,15 +216,15 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
>  		return PTR_ERR(mtk->sys_clk);
>  	}
>  
> -	mtk->ref_clk = optional_clk_get(dev, "ref_ck");
> +	mtk->ref_clk = devm_clk_get_optional(dev, "ref_ck");
>  	if (IS_ERR(mtk->ref_clk))
>  		return PTR_ERR(mtk->ref_clk);
>  
> -	mtk->mcu_clk = optional_clk_get(dev, "mcu_ck");
> +	mtk->mcu_clk = devm_clk_get_optional(dev, "mcu_ck");
>  	if (IS_ERR(mtk->mcu_clk))
>  		return PTR_ERR(mtk->mcu_clk);
>  
> -	mtk->dma_clk = optional_clk_get(dev, "dma_ck");
> +	mtk->dma_clk = devm_clk_get_optional(dev, "dma_ck");

Also, now that this clock (and the others here) are controlled by the
devm infrastructure, do you have to change when you were cleaning up and
stopping the clock?  That logic seems to be the same here, which does
not seem to be correct to me.

Please also document that in your changelog comments when resending this
series, as all of these patches have this issue as well.

thanks,

greg k-h
