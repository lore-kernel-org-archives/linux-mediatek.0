Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E99C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=; b=EtrJvYsQKeMCh7YzA5ApcRqa94
	lIbR8PwT9LmEwvf1Y7ANl1Fmu7GNLY9U/tC+FygmoFjaEMeVdTq1P21cWQaAhCK33HBVS/Lb2IVxm
	wx0JqLKMuF/otBNRDahCIinoHVCuTTiJDu25pYLWsDbA8C36FG8XIFwq95KKaHFeehQybg3hULl23
	shY1VhIT3jo4b+KF2JFETNYd8s34fShApU4ewTQeeHWQoveDaIKg1k7RpdB3XsgxEy6AxeshC0/8H
	EbJ8NjYpguYg8Zok5qf+hIVwb15g/bkaQSosh01NuD1UfqBFrvlBkTgbA427f58RDqStNJVP+Y0is
	V6hqc2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gE-000000097sS-3yDW;
	Tue, 21 Jul 2026 10:26:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gC-000000097qV-1Dxs
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:26:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cc891373e0so139026305ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629587; x=1785234387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=GRGqYIuqZLuc314C5xtML5uSAKl81X3njk0309koHJtxoznDH+N9SrLmglifsVFpbm
         d63jq37MGRwflCVqk1+dzoIdrJRHVkEOZGSy+tqVhcZBzu8QqEXqdtNPEmH81mgz6Jc7
         /GuzZCAAewuBQ4XcNjHo6pBexRcdjBY6wrD/U/fcUF+Wsg9Who/Y+oxxc4aaluM40QZE
         uEExeu/fNtrKffQPs8vXxA3B7H+DRXzFRy0AttcLomsbkeRWrGB92sEvr5K8U9/kW7/R
         PWqmfUWp2UdgoKRjhBO6GJkqZKCbTD6AF+GHyJWtvXFpUSPdlOC+defU+8szCb/ZoFRo
         Cseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629587; x=1785234387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=mlLD2XCCZKJP6knc2JIBgyreErAOYLOzuyQIL7BWcBImtvn+Y/XfGcIFe0xqNqj2NT
         F4XV9eoUE/rdDvuXZIvdjvL70hlOSl9nNWJ60y8Sh2BAooAmAu8z8pOKwrjM9EsPOYhh
         NDtsLLauflyiuWg2AkFMH0KxpzrKbXcbghZjo2cNzsk7lowM9D9BhGS0hNG4ZfEdfxTR
         1j4ksNBP3gGk00it8OAAkxp2eK9F70GOQ9v4IlCuglsRgD98BxOZxxjlLa07hjpy0GD0
         b/bB5aAC+yOYXNZ2kMdbWDLXFBz6kjwHFZz8bhM4S6yHZ6xwqIJg5T5peK9HfyIIei0g
         kXVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq56WlR8kwazrbXnVcDAByRtz6tooR/r8caA9c0IWursK0qGUt731QeT9J6c+7nJriDMWIQelPanNR9GOOcwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfM6+YGg3e24W+vp4HULez30e5xBKcpi50hh7epxX9R8qnwgYN
	qUiRm8K1u3LyqcADxQixLK9i/FHXGovXUekpp1Ipk5d7PTZNAL6PGdeK
X-Gm-Gg: AR+sD10LJj9CAlHR0cVq4ATUQLNDSYVAQgDq58DyeCLm+6RGYSTB9K0bRJ9EK9j2wcq
	alTmoun8S4jF2DUSmUmIMUUyX/qf4l70FHVw1pMjogTksjl2wAek+hmYm/z9RLdTKRz6qxWuy8N
	I1za+5pn2IsSaETFxIJI0hV572y/Z8QkIRmkpjJXRbaXHpPqZD5tLdU3yRaBoHf2xwpyJHR82wJ
	0Aci4gWtSptAZhCGUYFAzV5WaPVaIXd17Fdp6e80+a1jGxjoPbNo889u4zL6+VxPxUyKXoi8bx3
	aTF55DxHkqDJ1Wm2PNApw2fJeKwnmkZdYAqWn25SRoOyF74a5M4QPLuXKWbd9qVolXdA9flD5a6
	2NmLA3K+aPOIqiV8SLblnai9g8NJys3aADe//cq71+IxG/6qUdyPwtuii7BkpHSVaYGFiH+nU2g
	gP/Kr1ODTR1UXFRdp1YcoZJ9BACtuEbW/lloD0bwE2ZbcOruE=
X-Received: by 2002:a17:903:1110:b0:2cc:89ce:2ef8 with SMTP id d9443c01a7336-2cf34a2ad90mr188368875ad.40.1784629587347;
        Tue, 21 Jul 2026 03:26:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:27 -0700 (PDT)
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
Subject: [PATCH v4 01/29] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:32 +0700
Message-ID: <20260721102600.523199-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032628_351502_6C6888F9 
X-CRM114-Status: GOOD (  12.52  )
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


