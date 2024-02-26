Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C57C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+Fk5ARyfKwpPMc0wOcVSaPohn2gY9yOXX3nP3+GHb0=; b=shwMkRMKU9bkiZlVi0B1hWJaeU
	2SEEnIPipcXV4fhwyjrDYWS+wzM/QUZs8/gLn4h36CmgbSxyYkDhd80JPaJmAOFrxvwG3xnWO9Qtg
	fN5y16ZCZukqPk+ovD00hrGx8pn0c09P8mnIgX1Cwi4lGxSAJry97gKVMARsXJkndCsXWP2jY0tGs
	j4cVLnzKDFB2vgwX5yXqOUJbV/hMJzAAWyeXlAdQSNbn7eH8qwnKkKZ1Hs2Jh8bYIkFEN3rfI7pnO
	Y7v2ambFuNH7Cr3zGUDp3BanJBsmNeOcxOo1WOkb714bXf/fSNateSPCQSrvo1jjpTr9ba9jZjETm
	Xns3ea+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebZi-00000000z8e-0lIO;
	Mon, 26 Feb 2024 14:03:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYq-00000000yeU-0PBa
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=R+Fk5ARyfKwpPMc0wOcVSaPohn2gY9yOXX3nP3+GHb0=; b=SsO2UmMFG3ISUMn0ekt/vEbHPw
	KUglY0ACKIdY9wM1Dg9cCCJ7A4r13Lryn7RwmLU5Y5n2JzP0gUi+jliEWO/YP1+BnPvmZt/VM2lk/
	mE43brYTi3TuDJ6h7MqWh1ZIgOVhVpxsVebCYHLwKFo2ddMSECn39O/Uj5K7n81FACl0/uDEh6WT8
	PpRkO2aA2zH1S+2skzMPAWqWXY0IK5+5BoejXfbZOEhY7Il2Nu3ZA2CbuwN8VXxu97BB7mGKMN59L
	y9tXBU8XxeUmtVWSvsviYZ6TrDBGBPqPGrVaeNx6J6pzaEfehk9OfhflhjURQRD2rBucHlCl0wwCd
	aF0EWcGw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYd-00000001EVW-029R
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-412a9457b2eso1810725e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956134; x=1709560934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+Fk5ARyfKwpPMc0wOcVSaPohn2gY9yOXX3nP3+GHb0=;
        b=nyOIoufEFx1GB+hWYah+lEy6ACiV7EJHzTGne9XxV9Ag3OTRKNv+ijsAzGGVuRHqpi
         ivtDrPsLpBERhlUpKyi7r4aTn5zJdbAz8UZPVbpivcP8Hkf0xPIzYV2RPMm2vLMteaT8
         WjgccvEpT+mKz6nAqjyN2wR6qCwS29H8SEgY1R4+vBOK311sYoTMz0hWC6ZDeyRhlboj
         30zll4Xmpe8RRAGAmPwHMFxiTTfoqpfGnJ2q6lcX0udCE/x9XqcDLIjHMH4yekk+jO3T
         ATtVFmRtpoiIcKIbREIWFTZHW8BUE+V3V3G8/yuJmnFO5K3+Rw3syy62YKEbJFjB+R19
         nwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956134; x=1709560934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+Fk5ARyfKwpPMc0wOcVSaPohn2gY9yOXX3nP3+GHb0=;
        b=mfQhEpDw0P0Jzbxy4munXdclcFDyduEsGUXCDMQmWh4qCfWh9F1qLZwJ6hLBFQ3jDf
         p43iSB/Fhv5SFJxAmcE9AtJ4EjTYSEexu/B7eVkO1bZgKY96KVw+h2ef+0vkb5vWql3g
         zfFDJMjCwj4LYxmKgOpq26zZUpolrK+nyXbzNEyTj6cSPTW/NQjY5ucCkliox1D+Qe89
         zXpzllllhSTFoVdcmo97imiiX0nAubweyRcKpANL8+EDsUXz3E7ND+slyRna0l8vcQjH
         qNOcaNibDliW/zSqN/lCrMbJoiWp4yDLezo1C65K2X7MolmLJpdITj7ZqmSBaNEv8AmU
         m7rA==
