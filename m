Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE4DC43602
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=; b=jkhfAbRKCASeBoEX+yl8TdrtmW
	MFJOVhX3v+w8EM4qvFhpRUKdn6r+vkTfUdspHQ19e8OiFFjQyH9UKX907YoTJoQfp+sBTyBMQkVws
	z1iSNuBAqHXS47803AuXRu+p+TOJbHwoZFSDr1nfAQnKwAXCh93UR74hhDGRQGAX0nceS3Nw93Bfg
	W14P6Wc1hgvJauon3DZ2GfY9w/os2G3X9biiQVEyyYK0tX603br+ydZq01Jmr1/FeBc+LTG5S2uCH
	kyS8g61gyiPr7GJ6qwkQtGZTLe870EBJit8ac/Uv1pDOc3ZgfY4IGIgIItEUqZofaXss3zZx0bL7H
	GG06XumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9r-0000000HIDO-492J;
	Wed, 08 Jul 2026 14:21:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9n-0000000HI7J-01Ke
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cac59f8b64so8700545ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520506; x=1784125306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=FJivnlB5pYlTxj3VGsvN6yEsBcZjRNj6g4Fb7+/ziHV8BqaiGXnYRTdYOXQuvgxagA
         Dj1GwiO7HyrQyMWZlIrBOHNWcYIiUOnvTxEJHtFMhVgmRcoaiKj57FgWsKlwC7q8k0We
         PaxRP7+vz7M9wTjFTcfki6uKdlwk9buzj58jEBtS7FozgSaw/2STeSuQcHG0G6OqVGqL
         72Z8v+mjrzUakjel6+Pw5h4Z5VN+vqjk6Z66SutqYipJIbygJP+Vr1TyQOySDyZA0HaZ
         5e42pEdKargR4/XJ4JE40LIyLUn7XIyshAtFfE+y5kqYJLWlWCAzJ7hTAZ85BIA+vm8+
         ngAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520506; x=1784125306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=KLoBe08GmRENgnMDD84BdSgumRwdU6Ls097yRLxCHMJRvvC1jMIR5XAHjLqoByWo4V
         Yp7qqq63+dt8SPwnx7SfxiogY6ME2pSATmtK/Ro8QR6pSRP12aV05AFal9qeKkCO+F6H
         xCVQF6KScv/A8SF0ittFdyaVEmik1GLBJ/f1XT8p63LEKvQ5/Gq/LCTQZ1i//pig6z4y
         zzSJzwtdoIUdXK/8ZDxZvOYN6cZHv9Zttc/LLeFxq1rwaND1B4QyCWgc68cn8P8zpyh5
         MAhzt2nQ6nz0j5vq8uLzlWlkNvDwAyRZSXaOIkVZrFXcknZklz8S5Z8TY1Jz/R6Yw6WL
         VBjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9+vhKY3KcH12Tp2kKCrZ5QdKDV77/g5RbLEuB25v56IOD2IYu4Hl4uPz1K1g//Ke1fx22HbbTrvJ1af/OmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTHp8rU3nMBTzM1h/fkhNvokG8wykhmXWPgffXAnJqaxI1CcI7
	ZtEcW0Rx8R41nsNLE/oxSr/Z82fVjd+Gt5BZgMj0rBOtE2VdK+08ea60
X-Gm-Gg: AfdE7cnBWAL2Fj8etNhW/tAieaJTpofGRcP39WnVPtnAlnZvVWneeSDjcu9UfyUHPt6
	LKfRXaNTnCKf3QQqBP4U+w+qwP/kaczbYNFaeIjXcgHKBNEzQplYRkxLcI58vgbVF9a1Dzgf4oz
	7jtWdybFvwJywrwLPLoksQPfc/3tRsEP0RjDp/pm84rWile5Zfvv1gdIRrLDiLgo5GSBmygEOPd
	U+cD8UNjaWoRSKA9BWZfFKmum4yFyflpNsZqkZ2/IleaS5DeS9QyKOMsukqDGSNCbCSky/2gTIX
	cdUoCv8D6R07cy3sg1cBoDvNYZrsYBbOjzcakRDVrCdM4vXE6YMDxyFLQUzgyZSLl6LrSkDBKdf
	EdY61aokfTpgSMK6887A7FUhcXBHfBd8toqLCn4yk4GgKuo0HoKeL8mF6/pCleZSYKJb7RxRzFm
	heG3biAGEXGmLMRDc1P9bVi8XGGyHiwlh+1HYzrZL4fk0xmVI=
X-Received: by 2002:a17:903:2447:b0:2c9:97a8:afe7 with SMTP id d9443c01a7336-2ccea3cb09amr29387565ad.42.1783520506198;
        Wed, 08 Jul 2026 07:21:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:45 -0700 (PDT)
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
Subject: [PATCH v2 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:27 +0700
Message-ID: <20260708141734.578926-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072147_080190_19E8F71B 
X-CRM114-Status: GOOD (  11.31  )
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
 sound/soc/codecs/rt5668.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..4154bad27610 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -986,7 +987,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1054,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2355,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2399,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0


