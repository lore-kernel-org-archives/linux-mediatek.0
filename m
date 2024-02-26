Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B77C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaFeWa9DyMLXR25IWxlh2i3+qfSfIyjBK5YTPrgtdsI=; b=C0MMj4JLyRLafPAGa3ojQDSu4j
	jTT54CDq/VA6WA5xWdN7v9H4dYscPFYVLpD6K7MGAzECENpSIok9Pm+mT/i/WKmzH+50jFX4lxfbN
	+ifCCWSMUjX/nN7jhdIz4o3CNGOz3xEHJYD/oy78N0bszShbR3gizgZnMz7SVa8UCIkx4zM1jEbd9
	0EOIbKeP/Ng0uHgyLIB9DW4Ex/XoG0kOKpLpvLaqHRztdSg8aGM+2l3tUqHyaipCk255MThV4xugY
	KxWRwrt2PPdsS8L8k6Nh+K6CFHWkFAWz80Zp9VYt+9Ucm9ExeFUszlshzlpOG3BLHnyItHvWcZbZk
	p1/RD7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reciS-00000001N8s-1fB5;
	Mon, 26 Feb 2024 15:16:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYn-00000000ycE-0HK6
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oaFeWa9DyMLXR25IWxlh2i3+qfSfIyjBK5YTPrgtdsI=; b=rV8gajrL9qY9jHptAuOLjYVMFs
	GdV4tGMyKu1jGfqtULqdbOljEfhMqq4GAq9JqNWgE0ju/48GHYiFsa26FlZVUQYknyho2ePO9IlZ/
	ieLDmIcBoYFrrufvCxAnsIiA+hmfo3HLamCGOEJxsNIhS44JE1cc6E83g8JYHkoXQ+h5vNAdofvno
	uPCtbiTyN8z5JqjjZ2V4tcKcK9sTjJhs6F5JfSYkaB0EBfITL8wF516fGvhjvTCS4qea/j1jkaH1Z
	n6DO/dMtzP1fer5TlBmvgyfJaYBVp1+5IVNIvlEmrzViSg0W1FUpWswQpWsQkF0dRNQ4634EKGJtN
	H99TSj3Q==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYh-0000000HKD1-05OJ
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-412a4055897so8924605e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956137; x=1709560937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaFeWa9DyMLXR25IWxlh2i3+qfSfIyjBK5YTPrgtdsI=;
        b=xqldC2v1E+T1zeqGFnwpa1iimnMk0OnPmzA/iqxmtyHpPvvax4PbLnGOl2bzigI9kh
         bnjyj7KqmkiYIBywoYDt5SI2atnNlfZP5BhdgR0dY4xPvRvxeyG19/SJuLUKaOX7Vx/+
         bhZsu1oQpUIT+k/jB2urJn8dAt0X+j+/FATD4BO5O0hjh2ifnVV2ZsbcBJMnozx21Ddx
         W1ds5/wHfQAbu1ihLfDDC2KOJkI+08Iq8mP+9V2km5JM7PPtVKhrEazF7IueLEQB52lw
         0kxk+yE9PtABCwEUFmHEXUYoGbzJzUnrh6Z93VIRQzLc/M7MjDej5vp5foN91nGArz+i
         Ng8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956137; x=1709560937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaFeWa9DyMLXR25IWxlh2i3+qfSfIyjBK5YTPrgtdsI=;
        b=xCnobXVWwDq8AHawPMc+1N2760LEuqgSQpjanNUQZOFTgzYfqeYMIRynQTZ/G4Aa8O
         r6s9N4XXsRVTG0YtcOTG8Q8tcZI3AtF5l0ARa1/ihWC80XB/sdxNYKUej+pf24QqTrI6
         sbRO+6Uq4I2MgIpyBDU6FN+RfqPxfzC28dp2OqrQgF35NQT1GpURFZxUArayzK+kjHv3
         NPHFNB8KR6pc83eDIr+TLFDlIEPizncHACqOgc7k9xuRHPKlP4QoIhT9lA6p6Zwmkazf
         TXDn8k5SnOtlleNOj9rrXFDYN2jFP0YW/JnfUohBM1T1leT7St7+L2q3QUkJ8lSQztoD
         zU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+osn283F7zQm51mfmDG5PxStMhs9rn2iR2br/KufBenJBn2WArN6vGfJTSe862NgflPMBBRRBjT9VC1LzqHU0VdQpdsjsc9Ysj3wK/w6mDz6m