X-Forwarded-Encrypted: i=1; AJvYcCUDsQGmcCTjeoweoPLR5hVsscS8IwWFok9Wle6/eWbbGu0jdKxhHZv94d/pIiz+IgFZzmPBbH2b6fLovQFzO6Wyf4QWC4LO7DdHwcZiJujLL7yg
X-Gm-Message-State: AOJu0YzO5fZiRXiTF5MeYo80eLI6lza7td5GX6Ult374JnlYo+bgX/Pq
	5Z+LnN070H76IS/gj/5OZVZ4kymRFGUQdUE7122kMsh3ZCoN1Vn8SwOXyQZIfcM=
X-Google-Smtp-Source: AGHT+IFoLzWWMWwawBeOKSrUJ4JswyDMTL5FYfExtg0qw0kHlD/Q58ZbMZB9XVjOHu1k17wyEvG2lg==
X-Received: by 2002:a05:600c:3584:b0:412:a0f9:391 with SMTP id p4-20020a05600c358400b00412a0f90391mr4273725wmq.2.1708956133833;
        Mon, 26 Feb 2024 06:02:13 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:13 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:43 +0100
Subject: [PATCH 05/18] SoC: mediatek: mt8365: support audio clock control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-5-4fa1cea1667f@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15462;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=Nv/SNlQULb1KRNckO+Ew2YoaagjfViQHWfHxhZF7KHA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncRVenGxBKherRH8juHQZksGti57QrriAKPJQs
 EceAtmGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURbruEA
 CGQv3LbJ7H8QbLt132D/0zBU/itb5aq6MedG4XI0QLdgt/jq1oYFeMnddvhRAdIHYNuuyAhZpFf6Io
 G/5G5RJkloyDUUsJlnf0l3a2Ia/9tIFckc/8f8R8l+FLUsNZlr7CeVVryF728BH0wW7FAGGzw5Sc8D
 oyFBehSGokO49ueK9ux7JY5cofZr5+LZLM8KX+Ccm6X7putxbMDK6UdaPRv3yOtJItyj2INWseiym1
 l4KrF2jDVZaJ70cSliBxDYeiFv7qfReYJ2tociNJVRTkesPo/P7L9RPElC5LNbN1O3AjcAGmf4au36
 xge5XtmLFgQB79j/z1sgQU8MU4Q0RTRZIKBdGtXHsIRhPw6KSsRTVl7AO7PBwGoK/Vs9ChmuwH5iil
 pqXv8o/KGlF1xoBBCMh6/jqo0xqHmV/lrhuRPpcod3mtJicNJfNAT+J/s9YQUfbvz8VgIySw2kmFxm
 Gt0lhpv1SU8ebM+QtY7qnnHeIkVV4+CNo7VHRsGiPk5+kDdL0lxgIrwPUBdE+ls7YZPi8sTAYeSjsr
 /OGq73de8FTrpJpIARLuUHb1fJr/wysWv9mW4wX7ma++zVB0KArx6AUgJI0PyVCHyNhZrHQJjkhqD3
 oTVac7bLX3+xP1sop+RMz4jl1BK3dcxfIaBqQSS5blwuCaEEiKcQArnT7+aQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140215_493102_779C18AB 
X-CRM114-Status: GOOD (  17.44  )
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

Add audio clock wrapper and audio tuner control.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c | 455 +++++++++++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h |  55 ++++
 2 files changed, 510 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
