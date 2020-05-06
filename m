Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE7FC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 08:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C772073A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 08:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YOg/kJK5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NoIqBOny"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C772073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gzy8enGtlEeH3L5n4hb92q/HM9itzqZtets4kwkIXJE=; b=YOg/kJK5y2l4c8
	QeyQtDLzSES0OtDU8Iar+UefXZqnx7y2vIj4CX0JpI09z1D+NO6X19zi7ck6dP/Lpik+CCHFQkHUl
	y59Pg8PharlFjDeUTi9DXifn5OfOfOiYWj//03guibOoYzCTrhjXG5PPUBxhgJWk2wR1ypSgbco/T
	9sKsv9y7k2SXS/X7fHiwmTj6EWnH7r7Ss5vVa8fSdMY9c0ELtdF7SmTz5axG0c67wM+w1rp7X4kpx
	UEbniQ9BOCxZRAuuNT5G+Z84UVpXhjzrQb3Dof4z/Uni4rLeLvjxvhRD4uSeDY2QX/dDKO6V8+GM8
	O7+fjiH8qNgK9JODC3cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWFG3-0006yK-Ot; Wed, 06 May 2020 08:18:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWFE2-0004mG-9J; Wed, 06 May 2020 08:16:20 +0000
X-UUID: 384dffc59c8a4e3f874ae85de95fd68e-20200506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FmkMIKoIhPK4YgdoARO9C/NC7QgeavTIGczaPPv57H8=; 
 b=NoIqBOnyy4GoF86ELsWRXzpgZhl/bN11TDqhLSzAMvTPU0vM9vJ28nfnSUWMUcfQ1gf2sIkEcLfH8q+TwAzrhSgpXVhWYfxI7NnT5TEcMPZ79DzGmvAFKOHpfTEcgE1uAkEY1cTK9qq+dSqxOVVaC5tSU3W0ezhCZVOP2ocNt3g=;
