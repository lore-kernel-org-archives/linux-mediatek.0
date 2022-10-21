Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90231C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 10:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaA+3G5xEHH3mnc9/OCzPIeSENMk+pFmZNY64ZK7jsQ=; b=opcorqphfP0pU8UZ7UEc9iu6C7
	F4jy6ZIBGk7dlYxkeJAmuSpWRFFIN8usAq7unHLiiaErTHyOvTEWZBNLnjPDLTDwpzW33KXrqrItI
	iww+s9jeGoIKE9hL0D12+MWAO/RlUmrQJc1xHnDzYRT2v7QQqEHu7SQn05oFGSUUMjuULx+Rttpd7
	m2sj2ez4ZyU9/phBF8GDNe1GOqacZyyEd9iBIgdyieiF4f1k35ZeWh7Zx2UOCvDyw4duKlil4rB8f
	bfFyCTAWYzUE6OyYFXMbXucXsnilXG99vp7gIBYoq9edDUbXbvbIfKmjI45RVWQIuTlli+YF43d95
	ed79TKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpjo-007FXw-22; Fri, 21 Oct 2022 10:58:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpjl-007FWF-77; Fri, 21 Oct 2022 10:58:51 +0000
X-UUID: 60a83932ec1d4a828b332fd3f354128e-20221021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BaA+3G5xEHH3mnc9/OCzPIeSENMk+pFmZNY64ZK7jsQ=;
	b=OyMQmHR+bSV2lTczfUIcIXpUy22xXlcmXIMSKuJ0zwKcvcFIDc9dvEqnaWeeEQGUp4dyEqZccnWP3zSIHanNgmeluq3pXMtiyEVXyU6QH8zYVJhIv0Rvr3rnq9/rEgENrjAgTeiatuBZMC+2ZvA3kiZJflSPJEk4I9UYC/IApTk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:40d0cee6-92fd-4532-a3cf-7461ab818910,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:cf95b16c-89d3-4bfa-baad-dc632a24bca3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 60a83932ec1d4a828b332fd3f354128e-20221021
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 27902083; Fri, 21 Oct 2022 03:58:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 21 Oct 2022 18:48:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 21 Oct 2022 18:48:06 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <sboyd@kernel.org>, <mturquette@baylibre.com>, <matthias.bgg@gmail.com>,
	<p.zabel@pengutronix.de>
