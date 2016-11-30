From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] usb: return error code when platform_get_irq fails
Date: Wed, 30 Nov 2016 14:41:23 +0100
Message-ID: <52a774c0-9bca-6d1b-a470-f07caefa5d3a@gmail.com>
References: <1480424255-25059-1-git-send-email-bianpan2016@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480424255-25059-1-git-send-email-bianpan2016-9Onoh4P/yGk@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pan Bian <bianpan2016-9Onoh4P/yGk@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 29/11/16 13:57, Pan Bian wrote:
> In function xhci_mtk_probe(), variable ret takes the return value. Its
> value should be negative on failures. However, when the call to function
> platform_get_irq() fails, it does not set the error code, and 0 will be
> returned. 0 indicates no error. As a result, the callers of function
> xhci_mtk_probe() will not be able to detect the error. This patch fixes
> the bug by assigning the return value of platform_get_irq() to variable
> ret if it fails.
>
> Signed-off-by: Pan Bian <bianpan2016-9Onoh4P/yGk@public.gmane.org>
> ---
>  drivers/usb/host/xhci-mtk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 79959f1..f2365a4 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -560,8 +560,10 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>  		goto disable_ldos;
>
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> +	if (irq < 0) {
> +		ret = irq;
>  		goto disable_clk;
> +	}
>
>  	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
>  	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
>


Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Next time please make sure to send the patch to all relevant lists and 
people (get_maintainer.pl).

Regards,
Matthias

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
