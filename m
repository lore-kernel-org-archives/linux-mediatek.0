Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A6CC982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhSaVgPZF5rm02UijUctP+1GziT6CoSBtc+R2AKZdGQ=; b=rY31NIRdUVPZIlxibZfkt857pb
	NzaZiDnfgqR+7Dokji75nhxQZgKqEG4WjfbmddKe0EObK4soh7HrlkzaVKXR3lr8CJNAfjpiN9zJZ
	ZAOLGU8uMWjDEEPySCd519wUXz/qNw2J8ghZ2Q+/3MZXM+c1VBzakgfU6t4iJxV6qyUjnHg01JGFe
	5aFt9+OK/pWLQ9NznKPJjAMxHVO84ufbuGQ9mlHwHTI1hKcQAikjqoY5Fm8w9H9FPGosTlkbQnGea
	nKCtIPOuDM7Cqa92t92lmlHVKnmE+QhihCtmeTiX1MwIHDNshBXDd+Cnf/qlSUYfaQxFq0Me6wZxd
	+y/V6VMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cJ-0000000GtOa-1O95;
	Sun, 20 Sep 2026 04:57:31 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89cE-0000000GtLw-3VHG
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:29 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd4b43b20bso13301905ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880246; x=1790485046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhSaVgPZF5rm02UijUctP+1GziT6CoSBtc+R2AKZdGQ=;
        b=juShknAQB9ZvQupiukFHOUKG89GHdd4np11hOkcfhyB92QOmkSEmDXs/9OGOhKbH3M
         o9A7gNfREHgWE//KZZV5y+pNWjhcPa3LnMdDu05/vOPvxaqrRCuPyz/shp/5yPOLmy2u
         pusOaT99mSzcKYVO/O4Vz1Qlq4IY6qAUXP/IC9xuggIWcjnnRckDmYqCwagEjG6wfWKi
         xZsHcdHCkov1E5JsU7ISPQDeXBjEU9dh4qmy7MR/anDggQYZ7zYyBQcVQP/Qtt+vSZH8
         OYc6/nrR5si+4/2GuC0MMSb5r0ZOReb8pRdUQRoW/Rew/CGvqxt7LyhG1+/0Q0j8XNOU
         9C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880246; x=1790485046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhSaVgPZF5rm02UijUctP+1GziT6CoSBtc+R2AKZdGQ=;
        b=YfDfc0hE0xOLG2nQUhTejovWY5eFy21xZbbaOFF1lkStKw3VUClfNekyis5cmHS8be
         m5VhLcPfUfXmq8QkgWo5sP4Z0mGDX5rD6X6jX7u89RC2irq4CmRiZ0hMNRh5jURB84Ir
         Nsz/9PHXud0ODpqCcGKOedcQZqwcycPNlYjki53+1a0SoPofv3TeoqUlRZnj73w03e82
         rInlBsgcRopdAuEvvaK1SAp4+yh0djwGGo+MdpdwpSAKMEyJAyzyJLT1ahTsJBWp3qlH
         xkzyMnciKe2l1aq166ErY/ojLwvbCFjCXR4dxP73P+RNxcjQXGZ9ZCo7d+tjvw61CtAT
         sRqw==
X-Forwarded-Encrypted: i=1; AKwUvBxGNCkxkxh+WhJ7PT2ngmMYi4uoaiXKnsNuODN46I16IeFkLVypm0TRzSssKqAg4b1j67K/HncRgFvp57iaTg==@lists.infradead.org
X-Gm-Message-State: AFuF++k65tjlToz4LRlb/HbmwSGDc2RSY+wxfGDQ53w15fVEbPwBHOgt
	FAqK935HHdvX24c+I0GlYWCkrnckafS3lWnCvl4/tavNnc7kbkmU7ZoU
