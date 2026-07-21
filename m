Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB7BC44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=; b=hI7kjn48i0rbn7lCc/oCQiMxfy
	HUiIMiFDYfL/uaCxmdzExd2MDzbuMrPzE9NXY6yLOahoNGImzck122VnPsVtPEIUYLF0k6U7YBdIT
	Kf/gV3hehaazHXtUy7LKr2osJ3/PZCw2Vh1n9np+0pnXEtxNaPv2zQOJn1PqXTY21g+5lEKSg6tA0
	DHCP8SoSKYlOfiH9hknh6q+lWnYH8JwK3OWp3/9s3waS7xMJeFTvSr0wlA03OsjlTKo57t8TGKTCX
	rT9gw7ANLCcThVQgwv+Ir0jMXH8wbrSzf2vggUhqCNz1kUwhV9pGNhbCUEWJWMNHQkdWdIGrUCK1x
	S89+Kqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ig-00000009AFM-2ikX;
	Tue, 21 Jul 2026 10:29:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7id-00000009ABf-3LQe
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cace91f112so114296505ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629739; x=1785234539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=Gy77fo37ZC3B6ZZbhG0e/LoxTE/SOvol/31dVzUxeFY5RStfAwlBNiKNOzZd9tc+9S
         inXdanUVqtjLX7ltWXVral/GMwgO7nYX/p5YoPYqDtUKyN9MJvhmkBkKed2K8e3LXakp
         b1E/fI8MMs1PrR5k/gVm3GF6TUdR5sQZV/2C+6+tQURFBSDxJJfUvuSjRguHWGY2uOpU
         2Qd8tEJ2kuRKZq/1Ba/AXyhjzd+IJKcdK7lb8srg8+2dhkJoqHzAfcfAce0c4Eb8yAwK
         qSCSbiHjIKrZs72eXtoVj+tqOlyiOhAr+CiuUtrn43VUYlImOFC9z3vQSdn07xLlw2w2
         A/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629739; x=1785234539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=Du0Ecce9MjH+GstAMJEh94Zi0RFchVwsG9o9HYg5LSgCWXvpkM6Jj2LwWUIfeYZdzx
         DO3macSYqC3doHtjmBUHnkoK2KC77wvAdUtiWpk8FlfTlBVea+CWwQIz44eN5MKT1dEE
         t3xniHzh6D+2Po0bnrWNyjReNe3Cj4BMFhjnfNVjnC7c8PJZTVQOchWrjmLNwztO2Reg
         TR1iBP5wuZu17jZKJKPO1XM3kWq8KazsmkCOUTTLoryVXP90XVzmW3wYsG0fxhaRV46D
         vF5ei1I7K2Qc2LIvdWfA5P3rIkgJr30BJD7qK5hqj8io9vE+Rw3eW5prSjTKtbkEBrZi
         UHyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqwr4Gk+xi9ZgfHgXbiBKAMXrBY4E8eMcqZdp0OQpp6K2jU57J3qiZA3m4YtbSWS7d+RHhQtZ1NG1m8C8puxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQT1AaqClkDifWdu86a+cgILLDDONSdeYDtLD19NDgM91mDd2g
	/HT80d3P3OEBya6NjAMs+tg+Nm9q9pdm/g+57GrXom8hTmGLAJEJyqHE
X-Gm-Gg: AR+sD12hzAqnycXgH1pJv8VKEm3UWqjvLQ8w0R3DRX9r/eBx1LV0MzlM+Xrg6W8nYh8
	cNtdfxIUGNc/a7R+TsCR5hW7vcJCzEPicN5mHDwj4NgOaio5ATamO/UgQ/BZAVzZFdoplj18Aj7
	pPEzABBo2jlfarc+MHMKXb7Ycy5R8Gl3yEje8qGvj7jOUlhiqXXGK4lP36cWnL3bfNLYucAR4lj
	oCIgLL4aYViktU6r2oI3OIh1IPlTXPQX1Kr+U2wEJdvlb0MlodCxJ77odxLFSMPeRjMlUyk6ity
	5xTjjABCCaHWHtXP79DdRiYo/vbvlsSx3mkv7bWLnSlSrH09G9eKWpn+RvCC8NEkUGN2T7ZRXiz
	4wmEgYhD1f/7OQ4WhwNVA9g1Yza2HEh5sqCNo2z5u7HhptOx+Hos4x+wUD9aCy9dZfTaH7HBq5W
	Z5Cjmn4LQ/ZPpmu87vOSkPf92fbPXjclg3gwVb
X-Received: by 2002:a17:902:e54b:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2cf348547d0mr202166025ad.12.1784629738893;
        Tue, 21 Jul 2026 03:28:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:58 -0700 (PDT)
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
Subject: [PATCH v4 20/29] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:51 +0700
Message-ID: <20260721102600.523199-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032859_906245_57934805 
X-CRM114-Status: GOOD (  10.86  )
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


