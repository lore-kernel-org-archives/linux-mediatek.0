Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136F1C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyECFtJ7X+vTPg/YDAk816+hNj+oaoWmt9Pmr3ttgMk=; b=g51oVLCKiVnz4TvWkN0/KWncoz
	cmckTFVsnJS7KYQ3teDrv5EARsloeSVhqFum1naE4R1IAD9g5gBweLoDhwN93IhpIKdaaLeV/R/Kq
	4o2c8/9SZ7GyJfnT7f7i76hCIN6YvWyXul6aMsdy4dm4X3ojKiO87b5oE6Ij1mTfmlFMd8qjMX1Ik
	HtiVg3iES2wXh9GS2nuW7mZ0EBUqprk2Gr1ViA5piNQSC5XH1CM6QWqg76VmNLSHdBqexLPppykdP
	yDPC5jRwdtALqQEMgLoTsY2BlE346LDrLUql/8tXcx+aEtbj1h8Q+vuCPfyhNZY/Uo2aYhoxWz/la
	4MOgluhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5O-0000000FymF-0NdP;
	Tue, 30 Jun 2026 06:36:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5M-0000000FykE-22YC
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EyECFtJ7X+vTPg/YDAk816+hNj+oaoWmt9Pmr3ttgMk=; b=bOOoMRwRnSSmmkGCV5H1YXTNJT
	heyYAt4E+wVQzHcrS4yDREi5MH0ZYh+c3/58dUqp+seIIrdZtC/+nqe/4xVxeUiEfWopcRYGMdWb8
	B8jgkNeuN6Ux2Yc0XDQkgAaMVVhL8BKM8wwhN/EkNb17HxrEqiiD+DfHZnLP7lrGlq0MNzJd9tIqP
	8E3yLlNJqRZN9CBnGUqv+eOCSSWlpRVxECSBv3eOSGPiS7MBtWKGv7l5wcQM1XwbDVDwPXWGLoyCf
	0+/AVFcMEGeIOZ24colofA4cKtMyYtTep0XffM4IeGAQB6omgyOsJFdYBQCm2MdLTTFmfLRRePZLG
	5/U/zjaQ==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS5F-00000001ZEG-0o7u
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:36:42 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-845e363246aso1935003b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801395; x=1783406195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyECFtJ7X+vTPg/YDAk816+hNj+oaoWmt9Pmr3ttgMk=;
        b=Vw/CFJEw5nUal5zEkFb757IhQJIZUyzcEnXYvtMTep06QEC7S6e6hdGu55Zrtizgw5
         f54xqzUUJJq4lc6gzjVCNd3X73j9Ifk7Ov077lenjTB9AIOG/rBDVv4uOlnjml4qiP6k
         RaEeb6o2YwnClOXZMWlEZyUcUDXZ2EzrpCI2AsOlFeYaAqYO/sq+sqK+2JJZJ7E+w3ZG
         EOH/EBDU2GWTlx5Z2Vwyd6wuomAY+dZFqZF1G18Zl/O/kkmBtd+krmdPcEypQHf8wuKQ
         YtlkzfCxNjq5oNZhr4q9izl30WzzLTKCAAiJtKXafQGhRKk2sC1hU0sPsI2sRRBNYso7
         3lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801395; x=1783406195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EyECFtJ7X+vTPg/YDAk816+hNj+oaoWmt9Pmr3ttgMk=;
        b=ijXRh02LA3xHDVGfSGrcpKLTpQZ2c2/o3QuS3rtoaLLfXIlpc14rnARN4YDD93kf9Z
         p99SP/B+3Esx++RgqeAOv5WHKHmPUrhGnLdAa2VpWNgWWShhoNHb3W4U83py/HBzmi+P
         yy4LmjPPBudeRiPe8W6soilW1jjSTMrs1YAmVAMk+pfnjWjs999O7d+agi6Nq3kvc/V3
         V2fUgB1Fc5Ad7Wvl9v0tKp6eBE/kNf/yX9tUaeQ3kRJ57yPBjp7jbP+FOH6Xm5xOkBke
         vbReesc0dsZ6oC5GHIhdp+Uuqpg7RJnIUwRzKzmqCIk6GkeSWLpvHFY0ePCjV44E6DF3
         nd4A==
