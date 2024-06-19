Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF7BC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCAjHokZ9G2UGhiGFRg3f3L38A6iZMLRbFctPGiCpBk=; b=j29mK3nozUGdKsOrdizdw2/brZ
	LZos3uNQUvPmIV8SIx/O/zlJ/urRRH2e/u5gQWLtztgTSS7veA3U1+GHhWdGVxaIM9/ADVx+5F6E6
	zDww3YAAbECP1KOLHvAO7SAnJKhWuO25zwYGGn4qIbNCvK3vOUHApSTnfyKF28vZmF3q1bVzBV4tE
	JJon2KcpnwiKUSNybER45iFPfgl8QnNRsiWYi3UvRlVYv4YgCFe/Ng13Sw7Dw3bLXsVsBZ6299ZMX
	1hLxLh0W/tppgLjp0B0veUQ1xSvkWtFWsf+oiAACJnozGdSXPCRJwYmntF8LdOUVMdq9UFvVNMoI+
	LAzBrjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwbC-00000001dZQ-1TMB;
	Wed, 19 Jun 2024 14:47:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwab-00000001dDa-0HUO
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jun 2024 14:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bCAjHokZ9G2UGhiGFRg3f3L38A6iZMLRbFctPGiCpBk=; b=Udf488JiQ86FPfEKswjuYPNyUT
	waekIwfqRdztt6JFBA0q2B/BnHB3re/SrGwN/zgjNGeFbROw2qKfKafitqM54ASzAzNUZmtBObtr2
	DRBNZ4gJrFbp3FVunAfTSR/AeqPbAR9FlZ2LRnKlizQyuBnF5+YTahCZ+X3nBwkLdYwoT20uc+r6u
	DLT7IXE9zGLsOZs39mW5d8IdMayfitawy8NmWOQamuTu5Z4+9M9+GfyPAFyyvbexTrgbA6yELcTgL
	3KZdxt1eMqsL5cjAue3QeUkd4K7gRGiXlEiTM0PsPaxcxp2bPbuq6mI3ap5JYSzC36zWXNu0Fu0Wo
	FYNzZFrw==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwaV-00000007MnE-3WQ5
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 14:47:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57c7ec8f1fcso8015252a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808422; x=1719413222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCAjHokZ9G2UGhiGFRg3f3L38A6iZMLRbFctPGiCpBk=;
        b=dRWE83SPrF/RbhKlfIj0szBvZS0C/wKg+De5smJJbiWVR+TX27yGaM4RlJA+EL/JeX
         f8ozLmymVvXLPhDi9snNiriCp7WAksb+qpQm2IW5LQiQoJK7etTOIPX186eTrRT99qBl
         GYOZBtvWBjnFA+KUos6YtOiGeq0/wIs6LveSkLlGQnQjUGiRww05ixzVWXdZztqZWodX
         nvdkyW0BvcM/uI6zwpfOhS1quMDruTmRfs66ltyLu18OpPea3L4yudvdDM8QjixJjuyq
         WSrNiOeXntpP6Dz3Bn813xuMfMrYnnb7TbZxZ5fzv7R4EbfxS+4LTkJzdNDqoTegKUZa
         itbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808422; x=1719413222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCAjHokZ9G2UGhiGFRg3f3L38A6iZMLRbFctPGiCpBk=;
        b=vQ2pJgj7qcXv5Grs7dJ39SY1naCy+5EjpCGGhXbtX6Sh7HFKvafF10EyBBAfFIlBiH
         gG1iTHUcsxgUkwFWGapBeEF9tcloGmA2YRXV3tKusN+oqUWIVivmqEKGqzy63wKfe+r0
         qF5ysdwoWx9A8qvb8x78kKsQltPfe8RxEdlBtF4VfDuawKBvU2o5yPp3F/4pUkxyoGih
         e1NW0tgngdvmJd0GKX7+L337ZbpWGKtFFGj433h6fj8L137On7THDWZSf8AD0SfiG+Pz
         X5lTAYtti3M2nddIipxlV8TVx9E9WqkLPoA0/EX89TK3NXqzA53RK3/835N+4d2L6uT1
         7J2g==
