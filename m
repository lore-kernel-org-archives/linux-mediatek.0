Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A63FC982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=; b=gs7iQAPTI0CIfJBRZNM/LMbeX4
	5KQ6M/S1iTvtLAlAadtsp2kcg+Ym8FWw42R4l3YHFXeQCM7y3tk92sCMem9own8fqoSc4FsvAaOaq
	Gf4KGsFq/iXm7v6caq62DFqmY6rFL69PWj13i307HvJ4B5Vox2G/WVv1g9Z0x5/qDXnHOveNdgmjm
	YKSJwIYfK34J5eHsNX63gI2ozx7pg1ZwZJI+GZw8Eh0g8czksSSk56Kpxi7C0ZY2LM6EgkyNsDXwv
	g8ZWdUdLZliQakUqxZxP7zvo6+uSmTFDdljvNoT14HsYYHCMeOzDog5ddmCw4xQR93P0i9CIEolPC
	qwXV/2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89aW-0000000Gs3O-41N4;
	Sun, 20 Sep 2026 04:55:40 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89aT-0000000Gs0m-3MIY
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:55:39 +0000
Received: by mail-pj2-x0e.google.com with SMTP id d9443c01a7336-2df38376150so1165255ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880137; x=1790484937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=Pble97URqibzkBPUi4h/JNB+4uyuHZqz9ex4QX5fyM24QjwufsQGb5H2Zv2+qoTywo
         QBKTLd9z3BU9lWgZoFWUuqJtzCEUjmoiXQKIxOZpFKPRnMsH8JprbaaRyYRamHjzu54c
         74kpDcq/RV7UFN4kOmIY2+wz1ja+vrJY0TyRT7kRvf3r0g90VIqRXWDvL3x8fMhktVQh
         J3/Fb81YeU04+Lr657Cndv6ewlijzV/Rl2UXTrLCBKqwR8pnixyxH0xWiTkjrMAri5Z2
         CWsZbpyK0HZVs53RPLtSDliMf4L5kffdmbSwz55AeOJlwsN58Znrsi31mzvvbheiyklq
         8fSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880137; x=1790484937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=dcHu/N2ezElxLgspfVnk6gHb+6lR9tW9+P8OkvP9jvWRm+JHBoq2NNf48KgyABk33V
         nCsSDtlqBkxzRr1ypsN3vl5yfg2L7Uwq912eMvYHeTgcVu0QxG5n/fVvR6c9U0pLev9P
         YgmTVFIyWtLe0hmW4sC0Su7vwoQxYSXOIEfBdZS1Dg9HhlvhdAlIHb+0zfDzh+qn3oPE
         loT9y3AATNwrAjbgbH4VheZbKimcVzbpMwHCFyqUQX5eI8TACCCnA9REvFsQ8LQyhS1G
         9Ljo2rRLj4aq6n0gNT/EiqvoDe5DMy4hSDCBqFY3QKHxjALSaVPr3g0wNc/QXk45I16d
         Es/A==
X-Forwarded-Encrypted: i=1; AKwUvBy6hFxscyyTJwhxrjV37Z9fL1xZZ+yiUMpHU/P1h1+suvz4qJqBMMxjnEdXislzsi++dSrMjxcy+zwbYW0COg==@lists.infradead.org
X-Gm-Message-State: AFuF++nuExX99gneHymXnBXGaF/i1/H4U0oqylPm3pvonoPZFm8yyZm1
	75IFPoYbDFasRd2SGerSbEqLaBkTpVa98aFs5nBiWaFlxact0B7isGG7
