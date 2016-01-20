From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/4] mfd: mediatek: add MT6323 support to MT6397 driver
Date: Wed, 20 Jan 2016 17:48:47 +0800
Message-ID: <1453283327.16515.19.camel@mtksdaap41>
References: <1452442729-27154-1-git-send-email-blogic@openwrt.org>
 <1452442729-27154-5-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1452442729-27154-5-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org


Hi John,

You should sent this series to MFD maintainers.


On Sun, 2016-01-10 at 17:18 +0100, John Crispin wrote:
> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
>  drivers/mfd/mt6397-core.c            |   20 ++
>  include/linux/mfd/mt6323/core.h      |   42 ++++
>  include/linux/mfd/mt6323/registers.h |  414 ++++++++++++++++++++++++++++++++++
>  3 files changed, 476 insertions(+)
>  create mode 100644 include/linux/mfd/mt6323/core.h
>  create mode 100644 include/linux/mfd/mt6323/registers.h

<...>

> diff --git a/include/linux/mfd/mt6323/core.h b/include/linux/mfd/mt6323/core.h
> new file mode 100644
> index 0000000..87e1eb6
> --- /dev/null
> +++ b/include/linux/mfd/mt6323/core.h
> @@ -0,0 +1,42 @@
> +/*
> + * Copyright (c) 2014 MediaTek Inc.
> + * Author: Flora Fu, MediaTek
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __MFD_MT6323_CORE_H__
> +#define __MFD_MT6323_CORE_H__
> +
> +enum RG_INT_STATUS_numbers {
> +	RG_INT_STATUS_SPKL_AB = 0,
> +	RG_INT_STATUS_SPKL,
> +	RG_INT_STATUS_BAT_L,
> +	RG_INT_STATUS_BAT_H,
> +	RG_INT_STATUS_WATCHDOG,
> +	RG_INT_STATUS_PWRKEY,
> +	RG_INT_STATUS_THR_L,
> +	RG_INT_STATUS_THR_H,
> +	RG_INT_STATUS_VBATON_UNDET,
> +	RG_INT_STATUS_BVALID_DET,
> +	RG_INT_STATUS_CHRDET,
> +	RG_INT_STATUS_OV,
> +	RG_INT_STATUS_LDO = 16,
> +	RG_INT_STATUS_FCHRKEY,
> +	RG_INT_STATUS_ACCDET,
> +	RG_INT_STATUS_AUDIO,
> +	RG_INT_STATUS_RTC,
> +	RG_INT_STATUS_VPROC,
> +	RG_INT_STATUS_VSYS,
> +	RG_INT_STATUS_VPA,
> +	MT6323_IRQ_NR,
> +};


The irq names are too generic and will cause trouble if we need to add
more chips support.
Please change interrupt names to MT6323_IRQ_*, just like those in
include/linux/mfd/mt6397/core.h

Joe.C
