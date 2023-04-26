Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A48AC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 06:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoT9X6J7wsyZip+r6sFgd43MCfrubxjY09AMi8u1NjI=; b=WY+gnQu0Tv0EdbwG7233cIyQhc
	28Dt5wEathUtmkq6OzZvzDRTbqCL8sfcQ8Mxp4u5//bfjGZaeOtx1bQb31OxJpV/bC8m2ocX32uAN
	LjslV+2aZu33JTCJ7fkMddziz3Ow2kH4cFUv4aRiTl1fpxBe0TsxFm5+uRTuXi655aeO21LF9RMd2
	f4arNoLBzHqL6EhmhEtQv8doIrijDSQlFSjwVaeQbGMEgyVqKXpD3jk9x4YUsg0oRp5JIa9KFScJ4
	J+x8+/BLLP895LtSVd2wtNyN0qma5kJlGXC0J8wt2TkPmKSqj35RhnERFBP9ZCEJljNRb21JRHLdL
	GONIBnNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prYEC-002tKU-2W;
	Wed, 26 Apr 2023 06:02:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prYE8-002tJb-1u;
	Wed, 26 Apr 2023 06:02:05 +0000
X-UUID: dcaa28e4e3f711ed8687db9d93187ff1-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GoT9X6J7wsyZip+r6sFgd43MCfrubxjY09AMi8u1NjI=;
	b=GU5k0JpGKuvQNTyN7r6zlhLOTxhzDX8/sutr/CW1bDp1/bKnw7eROYbwI6ZqgXfYJVfGn8zkjkZCSxphLs+2eH4mnpROXU3yLeD11fH62NhZaOezzOTJFl0mbPze8RXKsDMXG4ZlicjbUV4msub9dRcNZtO5hiNzLIClKfohifQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e4c4c4cd-66f6-4dbd-9116-629a39ee348c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:ca134785-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: dcaa28e4e3f711ed8687db9d93187ff1-20230425
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 269068866; Tue, 25 Apr 2023 23:02:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 26 Apr 2023 13:51:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 26 Apr 2023 13:51:25 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 1/7] ASoC: mediatek: mt8188: remove supply AUDIO_HIRES
Date: Wed, 26 Apr 2023 13:51:18 +0800
Message-ID: <20230426055124.16529-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230426055124.16529-1-trevor.wu@mediatek.com>
References: <20230426055124.16529-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_230204_637363_68275F0F 
X-CRM114-Status: GOOD (  11.32  )
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

AUDIO_HIRES is not required in MT8188. Because top_audio_h is disabled
when hires clock is not used, set_parent is a redundant operation.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c | 37 ---------------------
 1 file changed, 37 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
index d71696901553..fed9f927e623 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
@@ -18,7 +18,6 @@
 #define ADDA_HIRES_THRES 48000
 
 enum {
-	SUPPLY_SEQ_CLOCK_SEL,
 	SUPPLY_SEQ_ADDA_DL_ON,
 	SUPPLY_SEQ_ADDA_MTKAIF_CFG,
 	SUPPLY_SEQ_ADDA_UL_ON,
@@ -242,34 +241,6 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
-				 struct snd_kcontrol *kcontrol,
-				 int event)
-{
-	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
-	struct mt8188_afe_private *afe_priv = afe->platform_priv;
-	struct clk *clk = afe_priv->clk[MT8188_CLK_TOP_AUDIO_H_SEL];
-	struct clk *clk_parent;
-
-	dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
-		__func__, w->name, event);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		clk_parent = afe_priv->clk[MT8188_CLK_APMIXED_APLL1];
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		clk_parent = afe_priv->clk[MT8188_CLK_XTAL_26M];
-		break;
-	default:
-		return 0;
-	}
-	mt8188_afe_set_clk_parent(afe, clk, clk_parent);
-
-	return 0;
-}
-
 static int mtk_afe_adc_hires_connect(struct snd_soc_dapm_widget *source,
 				     struct snd_soc_dapm_widget *sink)
 {
@@ -364,12 +335,6 @@ static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] = {
 			      mtk_adda_ul_event,
 			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
-	SND_SOC_DAPM_SUPPLY_S("AUDIO_HIRES", SUPPLY_SEQ_CLOCK_SEL,
-			      SND_SOC_NOPM,
-			      0, 0,
-			      mtk_audio_hires_event,
-			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
-
 	SND_SOC_DAPM_SUPPLY_S("ADDA_MTKAIF_CFG", SUPPLY_SEQ_ADDA_MTKAIF_CFG,
 			      SND_SOC_NOPM,
 			      0, 0,
@@ -397,7 +362,6 @@ static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
 	{"ADDA Capture", NULL, "ADDA_MTKAIF_CFG"},
 	{"ADDA Capture", NULL, "aud_adc"},
 	{"ADDA Capture", NULL, "aud_adc_hires", mtk_afe_adc_hires_connect},
-	{"aud_adc_hires", NULL, "AUDIO_HIRES"},
 
 	{"I168", NULL, "ADDA Capture"},
 	{"I169", NULL, "ADDA Capture"},
@@ -406,7 +370,6 @@ static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
 	{"ADDA Playback", NULL, "ADDA Playback Enable"},
 	{"ADDA Playback", NULL, "aud_dac"},
 	{"ADDA Playback", NULL, "aud_dac_hires", mtk_afe_dac_hires_connect},
-	{"aud_dac_hires", NULL, "AUDIO_HIRES"},
 
 	{"DL_GAIN", NULL, "O176"},
 	{"DL_GAIN", NULL, "O177"},
-- 
2.18.0


