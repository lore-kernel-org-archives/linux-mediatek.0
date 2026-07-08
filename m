Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1567C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=; b=0u7RDeXz7gwTTFixfHM+sOJUEH
	lV8LwDztScVrgeJuEQ1y/AAQiyQI6YgmbBMpazAatyeG4CcEW2vBtHa8p9BB/gi0OCBq/gAyUUcJc
	mDetG2rdkHp57Fi1hnOnKmQu/c5CNOoYhO9VXQVeYptudEhQOXjnyW4194XFbBiga6OWXpqgoLg/4
	i5fJl6U/3LtPrTp4O8VyDzyso++gO+DTL6Wou/WqFp8eLGFnVoItnDjsHX5AYJToKNaQw+Ph2e1WS
	4BUPf20cUqMvnnXSriaTFm64enzbKrJi1SZtM774xLWT2wvPLPtZBB95fGVR4Y8YccYCUl6+HHOWP
	pO3FMMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9D-0000000HHbj-3yPr;
	Wed, 08 Jul 2026 14:21:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8z-0000000HHSA-2GEV
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cc84e77e78so6162455ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520457; x=1784125257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=EWazGrvVTPG2vIoR+uZjrCc/eMTJt2IOFEJxC/I/zPvfknr2dnQe+FLcaTL9IGdqDU
         aew1uJbPO98njVqvZOcfe6XZE/OXRpBOt89U11bQku/INkGFPSwPoxlS6dORPmpIdl5g
         k1hEHA141blrlLrkLS789PHKn6I2KICdJmf2F9/MQ34P6TrrouxeC85pK81rFHeMr7Ph
         kKcTqgT+MJCHO1we/8W6hMtawxovlmrI8LumgpZ1N/173CCdmWIBvItM32JHMnKAawRU
         pIZvRR8Qjbi5sRP6cYKVOju9goTEcniDg/IU4hhZfVkmD3eQw+jhefTU6Tlq/eMjmgI3
         i9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520457; x=1784125257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=lo3adEuPkUt5tL6E/0GKQ0vf24OB+WwdCDNfuIcgXcNifubC7UPZ1xOJYJXjITVMyL
         UbbW1qeimD6GEftJNTI7LXWM8kfwNvt2HYWBYPkgnCSxTcK6G4cSy0ya4593erBrNmWg
         TujARaV6eWCDTa9x60zvBpwIndojOYtADhbgqfhbt+G5MacC+Bqup0O5QqR8P3XpzWOZ
         wL0iUS38ngO477HK79fOtZhKBfZsM9FGVaIl1Ty+WFDKR3EpJ1JBIbelblIJRg5WK2Kx
         6cRhwMWTh8C1mMpboHk71av/+fAaMRKmOopbZAF7t3a0LnqAquO62Kf2iY2BNTrTaBiJ
         D7qg==
X-Forwarded-Encrypted: i=1; AHgh+Rof1gtapgWsk8wSj6rL/oSsKZOnjru0DaZErZwR7vI1RFng0FzbG1nnSO3BfYNfLxXnUvlnH2JWlo/Juqcb3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb8Y/D43DpD+wi13r3o9q7SpWTilrijEihjEIKQciWERB4SYza
	tNEYcGr92tIbgyFm49+2VIhe/X+GB9JgKZVunx2ukj89OyZIegeO0o2e
X-Gm-Gg: AfdE7cnnqLux10njNi8qNCqUk0Cw9OcvN/qgWS5JFMyJ8S2D1yQU+yeFT2AnJ4DInHh
	2LnzX3Z8uPpxqXDFJqkPBACNqz3KluskzSKiGZ+i+uuqcsLV9leU2dZE2vxSC0Bgf/mqNcSTAtD
	tzeWg58U0Iu/90dx8l6q3bME0NPBLDZP1EpEFlsPVAAHVWmz2s0HxQHg1U96x81753zBtjICzDV
	kO6Md2tjqX+pK1fr/D7Ah4NqRgVZrKEH+GPPWLI4hAPkjU6GBiMK20Ag16/0ntSEQjWWgD0l7Z+
	1nDt4OJNF8ktye7fbhO6DMMmVSfCnBtzR6UCrwOy8ps7sJCumPxw4hApamExsyMhdqRTMO+6DKW
	ACp+RdvELCaAdodbdaHiIipsumvfedb/fdYqhnz0F9H7eZN1gvVlJa4qm3e+xkZeWeH9brvzdjT
	dI1E5tYFq1CIaTLlhErxcdxIp4i+L0gc5cLBYYqFQKMR7Rwwo=
X-Received: by 2002:a17:902:dac3:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2ccea599232mr28329495ad.43.1783520456871;
        Wed, 08 Jul 2026 07:20:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:56 -0700 (PDT)
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
Subject: [PATCH v2 14/27] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:21 +0700
Message-ID: <20260708141734.578926-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072057_584648_B8695F6A 
X-CRM114-Status: GOOD (  12.45  )
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
 sound/soc/codecs/pcm512x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..bc777a53dff3 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -6,7 +6,7 @@
  *		Copyright 2014 Linaro Ltd
  */
 
-
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
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