X-Forwarded-Encrypted: i=1; AHgh+RoWei964hwZPuXfRPW+jOT0d06FiOCR7FkdiGaFyoRyIdDqZnuM4qvDdVhXt56PxM2WjwOdnDSdiOYEbNx9MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+GAaF6LC7cdacdTUdhrq/DOXpIZRiteMNaWNua667ZQpEdD6m
	P5Ma4aND6ewz3i0GSCDr7q5ZlxUTur8g98tmPtObeZK5jo9bDVaQJgoH
X-Gm-Gg: AfdE7clwiUL0K8nlCHKL8sB2MSLkEEKvrXFCa+iqeeLBy/EcbtAdEveDVbapjIGbdVI
	K6/mwQ9XC6oejT0+6V74gw/4KqeGRGCn3JhdbLhQ39PP0BSUP4iBCXw0nsL6DrBBbq9F52/A+71
	7iQrz1eWb0j2/G2fBNXuS/NE4Otp6V0Rs89Szt8xhRe/6ZGOOcBCjsWUZCRwMPr4VW3pbCvBVvp
	Jc7swb2n2nwoVuzIIF0KPlDKG/rlY+hMQM1qW2+a0StaZ3WGD6g9lmoQtXFKnjJ2Cuex/cHFxyp
	IvnCrCyRVizpsj56h2E8CfXOTgXFMMcu05pXYF8IeiiJ/e2AJD23o1BuZlaN0WIEDlCFvwOm95X
	c71n7ye4hK/jLmOZj+o1hN0aLvqfGxO8010HizItUWoZQ2gtAZ60EBdmkWswTJqJ6Wn65kkeXNh
	fLF3bQNitMBsCJ6YcY4VrnQm4TIBHICqIMD9f07FSAafQo6Kg=
X-Received: by 2002:a05:6a00:1253:b0:845:e2da:91a3 with SMTP id d2e1a72fcca58-8479f27b323mr1782322b3a.30.1782801395033;
        Mon, 29 Jun 2026 23:36:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:31 +0700
Message-ID: <20260630063449.503996-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073637_637936_D79529C6 
X-CRM114-Status: GOOD (  14.98  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/idt821034.c | 121 +++++++++++++++--------------------
 1 file changed, 51 insertions(+), 70 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 084090ccef77..078de6c9c395 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/bitrev.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
@@ -413,12 +414,12 @@ static int idt821034_kctrl_gain_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
-	if (IDT821034_ID_IS_OUT(mc->reg))
-		val = idt821034->amps.ch[ch].amp_out.gain;
-	else
-		val = idt821034->amps.ch[ch].amp_in.gain;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		if (IDT821034_ID_IS_OUT(mc->reg))
+			val = idt821034->amps.ch[ch].amp_out.gain;
+		else
+			val = idt821034->amps.ch[ch].amp_in.gain;
+	}
 
 	ucontrol->value.integer.value[0] = val & mask;
 	if (invert)
@@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(mc->reg)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -466,21 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->gain == val) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->gain == val)
+		return 0;
 
 	if (!amp->is_muted) {
 		ret = idt821034_set_gain_channel(idt821034, ch, gain_type, val);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
 	amp->gain = val;
 	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -495,11 +493,11 @@ static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(id);
 
-	mutex_lock(&idt821034->mutex);
-	is_muted = IDT821034_ID_IS_OUT(id) ?
-			idt821034->amps.ch[ch].amp_out.is_muted :
-			idt821034->amps.ch[ch].amp_in.is_muted;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		is_muted = IDT821034_ID_IS_OUT(id) ?
+				idt821034->amps.ch[ch].amp_out.is_muted :
+				idt821034->amps.ch[ch].amp_in.is_muted;
+	}
 
 	ucontrol->value.integer.value[0] = !is_muted;
 