X-Forwarded-Encrypted: i=1; AJvYcCWEqg0EKh+47B1wxWZ0UuvMOhV5WJPRpF3JSofmz5wQq1cB4rDBa68kT8xB+eYlIOeUgwZrGCg9zH5T0MJWB7qUqF25qjYbWM4iH8zwXFBSmDs1
X-Gm-Message-State: AOJu0YwSpc58Xf3EHdJomRqHzB9ABM7s7EiGw44XHBscZX3RQZdYZHmD
	bkzD3QKENN/RTqx6OIbt/YaW82I8GMirbAleW8eGaGUDzcgakA5cAQwPvmdk7ZA=
X-Google-Smtp-Source: AGHT+IEgJpDdjSnxhMG+TUCufRejRgWyo4CP9VlODRkK9XtC4OXiQ0QdgCYPdoVhKS8jbcon+06xJQ==
X-Received: by 2002:a17:906:ba82:b0:a6f:b320:f45c with SMTP id a640c23a62f3a-a6fb320f4admr135534966b.13.1718808422079;
        Wed, 19 Jun 2024 07:47:02 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:47:01 -0700 (PDT)
From: amergnat@baylibre.com
Date: Wed, 19 Jun 2024 16:46:46 +0200
Subject: [PATCH v6 10/16] ASoc: mediatek: mt8365: Add a specific soundcard
 for EVK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-10-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10498;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=HYpI5rUwcY4z116A+K6sYZ0l2viRC0+/t1cG0dm2sU0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9QE9D0nRR+/f22CBI9LFegrtGU2Dd7fSVLRtMV
 n+U1yF2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURWiQEA
 Cctexn+CcDnvBHJWxv6f1/D5cdbMfABGUBRL0ixm49ChTLKbLl/5kcLXJ5r9/xwOq1fgWlR7Y4gHD6
 MusP3Y1EYftrVaHjhNM3rYE+bCIVy7eo/JqiYsu21Ea78Z7mWqT/5l7zN+XbE5/+9UuPaTt6DjaXLv
 E55zByRDoI6ndraNklrLOyFUHlvc0/3SYShNySHqj/k4H22VjwSCj4F/iQFPXYjiVsMYLJGv6gFaX5
 suCEE2rSBP5xl4HGJ4ouVkY3Htau2h8yf4CoAGd6peUFM2uHNfLNms4YoGwZAtSGjh2V/Sr8EiJbDC
 AAIEMRGiIbidUujiPi0njLR1elS7Qxb8e0PKgEWR/gfkRPACLSVFznMH7fwxGTiN4j3FaMXBw4JPaV
 4qv4WU37cPEtRgkqvUD9TYJ2Ir6ok/4j5q6ztVzp8P3KKNoe/bsVoeNNU5Scp4f4eTpU812UG3wher
 oW3kyRKqk148xOUTgx8Htr5dlTyOMet7LzsUaUwlyTimMPHk4UmQsCg/wDBCFHa2xefw6je5hhzPrY
 I/UwyWf1M118FQlA4yqTaZ+ASbFf0Oow2ak7LqKOM6oXo49jhy5xXNUygNI0AMP8echkAWFMHw1kEa
 eoYMON5ortqM6WU7v7vRKynsiP7EwJ6UvxsDk+jnVluxI1p2X6Hiu6Iyf27w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_154704_799445_C93963D6 
X-CRM114-Status: GOOD (  21.64  )
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

From: Nicolas Belin <nbelin@baylibre.com>

Add a specific soundcard for mt8365-evk. It supports audio jack
in/out, dmics, the amic and lineout.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 345 ++++++++++++++++++++++++++++++
 1 file changed, 345 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
