Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71501CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=; b=Nz+gFQC6wgHIadN7QoSesOCiJL
	8fbFxrlTZFZyyn4Z/rwdvjYV0uH+wrTuFZGhJva2QDyle/o2ugCzU4qwwSzLf7tF07cZAhBWsZjon
	I8V9tJyGYrSIamabjhJs0yAn5sFbK9buPuh7huHpVUWm5720KRX01KNTy8+cQTymW/H2jsv5anLP7
	52072f4gifcdCTUZx+hlhyH4nurD4OrmLvTxowXEbb+L6CG2XgeBFrvWirJkDBYjcPb5Aw0rKYFE3
	S9l6WlQZtf/K2GeMC05+3UvXoLuJ7uDXmG/OTRT55exv/PHFQGZ8G+Ka7ET1/XPv5cZrVVnx+xaQS
	HBtpv5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfh-0000000H8Dj-2wuL;
	Wed, 17 Jun 2026 10:39:01 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfe-0000000H8B6-2p5y
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:00 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so151998eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692738; x=1782297538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=YDbFtsHk+rTVloUQrdR0gfi2Y4rpzS6lReodl94rsgZyyDGG2tWso9lBUkDydgjcUX
         RvS8sEAB8/Q5De6kxda0k1YXk600Lzxba6JgIs5WOH9EFcp7sZrkywErb/rrigwxl2bf
         9hg32jDJSDE6A1+S6uWkFb4AoJcUwX6G9AWUAN3X7Z8SDsaCDGCq4P821VKlPILFLWwm
         BhnYX3AgggdYPvKITRgdwcjVmGtAMhknSQ9HNDbug0fWvJ04E9cYWnQCAQFMB5cuDURJ
         5VLTeIDLwuiBGXK9kOwpYjjeEdWNDzUo2zbflX+FVxXWy5//XCQw70neZXnoxfcQdIg9
         E7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692738; x=1782297538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=qcArZrQx/qpPjPyML42XvGPdXAccvOie+r8MvMmD3FOPU5DEH6lP9sX1EshlO/WCyb
         mDjCn2L4n6u3qrtNy0t8biCDxPPr7MAQCfZq4eRwcEXBQk5eZaIFawAMEgfqn4Ni84f5
         rpr/oqE3XsEsczMy3fowQe8PyR4ytYwPbcz/nR+iCvwAgTMUYTusocZSDDTAcvzHVNQI
         i+uLWgsMU0ewNtyOKPLzjnUXTSffzgK2h4PrOGyArXqLBXy6avTNEqL8vi3keJyFFJxr
         vk7FIQ0yi9kFxywE0AjYx9u2tref/NZPZIy7isqQ8XUVE1c7r6chcdeT4wiVRL+Q33K7
         TYFA==
X-Forwarded-Encrypted: i=1; AFNElJ92SrGAqHHd9GizaCLmGrs/Nsq1l1wwtaQeveAJxvM8niui4RZT4oGsTS+tE1QbdA0viFxhSttH/2yyvNxhSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQu/9xKAPnOpOxp2vs2P0FuqLGLN5kx0c7CRLRJJEwZ5G9Dwua
	/xb87vMmv9ld5GZ5eW0ZGiyvc5F0N5FNOtE50kuZWIt0fstmg+ysKBGj
X-Gm-Gg: AfdE7clt1FwjErYfTb8c/bRLXBHewBn0BqJSxzQiMW9jRBi6Wg441b+Swcg4DZ3FIAq
	A/qQOy4/YWo4LvOzAvwcBWViubQBOU5Z6Cg0YyV8BYjrZihvnIhkAyRjKG70HOC9tlmGkKARi9p
	5MpVhmtP/yD2b79/tGvbIaFC/rE4/hJR5A5p2hk85DVdNH1Ommux23oRaZoz1R4AoOu2Q6MSh2l
	h4rztZO0mwTMwybpT0vHdBYSo3r/ncgIDq6NYgbe93cjAiEfBINLNTJiXujR9PJlJhOCMOQ2HvN
	EAEBkPM4yF35uwHcenZ2UKrET0NT9DN6h9ui8HoumCyYU0+bqimmvtkl+jYgRa6q3CxbwnjafvN
	lZY3gDcbiBDJuU34TNiKwsHxcaybELKCFZD9F46GtTbJpN7StAwmeIxsyREufEoyQkvQnrx8cBK
	vQM8pvcAcjkhirepS8bg+InQ5MZSXfrSLXwwV2nJXS7uojs8X5tqeqd4ISDw==
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1293252eec.9.1781692737916;
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
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
Subject: [PATCH 38/78] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:55 +0700
Message-ID: <20260617103235.449609-39-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033858_725150_62AF800F 
X-CRM114-Status: GOOD (  10.95  )
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
 sound/soc/codecs/pcm512x.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..f4206f49f5b6 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0


