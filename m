Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518B2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAh1+b0aWwKlv1gOD+byd+smabRnKNvPLpWyK90XuV8=; b=x9/gFI6nfpiWyJXnavyNold+io
	QOsVIT444qP47m2WVpLyA3vUgh2MIRHC6a8xOH6Wv+XQy9jGa5d88j7s2cRUT0OpOaYhJglSxdFrf
	Vzvae/81t5LCl054qXWfWcGoGLjpKwqk+SO9bEkZy3mW6s9f9jy9lBj0KUgX7KGdHZs2H3L/Qz4Ep
	zDV3Pc7dIRMXS2z6MfAQGNZ/QGu1UbQdepiwteS7OsQS+dlzoVlnalievr/cxGLEUllWHelJGDzo/
	nNVpx7skUQMyEuB2MYv1UofYvJkUB3m1jZfXgwITFNBGv7HY+NXgTySm06xpupMQC+q+T7KWJr+Nk
	6EfmA7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5jmU-00GePn-2q; Mon, 27 Jun 2022 08:07:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5jl2-00GdXg-Td; Mon, 27 Jun 2022 08:06:11 +0000
X-UUID: 3b930b92fed04b0aa2d2143d1da8efca-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:16f146b2-ffe9-48c6-b65e-af5a1806db1f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:d49ca7d8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3b930b92fed04b0aa2d2143d1da8efca-20220627
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 951313602; Mon, 27 Jun 2022 01:06:01 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 01:03:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 16:03:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 27 Jun 2022 16:03:44 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v12 10/10] drm/mediatek: fix no audio when resolution change
Date: Mon, 27 Jun 2022 16:03:41 +0800
Message-ID: <20220627080341.5087-11-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_010609_038094_AC93B804 
X-CRM114-Status: GOOD (  15.71  )
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

When switching resolutions, config the audio setting with the
previous audio parameters.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 55 ++++++++++---------------------
 1 file changed, 18 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 62a9ebadd2a8..ab98b962c17c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -109,7 +109,7 @@ struct mtk_dp_audio_cfg {
 struct mtk_dp_info {
 	u32 depth;
 	enum dp_pixelformat format;
-	struct mtk_dp_audio_cfg audio_caps;
+	struct mtk_dp_audio_cfg audio_cur_cfg;
 	struct mtk_dp_timings timings;
 };
 
@@ -1921,9 +1921,7 @@ static bool mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
 						 struct mtk_dp_audio_cfg *cfg)
 {
 	struct cea_sad *sads;
-	int sad_count;
-	int i;
-	bool ret = false;
+	int ret;
 
 	if (mtk_dp_is_edp(mtk_dp))
 		return false;
@@ -1934,36 +1932,16 @@ static bool mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
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
-		sample_rate = drm_cea_sad_get_sample_rate(&sads[i]);
-		word_length =
-			drm_cea_sad_get_uncompressed_word_length(&sads[i]);
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
@@ -2129,14 +2107,15 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
 
 			mtk_dp->audio_enable =
 				mtk_dp_edid_parse_audio_capabilities(mtk_dp,
-								     &mtk_dp->info.audio_caps);
+								     &mtk_dp->info.audio_cur_cfg);
 
 			if (mtk_dp->audio_enable) {
-				mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_caps);
+				mtk_dp_audio_setup(mtk_dp,
+						   &mtk_dp->info.audio_cur_cfg);
 				mtk_dp_audio_mute(mtk_dp, false);
 			} else {
-				memset(&mtk_dp->info.audio_caps, 0,
-				       sizeof(mtk_dp->info.audio_caps));
+				memset(&mtk_dp->info.audio_cur_cfg, 0,
+				       sizeof(mtk_dp->info.audio_cur_cfg));
 			}
 
 			training_done = true;
@@ -2590,6 +2569,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (mtk_dp_plug_state(mtk_dp)) {
 		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
 		usleep_range(2000, 3000);
+	} else {
+		memset(&mtk_dp->info.audio_cur_cfg, 0,
+		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
 	mtk_dp_video_mute(mtk_dp, true);
@@ -2799,18 +2781,17 @@ static int mtk_dp_audio_hw_params(struct device *dev, void *data,
 				  struct hdmi_codec_params *params)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
-	struct mtk_dp_audio_cfg cfg;
 
 	if (!mtk_dp->enabled) {
 		pr_err("%s, DP is not ready!\n", __func__);
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


