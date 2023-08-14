Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B48C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CuFnml3SXfeqNSp/RSLbaS/g3QFSfZKRb3EZz94OcM=; b=kZTLNOAIshl/USGspUgE5144s3
	COZ2a/WanDnMCYCpu6cqoLwrlQY8cbgVfECEP7W4NLu0S1XUA8SB9efFx5+xiTiklFN6hwgPh68IP
	ePISFqJvTi5f5WUeh3D3gH6xN1OgemOq+5kXJc3Lkv+7dUvre4i5qxHtwWEk1DDqvemAwVrhcCB8m
	Gk+7YlXPItf4cG8HjvfvnL6QRMhfSvbwk23lDNYMqgvJqHXrvQoDQRX8xY1FzENaNBPDgM3/GpSbU
	3ALAXbDYKXQNIn8g2gUdHCkMvAyrCYFv6TT3rlszhArTxp09J5LIqxWarUH7ufuRz3ZCeJdSSXznz
	6RhwZFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSJf-00GPYt-05;
	Mon, 14 Aug 2023 07:48:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSJb-00GPY1-3B;
	Mon, 14 Aug 2023 07:48:41 +0000
X-UUID: f9d22b3a3a7611ee912e1518a6540028-20230814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4CuFnml3SXfeqNSp/RSLbaS/g3QFSfZKRb3EZz94OcM=;
	b=BfE7bflhTDkPZNyV1xQ7xUhlWdUhZKOmhogBB0uHWYRPutcXP8ysHtwROOUZRz9Cib0t7bvZCrNiQzXEho9oZ3v8DjWA0UpApdlw+DY0a8FDtKxSxh1lVGIvFawZkvUmFU07lbKvTDJJfs46nEkAQ4KTrzDbv9U9Lcn94XjYHyo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:c1ddc320-95b2-4a3e-9aa3-0fbc3eef086a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:d745d3c1-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f9d22b3a3a7611ee912e1518a6540028-20230814
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 173746776; Mon, 14 Aug 2023 00:48:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Aug 2023 15:28:33 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Aug 2023 15:28:32 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>
Subject: [PATCH v4,2/3] drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
Date: Mon, 14 Aug 2023 15:28:41 +0800
Message-ID: <20230814072842.28597-3-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230814072842.28597-1-shuijing.li@mediatek.com>
References: <20230814072842.28597-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_004840_030614_54E80EE2 
X-CRM114-Status: GOOD (  16.74  )
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

The audio packet arrangement function is to only arrange audio.
packets into the Hblanking area. In order to align with the HW
default setting of mt8195, this function needs to be turned off.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
Changes in v4:
drop mt8188_edp_data and remove unnecessary modification.
per suggestion from the previous thread:
https://lore.kernel.org/all/bddb1a1a445ead85056202c355627698051f12c9.camel@mediatek.com/
Changes in v3:
Separate these two things into two different patches.
per suggestion from the previous thread:
https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
Changes in v2:
- change the variables' name to be more descriptive
- add a comment that describes the function of mtk_dp_audio_sample_arrange
- reduce indentation by doing the inverse check
- add a definition of some bits
- add support for mediatek, mt8188-edp-tx
per suggestion from the previous thread:
https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  5 +++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 64eee77452c0..75af6de7bc42 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -139,6 +139,7 @@ struct mtk_dp_data {
 	unsigned int smc_cmd;
 	const struct mtk_dp_efuse_fmt *efuse_fmt;
 	bool audio_supported;
+	bool audio_pkt_in_hblank_area;
 };
 
 static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -1362,6 +1363,18 @@ static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
 			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
 }
 
+static void mtk_dp_audio_sample_arrange(struct mtk_dp *mtk_dp)
+{
+	/* arrange audio packets into the Hblanking and Vblanking area */
+	if (!mtk_dp->data->audio_pkt_in_hblank_area)
+		return;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0,
+			   SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0,
+			   SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK);
+}
+
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 {
 	u32 sram_read_start = min_t(u32, MTK_DP_TBC_BUF_READ_START_ADDR,
@@ -1371,6 +1384,7 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 				    MTK_DP_PIX_PER_ADDR);
 	mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
 	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_audio_sample_arrange(mtk_dp);
 	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
 	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
 }
@@ -2616,6 +2630,14 @@ static int mtk_dp_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
+static const struct mtk_dp_data mt8188_dp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
+	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
+	.efuse_fmt = mt8195_dp_efuse_fmt,
+	.audio_supported = true,
+	.audio_pkt_in_hblank_area = true,
+};
+
 static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
 	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
@@ -2631,6 +2653,14 @@ static const struct mtk_dp_data mt8195_dp_data = {
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
+	{
+		.compatible = "mediatek,mt8188-edp-tx",
+		.data = &mt8195_edp_data,
+	},
+	{
+		.compatible = "mediatek,mt8188-dp-tx",
+		.data = &mt8188_dp_data,
+	},
 	{
 		.compatible = "mediatek,mt8195-edp-tx",
 		.data = &mt8195_edp_data,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 84e38cef03c2..f38d6ff12afe 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -228,6 +228,11 @@
 							 VIDEO_STABLE_CNT_THRD_DP_ENC1_P0 | \
 							 SDP_DP13_EN_DP_ENC1_P0 | \
 							 BS2BS_MODE_DP_ENC1_P0)
+
+#define MTK_DP_ENC1_P0_3374			0x3374
+#define SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK	BIT(12)
+#define SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK		GENMASK(11, 0)
+
 #define MTK_DP_ENC1_P0_33F4			0x33f4
 #define DP_ENC_DUMMY_RW_1_AUDIO_RST_EN			BIT(0)
 #define DP_ENC_DUMMY_RW_1				BIT(9)
-- 
2.40.1


