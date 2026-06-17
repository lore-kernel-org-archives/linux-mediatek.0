Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D7ACD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPqL6V1iqK0+FGF4zW5M8iBT6jxKR4lxbeBDY9EaT9k=; b=CTyMEaVevpg3HFS1AcWooExCxL
	A052rpV+iWoxvfM66CSD7/z3LkQ7PSN6aeQumpIM7D5eVAGg11f1nNCKZoB6ECiKUdOSbmjgAcGg9
	SZPsvT8Rw0xuejsPczi5haovSYQqIKkOKImKMr9d2kaSptf4n/mRqhKgGqB7cp77RL7i8Fy6IAt7G
	rMioWfvvs2zbklRBE3QPlSRghR5994+CRp/ZP7hL8nA/ElRFvyGmE7yG8VXELpXMIje7wRE6N+ozS
	bm1kw/QTAtmA8epG1tn+zVl10m+QtTkj50eN6IoJ5yQdjkZbtO3akiRtQpMJ49OZOm4arfvZqjom9
	To0IxLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnaO-0000000H3mV-04Kx;
	Wed, 17 Jun 2026 10:33:32 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnaL-0000000H3kh-107i
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:30 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1620550eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692408; x=1782297208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPqL6V1iqK0+FGF4zW5M8iBT6jxKR4lxbeBDY9EaT9k=;
        b=pthfxjdxb4pUztAOxFLu8DgnEnfOWTQlpckuaPECAu8GJlFcBQctjY7N0zdnscu6Ih
         OYRMbWtalnWUuwBASeS2jYZTvHsTLoe692UD/16rdW83n31yYf7e100Mwcn3knOIxCag
         IQR3d4hPZqEaNisi+6vpf7KnFFLcvNyYSLwluDhY8BitvFgpradZR11+rzKBr9Jbc6qr
         f9AUsjtBC23RgXUTICfD8Q88LLkQS1FSzNIL/nphVO+8BIYcAGxTCdtv7Jn6ufAjWx8v
         r6YXOJT0fxO57Xnb7lpqj1oAe4uW/9dhI4sSI7DGukAyHL8NcbWVRrg7eWLpdwHufH2X
         wdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692408; x=1782297208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPqL6V1iqK0+FGF4zW5M8iBT6jxKR4lxbeBDY9EaT9k=;
        b=WREc9zeS04jZxtZ4NWQQyORo1cpNzG/Huz0PvWljWvz6aHx4fn9CjynWr+2OxnYgyX
         JkuAxu7F57/R2mCmQ+Ud9fCIB+hy9UZ/LGHqotu3IDcaouUYIyRrEmOLKE8uAQZpqRus
         2MF1ZAWBIPuSbl90lBzBsXPT0BSSZwqeySzQ9wGdfWOthntrv32Q4BtrKDNYtYfWvamb
         U7BPwZHPM6j5tbt79bM9+8w7KalCOIdMJIrKXrs4st9KEFoV8bfI4KUrY32kPX2IkVFQ
         /PxmaApoMpt3SjG1Mn1CgxXFKmnIDE5RPPT3l5hEYKHUKZ0ATYoGTB9Qe3uqDW1rollj
         Z6vg==
X-Forwarded-Encrypted: i=1; AFNElJ9IZjdq2dHd6HsCR8lmVp7w4ZMU03zxdWNKcKrkrLkF+o7izzIXvz3yF0QMaNSpkinQojasLbZUHnP34fE+WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7SRzk0A/0hrtu+X8guNrGBpkYlDlfUer1cTghMmRZbXRGZZ2l
	UQgaxXKPGk2KdYnLxNGowRoUm4pyWczpq+MakOFjZPdGGwX9e5tAXye7
X-Gm-Gg: AfdE7cmfFYFp/CqvFa3YMCiMeus/nuJuvm5tamRB0ajoXTOEKyqsbSOGzvQcedpb1M9
	hXuCtGC6rT+oAmRjrPlb8tkZAcz5czdsgu9rb4GHcbbVq2mu0Tm0ydllaGO4lqPbM5bpcI04gte
	Hm41rxYUK3axext80z6xtTJZg+QWtFfNZKWenIlP/3AGJm8kbLSsVNkiTHR6dyomUuSLfESpxYC
	tV+owlEi72eNBoB0u4Jl38mAyaC/vSL+wGnEFxC7mmSA/q4DWmUbnCJT/eRy9novCWHqYmYSulu
	Dl5a6bGhlQLbc9LwGK9l9ml3nrfhGQvyVEm/zKymIIHxEJNydcUgROFooRDUZZmixljxBkyT2MO
	vHnQ3+iLyQ7guqO/XY7H+Kw8e0+fm0qTancuHMWnKLOxEOL5qcqdz0S/8dn7spEW90LDUOktNyh
	ec2Rpj/yaOsjj2rqw7wVvLC1SiFWrAv2d2GmSSTdS5Se+X9JU=
