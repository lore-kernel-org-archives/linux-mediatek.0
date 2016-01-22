From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] soc: mediatek: SCPSYS: Fix double enabling of regulators
Date: Fri, 22 Jan 2016 11:26:13 -0800
Message-ID: <CAGS+omD=ZdLoT8fZ_vq4CvdCvAwsz2tbdEzS5Q8pAL5zAKW5yA@mail.gmail.com>
References: <1453466365-24406-1-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1453466365-24406-1-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jan 22, 2016 at 4:39 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>
> With CONFIG_PM enabled do not call genpd->power_on manually as this
> will cause the regulators being turned on once in SCPSYS probe and
> then again when the genpd core turns on the domains. Instead, call
> genpd->power_on only with CONFIG_PM disabled and tell the genpd core
> that the domains are disabled when registered.
>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Take your pick:
Tested-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 0221387..78227db 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -500,14 +500,13 @@ static int __init scpsys_probe(struct platform_device *pdev)
>                 genpd->dev_ops.active_wakeup = scpsys_active_wakeup;
>
>                 /*
> -                * Initially turn on all domains to make the domains usable
> -                * with !CONFIG_PM and to get the hardware in sync with the
> -                * software.  The unused domains will be switched off during
> -                * late_init time.
> +                * With CONFIG_PM disabled turn on all domains to make the
> +                * hardware usable.
>                  */
> -               genpd->power_on(genpd);
> +               if (!IS_ENABLED(CONFIG_PM))
> +                       genpd->power_on(genpd);
>
> -               pm_genpd_init(genpd, NULL, false);
> +               pm_genpd_init(genpd, NULL, true);
>         }
>
>         /*
> --
> 2.7.0.rc3
>
