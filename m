From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] watchdog: add wdt shutdown callback to disable
 wdt if enabled
Date: Thu, 23 Jul 2015 09:12:44 -0700
Message-ID: <55B1127C.4080800@roeck-us.net>
References: <1437630551-39650-1-git-send-email-eddie.huang@mediatek.com> <1437630551-39650-3-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437630551-39650-3-git-send-email-eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On 07/22/2015 10:49 PM, Eddie Huang wrote:
> From: Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Without .shutdown(), watchdog might reset the system during power off.
> For example, if watchdog's timeout is set to 30s, then it is reset to
> zero by mtk_wdt_ping(). During power off, no app will ping watchdog,
> but watchdog is still running and may trigger reset.
>
> Signed-off-by: Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Except for the subject line,

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>   drivers/watchdog/mtk_wdt.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 056412c..6ad9df9 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -210,6 +210,14 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   	return 0;
>   }
>
> +static void mtk_wdt_shutdown(struct platform_device *pdev)
> +{
> +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> +
> +	if (watchdog_active(&mtk_wdt->wdt_dev))
> +		mtk_wdt_stop(&mtk_wdt->wdt_dev);
> +}
> +
>   static int mtk_wdt_remove(struct platform_device *pdev)
>   {
>   	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> @@ -259,6 +267,7 @@ static const struct dev_pm_ops mtk_wdt_pm_ops = {
>   static struct platform_driver mtk_wdt_driver = {
>   	.probe		= mtk_wdt_probe,
>   	.remove		= mtk_wdt_remove,
> +	.shutdown	= mtk_wdt_shutdown,
>   	.driver		= {
>   		.name		= DRV_NAME,
>   		.pm		= &mtk_wdt_pm_ops,
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
