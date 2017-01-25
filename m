From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] clk: mediatek: Fix MT8135 dependencies
Date: Wed, 25 Jan 2017 11:00:40 +0800
Message-ID: <1485313240.1348.0.camel@mtksdaap41>
References: <20170124130912.14375a32@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170124130912.14375a32@endymion>
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
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2017-01-24 at 13:09 +0100, Jean Delvare wrote:
> The MT8135 is a 32-bit SoC, so only propose it on ARM architecture,
> not ARM64.
> =

> Signed-off-by: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
> Fixes: 234d511d8c15 ("clk: mediatek: Add hardware dependency")
> Cc: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

> ---
>  drivers/clk/mediatek/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> --- linux-4.10-rc4.orig/drivers/clk/mediatek/Kconfig	2017-01-24 12:55:50.=
192100713 +0100
> +++ linux-4.10-rc4/drivers/clk/mediatek/Kconfig	2017-01-24 12:59:08.70306=
6604 +0100
> @@ -52,9 +52,9 @@ config COMMON_CLK_MT2701_BDPSYS
>  =

>  config COMMON_CLK_MT8135
>  	bool "Clock driver for Mediatek MT8135"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
> -	default ARCH_MEDIATEK
> +	default ARCH_MEDIATEK && ARM
>  	---help---
>  	  This driver supports Mediatek MT8135 clocks.
>  =

> =