X-Gm-Gg: AYBFou3BWVJI5kBHVKDvK1OoFpbZG4mjemAVpz1VtUWbbY4nWlcT7yCUBi5NyxVh+00
	pcixEYY+CHLRN/6KOWNtfaUcFAqIDkx/6LnNawHYpa1htVzyMiFdcedIPXI4mPwR+d/ipHb3CO/
	W8iuzzmt5E1JWsam8UHJB0zqi8NrwnPvcwww62nLrhwpu+GNeKRHQrRcoJFeyWGujBe0Nd6P+e2
	+pGuWeW/XDH/9U+UXqpSFh+EZuiOObBACss8aOp5fIiEcJDJZpSxyt5asWSda/Tz3rlBiHVW+yR
	iIPKmPbK6wl67+23HfMt9EqZU4CdNT428gjGeoylN5VwYMqTa+f2kcnpmqPFCJd5xy7u3SxwmIF
	FPmrq3ku5SuD5J3iE81ndKYJORHwxB6jmuCZ1G3+PVsutaglVJcPZ9NQvwlK3cuJmv8w2FG5Eyc
	ta2HJwUPGsJaiRXO0zWMo2wudWdIpCMt4F1sdZHV6e7t4Elzfkl6a8TVXqNVZGJ3JCKIvsfQ1ic
	H1y4iDLaPnC1IbQNsL1Ayc32Wpuh7g4kBsDcS/UT9XRR//6ylEwh4a9UNwNRR4bwWp4QzOnVYZk
	8m+Qxr5KW1NDICb9CuhLcojoEI1zYAl37jQZCCM+pX59yoU=
X-Received: by 2002:a17:903:3205:b0:2d8:f965:7e48 with SMTP id d9443c01a7336-2ddb1ab3990mr125558885ad.1.1789880246135;
        Sat, 19 Sep 2026 21:57:26 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:54 +1000
Subject: [PATCH 15/28] ASoC: tas2764: Set up V/ISENSE on codec probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3680;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fow1KNfeFBOwUBq/AuCok83xrJa9sG69vnUGOaB1hgI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xVrK2bPvZvHF6X2dCXrwu1KRTPjZ9y5ViY06av2h
 xdHm9cVdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ6+UyG/6nut++9+/rpg8y69fskunk8ZVavXr+WVdSMRfcYq+WiK0sY/qmdUP2
 7/MWbypxjaSUxbA7lme6/Pk5q07ZaOU/qrPlOZ3YA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215726_894879_06916682 
X-CRM114-Status: GOOD (  14.58  )
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

Setup V/ISENSE on codec probe rather than doing so on every hw_params
or TDM slot call so that it is configured at the same time as the
rest of the codec.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 61 ++++++++-----------------
 1 file changed, 20 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 6654100ac91d..39372d0446d0 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -266,8 +266,6 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
 {
 	struct snd_soc_component *component = tas2764->component;
-	int sense_en;
-	int val;
 	int ret;
 
 	switch (bitwidth) {
@@ -297,32 +295,6 @@ static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
 	if (ret < 0)
 		return ret;
 
-	val = snd_soc_component_read(tas2764->component, TAS2764_PWR_CTRL);
-	if (val < 0)
-		return val;
-
-	if (val & (1 << TAS2764_VSENSE_POWER_EN))
-		sense_en = 0;
-	else
-		sense_en = TAS2764_TDM_CFG5_VSNS_ENABLE;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
-	if (val & (1 << TAS2764_ISENSE_POWER_EN))
-		sense_en = 0;
-	else
-		sense_en = TAS2764_TDM_CFG6_ISNS_ENABLE;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
@@ -452,7 +424,6 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 				int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
 	int left_slot, right_slot;
 	int slots_cfg;
 	int slot_size;
@@ -499,15 +470,26 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
+	return 0;
+}
+
+static int tas2764_set_visense(struct tas2764_priv *tas2764, int vslot, int islot)
+{
+	int ret;
+
+	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
+					    TAS2764_TDM_CFG5_VSNS_ENABLE |
 					    TAS2764_TDM_CFG5_50_MASK,
-					    tas2764->v_sense_slot);
+					    TAS2764_TDM_CFG5_VSNS_ENABLE |
+					    vslot);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
+	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
+					    TAS2764_TDM_CFG6_ISNS_ENABLE |
 					    TAS2764_TDM_CFG6_50_MASK,
-					    tas2764->i_sense_slot);
+					    TAS2764_TDM_CFG6_ISNS_ENABLE |
+					    islot);
 	if (ret < 0)
 		return ret;
 
@@ -821,15 +803,12 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 			dev_warn(tas2764->dev, "failed to request IRQ: %d\n", ret);
 	}
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
+	if (tas2764->v_sense_slot != -1 || tas2764->i_sense_slot != -1) {
+		ret = tas2764_set_visense(tas2764, tas2764->v_sense_slot, tas2764->i_sense_slot);
+		if (ret < 0)
+			return ret;
+	}
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
 
 	switch (tas2764->devid) {
 	case DEVID_SN012776:

-- 
2.55.0


