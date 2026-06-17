Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77895CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=; b=EA/hDxoCu9YGdCRlnpe+QgbIfA
	jTk6A2x3AmEdErLcb5BtZZ15DhkQIZ9DqLJA0S6iCZqW3t4fXze+ysFXx/HtuumA/4zWVJ8nS9dO4
	eGyM6IiDsr+GQ6KINSrTDKrxV1w83xmzwutrhBS3w5xCGd+Q4akwcVH0GTPhmKHbekTDz3URM6/7Q
	thFpJyFAteiuT0z455Pls2Tfo5d7z4J1yqbjazgRCg8ByztUavovT0LGkoj21ALGElTY1cwFyiN74
	kfBg8qRKUOpgyoPu7L7ksY0Se8kHhu6FdSk3tsh/mkuJcgoyd06R63XBXvYZheS2+V4zSyTxekw1a
	YMmrUVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnc1-0000000H56B-2vfg;
	Wed, 17 Jun 2026 10:35:13 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbz-0000000H54U-1MD9
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:12 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30b9e755555so4893376eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692511; x=1782297311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=;
        b=rLecio2MTX9cCNVszobyh6Fy9A4QcmTlJo4GssZDwnt0FF5Xf+MYtg8WQn689+IRW3
         OSIYZGQmr37/SID/9EVb4dISTfQAcYaMLyI/bz7MKNocwTla93CHoSQwG2hxOiMn/Lbv
         CnVcqf3pyN0720rytjZyOtG6V/+yQvNbq95YXAVKMwJKErh/Rzp/8hU8rQ/bNg2KBKac
         yaLH+29nMQotfeNVbZ+rKnADb7LE4iuKDFkm46whD649MQVNLLH6zX4NRrvQTODsLxt0
         H7hJRW2CqrYO2z5l1+lz+uFH1M1VZ65ijgtq/7mpos/iP2BVmOGmjMJJGo+s1oRxyd8u
         NUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692511; x=1782297311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=;
        b=B0+U1KuMEgI88P8a4bDFKOFh24RrqROsaoWnBjYZeVe+b+JOKcyjvbTQpa7q3xwhit
         XQj+uFmW8IygjdM0YLqOO403CpYnqDWPRG2Yehse6DXEjRH7dwg3tYPfOcM7D2j6/+NA
         /tPdcp7uGIyyiZts0Epc5NOff9VnXaJgXB/dJ9MP/DAXumYBWpMLQFtbMsXJH5iqRwP8
         WWtEI0VNJvjmWzudcCydfWpMM9i8TLAsMj4Lo5htwhIb0OiJyQ4w/rjFOJLR6jT/ywru
         /IwDnu691ouYuSqRGp8FaH2MqjD+Af1xrOLzxEnvmQw1TPQ6qkG+RxTEJ4Qq98Jk4/V9
         v+VQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sMq85Pyrzfxbq+g/Rx/8AeCk/D4XLh/Ch9SEuOlLoGWMNxgWYn3lD8U43+rZwbiAyosgxjhVFxJQXsnEUTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6X+QhTpCskilwdXSJtGTv1YwzOy5LmG1LA0hrFFQQXivHPJH+
	yUMacOjG04YWlbtqNWmlrkSqtO5bFIseXfgGKaiXsORGSsDAFThhy07o
X-Gm-Gg: AfdE7cmtP0fLX6bnpMl3F88YQb3f1fL3zECKN8x2fZACTx8tn0o1KFrjKVv8r9QxlRQ
	ghVv1693yHgmZoTcgJP6Nzu7jKxN/gDGG3sW7HorXx0pyal+mDbInk/VLptJ4RC+rAn18XazMtq
	ma3Qjcixce4auiivtdJsKjcjB16yQQ0Ap2kK94f7j8LY6sEl2Z395u362DWEWzOaYVGxFFVHY34
	bMBm9jlIdUr4rCv9mwNjITqJlNLMd2vr0zCEkSkHr6RUTyyUJe8w2jM9wDZQYhFtWsVSCnxHauu
	kU2ngh1mOJBqZIfte5PpG4rEN9Z9AIHCNG9OJHphV2LAn14XSkDBpxBVfnuBk7Z137fb3M7zgij
	pj7djbYuEZEN9zh7CQcyGVQgwxWwkpXsejFE6oxcs3xJeUYB2J4dV9dDKKipmGWv7DVya6ZCrh/
	zwVpeCAqHkrcDIFZcgq9g0rG9XSMPOROnA2yYXd1SCe5mjctM=
