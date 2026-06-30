Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A854C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=; b=PtxQKZ/R9bpYXTVNLYLqGaohwX
	8vjt1ppdAMl/WLoio4m2afMxh4nYnUaGOfRIWuBbV2iBjWtQ6Bngik55lYAx0u/KecYWxLtZjeDGx
	c2aFI8JjYqm8+9ceyPph2QZUd97FHkOZkGM5KVGrLEnJF+Cx3n5r6c90CopZK446dL1mFmwndmAAi
	mKoU1cMPiikIg14F1X26+oEmCCzqLbOkyCo3Kle2gpEa/qN7jZ2TrC3Rch0n12WVJ2kOhIXmSmXPk
	BSpwOvcPrRAnNjWr1EBR9cx8dkfep96tZff/cv5uXXaBEvqKPIuY5vs75Q2eSBB/Y5awDB1T7SiJE
	51LRkPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4A-0000000Fxs7-0uU9;
	Tue, 30 Jun 2026 06:35:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS48-0000000FxqK-0Q0y
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=; b=QGGzfimA+0GXUC4Wrx7q/eGDjx
	9EJdT3MNo4IHstVqiokPxCvdGhfbIsK/AOMr4imvm2E00GfElw5HbzN0srbuVWWD+J3FO0LNYg+ib
	35xJaBfaIaeQcWvXFfooAdLhcN4GPJ98GufBgo6a4yD1XPBSmd4yXnje5igI2eOLqQG3oBm2MfoOw
	B5Um4J3/zxU+wVGx3QHxGvxo7AOXk4V3x63YgmJ8y9hSOlSfAF2eSby/Khu5hr2PYTfJmQb27NswG
	QNCOeEeSW/14zTYnb5Iaa0ioeBbFuSA39vjop6MVqZT0MLV2OrRg/RV8u6LrKhcKgO6XMJZ56bI6A
	/GY1kBJA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS44-00000001Z4p-1InA
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-847968ca62fso920854b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801322; x=1783406122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=;
        b=VoROSIIh8DNlQHm9IgBo3Sv0I4PkG1+0K4IeK2KMs23ihAI0+vTdTj96YuTfw6nnyO
         XmkLmpweVBCfKzTMWN8ZRiAITZigJNwwBE8qPRR7y8EzE46ANfMTO+ACZcNnx7DQQFtM
         U9lXRo5ATabTN+u6gaMiAnEDdZVQ/te6SDZpR+DKUSFybXJ/szo3a8jx/zMiB+SaL9Hd
         HmeEubMgo9uNlGSUCvROzegeNSQ+D3ZCBoSjcVXPf1s/0osbXduZcdbr3BIxA7890Cpi
         37SzehFpt/DoSeFXyWHJ/R2yrnn43A9d5MLXzdVvBbQbas8XGRMgJ8B9/w3wH2JW+ZCl
         dkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801322; x=1783406122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0N/pTidBzJ8Ptc9uwX4OWE7axc8TdvYboPnbco8nYNo=;
        b=LLXeWTyTW6IH5iUYinPZWJrqnRH11G9hxmNpIinEGfYWOQcwGq54+S/g04VXHebV/z
         0ntJHQCH265rHq5l2MNRby36rddlKwRUkqm+vaJgFBCHt57rOHvLM635E00k8U7Zwsbo
         YkgR2q5+82ZSfCp/Xeq2nGNoFBJY5QKlSxVAMpUIJO5ZxxMVdo9xognv9GzmMbMFQZ4r
         SwdI37LJzpwTXncygeLyY5HJRi96clQMwzKkonEHDjrRGV4s8oXXyv12Ac+g2qWitc4n
         NaNTcYs4czlmwfGXE3kpdbeeinhDhpAIXX3XBk1OZbWhKR/7kfl+FosABIdd2GYHw+Jn
         BmaA==
X-Forwarded-Encrypted: i=1; AHgh+Rqf3K/8ArMVfjgHHcRhkMlk/OiwQeEGpQ6TNy97DV2GyK/FKcBv9uS65GDnctbwqKh0y0PkRpTUPprccVHdhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcqKFc1oNIsFHWXTpJl6XZ3THf2u4/V9lRiUB2HLzrjK634fIT
	QZAPL91sPJJf/wMPiwogKHCkn+oEUHu1P055nzRbC+PoIBPdjKF2CGH5
X-Gm-Gg: AfdE7clNa/AFenrl5MUGt5+L7+8ACNd6Ax60oGpq0Bd4jnMGhha6eRRZ1JXVXDS4z76
	8+lWr3stRZe2FssHlQxTS0lbL5OyaEsbJownqzEhDZ38xju8HKWw4ES7y5lXFod+8aTd1+8zVUQ
	D5QGy2h72Iip0U6LfW4Zrepl7jlUUf4PgF1KsrIkESyPpr47cLmR0Nh2lAmqd+ipyeIiJ2uamqI
	j4EucuCcWnoHk6fnSK/5yy/grRl+1I9HgQcm2dQZv9QenausOBn+kGo6Xzj40475PIxauRCvDB5
	QiJ78ChU5BMPM+uCatUkzMG7ZWRRvo85UWJxhUxsy0h55bR8PaHxbUFd6NVDYPsYG0fuJBb1tdo
	5AtQdLxkY1Wm1DZ4iNY00ATAvcLzzRsFZ5SWW0T7zeCftVe2MC+XJwhRwBdJDBk98a1cT59B0NL
	268lYCVVcd1KbBVVQX5qsncdC+0qBVTmbeKTEr+hnkXfv5hSw=
X-Received: by 2002:a05:6a00:b481:b0:847:8496:1aa2 with SMTP id d2e1a72fcca58-8479f1702f7mr1952682b3a.27.1782801322126;
        Mon, 29 Jun 2026 23:35:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:21 -0700 (PDT)
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
Subject: [PATCH 02/27] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:24 +0700
Message-ID: <20260630063449.503996-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073525_084571_B2A11C19 
X-CRM114-Status: GOOD (  13.98  )
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
 sound/soc/codecs/da7219.c | 55 ++++++++++++---------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..915b1d3b05ff 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -256,13 +257,10 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -270,13 +268,10 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -284,13 +279,10 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -298,13 +290,10 @@ static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -422,9 +411,8 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock)
+		ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -456,12 +444,11 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7219->regmap, reg,
-				&val_new, sizeof(val_new));
-	mutex_unlock(&da7219->ctrl_lock);
+				       &val_new, sizeof(val_new));
 
 	if (ret < 0)
 		return ret;
@@ -1167,15 +1154,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (da7219->clk_src == clk_id && da7219->mclk_rate == freq)
 		return 0;
-	}
 
-	if ((freq < 2000000) || (freq > 54000000)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (freq < 2000000 || freq > 54000000) {
 		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1193,7 +1177,6 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	default:
 		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
-		mutex_unlock(&da7219->pll_lock);
 		return -EINVAL;
 	}
 
@@ -1205,15 +1188,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		if (ret) {
 			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
 				freq);
-			mutex_unlock(&da7219->pll_lock);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1298,9 +1278,8 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
 
 	return ret;
 }
-- 
2.43.0


