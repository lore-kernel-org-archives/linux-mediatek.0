From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] soc: mediatek: Move the initial setting of pmic wrap
 interrupt before requesting irq.
Date: Mon, 7 Sep 2015 07:39:20 +0200
Message-ID: <20150907053920.GW18700@pengutronix.de>
References: <1441339512-15510-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441339512-15510-1-git-send-email-henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Sep 04, 2015 at 12:05:12PM +0800, Henry Chen wrote:
> Seperate the initialization of pmic wrap interrupt from pmic wrap init to make sure setting is correct before requesting irq.

It seems the problem this patch solves is the missing watchdog
initialization when the pwrap is already initialized but the watchdog is
not, so how about a commit log like:

"The watchdog may not be initialized by the bootloader, even if the rest
of the pwrap is. Move the watchdog initialization out of pwrap_init()
to make sure the watchdog is always initialized and not only when the
pwrap is uninitialized."

Also please add linebreaks to the commit log.

> 
> Signed-off-by: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index f432291..c91d629 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -725,10 +725,6 @@ static int pwrap_init(struct pmic_wrapper *wrp)
>  	pwrap_writel(wrp, 0x1, PWRAP_WACS2_EN);
>  	pwrap_writel(wrp, 0x5, PWRAP_STAUPD_PRD);
>  	pwrap_writel(wrp, 0xff, PWRAP_STAUPD_GRPEN);
> -	pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
> -	pwrap_writel(wrp, 0xffffffff, PWRAP_WDT_SRC_EN);
> -	pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
> -	pwrap_writel(wrp, ~((1 << 31) | (1 << 1)), PWRAP_INT_EN);
>  
>  	if (pwrap_is_mt8135(wrp)) {
>  		/* enable pwrap events and pwrap bridge in AP side */
> @@ -896,6 +892,16 @@ static int pwrap_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	/*
> +	 * watch dog@pwrap,
> +	 * The bootloader may not initial the wdt/interrupt setting of pwrap,
> +	 * set it before reguesting the irq.
> +	 */

/* initialize watchdog, may not be done by the bootloader */

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
