Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12820C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjBdDL8q0TXPbaumSZVEGnGR8oe3cQ900YMwBCNq4N4=; b=e2h8OB7p5nymn0qqOc2Vgc9uBG
	vUDd5tyHE+Wwtr+iyDTjyEVjOGb2S+NckInQY9NK+fCs2sRGFYYa0ge0p8LPIGDcSFZrFiILN11ht
	qnJRqH/yG1ptKOCIzlAu+Rg/y4tQl+uBRVNttYnvNjFBIT3ZorHuD7GOO8SRSfI5VXlJFn5aKaYGt
	Cls3+JBYtT5wFUqyj57KV5bEng/4+yLOyEO3MKWEBfPhL7hg6QAB99d6gDBfLZNYhPswVe6ABxSwP
	dBvDvPC9OahM4e3Aegm/mq/tps5HJbcNIJJtQTPdqiowuRBS2bFadlQZiN4vnCh4+0/2z/KyPvl/0
	1rO0BgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gx-000000098PR-0fgM;
	Tue, 21 Jul 2026 10:27:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gv-000000098O8-3W47
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gjBdDL8q0TXPbaumSZVEGnGR8oe3cQ900YMwBCNq4N4=; b=e9UZZnMavZzumPoZaSc8aVTGdQ
	XwXhu2r9cj4bSEeRbXDDyYkKcdf3mTw9e2U7FKOVHr8kf9i2uttqkre5bA0M2eXGvGIV8fAF+r9w1
	VSwG5/6dAr4BC7FPY6oxu/cQc+pwRf4+k2xNFRkkZkp57t9LdOLs4aedUFm2u0Q4p/5470h/Tp6uv
	9GEbYqrPJj6rgoYWFGS81v2nbARbz9BeWd1BPLizHtVHFKbgZZ3ZFTV01Nt9kqqtFSyu1h1M08fUV
	D+4PFRX4HGOdF0wHW+IeeEWoe0QtCI3UHyT0vW6my83TQ6ZOZGgAKfXzuQxBKarbkh2Wn++z4CwEb
	u6+l7fjg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7gt-0000000HRX3-05YS
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:12 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caed617615so123130695ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629628; x=1785234428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjBdDL8q0TXPbaumSZVEGnGR8oe3cQ900YMwBCNq4N4=;
        b=gTDW0bt+8nHIJ2E93DIReGsmTRzbZXYT0ajwZO9zYWaSUgortUGEYLuWWsAa0hn68C
         AFOS9gFcimbmvd6DSMH+pR7R4nhJQPL0MqotmmfRMup5iL4FgsjdbKWrzQWlaAERqIhl
         rJNlm7H2NpORWlRlzalz5Ruu9z+ZH9IuPoWvbKopXn9YHegen0S0I8BNaPgR2YaxFaRx
         eJPPqBiF6Ueg3zaTILdCKQO5mVbw8tjd34Cp6VjkiH2lys88V8dn9xHknXcgpgLMIgSw
         L6JI4adWNgSJCLlVD1YJQDsv7YPT4ab/0YiiY7H7PCfTZJ7IJ5vSZFH5N4evCiUh13+D
         1RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629628; x=1785234428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjBdDL8q0TXPbaumSZVEGnGR8oe3cQ900YMwBCNq4N4=;
        b=GWnsLoH6WMux1UtyxwaOjB4pckNa9SiqTihREtzY8hsRQtFAFUIjJqUPgg0J87h4Dc
         8wVzARTatQ7x6HiE1FsNcPZcYQ7ueKbEXTl1O2arTyghjM4XociWZq3Dpftd3PFDWGOa
         hLnb9olSPNIkvoM7eNis+F0NNzKrYRJHF9XzY4yGjTMFn9umR8iiBO6YGUFrP1PdRQ77
         jQQxeeZEw/ftQN2Ce/70UwsOCcTNQwVVy1iok+f/bnLLLUHpm0xpFRLlZEvd+n52W3C4
         VhOwzbhEfcyX5SQocuIFipKR+jgazf2J/B9v87u5kyBZmEHZblIykc/7jxwXcXFa1QJZ
         ELMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoayDWGRMEZRMS2WZPBwYsQAOfrfzQnXmZB4sgeGIfH9zOwE1XG7EmPNyNatRatuW9kiiiM+A+tZK+TSXFx+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRO6pEWSR1HWwEV6JcM43HlbVvVVOYQuMuWuJFYOGSeli2Xhsw
	9hKzZy9sVeD9s8A+qFQI09XfmMFf0z2hqAbQuX1ZteX4EDRFhiq3YNEA