X-Received: by 2002:a05:7300:80d2:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-30bca066cccmr1800405eec.16.1781692510527;
        Wed, 17 Jun 2026 03:35:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:10 -0700 (PDT)
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
Subject: [PATCH 14/78] ASoC: codecs: cs42l42: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:31 +0700
Message-ID: <20260617103235.449609-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033511_440399_D633BB73 
X-CRM114-Status: GOOD (  19.60  )
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
 sound/soc/codecs/cs42l42.c | 222 ++++++++++++++++++-------------------
 1 file changed, 111 insertions(+), 111 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2652a639a79a..f9e02cc4e9f1 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -565,7 +565,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l42->irq_lock);
+	guard(mutex)(&cs42l42->irq_lock);
 	cs42l42->jack = jk;
 
 	if (jk) {
@@ -581,7 +581,6 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 			break;
 		}
 	}
-	mutex_unlock(&cs42l42->irq_lock);
 
 	return 0;
 }
@@ -1667,117 +1666,118 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_plug_status;
 	unsigned int current_button_status;
 	unsigned int i;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	pm_runtime_get_sync(cs42l42->dev);
-	mutex_lock(&cs42l42->irq_lock);
-	if (cs42l42->suspended || !cs42l42->init_done) {
-		mutex_unlock(&cs42l42->irq_lock);
-		pm_runtime_put_autosuspend(cs42l42->dev);
-		return IRQ_NONE;
-	}
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		if (cs42l42->suspended || !cs42l42->init_done) {
+			ret = IRQ_NONE;
+			break;
+		}
 
-	/* Read sticky registers to clear interurpt */
-	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
-		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
-				&(stickies[i]));
-		regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
-				&(masks[i]));
-		stickies[i] = stickies[i] & (~masks[i]) &
-				irq_params_table[i].mask;
-	}
+		/* Read sticky registers to clear interrupt */
+		for (i = 0; i < ARRAY_SIZE(stickies); i++) {
+			regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
+					&(stickies[i]));
+			regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
+					&(masks[i]));
+			stickies[i] = stickies[i] & (~masks[i]) &
+					irq_params_table[i].mask;
+		}
 
-	/* Read tip sense status before handling type detect */
-	current_plug_status = (stickies[11] &
-		(CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK)) >>
-		CS42L42_TS_PLUG_SHIFT;
+		/* Read tip sense status before handling type detect */
+		current_plug_status = (stickies[11] &
+			(CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK)) >>
+			CS42L42_TS_PLUG_SHIFT;
 
-	/* Read button sense status */
-	current_button_status = stickies[7] &
-		(CS42L42_M_DETECT_TF_MASK |
-		CS42L42_M_DETECT_FT_MASK |
-		CS42L42_M_HSBIAS_HIZ_MASK);
+		/* Read button sense status */
+		current_button_status = stickies[7] &
+			(CS42L42_M_DETECT_TF_MASK |
+			CS42L42_M_DETECT_FT_MASK |
+			CS42L42_M_HSBIAS_HIZ_MASK);
 
-	/*
-	 * Check auto-detect status. Don't assume a previous unplug event has
-	 * cleared the flags. If the jack is unplugged and plugged during
-	 * system suspend there won't have been an unplug event.
-	 */
-	if ((~masks[5]) & irq_params_table[5].mask) {
-		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
-			cs42l42_process_hs_type_detect(cs42l42);
-			switch (cs42l42->hs_type) {
-			case CS42L42_PLUG_CTIA:
-			case CS42L42_PLUG_OMTP:
-				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-				break;
-			case CS42L42_PLUG_HEADPHONE:
-				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-				break;
-			default:
-				break;
+		/*
+		 * Check auto-detect status. Don't assume a previous unplug event has
+		 * cleared the flags. If the jack is unplugged and plugged during
+		 * system suspend there won't have been an unplug event.
+		 */
+		if ((~masks[5]) & irq_params_table[5].mask) {
+			if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
+				cs42l42_process_hs_type_detect(cs42l42);
+				switch (cs42l42->hs_type) {
+				case CS42L42_PLUG_CTIA:
+				case CS42L42_PLUG_OMTP:
+					snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					break;
+				case CS42L42_PLUG_HEADPHONE:
+					snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					break;
+				default:
+					break;
+				}
+				dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 			}
-			dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 		}
-	}
 