X-Gm-Message-State: AOJu0YwsoyhMQVZbmZCYxOz87Nx7bZlCyJcsqbuCS6Pzd58sClAE9Gkf
	u+NHPIb/TzCl5HnqV+A1WRR+u6B38HiwYBLf7OF7KqsZ1TT/TF1pkClsciMBnNs=
X-Google-Smtp-Source: AGHT+IH0f/XQ0pnLnlrQqG7pT4dcqjvj0johd8iHCL9WBpw7fd0dtBGDl67n//oB8va6OQMSUhB2iA==
X-Received: by 2002:a05:600c:a42:b0:412:4a57:3852 with SMTP id c2-20020a05600c0a4200b004124a573852mr5476890wmq.15.1708956137245;
        Mon, 26 Feb 2024 06:02:17 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:16 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:45 +0100
Subject: [PATCH 07/18] ASoC: mediatek: mt8365: Add ADDA DAI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-7-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10467;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=NV3JBMyLyLRM7d7PcxPRxCiSiQIWtQdVIaekkHxK2hY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncV38WxFFu/20pcu97irstVIJVDajaJ6Eggs4i
 XOdi3OaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURYLuD/
 49SHgxcbWIDeTcAqWf9SY6DcUAj+f2qzB/K1foe3gRdco1XMSaKUdBYjrc7LlcbJI6TVS02t3rZdzm
 QvOZUR7Ghkk19khwfCioTFPGtRfYlZOnFghmoSyJgWi90L9Po2HsOZu8ku1u5bFJuz6L1oL7Lq2Kum
 g+bx4XCoXp4nmYxUNhyWiCN4My6kG79WXTLAyOM9CMpfd+krAHCzQhhlEFFdcH8UZcPxF34MD8erbP
 RgBCcW4O1rzGs0efrBffBSFqViiP/sykqiUe2KM8ZWI5DqGf9rcG1fhopLo+0Byp8EWNcxh2zEH/xK
 2ktwj7x4Z5PVfderKt+brLkBCY8oR22NG8lXwrOHE0WgRGxjk+M3YPJ4HiRpW8dPN4Uj1swKWyAgg7
 OYuWT13L7nlGtIhguvPJwH7YJMSWywyraCsWkkBqjVULBUe2lUFA6jWQ/Hj7lc5ix1ZoA4GgtBVJWu
 ftu7O6amAb5+MLguIr6A1Zs1lNZncU0O17IiQMuek3NiV6clBjB5YyB/6o3owy4z8aC/+pbLb8Ebg9
 O5A6suVtXyj8cVHPydscSjzxNMzjf8BPDzgNAlh8h3jSrCg/iokyWcewfdf7QM327lsq25rTbbPMS4
 jpu6xKSrKOnz+m33CxFeuW/BKw9Jaw2c/8qEerpbHOOggZtiNJV5krdy20ww==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140219_187982_F1532931 
X-CRM114-Status: GOOD (  19.62  )
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
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 355 ++++++++++++++++++++++++++++
 1 file changed, 355 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
