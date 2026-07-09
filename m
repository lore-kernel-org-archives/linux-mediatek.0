Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F260C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 04:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=; b=jve2+6t+LrjtQk1bGC3Zg+9dW4
	cmyUkmRiWSH/ruvIH+7hrmFpkalU3NzVm6pQ3pqP038+ighmgE9HrYu9i5fgtb32HKKCFL+HdriBE
	f3UYFeOKuC5CvTTvfMyiFyDqCowTf6nDD7y7w9u5IClNlffOh5frygQUZXNs/VLYRzscZHxl5PyzB
	ct1FWEw8Cs2XgL3ydrU17okojm6ERnRso6rjjZB6p6trczvJwbPVyLAfVl/2+oGSw9oefBoEvJBRe
	/8D9dlLn/jE5vFJovYpdd1Oh9mIW7fPRVCBV2GqM3/RGrfqbIQpqQBjBQFiAP6EgLRHazJ6E8IET5
	n9NkvmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgrZ-000000011ll-2CZq;
	Thu, 09 Jul 2026 04:59:53 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgrX-000000011ko-1C6Y
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 04:59:52 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-388b404ea89so540909a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783573191; x=1784177991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=Z6JaaD767IYjEELwIOalaCzx7OjUR+rb0kme2w/VgOYz9cC/C/a05cUPdrx3E9ApV5
         zIk3W//EuVJN0qry51G62ZfszRrhSTJF5dx8FWGd0l7X/wRxMdHSPu8mvy0/lvp571tv
         y6Ji0oRysRsXJI+BrPY70ouOUlG2LhAixJYH6Hj1HR1H9qNwicD3lQ9HCmjjenpCmhe8
         3Zmt2WsMSakLlNpzxFKzxC9b/KWKDnIMHAngMr9gC0JGdsbPzaeOZA/pgATKh2biQfhV
         oEADWMrtHj6PstksrSxD7pVO4RuDtfRK2xABX2WLmG3yBvVuC9foF3s/QdUysUTXRpNm
         W1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783573191; x=1784177991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=sYLdGySVFg5W4NkHWQbpr66Pp6Bqz7tbH9nK3pCtDNImllKyKj/uK7mCPpSipzenEk
         nHm+SJOp89WDfalgOo9PujXvSR1Qu0GRrVbywNAWTl/jZHcxqlIPrJwsLzzKoLzd6+bV
         De4NZGnUjVjPn4Ykf1RtF62U5FYEtty18MbY/KcGLPANNC9PTH00pjL06Su9mgeDxw/B
         D6rUzzDQHnNE1CHkq4oBdn05q2t9PWPmzBVEdSHIPwCLXfk9MXd56r9poQyMK1F03/25
         NnFcIRtwdSUI8oe6dqLxP2yX8IW1gevxCEgeqd6W0wpU534f4KIo6SzNDSrNWFrebC+t
         ZMjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBUYXVkOBQcjM2e5zdHAqCwZGU+gcZ1hxETVM/LYjBhIqv8k75pt9YZCNIDdCS7GFwkHzWKFhNRevhyHhZYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp39Dtq5qTCUrZ00kLtLESNCnFrL3GD5F/irn9V11goITDXjqE
	O24NUCbob1ZxvCsWLGVwUR+QC8AH7bLZw0QbrdUfEE40kt+JUrE60uiE
X-Gm-Gg: AfdE7ckjWI8DuE9qZka5r+LrhyyF+1+tRpknqq9tdY4htnylYlx5WYGDfByzg2m0Vr6
	XQrxQ6899kQkCEPdHrK/R7tUiDowPRpo5Efm/7ws/nrBvEsk6r9Vci2kLVuuhLbwKPCACp5AQr8
	0x0XXZ72YKWRf1Bbbo2H2c1L/ITIuVPHOUCgm01Ii3m8G3cBZ1a5LDiCVhDco+TTEcNwI6JKLrK
	63nhnHeqdGj+DVonhzZIhryc9xOPl/eReN5gFgqKRa5dQxyebywntgyTZGSazTpdI4Cjn06MAGp
	dLzyPfzTCuYHsXi3rBEPHgPSipycpNqty+YbJzoy8d0LgjpjAo6xhtf1nNubEo2nZ9pqtEx9ODd
	eaG45TY6ZbMbhrO3lStEaZ/jonHOtiI64zNjklsxk5G6Syk36TH6aULixmWkWQPTTT9MBExrBLi
	o+Gm5Dzv2qQyk/ibPvXI1SQBOOSi6FG3Yo9S8euEA/+rUUgGk=
X-Received: by 2002:a17:90b:274d:b0:385:39ac:fe4b with SMTP id 98e67ed59e1d1-38b75528c91mr1355508a91.17.1783573190664;
        Wed, 08 Jul 2026 21:59:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm490481a91.3.2026.07.08.21.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:59:50 -0700 (PDT)
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
Subject: [PATCH v3 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Thu,  9 Jul 2026 11:58:36 +0700
Message-ID: <20260709045902.498848-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_215951_325518_7F0B6268 
X-CRM114-Status: GOOD (  12.59  )
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


