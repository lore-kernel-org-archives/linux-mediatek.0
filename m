Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A027C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGX6YzjigDRiefwq1x9TnO0pG3WTYmLcs7/JWY07XCk=; b=do2exKfKKESqGgrcJuq15FS5G6
	Aov6izW7W9ytX8T4pPCu1vRqewvRNM/xl4ij4QtE+lSyvoLc35eYos9GargKDjl+fowfaCAP/q9CU
	5+E1ouUNkuRLWHSI9tU09awsrBUoTYMS2kcjryalL72q4d+XxMBEkPrhgEkpexCFDJ6kmMOmssyQa
	8f3kIJYPSiNAetZAhnXTAvaUjwC7iExwwOMFJcMU1qr8jBpopFyNeRSCdIcHe9T84Vstbraj+HlMe
	Zz91b4y2GguGEWgVEKKQGZBnUPJh5c+1+3/+mzJ/mUouzEGYU4fNK66B4YiGUcmJp0tkIZgEmFOrs
	kd455OQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJuNH-00Dz8w-RM; Fri, 05 Aug 2022 10:16:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJuMl-00DynH-SD; Fri, 05 Aug 2022 10:15:42 +0000
X-UUID: 5ef89c5863d64806b646935d3210e625-20220805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:724845a8-330b-4aea-965b-a3d74c866c3a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:d014e19b-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5ef89c5863d64806b646935d3210e625-20220805
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 889709598; Fri, 05 Aug 2022 03:15:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 5 Aug 2022 18:15:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Aug 2022 18:15:00 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v16 8/8] drm/mediatek: Use cached audio config when changing resolution
Date: Fri, 5 Aug 2022 18:14:59 +0800
Message-ID: <20220805101459.3386-9-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_031539_997669_E1395F05 
X-CRM114-Status: GOOD (  16.93  )
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

When the audio is playing, we need to use the original configuration to
set the audio instead of using new configuration. Therefore, use the
cached audio configuration during a resolution switch to avoid loss of
sound.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 108 +++++-------------------------
 1 file changed, 17 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 3efac9920304..e725e3104147 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -45,18 +45,6 @@
 #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
 #define MTK_DP_VERSION 0x11
 
-#define MTK_DP_CEA_SAD_FREQ_32KHZ  BIT(0)
-#define MTK_DP_CEA_SAD_FREQ_44KHZ  BIT(1)
-#define MTK_DP_CEA_SAD_FREQ_48KHZ  BIT(2)
-#define MTK_DP_CEA_SAD_FREQ_88KHZ  BIT(3)
-#define MTK_DP_CEA_SAD_FREQ_96KHZ  BIT(4)
-#define MTK_DP_CEA_SAD_FREQ_176KHZ BIT(5)
-#define MTK_DP_CEA_SAD_FREQ_192KHZ BIT(6)
-
-#define MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
-#define MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
-#define MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
-
 struct mtk_dp_train_info {
 	bool tps3;
 	bool tps4;
@@ -106,7 +94,7 @@ struct mtk_dp_info {
 	struct videomode vm;
 	u8 frame_rate;
 	u32 pix_rate_khz;
-	struct mtk_dp_audio_cfg audio_caps;
+	struct mtk_dp_audio_cfg audio_cur_cfg;
 };
 
 struct dp_cal_data {
@@ -413,48 +401,6 @@ static void mtk_dp_pg_enable(struct mtk_dp *mtk_dp, bool enable)
 			   4 << PGEN_PATTERN_SEL_SHIFT, PGEN_PATTERN_SEL_MASK);
 }
 
