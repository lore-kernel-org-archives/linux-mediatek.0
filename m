Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BE4C38142
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga2PE4Rkn7sz5E4UywkewSdIh8QZ9TOJBBtMwJ8n8Uw=; b=sGKpKGX3WhA7jHIXZmuNDn2zu9
	aaCaoTiKFA/biozu97K+WQu8H8TILdCTy6yKfa3Ti1tGMKXiw/gKR5o9tbmS+WD6UK0amZmRkV9Ju
	OHks9EifyWK+Npy2OlR1BQF4OxcnBdJ3mffnv70FrE1t+rQ6i56s+ASpou35gQ6ZK9YGGfplqCQ3q
	CglZdXwpGHQ82KKwOpLBpS1T9wo4mh8OePupW3BpxBk2K1o/rsx2NU4JqoFjBPRliQh9m72T8PMDr
	cDifYL9GCUy/+OCHzO2ibaPSeLiCmyyviYaSvU9scHfBHfg2kSE2Fc2IPrI+uCTrs3J1kcEB5kdPS
	hlAGDN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz1A-00Ghp4-Vm; Wed, 18 Jan 2023 03:21:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz18-00Ghmr-2F; Wed, 18 Jan 2023 03:21:40 +0000
X-UUID: 30fd346a96df11edbbe3f76fe852e059-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ga2PE4Rkn7sz5E4UywkewSdIh8QZ9TOJBBtMwJ8n8Uw=;
	b=jJRgHfjrvD6T3FQHj5zmvn8XCJ/LBjPvgVzYqnIN6XXmm7+tLgOcehnKyQF470MiW5QAlptCYFp+Z1bXZfqpn8OJrah5bRMMnHBcRqqpE38vHXGro1QlTF2iatow0OABnkrrLwiIePEUB29ZzhiGoxxnvxDRUfF/+9L26Kh4LeQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:887aeecb-33cf-484b-9b23-b99a2b25990a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:632820f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 30fd346a96df11edbbe3f76fe852e059-20230117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1583885349; Tue, 17 Jan 2023 20:21:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:21:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:21:23 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 4/6] soc: mediatek: mmsys: add config api for RSZ switching and DCM
Date: Wed, 18 Jan 2023 11:21:20 +0800
Message-ID: <20230118032122.29956-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118032122.29956-1-moudy.ho@mediatek.com>
References: <20230118032122.29956-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_192138_156537_AACF440D 
X-CRM114-Status: GOOD (  13.34  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Due to MT8195 HW design, some RSZs have additional settings that
need to be configured in MMSYS.

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 13 ++++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 42 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  4 +++
 3 files changed, 59 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index abfe94a30248..a1b8e3fd037e 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -75,6 +75,19 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+/* VPPSYS1 */
+#define MT8195_VPP1_HW_DCM_1ST_DIS0				0x150
+#define MT8195_VPP1_HW_DCM_1ST_DIS1				0x160
+#define MT8195_VPP1_HW_DCM_2ND_DIS0				0x1a0
+#define MT8195_VPP1_HW_DCM_2ND_DIS1				0x1b0
+#define MT8195_SVPP2_BUF_BF_RSZ_SWITCH				0xf48
+#define MT8195_SVPP3_BUF_BF_RSZ_SWITCH				0xf74
+
+/* VPPSYS1 HW DCM client*/
+#define MT8195_SVPP1_MDP_RSZ					BIT(25)
+#define MT8195_SVPP2_MDP_RSZ					BIT(4)
+#define MT8195_SVPP3_MDP_RSZ					BIT(5)
+
 static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 176fdc866e22..ccbd456b9e56 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -183,6 +183,48 @@ void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
 
+void mtk_mmsys_vpp_rsz_merge_config(struct device *dev, u32 id, bool enable)
+{
+	u32 reg;
+
+	switch (id) {
+	case 2:
+		reg = MT8195_SVPP2_BUF_BF_RSZ_SWITCH;
+		break;
+	case 3:
+		reg = MT8195_SVPP3_BUF_BF_RSZ_SWITCH;
+		break;
+	default:
+		dev_err(dev, "Invalid id %d\n", id);
+		return;
+	}
+
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), reg, ~0, enable);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_vpp_rsz_merge_config);
+
+void mtk_mmsys_vpp_rsz_dcm_config(struct device *dev, bool enable)
+{
+	u32 client;
+
+	client = MT8195_SVPP1_MDP_RSZ;
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_1ST_DIS0, client,
+			      ((enable) ? client : 0));
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_2ND_DIS0, client,
+			      ((enable) ? client : 0));
+
+	client = MT8195_SVPP2_MDP_RSZ | MT8195_SVPP3_MDP_RSZ;
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_1ST_DIS1, client,
+			      ((enable) ? client : 0));
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_2ND_DIS1, client,
+			      ((enable) ? client : 0));
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_vpp_rsz_dcm_config);
+
 static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
 				  bool assert)
 {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index b85f66db33e1..5ed593cccfe6 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -74,4 +74,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
 
+void mtk_mmsys_vpp_rsz_merge_config(struct device *dev, u32 id, bool enable);
+
+void mtk_mmsys_vpp_rsz_dcm_config(struct device *dev, bool enable);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