@@ -521,7 +519,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 	ch = IDT821034_ID_GET_CHAN(id);
 	is_mute = !ucontrol->value.integer.value[0];
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(id)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -531,20 +529,17 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->is_muted == is_mute) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->is_muted == is_mute)
+		return 0;
 
 	ret = idt821034_set_gain_channel(idt821034, ch, gain_type,
 					 is_mute ? 0 : amp->gain);
 	if (ret)
-		goto end;
+		return ret;
 
 	amp->is_muted = is_mute;
 	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -629,7 +624,7 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
 	ch = IDT821034_ID_GET_CHAN(id);
 	mask = IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT821034_CONF_PWRUP_TX;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	power = idt821034_get_channel_power(idt821034, ch);
 	if (SND_SOC_DAPM_EVENT_ON(event))
@@ -638,8 +633,6 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
 		power &= ~mask;
 	ret = idt821034_set_channel_power(idt821034, ch, power);
 
-	mutex_unlock(&idt821034->mutex);
-
 	return ret;
 }
 
@@ -717,9 +710,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_RX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_RX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set tx tdm slot failed (%d)\n",
 					ch, ret);
@@ -742,9 +735,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_TX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_TX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set rx tdm slot failed (%d)\n",
 					ch, ret);
@@ -771,7 +764,7 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u8 conf;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -785,12 +778,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	default:
 		dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
 			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
 	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -802,7 +793,7 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 	u8 conf;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -816,12 +807,10 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
 			params_format(params));
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
 	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -897,11 +886,11 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	ret = idt821034_set_codec_conf(idt821034, 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		idt821034->amps.ch[i].amp_out.gain = IDT821034_GAIN_OUT_INIT_RAW;
@@ -909,23 +898,22 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_RX,
 						 idt821034->amps.ch[i].amp_out.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		idt821034->amps.ch[i].amp_in.gain = IDT821034_GAIN_IN_INIT_RAW;
 		idt821034->amps.ch[i].amp_in.is_muted = false;
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_TX,
 						 idt821034->amps.ch[i].amp_in.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_set_channel_power(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
 	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -965,7 +953,7 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_raw = idt821034_get_written_slic_raw(idt821034, ch);
 	if (val)
@@ -974,8 +962,6 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 		slic_raw &= ~mask;
 	ret = idt821034_write_slic_raw(idt821034, ch, slic_raw);
 
-	mutex_unlock(&idt821034->mutex);
-
 	if (ret)
 		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -991,9 +977,8 @@ static int idt821034_chip_gpio_get(struct gpio_chip *c, unsigned int offset)
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
-	ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex)
+		ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
 	if (ret) {
 		dev_err(&idt821034->spi->dev, "get gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -1015,9 +1000,8 @@ static int idt821034_chip_get_direction(struct gpio_chip *c, unsigned int offset
 	struct idt821034 *idt821034 = gpiochip_get_data(c);
 	u8 slic_dir;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 	slic_dir = idt821034_get_slic_conf(idt821034, ch);
-	mutex_unlock(&idt821034->mutex);
 
 	return slic_dir & mask ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
@@ -1034,7 +1018,7 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 	if (mask & ~(IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN))
 		return -EPERM;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) | mask;
 
@@ -1044,7 +1028,6 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1060,7 +1043,7 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 	if (ret)
 		return ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) & ~mask;
 
@@ -1070,7 +1053,6 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1079,23 +1061,22 @@ static int idt821034_reset_gpio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	/* IO0 and IO1 as input for all channels and output IO set to 0 */
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		ret = idt821034_set_slic_conf(idt821034, i,
 					      IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_write_slic_raw(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 
 	}
 	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
-- 
2.43.0


