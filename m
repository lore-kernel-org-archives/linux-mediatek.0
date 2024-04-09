Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B6DC67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTSY1ko++/wb2lPvySWoKOwaimob916R/fGD0IssuIQ=; b=je60zIvFP2sXC6bWZVCDLEhzNt
	F5aIoZ+JMyxbKB4GJoSvsQHvuo0+frnjTbZZdue4zGb6HmuOP+rU8WIKTd27KZmrUTOvW+xJ3scER
	JMPiw5YgrAkdOEFLKjLNqo8/3D3DmU4DLWVfs58jljWc/Y3OUnDiUdfInVI7OGql8mj2xx4CQacGf
	0pyWzY7tIdfEhh7N9NVSPsQ4Nu2W+Z4//a8ht8XbpjU2xSLGqMbzfX8+BK2sjjpvKfgHjq7OH6r3h
	Tl7AblXtApykwq74DEz47kXXQW/zAIhlVH/vlpJE8Q+bJbQctr62+wgocgf3z6omACNQ4oyo/mXRt
	CT/KS68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBlC-00000002D8v-3Oje;
	Tue, 09 Apr 2024 13:43:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBk2-00000002CMq-26jp
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-343c891bca5so3605377f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670145; x=1713274945; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTSY1ko++/wb2lPvySWoKOwaimob916R/fGD0IssuIQ=;
        b=Ujaclzh8V04rFGji5mRAP4WLZljMhPg3lA6p/Zs5YSySgWSQiaadt7Ml+eS564JdRc
         FJEbnXh3STv2EnW80X/QZhVknQ/ci1pTmQp8g7CP/LP8/MwXcewBQwkwlWk56Wf8AUo3
         iJgzXF2CcngW+23iRpQW4CL7MGsQCJX1DIhgLn/+hjghB4NLMmIoFlEQaLVhKmVUDy6c
         67s0zxKyzua7U2o6tgDMKHOi4NkPn9plWsnCN9TuQOWkBtIOH58OqHBLr7VsFTscACFB
         RBs8J4+HiCE/4nhmpqdWHHaOtn4c6j1O86WPEniULz0BQrhHanydY5+TCTHCAiJdc1Ja
         3Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670145; x=1713274945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTSY1ko++/wb2lPvySWoKOwaimob916R/fGD0IssuIQ=;
        b=Qw9uK8wzAVPj9Y1oHwwB/aZ3RJ+jINxjT7ikOsmGUBDZaQhz7yRTbcdXbFq/tFV1E5
         cwdraOjLG7typ3kmSXN7k+SLuDeOJuDP8eUBsrrCciY97AhkQU+CV41fLPjIJ/YFpFhR
         zrL9FPSxyhnuJhnnNoBidimDRGcihJtuDniXbgpaVXOyEYLOukogGLoV1ibLPR8zH3B3
         cPsJYdT6NOoHtYOM9Ee+3SvxXg1B5zcS/ygF7taUYSuhXduA3vch4LIQNBjLMgA9iDHR
         ykbxmhitJPUUIlLGTJ/ks0lDtKMsBm8n26sv4z+lPMpO3U2dwxw6KO3h/YmRtNaIv9+B
         i8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUwXplMDfgsj5vghRjd+Y9WVhPKbsAv6j9QH/Fojaax1QzG4UF/3lDAB8q4wSqiBYbXg834hrHIl0cedX5dGJe9LO2ty0PzfxsAsumjuNRDHX3u
X-Gm-Message-State: AOJu0YyzotR6o3ptLy2vKIIIzpWZMbzHOCgrIkSW/fhL8Jkspx/Oe0xR
	16oD1J0VUAdt3Sr76/nuYDBZQQwASte1mLBsmkUJpcg6dZ5txvEBM7OdKHDF1x8=
X-Google-Smtp-Source: AGHT+IEqTXuQ9vUhLAGUJddJlynr3Hgv8g1A9SL9yf+aGDwibGHFcaB9hafvGzYGFH6ippvirWYDUA==
X-Received: by 2002:a5d:6d81:0:b0:345:e3e9:f063 with SMTP id l1-20020a5d6d81000000b00345e3e9f063mr4281547wrs.59.1712670145020;
        Tue, 09 Apr 2024 06:42:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:24 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:06 +0200