new file mode 100644
index 000000000000..798b749c0cc5
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
@@ -0,0 +1,355 @@
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
+
+static int adda_afe_on_ref_cnt;
+
+/* DAI Drivers */
+
+static int mt8365_dai_set_adda_out(struct mtk_base_afe *afe, unsigned int rate)
+{
+	unsigned int val = 0;
+
+	switch (rate) {
+	case 8000:
+		val |= (0 << 28) | AFE_ADDA_DL_VOICE_DATA;
+		break;
+	case 11025:
+		val |= 1 << 28;
+		break;
+	case 12000:
+		val |= 2 << 28;
+		break;
+	case 16000:
+		val |= (3 << 28) | AFE_ADDA_DL_VOICE_DATA;
+		break;
+	case 22050:
+		val |= 4 << 28;
+		break;
+	case 24000:
+		val |= 5 << 28;
+		break;
+	case 32000:
+		val |= 6 << 28;
+		break;
+	case 44100:
+		val |= 7 << 28;
+		break;
+	case 48000:
+		val |= 8 << 28;
+		break;
+	default:
+		return -EINVAL;
+	}
+
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
+		0xffffffff, 0xf74f0000);
+	/* SA suggest use default value for sdm */
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SDM_DCCOMP_CON,
+		0xffffffff, 0x0700701e);
+
+	return 0;
+}
+
+static int mt8365_dai_set_adda_in(struct mtk_base_afe *afe, unsigned int rate)
+{
+	unsigned int val = 0;
+
+	switch (rate) {
+	case 8000:
+		val |= (0 << 17);
+		break;
+	case 16000:
+		val |= (1 << 17);
+		break;
+	case 32000:
+		val |= (2 << 17);
+		break;
+	case 48000:
+		val |= (3 << 17);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x000e0000, val);
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
+			AFE_ADDA_UL_DL_ADDA_AFE_ON, AFE_ADDA_UL_DL_ADDA_AFE_ON);
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
+			AFE_ADDA_UL_DL_ADDA_AFE_ON, ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
+	else if (adda_afe_on_ref_cnt < 0)
+		adda_afe_on_ref_cnt = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+static void mt8365_dai_set_adda_out_enable(struct mtk_base_afe *afe,
+	bool enable)
+{
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, 0x1, enable);
+
+	if (enable)
+		mt8365_dai_enable_adda_on(afe);
+	else
+		mt8365_dai_disable_adda_on(afe);
+}
+
+static void mt8365_dai_set_adda_in_enable(struct mtk_base_afe *afe,
+	bool enable)
+{
+	if (enable) {
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x1, 0x1);
+		mt8365_dai_enable_adda_on(afe);
+		/* enable aud_pad_top fifo */
+		regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP,
+			0xffffffff, 0x31);
+	} else {
+		/* disable aud_pad_top fifo */
+		regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP,
+			0xffffffff, 0x30);
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x1, 0x0);
+		/* de suggest disable ADDA_UL_SRC at least wait 125us */
+		udelay(150);
+		mt8365_dai_disable_adda_on(afe);
+	}
+}
+
+static int mt8365_dai_int_adda_startup(struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
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
+	struct snd_soc_dai *dai)
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
+		} else
+			mt8365_dai_set_adda_in_enable(afe, false);
+
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
+	struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be =
+		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	const unsigned int rate = substream->runtime->rate;
+	const unsigned int stream = substream->stream;
+	const int bit_width = snd_pcm_format_width(substream->runtime->format);
+	int ret;
+
+	dev_info(afe->dev, "%s '%s' rate = %u\n", __func__,
+		snd_pcm_stream_str(substream), rate);
+
+	if (be->prepared[stream]) {
+		dev_info(afe->dev, "%s '%s' prepared already\n",
+			 __func__, snd_pcm_stream_str(substream));
+		return 0;
+	}
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
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
+
+	be->prepared[stream] = true;
+
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
+			.rates = SNDRV_PCM_RATE_8000 |
+				 SNDRV_PCM_RATE_16000 |
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
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1", AFE_CONN3,
+				    10, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_adda_dl_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2", AFE_CONN4,
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
+			   &int_adda_o03_o04_enable_ctl),
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
+	dev_dbg(afe->dev, "%s()\n", __func__);
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_adda_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_adda_driver);
+	dai->dapm_widgets = mtk_dai_adda_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_adda_widgets);
+	dai->dapm_routes = mtk_dai_adda_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_adda_routes);
+
+	return 0;
+}

-- 
2.25.1


