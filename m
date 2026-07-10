Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17580C44501
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAAlHsrpjipt9gkBkJt0Nmks4T8SC6yYNzmCZza5V2Y=; b=kO9peB3YuIXYTBvivExOvZXhFf
	0cd9WmY2hgPTNvaEXKvqX9pF2WvZEq9YrLsnwMkrg+dyvs78wksVvL1WUTFDsZwz4iDUXmQ4JDwdx
	RSRPxBd1c4+TITuPSXZWIUFeIps2r8OS06Lds9YOUcqVGXGttP/s5SO8Paq0MvztVnuqt9s5cBZX2
	3BVTDvESAobk3tbQj3EREwImSjF8SIqaXa8BAePwC/8G9kPTLUEGyQa3liglJst0FMospY8J2kbQK
	WirNvhjV7XKm4acxKL8h1Tpp+7gGxMzWZ955Z5oK3B/Hp3IYdNxCheOBNqe15id/sN3AmaOqrSBWz
	PnTYMvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3R1-0000000480a-078t;
	Fri, 10 Jul 2026 05:05:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Qz-000000047yr-1Dh3
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:05:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so529066b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659957; x=1784264757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAAlHsrpjipt9gkBkJt0Nmks4T8SC6yYNzmCZza5V2Y=;
        b=s2/yxtTTbTJEPA0S1qrdiUs6VGV7cLeWmqY9fBJdTyuV3kkWgsopfuoAxTE+3fdxxr
         ETmM3+UjRvJ/bgPkQzniGvPSwZ7kPsSF54TelTCGNOh7rY0zLQ0x14otWsyf2dLTd2qF
         TlytBxKqGFX++Yf9UZi56J9ac5bA173lKO3IZwH9ckMFEvM4xUQqdchcCgKLISWkI+Xy
         swTWRCi4NCtqHDMnTmLZao2878up6J7tl9yhJVz40y4DpytPEXMuwkDb9BaVPLMGUvY+
         Vo7S+fzF4ZjkM4V9+SlzMPAcabfQvW5W5fMbd4S0VHUl01gb4KNfNIGKxHYVaKTPkayq
         loww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659957; x=1784264757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAAlHsrpjipt9gkBkJt0Nmks4T8SC6yYNzmCZza5V2Y=;
        b=qAIIO+Blqv4UaFwpgRT0LXL8an0Rro5eSCV/G+P0+hlm/QtIEsmKdxcxaAXSpMTMQR
         ppAmE7tjgAh7HnVo8mst5WOd+kEx40b2s3lREiGJrK5yBz+t9bSbkpY5JKs9ErUdowbw
         t9GlF3amKSpzdrD88UjZ8LyMZF5WvcDTxTe0bEsFF64EA++PRnZZ4ejv15nAyMtTQEvU
         I7f8NSu3yRaGxqyXI5kzBgWa/8ZuiGpaTJ+yyQPLdJ4t3d0DhcnRlWJZcWshDm5sfMwC
         umxsIFcoR0krfvpflIip1TsmRVN7eSoy+tOu6YaBJHZb2T7lpGpn1F7DeiPhLoVhY/9A
         dPmg==
X-Forwarded-Encrypted: i=1; AHgh+Rrkj0NiHGKtWrncUcvlA6RByCTbVs/TyoSr/4RZLzTqgdubWAJVTgO1q7O1mCk548j0jMapgb4S5CWE7vB7ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkOcq35mYI0O6eIiB2fhtFWNmOJ1ReumWWdMHj+0pmOQ8gKxwB
	4Brz4VRC9CmfQygkpGt9HnRfAt/NSuKPfbW5yPveP/uO3dJRf94SrRWP
X-Gm-Gg: AfdE7cmywtrjHRbSXJKi65BGuIDPatXsLha+tougFMn+9rKVr+pqP0vKGYRJdiEAtXc
	xbqWErFsJ8UNXDq9a4xGYsf6OdrkLRNujeIv/KjKJtcELnmMmrc8yHL2RClytnqWDh8OnhTPMWu
	nRmVxh1shod4oDbcULQ1n5rfRLZO3+w/+xiif0HHF8ZLBUTb3bdpA9SdIFAAqaTE0fSSExmtAJE
	oLLh/ivh5rYVVCLax1y0JCxF8GgDWnk0FEB+XuY1abaQnQU40AAsSvydAvkcW80KSIRE7MzcKfw
	+uik/4Qck4c4HNfdcg4hje2p//V8mHcBGTzjTr7so/44sf/IMypuXhYnvn6PL0Uragf8j9PdHpv
	ht7DPbzQNlE9KI787KqQxJSilu+nf+qC5dXTmvRJ6nSCS37ABmkrPFbzRo/mTCWOldwL4h5STAc
	5h71uRB+N4woIhuazWx9LtKF9y4d7UfYaB+bg72d7ijSVhBNk=
