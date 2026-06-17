Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D85FCD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=; b=ejCjlfqqmMk6UYyrQGhnJDZ6c0
	kqCTD6Ptk4Iac6IQ6eEC6mRoEhB/zsMrBI4ZpeL/hAHqsV/ywVBMKPR3VdJODtRIExJ3frFq3v8Sa
	iV5hXBAHIJuxbXhsRnnWE5R1Yg+4Xnw/OFZwd59gAAr4pq4zmjdIdHowwR/lJfYRtlFxWIWzcub2Y
	a7TmyUUrqctKiSDE1U3OzIr4H1x74X41gMCVgCVMnvrTlNBwi7R+BptlUFf49TFNmgHsIfEHFjcIV
	1c85UGcK0PdrVhRJSEqxPbjhS/OIz3iUB30d9MKostLEGj2v9KgFBz+tX+H4lZRTw8keMYs3ELxKq
	GenwSw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZne5-0000000H6rp-3Ybb;
	Wed, 17 Jun 2026 10:37:21 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZne2-0000000H6oo-05P9
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:37:20 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2337202eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692637; x=1782297437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=;
        b=btAyXQ4eHV8La8FlX/WUcfN3j2IMFQ2ZlXLPPdy5VLJhaRHPU1Oj6jeu5HfwIk+pUu
         Vkwu1iPKVQb+29R/uxVHmPc2KU9xULBXZ7FnGsU+oIjaTE5K4dJfWkXHfq2i/MbZh9qe
         YXFGKl1hqj6dmo2RLr2ixTZSQeiFt4II07qDqXAu53+QesIWDV7Lz0al9vDjy9i0ZJOg
         uadE4RreqpmMX57VcL+9hEGeLREKDCuopLiXGN3+VXI5Nsr9C6R32QW3xaf8fMb8w2RH
         /XTUg757QidGNgVI8fVbCGvHB29QcUftTo64k1XC1n/DMKC/ZSDuxC5sf0gfKh0u5xJX
         FfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692637; x=1782297437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=;
        b=Z9E1WR0CT4uXydNm0itNOcHAXXaaQgXEn8sjL4984xBWNpQy7KHg2a9MW+4NtpwrcS
         mcvLFKaJhWMD5117FbYxrd+8agClFyK4cwukT+ExWVyFSpnz2G5nZNeP8aPkm+WeFCjP
         joD1DmdMGJc7Cjcijk+zYZdOPHjn3an6jNrDLu2rEwnncFML8aos1lA7ipvSEgAWGcnW
         E0gcdNdM+PiI1CrDzTo6AZRMzojQqJdrZvzbyEzxW9vQXEYSVOEmyENrdhx+tvdGEbA/
         052zuFQM29vdi+rSIbFZLoqM4l5pBGgMP5IZ0HE/TOsq/Ho6W+VwP0EezI/8W44X/ogH
         TrBg==
X-Forwarded-Encrypted: i=1; AFNElJ99VXf4oLWbe3Rb1X4QpQihEKFsI3i90EzQaxSlrH2Neexh/U7aTwE6MQDPL/zKs97oOFoP/Uh/Jy8CVQKq/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1XDIrY3CYKkE5kz7wW4lDx8FmKb2n9KpprdBuA70rfoln+bTN
	1L4xFEdpyaHNvlK6EcHRY0UgZKkpvtfFM8MTB3oqov8swH6+jhN1ASc2
X-Gm-Gg: AfdE7ck/i64d/ezw9j6gzouJKCkjzcy+OVBzzB0Nex4a2gybzzKMS3tA7Gy6pIYvCWM
	W1df/Wm9KL+uKXtM30vFHBt4SaQrVGX+RdQzkOMpfR4ABNLtntoziyQf25LzqbcKtI4gm87XCsW
	XxolIBhJ7b3C92uPom9rwX3FbWzJu/Erux1Al5udfpX4HMuOpRv90kDRw+zGn4JL+ezzRY1Bqib
	6Vj1Sccjx5q2J0HXD17xpVz10J4K7hyjziw45Uvug7CrAI7ltMbrLLK+tsShq/kukAgOJHspY4R
	Uh9lqWAcJtj/G/NtWjw75ZWXhClYcPxSk0cZ/jnoUftJdPKzeUmOFA+wo8q/ETbxBeiMOwNEI1v
	ZsoZ4I9xESWazPTU0x3IFJ0YLmyrtlwnAF++c0Bsd6tyWThvrcvTAOFTNuuxzKCI7pWk2nm37Gq
	XZXCR5+74i7sYMfDNquhb1ihr6nUT16EaT+CwP1roPht8oeSc=
X-Received: by 2002:a05:7300:7481:b0:30b:bf5c:c878 with SMTP id 5a478bee46e88-30bca067e13mr1803295eec.25.1781692637212;
        Wed, 17 Jun 2026 03:37:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:16 -0700 (PDT)
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
Subject: [PATCH 28/78] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:45 +0700
Message-ID: <20260617103235.449609-29-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033718_067171_F8670A4F 
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
 sound/soc/codecs/es8326.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..4aaae6eab7f2 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -790,7 +790,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +845,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +854,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +872,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +929,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +938,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +957,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1197,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&es8326->lock);
-	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
-					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
-	es8326->jack = jack;
-
-	mutex_unlock(&es8326->lock);
+	scoped_guard(mutex, &es8326->lock) {
+		if (es8326->jd_inverted)
+			snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
+						      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
+		es8326->jack = jack;
+	}
 	es8326_irq(es8326->irq, es8326);
 }
 
@@ -1219,13 +1215,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 		return; /* Already disabled (or never enabled) */
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
 		es8326_disable_micbias(component);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-	mutex_unlock(&es8326->lock);
 }
 
 static int es8326_set_jack(struct snd_soc_component *component,
-- 
2.43.0


