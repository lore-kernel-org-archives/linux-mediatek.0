Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B084CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=; b=xbWCgLAo8M3m4ykJB4ZADR8AE6
	dhQDRhqofOp2ib58bC4By96OUcRFtyOufh6gA++y8XUs5aGpqK1z7tS7X41l9oFbwMkFHh8sQv9Db
	cDkrFHqFGIJq76pahLC8Hz1Pmd2G2DMQr+k7M6scA3tO6Jr6xFvECPgt8nm5KCFJB20cyb7AcTHPq
	O5HG2+breaapxdneky9DjxCKK9mamKIG4jCVLqgHR+J0sHmnhqHkWB7ogMbYp9boZB3fzI9qSErtY
	yBH3oYdF7LFdhrSrJyad7FRFTGo0JkJj6+icXthvDLk1M3ZrErMjBu4RQKjf55w1awLYP/ftuVXFq
	qWmHrjLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAce-00000001991-1zIx;
	Thu, 18 Jun 2026 11:09:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcb-0000000196w-3lkL
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:09:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso5425045ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780961; x=1782385761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=;
        b=fhIZDRnIR7UhN/2JoRhIp6YMKJRJFS2S1JVR2RFKdKelHCp/zyFXrpbLXvzVRgqecr
         7+tQKUM1dYgpedZPmmkdo/w7K17ZZSbnp9gEflOffRGeSnyacm1lx+h2IZVFXkGImqgo
         pKRCZBgKl5KLAotsy+WNuulVCUFzkiP1KA5BSft4DzSAr8Dzf33n6vZPf5YJdytCkfmx
         3ZmYyEwhsr+wIg3SPrT1KqIGbRiVC+bqPJuPDfFRNQqnd3cCbjYGU6wv+CTZpjaxhQql
         41iowK5WzRvPdVJLm5Wx6XNJAv8mV1PV4OsUleAUOuieJAJJmF2Zv7k//p6CEuIAxzRe
         9T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780961; x=1782385761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=;
        b=npX54hPH7tyYm/eKuHMQIBjiOlJHndJ5yu9KvTxoNDia3dvJLebcu4Bxgv8Ta8ayRI
         ET3Y1l/uDiUaSf2CcjgjqCxA4vQVF7maIqVcyiVnhQzHA3FQv5UT+7NkqSc3pJadSnIm
         m3rgOVFDBHMmyMVgX35KnbJkAIIY/27S085giebcIdtPqskw9RlAk0klEvemmRaN1CJR
         E9cKv7ilwx10qaj49dy3nQYrBT/BqKi6VnNW5RY09rEuR1PxmQlx4hMqcYKuVNtZsfCp
         s5VrHB09t+BwSXFNrnqi2HyYuKxlh/12HI9DR9jn9HH/eox4+6bPT/kVNxHSOmqQz2P8
         5w7g==
X-Forwarded-Encrypted: i=1; AFNElJ9s/kF5sHzQI9x/iLMJ4wmg5OzE4XoKMVlTg6qT2s/ukqHEeXt/AySZZ/A2W1SrE2QRIcxTf02ZsBm+MJHJXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhAUgTV7QimIe4LiuXt+C4PzLFK4eJN2Zkg6dUGNEigaDERyez
	sO7+iVrKBPyfI3rV2L3ZEonDxnBE1p97NjtvI6pHmGw+vx+eoXXWqy46
X-Gm-Gg: AfdE7clTOlS5YRCvDFSfpHlW9b4WCMTfmjQN1Y26TP2LXdsoMw90FqOzHRd5j96dzdZ
	8bDEdqFoMl0B0UZUbq2weQh0AR9+AZ9vorwLlctH7gWIA6i6w4pCAuLuUJbFAqp2P5Lv7M9ebnT
	vhXjCOB8Dr8cJMcBfYtEwCO1Ohexuwr6KZNKg4X1L0iTOZTrE9cRBJVe0NsgpuaOV7cMkGqyN/1
	1F4zpTq3KgGztHrow7u8G6UAkYFr0cLewQwWgnMv3OqRFBeWSSFpmJdeSYbDQhGvCHIK/HvhXH/
	yQX660HPXu/w8DCEB5Yz44idv8wwOTTySR5/5d4nppRkpmVAhdVtJ7RvYbbZd5KXMhx0L9sU4MY
	i0gI2ZamOs7Xu/O8tMQEMi//4SWegYdSnK1hDMR+sOmR9Oqe8YpljPRGfAZj/t+Gu7NMfJBqsWL
	0qTmt3rjr9Uu7EASacTE+0QjOpplrckgwwGLA0BlrL3EgeU84=
X-Received: by 2002:a17:902:f688:b0:2c6:c66b:4b03 with SMTP id d9443c01a7336-2c6e4746cb1mr34135155ad.10.1781780960796;
        Thu, 18 Jun 2026 04:09:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:20 -0700 (PDT)
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
Subject: [PATCH 60/78] ASoC: codecs: tscs42xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:09 +0700
Message-ID: <20260618110827.232983-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040921_952070_1F84ECB1 
X-CRM114-Status: GOOD (  10.88  )
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
 sound/soc/codecs/tscs42xx.c | 44 ++++++++++++-------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index dba581857920..66810b992935 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -210,23 +210,21 @@ static int power_up_audio_plls(struct snd_soc_component *component)
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C, mask, val);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL on (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	if (!plls_locked(component)) {
 		dev_err(component->dev, "Failed to lock plls\n");
 		ret = -ENOMSG;
-		goto exit;
+		return ret;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
 
 	return ret;
 }
@@ -236,26 +234,24 @@ static int power_down_audio_plls(struct snd_soc_component *component)
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL1,
 			RV_PLLCTL1C_PDB_PLL1_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL2,
 			RV_PLLCTL1C_PDB_PLL2_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
 
 	return ret;
 }
@@ -269,13 +265,11 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 		(struct coeff_ram_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	memcpy(ucontrol->value.bytes.data,
 		&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE], params->max);
 
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
 	return 0;
 }
 
@@ -290,14 +284,14 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 	unsigned int coeff_cnt = params->max / COEFF_SIZE;
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	tscs42xx->coeff_ram_synced = false;
 
 	memcpy(&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE],
 		ucontrol->value.bytes.data, params->max);
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	if (plls_locked(component)) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram,
@@ -305,16 +299,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		tscs42xx->coeff_ram_synced = true;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
 
 	return ret;
 }
@@ -385,19 +375,17 @@ static int dac_event(struct snd_soc_dapm_widget *w,
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	if (!tscs42xx->coeff_ram_synced) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram, 0x00,
 			COEFF_RAM_COEFF_COUNT);
 		if (ret < 0)
-			goto exit;
+			return ret;
 		tscs42xx->coeff_ram_synced = true;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
 
 	return ret;
 }
@@ -926,12 +914,10 @@ static int setup_sample_rate(struct snd_soc_component *component,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->samplerate = rate;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
@@ -1253,12 +1239,10 @@ static int tscs42xx_set_dai_bclk_ratio(struct snd_soc_dai *codec_dai,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->bclk_ratio = ratio;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
-- 
2.43.0