-static int mtk_dp_cea_sad_get_sample_rate(const struct cea_sad *sad)
-{
-	switch (sad->freq) {
-	case MTK_DP_CEA_SAD_FREQ_32KHZ:
-		return 32000;
-	case MTK_DP_CEA_SAD_FREQ_44KHZ:
-		return 44100;
-	case MTK_DP_CEA_SAD_FREQ_48KHZ:
-		return 48000;
-	case MTK_DP_CEA_SAD_FREQ_88KHZ:
-		return 88200;
-	case MTK_DP_CEA_SAD_FREQ_96KHZ:
-		return 96000;
-	case MTK_DP_CEA_SAD_FREQ_176KHZ:
-		return 176400;
-	case MTK_DP_CEA_SAD_FREQ_192KHZ:
-		return 192000;
-	default:
-		return -EINVAL;
-	}
-}
-
-static int mtk_dp_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
-{
-	if (sad->format != HDMI_AUDIO_CODING_TYPE_PCM) {
-		pr_err("Unable to get the uncompressed word length for format: %u\n",
-		       sad->format);
-		return -EINVAL;
-	}
-
-	switch (sad->byte2) {
-	case MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
-		return 16;
-	case MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
-		return 20;
-	case MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
-		return 24;
-	default:
-		return -EINVAL;
-	}
-}
-
 static void mtk_dp_audio_setup_channels(struct mtk_dp *mtk_dp,
 					struct mtk_dp_audio_cfg *cfg)
 {
@@ -1859,9 +1805,7 @@ static bool mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
 						 struct mtk_dp_audio_cfg *cfg)
 {
 	struct cea_sad *sads;
-	int sad_count;
-	int i;
-	bool ret = false;
+	int ret;
 
 	if (!mtk_dp->data->audio_supported)
 		return false;
@@ -1872,36 +1816,16 @@ static bool mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
 		dev_err(mtk_dp->dev, "EDID not found!\n");
 		return false;
 	}
-	sad_count = drm_edid_to_sad(mtk_dp->edid, &sads);
-	mutex_unlock(&mtk_dp->edid_lock);
 
-	if (sad_count <= 0) {
+	ret = drm_edid_to_sad(mtk_dp->edid, &sads);
+	mutex_unlock(&mtk_dp->edid_lock);
+	if (ret <= 0) {
 		drm_info(mtk_dp->drm_dev, "The SADs is NULL\n");
 		return false;
 	}
-
-	for (i = 0; i < sad_count; i++) {
-		int sample_rate, word_length;
-
-		/* Only PCM supported at the moment */
-		if (sads[i].format != HDMI_AUDIO_CODING_TYPE_PCM)
-			continue;
-
-		sample_rate = mtk_dp_cea_sad_get_sample_rate(&sads[i]);
-		word_length =
-			mtk_dp_cea_sad_get_uncompressed_word_length(&sads[i]);
-		if (sample_rate <= 0 || word_length <= 0)
-			continue;
-
-		cfg->channels = sads[i].channels;
-		cfg->word_length_bits = word_length;
-		cfg->sample_rate = sample_rate;
-		ret = true;
-		break;
-	}
 	kfree(sads);
 
-	return ret;
+	return true;
 }
 
 static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
@@ -2070,13 +1994,13 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
 
 	mtk_dp->audio_enable =
 		mtk_dp_edid_parse_audio_capabilities(mtk_dp,
-						     &mtk_dp->info.audio_caps);
+						     &mtk_dp->info.audio_cur_cfg);
 	if (mtk_dp->audio_enable) {
-		mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_caps);
+		mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_cur_cfg);
 		mtk_dp_audio_mute(mtk_dp, false);
 	} else {
-		memset(&mtk_dp->info.audio_caps, 0,
-		       sizeof(mtk_dp->info.audio_caps));
+		memset(&mtk_dp->info.audio_cur_cfg, 0,
+		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
 	return 0;
@@ -2442,6 +2366,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (mtk_dp_plug_state(mtk_dp)) {
 		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
 		usleep_range(2000, 3000);
+	} else {
+		memset(&mtk_dp->info.audio_cur_cfg, 0,
+		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
 	mtk_dp_video_mute(mtk_dp, true);
@@ -2641,18 +2568,17 @@ static int mtk_dp_audio_hw_params(struct device *dev, void *data,
 				  struct hdmi_codec_params *params)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
-	struct mtk_dp_audio_cfg cfg;
 
 	if (!mtk_dp->enabled) {
 		dev_err(mtk_dp->dev, "%s, DP is not ready!\n", __func__);
 		return -ENODEV;
 	}
 
-	cfg.channels = params->cea.channels;
-	cfg.sample_rate = params->sample_rate;
-	cfg.word_length_bits = 24;
+	mtk_dp->info.audio_cur_cfg.channels = params->cea.channels;
+	mtk_dp->info.audio_cur_cfg.sample_rate = params->sample_rate;
+	mtk_dp->info.audio_cur_cfg.word_length_bits = 24;
 
-	mtk_dp_audio_setup(mtk_dp, &cfg);
+	mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_cur_cfg);
 
 	return 0;
 }
-- 
2.18.0


