Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FC5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcfDdX7BU/+BkFJM7o7Y+LNdjI7QuxXmIfUEFxGdPnA=; b=2yHsexr8gQSDz/
	gn259Z5nPOOunFqSQDMQI6l/fcujJBU+RcqKDF4IvVX681wflCcDAtawfW4ghLEsa/AcfZuT3w87M
	+tr3VoGs7N5Hu183KpWzaqxoZPhL5yAUiBuhNVMkVjLUcvwj243nB921Z0P23DLPMLnMRcs39q9jJ
	fVdFdKqb9eCZM3kO8ghJthNvv67IcTeNqvEc0YNNIUQGb5haAXl2IhkDNUilNG6IRXy4BEsLlEk2s
	tpaf+B/4+Upd1FJ+jm8tXQxCorMlsSKknpckerDKJfIGamYyUeErWlU66SYmJ9yfnIZKv48KOt9yt
	8BxkdUB5xyXnAejHyraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlp3S-004sbF-Ny; Tue, 03 May 2022 09:42:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlozv-004qGx-SY; Tue, 03 May 2022 09:39:16 +0000
X-UUID: affb4c381a064e3c96d22e6c7d7b34f2-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9d0e52ee-26e4-46d3-8a2f-38eeacbf16a4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:bbf44fc7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: affb4c381a064e3c96d22e6c7d7b34f2-20220503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1312374835; Tue, 03 May 2022 02:39:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 02:39:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 17:38:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 3 May 2022 17:38:59 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v6 05/16] clk: mediatek: reset: Merge and revise reset
 register function
Date: Tue, 3 May 2022 17:38:45 +0800
Message-ID: <20220503093856.22250-6-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_023912_014404_AF448205 
X-CRM114-Status: GOOD (  21.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two versions for clock reset register control for MediaTek
SoCs. The old hardware is one bit per reset control, and does not
have separate registers for bit set, clear and read-back operations.
This matches the scheme supported by the simple reset driver.

However, because we need to use different data structure from
reset_simple_data, we can not use the operation of simple reset
driver.
For this reason, we keep the original functions and name this version
as "MTK_RST_SIMPLE".

In this patch:
- Add a version enumeration to separate different reset hardware.
- Merge the reset register function of simple and set_clr into one
  function "mtk_register_reset_controller".
- Rename input variable "num_regs" to "rst_bank_nr" to avoid
  confusion. This variable is used to define the quantity of reset bank.
- Document mtk_reset_version and mtk_register_reset_controller.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt2701-eth.c |  2 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c |  2 +-
 drivers/clk/mediatek/clk-mt2701-hif.c |  2 +-
 drivers/clk/mediatek/clk-mt2701.c     |  4 +--
 drivers/clk/mediatek/clk-mt2712.c     |  4 +--
 drivers/clk/mediatek/clk-mt7622-eth.c |  2 +-
 drivers/clk/mediatek/clk-mt7622-hif.c |  4 +--
 drivers/clk/mediatek/clk-mt7622.c     |  4 +--
 drivers/clk/mediatek/clk-mt7629-eth.c |  2 +-
 drivers/clk/mediatek/clk-mt7629-hif.c |  4 +--
 drivers/clk/mediatek/clk-mt8135.c     |  4 +--
 drivers/clk/mediatek/clk-mt8173.c     |  4 +--
 drivers/clk/mediatek/clk-mt8183.c     |  3 +-
 drivers/clk/mediatek/reset.c          | 40 ++++++++++++---------------
 drivers/clk/mediatek/reset.h          | 24 +++++++++++++---
 15 files changed, 59 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek/clk-mt2701-eth.c
index 100ff6ca609e..0270979ccc20 100644
--- a/drivers/clk/mediatek/clk-mt2701-eth.c
+++ b/drivers/clk/mediatek/clk-mt2701-eth.c
@@ -58,7 +58,7 @@ static int clk_mt2701_eth_probe(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-	mtk_register_reset_controller(node, 1, 0x34);
+	mtk_register_reset_controller(node, 1, 0x34, MTK_RST_SIMPLE);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/clk-mt2701-g3d.c b/drivers/clk/mediatek/clk-mt2701-g3d.c
index 1328c112a38f..e406f863dcf0 100644
--- a/drivers/clk/mediatek/clk-mt2701-g3d.c
+++ b/drivers/clk/mediatek/clk-mt2701-g3d.c
@@ -52,7 +52,7 @@ static int clk_mt2701_g3dsys_init(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-	mtk_register_reset_controller(node, 1, 0xc);
+	mtk_register_reset_controller(node, 1, 0xc, MTK_RST_SIMPLE);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
index 61444881c539..352ca7a646c3 100644
--- a/drivers/clk/mediatek/clk-mt2701-hif.c
+++ b/drivers/clk/mediatek/clk-mt2701-hif.c
@@ -57,7 +57,7 @@ static int clk_mt2701_hif_probe(struct platform_device *pdev)
 		return r;
 	}
 
-	mtk_register_reset_controller(node, 1, 0x34);
+	mtk_register_reset_controller(node, 1, 0x34, MTK_RST_SIMPLE);
 
 	return 0;
 }
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 1eb3e4563c3f..591479222e75 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -785,7 +785,7 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	mtk_register_reset_controller(node, 2, 0x30);
+	mtk_register_reset_controller(node, 2, 0x30, MTK_RST_SIMPLE);
 
 	return 0;
 }