Subject: [PATCH v3 08/18] ASoC: mediatek: mt8365: Add ADDA DAI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-8-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10092;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=rupMHCo4ov9trVUAGySMN2xWWd+DYicdRaX3eev6dnk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsOUxDkfb5Y6lEXLcqiv/Q4r3YM0QpDXUzDn10
 19y3N96JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURectD/
 9s0QdsZOWYWPWRTbuAWsfsKjlECL2HPlJkV0BC33MQ6nzp49VKIfcVeDSsP7AXEo/p5/+YZu+PGlc6
 Av4NyWFNyj+xgpn9hVrwPViIoD5XmF2opMUKfgpiYuhahZx2b2zVWOtCZEhfP66nS9pIaHxQRrrYph
 PMBEklKT3PZVF0HwXEPDH7NWRUfcrjsW8QTp3ooP+Nnv0etcz3qnAv9kGSUczTv5uUT4jp6dXZnOFn
 /aJKweOIkR64gAo9e4ldIhPVFNklZPZWfSIxwKY79m3Zy5FauGRK5uVhV8UH/111cnSaTEf2NLBrqE
 PvAjnQxTv5nfh2qXXF+9p4kjji5DyPhPqRMPZDuR+HoPGcs8X2D7P7oQZeQz3zRZBVv7Fywf2eqTHy
 fgr3ZxyMPd6cVdrNqHStauwRbKwadgLUMWm44pSyFEYqMZx2MWRlDvht8xWarmwjBe7svrc7ZQu47F
 FiTZTENiWfevkdVAhav0yRPz8tg2/ELu2kT2y0CtzuBYlPKvX+Wf1yLc06fk9gtpgwbuFy27t6V+M8
 nlaf/ICE1mZBgiFjgDlBNbOuyergt2DjpL4lVu6nttjhwDk9Fl5EDtsPXRIlCKfu9FzMplEBSexMl7
 78Upemv9Hyn7fcnoGq14wIa8AfeSxbxUP2lpQ9+ftMf7Gqos8U3xzsLfBbHg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_064226_996581_C0BA176D 
X-CRM114-Status: GOOD (  20.12  )
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

Add ADDA Device Audio Interface support for MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 315 ++++++++++++++++++++++++++++
 1 file changed, 315 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