-	/* Check tip sense status */
-	if ((~masks[11]) & irq_params_table[11].mask) {
-		switch (current_plug_status) {
-		case CS42L42_TS_PLUG:
-			if (cs42l42->plug_state != CS42L42_TS_PLUG) {
-				cs42l42->plug_state = CS42L42_TS_PLUG;
-				cs42l42_init_hs_type_detect(cs42l42);
-			}
-			break;
+		/* Check tip sense status */
+		if ((~masks[11]) & irq_params_table[11].mask) {
+			switch (current_plug_status) {
+			case CS42L42_TS_PLUG:
+				if (cs42l42->plug_state != CS42L42_TS_PLUG) {
+					cs42l42->plug_state = CS42L42_TS_PLUG;
+					cs42l42_init_hs_type_detect(cs42l42);
+				}
+				break;
 
-		case CS42L42_TS_UNPLUG:
-			if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
-				cs42l42->plug_state = CS42L42_TS_UNPLUG;
-				cs42l42_cancel_hs_type_detect(cs42l42);
+			case CS42L42_TS_UNPLUG:
+				if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
+					cs42l42->plug_state = CS42L42_TS_UNPLUG;
+					cs42l42_cancel_hs_type_detect(cs42l42);
 
-				snd_soc_jack_report(cs42l42->jack, 0,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					snd_soc_jack_report(cs42l42->jack, 0,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
-				dev_dbg(cs42l42->dev, "Unplug event\n");
-			}
-			break;
+					dev_dbg(cs42l42->dev, "Unplug event\n");
+				}
+				break;
 
-		default:
-			cs42l42->plug_state = CS42L42_TS_TRANS;
+			default:
+				cs42l42->plug_state = CS42L42_TS_TRANS;
+			}
 		}
-	}
 
-	/* Check button detect status */
-	if (cs42l42->plug_state == CS42L42_TS_PLUG && ((~masks[7]) & irq_params_table[7].mask)) {
-		if (!(current_button_status &
-			CS42L42_M_HSBIAS_HIZ_MASK)) {
-
-			if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
-				dev_dbg(cs42l42->dev, "Button released\n");
-				snd_soc_jack_report(cs42l42->jack, 0,
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-			} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
-				snd_soc_jack_report(cs42l42->jack,
-						    cs42l42_handle_button_press(cs42l42),
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+		/* Check button detect status */
+		if (cs42l42->plug_state == CS42L42_TS_PLUG &&
+			((~masks[7]) & irq_params_table[7].mask)) {
+			if (!(current_button_status &
+				CS42L42_M_HSBIAS_HIZ_MASK)) {
+
+				if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
+					dev_dbg(cs42l42->dev, "Button released\n");
+					snd_soc_jack_report(cs42l42->jack, 0,
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+				} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
+					snd_soc_jack_report(cs42l42->jack,
+							    cs42l42_handle_button_press(cs42l42),
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+				}
 			}
 		}
 	}
 
-	mutex_unlock(&cs42l42->irq_lock);
 	pm_runtime_put_autosuspend(cs42l42->dev);
 
-	return IRQ_HANDLED;
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
 
@@ -2163,22 +2163,22 @@ int cs42l42_suspend(struct device *dev)
 	 * future interrupts. This ensures a safe disable if the interrupt
 	 * is shared.
 	 */
-	mutex_lock(&cs42l42->irq_lock);
-	cs42l42->suspended = true;
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		cs42l42->suspended = true;
 
-	/* Save register values that will be overwritten by shutdown sequence */
-	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
-		regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
-		save_regs[i] = (u8)reg;
-	}
+		/* Save register values that will be overwritten by shutdown sequence */
+		for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
+			regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
+			save_regs[i] = (u8)reg;
+		}
 
-	/* Shutdown codec */
-	regmap_multi_reg_write(cs42l42->regmap,
-			       cs42l42_shutdown_seq,
-			       ARRAY_SIZE(cs42l42_shutdown_seq));
+		/* Shutdown codec */
+		regmap_multi_reg_write(cs42l42->regmap,
+				       cs42l42_shutdown_seq,
+				       ARRAY_SIZE(cs42l42_shutdown_seq));
 
-	/* All interrupt sources are now disabled */
-	mutex_unlock(&cs42l42->irq_lock);
+		/* All interrupt sources are now disabled */
+	}
 
 	/* Wait for power-down complete */
 	msleep(CS42L42_PDN_DONE_TIME_MS);
@@ -2250,13 +2250,13 @@ void cs42l42_resume_restore(struct device *dev)
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
-	mutex_lock(&cs42l42->irq_lock);
-	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-	regcache_sync(cs42l42->regmap);
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
+		regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+		regcache_sync(cs42l42->regmap);
 
-	cs42l42->suspended = false;
-	mutex_unlock(&cs42l42->irq_lock);
+		cs42l42->suspended = false;
+	}
 
 	dev_dbg(dev, "System resumed\n");
 }
-- 
2.43.0


