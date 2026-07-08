Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8080DC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=; b=CA4mzeSs7b1X+N0GzP1LZuEix6
	ykfSRMhPZRmw2YMwhKhepnfQqROyfDfOHE8gWJyogRDvG3D3VFnFbmvidPmmDODMNBGYxV384Fd1l
	1FpARE3fQBmYesqgVduczB10Sa7ONXX48g76dyQRKbdBTL6dXwcyjfkN90FJv+QbDtGnCWaRLJvH3
	bUty7vfpOy0V4afABl8NUshEjsBI3pslhq2uRk0E1qp55B0RToPGl/GBNV6O6ozTaDsj2ZqRHfOyS
	GrxQbhYWBB/nl6Y/+CZNNufbuwhIB179jI5aqbyAcv8etVvHcUzCm/POBPoLeR/Z/pmAdEqPDXahZ
	bnn/wsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7K-0000000HG9L-2Afx;
	Wed, 08 Jul 2026 14:19:14 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7I-0000000HG7f-0HmI
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cace91f112so8233035ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520351; x=1784125151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=FHPJ/2LK2DAeXgq0riH8s5lPEFzfgr4F6zRScgrS/DPXdXpcgRf6u1jU5qcBAefcx5
         BI39xSCITWqqAtSSobLLoj3Fudu4kCjwy6S0ARu8BT21EKjnkc7G8kraJ3lhymZT0ZYH
         RnuTFzIMSiMrboqvTU9NvjoEracK1dty7jNey2dPKOtJxJBjnTwxf0miPTVeEMr966E1
         KOh73YOt72iDvV+uCOo7jWVFTB7P/2vcHeKtvVXs3JyGUiraFugEJlTxJXeYGSW+/oBi
         piiBb3W+cAIucs5J0OhCqYJ38pzCJ60sBKtcF31cUHg6XjZPkikYknArb27kH8Ssy9ca
         7Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520351; x=1784125151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=IBpTXlfCF+3epYjSB8WxnWb/MMkkBOsYrLLazNWeSDIqYWpD0EQxTSWqstMkQWxwq6
         93/kd9BdxmYAgXGs7K93F+uil19DeoGe1gvPH4lKMZOuDE4UtBQaVsNoGDzbaxnogosQ
         9sRpcP4uO5iEpgVMAA9BccG7lycwDxfRkHWzUkpbrKrWNVxY5qoo74pPWs4Ms1gK0BTh
         c9Q6WGpmfPUsgQ/U9C3UtelWygd2bj+nXyyciIkaO07PTcIoVzdGoRmVttdTxyl/7x6h
         cqo7NKCFyCpckaqPKGCFm1S+tIAQXHFpqeV3MZ25eKCCCPcbizg/+COaY1KfGGJkqzfO
         6CAA==
X-Forwarded-Encrypted: i=1; AHgh+RonM811oMatt6MicoRTK+WZrv2D7TaKfTnFnqjqfVwA0f3RnQkzMP0ZVNsEFzYhXaqwsri6s3cp2AeskznHjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWCEK9pogwa5j2laGbUYGXagvyaW+jsJKFUuv8yZ6oNUfbZWQc
	keWyzxDPuaDaKid8XDngAD75ij5aUkMTVVNhBBvXKesl1VQJaaxxGLPL
X-Gm-Gg: AfdE7ckmLYRR+qAYIE0rTrmk8ynftOfCgJvUL2tavtDQ7b94fiEc3lnSRUZ+M84551D
	FIObFlV0IaTfF81xkirv3CvXe1/3Fg/Z8fOSNREtKsGOj0ftRUC7NgoGZZRjNSnvT9wG3nlDSLR
	90AU+QhM/M+pCHsVItzr7CVefzxuVql3HhCWF57B8p3WSiUMd6ZD61/heW3b/hQkO+rUvybHYB9
	t06rYgHPZr9x8lEaqSuYz21cHjkPKfg/KOstw+U9ePOCAcV+ezo3oXCXsFScSmJc4a2BbkhwV0t
	O4D1SDeatDQRExOOJU11eWRCrOcVRfz+NJR2U8KqRo8Ppj5zWs5vdYRnJ9uJipn2ASdKplN7Yoz
	snQwL0Vhm9V3EBlJpt+oYtnNg7Ii+vAYKIS6nRPGy0Lis+cR/qUqf2OzYYCj4Vs0v6R/xi5/Q3r
	N2cLm7oHowyCbf91qkyukaGxL7lMCGC0lclKZVkFYH/eA+guQ=
X-Received: by 2002:a17:902:f64d:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2ccea48bc51mr27117655ad.37.1783520351057;
        Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:10 -0700 (PDT)
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
Subject: [PATCH v2 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:08 +0700
Message-ID: <20260708141734.578926-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071912_134959_32F5FF24 
X-CRM114-Status: GOOD (  12.97  )
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
 sound/soc/codecs/da7213.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4bf91ab2553a..923b997efbc4 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -11,6 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -216,13 +217,10 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -230,13 +228,10 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -244,13 +239,10 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -258,13 +250,10 @@ static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -465,9 +454,8 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7213->ctrl_lock);
+	scoped_guard(mutex, &da7213->ctrl_lock)
+		ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -499,12 +487,11 @@ static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 	ret = regmap_raw_read(da7213->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7213->regmap, reg,
 				&val_new, sizeof(val_new));
-	mutex_unlock(&da7213->ctrl_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.43.0


