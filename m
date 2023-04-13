Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382DFC77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 04:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KOKcXA4BrgWj4MAEjaQanirD/sgJJEqHU3KajlNX+A=; b=oynZi3swdlqVwZMjaKBl7mjONP
	X0oIERg95pStSKnzP5B9+FbhJxkz882SG6CFcYSrz1YACQDZAl5g9atLqnC7Qauu9ZCxNnffXdwOb
	FLAseWywC0flpd2Ny1nifbWv6OubWrQNWWkJIPpg04LUuG+VHCPy1vJoK22yYJ5cynYRKrQqUUIQl
	KhKBqqYEOj/V2LZTZKZyA88PGBZNKqDmlDgX7g7mn0XXYg4EPyqVXkMbDnfEL57Vs1viGejeomAOK
	caL+ZnFRWfSsCvTNnklM7QMRZNDvaEn2Wj+DFdxhTQsyX8Ho49iRSTbU4L8QWt1HdDZCreafk40GA
	LFP+xASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmoXz-004zxV-1V;
	Thu, 13 Apr 2023 04:26:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmoXv-004zx3-32;
	Thu, 13 Apr 2023 04:26:57 +0000
X-UUID: 6819d81ad9b311edb7d8d11f642b8e78-20230412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3KOKcXA4BrgWj4MAEjaQanirD/sgJJEqHU3KajlNX+A=;
	b=KfV6nqa5P2i7gf9Od3z6U6XlRJMWR+LK8OeO/yeB7ZgWt4GVYPTrP7sUFTDCxJPJSBJQtOyX1wfN7VUNIUm/KeQOEUtRd+yT4x1fHuEIOmk2rfO65Lz6CPnBcJvnyEsNYzU56aukqT14jNlDLB81Wk/e3nll1VdYqHY5k5nJjsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e17f1cee-05e8-4bb1-ab4d-eab2f81fea86,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:d342cdea-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 6819d81ad9b311edb7d8d11f642b8e78-20230412
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 138846952; Wed, 12 Apr 2023 21:26:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 12:06:45 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 12:06:45 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH 2/2] drm/mediatek: dp: Add the audio control to mtk_dp_data struct
Date: Thu, 13 Apr 2023 12:06:25 +0800
Message-ID: <1681358785-6930-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1681358785-6930-1-git-send-email-xinlei.lee@mediatek.com>
References: <1681358785-6930-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_212656_018789_24F3FDA1 
X-CRM114-Status: GOOD (  14.77  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Mainly add the following two flag:

1.The audio packet arrangement function is to only arrange audio
packets into the Hblanking area. In order to align with the HW
default setting of g1200, this function needs to be turned off.

2.Due to the difference of HW, different dividers need to be set.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 32 ++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  5 +++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 767b71da31a4..65a9984eac81 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -139,6 +139,8 @@ struct mtk_dp_data {
 	unsigned int smc_cmd;
 	const struct mtk_dp_efuse_fmt *efuse_fmt;
 	bool audio_supported;
+	const bool arrange;
+	const u8 audio_m_div2;
 };
 
 static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -646,8 +648,10 @@ static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
 
 static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
 {
+	u8 div2_id = mtk_dp->data->audio_m_div2;
+
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
-			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+			   div2_id << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT,
 			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
 }
 
@@ -1362,6 +1366,14 @@ static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
 			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
 }
 
+static void mtk_dp_audio_sample_arrange(struct mtk_dp *mtk_dp)
+{
+	if (mtk_dp->data->arrange) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0, BIT(12));
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0, 0xFFF);
+	}
+}
+
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 {
 	u32 sram_read_start = min_t(u32, MTK_DP_TBC_BUF_READ_START_ADDR,
@@ -1371,6 +1383,7 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 				    MTK_DP_PIX_PER_ADDR);
 	mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
 	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_audio_sample_arrange(mtk_dp);
 	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
 	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
 }
@@ -2615,11 +2628,22 @@ static int mtk_dp_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
+static const struct mtk_dp_data mt8188_dp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
+	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
+	.efuse_fmt = mt8195_dp_efuse_fmt,
+	.audio_supported = true,
+	.arrange = true,
+	.audio_m_div2 = 4,
+};
+
 static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
 	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
+	.arrange = false,
+	.audio_m_div2 = 5,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
@@ -2627,9 +2651,15 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
+	.arrange = false,
+	.audio_m_div2 = 5,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
+	{
+		.compatible = "mediatek,mt8188-dp-tx",
+		.data = &mt8188_dp_data,
+	},
 	{
 		.compatible = "mediatek,mt8195-edp-tx",
 		.data = &mt8195_edp_data,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 84e38cef03c2..4dc4f7cd0ef2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -158,6 +158,7 @@
 #define MTK_DP_ENC0_P0_30A8			0x30a8
 #define MTK_DP_ENC0_P0_30BC			0x30bc
 #define ISRC_CONT_DP_ENC0_P0				BIT(0)
+#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT	8
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK	GENMASK(10, 8)
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
@@ -228,6 +229,10 @@
 							 VIDEO_STABLE_CNT_THRD_DP_ENC1_P0 | \
 							 SDP_DP13_EN_DP_ENC1_P0 | \
 							 BS2BS_MODE_DP_ENC1_P0)
+
+#define MTK_DP_ENC1_P0_3374			0x3374
+#define AU_ASP_PACKET_ONLY_IN_HBLANK_ENABLE_MASK	0x1000
+
 #define MTK_DP_ENC1_P0_33F4			0x33f4
 #define DP_ENC_DUMMY_RW_1_AUDIO_RST_EN			BIT(0)
 #define DP_ENC_DUMMY_RW_1				BIT(9)
-- 
2.18.0


