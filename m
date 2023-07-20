Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8F5EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 08:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3Ef2HXAMqtZCcHsQB0m7y6VJp+SmT8fZ8z5MnEgAEo=; b=DubALbCd7ELlBHrD0iSKGnsOt5
	VG092JewZRKpsS+pbRXEKW6wh9MVZoo50KtCXA3E0eccwC5QF7JsXtIg0l1Ji31ZT+H1V1+5zf9wl
	rznsm7Fj/ZdzsdPMhNni+rbDBhooiyxHMWSDR0PbAa+kUQzEmMUEZoCaacwuMcG7WQW07s/S9/S4Y
	25i0gPl1nbEcJusd2bpm2GdhaEdAINN/5n8WgRh1QBtQ55peJtoy7YNiYhLe1koLPgargdm40072F
	F3Sx9CzPDWdIZdLjO1GVpidxiT4QA3BuuORgMtBLuNW1IBpLTOySR2ye2dqlcIc/0D84+OkKIoGlQ
	HbNxv8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOzD-00AIhK-0X;
	Thu, 20 Jul 2023 08:26:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOzA-00AIfb-1g;
	Thu, 20 Jul 2023 08:26:10 +0000
X-UUID: 0f151d0826d711ee83ed1395ce914268-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=x3Ef2HXAMqtZCcHsQB0m7y6VJp+SmT8fZ8z5MnEgAEo=;
	b=myAoEOP6zzVpJrsuN0V6Rj6/JaKVz7fURFpK9Ifj58uLnwbfPZ4rgOgfKbiH4Q9g8KfRzhRC3z3oVaqn2Vs6OhZpxBowGzfFpsxjbGvkQy3C21P+FqUjs4ksQzvuo3mqHoKVdsmYH/tOcHV/tvVcYZbddE91WZbbNWDFUhzfJMs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:9412529e-3ecd-4bd8-a140-a65cb66902b7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:176cd25,CLOUDID:0e3ad0dc-dc79-4898-9235-1134b97257a8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0f151d0826d711ee83ed1395ce914268-20230720
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 459321583; Thu, 20 Jul 2023 01:26:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 20 Jul 2023 16:25:58 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 20 Jul 2023 16:25:57 +0800
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
Subject: [PATCH v3,3/3] drm/mediatek: dp: Add the audio divider to mtk_dp_data struct
Date: Thu, 20 Jul 2023 16:26:04 +0800
Message-ID: <20230720082604.18618-4-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720082604.18618-1-shuijing.li@mediatek.com>
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_012608_563449_17F7B725 
X-CRM114-Status: GOOD (  15.43  )
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

Due to the difference of HW, different dividers need to be set.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
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
 drivers/gpu/drm/mediatek/mtk_dp.c     | 7 ++++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8cda83d6fef..8e1a13ab2ba2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -140,6 +140,7 @@ struct mtk_dp_data {
 	const struct mtk_dp_efuse_fmt *efuse_fmt;
 	bool audio_supported;
 	bool audio_pkt_in_hblank_area;
+	u16 audio_m_div2_bit;
 };
 
 static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -648,7 +649,7 @@ static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
 static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
-			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+			   mtk_dp->data->audio_m_div2_bit,
 			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
 }
 
@@ -2636,6 +2637,7 @@ static const struct mtk_dp_data mt8188_edp_data = {
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
 	.audio_pkt_in_hblank_area = false,
+	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
 };
 
 static const struct mtk_dp_data mt8188_dp_data = {
@@ -2644,6 +2646,7 @@ static const struct mtk_dp_data mt8188_dp_data = {
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = true,
+	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
 };
 
 static const struct mtk_dp_data mt8195_edp_data = {
@@ -2652,6 +2655,7 @@ static const struct mtk_dp_data mt8195_edp_data = {
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
 	.audio_pkt_in_hblank_area = false,
+	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
@@ -2660,6 +2664,7 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = false,
+	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index f38d6ff12afe..6d7f0405867e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -162,6 +162,7 @@
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8	(3 << 8)
+#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(4 << 8)
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(5 << 8)
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4	(6 << 8)
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8	(7 << 8)
-- 
2.40.1


