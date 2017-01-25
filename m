From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] clk: mediatek: Fix MT2701 dependencies
Date: Wed, 25 Jan 2017 11:01:21 +0800
Message-ID: <1485313281.1348.1.camel@mtksdaap41>
References: <20170124130704.14015da3@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170124130704.14015da3@endymion>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
Cc: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2017-01-24 at 13:07 +0100, Jean Delvare wrote:
> If I say "no" to "Clock driver for Mediatek MT2701", I don't want to
> be asked individually about each sub-driver. No means no.
> =

> Additionally, this driver shouldn't be proposed at all on non-mediatek
> builds, unless build-testing.
> =

> Signed-off-by: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Reviewed-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> Reviewed-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

> ---
> Changes since v1:
>  * Restrict to 32-bit ARM.
> =

>  drivers/clk/mediatek/Kconfig |   15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> =

> --- linux-4.10-rc4.orig/drivers/clk/mediatek/Kconfig	2017-01-16 11:13:07.=
146675028 +0100
> +++ linux-4.10-rc4/drivers/clk/mediatek/Kconfig	2017-01-24 12:55:50.19210=
0713 +0100
> @@ -8,44 +8,45 @@ config COMMON_CLK_MEDIATEK
>  =

>  config COMMON_CLK_MT2701
>  	bool "Clock driver for Mediatek MT2701"
> +	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
> -	default ARCH_MEDIATEK
> +	default ARCH_MEDIATEK && ARM
>  	---help---
>  	  This driver supports Mediatek MT2701 basic clocks.
>  =

>  config COMMON_CLK_MT2701_MMSYS
>  	bool "Clock driver for Mediatek MT2701 mmsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 mmsys clocks.
>  =

>  config COMMON_CLK_MT2701_IMGSYS
>  	bool "Clock driver for Mediatek MT2701 imgsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 imgsys clocks.
>  =

>  config COMMON_CLK_MT2701_VDECSYS
>  	bool "Clock driver for Mediatek MT2701 vdecsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 vdecsys clocks.
>  =

>  config COMMON_CLK_MT2701_HIFSYS
>  	bool "Clock driver for Mediatek MT2701 hifsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 hifsys clocks.
>  =

>  config COMMON_CLK_MT2701_ETHSYS
>  	bool "Clock driver for Mediatek MT2701 ethsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 ethsys clocks.
>  =

>  config COMMON_CLK_MT2701_BDPSYS
>  	bool "Clock driver for Mediatek MT2701 bdpsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 bdpsys clocks.
>  =

> =

> =