new file mode 100644
index 000000000000..2df781a22bf0
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek 8365 AFE clock control
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#include "mt8365-afe-clk.h"
+#include "mt8365-afe-common.h"
+#include "mt8365-reg.h"
+#include "../common/mtk-base-afe.h"
+#include <linux/device.h>
+#include <linux/mfd/syscon.h>
+
+static const char *aud_clks[MT8365_CLK_NUM] = {
+	[MT8365_CLK_TOP_AUD_SEL] = "top_audio_sel",
+	[MT8365_CLK_AUD_I2S0_M] = "audio_i2s0_m",
+	[MT8365_CLK_AUD_I2S1_M] = "audio_i2s1_m",
+	[MT8365_CLK_AUD_I2S2_M] = "audio_i2s2_m",
+	[MT8365_CLK_AUD_I2S3_M] = "audio_i2s3_m",
+	[MT8365_CLK_ENGEN1] = "engen1",
+	[MT8365_CLK_ENGEN2] = "engen2",
+	[MT8365_CLK_AUD1] = "aud1",
+	[MT8365_CLK_AUD2] = "aud2",
+	[MT8365_CLK_I2S0_M_SEL] = "i2s0_m_sel",
+	[MT8365_CLK_I2S1_M_SEL] = "i2s1_m_sel",
+	[MT8365_CLK_I2S2_M_SEL] = "i2s2_m_sel",
+	[MT8365_CLK_I2S3_M_SEL] = "i2s3_m_sel",
+	[MT8365_CLK_CLK26M] = "top_clk26m_clk",
+};
+
+int mt8365_afe_init_audio_clk(struct mtk_base_afe *afe)
+{
+	size_t i;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
+		afe_priv->clocks[i] = devm_clk_get(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clocks[i])) {
+			dev_err(afe->dev, "%s devm_clk_get %s fail\n",
+				__func__, aud_clks[i]);
+			return PTR_ERR(afe_priv->clocks[i]);
+		}
+	}
+	return 0;
+
+	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
+							     "mediatek,topckgen");
+	if (IS_ERR(afe_priv->topckgen)) {
+		dev_err(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
+			__func__, PTR_ERR(afe_priv->topckgen));
+		return PTR_ERR(afe_priv->topckgen);
+	}
+}
+
+int mt8365_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			dev_err(afe->dev, "Failed to enable clk\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+void mt8365_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_disable_unprepare(clk);
+}
+
+int mt8365_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+			    unsigned int rate)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_set_rate(clk, rate);
+		if (ret) {
+			dev_err(afe->dev, "Failed to set rate\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+int mt8365_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+			      struct clk *parent)
+{
+	int ret;
+
+	if (clk && parent) {
+		ret = clk_set_parent(clk, parent);
+		if (ret) {
+			dev_err(afe->dev, "Failed to set parent\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static unsigned int get_top_cg_reg(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8365_TOP_CG_AFE:
+	case MT8365_TOP_CG_I2S_IN:
+	case MT8365_TOP_CG_22M:
+	case MT8365_TOP_CG_24M:
+	case MT8365_TOP_CG_INTDIR_CK:
+	case MT8365_TOP_CG_APLL2_TUNER:
+	case MT8365_TOP_CG_APLL_TUNER:
+	case MT8365_TOP_CG_SPDIF:
+	case MT8365_TOP_CG_TDM_OUT:
+	case MT8365_TOP_CG_TDM_IN:
+	case MT8365_TOP_CG_ADC:
+	case MT8365_TOP_CG_DAC:
+	case MT8365_TOP_CG_DAC_PREDIS:
+	case MT8365_TOP_CG_TML:
+		return AUDIO_TOP_CON0;
+	case MT8365_TOP_CG_I2S1_BCLK:
+	case MT8365_TOP_CG_I2S2_BCLK:
+	case MT8365_TOP_CG_I2S3_BCLK:
+	case MT8365_TOP_CG_I2S4_BCLK:
+	case MT8365_TOP_CG_DMIC0_ADC:
+	case MT8365_TOP_CG_DMIC1_ADC:
+	case MT8365_TOP_CG_DMIC2_ADC:
+	case MT8365_TOP_CG_DMIC3_ADC:
+	case MT8365_TOP_CG_CONNSYS_I2S_ASRC:
+	case MT8365_TOP_CG_GENERAL1_ASRC:
+	case MT8365_TOP_CG_GENERAL2_ASRC:
+	case MT8365_TOP_CG_TDM_ASRC:
+		return AUDIO_TOP_CON1;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_mask(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8365_TOP_CG_AFE:
+		return AUD_TCON0_PDN_AFE;
+	case MT8365_TOP_CG_I2S_IN:
+		return AUD_TCON0_PDN_I2S_IN;
+	case MT8365_TOP_CG_22M:
+		return AUD_TCON0_PDN_22M;
+	case MT8365_TOP_CG_24M:
+		return AUD_TCON0_PDN_24M;
+	case MT8365_TOP_CG_INTDIR_CK:
+		return AUD_TCON0_PDN_INTDIR;
+	case MT8365_TOP_CG_APLL2_TUNER:
+		return AUD_TCON0_PDN_APLL2_TUNER;
+	case MT8365_TOP_CG_APLL_TUNER:
+		return AUD_TCON0_PDN_APLL_TUNER;
+	case MT8365_TOP_CG_SPDIF:
+		return AUD_TCON0_PDN_SPDIF;
+	case MT8365_TOP_CG_TDM_OUT:
+		return AUD_TCON0_PDN_TDM_OUT;
+	case MT8365_TOP_CG_TDM_IN:
+		return AUD_TCON0_PDN_TDM_IN;
+	case MT8365_TOP_CG_ADC:
+		return AUD_TCON0_PDN_ADC;
+	case MT8365_TOP_CG_DAC:
+		return AUD_TCON0_PDN_DAC;
+	case MT8365_TOP_CG_DAC_PREDIS:
+		return AUD_TCON0_PDN_DAC_PREDIS;
+	case MT8365_TOP_CG_TML:
+		return AUD_TCON0_PDN_TML;
+	case MT8365_TOP_CG_I2S1_BCLK:
+		return AUD_TCON1_PDN_I2S1_BCLK;
+	case MT8365_TOP_CG_I2S2_BCLK:
+		return AUD_TCON1_PDN_I2S2_BCLK;
+	case MT8365_TOP_CG_I2S3_BCLK:
+		return AUD_TCON1_PDN_I2S3_BCLK;
+	case MT8365_TOP_CG_I2S4_BCLK:
+		return AUD_TCON1_PDN_I2S4_BCLK;
+	case MT8365_TOP_CG_DMIC0_ADC:
+		return AUD_TCON1_PDN_DMIC0_ADC;
+	case MT8365_TOP_CG_DMIC1_ADC:
+		return AUD_TCON1_PDN_DMIC1_ADC;
+	case MT8365_TOP_CG_DMIC2_ADC:
+		return AUD_TCON1_PDN_DMIC2_ADC;
+	case MT8365_TOP_CG_DMIC3_ADC:
+		return AUD_TCON1_PDN_DMIC3_ADC;
+	case MT8365_TOP_CG_CONNSYS_I2S_ASRC:
+		return AUD_TCON1_PDN_CONNSYS_I2S_ASRC;
+	case MT8365_TOP_CG_GENERAL1_ASRC:
+		return AUD_TCON1_PDN_GENERAL1_ASRC;
+	case MT8365_TOP_CG_GENERAL2_ASRC:
+		return AUD_TCON1_PDN_GENERAL2_ASRC;
+	case MT8365_TOP_CG_TDM_ASRC:
+		return AUD_TCON1_PDN_TDM_ASRC;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_on_val(unsigned int cg_type)
+{
+	return 0;
+}
+
+static unsigned int get_top_cg_off_val(unsigned int cg_type)
+{
+	return get_top_cg_mask(cg_type);
+}
+
+int mt8365_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_on_val(cg_type);
+	unsigned long flags;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->top_cg_ref_cnt[cg_type]++;
+	if (afe_priv->top_cg_ref_cnt[cg_type] == 1)
+		regmap_update_bits(afe->regmap, reg, mask, val);
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_off_val(cg_type);
+	unsigned long flags;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->top_cg_ref_cnt[cg_type]--;
+	if (afe_priv->top_cg_ref_cnt[cg_type] == 0)
+		regmap_update_bits(afe->regmap, reg, mask, val);
+	else if (afe_priv->top_cg_ref_cnt[cg_type] < 0)
+		afe_priv->top_cg_ref_cnt[cg_type] = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_afe_enable_main_clk(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	mt8365_afe_enable_clk(afe, afe_priv->clocks[MT8365_CLK_TOP_AUD_SEL]);
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_AFE);
+	mt8365_afe_enable_afe_on(afe);
+
+	return 0;
+}
+
+int mt8365_afe_disable_main_clk(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	mt8365_afe_disable_afe_on(afe);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_AFE);
+	mt8365_afe_disable_clk(afe, afe_priv->clocks[MT8365_CLK_TOP_AUD_SEL]);
+
+	return 0;
+}
+
+int mt8365_afe_emi_clk_on(struct mtk_base_afe *afe)
+{
+	return 0;
+}
+
+int mt8365_afe_emi_clk_off(struct mtk_base_afe *afe)
+{
+	return 0;
+}
+
+int mt8365_afe_enable_afe_on(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->afe_on_ref_cnt++;
+	if (afe_priv->afe_on_ref_cnt == 1)
+		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->afe_on_ref_cnt--;
+	if (afe_priv->afe_on_ref_cnt == 0)
+		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
+	else if (afe_priv->afe_on_ref_cnt < 0)
+		afe_priv->afe_on_ref_cnt = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
+{
+	if (apll1)
+		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+			AFE_22M_PLL_EN, AFE_22M_PLL_EN);
+	else
+		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+			AFE_24M_PLL_EN, AFE_24M_PLL_EN);
+
+	return 0;
+}
+
+int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
+{
+	if (apll1)
+		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+			AFE_22M_PLL_EN, ~AFE_22M_PLL_EN);
+	else
+		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+			AFE_24M_PLL_EN, ~AFE_24M_PLL_EN);
+
+	return 0;
+}
+
+int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe,
+	unsigned int apll)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	mutex_lock(&afe_priv->afe_clk_mutex);
+
+	afe_priv->apll_tuner_ref_cnt[apll]++;
+	if (afe_priv->apll_tuner_ref_cnt[apll] != 1) {
+		mutex_unlock(&afe_priv->afe_clk_mutex);
+		return 0;
+	}
+
+	if (apll == MT8365_AFE_APLL1) {
+		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
+			AFE_APLL_TUNER_CFG_MASK, 0x432);
+		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
+			AFE_APLL_TUNER_CFG_EN_MASK, 0x1);
+	} else {
+		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
+			AFE_APLL_TUNER_CFG1_MASK, 0x434);
+		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
+			AFE_APLL_TUNER_CFG1_EN_MASK, 0x1);
+	}
+
+	mutex_unlock(&afe_priv->afe_clk_mutex);
+	return 0;
+}
+
+int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe,
+	unsigned int apll)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	mutex_lock(&afe_priv->afe_clk_mutex);
+
+	afe_priv->apll_tuner_ref_cnt[apll]--;
+	if (afe_priv->apll_tuner_ref_cnt[apll] == 0) {
+		if (apll == MT8365_AFE_APLL1)
+			regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
+				AFE_APLL_TUNER_CFG_EN_MASK, 0x0);
+		else
+			regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
+				AFE_APLL_TUNER_CFG1_EN_MASK, 0x0);
+
+	} else if (afe_priv->apll_tuner_ref_cnt[apll] < 0) {
+		afe_priv->apll_tuner_ref_cnt[apll] = 0;
+	}
+
+	mutex_unlock(&afe_priv->afe_clk_mutex);
+	return 0;
+}
+
+int mt8365_afe_enable_apll_associated_cfg(struct mtk_base_afe *afe,
+	unsigned int apll)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	if (apll == MT8365_AFE_APLL1) {
+		if (clk_prepare_enable(afe_priv->clocks[MT8365_CLK_ENGEN1])) {
+			dev_info(afe->dev, "%s Failed to enable ENGEN1 clk\n",
+				__func__);
+			return 0;
+		}
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_22M);
+		mt8365_afe_hd_engen_enable(afe, true);
+#ifdef ENABLE_AFE_APLL_TUNER
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_APLL_TUNER);
+		mt8365_afe_enable_apll_tuner_cfg(afe, MT8365_AFE_APLL1);
+#endif
+	} else {
+		if (clk_prepare_enable(afe_priv->clocks[MT8365_CLK_ENGEN2])) {
+			dev_info(afe->dev, "%s Failed to enable ENGEN2 clk\n",
+				__func__);
+			return 0;
+		}
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_24M);
+		mt8365_afe_hd_engen_enable(afe, false);
+#ifdef ENABLE_AFE_APLL_TUNER
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_APLL2_TUNER);
+		mt8365_afe_enable_apll_tuner_cfg(afe, MT8365_AFE_APLL2);
+#endif
+	}
+
+	return 0;
+}
+
+int mt8365_afe_disable_apll_associated_cfg(struct mtk_base_afe *afe,
+	unsigned int apll)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	if (apll == MT8365_AFE_APLL1) {
+#ifdef ENABLE_AFE_APLL_TUNER
+		mt8365_afe_disable_apll_tuner_cfg(afe, MT8365_AFE_APLL1);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_APLL_TUNER);
+#endif
+		mt8365_afe_hd_engen_disable(afe, true);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_22M);
+		clk_disable_unprepare(afe_priv->clocks[MT8365_CLK_ENGEN1]);
+	} else {
+#ifdef ENABLE_AFE_APLL_TUNER
+		mt8365_afe_disable_apll_tuner_cfg(afe, MT8365_AFE_APLL2);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_APLL2_TUNER);
+#endif
+		mt8365_afe_hd_engen_disable(afe, false);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_24M);
+		clk_disable_unprepare(afe_priv->clocks[MT8365_CLK_ENGEN2]);
+	}
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.h b/sound/soc/mediatek/mt8365/mt8365-afe-clk.h
new file mode 100644
index 000000000000..89377464c2b5
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Mediatek 8365 AFE clock control definitions
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#ifndef _MT8365_AFE_UTILS_H_
+#define _MT8365_AFE_UTILS_H_
+
+struct mtk_base_afe;
+struct clk;
+
+int mt8365_afe_init_audio_clk(struct mtk_base_afe *afe);
+
+int mt8365_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
+
+void mt8365_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
+
+int mt8365_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+	unsigned int rate);
+
+int mt8365_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+	struct clk *parent);
+
+int mt8365_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type);
+
+int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type);
+
+int mt8365_afe_enable_main_clk(struct mtk_base_afe *afe);
+
+int mt8365_afe_disable_main_clk(struct mtk_base_afe *afe);
+
+int mt8365_afe_emi_clk_on(struct mtk_base_afe *afe);
+
+int mt8365_afe_emi_clk_off(struct mtk_base_afe *afe);
+
+int mt8365_afe_enable_afe_on(struct mtk_base_afe *afe);
+
+int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe);
+
+int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe,
+	unsigned int apll);
+
+int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe,
+	unsigned int apll);
+
+int mt8365_afe_enable_apll_associated_cfg(struct mtk_base_afe *afe,
+	unsigned int apll);
+
+int mt8365_afe_disable_apll_associated_cfg(struct mtk_base_afe *afe,
+	unsigned int apll);
+#endif

-- 
2.25.1


