Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E2EC7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEcK41cF/2ml3/KbufJ41Q6kgd0u5/fZkFnkmWvxe/c=; b=3A3qSalgjh48tTHcui6bfx+ey2
	GeSnXwwYzCvHgOBaLwECKw5ShGMzMkdYU8I/6eZwPbRHVisdBCcCnC57Elzj8dwliSagnZyD3P9tP
	Q151BnqMixuJTU+UWWyKtTC8kgTV7IYBReC0rO9Dobzl6vMMI0rKQ3bkoS9vGsUpAXUGBX69FVcyq
	Kx9lZ0n8EH5UgLl8sNg73T2qF/qCkRZwAiRWxGXUY9GODa6IbazR5gy6ay9hgZdDawBwTbf+bUWpa
	KFcJKxi7DTcaMggW+fTTBqN6TLQlRk74NfDVdmtimnYNz+eDTCZ9zQOW7DnRQ8KgPMzbIFxNTEVJ/
	6t3+EbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvv63-00HT8q-2i;
	Mon, 08 May 2023 07:15:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvv5z-00HT5z-12;
	Mon, 08 May 2023 07:15:44 +0000
X-UUID: 2174e23aed7011ed912e1518a6540028-20230508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lEcK41cF/2ml3/KbufJ41Q6kgd0u5/fZkFnkmWvxe/c=;
	b=TyYwJ8pRMlaZ/UNpzAWzR3S7Phm3ON/5qjs3e9d8o5Nlqe0Rzp7P7d4kXGR8CHyCaXTRSbHQpsMIJ8BfGqmz/xV5JBWPuunIlu7f8J2JKoAL7plhqbezjBS1rfex9ET99VCEtj8LugJO5KniYOgnqzkqIoJtoa1biwCMzGyNLes=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:1328cc70-8306-4c63-ab37-e47af88806de,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:697ab71,CLOUDID:4a55176b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 2174e23aed7011ed912e1518a6540028-20230508
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1560765470; Mon, 08 May 2023 00:15:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 May 2023 15:15:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 May 2023 15:15:34 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] ASoC: mediatek: mt6359: update route for lineout mux
Date: Mon, 8 May 2023 15:15:32 +0800
Message-ID: <20230508071532.21665-5-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230508071532.21665-1-trevor.wu@mediatek.com>
References: <20230508071532.21665-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_001543_370367_B8BA2E17 
X-CRM114-Status: GOOD (  15.87  )
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

Originally, lineout playback source can only be DAC_3RD. Some SoC
masters only support stereo MTKAIF outputs, so lineout path can't be
used in such case.

MTKAIF connections are as follows.
MOSI0 -> DAC_L
MOSI1 -> DAC_R
MOSI2 -> DAC_3rd

In the patch, lineout playback source can be chosen between DAC_L and
DAC_3rd, so sound can be outputted via lineout even though SoC only
supports stereo MTKAIF outputs.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 44 +++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index a37ad61a8253..30690479ec17 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1159,9 +1159,10 @@ static int mt_lo_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), event 0x%x, mux %u\n",
-		__func__, event, dapm_kcontrol_get_value(w->kcontrols[0]));
+		__func__, event, mux);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1199,14 +1200,29 @@ static int mt_lo_event(struct snd_soc_dapm_widget *w,
 		/* Enable AUD_CLK */
 		mt6359_set_decoder_clk(priv, true);
 
-		/* Enable Audio DAC (3rd DAC) */
-		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x3113);
-		/* Enable low-noise mode of DAC */
-		if (priv->dev_counter[DEVICE_HP] == 0)
-			regmap_write(priv->regmap,
-				     MT6359_AUDDEC_ANA_CON9, 0x0001);
-		/* Switch LOL MUX to audio 3rd DAC */
-		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x311b);
+		/* Switch LOL MUX to audio DAC */
+		if (mux == LO_MUX_L_DAC) {
+			if (priv->dev_counter[DEVICE_HP] > 0) {
+				dev_info(priv->dev, "%s(), can not enable DAC, hp count %d\n",
+					 __func__, priv->dev_counter[DEVICE_HP]);
+				break;
+			}
+			/* Enable DACL and switch HP MUX to open*/
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON0, 0x3009);
+			/* Disable low-noise mode of DAC */
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0xf200);
+			usleep_range(100, 120);
+			/* Switch LOL MUX to DACL */
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x0117);
+		} else if (mux == LO_MUX_3RD_DAC) {
+			/* Enable Audio DAC (3rd DAC) */
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x3113);
+			/* Enable low-noise mode of DAC */
+			if (priv->dev_counter[DEVICE_HP] == 0)
+				regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x0001);
+			/* Switch LOL MUX to audio 3rd DAC */
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x311b);
+		}
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		/* Switch LOL MUX to open */
@@ -1218,6 +1234,15 @@ static int mt_lo_event(struct snd_soc_dapm_widget *w,
 		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
 				   0x000f, 0x0000);
 
+		if (mux == LO_MUX_L_DAC) {
+			/* Disable HP driver core circuits */
+			regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+					   0x3 << 4, 0x0);
+			/* Disable HP driver bias circuits */
+			regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+					   0x3 << 6, 0x0);
+		}
+
 		/* Disable AUD_CLK */
 		mt6359_set_decoder_clk(priv, false);
 
@@ -2590,6 +2615,7 @@ static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
 
 	/* Lineout Path */
 	{"LOL Mux", "Playback", "DAC_3RD"},
+	{"LOL Mux", "Playback_L_DAC", "DACL"},
 	{"LINEOUT L", NULL, "LOL Mux"},
 
 	/* Headphone Path */
-- 
2.18.0