new file mode 100644
index 000000000000..fef76118f801
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek MT8365 Sound Card driver
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Nicolas Belin <nbelin@baylibre.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-common.h"
+#include <linux/pinctrl/consumer.h>
+#include "../common/mtk-soc-card.h"
+#include "../common/mtk-soundcard-driver.h"
+
+enum pinctrl_pin_state {
+	PIN_STATE_DEFAULT,
+	PIN_STATE_DMIC,
+	PIN_STATE_MISO_OFF,
+	PIN_STATE_MISO_ON,
+	PIN_STATE_MOSI_OFF,
+	PIN_STATE_MOSI_ON,
+	PIN_STATE_MAX
+};
+
+static const char * const mt8365_mt6357_pin_str[PIN_STATE_MAX] = {
+	"default",
+	"dmic",
+	"miso_off",
+	"miso_on",
+	"mosi_off",
+	"mosi_on",
+};
+
+struct mt8365_mt6357_priv {
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+};
+
+enum {
+	/* FE */
+	DAI_LINK_DL1_PLAYBACK = 0,
+	DAI_LINK_DL2_PLAYBACK,
+	DAI_LINK_AWB_CAPTURE,
+	DAI_LINK_VUL_CAPTURE,
+	/* BE */
+	DAI_LINK_2ND_I2S_INTF,
+	DAI_LINK_DMIC,
+	DAI_LINK_INT_ADDA,
+	DAI_LINK_NUM
+};
+
+static const struct snd_soc_dapm_widget mt8365_mt6357_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("HDMI Out"),
+};
+
+static const struct snd_soc_dapm_route mt8365_mt6357_routes[] = {
+	{"HDMI Out", NULL, "2ND I2S Playback"},
+	{"DMIC In", NULL, "MICBIAS0"},
+};
+
+static int mt8365_mt6357_int_adda_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MOSI_ON]))
+			return ret;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MOSI_ON]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MISO_ON]))
+			return ret;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MISO_ON]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	return 0;
+}
+
+static void mt8365_mt6357_int_adda_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MOSI_OFF]))
+			return;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MOSI_OFF]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MISO_OFF]))
+			return;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MISO_OFF]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+}
+
+static const struct snd_soc_ops mt8365_mt6357_int_adda_ops = {
+	.startup = mt8365_mt6357_int_adda_startup,
+	.shutdown = mt8365_mt6357_int_adda_shutdown,
+};
+
+SND_SOC_DAILINK_DEFS(playback1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(playback2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(awb_capture,
+		     DAILINK_COMP_ARRAY(COMP_CPU("AWB")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(vul,
+		     DAILINK_COMP_ARRAY(COMP_CPU("VUL")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("2ND I2S")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(dmic,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DMIC")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(primary_codec,
+		     DAILINK_COMP_ARRAY(COMP_CPU("INT ADDA")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6357-sound", "mt6357-snd-codec-aif1")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* Digital audio interface glue - connects codec <---> CPU */
+static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
+	/* Front End DAI links */
+	[DAI_LINK_DL1_PLAYBACK] = {
+		.name = "DL1_FE",
+		.stream_name = "MultiMedia1_PLayback",
+		.id = DAI_LINK_DL1_PLAYBACK,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback1),
+	},
+	[DAI_LINK_DL2_PLAYBACK] = {
+		.name = "DL2_FE",
+		.stream_name = "MultiMedia2_PLayback",
+		.id = DAI_LINK_DL2_PLAYBACK,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback2),
+	},
+	[DAI_LINK_AWB_CAPTURE] = {
+		.name = "AWB_FE",
+		.stream_name = "DL1_AWB_Record",
+		.id = DAI_LINK_AWB_CAPTURE,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(awb_capture),
+	},
+	[DAI_LINK_VUL_CAPTURE] = {
+		.name = "VUL_FE",
+		.stream_name = "MultiMedia1_Capture",
+		.id = DAI_LINK_VUL_CAPTURE,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(vul),
+	},
+	/* Back End DAI links */
+	[DAI_LINK_2ND_I2S_INTF] = {
+		.name = "I2S_OUT_BE",
+		.no_pcm = 1,
+		.id = DAI_LINK_2ND_I2S_INTF,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+				SND_SOC_DAIFMT_NB_NF |
+				SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(i2s3),
+	},
+	[DAI_LINK_DMIC] = {
+		.name = "DMIC_BE",
+		.no_pcm = 1,
+		.id = DAI_LINK_DMIC,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(dmic),
+	},
+	[DAI_LINK_INT_ADDA] = {
+		.name = "MTK_Codec",
+		.no_pcm = 1,
+		.id = DAI_LINK_INT_ADDA,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8365_mt6357_int_adda_ops,
+		SND_SOC_DAILINK_REG(primary_codec),
+	},
+};
+
+static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
+{
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(card);
+	int ret, i;
+
+	priv->pinctrl = devm_pinctrl_get(card->dev);
+	if (IS_ERR(priv->pinctrl)) {
+		ret = PTR_ERR(priv->pinctrl);
+		return dev_err_probe(card->dev, ret,
+				     "Failed to get pinctrl\n");
+	}
+
+	for (i = PIN_STATE_DEFAULT ; i < PIN_STATE_MAX ; i++) {
+		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
+							   mt8365_mt6357_pin_str[i]);
+		if (IS_ERR(priv->pin_states[i])) {
+			ret = PTR_ERR(priv->pin_states[i]);
+			dev_warn(card->dev, "No pin state for %s\n",
+				 mt8365_mt6357_pin_str[i]);
+		} else {
+			ret = pinctrl_select_state(priv->pinctrl,
+						   priv->pin_states[i]);
+			if (ret) {
+				dev_err_probe(card->dev, ret,
+					      "Failed to select pin state %s\n",
+					      mt8365_mt6357_pin_str[i]);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+static struct snd_soc_card mt8365_mt6357_soc_card = {
+	.name = "mt8365-evk",
+	.owner = THIS_MODULE,
+	.dai_link = mt8365_mt6357_dais,
+	.num_links = ARRAY_SIZE(mt8365_mt6357_dais),
+	.dapm_widgets = mt8365_mt6357_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8365_mt6357_widgets),
+	.dapm_routes = mt8365_mt6357_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8365_mt6357_routes),
+};
+
+static int mt8365_mt6357_dev_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
+{
+	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
+	struct snd_soc_card *card = card_data->card;
+	struct device *dev = card->dev;
+	struct device_node *platform_node;
+	struct mt8365_mt6357_priv *mach_priv;
+	int i, ret;
+
+	card->dev = dev;
+	ret = parse_dai_link_info(card);
+	if (ret)
+		goto err;
+
+	mach_priv = devm_kzalloc(dev, sizeof(*mach_priv),
+				 GFP_KERNEL);
+	if (!mach_priv)
+		return -ENOMEM;
+	soc_card_data->mach_priv = mach_priv;
+	snd_soc_card_set_drvdata(card, soc_card_data);
+	mt8365_mt6357_gpio_probe(card);
+	return 0;
+
+err:
+	clean_card_reference(card);
+	return ret;
+}
+
+static const struct mtk_soundcard_pdata mt8365_mt6357_card = {
+	.card_name = "mt8365-mt6357",
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8365_mt6357_soc_card,
+	},
+	.soc_probe = mt8365_mt6357_dev_probe
+};
+
+static const struct of_device_id mt8365_mt6357_dt_match[] = {
+	{ .compatible = "mediatek,mt8365-mt6357", .data = &mt8365_mt6357_card },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mt8365_mt6357_dt_match);
+
+static struct platform_driver mt8365_mt6357_driver = {
+	.driver = {
+		   .name = "mt8365_mt6357",
+		   .of_match_table = mt8365_mt6357_dt_match,
+		   .pm = &snd_soc_pm_ops,
+	},
+	.probe = mtk_soundcard_common_probe,
+};
+
+module_platform_driver(mt8365_mt6357_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8365 EVK SoC machine driver");
+MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform: mt8365_mt6357");

-- 
2.25.1


