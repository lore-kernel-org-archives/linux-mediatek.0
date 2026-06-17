Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A2CCD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYw5REkKxp624MWyS0jRryzwnCCP8XOG37PLDOHEuTk=; b=0HUi3gKdEUFGyqQkNhRRsoRkvq
	fvYlpCC7drk5UQi2zIem9x9VRmjhqLXCLXYm1AFkse+6RUC1KfSId90Nqlr1g8JpVRkmZhl4Ui9Wo
	KAmemiRzO3qjJ24lCc0rFCmMtLbvr9qYmgwnz4fVcb+g6+19P5W4rwm9vkc+mgDQpF9zHoVxTpMLc
	yY+Ejfxk+P/RL/xXhxaLn4FwGnXpljD2lYJY0rttzS4TaA9K9UiiJ7gadavtJncDfoYjEn+2ZdW18
	9ODyWvb1oH8HHzq/Ekf/YT5m8CvNmkCnaFeTNMF/PCXiO4My7UD+eIiCe5YolCuh9Bw/0yMxC5Sn8
	CZZsEAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndm-0000000H6dO-1MXs;
	Wed, 17 Jun 2026 10:37:02 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndj-0000000H6bO-3Zqm
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:37:01 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-307d0405e07so8458864eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692619; x=1782297419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYw5REkKxp624MWyS0jRryzwnCCP8XOG37PLDOHEuTk=;
        b=e0zmS6jwrNpjWMX8IFNfELxhCBBlERxOPjgOyrlHjDP0trm7ESOimw/+SC5fLF8aau
         Dw8fDMLTfE720uMP3WHi2JkEMU3FhPDoXanDekUvIAgdmxn2okdUfBAotelITYL1+YJn
         onqnVayuXbrPrW9CuAV6gZZ3hRGKOerc0B5Zj8y/Kwg7bfKPm0Si+DvoaUZniBZFDPRB
         zjly+zqplkCKfMQlButgQgJpBx4t1hGJ8jaC5o/2lTeTjXJia7DiUf8YbMKsT4ByCgc5
         7qINGPj/WryQidDX1p/lCBNw4K2qx7eHrmpoPHvrFFe7Uk6uCrV9gKy/Hm9WwxyPYrOH
         UMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692619; x=1782297419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYw5REkKxp624MWyS0jRryzwnCCP8XOG37PLDOHEuTk=;
        b=GlewpdLg+RC9FmAVSPwU3QEgd5CCH8Q8PGAusbiGgybf6/EeyMd/S42/id2v+xlmcS
         novwHXWKVb5zuPWS5GBBjOidGfze6uJNtFo0UNJeNojSZz+T1vofWlvv3OTXq9CNxZ0H
         F1g2XE1WpRX4lNrwI9oXQhNLdHdSrtyq9h7O73Q3vcKq7K5qW0/ARxHU/SLJwXibDkEC
         e+/qz2CFAK8AlnmMKF7phpUdcw3DkH1oa4MCGqmFUdgvOzKrsnUskm6nH9zL8HIaCucR
         yAoatIEBg4OWkn5L838UhZRYFFYZAPBn3WDPjfqeAEESC2Bomc8kZ4bwnVlqrjZV9hTX
         /qCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GIJ4WW6+RvZwudlODDdJHc2xqsslX97n+WaYaZcAMezcW9TfCeBPXas3bJh3SsEfqb3FWeCvyRuBb4yGorw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpYF8l62GhNMePI+9gDacW3Z6V3G9fBbVSussHVMJS9LxBS/RQ
	VjNl/gA2zEgUYk9slfwq3GPg58FVjo+viyZ+X8yvkJa0byXuGynHACst
X-Gm-Gg: AfdE7cmkfKKvmZmAL3AymTDPUBNnbV7YigW0984p2lhYcYKj4rkvJ8uonwni4nEzhrC
	dwSDu6BTQaf/Tc1vMosiUi3EA0AJ1+d3yhQZDp9sR9vcbGkJR28QYNqfeT/n5zjkNLcOWcuu6nD
	A5aL9iQ/b7cwkogIq6VQH0RI/YpaQ3HQ3mC/KQBy6ZlKtuvKSmnLbVnP6R5d4FCkmV3opUw42cl
	8s4CaUMeH2MIDIMiAKHFsf8rp+q+oXPASL6fnakPC5T1tuiFRWcinS2o5kmfpoXxHcM4bETQSEv
	Mqxfl+HKDYjKDP85Oax/7XkC2FwVau1+OZCyi6bwKFLcez6PcmPVh3zdgKZ/2K3G5W088Chsspr
	LG44faf5oyosgfjCwfHr4H6Ifvv5EaLjrD8yAeXBUGiqOwfnSwjscAoT8XIWJzHS0gQZzSvtdsa
	3otXrz69IL/40W5v2KIx1n7V7QGaF/Aqra9kXvTWX97DTk7S0=
X-Received: by 2002:a05:7300:1481:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-30bca21d5d8mr1702825eec.34.1781692619223;
        Wed, 17 Jun 2026 03:36:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 26/78] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:43 +0700
Message-ID: <20260617103235.449609-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033659_898330_40913C05 
X-CRM114-Status: GOOD (  12.29  )
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
 sound/soc/codecs/da7219.c | 59 +++++++++++++--------------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..171ee6346b2e 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -256,13 +256,10 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -270,13 +267,10 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -284,13 +278,10 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -298,13 +289,10 @@ static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -422,9 +410,8 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock)
+		ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -456,12 +443,12 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
-	if (ret == 0 && (val_old != val_new))
-		ret = regmap_raw_write(da7219->regmap, reg,
-				&val_new, sizeof(val_new));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock) {
+		ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
+		if (ret == 0 && (val_old != val_new))
+			ret = regmap_raw_write(da7219->regmap, reg,
+					&val_new, sizeof(val_new));
+	}
 
 	if (ret < 0)
 		return ret;
@@ -1167,15 +1154,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq)) {
-		mutex_unlock(&da7219->pll_lock);
+	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq))
 		return 0;
-	}
 
 	if ((freq < 2000000) || (freq > 54000000)) {
-		mutex_unlock(&da7219->pll_lock);
 		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1193,7 +1177,6 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	default:
 		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
-		mutex_unlock(&da7219->pll_lock);
 		return -EINVAL;
 	}
 
@@ -1205,15 +1188,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		if (ret) {
 			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
 				freq);
-			mutex_unlock(&da7219->pll_lock);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1298,9 +1278,8 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
 
 	return ret;
 }
-- 
2.43.0


