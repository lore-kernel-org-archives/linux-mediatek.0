Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7709C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=; b=wkZFmnfRqK/YpW+20bcTmfAA++
	/NcZjU7rUkerOSDK9ll+jU7y81gduGs3GGuR5JvEa1ubsFIEHgQBrNB9cNRJUbA263TLubPaEnwsY
	o/JB2DYzXJVfpYBZwbMey9Vqt4Mnw3mCEwma0WBHnJAbdNMXqG8EkWDV6phzDIzzlh+xwMJe2i5Oj
	ZXbCRJwGB9WplRDatfNvBOduWUx0fAj2CFU/RKJEyRFr0N8g9LNzBvp+Xv17iYZkI70QAC7Gh6eme
	dE+WrJo+6HJIJGp23T6o4lEa+ISIcY1A8jDuG46oJycqJLYvhgHbXZMsEyLMgzehOTNk1SsXZPHpg
	aB/WGE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7a-0000000HGJl-3otF;
	Wed, 08 Jul 2026 14:19:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7Y-0000000HGHS-0kVb
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cc891373e0so7197695ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520367; x=1784125167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=sSHwmepZ9kbTZQLhrp5vxWvvC+DH5DioWLdxmLmsxssPKM1u1LQu6ljsBUECad2uOO
         NqbYIO2nlewDaru8/Qviaw8/7JbK+zUXSEk9TC6hgbuVS7vLWe1CEdPi+jfZnPvTJOkK
         QWtjd3Mfmbs9C2SNPQiPr6nyIXAo0syw/npBYRf/YBoODNJsvNvfaJUqU42eb72ipYuc
         TfHAY31YfTMqeGg9Y7SiG8yvUvO+qkrnqwQVcIvgF1U/ZXnmbAS12gBbEyG2HaB7jBnC
         ehAeO6rD8pfjFN8lF1XLDtXSuonznwq32Hp6TTvyTiFgnQIDAZ60E3sqVM0g0Wb+ye4v
         3c5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520367; x=1784125167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=qIEtHTGYL7uP4iYBONLA5jx5+Dq3nx4WF+8f1BVWqacZVg2GI84mXe1+6ImmUPN/ov
         yIkTZBNepwtD+JHeQPP+Lj/1965YrzZ3gHIRVTOSpV83N/ZVec1jXq4caweOYhdmiN0/
         05URixjO6p5cx/iUGWvkWrlg7d8s+B48A+YflN12CZIWUc4LUFaFDY8Z8qusVAA7xncx
         jhgGFZkG7NUDVUcIG9PKPfEj06xGOgzSek6vOnI3O2YxAMDCIEbmV+QUqSSGkUVEpm2T
         Jdu/t+ZkJLRij9EygH4sNtk4rad71Nea+Q0wXEzcJVRyxPIFbEn6otKLcPqT0GQsVAE4
         Fa4g==
X-Forwarded-Encrypted: i=1; AHgh+RqAEVJGx0JKZRSAnn2LWCuW008JJGP6mYgEhTrLleT0eFSe2MP0q3WW6hp74o95xzwGkBwdhbC2zCeViMriZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo1nL1b8a70/dw3UeBVvT0ZpHFQvMscXpDX0cD8/tXYc9Bxw0i
	PttnHY7xXGmR9PM+8B+n5LkLXfacTZod+Rxrwj7ZT5Oj5KLyXjVumrC5
X-Gm-Gg: AfdE7cl75hr1j3o7aLCilV9XYihDM70htwBtb8Ck7o+LLdn4rWXPoTQUzAs1hSXQUd6
	id8VBpJhjVMDT1pIkZO3jmB0nnJ3FlWqBgMmK8JxR8FOv7Gomn+D4Q6uq3+xU4SWA54Yjo6B06E
	w0pce3ns4ZabAEs7wzi+sHTVc5NgTsWAPMGiPzEJT1aKnFd6RFLJGsBUpTqMsofaDQyV+9Hkd8S
	xyL9xO++xh3wPsrqz8Z1kgKyFPo9ACup22gM9q12vk20gq6MulY967dPlkDdcXS2D3YKIQ7z+80
	lXZGqFuMWHqiqRfbekisiVZqJz0UqjTcKHB919KXqHeB+NSaMTfwLPqOFYco6XE9lj3rBp6jjVf
	2ffjnN72EohYUAPi1RUL5whD1ZZ1TAaRlX2z2wFusjJXhHnJ96QnyYT+fHYd99/nTuwq8UanxIA
	FPWqI+8PcvcaCcFhKBXTKyuM0saqoDtVzbLLivtiWBNZw8uzU=
X-Received: by 2002:a17:903:2984:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2ccea3849d2mr28129135ad.6.1783520367125;
        Wed, 08 Jul 2026 07:19:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:26 -0700 (PDT)
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
Subject: [PATCH v2 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:10 +0700
Message-ID: <20260708141734.578926-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071928_215152_54BA98F3 
X-CRM114-Status: GOOD (  14.63  )
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
 sound/soc/codecs/es8316.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e496..e83dab0b7083 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -621,15 +622,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -682,8 +683,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -700,18 +699,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -727,7 +724,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -738,8 +735,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0


