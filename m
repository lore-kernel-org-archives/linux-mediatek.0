Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55382C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIe5hlvQfgQeGemklPcQXzjZsFGmFJ7H9Gsm+LXx4M4=; b=rhwm9uCyJPEnfKoplw7MU7m/2S
	bWecxoiIZjbcMLchVinoHALELSWSMIoO/EBKC1QuEOuSnwlZl79yx/3mQdjVv7jjfijwbFTuHK7ww
	zfsrRr2k8xZD4TZocpTmlHLbJW1vs3tqQFFuHeLO0PXalui1650IVFKhjvZ9qfFIlUaPuHDq2IYxG
	LqASQ1a/3JjoMy4qRkVeba+/GSvwo+1VAhnzxBoY2N+3jAhrCG1xEVsZGMQxdCq5cGi6DqHxvTJD/
	QHA9/huR9PGe6UVKiYuQQ6agP4PZQvyAXQobZjEIDAGhohOmFpBIme8fLL5GNx7uxgIUe9oqzdH62
	Ie0+C2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7i5-000000099fJ-16Yu;
	Tue, 21 Jul 2026 10:28:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hs-000000099Ql-2rOF
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ced3386430so74010935ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629692; x=1785234492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIe5hlvQfgQeGemklPcQXzjZsFGmFJ7H9Gsm+LXx4M4=;
        b=hbVfJLN4hFqnKd/l3VKLJp54k0jQXRf96Z57qCDQB7U1rtE1+b/R6NO9ADWJ2Ti5zA
         oJTmCtWbxWtOwa/4z9u14OtIWn2gdRN6Ss41lA1YKIyEhbsaUUJSTflE4wPkYImiVdf1
         XMyiAts5XDe6GtqVAYrRm+yCq6Ts0B6jlZHds30W0F781xBoK8PuVuRBHtsB5ftFlYHD
         IAs94p3/nhm2/Nd4SmonDzkQUunkNbNEyzZIGcSJHD4+9QMDuj6Qo8Tt5p7u3qsjOg9m
         KI67n/Gys4AdKihTe8ic1uRjokTI9+0IN0b2XIkMpnshj+M0Qj0Mm8mHcz23ZQ+hkL+2
         jqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629692; x=1785234492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIe5hlvQfgQeGemklPcQXzjZsFGmFJ7H9Gsm+LXx4M4=;
        b=HplkNegW/dS/pz5FuD2atGyeYpgaUSk28knMc4uWBJTHkIpkNE7FDC9ToqOYC/AGD3
         1zp5ZKGwCYO9xMbHNhKwVEWvLZ65oKy3Eb0DXA+qSi8/rYNNsQYg/7ZO3V5dBG3W5NSe
         9fJJH14DKxC0ZfxV5KpX/t4Vi+SB+7kLwIqu8Rd7OoSMJkeVXuH3xDV/KdrOnrH8C/El
         VPNsqmEl8plAQZAgj6ekcMZ9ZKCRpxoqo5rNInIGii+FnA7Z580HjJ3NsyLI0teEeNJd
         g5sBthxGBA/U5SLkmsyi36Z7jbyYcuXdh6B8zA1BP+7nfSNSNagJRjkFi8NWPei6Bb8M
         P4nw==
X-Forwarded-Encrypted: i=1; AHgh+RrclXUnLEROO4cFYsLI/llMmxklEV1WumJdgAarNauq8RDzhS0n64PF4DkcEHoBmyTG1M28X48l6k7u2LRBMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwquPzCNDlRTW1+5FbwCNj9Y9WOTn1Q74t5cHIASEuKcOiApOsZ
	hNtKGRNFW9XmKnUE385EHmhYaw/GM8LUpYg1QHUypaIiGwQizT6T3275
X-Gm-Gg: AR+sD12joqjSzN9zHlSWSS0AKkh62r84kdkHR1WBlRMEc1bOXqnQwBciOzXqEixTMWN
	E9cdQHVngUbo/RaH6Gjttpg7bQ9Ppsn2aSBWSYCjhP7zvauyz1C38hWpJczrxZdOYI+MveY2yTc
	jb55nnEg6niGxMk4+ovG0wzLau80J6eg/XjvzyA7zB/Fj/V8UX2N/ZRnXlwK61YGqd7plf/KP/D
	MceOjKRg2+JRQMtAumhcVrlZYWcq2NQfcbgCRs3X9lJ5Os9w0xXzY1GCX5bywxP+OJ5NuaqkIMo
	Kr7CZ6YdFLfE+5T9NvpT2vJSRNAUzCghdUbK/jp6vvW4cHvGAVUcoqPn6E8NqQMuclM1bdcPJg+
	QzsB47XzgCuAW0XSjGKwlwpsTtDBAR6zEUlXehNP344+7YLnpbrnjAtzzX7E6b7veR3EiQClp1e
	vrm+y1mS6DhyiFLcJdGIa+TrESm1MnwGyVSJc9
X-Received: by 2002:a17:902:e848:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2cf3485b0d8mr200674385ad.16.1784629691883;
        Tue, 21 Jul 2026 03:28:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:11 -0700 (PDT)
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
Subject: [PATCH v4 14/29] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:45 +0700
Message-ID: <20260721102600.523199-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032812_814508_A4D8465D 
X-CRM114-Status: GOOD (  12.00  )
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
index 10868df3c75d..bf143e3fec54 100644
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