X-Received: by 2002:a05:7301:100b:b0:2f1:6252:f8fe with SMTP id 5a478bee46e88-30bc9991ecbmr1870511eec.3.1781692408546;
        Wed, 17 Jun 2026 03:33:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:28 -0700 (PDT)
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
Subject: [PATCH 03/78] ASoC: codecs: arizona-jack: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:20 +0700
Message-ID: <20260617103235.449609-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033329_289266_A12A5245 
X-CRM114-Status: GOOD (  22.06  )
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
 sound/soc/codecs/arizona-jack.c | 194 +++++++++++++++-----------------
 1 file changed, 92 insertions(+), 102 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a9063bac2752..fc09b31943a6 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -528,12 +528,11 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	int ret, reading, state, report;
 	bool mic = false;
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If we got a spurious IRQ for some reason then ignore it */
 	if (!info->hpdet_active) {
 		dev_warn(arizona->dev, "Spurious HPDET IRQ\n");
-		mutex_unlock(&info->lock);
 		return IRQ_NONE;
 	}
 
@@ -546,7 +545,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	ret = arizona_hpdet_read(info);
 	if (ret == -EAGAIN)
-		goto out;
+		return IRQ_HANDLED;
 	else if (ret < 0)
 		goto done;
 	reading = ret;
@@ -559,7 +558,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	ret = arizona_hpdet_do_id(info, &reading, &mic);
 	if (ret == -EAGAIN)
-		goto out;
+		return IRQ_HANDLED;
 	else if (ret < 0)
 		goto done;
 
@@ -596,9 +595,6 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	if (state)
 		info->hpdet_done = true;
 
-out:
-	mutex_unlock(&info->lock);
-
 	return IRQ_HANDLED;
 }
 
@@ -707,15 +703,13 @@ static void arizona_micd_timeout_work(struct work_struct *work)
 						struct arizona_priv,
 						micd_timeout_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	dev_dbg(info->arizona->dev, "MICD timed out, reporting HP\n");
 
 	info->detecting = false;
 
 	arizona_identify_headphone(info);
-
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_micd_adc_read(struct arizona_priv *info)
@@ -921,12 +915,11 @@ static void arizona_micd_detect(struct work_struct *work)
 
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If the cable was removed while measuring ignore the result */
 	if (!(info->jack->status & SND_JACK_MECHANICAL)) {
 		dev_dbg(arizona->dev, "Ignoring MICDET for removed cable\n");
-		mutex_unlock(&info->lock);
 		return;
 	}
 
@@ -936,7 +929,6 @@ static void arizona_micd_detect(struct work_struct *work)
 		arizona_button_reading(info);
 
 	pm_runtime_mark_last_busy(arizona->dev);
-	mutex_unlock(&info->lock);
 }
 
 static irqreturn_t arizona_micdet(int irq, void *data)
