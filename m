Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDC7C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=; b=T23hQKPexCNtQ70d44va2wLEdL
	zX/6DbhDCZqwtS5dsrFVdG807cMDxOuBnY4vRxsh5xauu7zxy0ccEq1cXm89eAefVHVSJJp0bMygJ
	p+K5gbxsIYDYTqQb4osJataOmuRUK/Q5PLh9BGfJ5FMzVcu+9KKY7lRFeNhhR4O+KRjKF9dJ5dNv9
	EowdEuYnj/xdfeOH5j3RbnwmD/P3jj7jcQaVse9f3+yw97XqMLGSaZzqqwmxhj7wdM2oaKvPt+lHk
	F6JyD7ENkK150Ea5P6hvRczw9Q0r8asEOkwYInSu2tv578UQnw4MGKzpV6FFvbj+oD2b/JTwJ9ZcL
	OVOEhJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS42-0000000Fxmc-08MC;
	Tue, 30 Jun 2026 06:35:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS41-0000000Fxlq-0DOO
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=; b=LHDA6i88A1ckMTQK4Wjiege40d
	we8EfJm5GWhL3okCVbAN1IsUkA5MiorZNbpJhohirNEUiCiS+J7CZQPY3ECUE10VcE00Y8RBz6538
	d31aRKGaoRVq5+10bFDTZ8UvJVZBcbtEH7vGLnAqudzccrgm8cutWQM0v9oKHX75Qzt8v6fxQWPW2
	2kuseS4ruaBhd6BkEqEmy2Xv/Rqev5tsO3T9NyTL7z2dPMcaNxUzNZv+MN17O0GxV42Eto5k6EmgO
	QZ7F9gMymCGWHvH2s5/+DZXqBSM985OEvY6HYbZ0NTixVr8kbokNeRcLpCUMK76Xn4MAby0gNYg4D
	+AtQBjVw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS3x-00000001Z3V-1yuT
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-845e363246aso1934316b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801314; x=1783406114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=gGe/xRN0QYimFip7H769jRrTasa5jGC/LNVLFp2lkJBZvQ3+5/aPWiHjmcT0xwfBXa
         oF9n6BiK4zaadnSsQzWsOaZp3lTaRIgRjIg/E6B7AKu8QSJFc725infKai0PKHKH1gs9
         3Jrg319c4ZMbSneS+rxVmykqv0CIa/hUZgjp8FiACMKC2Wih/GD/oxh/KyWIFe6N0jn6
         U6zdGs1Y9NKOTIz0fzZ+MoZIQ7JcD0ljjo2NOxwA0hyn5xYoTvignDWaGYq+8/SrXSpq
         liaVKXEpY0fs852qQn0/txinTenZottQ1nmZW+ea03rhJigNbbXtSLqidiUdEHvvnDf2
         YjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801314; x=1783406114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=fsoEk+EjQINSsLFJhR0tmNBPB5s9AqGSIBR/IUtH0EGw0JQZO7pz0n7dl/zxGMvMxi
         scjj58SAXVLPEqUrJ3W0dY8+fb5/x7qOlJ6NKMVB5HfaAj6wHT+4VaSW6zmVn5Zw7sih
         HrtRrwRm2Mi+tt/DLunpApMvW5Q8mH892KPusG4z5DG60txcbEH3pW5Me1soXoEaUMaT
         p55+nJFANSwOJJJtGA9JQIrVXfc/s7/NBYzOHSbO78dMq42RvQ66OpDNkLXFcjUnTpGi
         woBF6P+HwNzpuJBNPdzXvzS5oYiwNGfeq5DFL3s85WFUHK7AIePzvBvu10CF9B7ko+MZ
         dJPA==
X-Forwarded-Encrypted: i=1; AHgh+RrOCWEAIslo5v7vyBR8txS15j0S6t6ua60zg/iBSFs638ALMeXe8XSMB8M+PG2dfYqGRhfWgrbJZnIYIEhAQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJLyNU0oZQD4wb4+YTcgLXU5C/QK9CJas2gs2n/es6ik8rPUxC
	uBVEefqeAjMqLR4FQ9u5dnOLMu5BO4yV4MWWFBpfxlDvzystgjjZqv/m
X-Gm-Gg: AfdE7cklzckR+Vn5KnQFITeOg31jEqxzsi39unUoQPe9eKLSBBPP+VulAlQeVwWVu7A
	JLPkNiaGScID20AAdylzdQOr48wHDgo4carCaBj7iV3f3AS7yCTDX3Z5U0B9rVltjXXVTT8yfb7
	Cdrpu/U4xxnb0OUiVswwSF0H9dXouDDvO/3J+Lu6fpJWdjXRnkL3h9xj6DPpUsOVc4bV6QGL5VH
	vnVkJyxBc+mB8iJYc0PasKkAQzRy33ZO5hpICzMqFhTbE6dlLG1C9n+A64toS4rO1uqBPqtKhHV
	8YFT5EWaIKf9s5BmqGkOTW8LdMT9BTZeyk2S5DS2b3arbWXM06OGhhzvzRvOAsuVCwSsnxD1WmF
	zEs8IIU623v9HLFpxTUIJK3gnrBLHbqIJD1XxXMSLP88xRf29aKhYS70cKQQrJI788O/+xNdL2H
	k/SK+gU3bkMkerSeHqjaNxx2ALqdtmRW801qRUD7XvVDAxeDw=
X-Received: by 2002:aa7:9a83:0:b0:845:c694:5c48 with SMTP id d2e1a72fcca58-8479f27b317mr1885937b3a.28.1782801314552;
        Mon, 29 Jun 2026 23:35:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:14 -0700 (PDT)
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
Subject: [PATCH 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:23 +0700
Message-ID: <20260630063449.503996-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073517_883046_295C628E 
X-CRM114-Status: GOOD (  12.36  )
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


