From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] soc: mediatek: SCPSYS: use module_platform_driver
Date: Fri, 18 Dec 2015 09:33:36 +0100
Message-ID: <5673C4E0.70607@gmail.com>
References: <1450263656-12513-1-git-send-email-s.hauer@pengutronix.de>
 <1562792.sV6cmsyeOM@wuerfel> <56715136.3060908@gmail.com>
 <CAGS+omA1mgmFH_JXffUTC-aq3rOy7dRYsdveiJ8LcnB5gg0ELw@mail.gmail.com>
 <20151217151617.GY2772@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20151217151617.GY2772-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?B?RGF3ZWkgQ2hpZW4gKOmMouWkp+ihmyk=?= <Dawei.Chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sasha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Paul,

On 17/12/15 16:16, Paul Gortmaker wrote:
> [Re: [PATCH v2] soc: mediatek: SCPSYS: use module_platform_driver] On 17/12/2015 (Thu 10:52) Daniel Kurtz wrote:
>
> [...]
>
>>
>> Also, since scpsys' Kconfig is "bool" not "tristate" it isn't a real
>> module so I think we should use:
>> builtin_platform_driver not module_platform_driver
>>
>> CC'ing Paul Gortmaker who seems to be on a mass
>> builtin_platform_driver conversion at the moment, see:
>> https://lkml.org/lkml/2015/12/9/952
>>
>
> Good guess.  In my giant queue I have that change.  I just haven't got
> around to the requisite triple check and multi arch rebuild tests and
> put out a series for soc yet.  Here is the short list for soc:
>
> drivers-soc-make-mediatek-mtk-scpsys.c-explicitly-no.patch
> drivers-soc-make-qcom-spm.c-explicitly-non-modular.patch
> drivers-soc-make-samsung-exynos-srom.c.c-explicitly-.patch
> drivers-soc-make-sunxi_sram.c-explicitly-non-modular.patch
> drivers-soc-tegra-make-fuse-tegra.c-explicitly-non-m.patch
>
> ...and here is the patch you predicted.  If someone wants to fold
> the change into their work then great; I'll be happy to drop
> mine and be with one less patch to herd along.
>

I take this through my tree.

Thanks a lot.
Matthias

> Paul.
> --
>
>   From eb32cc2c1db8192c08dd64af69cb172b3be4c98b Mon Sep 17 00:00:00 2001
> From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> Date: Fri, 4 Sep 2015 19:33:54 -0400
> Subject: [PATCH] drivers/soc: make mediatek/mtk-scpsys.c explicitly
>   non-modular
>
> The Kconfig currently controlling compilation of this code is:
>
> drivers/soc/mediatek/Kconfig:config MTK_SCPSYS
> drivers/soc/mediatek/Kconfig:   bool "MediaTek SCPSYS Support"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modularity so that when reading the
> driver there is no doubt it is builtin-only.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 164a7d8439b1..ae0ca34e64dd 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -15,7 +15,7 @@
>   #include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/mfd/syscon.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>   #include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
> @@ -484,5 +484,4 @@ static struct platform_driver scpsys_drv = {
>   		.of_match_table = of_match_ptr(of_scpsys_match_tbl),
>   	},
>   };
> -
> -module_platform_driver_probe(scpsys_drv, scpsys_probe);
> +builtin_platform_driver_probe(scpsys_drv, scpsys_probe);
>