@@ -948,10 +940,10 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 	cancel_delayed_work_sync(&info->micd_detect_work);
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
-	if (!info->detecting)
-		debounce = 0;
-	mutex_unlock(&info->lock);
+	scoped_guard(mutex, &info->lock) {
+		if (!info->detecting)
+			debounce = 0;
+	}
 
 	if (debounce)
 		queue_delayed_work(system_power_efficient_wq,
@@ -969,9 +961,8 @@ static void arizona_hpdet_work(struct work_struct *work)
 						struct arizona_priv,
 						hpdet_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 	arizona_start_hpdet_acc_id(info);
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_hpdet_wait(struct arizona_priv *info)
@@ -1013,6 +1004,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	struct arizona *arizona = info->arizona;
 	unsigned int val, present, mask;
 	bool cancelled_hp, cancelled_mic;
+	irqreturn_t ret_irq = IRQ_HANDLED;
 	int ret, i;
 
 	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
@@ -1020,110 +1012,108 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 	pm_runtime_get_sync(arizona->dev);
 
-	mutex_lock(&info->lock);
-
-	if (info->micd_clamp) {
-		mask = ARIZONA_MICD_CLAMP_STS;
-		present = 0;
-	} else {
-		mask = ARIZONA_JD1_STS;
-		if (arizona->pdata.jd_invert)
+	scoped_guard(mutex, &info->lock) {
+		if (info->micd_clamp) {
+			mask = ARIZONA_MICD_CLAMP_STS;
 			present = 0;
-		else
-			present = ARIZONA_JD1_STS;
-	}
+		} else {
+			mask = ARIZONA_JD1_STS;
+			if (arizona->pdata.jd_invert)
+				present = 0;
+			else
+				present = ARIZONA_JD1_STS;
+		}
 
-	ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
-	if (ret) {
-		dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
-		mutex_unlock(&info->lock);
-		pm_runtime_put_autosuspend(arizona->dev);
-		return IRQ_NONE;
-	}
+		ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
+		if (ret) {
+			dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
+			ret_irq = IRQ_NONE;
+			break;
+		}
 
-	val &= mask;
-	if (val == info->last_jackdet) {
-		dev_dbg(arizona->dev, "Suppressing duplicate JACKDET\n");
-		if (cancelled_hp)
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
+		val &= mask;
+		if (val == info->last_jackdet) {
+			dev_dbg(arizona->dev, "Suppressing duplicate JACKDET\n");
+			if (cancelled_hp)
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->hpdet_work,
+						   msecs_to_jiffies(HPDET_DEBOUNCE));
 
-		if (cancelled_mic) {
-			int micd_timeout = arizona->pdata.micd_timeout;
+			if (cancelled_mic) {
+				int micd_timeout = arizona->pdata.micd_timeout;
 
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->micd_timeout_work,
-					   msecs_to_jiffies(micd_timeout));
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->micd_timeout_work,
+						   msecs_to_jiffies(micd_timeout));
+			}
+
+			goto out;
 		}
+		info->last_jackdet = val;
 
-		goto out;
-	}
-	info->last_jackdet = val;
+		if (info->last_jackdet == present) {
+			dev_dbg(arizona->dev, "Detected jack\n");
+			snd_soc_jack_report(info->jack, SND_JACK_MECHANICAL, SND_JACK_MECHANICAL);
 
-	if (info->last_jackdet == present) {
-		dev_dbg(arizona->dev, "Detected jack\n");
-		snd_soc_jack_report(info->jack, SND_JACK_MECHANICAL, SND_JACK_MECHANICAL);
+			info->detecting = true;
+			info->mic = false;
+			info->jack_flips = 0;
 
-		info->detecting = true;
-		info->mic = false;
-		info->jack_flips = 0;
+			if (!arizona->pdata.hpdet_acc_id) {
+				arizona_start_mic(info);
+			} else {
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->hpdet_work,
+						   msecs_to_jiffies(HPDET_DEBOUNCE));
+			}
 
-		if (!arizona->pdata.hpdet_acc_id) {
-			arizona_start_mic(info);
+			if (info->micd_clamp || !arizona->pdata.jd_invert)
+				regmap_update_bits(arizona->regmap,
+						   ARIZONA_JACK_DETECT_DEBOUNCE,
+						   ARIZONA_MICD_CLAMP_DB |
+						   ARIZONA_JD1_DB, 0);
 		} else {
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
-		}
+			dev_dbg(arizona->dev, "Detected jack removal\n");
 
-		if (info->micd_clamp || !arizona->pdata.jd_invert)
-			regmap_update_bits(arizona->regmap,
-					   ARIZONA_JACK_DETECT_DEBOUNCE,
-					   ARIZONA_MICD_CLAMP_DB |
-					   ARIZONA_JD1_DB, 0);
-	} else {
-		dev_dbg(arizona->dev, "Detected jack removal\n");
+			arizona_stop_mic(info);
 
-		arizona_stop_mic(info);
+			info->num_hpdet_res = 0;
+			for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
+				info->hpdet_res[i] = 0;
+			info->mic = false;
+			info->hpdet_done = false;
+			info->hpdet_retried = false;
 
-		info->num_hpdet_res = 0;
-		for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
-			info->hpdet_res[i] = 0;
-		info->mic = false;
-		info->hpdet_done = false;
-		info->hpdet_retried = false;
-
-		snd_soc_jack_report(info->jack, 0, ARIZONA_JACK_MASK | info->micd_button_mask);
+			snd_soc_jack_report(info->jack, 0,
+					    ARIZONA_JACK_MASK | info->micd_button_mask);
 
-		/*
-		 * If the jack was removed during a headphone detection we
-		 * need to wait for the headphone detection to finish, as
-		 * it can not be aborted. We don't want to be able to start
-		 * a new headphone detection from a fresh insert until this
-		 * one is finished.
-		 */
-		arizona_hpdet_wait(info);
+			/*
+			 * If the jack was removed during a headphone detection we
+			 * need to wait for the headphone detection to finish, as
+			 * it can not be aborted. We don't want to be able to start
+			 * a new headphone detection from a fresh insert until this
+			 * one is finished.
+			 */
+			arizona_hpdet_wait(info);
 
-		regmap_update_bits(arizona->regmap,
-				   ARIZONA_JACK_DETECT_DEBOUNCE,
-				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
-				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
-	}
+			regmap_update_bits(arizona->regmap,
+					   ARIZONA_JACK_DETECT_DEBOUNCE,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
+		}
 
 out:
-	/* Clear trig_sts to make sure DCVDD is not forced up */
-	regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
-		     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
-		     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
-		     ARIZONA_JD1_FALL_TRIG_STS |
-		     ARIZONA_JD1_RISE_TRIG_STS);
-
-	mutex_unlock(&info->lock);
+		/* Clear trig_sts to make sure DCVDD is not forced up */
+		regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
+			     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
+			     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
+			     ARIZONA_JD1_FALL_TRIG_STS |
+			     ARIZONA_JD1_RISE_TRIG_STS);
+	}
 
 	pm_runtime_put_autosuspend(arizona->dev);
 
-	return IRQ_HANDLED;
+	return ret_irq;
 }
 
 /* Map a level onto a slot in the register bank */
-- 
2.43.0


