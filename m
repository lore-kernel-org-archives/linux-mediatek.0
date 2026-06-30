Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBD1C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=; b=L3fwd1TlYJ/Zx4TbrlS4btE9+I
	hd5fj7HUSYBe96Sp2CzmWubx3RrAMfxf+QzYqRrMWPUA4EFfMxTaLfv5xyXwix3MW8iATQkTP6LuJ
	qlN840+8qldq9xFrdpGXbAhmCFqcGzyKnxQMQZSUn9TteI8OwhuUxmJsoyJ0rMFdoRv+4pQXDWT3y
	p7q4QLZF0IQPtZ6UoHzFe4VzU9GFybwPzmBbfi1vJUF6+8JgVVabUb9uxJ9vcYlqePobOSZfvlhna
	cVIFEGBe5BwfVNJFz7wYA5Zl45fl1amZEeLmYVcO/09Ts0ON7UYftxdNmp3eSnwxSojkxM5nYKspC
	2UR4qRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6c-0000000FzzO-1opb;
	Tue, 30 Jun 2026 06:38:02 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6a-0000000FzwK-0xml
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:38:01 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c85c531d4a9so1611774a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801479; x=1783406279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=jcNZPzBUIF0eNxZNBn1BMyCcYDUPJasW0zc9JWEWZK4/tqf74g8Rl4pXN3lGjjt5/C
         kCMX//rC9PmNmfDs1CIWnvfi99dU4Q5buEMVJa9Bc3THfJJjW9d2yoBm1PBK8o66Z5Jh
         6J9QAmgixMjX38U4ce3Pue+2xrPKToDii/v1dhUeB6mqtEqHcTej361bS3RiJV79lPzY
         8g1fhsns3gOVTIg2hcjTVgC4dFl7io9vMzRJcjRCFGg8DiCGGtcEofcFgkMp8em/ZMR3
         7XSoHhUwh96L4JW8nFWtgznhNAVoYU0y1jclvEYEf8ea/jTWSNHvEy2CKLIOM2QDrbbF
         rlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801479; x=1783406279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=qrLywvQ+hzKeTmmScqieUUA4nPpkFTAMiIvytYP9MGeIgO69sH8SVUZyAgquaYaczS
         YNJK3Eq9ZQpbO+IesjXxDj5rIy3UwpztOmCphfdES0c/WL9iwZawmeVzECjODlk2Gdjd
         aYtZJuTX0OzJqM3njNK3FMmhJKX9qHOX/sheHbITbLLafaQUyWniciXL+NSlz9tlTPtU
         fWAg7NRkj0BctAFOyY4U8A7Qkf5thFs6xUwp4KfLRXYb7k1mqb3BvNcuvzrRycTnXVlD
         N7LcqFeHTQKPuMvr0zWqZZnwWb/hREnhXZfYs1wIoQw3uvrS+RIGtqJH10y8qdk2sJdH
         84Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+zbBWJeir82ksrDbkd8cpEMTImiNSKsA0+7fOaLrLCj2Nh3RNGJpB2u1CrzQrRuXhln6rfE3GqAPSnbWNmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6idpDrdHc/6seRge+kbSTPtbtEFMP6oC8xXVD2CqWk74oSd5h
	cfPBt6A18LBvqJxc+5HDBNVJmYdxtxPAzVHb7HcuvvcztatxBfKlQLPJ
X-Gm-Gg: AfdE7cmsHueyU5q5sq6fsFOTjw1gnejugMNb0+8SyfyyNbDBQ1mcbAI7q0bkTLnjqRJ
	a2Yaokkp/LSpWDoFWWM1nHIHpWKSw1V5FQfOnjrPkB2Vw6cAioEBQ1L/N7nkRbYaF6ntxG3TgRX
	uSEIlnLb5ZsYZPOmb1ZPTRQBG3bJLioKIw7QPC5YXCF5sWnGbMz9wL5XVUEWUnvLvkl4MI4GhYl
	/FlA3958eFxtTxxXIQSB4hRaNuSS9mPO9hoQsoljH/vvYtTXaYGtOmbF6ruJGNNS2+cY8833Soh
	QwG/7XBKELomZo9sPhV1Ph4ZwDOAo02plDhzW6XpE2OeOqVIwJbgss3qOYIO3vJtEytvwTLuzph
	t+zvXndeG/15veYySJr13uUgaECjzedpeYSIeUi3JJ9Iu36qYRLVBygaMlFTWcaF+U94vBxiPTm
	lqlSXkSz/ieH3z+WvXnU/3zfP643IQWNoPWdWqzXkavnxyP/o=
X-Received: by 2002:a05:6a00:94c3:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-8479f3fe486mr1817309b3a.44.1782801479404;
        Mon, 29 Jun 2026 23:37:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:59 -0700 (PDT)
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
Subject: [PATCH 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:42 +0700
Message-ID: <20260630063449.503996-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233800_288791_1ADAD612 
X-CRM114-Status: GOOD (  10.76  )
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


