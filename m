Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+V8sfMBZJa5jiNTGWdSqG/x/BaU6kQMcAHV01l2cyI=; b=FB6a1ER1ItiGCsZoK01eFDeIWN
	bor7onwz1337QDCf2zK1jw4NFhNFyzIuKGSwV/BMyWMZZcAiTkcfvlNp+7Jm7uSTFmmr9yiPsXq+F
	Dd2wRXY5BCkIlpofyWA255cMcTs+yKV1DhG8er8GWkDBaxO0caSN2ooqWyiuZGesp4gpkdB9ANPIa
	2eB04VTAMW0Te0VUhjKC/Z2On+IvdMGytYrrQN4IoyGYnv5Jtf6lo8P16W5QpfESn/KGXHtluaFHh
	WqXc2KPGSncZRnKEW7GHRMPtVkytVnSPCspQIAzs3pK7wJWGwySEOf6WLzHic95crK4c6R26nkIxQ
	/184XKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offFU-009NEV-8i; Tue, 04 Oct 2022 10:34:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offFR-009NDk-CQ; Tue, 04 Oct 2022 10:34:02 +0000
X-UUID: 80a9bc7c9910423f95746e488bf49168-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l+V8sfMBZJa5jiNTGWdSqG/x/BaU6kQMcAHV01l2cyI=;
	b=fGSDHgOP0mMYOyMprCqG0otmYImEdH5yiY+mGEMKGEKzyJiQiIh4cYChSBYpprBfsbaSSGb7yZ05DL4gAheDaBp6GgV8JzXsNFNkYW7YGbDboD1MCSRQeVdmsgf3PAF5SYROr+GQnpg2XJCE9i/YulkRgBJp6NYjGmKPrvEwb44=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2bb720a7-bfa9-4eb0-8e57-d566967d7140,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:451e78b8-daef-48a8-8c50-40026d6a74c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 80a9bc7c9910423f95746e488bf49168-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 46679534; Tue, 04 Oct 2022 03:33:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 17:33:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 4 Oct 2022 17:33:21 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>
Subject: [PATCH v1 4/6] soc: mediatek: mmsys: add config api for RSZ switching and DCM
Date: Tue, 4 Oct 2022 17:33:17 +0800
Message-ID: <20221004093319.5069-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221004093319.5069-1-moudy.ho@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_033401_446575_BA15FAFF 
X-CRM114-Status: GOOD (  12.66  )
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
---
 drivers/soc/mediatek/mt8195-mmsys.h    |  8 ++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 40 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  4 +++
 3 files changed, 52 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index abfe94a30248..e0cf13d09763 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -75,6 +75,14 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+/* VPPSYS1 */
+#define MT8195_SVPP1_HW_DCM_1ST_DIS0				0x150
+#define MT8195_SVPP1_HW_DCM_1ST_DIS1				0x160
+#define MT8195_SVPP1_HW_DCM_2ND_DIS0				0x1a0
+#define MT8195_SVPP1_HW_DCM_2ND_DIS1				0x1b0
+#define MT8195_SVPP2_BUF_BF_RSZ_SWITCH				0xf48
+#define MT8195_SVPP3_BUF_BF_RSZ_SWITCH				0xf74
+
 static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index c4d15f99f853..c98cfcb7db38 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -261,6 +261,46 @@ void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
 
+void mtk_mmsys_merge_config(struct device *dev, u32 id, bool enable)
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
+EXPORT_SYMBOL_GPL(mtk_mmsys_merge_config);
+
+void mtk_mmsys_rsz_dcm_config(struct device *dev, bool enable)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = BIT(25);
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_SVPP1_HW_DCM_1ST_DIS0, BIT(25), val);
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_SVPP1_HW_DCM_2ND_DIS0, BIT(25), val);
+
+	if (enable)
+		val = (BIT(4) | BIT(5));
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_SVPP1_HW_DCM_1ST_DIS1, (BIT(4) | BIT(5)), val);
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_SVPP1_HW_DCM_2ND_DIS1, (BIT(4) | BIT(5)), val);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_rsz_dcm_config);
+
 static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
 				  bool assert)
 {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index d2b02bb43768..2d5c7fe920b0 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -67,4 +67,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
 
+void mtk_mmsys_merge_config(struct device *dev, u32 id, bool enable);
+
+void mtk_mmsys_rsz_dcm_config(struct device *dev, bool enable);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


