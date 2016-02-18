From: Huang Shijie <shijie.huang-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: add maintainer entry for FREESCALE GPMI
 NAND driver
Date: Thu, 18 Feb 2016 12:36:13 +0800
Message-ID: <20160218043612.GA735@sha-win-210.asiapac.arm.com>
References: <1455767715-621-1-git-send-email-han.xu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1455767715-621-1-git-send-email-han.xu-3arQi8VN3Tc@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Feb 18, 2016 at 03:55:15AM +0000, Han Xu wrote:
> Add a maintainer entry for FREESCALE GPMI NAND driver and add myself as a
> maintainer.
>
> Signed-off-by: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7bd927e..49baa5b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4543,6 +4543,12 @@ L:     linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>  S:   Maintained
>  F:   drivers/dma/fsldma.*
>
> +FREESCALE GPMI NAND DRIVER
> +M:   Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
> +L:   linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> +S:   Maintained
> +F:   drivers/mtd/nand/gpmi-nand/*
> +
>  FREESCALE I2C CPM DRIVER
>  M:   Jochen Friedrich <jochen-NIgtFMG+Po8@public.gmane.org>
>  L:   linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> --
> 2.7.1
>
Acked-by: Huang Shijie <shijie.huang-5wv7dgnIgG8@public.gmane.org>
IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
