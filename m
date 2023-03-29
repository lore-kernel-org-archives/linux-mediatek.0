Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE75C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E0T0Nt++F0LJaHY91+B3o38cJeCTneBvrK1430ulA6g=; b=GvkmRIw3ccq6Ao33EOU2MuqRRW
	KHUQLLhorWEh5ngyidOICLJKgX0h5T6bZNPxlJkLsJICSiO5Lp92CdgAw2MsRBdYI9sHfsjR/Jrzp
	pFGP3etJE18CrwLYkAY+duu+VNyGx9MeH3q0LhpMgIih7w7IrIeoaDuw2cI5HdGGY65RkNwR/F0jU
	lYBY613oGTTvUZE9tH11SXWstoteBqhKlp5Um2xapfO4+pHO26tpDzzBkb3/KRUhK3WVU3sLwSE9p
	vVYgsS8fZUfGKuvs3eikCjzD7vjn9kNwlhr4opeRmBam3dEzHb+QhdETFglCP3RjpNWfFQirEq2fy
	PWBrzKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQnI-00H0wo-0C;
	Wed, 29 Mar 2023 08:04:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQnF-00H0vQ-08;
	Wed, 29 Mar 2023 08:04:30 +0000
X-UUID: 513643b0ce0811ed8687db9d93187ff1-20230329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=E0T0Nt++F0LJaHY91+B3o38cJeCTneBvrK1430ulA6g=;
	b=QOdSgFekf7oX018+le1rpcaVCAvIEPXObgO2L/9aguBNNwEkTrOq1XfGtDy3J5erYDdnNKtIpqX96wAYoBCVFo04Sg48ABWS63Iyebtm4d3AZ4NovQ7w5pGHW0R/X/lhU71xuZkrB14PbhFrQ6pkapmPQoL+vGoaRzYT+x8rLU0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:a7751c89-b875-484f-b827-9a2f9724a7bc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:a7751c89-b875-484f-b827-9a2f9724a7bc,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:687ad529-564d-42d9-9875-7c868ee415ec,B
	ulkID:230329160424ACAEBCYI,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 513643b0ce0811ed8687db9d93187ff1-20230329
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 750807746; Wed, 29 Mar 2023 01:04:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 29 Mar 2023 16:04:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 29 Mar 2023 16:04:20 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8186: Move some prints to debug level
Date: Wed, 29 Mar 2023 16:04:18 +0800
Message-ID: <20230329080418.1100-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_010429_090820_FB311CE0 
X-CRM114-Status: GOOD (  14.29  )
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

There are many log messages scattered throughout the mt8186 sound
drivers, and they are frequently triggered.

To avoid spamming the console, move these messages to the debug level.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   | 26 +++++++++----------
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c   |  4 +--
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  2 +-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  6 ++---
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index eda913fa147a..20b9f5d810ec 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -85,7 +85,7 @@ int mt8186_afe_gpio_init(struct device *dev)
 							     aud_gpios[i].name);
 		if (IS_ERR(aud_gpios[i].gpioctrl)) {
 			ret = PTR_ERR(aud_gpios[i].gpioctrl);
-			dev_info(dev, "%s(), pinctrl_lookup_state %s fail, ret %d\n",
+			dev_dbg(dev, "%s(), pinctrl_lookup_state %s fail, ret %d\n",
 				 __func__, aud_gpios[i].name, ret);
 		} else {
 			aud_gpios[i].gpio_prepare = true;
@@ -108,13 +108,13 @@ static int mt8186_afe_gpio_select(struct device *dev,
 	int ret = 0;
 
 	if (type < 0 || type >= MT8186_AFE_GPIO_GPIO_NUM) {
-		dev_err(dev, "%s(), error, invalid gpio type %d\n",
+		dev_dbg(dev, "%s(), error, invalid gpio type %d\n",
 			__func__, type);
 		return -EINVAL;
 	}
 
 	if (!aud_gpios[type].gpio_prepare) {
-		dev_err(dev, "%s(), error, gpio type %d not prepared\n",
+		dev_dbg(dev, "%s(), error, gpio type %d not prepared\n",
 			__func__, type);
 		return -EIO;
 	}
@@ -122,7 +122,7 @@ static int mt8186_afe_gpio_select(struct device *dev,
 	ret = pinctrl_select_state(aud_pinctrl,
 				   aud_gpios[type].gpioctrl);
 	if (ret) {
-		dev_err(dev, "%s(), error, can not set gpio type %d\n",
+		dev_dbg(dev, "%s(), error, can not set gpio type %d\n",
 			__func__, type);
 		return ret;
 	}
@@ -137,25 +137,25 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 	if (enable) {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
 			return ret;
 		}
 	} else {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI DAT OFF select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI DAT OFF select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
 			return ret;
 		}
 	}
@@ -170,25 +170,25 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 	if (enable) {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MISO CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MISO CLK ON select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MISO DAT ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MISO DAT ON select fail!\n", __func__);
 			return ret;
 		}
 	} else {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MISO DAT OFF select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MISO DAT OFF select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
 			return ret;
 		}
 	}
@@ -230,7 +230,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 		sel = enable ? MT8186_AFE_GPIO_PCM_ON : MT8186_AFE_GPIO_PCM_OFF;
 		break;
 	default:
-		dev_err(dev, "%s(), invalid dai %d\n", __func__, dai);
+		dev_dbg(dev, "%s(), invalid dai %d\n", __func__, dai);
 		goto unlock;
 	}
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index 094402470dc2..247ab8df941f 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -110,7 +110,7 @@ static unsigned int adda_dl_rate_transform(struct mtk_base_afe *afe,
 	case 192000:
 		return MTK_AFE_ADDA_DL_RATE_192K;
 	default:
-		dev_info(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
+		dev_dbg(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
 			 __func__, rate);
 	}
 
@@ -134,7 +134,7 @@ static unsigned int adda_ul_rate_transform(struct mtk_base_afe *afe,
 	case 192000:
 		return MTK_AFE_ADDA_UL_RATE_192K;
 	default:
-		dev_info(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
+		dev_dbg(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
 			 __func__, rate);
 	}
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index 970b980a81e6..cdf54d1eb50d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -1061,7 +1061,7 @@ static int mt8186_mt6366_da7219_max98357_dev_probe(struct platform_device *pdev)
 		card->name = card->topology_shortname;
 		sof_on = 1;
 	} else {
-		dev_info(&pdev->dev, "Probe without adsp\n");
+		dev_dbg(&pdev->dev, "Probe without adsp\n");
 	}
 
 	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index b333950aa3c3..7538274641fd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -95,7 +95,7 @@ static int dmic_set(struct snd_kcontrol *kcontrol,
 	priv->dmic_switch = ucontrol->value.integer.value[0];
 	if (priv->dmic_sel) {
 		gpiod_set_value(priv->dmic_sel, priv->dmic_switch);
-		dev_info(dapm->card->dev, "dmic_set_value %d\n",
+		dev_dbg(dapm->card->dev, "dmic_set_value %d\n",
 			 priv->dmic_switch);
 	}
 	return 0;
@@ -139,7 +139,7 @@ static int primary_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (!priv->dmic_sel) {
-		dev_info(card->dev, "dmic_sel is null\n");
+		dev_dbg(card->dev, "dmic_sel is null\n");
 		return 0;
 	}
 
@@ -1152,7 +1152,7 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 		card->name = card->topology_shortname;
 		sof_on = 1;
 	} else {
-		dev_info(&pdev->dev, "Probe without adsp\n");
+		dev_dbg(&pdev->dev, "Probe without adsp\n");
 	}
 
 	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
-- 
2.18.0