new file mode 100644
index 000000000000..65d45010ac90
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek 8365 ALSA SoC Audio DAI ADDA Control
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-clk.h"
+#include "mt8365-afe-common.h"
+#include "../common/mtk-dai-adda-common.h"
+
+static int adda_afe_on_ref_cnt;
+
+/* DAI Drivers */
+
+static int mt8365_dai_set_adda_out(struct mtk_base_afe *afe, unsigned int rate)
+{
+	unsigned int val;
+
+	switch (rate) {
+	case 8000:
+		val = AFE_ADDA_DL_VOICE_DATA;
+		break;
+	case 16000:
+		val = AFE_ADDA_DL_VOICE_DATA;
+		break;
+	default:
+		val = 0;
+	}
+
+	val |= FIELD_PREP(AFE_ADDA_DL_SAMPLING_RATE,
+		mtk_adda_dl_rate_transform(afe, rate));
+	val |= AFE_ADDA_DL_8X_UPSAMPLE |
+	       AFE_ADDA_DL_MUTE_OFF_CH1 |
+	       AFE_ADDA_DL_MUTE_OFF_CH2 |
+	       AFE_ADDA_DL_DEGRADE_GAIN;
+
+	regmap_update_bits(afe->regmap, AFE_ADDA_PREDIS_CON0, 0xffffffff, 0);
+	regmap_update_bits(afe->regmap, AFE_ADDA_PREDIS_CON1, 0xffffffff, 0);
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, 0xffffffff, val);
+	/* SA suggest apply -0.3db to audio/speech path */
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON1,
+			   0xffffffff, 0xf74f0000);
+	/* SA suggest use default value for sdm */
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SDM_DCCOMP_CON,
+			   0xffffffff, 0x0700701e);
+
+	return 0;
+}
+
+static int mt8365_dai_set_adda_in(struct mtk_base_afe *afe, unsigned int rate)
+{
+	unsigned int val;
+
+	val = FIELD_PREP(AFE_ADDA_UL_SAMPLING_RATE,
+			 mtk_adda_ul_rate_transform(afe, rate));
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0,
+			   AFE_ADDA_UL_SAMPLING_RATE, val);
+	/* Using Internal ADC */
+	regmap_update_bits(afe->regmap, AFE_ADDA_TOP_CON0, 0x1, 0x0);
+
+	return 0;
+}
+
+int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
+{
+	unsigned long flags;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	adda_afe_on_ref_cnt++;
+	if (adda_afe_on_ref_cnt == 1)
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON);
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
+{
+	unsigned long flags;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	adda_afe_on_ref_cnt--;
+	if (adda_afe_on_ref_cnt == 0)
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
+				   ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
+	else if (adda_afe_on_ref_cnt < 0)
+		adda_afe_on_ref_cnt = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+static void mt8365_dai_set_adda_out_enable(struct mtk_base_afe *afe,
+					   bool enable)
+{
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, 0x1, enable);
+
+	if (enable)
+		mt8365_dai_enable_adda_on(afe);
+	else
+		mt8365_dai_disable_adda_on(afe);
+}
+
+static void mt8365_dai_set_adda_in_enable(struct mtk_base_afe *afe, bool enable)
+{
+	if (enable) {
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x1, 0x1);
+		mt8365_dai_enable_adda_on(afe);
+		/* enable aud_pad_top fifo */
+		regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP,
+				   0xffffffff, 0x31);
+	} else {
+		/* disable aud_pad_top fifo */
+		regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP,
+				   0xffffffff, 0x30);
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x1, 0x0);
+		/* de suggest disable ADDA_UL_SRC at least wait 125us */
+		usleep_range(150, 300);
+		mt8365_dai_disable_adda_on(afe);
+	}
+}
+
+static int mt8365_dai_int_adda_startup(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	unsigned int stream = substream->stream;
+
+	mt8365_afe_enable_main_clk(afe);
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DAC);
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DAC_PREDIS);
+	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_ADC);
+	}
+
+	return 0;
+}
+
+static void mt8365_dai_int_adda_shutdown(struct snd_pcm_substream *substream,
+					 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be =
+		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	unsigned int stream = substream->stream;
+
+	if (be->prepared[stream]) {
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			mt8365_dai_set_adda_out_enable(afe, false);
+			mt8365_afe_set_i2s_out_enable(afe, false);
+		} else {
+			mt8365_dai_set_adda_in_enable(afe, false);
+		}
+		be->prepared[stream] = false;
+	}
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DAC_PREDIS);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DAC);
+	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_ADC);
+	}
+
+	mt8365_afe_disable_main_clk(afe);
+}
+
+static int mt8365_dai_int_adda_prepare(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be =
+		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	unsigned int rate = substream->runtime->rate;
+	int bit_width = snd_pcm_format_width(substream->runtime->format);
+	int ret;
+
+	dev_info(afe->dev, "%s '%s' rate = %u\n", __func__,
+		 snd_pcm_stream_str(substream), rate);
+
+	if (be->prepared[substream->stream]) {
+		dev_info(afe->dev, "%s '%s' prepared already\n",
+			 __func__, snd_pcm_stream_str(substream));
+		return 0;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = mt8365_dai_set_adda_out(afe, rate);
+		if (ret)
+			return ret;
+
+		ret = mt8365_afe_set_i2s_out(afe, rate, bit_width);
+		if (ret)
+			return ret;
+
+		mt8365_dai_set_adda_out_enable(afe, true);
+		mt8365_afe_set_i2s_out_enable(afe, true);
+	} else {
+		ret = mt8365_dai_set_adda_in(afe, rate);
+		if (ret)
+			return ret;
+
+		mt8365_dai_set_adda_in_enable(afe, true);
+	}
+	be->prepared[substream->stream] = true;
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt8365_afe_int_adda_ops = {
+	.startup	= mt8365_dai_int_adda_startup,
+	.shutdown	= mt8365_dai_int_adda_shutdown,
+	.prepare	= mt8365_dai_int_adda_prepare,
+};
+
+static struct snd_soc_dai_driver mtk_dai_adda_driver[] = {
+	{
+		.name = "INT ADDA",
+		.id = MT8365_AFE_IO_INT_ADDA,
+		.playback = {
+			.stream_name = "INT ADDA Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture = {
+			.stream_name = "INT ADDA Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &mt8365_afe_int_adda_ops,
+	}
+};
+
+/* DAI Controls */
+
+static const struct snd_kcontrol_new mtk_adda_dl_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1 Switch", AFE_CONN3,
+				    10, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_adda_dl_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2 Switch", AFE_CONN4,
+				    11, 1, 0),
+};
+
+static const struct snd_kcontrol_new int_adda_o03_o04_enable_ctl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+/* DAI widget */
+
+static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] = {
+	SND_SOC_DAPM_SWITCH("INT ADDA O03_O04", SND_SOC_NOPM, 0, 0,
+			    &int_adda_o03_o04_enable_ctl),
+	/* inter-connections */
+	SND_SOC_DAPM_MIXER("ADDA_DL_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_adda_dl_ch1_mix,
+			   ARRAY_SIZE(mtk_adda_dl_ch1_mix)),
+	SND_SOC_DAPM_MIXER("ADDA_DL_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_adda_dl_ch2_mix,
+			   ARRAY_SIZE(mtk_adda_dl_ch2_mix)),
+};
+
+/* DAI route */
+
+static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
+	{"INT ADDA O03_O04", "Switch", "O03"},
+	{"INT ADDA O03_O04", "Switch", "O04"},
+	{"INT ADDA Playback", NULL, "INT ADDA O03_O04"},
+	{"INT ADDA Playback", NULL, "ADDA_DL_CH1"},
+	{"INT ADDA Playback", NULL, "ADDA_DL_CH2"},
+	{"AIN Mux", "INT ADC", "INT ADDA Capture"},
+	{"ADDA_DL_CH1", "GAIN1_OUT_CH1", "Hostless FM DL"},
+	{"ADDA_DL_CH2", "GAIN1_OUT_CH2", "Hostless FM DL"},
+};
+
+int mt8365_dai_adda_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+	list_add(&dai->list, &afe->sub_dais);
+	dai->dai_drivers = mtk_dai_adda_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_adda_driver);
+	dai->dapm_widgets = mtk_dai_adda_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_adda_widgets);
+	dai->dapm_routes = mtk_dai_adda_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_adda_routes);
+	return 0;
+}

-- 
2.25.1