@@ -908,7 +908,7 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	mtk_register_reset_controller(node, 2, 0x0);
+	mtk_register_reset_controller(node, 2, 0x0, MTK_RST_SIMPLE);
 
 	return 0;
 }
diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index ff72b9ab945b..b311b43fbbd3 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1361,7 +1361,7 @@ static int clk_mt2712_infra_probe(struct platform_device *pdev)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
 
-	mtk_register_reset_controller(node, 2, 0x30);
+	mtk_register_reset_controller(node, 2, 0x30, MTK_RST_SIMPLE);
 
 	return r;
 }
@@ -1383,7 +1383,7 @@ static int clk_mt2712_peri_probe(struct platform_device *pdev)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
 
-	mtk_register_reset_controller(node, 2, 0);
+	mtk_register_reset_controller(node, 2, 0, MTK_RST_SIMPLE);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/clk-mt7622-eth.c b/drivers/clk/mediatek/clk-mt7622-eth.c
index c9947dc7ba5a..bfdd09f3b72d 100644
--- a/drivers/clk/mediatek/clk-mt7622-eth.c
+++ b/drivers/clk/mediatek/clk-mt7622-eth.c
@@ -82,7 +82,7 @@ static int clk_mt7622_ethsys_init(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-	mtk_register_reset_controller(node, 1, 0x34);
+	mtk_register_reset_controller(node, 1, 0x34, MTK_RST_SIMPLE);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/clk-mt7622-hif.c b/drivers/clk/mediatek/clk-mt7622-hif.c
index 628be0c9f888..892da27f6077 100644
--- a/drivers/clk/mediatek/clk-mt7622-hif.c
+++ b/drivers/clk/mediatek/clk-mt7622-hif.c
@@ -93,7 +93,7 @@ static int clk_mt7622_ssusbsys_init(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-	mtk_register_reset_controller(node, 1, 0x34);
+	mtk_register_reset_controller(node, 1, 0x34, MTK_RST_SIMPLE);
 
 	return r;
 }
@@ -115,7 +115,7 @@ static int clk_mt7622_pciesys_init(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-	mtk_register_reset_controller(node, 1, 0x34);
+	mtk_register_reset_controller(node, 1, 0x34, MTK_RST_SIMPLE);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 0e1fb30a1e98..5bb3757f4217 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -663,7 +663,7 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	mtk_register_reset_controller(node, 1, 0x30);
+	mtk_register_reset_controller(node, 1, 0x30, MTK_RST_SIMPLE);
 
 	return 0;
 }
@@ -714,7 +714,7 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 
 	clk_prepare_enable(clk_data->clks[CLK_PERI_UART0_PD]);
 
-	mtk_register_reset_controller(node, 2, 0x0);
+	mtk_register_reset_controller(node, 2, 0x0, MTK_RST_SIMPLE);
 
 	return 0;
 }
diff --git a/drivers/clk/mediatek/clk-mt7629-eth.c b/drivers/clk/mediatek/clk-mt7629-eth.c
index 88279d0ea1a7..1c57589b39fd 100644
--- a/drivers/clk/mediatek/clk-mt7629-eth.c
+++ b/drivers/clk/mediatek/clk-mt7629-eth.c
@@ -92,7 +92,7 @@ static int clk_mt7629_ethsys_init(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-	mtk_register_reset_controller(node, 1, 0x34);
+	mtk_register_reset_controller(node, 1, 0x34, MTK_RST_SIMPLE);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/clk-mt7629-hif.c b/drivers/clk/mediatek/clk-mt7629-hif.c
index 5c5b37207afb..6761151ca839 100644
--- a/drivers/clk/mediatek/clk-mt7629-hif.c
+++ b/drivers/clk/mediatek/clk-mt7629-hif.c
@@ -88,7 +88,7 @@ static int clk_mt7629_ssusbsys_init(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-	mtk_register_reset_controller(node, 1, 0x34);
+	mtk_register_reset_controller(node, 1, 0x34, MTK_RST_SIMPLE);
 
 	return r;
 }
@@ -110,7 +110,7 @@ static int clk_mt7629_pciesys_init(struct platform_device *pdev)
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-	mtk_register_reset_controller(node, 1, 0x34);
+	mtk_register_reset_controller(node, 1, 0x34, MTK_RST_SIMPLE);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 09ad272d51f1..d95b5dfa580c 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -559,7 +559,7 @@ static void __init mtk_infrasys_init(struct device_node *node)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
 
-	mtk_register_reset_controller(node, 2, 0x30);
+	mtk_register_reset_controller(node, 2, 0x30, MTK_RST_SIMPLE);
 }
 CLK_OF_DECLARE(mtk_infrasys, "mediatek,mt8135-infracfg", mtk_infrasys_init);
 
