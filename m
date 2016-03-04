From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] usb: xhci-mtk: use __maybe_unused to hide pm
 functions
Date: Fri, 4 Mar 2016 17:33:50 +0100
Message-ID: <56D9B8EE.3060107@gmail.com>
References: <1456932255-71725-1-git-send-email-arnd@arndb.de>
 <1456932255-71725-3-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456932255-71725-3-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 02/03/16 16:24, Arnd Bergmann wrote:
> The mediatek XHCI glue driver uses SET_SYSTEM_SLEEP_PM_OPS() to
> conditionally set the correct suspend/resume options, and
> also puts both the dev_pm_ops and the functions inside of
> an #ifdef testing for CONFIG_PM_SLEEP, but those functions
> then call other code that becomes unused:
>
> drivers/usb/host/xhci-mtk.c:135:12: error: 'xhci_mtk_host_disable' defined but not used [-Werror=unused-function]
> drivers/usb/host/xhci-mtk.c:313:13: error: 'usb_wakeup_enable' defined but not used [-Werror=unused-function]
> drivers/usb/host/xhci-mtk.c:321:13: error: 'usb_wakeup_disable' defined but not used [-Werror=unused-function]
>
> This replaces the #ifdef with __maybe_unused annotations so the
> compiler knows it can silently drop them instead of warning.
>
> For the DEV_PM_OPS definition, we can use an IS_ENABLED() check
> to avoid defining the structure when CONFIG_PM is not set without
> the #ifdef.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---

Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

>   drivers/usb/host/xhci-mtk.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 9532f5aef71b..79959f17c38c 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -695,7 +695,6 @@ static int xhci_mtk_remove(struct platform_device *dev)
>   	return 0;
>   }
>
> -#ifdef CONFIG_PM_SLEEP
>   /*
>    * if ip sleep fails, and all clocks are disabled, access register will hang
>    * AHB bus, so stop polling roothubs to avoid regs access on bus suspend.
> @@ -703,7 +702,7 @@ static int xhci_mtk_remove(struct platform_device *dev)
>    * to wake up system immediately after system suspend complete if ip sleep
>    * fails, it is what we wanted.
>    */
> -static int xhci_mtk_suspend(struct device *dev)
> +static int __maybe_unused xhci_mtk_suspend(struct device *dev)
>   {
>   	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
>   	struct usb_hcd *hcd = mtk->hcd;
> @@ -722,7 +721,7 @@ static int xhci_mtk_suspend(struct device *dev)
>   	return 0;
>   }
>
> -static int xhci_mtk_resume(struct device *dev)
> +static int __maybe_unused xhci_mtk_resume(struct device *dev)
>   {
>   	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
>   	struct usb_hcd *hcd = mtk->hcd;
> @@ -744,10 +743,7 @@ static int xhci_mtk_resume(struct device *dev)
>   static const struct dev_pm_ops xhci_mtk_pm_ops = {
>   	SET_SYSTEM_SLEEP_PM_OPS(xhci_mtk_suspend, xhci_mtk_resume)
>   };
> -#define DEV_PM_OPS	(&xhci_mtk_pm_ops)
> -#else
> -#define DEV_PM_OPS	NULL
> -#endif /* CONFIG_PM */
> +#define DEV_PM_OPS IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL
>
>   #ifdef CONFIG_OF
>   static const struct of_device_id mtk_xhci_of_match[] = {
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
