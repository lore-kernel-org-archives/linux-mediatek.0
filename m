Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E6C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRljXjqyz5NPt+iz5BiVDnULw90BpAIXYfz8W1R3vsk=; b=nazmSwIvH3Na3VTXdzgLG15mpx
	SFgR6fTHma3X2QgBykUjPeKR0cy+kdFED0tbUsycPmv2bjDMroQxRn2PIQuDMwPtbV+xhyXwtNVkC
	bJQFCpivit41/rTuv/1RsOCgOYOUciJLyyFiQCzj3vp0Jaids7ndSTNuFgmZSoyEQYl/ykbqMvF8B
	SWOOtGwhAmPzf4Kc/FJMuvnPi95g0fm6uMoCIsrUyjiqLpIzhezQU+8K2k0+f0xZ2xn/JuUBKTIso
	gbFR8PssfEmBUEt0J4u+Q5qZqd2uPjEuDKTdEqrw74nlT/p8u9c4LE8rA5sAa8/8vAE7vT9m+XvKU
	CKe5KC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxXb-007njg-7S; Mon, 06 Feb 2023 09:11:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxX4-007nVY-8T; Mon, 06 Feb 2023 09:11:27 +0000
X-UUID: 34f28aeca5fe11edbbe3f76fe852e059-20230206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fRljXjqyz5NPt+iz5BiVDnULw90BpAIXYfz8W1R3vsk=;
	b=iXFNqWdj0HfqHMuaG4NiZQRhlL2DdOS6LzhTw2n9g4UyTuTs32iFNeN+rxr2U+1lXc4wd7US37+aFyvSn239uRq16p7js0vzGcHsJ61Uv7yulSzHjrJPAj2MNAPVRQerfX7E+r+AKG0dLKoZjdnkI/dkqavgtG6KhsgyNJsbkHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:2e4d0913-dc64-43a9-a9b2-e50eba4cb2c7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:885ddb2,CLOUDID:246c6f56-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 34f28aeca5fe11edbbe3f76fe852e059-20230206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 757477503; Mon, 06 Feb 2023 02:11:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 6 Feb 2023 17:11:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 6 Feb 2023 17:11:10 +0800
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
Subject: [PATCH v7 4/6] soc: mediatek: mmsys: add config api for RSZ switching and DCM
Date: Mon, 6 Feb 2023 17:11:07 +0800
Message-ID: <20230206091109.1324-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230206091109.1324-1-moudy.ho@mediatek.com>
References: <20230206091109.1324-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_011126_338957_18E5075C 
X-CRM114-Status: GOOD (  11.15  )
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
Change-Id: I41978bf14951221c88abbe70d8c24cb0770e11e3
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 13 ++++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 44 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  6 ++++
 3 files changed, 63 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index a6652ae63431..9be2df2832a4 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -146,6 +146,19 @@
 #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
 #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
 
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
index eb4c7e57896c..fd2b37d451c8 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -242,6 +242,50 @@ void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
 
+void mtk_mmsys_vpp_rsz_merge_config(struct device *dev, u32 id, bool enable,
+				    struct cmdq_pkt *cmdq_pkt)
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
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), reg, ~0, enable, cmdq_pkt);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_vpp_rsz_merge_config);
+
+void mtk_mmsys_vpp_rsz_dcm_config(struct device *dev, bool enable,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	u32 client;
+
+	client = MT8195_SVPP1_MDP_RSZ;
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_1ST_DIS0, client,
+			      ((enable) ? client : 0), cmdq_pkt);
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_2ND_DIS0, client,
+			      ((enable) ? client : 0), cmdq_pkt);
+
+	client = MT8195_SVPP2_MDP_RSZ | MT8195_SVPP3_MDP_RSZ;
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_1ST_DIS1, client,
+			      ((enable) ? client : 0), cmdq_pkt);
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_2ND_DIS1, client,
+			      ((enable) ? client : 0), cmdq_pkt);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_vpp_rsz_dcm_config);
+
 static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
 				  bool assert)
 {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index dc2963a0a0f7..37544ea6286d 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -99,4 +99,10 @@ void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16
 void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
 				     struct cmdq_pkt *cmdq_pkt);
 
+void mtk_mmsys_vpp_rsz_merge_config(struct device *dev, u32 id, bool enable,
+				    struct cmdq_pkt *cmdq_pkt);
+
+void mtk_mmsys_vpp_rsz_dcm_config(struct device *dev, bool enable,
+				  struct cmdq_pkt *cmdq_pkt);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