@@ -587,7 +587,7 @@ static void __init mtk_pericfg_init(struct device_node *node)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
 
-	mtk_register_reset_controller(node, 2, 0);
+	mtk_register_reset_controller(node, 2, 0, MTK_RST_SIMPLE);
 }
 CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt8135-pericfg", mtk_pericfg_init);
 
diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 46b7655feeaa..56120b148761 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -882,7 +882,7 @@ static void __init mtk_infrasys_init(struct device_node *node)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
 
-	mtk_register_reset_controller(node, 2, 0x30);
+	mtk_register_reset_controller(node, 2, 0x30, MTK_RST_SIMPLE);
 }
 CLK_OF_DECLARE(mtk_infrasys, "mediatek,mt8173-infracfg", mtk_infrasys_init);
 
@@ -910,7 +910,7 @@ static void __init mtk_pericfg_init(struct device_node *node)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
 
-	mtk_register_reset_controller(node, 2, 0);
+	mtk_register_reset_controller(node, 2, 0, MTK_RST_SIMPLE);
 }
 CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt8173-pericfg", mtk_pericfg_init);
 
diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 68496554dd3d..9b27f1ffc600 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1239,7 +1239,8 @@ static int clk_mt8183_infra_probe(struct platform_device *pdev)
 		return r;
 	}
 
-	mtk_register_reset_controller_set_clr(node, 4, INFRA_RST0_SET_OFFSET);
+	mtk_register_reset_controller(node, 4,
+				      INFRA_RST0_SET_OFFSET, MTK_RST_SET_CLR);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 22fa9f09752c..a54a835c1d47 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -92,14 +92,25 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
 	.reset = mtk_reset_set_clr,
 };
 
-static void mtk_register_reset_controller_common(struct device_node *np,
-						 unsigned int num_regs,
-						 int regofs,
-						 const struct reset_control_ops *reset_ops)
+void mtk_register_reset_controller(struct device_node *np,
+				   u32 rst_bank_nr, u16 reg_ofs, u8 version)
 {
 	struct mtk_reset *data;
 	int ret;
 	struct regmap *regmap;
+	const struct reset_control_ops *rcops = NULL;
+
+	switch (version) {
+	case MTK_RST_SIMPLE:
+		rcops = &mtk_reset_ops;
+		break;
+	case MTK_RST_SET_CLR:
+		rcops = &mtk_reset_ops_set_clr;
+		break;
+	default:
+		pr_err("Unknown reset version %d\n", version);
+		return;
+	}
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
@@ -112,32 +123,17 @@ static void mtk_register_reset_controller_common(struct device_node *np,
 		return;
 
 	data->regmap = regmap;
-	data->regofs = regofs;
+	data->regofs = reg_ofs;
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = num_regs * 32;
-	data->rcdev.ops = reset_ops;
+	data->rcdev.nr_resets = rst_bank_nr * 32;
+	data->rcdev.ops = rcops;
 	data->rcdev.of_node = np;
 
 	ret = reset_controller_register(&data->rcdev);
 	if (ret) {
 		pr_err("could not register reset controller: %d\n", ret);
 		kfree(data);
-		return;
 	}
 }
 
-void mtk_register_reset_controller(struct device_node *np,
-				   unsigned int num_regs, int regofs)
-{
-	mtk_register_reset_controller_common(np, num_regs, regofs,
-					     &mtk_reset_ops);
-}
-
-void mtk_register_reset_controller_set_clr(struct device_node *np,
-					   unsigned int num_regs, int regofs)
-{
-	mtk_register_reset_controller_common(np, num_regs, regofs,
-					     &mtk_reset_ops_set_clr);
-}
-
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 764a8affe206..2a39eec9cff7 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -9,16 +9,32 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 
+/**
+ * enum mtk_reset_version - Version of MediaTek clock reset controller.
+ * @MTK_RST_SIMPLE: Use the same registers for bit set and clear.
+ * @MTK_RST_SET_CLR: Use separate registers for bit set and clear.
+ * @MTK_RST_MAX: Total quantity of version for MediaTek clock reset controller.
+ */
+enum mtk_reset_version {
+	MTK_RST_SIMPLE = 0,
+	MTK_RST_SET_CLR,
+	MTK_RST_MAX,
+};
+
 struct mtk_reset {
 	struct regmap *regmap;
 	int regofs;
 	struct reset_controller_dev rcdev;
 };
 
+/**
+ * mtk_register_reset_controller - Register MediaTek clock reset controller
+ * @np: Pointer to device node.
+ * @rst_bank_nr: Quantity of reset bank.
+ * @reg_ofs: Base offset of the reset register.
+ * @version: Version of MediaTek clock reset controller.
+ */
 void mtk_register_reset_controller(struct device_node *np,
-				   unsigned int num_regs, int regofs);
-
-void mtk_register_reset_controller_set_clr(struct device_node *np,
-					   unsigned int num_regs, int regofs);
+				   u32 rst_bank_nr, u16 reg_ofs, u8 version);
 
 #endif /* __DRV_CLK_MTK_RESET_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
