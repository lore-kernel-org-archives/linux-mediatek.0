From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [RFC PATCH 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver as
 Dual MIT/GPL
Date: Wed, 24 Apr 2019 18:15:30 +0200
Message-ID: <7be16a76-0099-2776-9ee1-9c87ce492839@linaro.org>
References: <20190424064522.33501-1-xiaolei.li@mediatek.com>
 <20190424064522.33501-2-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190424064522.33501-2-xiaolei.li@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Xiaolei Li <xiaolei.li@mediatek.com>, miquel.raynal@bootlin.com, richard@nod.at
Cc: daniel.thompson@linaro.org, srv_heupstream@mediatek.com, boris.brezillon@bootlin.com, linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, linux-mtd@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 4/24/19 08:45, Xiaolei Li wrote:
> It is allowed to use MTK NAND driver with GPL-2.0 or MIT license.
> But now it is only licensed as GPL-2.0.
> So re-license it as dual MIT/GPL.

Relicensing is OK with respect to any Linaro copyright interest deriving
from upstreaming this work.

Acked-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  drivers/mtd/nand/raw/mtk_ecc.c  | 12 ++----------
>  drivers/mtd/nand/raw/mtk_ecc.h  |  4 +---
>  drivers/mtd/nand/raw/mtk_nand.c | 12 ++----------
>  3 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
> index 6432bd70c3b3..eea0f903bc24 100644
> --- a/drivers/mtd/nand/raw/mtk_ecc.c
> +++ b/drivers/mtd/nand/raw/mtk_ecc.c
> @@ -1,17 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * MTK ECC controller driver.
>   * Copyright (C) 2016  MediaTek Inc.
>   * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
>   *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>   */
>  
>  #include <linux/platform_device.h>
> @@ -600,4 +592,4 @@ module_platform_driver(mtk_ecc_driver);
>  
>  MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
>  MODULE_DESCRIPTION("MTK Nand ECC Driver");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/drivers/mtd/nand/raw/mtk_ecc.h b/drivers/mtd/nand/raw/mtk_ecc.h
> index a455df080952..0e48c36e6ca0 100644
> --- a/drivers/mtd/nand/raw/mtk_ecc.h
> +++ b/drivers/mtd/nand/raw/mtk_ecc.h
> @@ -1,12 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * MTK SDG1 ECC controller
>   *
>   * Copyright (c) 2016 Mediatek
>   * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
>   *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published
> - * by the Free Software Foundation.
>   */
>  
>  #ifndef __DRIVERS_MTD_NAND_MTK_ECC_H__
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index b6b4602f5132..3cbc25793062 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1,17 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * MTK NAND Flash controller driver.
>   * Copyright (C) 2016 MediaTek Inc.
>   * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
>   *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>   */
>  
>  #include <linux/platform_device.h>
> @@ -1598,6 +1590,6 @@ static struct platform_driver mtk_nfc_driver = {
>  
>  module_platform_driver(mtk_nfc_driver);
>  
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("Dual MIT/GPL");
>  MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
>  MODULE_DESCRIPTION("MTK Nand Flash Controller Driver");
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
