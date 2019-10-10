From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
Date: Thu, 10 Oct 2019 16:45:18 +0800
Message-ID: <1570697118.32135.20.camel@mhfsdcap03>
References: <20191010075004.192818-1-tfiga@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191010075004.192818-1-tfiga@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Changqi Hu <Changqi.Hu@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Shik Chen <shik@chromium.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi, Tomasz,

On Thu, 2019-10-10 at 16:50 +0900, Tomasz Figa wrote:
> MediaTek XHCI host controller does not support 64-bit addressing despite
> the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> glue sets the DMA mask to 32 bits on its own, but it has no effect,
> because xhci_gen_setup() overrides it according to hardware
> capabilities.
> 
> Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> 32-bit DMA mask instead.
> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  drivers/usb/host/xhci-mtk.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index b18a6baef204a..4d101d52cc11b 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
>  	if (mtk->lpm_support)
>  		xhci->quirks |= XHCI_LPM_SUPPORT;
> +	/*
> +	 * MTK host controller does not support 64-bit addressing, despite
> +	 * having the AC64 bit of the HCCPARAMS1 register set.
> +	 */
> +	xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
Somes SoCs support 64bits in fact, so can't support this quirk, do you
encounter any issues without this quirk?

>  }

>  
>  /* called during probe() after chip reset completes */
> @@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>  		goto disable_clk;
>  	}
>  
> -	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
> -	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> -	if (ret)
> -		goto disable_clk;
> -
>  	hcd = usb_create_hcd(driver, dev, dev_name(dev));
>  	if (!hcd) {
>  		ret = -ENOMEM;