X-Gm-Gg: AYBFou2hBOblTcwJOtZ9L8rfv95OezClep8A03B4YHLLRZJqk1gbdIc5I+WeDXcJyV4
	ktSxk9k4MASStrIcPbBVt801BUM6ccYadwYAXcQ44vVMCyWeP0ACiy81WI4nbRT3qI0KTkcZ7+y
	c5ECNtv1kcbdGqMnKlKwENP2TNZXncm/e+TKFiVFf4GkUGInAn67AgNOdHkPiuL/FNx964sLVQr
	UAPfaXVmoN8cezjlrD3sW3Kowsoq4YKy/LXnfG8wYpZkPY0l8wl5r0ZMUvRU0Qq+mnzRbZNvxAS
	ex1woMjGTs+oRvhuPcbbRl3APvSVS3X4wht3FO7Edt4QpcgZGBF3RNaSmP9ZGMMvQTvPiKhAANg
	LuuqGKteY9cv4hpDI3IjwidNeN5m2oscwr4X8bOjZZygs6yW6nRLoH3yLcvjAHAlargije+uDs6
	iXJLjOfnIWNe/nnOrKaJmBzs7R2LNNsA7AeV1//Npyz/qdsNLpmJBvIglqWszcxPPBz7f3VlsuD
	j++wj4cYAY+2gTpzA7uxZ82o6FcZ96S8Iqh5xRKu9l2gep5xxWZNh6pJ9ZT5sVY6T8dIQAw9vVj
	UZWsdqFgTm6GYFhgCf1NPOIg8S4LQLlH8XW1MD4Iexqyubc=
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr42342795ad.37.1789880136783;
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:42 +1000
Subject: [PATCH 03/28] ASoC: cs42l42: Set a faster digital ramp-up rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-3-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=OmSPjK7SUuOGMGgXmxuIo+R2IFqwguXc6h4eMDL7B9Y=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UPyfalrpv1r+xTfu2HLE4JBaWJnIbuCs4xLr/5f
 j7JPX+yYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNU3NBj+6VWfZumKncEUeYQh9bx1/ZJCiWl7v/0OePDm0bym69Z1Oxn+F3iHLD6
 yt/urYQ8zk7cEo0T99E9aWpIxG7Ysk69699SeDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215537_862710_355643CB 
X-CRM114-Status: GOOD (  13.00  )
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

From: Hector Martin <marcan@marcan.st>

With the default ramp-up rate, there is a noticeable fade-in when
streams start. This can be undesirable with aggressive muting for power
saving, since the beginning of the stream is lost.

Lower the digital output ramp-up time from 8 samples per period to 2
samples per period. This still leaves some fade-in to avoid pops, but it
is a lot less noticeable and no longer feels like the stream is fading
in.

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/cs42l42.h    |  4 ++++
 sound/soc/codecs/cs42l42.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
index 1bd8eee54f66..b3657965d491 100644
--- a/include/sound/cs42l42.h
+++ b/include/sound/cs42l42.h
@@ -62,6 +62,10 @@
 #define CS42L42_INTERNAL_FS_MASK	(1 << CS42L42_INTERNAL_FS_SHIFT)
 
 #define CS42L42_SFTRAMP_RATE		(CS42L42_PAGE_10 + 0x0A)
+#define CS42L42_SFTRAMP_ASR_RATE_MASK	GENMASK(7, 4)
+#define CS42L42_SFTRAMP_ASR_RATE_SHIFT	4
+#define CS42L42_SFTRAMP_DSR_RATE_MASK	GENMASK(3, 0)
+#define CS42L42_SFTRAMP_DSR_RATE_SHIFT	0
 #define CS42L42_SLOW_START_ENABLE	(CS42L42_PAGE_10 + 0x0B)
 #define CS42L42_SLOW_START_EN_MASK	GENMASK(6, 4)
 #define CS42L42_SLOW_START_EN_SHIFT	4
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..c40e8da8f6eb 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2422,6 +2422,16 @@ int cs42l42_init(struct cs42l42_private *cs42l42)
 			(1 << CS42L42_ADC_PDN_SHIFT) |
 			(0 << CS42L42_PDN_ALL_SHIFT));
 
+	/*
+	 * Configure a faster digital ramp time, to avoid an audible
+	 * fade-in when streams start.
+	 */
+	regmap_update_bits(cs42l42->regmap, CS42L42_SFTRAMP_RATE,
+			   CS42L42_SFTRAMP_ASR_RATE_MASK |
+			   CS42L42_SFTRAMP_DSR_RATE_MASK,
+			   (10 << CS42L42_SFTRAMP_ASR_RATE_SHIFT) |
+			   (1 << CS42L42_SFTRAMP_DSR_RATE_SHIFT));
+
 	ret = cs42l42_handle_device_data(cs42l42->dev, cs42l42);
 	if (ret != 0)
 		goto err_shutdown;

-- 
2.55.0