X-Gm-Gg: AR+sD11fkuRNbe2o12sUVHKg7RmoHqp9054qao4Ek/5NoOM4eh+qVHJrI4M8FH0Qa5a
	9EgB0Kc6F2+Kd7KzFnPfg++9XEdhsjiv5lIkE0g+3+uQFcxL6rDxB8KFWuHm5OX9anJ9QtxDXEf
	bO/GErujqq09fzuVX28zR5VPEe16s7aaAO3IhlV+J7EZgjIJYnDR072Vrjy9fBFmW9+7dLRa3YA
	ydloBDCvYIskEp/wn9M3855PjnEZ9nh5yuImIJNgZiMwjZsDn/FDLRWyRaFxXpB55wXGkqXGk+y
	ZVg5CJhvo/sk9+GCOSjNwZbJfLMK7RDxAIfObGc36mUb7l9Z9JLAPJdrBIU+kLlZdeRnbSq/XnB
	g97MnPeAj0aYUlJM4E4ACvRN0zQjdFca0CsEIOEYTEbh2qQgZY4yYXmt9WHCRy5so7BQgB6aI+o
	EFN2g75yX8RGDUpoL+30pvxXmVI9wvgB4oh26h
X-Received: by 2002:a17:902:c950:b0:2cf:7e56:22c4 with SMTP id d9443c01a7336-2cf7e56274emr38581895ad.30.1784629628416;
        Tue, 21 Jul 2026 03:27:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:08 -0700 (PDT)
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
Subject: [PATCH v4 06/29] ASoC: codecs: fs210x: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:37 +0700
Message-ID: <20260721102600.523199-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112711_202639_6484FCEB 
X-CRM114-Status: GOOD (  16.82  )
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
index d794ff918b6f..510cbeea5b62 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -4,6 +4,7 @@
 //
 // Copyright (C) 2016-2025 Shanghai FourSemi Semiconductor Co.,Ltd.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -771,9 +772,8 @@ static int fs210x_dai_hw_params(struct snd_pcm_substream *substream,
 	if (fs210x->devid == FS2105S_DEVICE_ID && fs210x->srate == 16000)
 		return -EOPNOTSUPP;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_set_hw_params(fs210x);
-	mutex_unlock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock)
+		ret = fs210x_set_hw_params(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set hw params: %d\n", ret);
 
@@ -790,15 +790,11 @@ static int fs210x_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 
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
@@ -817,15 +813,11 @@ static int fs210x_dai_trigger(struct snd_pcm_substream *substream,
 
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
@@ -853,13 +845,11 @@ static void fs210x_start_work(struct work_struct *work)
 
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
@@ -870,15 +860,13 @@ static void fs210x_fault_check_work(struct work_struct *work)
 
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
 
@@ -991,7 +979,7 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	if (fs210x->scene_id < 1)
 		return -EINVAL;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 	/*
 	 * FS210x has scene(s) as below:
 	 * init scene: id = 0
@@ -1000,7 +988,6 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	 */
 	index = fs210x->scene_id - 1;
 	ucontrol->value.integer.value[0] = index;
-	mutex_unlock(&fs210x->lock);
 
 	return 0;
 }
@@ -1019,7 +1006,7 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	/*
 	 * FS210x has scene(s) as below:
@@ -1029,17 +1016,14 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
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
 
@@ -1047,8 +1031,6 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set scene: %d\n", ret);
 
-	mutex_unlock(&fs210x->lock);
-
 	if (!ret && is_changed)
 		return 1;
 
@@ -1062,12 +1044,10 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
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
@@ -1088,8 +1068,6 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	return ret;
 }
 
@@ -1220,11 +1198,9 @@ static int fs210x_probe(struct snd_soc_component *cmpnt)
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
@@ -1251,15 +1227,15 @@ static int fs210x_suspend(struct snd_soc_component *cmpnt)
 
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
@@ -1288,14 +1264,11 @@ static int fs210x_resume(struct snd_soc_component *cmpnt)
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


