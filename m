From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: Allow test-building of MediaTek drivers
Date: Fri, 20 Oct 2017 12:15:03 +0200
Message-ID: <cd366563-2904-fdba-3cd4-f0ca6d7bc605@gmail.com>
References: <20171005111743.6367f128@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20171005111743.6367f128@endymion>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 10/05/2017 11:17 AM, Jean Delvare wrote:
> The COMPILE_TEST alternative dependency allows test-building the
> drivers but only as long as the build system itself will look into
> the directory where the drivers reside.
> 
> Signed-off-by: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
> Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/soc/Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Pushed to v4.14-next/soc

Thanks!

> 
> --- linux-4.14-rc3.orig/drivers/soc/Makefile	2017-09-17 00:47:51.000000000 +0200
> +++ linux-4.14-rc3/drivers/soc/Makefile	2017-10-05 09:44:01.478589469 +0200
> @@ -10,7 +10,7 @@ obj-$(CONFIG_MACH_DOVE)		+= dove/
>  obj-y				+= fsl/
>  obj-$(CONFIG_ARCH_MXC)		+= imx/
>  obj-$(CONFIG_SOC_XWAY)		+= lantiq/
> -obj-$(CONFIG_ARCH_MEDIATEK)	+= mediatek/
> +obj-y				+= mediatek/
>  obj-$(CONFIG_ARCH_MESON)	+= amlogic/
>  obj-$(CONFIG_ARCH_QCOM)		+= qcom/
>  obj-y				+= renesas/
> 
> 