CC: <runyang.chen@mediatek.com>, <miles.chen@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nfraprado@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v6 3/3] reset: mediatek: Add auxiliary bus support for sysclk
Date: Fri, 21 Oct 2022 18:48:04 +0800
Message-ID: <20221021104804.21391-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221021104804.21391-1-rex-bc.chen@mediatek.com>
References: <20221021104804.21391-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_035849_284943_204F2890 
X-CRM114-Status: GOOD (  19.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To use auxiliary bus interface:

- Add a probe function inside reset-mediatek-sysclk.c.
- Revise the auxiliary table name because the rule for this
  table is `KBUILD_MODNAME.device_name`
- Remove mtk_reset_init_with_dev() because we should use aux bus
  interface directly.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/reset/mediatek/Kconfig                |  1 +
 .../reset/mediatek/reset-mediatek-sysclk.c    | 67 ++++++++++---------
 include/linux/reset/reset-mediatek-sysclk.h   |  1 -
 3 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/reset/mediatek/Kconfig b/drivers/reset/mediatek/Kconfig
index a416cb938753..b5b671017d34 100644
--- a/drivers/reset/mediatek/Kconfig
+++ b/drivers/reset/mediatek/Kconfig
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config RESET_MEDIATEK_SYSCLK
 	tristate "MediaTek System Clock Reset Driver"
+	depends on AUXILIARY_BUS
 	help
 	  This enables the system clock reset driver for MediaTek SoCs.
diff --git a/drivers/reset/mediatek/reset-mediatek-sysclk.c b/drivers/reset/mediatek/reset-mediatek-sysclk.c
index 9cf115e66a4d..79d58bc728b2 100644
--- a/drivers/reset/mediatek/reset-mediatek-sysclk.c
+++ b/drivers/reset/mediatek/reset-mediatek-sysclk.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022 MediaTek Inc.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -213,78 +214,73 @@ static int register_rst_ctrl_with_dev(struct device *dev, struct mtk_clk_rst_dat
 	return 0;
 }
 
-struct mtk_rst_id {
-	char name[32];
-	u32 driver_data;
-};
-
-static struct mtk_rst_id mtk_sysclk_reset_ids[] = {
+static struct auxiliary_device_id mtk_sysclk_reset_ids[] = {
 	{
-		.name = "mt2701-eth-rst",
+		.name = "clk_mt2701_eth.mt2701-eth-rst",
 		.driver_data = MTK_RST_ID_MT2701_ETH,
 	},
 	{
-		.name = "mt2701-g3d-rst",
+		.name = "clk_mt2701_g3d.mt2701-g3d-rst",
 		.driver_data = MTK_RST_ID_MT2701_G3D,
 	},
 	{
-		.name = "mt2701-hif-rst",
+		.name = "clk_mt2701_hif.mt2701-hif-rst",
 		.driver_data = MTK_RST_ID_MT2701_HIF,
 	},
 	{
-		.name = "mt2701-infrasys-rst",
+		.name = "clk_mt2701.mt2701-infrasys-rst",
 		.driver_data = MTK_RST_ID_MT2701_INFRASYS,
 	},
 	{
-		.name = "mt2701-pericfg-rst",
+		.name = "clk_mt2701.mt2701-pericfg-rst",
 		.driver_data = MTK_RST_ID_MT2701_PERICFG,
 	},
 	{
-		.name = "mt2712-infra-rst",
+		.name = "clk_mt2712.mt2712-infra-rst",
 		.driver_data = MTK_RST_ID_MT2712_INFRA,
 	},
 	{
-		.name = "mt2712-peri-rst",
+		.name = "clk_mt2712.mt2712-peri-rst",
 		.driver_data = MTK_RST_ID_MT2712_PERI,
 	},
 	{
-		.name = "mt6795-ifa",
+		.name = "clk_mt6795_infracfg.mt6795-ifa",
 		.driver_data = MTK_RST_ID_MT6795_INFRA,
 	},
 	{
-		.name = "mt6795-peri",
+		.name = "clk_mt6795_pericfg.mt6795-peri",
 		.driver_data = MTK_RST_ID_MT6795_PERI,
 	},
 	{
-		.name = "mt7622-eth-rst",
+		.name = "clk_mt7622_eth.mt7622-eth-rst",
 		.driver_data = MTK_RST_ID_MT7622_ETH,
 	},
 	{
-		.name = "mt7622-usb-rst",
+		.name = "clk_mt7622_hif.mt7622-usb-rst",
 		.driver_data = MTK_RST_ID_MT7622_SSUSBSYS,
 	},
 	{
-		.name = "mt7622-pcie-rst",
+		.name = "clk_mt7622_hif.mt7622-pcie-rst",
 		.driver_data = MTK_RST_ID_MT7622_PCIESYS,
 	},
 	{
-		.name = "mt7622-infrasys-rst",
+		.name = "clk_mt7622.mt7622-infrasys-rst",
 		.driver_data = MTK_RST_ID_MT7622_INFRASYS,
 	},
 	{
-		.name = "mt7622-pericfg-rst",
+		.name = "clk_mt7622.mt7622-pericfg-rst",
 		.driver_data = MTK_RST_ID_MT7622_PERICFG,
 	},
 	{
-		.name = "mt7629-ethsys-rst",
+		.name = "clk_mt7629_eth.mt7629-ethsys-rst",
 		.driver_data = MTK_RST_ID_MT7629_ETHSYS,
 	},
 	{
-		.name = "mt7629-usb-rst",
+		.name = "clk_mt7629_hif.mt7629-usb-rst",
 		.driver_data = MTK_RST_ID_MT7629_SSUSBSYS,
 	},
 	{
-		.name = "mt7629-pcie-rst",
+		.name = "clk_mt7629_hif.mt7629-pcie-rst",
 		.driver_data = MTK_RST_ID_MT7629_PCIESYS,
 	},
 	{
@@ -304,24 +300,25 @@ static struct mtk_rst_id mtk_sysclk_reset_ids[] = {
 		.driver_data = MTK_RST_ID_MT8173_PERICFG,
 	},
 	{
-		.name = "mt8183-infra-rst",
+		.name = "clk_mt8183.mt8183-infra-rst",
 		.driver_data = MTK_RST_ID_MT8183_INFRA,
 	},
 	{
-		.name = "mt8186-infra-ao-rst",
+		.name = "clk_mtk.mt8186-infra-ao-rst",
 		.driver_data = MTK_RST_ID_MT8186_INFRA_AO,
 	},
 	{
-		.name = "mt8192-infra-rst",
+		.name = "clk_mt8192.mt8192-infra-rst",
 		.driver_data = MTK_RST_ID_MT8192_INFRA,
 	},
 	{
-		.name = "mt8195-infra-ao-rst",
+		.name = "clk_mtk.mt8195-infra-ao-rst",
 		.driver_data = MTK_RST_ID_MT8195_INFRA_AO,
 	},
 	{
 	},
 };
+MODULE_DEVICE_TABLE(auxiliary, mtk_sysclk_reset_ids);
 
 /* reset data pointer */
 struct mtk_clk_rst_data *p_clk_rst_data[MTK_RST_ID_MAX];
@@ -372,16 +369,20 @@ void mtk_rst_remove_with_node(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(mtk_rst_remove_with_node);
 
-int mtk_reset_init_with_dev(struct device *dev, const char *name)
+static int mtk_sysclk_reset_probe(struct auxiliary_device *adev,
+				  const struct auxiliary_device_id *id)
 {
-	struct mtk_clk_rst_data *data = find_rst_data(name);
-
-	if (!dev || !data)
+	if (id->driver_data >= MTK_RST_ID_MAX)
 		return -EINVAL;
 
-	return register_rst_ctrl_with_dev(dev, data);
+	return register_rst_ctrl_with_dev(adev->dev.parent, p_clk_rst_data[id->driver_data]);
 }
-EXPORT_SYMBOL_GPL(mtk_reset_init_with_dev);
+
+static struct auxiliary_driver mtk_sysclk_reset_driver = {
+	.probe		= mtk_sysclk_reset_probe,
+	.id_table	= mtk_sysclk_reset_ids,
+};
+module_auxiliary_driver(mtk_sysclk_reset_driver);
 
 MODULE_DESCRIPTION("MediaTek System Clock Reset Driver");
 MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
diff --git a/include/linux/reset/reset-mediatek-sysclk.h b/include/linux/reset/reset-mediatek-sysclk.h
index 26f7573e46a6..6f5f15d12edd 100644
--- a/include/linux/reset/reset-mediatek-sysclk.h
+++ b/include/linux/reset/reset-mediatek-sysclk.h
@@ -93,6 +93,5 @@ struct mtk_clk_rst_data {
 int mtk_rst_register_clk_rst_data(u32 index, struct mtk_clk_rst_data *data);
 int mtk_reset_init_with_node(struct device_node *np, const char *name);
 void mtk_rst_remove_with_node(struct device_node *np, const char *name);
-int mtk_reset_init_with_dev(struct device *dev, const char *name);
 
 #endif /* __LINUX_RESET_MEDIATEK_SYSCLK_H__ */
-- 
2.18.0


