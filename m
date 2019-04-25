From: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: [RFC PATCH v2 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver as
 Dual MIT/GPL
Date: Thu, 25 Apr 2019 09:55:52 +0800
Message-ID: <20190425015552.42638-2-xiaolei.li@mediatek.com>
References: <20190425015552.42638-1-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190425015552.42638-1-xiaolei.li@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: miquel.raynal@bootlin.com, richard@nod.at
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com, srv_heupstream@mediatek.com, yellowriver2010@hotmail.com, jorge.ramirez-ortiz@linaro.org, boris.brezillon@bootlin.com, linux-mtd@lists.infradead.org, yingjoe.chen@mediatek.com, rafal@milecki.pl, linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

It is allowed to use MTK NAND driver with GPL-2.0 or MIT license.
But now it is only licensed as GPL-2.0.
So re-license it as dual MIT/GPL.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
Acked-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/mtd/nand/raw/mtk_ecc.c  | 12 ++----------
 drivers/mtd/nand/raw/mtk_ecc.h  |  4 +---
 drivers/mtd/nand/raw/mtk_nand.c | 12 ++----------
 3 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index 6432bd70c3b3..eea0f903bc24 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * MTK ECC controller driver.
  * Copyright (C) 2016  MediaTek Inc.
  * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
  *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/platform_device.h>
@@ -600,4 +592,4 @@ module_platform_driver(mtk_ecc_driver);
 
 MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
 MODULE_DESCRIPTION("MTK Nand ECC Driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/mtd/nand/raw/mtk_ecc.h b/drivers/mtd/nand/raw/mtk_ecc.h
index a455df080952..0e48c36e6ca0 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.h
+++ b/drivers/mtd/nand/raw/mtk_ecc.h
@@ -1,12 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * MTK SDG1 ECC controller
  *
  * Copyright (c) 2016 Mediatek
  * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
  *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
  */
 
 #ifndef __DRIVERS_MTD_NAND_MTK_ECC_H__
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index b6b4602f5132..3cbc25793062 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * MTK NAND Flash controller driver.
  * Copyright (C) 2016 MediaTek Inc.
  * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
  *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/platform_device.h>
@@ -1598,6 +1590,6 @@ static struct platform_driver mtk_nfc_driver = {
 
 module_platform_driver(mtk_nfc_driver);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("Dual MIT/GPL");
 MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
 MODULE_DESCRIPTION("MTK Nand Flash Controller Driver");
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