X-UUID: 384dffc59c8a4e3f874ae85de95fd68e-20200506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 252576497; Wed, 06 May 2020 00:16:14 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 01:16:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 16:16:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 May 2020 16:16:04 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH v14 04/11] soc: mediatek: Remove infracfg misc driver support
Date: Wed, 6 May 2020 16:15:56 +0800
Message-ID: <1588752963-19934-5-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1588752963-19934-1-git-send-email-weiyi.lu@mediatek.com>
References: <1588752963-19934-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 79D3148D06BF36341630844AF63A4F496959233CF6F5EE005F4101F5612A72662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_011618_347731_95687569 
X-CRM114-Status: GOOD (  18.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The functions provided by infracfg misc driver have no other user except
the scpsys driver so move those into scpsys driver directly.
And then, remove infracfg misc drvier which is no longer being used.
BTW, in next patch, we're going to extend the bus protection functions
with more customized arguments.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/Kconfig          | 10 -----
 drivers/soc/mediatek/Makefile         |  1 -
 drivers/soc/mediatek/mtk-infracfg.c   | 79 -----------------------------------
 drivers/soc/mediatek/mtk-scpsys.c     | 66 +++++++++++++++++++++++++----
 include/linux/soc/mediatek/infracfg.h | 39 -----------------
 5 files changed, 57 insertions(+), 138 deletions(-)
 delete mode 100644 drivers/soc/mediatek/mtk-infracfg.c
 delete mode 100644 include/linux/soc/mediatek/infracfg.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 2114b56..f837b3c 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -10,21 +10,12 @@ config MTK_CMDQ
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select MAILBOX
 	select MTK_CMDQ_MBOX
-	select MTK_INFRACFG
 	help
 	  Say yes here to add support for the MediaTek Command Queue (CMDQ)
 	  driver. The CMDQ is used to help read/write registers with critical
 	  time limitation, such as updating display configuration during the
 	  vblank.
 
-config MTK_INFRACFG
-	bool "MediaTek INFRACFG Support"
-	select REGMAP
-	help
-	  Say yes here to add support for the MediaTek INFRACFG controller. The
-	  INFRACFG controller contains various infrastructure registers not
-	  directly associated to any device.
-
 config MTK_PMIC_WRAP
 	tristate "MediaTek PMIC Wrapper Support"
 	depends on RESET_CONTROLLER
@@ -38,7 +29,6 @@ config MTK_SCPSYS
 	bool "MediaTek SCPSYS Support"
 	default ARCH_MEDIATEK
 	select REGMAP
-	select MTK_INFRACFG
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  Say yes here to add support for the MediaTek SCPSYS power domain
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index b017330..2b2c2537 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
-obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
deleted file mode 100644
index 341c7ac..0000000
--- a/drivers/soc/mediatek/mtk-infracfg.c
+++ /dev/null
@@ -1,79 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2015 Pengutronix, Sascha Hauer <kernel@pengutronix.de>
- */
-
-#include <linux/export.h>
-#include <linux/jiffies.h>
-#include <linux/regmap.h>
-#include <linux/soc/mediatek/infracfg.h>
-#include <asm/processor.h>
-
-#define MTK_POLL_DELAY_US   10
-#define MTK_POLL_TIMEOUT    (jiffies_to_usecs(HZ))
-
-#define INFRA_TOPAXI_PROTECTEN		0x0220
-#define INFRA_TOPAXI_PROTECTSTA1	0x0228
-#define INFRA_TOPAXI_PROTECTEN_SET	0x0260
-#define INFRA_TOPAXI_PROTECTEN_CLR	0x0264
-
-/**
- * mtk_infracfg_set_bus_protection - enable bus protection
- * @regmap: The infracfg regmap
- * @mask: The mask containing the protection bits to be enabled.
- * @reg_update: The boolean flag determines to set the protection bits
- *              by regmap_update_bits with enable register(PROTECTEN) or
- *              by regmap_write with set register(PROTECTEN_SET).
- *
- * This function enables the bus protection bits for disabled power
- * domains so that the system does not hang when some unit accesses the
- * bus while in power down.
- */
-int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
-		bool reg_update)
-{
-	u32 val;
-	int ret;
-
-	if (reg_update)
-		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask,
-				mask);
-	else
-		regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_SET, mask);
-
-	ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
-				       val, (val & mask) == mask,
-				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
-
-	return ret;
-}
-
-/**
- * mtk_infracfg_clear_bus_protection - disable bus protection
- * @regmap: The infracfg regmap
- * @mask: The mask containing the protection bits to be disabled.
- * @reg_update: The boolean flag determines to clear the protection bits
- *              by regmap_update_bits with enable register(PROTECTEN) or
- *              by regmap_write with clear register(PROTECTEN_CLR).
- *
- * This function disables the bus protection bits previously enabled with
- * mtk_infracfg_set_bus_protection.
- */
-
-int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
-		bool reg_update)
-{
-	int ret;
-	u32 val;
-
-	if (reg_update)
-		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask, 0);
-	else
-		regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_CLR, mask);
-
-	ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
-				       val, !(val & mask),
-				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
-
-	return ret;
-}
diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index c9c3cf7..b603af7 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -10,8 +10,8 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/soc/mediatek/infracfg.h>
 
 #include <dt-bindings/power/mt2701-power.h>
 #include <dt-bindings/power/mt2712-power.h>
@@ -78,6 +78,29 @@
 #define PWR_STATUS_HIF1			BIT(26)	/* MT7622 */
 #define PWR_STATUS_WB			BIT(27)	/* MT7622 */
 