X-Received: by 2002:a05:6a00:3397:b0:847:8d0e:5d83 with SMTP id d2e1a72fcca58-84870b70531mr1826855b3a.26.1783659956642;
        Thu, 09 Jul 2026 22:05:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:05:56 -0700 (PDT)
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
Subject: [PATCH v3 06/27] ASoC: codecs: fs210x: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:50 +0700
Message-ID: <20260710050511.14439-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220557_327984_30A0AFED 
X-CRM114-Status: GOOD (  16.76  )
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
 sound/soc/codecs/fs210x.c | 89 ++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 58 deletions(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index 5f381fe063e8..dce525ae50dd 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -4,6 +4,7 @@
 //
 // Copyright (C) 2016-2025 Shanghai FourSemi Semiconductor Co.,Ltd.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -770,9 +771,8 @@ static int fs210x_dai_hw_params(struct snd_pcm_substream *substream,
 	if (fs210x->devid == FS2105S_DEVICE_ID && fs210x->srate == 16000)
 		return -EOPNOTSUPP;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_set_hw_params(fs210x);
-	mutex_unlock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock)
+		ret = fs210x_set_hw_params(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set hw params: %d\n", ret);
 
@@ -789,15 +789,11 @@ static int fs210x_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	if (mute) {
 		cancel_delayed_work_sync(&fs210x->fault_check_work);
 		cancel_delayed_work_sync(&fs210x->start_work);
@@ -816,15 +812,11 @@ static int fs210x_dai_trigger(struct snd_pcm_substream *substream,
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -852,13 +844,11 @@ static void fs210x_start_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, start_work.work);
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	ret = fs210x_dev_play(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to start playing: %d\n", ret);
-
-	mutex_unlock(&fs210x->lock);
 }
 
 static void fs210x_fault_check_work(struct work_struct *work)
@@ -869,15 +859,13 @@ static void fs210x_fault_check_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, fault_check_work.work);
 
-	mutex_lock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing)
+			return;
 
-	if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return;
+		ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
 	}
 
-	ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
-	mutex_unlock(&fs210x->lock);
 	if (ret)
 		return;
 
@@ -990,7 +978,7 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	if (fs210x->scene_id < 1)
 		return -EINVAL;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 	/*
 	 * FS210x has scene(s) as below:
 	 * init scene: id = 0
@@ -999,7 +987,6 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	 */
 	index = fs210x->scene_id - 1;
 	ucontrol->value.integer.value[0] = index;
-	mutex_unlock(&fs210x->lock);
 
 	return 0;
 }
@@ -1018,7 +1005,7 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	/*
 	 * FS210x has scene(s) as below:
@@ -1028,17 +1015,14 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	 */
 	scene_id = ucontrol->value.integer.value[0] + 1;
 	scene_count = fs210x->amp_lib.scene_count - 1; /* Skip init scene */
-	if (scene_id < 1 || scene_id > scene_count) {
-		mutex_unlock(&fs210x->lock);
+	if (scene_id < 1 || scene_id > scene_count)
 		return -ERANGE;
-	}
 
 	if (scene_id != fs210x->scene_id)
 		is_changed = true;
 
 	if (fs210x->is_suspended) {
 		fs210x->scene_id = scene_id;
-		mutex_unlock(&fs210x->lock);
 		return is_changed;
 	}
 
@@ -1046,8 +1030,6 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set scene: %d\n", ret);
 
-	mutex_unlock(&fs210x->lock);
-
 	if (!ret && is_changed)
 		return 1;
 
@@ -1061,12 +1043,10 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 	struct fs210x_priv *fs210x = snd_soc_component_get_drvdata(cmpnt);
 	int ret = 0;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	if (fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
+	if (fs210x->is_suspended)
 		return 0;
-	}
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1087,8 +1067,6 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	return ret;
 }
 
@@ -1219,11 +1197,9 @@ static int fs210x_probe(struct snd_soc_component *cmpnt)
 	if (ret)
 		return ret;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_init_chip(fs210x);
-	mutex_unlock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	return ret;
+	return fs210x_init_chip(fs210x);
 }
 
 static void fs210x_remove(struct snd_soc_component *cmpnt)
@@ -1250,15 +1226,15 @@ static int fs210x_suspend(struct snd_soc_component *cmpnt)
 
 	regcache_cache_only(fs210x->regmap, true);
 
-	mutex_lock(&fs210x->lock);
-	fs210x->cur_scene = NULL;
-	fs210x->is_inited = false;
-	fs210x->is_playing = false;
-	fs210x->is_suspended = true;
+	scoped_guard(mutex, &fs210x->lock) {
+		fs210x->cur_scene = NULL;
+		fs210x->is_inited = false;
+		fs210x->is_playing = false;
+		fs210x->is_suspended = true;
 
-	gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
-	fsleep(30000); /* >= 30ms */
-	mutex_unlock(&fs210x->lock);
+		gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
+		fsleep(30000); /* >= 30ms */
+	}
 
 	cancel_delayed_work_sync(&fs210x->start_work);
 	cancel_delayed_work_sync(&fs210x->fault_check_work);
@@ -1287,14 +1263,11 @@ static int fs210x_resume(struct snd_soc_component *cmpnt)
 		return ret;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	fs210x->is_suspended = false;
-	ret = fs210x_init_chip(fs210x);
 
-	mutex_unlock(&fs210x->lock);
-
-	return ret;
+	return fs210x_init_chip(fs210x);
 }
 #else
 #define fs210x_suspend NULL
-- 
2.43.0


