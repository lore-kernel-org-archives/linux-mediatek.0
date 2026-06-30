Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66DCC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=kn/J0BzZAodGzeB5o4EkROGwT5
	MTfenF90Veu9ksZ9ap2bb45kNzySh1UkmmX4GbJ4LB5tnKGMrjBcXDvaUq0LUjr3qs8DZQF2SOOAm
	FUAQZaJmFBD/Vk+WeRQ8BI+jSSMLhoBEV/rbjRD/u5eaRDulOqEdoJE26xox5IHVOJQj0FjKZ+Fv2
	etleKE04vPpwX1zWg5ZcRAzpo4R+3KGSN1nA5j78j9boCCFUNJkiZdDVz4GFqf0TsWeNraqzHGCyO
	QWa/mXkhLXOeI/XFcfy7ctIS4UWXgZY7BEXiKSuWeEwyFQiMYRHLmY1naJ38D/ubbeq8KAqaAQU73
	GhablQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5w-0000000FzH2-2hm2;
	Tue, 30 Jun 2026 06:37:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5r-0000000FzBP-3zCU
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=LeEOFZxPx1jrSkvHHJAdFNjaBH
	BSNE6W3aH9oTplb0SqmDqCbS7jT0mYcSZtyeKwg9pNMj7FkmgBM11SUDzi0Yhnbm9/pb4Qv0m7/JG
	of0eDasKGmkgh1L8TsdD39fseOJ7msc2OUDYrUkRtfz612199SJEGh9f2WdJi3ujl704QHOvuNq6R
	T8MN+FTSg2HRadDNG8aI3gB3dTfi+uqJJAhac+xmFvO2WjioNkCP61LYNIJgCl4WeKm4bCkqzLfH/
	fHdpJcqVqpufRYEcClPbiWdFxS9smuP5CR/iDPDSROtQMF9AZ+FMSDBXwFzGITQTJbofclw+NWMaE
	95m2bxng==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS5j-00000001ZK3-2nsB
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:09 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-842338c18e0so2850262b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801426; x=1783406226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=JPuAw9BAZhBX5/DVhgdljXtFTQQar2ldAQfrStHc9v0Ztr/vuPBD6teyRvBMnf3Ycb
         e+q7H4VAHcqdcNlYfIdT9VfmAU2IGgt1Y6vfZq+7uzFvmv0eHgaLzNCBnYh/UYhmCbdf
         NGgtcgdvVERuCZ5K/+cqb1CVH1WcP0vG6WFlfMkwoPL5InlFKrSgzsYaDolwTJvZw77u
         8AjdVHJHyl5rYClgYdyd7wcjATh1GxQbGMlbcl2BiZFz5h78FJSDrE4DPDwVcNU6RCbJ
         dmwkxqVBLUON7vHyRs0ueuDzrTmSKFf9enkST/p3P1VBy4p0UpSHazZ7wYg5MTGJEdoT
         JNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801426; x=1783406226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=fxTf963gAXhrIn1iXh2709dtM9qWirHJDG0rJRMXZOCf3vMA1ztCiHp1H4Zpx2dtKH
         D231l4/qCjBd4VmyCVUvYwLYQaJMYFbi+SKjwkYSITtpWngySunwA7u1BVm09ZZqX8aK
         PLK624Vx/scX5pWP+ceKNXqgupVZdLS7awqcOrQe28Iu1hzwfy8H1FFxDqoKEjIFncUQ
         sUNP3DQsNpDruSJnFaiYM8QsFMXLHc5nZRRLqrEFqscIypyOk2xn2RjQle8IBbhdtLnP
         eUHl0S5zjrbJCOv20ok4CaFqMfP0Mt4PQ58wnwKl3MtUhyH2Ix20hoXppHOuVGtrM80J
         Jhsw==
X-Forwarded-Encrypted: i=1; AFNElJ/n5J1GZoAGGcjtLdsf4ZFaSjcKpPpJU8wrbvAb8mlBN7+4VATEK6yvpUdhO/RbNMmadHR9wJvGQh+LVU5D2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH4fZQBBlbIUaZe8aJoXRkX92I+dh3A4s43lwBxNlXPMs0IoXs
	VnUstwkz/mhWwe48T53+Au7SxgozTTS3nnZkcLkg44mfY1FKhmqB9Dqb
X-Gm-Gg: AfdE7cl8loUEAw3Xx4X5RL1JeD41bBrskXegsbBqXFMqKVEiLI71t0SwBTMrxWT8GdF
	3fhQLI1BQLqmK6dyTTVQJJxGRNmoG4UBprF3YM4ZYN++HFII7rI9Uc6DPR+ZVN3PwUCBGxDXovF
	x/qeHq1fSjL5oGLIh2FYVc3DfZOzl8YokSjxoFtlwlshFNx9E/wg24g0YCn3dcXcG8vsHKbHMNL
	OxVX8qT7b7/x6CJfYjuXQQusXiwRM+Rjk4xO3jG7NYAiHhjr/LAqB2StzbYLxrT/oCO7DQ6nzsL
	2ruKNigJ7eqclHTigMsvBs8nnUh96I5d0RU9+qwoJPzPPImVjtiyOlQjLqbDWDU/sYW9h7RrG7e
	ygdfYV6YsONw99mP1isMBB+2MWUiqf5g78NX9jbR4o9M5YqWFypLW9RoUkWFHYFuk8jNI4zpmSj
	PrL5Lrm0Pu+8Kr7mcs44ydAH4W8suTclaohn2bBGRJ/C0/UiU=
X-Received: by 2002:a05:6a00:ad89:b0:847:82dc:450e with SMTP id d2e1a72fcca58-8479eed22f4mr1846660b3a.8.1782801425966;
        Mon, 29 Jun 2026 23:37:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:05 -0700 (PDT)
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
Subject: [PATCH 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:35 +0700
Message-ID: <20260630063449.503996-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073708_092439_D2E0E694 
X-CRM114-Status: GOOD (  12.33  )
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
 sound/soc/codecs/mt6359-accdet.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..e1190c644021 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -6,6 +6,7 @@
 // Author: Argus Lin <argus.lin@mediatek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/of.h>
 #include <linux/input.h>
 #include <linux/kthread.h>
@@ -398,14 +399,13 @@ static void mt6359_accdet_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, accdet_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	priv->pre_accdet_status = priv->accdet_status;
 	check_jack_btn_type(priv);
 
 	if (priv->jack_plugged &&
 	    priv->pre_accdet_status != priv->accdet_status)
 		mt6359_accdet_jack_report(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static void mt6359_accdet_jd_work(struct work_struct *work)
@@ -416,7 +416,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +450,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +458,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +473,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +496,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +518,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +536,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0