+#define INFRA_TOPAXI_PROTECTEN		0x0220
+#define INFRA_TOPAXI_PROTECTSTA1	0x0228
+#define INFRA_TOPAXI_PROTECTEN_SET	0x0260
+#define INFRA_TOPAXI_PROTECTEN_CLR	0x0264
+
+#define MT2701_TOP_AXI_PROT_EN_MM_M0		BIT(1)
+#define MT2701_TOP_AXI_PROT_EN_CONN_M		BIT(2)
+#define MT2701_TOP_AXI_PROT_EN_CONN_S		BIT(8)
+
+#define MT7622_TOP_AXI_PROT_EN_ETHSYS		(BIT(3) | BIT(17))
+#define MT7622_TOP_AXI_PROT_EN_HIF0		(BIT(24) | BIT(25))
+#define MT7622_TOP_AXI_PROT_EN_HIF1		(BIT(26) | BIT(27) | \
+						 BIT(28))
+#define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
+						 BIT(7) | BIT(8))
+
+#define MT8173_TOP_AXI_PROT_EN_MM_M0		BIT(1)
+#define MT8173_TOP_AXI_PROT_EN_MM_M1		BIT(2)
+#define MT8173_TOP_AXI_PROT_EN_MFG_S		BIT(14)
+#define MT8173_TOP_AXI_PROT_EN_MFG_M0		BIT(21)
+#define MT8173_TOP_AXI_PROT_EN_MFG_M1		BIT(22)
+#define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT	BIT(23)
+
 #define MAX_CLKS	3
 
 /**
@@ -251,25 +274,50 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 static int scpsys_bus_protect_enable(struct scp_domain *scpd)
 {
 	struct scp *scp = scpd->scp;
+	struct regmap *infracfg = scp->infracfg;
+	u32 mask = scpd->data->bus_prot_mask;
+	bool reg_update = scp->bus_prot_reg_update;
+	u32 val;
+	int ret;
 
-	if (!scpd->data->bus_prot_mask)
+	if (!mask)
 		return 0;
 
-	return mtk_infracfg_set_bus_protection(scp->infracfg,
-			scpd->data->bus_prot_mask,
-			scp->bus_prot_reg_update);
+	if (reg_update)
+		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask,
+				mask);
+	else
+		regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_SET, mask);
+
+	ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
+				       val, (val & mask) == mask,
+				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+
+	return ret;
 }
 
 static int scpsys_bus_protect_disable(struct scp_domain *scpd)
 {
 	struct scp *scp = scpd->scp;
+	struct regmap *infracfg = scp->infracfg;
+	u32 mask = scpd->data->bus_prot_mask;
+	bool reg_update = scp->bus_prot_reg_update;
+	u32 val;
+	int ret;
 
-	if (!scpd->data->bus_prot_mask)
+	if (!mask)
 		return 0;
 
-	return mtk_infracfg_clear_bus_protection(scp->infracfg,
-			scpd->data->bus_prot_mask,
-			scp->bus_prot_reg_update);
+	if (reg_update)
+		regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask, 0);
+	else
+		regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_CLR, mask);
+
+	ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
+				       val, !(val & mask),
+				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+
+	return ret;
 }
 
 static int scpsys_power_on(struct generic_pm_domain *genpd)
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
deleted file mode 100644
index fd25f01..0000000
--- a/include/linux/soc/mediatek/infracfg.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __SOC_MEDIATEK_INFRACFG_H
-#define __SOC_MEDIATEK_INFRACFG_H
-
-#define MT8173_TOP_AXI_PROT_EN_MCI_M2		BIT(0)
-#define MT8173_TOP_AXI_PROT_EN_MM_M0		BIT(1)
-#define MT8173_TOP_AXI_PROT_EN_MM_M1		BIT(2)
-#define MT8173_TOP_AXI_PROT_EN_MMAPB_S		BIT(6)
-#define MT8173_TOP_AXI_PROT_EN_L2C_M2		BIT(9)
-#define MT8173_TOP_AXI_PROT_EN_L2SS_SMI		BIT(11)
-#define MT8173_TOP_AXI_PROT_EN_L2SS_ADD		BIT(12)
-#define MT8173_TOP_AXI_PROT_EN_CCI_M2		BIT(13)
-#define MT8173_TOP_AXI_PROT_EN_MFG_S		BIT(14)
-#define MT8173_TOP_AXI_PROT_EN_PERI_M0		BIT(15)
-#define MT8173_TOP_AXI_PROT_EN_PERI_M1		BIT(16)
-#define MT8173_TOP_AXI_PROT_EN_DEBUGSYS		BIT(17)
-#define MT8173_TOP_AXI_PROT_EN_CQ_DMA		BIT(18)
-#define MT8173_TOP_AXI_PROT_EN_GCPU		BIT(19)
-#define MT8173_TOP_AXI_PROT_EN_IOMMU		BIT(20)
-#define MT8173_TOP_AXI_PROT_EN_MFG_M0		BIT(21)
-#define MT8173_TOP_AXI_PROT_EN_MFG_M1		BIT(22)
-#define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT	BIT(23)
-
-#define MT2701_TOP_AXI_PROT_EN_MM_M0		BIT(1)
-#define MT2701_TOP_AXI_PROT_EN_CONN_M		BIT(2)
-#define MT2701_TOP_AXI_PROT_EN_CONN_S		BIT(8)
-
-#define MT7622_TOP_AXI_PROT_EN_ETHSYS		(BIT(3) | BIT(17))
-#define MT7622_TOP_AXI_PROT_EN_HIF0		(BIT(24) | BIT(25))
-#define MT7622_TOP_AXI_PROT_EN_HIF1		(BIT(26) | BIT(27) | \
-						 BIT(28))
-#define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
-						 BIT(7) | BIT(8))
-
-int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
-		bool reg_update);
-int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
-		bool reg_update);
-#endif /* __SOC_MEDIATEK_INFRACFG_H */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
