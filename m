Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBCFCD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=; b=NA83FJtILf4WuTx4V4FKBdr3Vq
	3jf8WIf9gQOMPnbPxtVGys/tUHyuvRd8gzyRdlmDCifjh+caD4Ve3+tbUheuYZWDb9wynwFPDxwx2
	iic8kUXcHjLOrZEqGPlO3oJiVtJG7G5iplzmH64x0rKjLcuVftt81QyTTgyzSfVz5dwn4T5PGYeRq
	FLzlBEzSeZNDNB86Y8bDFr4k19krYVSpukwZ5NrlyPgM8ukQ2LGj/6DLaDF4i8nmM1R/naD/Ijph8
	mTxRGwH6APCkUpZ3UxAXbsb5cmtt5pAvSLc2kMkdgHxtRbx+rksVEt6bV1sXug3M93dmPc42OFXpO
	2liYcTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncM-0000000H5O2-2Wop;
	Wed, 17 Jun 2026 10:35:34 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncI-0000000H5KH-0fRn
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:33 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-30b6dad2382so6291152eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692529; x=1782297329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=GDavGPi81pWPHRcpwxHcRiQ2uNIfnh8caHbYXcXg3LnwwAtaHJPC/LscyCoLCQ0WJ4
         8neiJKPWfv6duL4LP6UKPiszRjHbHV++2X8kQLjC2v0nQkE+EPIROpjbkVwWsjISxkkb
         0Fo61SBsS1b0t/S2cPuh2ZKSTZl3EzayirdmQhYW3hzQw4VYaUraYDeHG/+JAXeJBmds
         dYWA0RPS/QN+flaPuIYrcZNaFHZ3TsvU7vruFxsqbFKPgazfScJx5n7uDbCGjKOmiWK0
         bU5CgzgqACAKu4LhLS3t9ozwb72xVVrsvNxdZ/uqiI4xG0CtpVQw4FP/aQjd40x8DJ5z
         NokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692529; x=1782297329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=mPp/uelcRa/KXjaYWSvDpfUK+5xOY1S8f2f2iYBXcEzsVV9Uz5ioS27pkXJKqVtqcs
         h5N16ct7zrEThI4F4aHEZetE/S3QJccAtxekhoBIKISLCJui0uBxAgLa7jx09VjxNmnR
         oQKPkldpGM/bVDFSYPmpjOZPDTZu8LXiQkDCI4JfXCtwxUOxO2qJ36G7WB7hbqZznGhR
         HSiKUymshrVEJlb52qVdA3G+Lakg56IRpHNGitNuxtr4If6j66qr11h+boMgWFFCMnJa
         8YRq2uxVQTHMCk5b2H8XINuI6zVUTaB+PJDqBPj9mr89dCFSMMsVVCrZHliQ2pLLwMip
         eOHg==
X-Forwarded-Encrypted: i=1; AFNElJ/bByFS5g9Ki5YFgdi4Gr8mI+CwPozGvnteHHHvmPCrh5iPW/KwYaoT2qdbewjPA6tltwPlp3ObOxYwhd+x4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YztQ8zirkhWl8UUTVf2N1IpobHL/QldfwIMq668qr9JayNFiLk2
	Axjby/SPv20XBXxwgenPeaz+QQZTP84DQevgpjBQfGwxUftc+8fkaSmc
X-Gm-Gg: AfdE7cnoP7KwjtGh2cpzUO43Q3AQeJEBI4EsKX7lZj2F+FffmWnHY85h7X9gsRSgHdq
	t/QAdUYGWTmZFMjp4hHq6WEKaMQYTiR1l31MqBP0q8GZjWF7RKLiO0FZznCOwygrP+GA9V8/5a7
	szmo9nswPGecB/nih8GFzTJyEVtG5euHQX9DrVNCkr6cgxXKHlyBToTtW6Scqdyo/4Br55VILzr
	Q9GbCiFz/zzT22vaESL8ZAtxeHfz6QRkXXjIABgW+WNuoTnJOF0WyhyML3vmMOQCwQ9ccXXOiS1
	QXUSoeAnqMRCY3sMruIARuKYJMpuInHRyEjulmFIsadJs9CuzUib9WduVLe4WLf/icQqMclcBu8
	2uVyupC2QHhflCQ5IBLkljd7NlABjm/LZyI17pF/BljdTORjAddxBRdiuN1PpO75LyuupwxzfUG
	KZz9kr9lmBMN0UYiYIgd67g9oszyLvWJKz8A/QaN34hBz8pBI=
X-Received: by 2002:a05:7300:6dac:b0:307:91f5:92e2 with SMTP id 5a478bee46e88-30bca90bafbmr1658562eec.4.1781692528915;
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
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
Subject: [PATCH 16/78] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:33 +0700
Message-ID: <20260617103235.449609-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033530_521563_48943F86 
X-CRM114-Status: GOOD (  11.25  )
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
 sound/soc/codecs/cs42l84.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..a212f6891b40 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -281,10 +281,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +830,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +901,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +916,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0


