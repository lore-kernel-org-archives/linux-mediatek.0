Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802DFC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=; b=S/lPDs/CPtSg5FKo4XeqYpuNyU
	Oa9oZp3ArxYgO87+IeqIomQ+jHqNVkHUJqEao144Isa52BCMd3ASuZkWv3tP7fMC+uFc2CPeH2NNf
	fcjzncos8WOVkpxVBGVY1so2zxOf6rFYwuaIG++KQRblkB3yUlGqHGFrLLfagF58H/vIkJqJjaKzv
	pJp+EzgtoMxAiCIRVFtmL3Db+aAIYc+D9ZOdlrWLx9UTMEQiW6I//FOPpWyeqUHZSZ7jqYXS0f8C/
	n3ec809Q9orBBk/MvQyV0v5v4is4y3AhjNlThYLR21xn+Ihf4VNlQrvzkNFtj9VR1wNdaxHa9YvW0
	wHFPlvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4C-0000000FxvU-2C0C;
	Tue, 30 Jun 2026 06:35:32 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4A-0000000Fxs0-2ahf
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so2111912b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801330; x=1783406130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=ddZG8mUd7h813USLhAHfvb0ED6Zbub4YD22G90JT+iYYwM/Gb8+B4DnbbpKyI6jzjt
         fGNxE/UZ3EANnFtBLs41w0tyqCsglf5C5QavbpielgEo1UNpzcgiqwWs6TIoNtAp4MV1
         Ajq75tOyHdFFQzfGOfC0H4+M7ex8JIIDiHYgwASPr1DnkuY3c/gqDf91KaB7yLqVprlZ
         6fjvIE4kCDTxejpBDrhGxSrJLifoW26j1F93V4ozMGC7Btkb9lS1P2OXevBtttUpHzBu
         wTTA01aH+Kuh5aIL2fo50hZ+8TJ31c42TvuhuWzqymotyWxEWkRlQ6GpA666JJekOa10
         GqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801330; x=1783406130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=c+ZXcTewuPZZmaS7SyKkEILxO1i434BPGd+tS5US+5KCMR0K25H06+i1H50iXaEJqN
         x/Ce5PouJ9TsuhxXctS7f5LRRL9L5885kj00ooKo3fyS+iTZwYOxeYZ+TOjXMXJOyzRG
         EHbmF0uSq2zE4ygaJYv8pVVPWMaNpfgF4dcZHxm4z0h9OLKOLGzEi0DeYpC1aeRg8CiE
         0A9UMoMKAfDwFrWrjaPd/0XqXi8mlzCylkgIn5y9bLGUp9NxDimTl9A6qzfZofuDJMfq
         /t0ranph9hO4YC8YPxI5BayWx2+UrVygjxttASwpfxnLkDhoQwNEQhgVuDEb9FZN72bD
         FQmA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4FLZKXOld/bV1PuELYiOJK2vmFhOHvaK/8OVXVG/S90tnQ3cWzaen+6QWkt/B2oh3cxrQSC5rslo7zrkAyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh1uP6/H7NQ1DhGgWEE/L+wNzZCQhR/TEIRWaSNuBLiiyoMx/I
	JOnTIQ89kEsn/ocSBwDxR0k7FTgOOwGJO6jU61jofT2uBHVl6o1MY56Q
X-Gm-Gg: AfdE7cnTjoQ/mnpmQeAU3onsrBbPV+fiMr8GQxavsqjc5Fe7JYK0FSmIIbCEOXe4Wr8
	ukA3OcPbOKJ4lry4lbhbEUu6dTCdrDjUJU7Hm/y3kxb5Vufsm1T7RQwYjA2ewG1OQj4d6GgBrUJ
	roglPM9JzowB2pH/72QPD/C07D77YyVrifiPRkV8QjwRUhmGWdIF3kNB9nmrDf8fIekGX9fFwAv
	PxC1UDNSb26URJm3M5hRDdps2LPnu9PrRXaGqUn5kDepqmNKrNckbpfUhTovTDNnRcQzi10jy22
	mF/A4j380pF/VP9oGOviK/yB0IdrKIKnkgUfvTX920/8/T7Sx5Ihi7IfohRgeq62d8htH/Zytw5
	PlkWoYgzgALwK9DFI93/lnRiLOSJNKCqTNaBKgeVp5lkOpWV3G6rNElfGExEEEWROaeUN42vKHB
	xJaysRx7BQtmbfe9j3J9gQEg9MKLlr+D1FvalJ/eGKtoZTMmc=
X-Received: by 2002:a05:6a00:3d04:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-8479f1004f4mr1954813b3a.14.1782801329607;
        Mon, 29 Jun 2026 23:35:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:29 -0700 (PDT)
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
Subject: [PATCH 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:25 +0700
Message-ID: <20260630063449.503996-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233530_679580_CBD02DD0 
X-CRM114-Status: GOOD (  14.07  )
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


