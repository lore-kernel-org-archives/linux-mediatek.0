Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C9CC43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=; b=aHt2pjPkeouYe0cInxpN+vK4CV
	xMdlqKJLqmO3K5Up9qt3r/sjLbuG77RgzO2bDHM+czFeYYPY1e+ZkHBtJ9cXy/p/OxhlJV+EoTh12
	x9pG0AqF0qcO3lthMsjy0cy2nDkD/TwXWuQ+L/4kiEf/C5R7HbpLRGTzvDr8hT9gPCcX+InBffR0h
	7Gk4a3ZJV1KOWgCmqRBP55iZ3YGOf2jOdcZKvszc5mof/ETuqKf5r9idx58ooU4/IbBrGAlbcj4ME
	fvE/hx30hHOvhMG0VRadhy2Ats1c295dqHFSzsYneboRJ+7Z6R34lxGTtQ5IDcebLDEK9bw82bFhC
	iig72I4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Ri-000000048Yk-2OVY;
	Fri, 10 Jul 2026 05:06:42 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Rg-000000048WS-0tsw
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:41 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso480828b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659999; x=1784264799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=klqIXkWyt4I48QdN1/aw1eXQGlHBFSKfonqt386Wh820wNWPYAvSc2UplXlpJR542e
         4LSkpqQXnXhbVEe9Qx1wH0joCLPQoxu1ZRAsyfpAgK0KzumFMW7m0DqPdKFOvCJyym27
         wpUwXSZwtF8CiVH2X+2mHj+axvMhhf7zA6XGPVi0ojS7NAgXDHCcVD3dnSuVgIzK89jH
         XKqPWFEFCB+iAQCJkDd0qOuXYSoYpH6ln0T17JQAFeC9Uo//U/X7vjo6RWTrk2IPnXO8
         0iPhgbXIdB5H8hjpW+RPkh4p+duNL6b9KZBma1ADGQmGrGX9fexas3MKQOa/ymGN6/mY
         jTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659999; x=1784264799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=fobvfKbCiLrFu55iH3S1AgB/4OccFUORcKftZ4sB/fXYcLJZV7tW5T+cswxDoI3AZE
         Nz49l5TIkXVw9Q5NEjAVRbWEwfynUs+m7UIYE0meGkGktnPgZO9+AgJwBSFydMyJsapO
         Qo2U9O2NrN+zCEJa5nkB4mRHJZwDeIaspgGUXlRLmZWKStVMV0hUywsbdPyTSJrdimRS
         DXqoc0D25R0QIsS4eJEpduOp9ESuyvKyYtaG+L7GlWTqJ6uTU+7obD2SSleEg7y550VT
         zxBwfk1y18CFb/gvrxe0SjbNd23Yfocx4a8IU0eMiidCGpwWAoREGlUo0l3afiV7i2QG
         2XZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDfA+t0/YFSXc9cCE1WN5078/JVvXA/7kE0kcTaY/Y6pCv7A29QzAxmxKOHUZ15QHM/PaDypRyTO+QmGSM/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNqTRMv5hGIlIdqxEqaQLPiENRu9rOIAEj9ppji6e0HBpVlbgW
	m6FdFX/riFHpraEiKGDTE5IeCgLHsiTScxN6Scgavu2PVWeQpl8L7PoI
X-Gm-Gg: AfdE7ckH1LJfLcsCXudr0XWzYmXD3Ul7nI3JhKcge4tlFLcrm4oLb63Brvg9o7Kzc8s
	mSWep7yGcTJ7VuRALUhrL5jciXVLMtD0ns14OcnOIDtEisRCl0jJnFG5Bhn2Yb6RcKIsJbiLdxO
	DJxnJ2PD1y0hydCEz/pRkPRj3PC0pVdmJC7BqxNnHY4wnN8/eqFM0KTQl0U3ZAzwdr4HWa1AIuQ
	6dr3L9f9RP4k0e6K94ig90Lk7M9l/slci6JMG6iNl/L+U7aS3OLsjtBqVy66pMSW6hTUpxhUr/a
	Kd/vPdFo0RJyMNpfwhGr27/LeucmoW3zAf5o6X2gG7OxUWCmBCla5NgH0vX0LOoq1wq4Nx0xb0a
	5cfB0+LhrcCzug6GY+wd8ZyBdixQwJZeQKNWYKIj74vTvoq2SAds2QNXhGYDp7GQ7E4UfRQnQuo
	GXbL+o7nZvwqfX0zqGdLKj8a4WbGA9uoWQX1OgxC/8M1hhTT4=
X-Received: by 2002:a05:6a00:802:b0:848:5d9b:6885 with SMTP id d2e1a72fcca58-8485d9b6c13mr5846039b3a.77.1783659999232;
        Thu, 09 Jul 2026 22:06:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:38 -0700 (PDT)
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
Subject: [PATCH v3 11/27] ASoC: codecs: madera: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:55 +0700
Message-ID: <20260710050511.14439-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220640_251187_3A5DF403 
X-CRM114-Status: GOOD (  18.62  )
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Add Reviewed-by tags from Charles
 - Remove the temporary `ret` variable and return directly in 
   madera_adsp_rate_put().

 sound/soc/codecs/madera.c | 39 +++++++++++++--------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..55ea6950ca90 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -513,7 +514,7 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 	 * We can't rely on the DAPM mutex for locking because we need a lock
 	 * that can safely be called in hw_params
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -532,8 +533,6 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 
 	madera_debug_dump_domain_groups(priv);
 
-	mutex_unlock(&priv->rate_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(madera_domain_clk_ev);
@@ -875,9 +874,8 @@ static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 	const int adsp_num = e->shift_l;
 	int item;
 
-	mutex_lock(&priv->rate_lock);
-	cached_rate = priv->adsp_rate_cache[adsp_num];
-	mutex_unlock(&priv->rate_lock);
+	scoped_guard(mutex, &priv->rate_lock)
+		cached_rate = priv->adsp_rate_cache[adsp_num];
 
 	item = snd_soc_enum_val_to_item(e, cached_rate);
 	ucontrol->value.enumerated.item[0] = item;
@@ -893,7 +891,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	const int adsp_num = e->shift_l;
 	const unsigned int item = ucontrol->value.enumerated.item[0];
-	int ret = 0;
 
 	if (item >= e->items)
 		return -EINVAL;
@@ -903,22 +900,20 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
 			 "Cannot change '%s' while in use by active audio paths\n",
 			 kcontrol->id.name);
-		ret = -EBUSY;
+		return -EBUSY;
 	} else if (priv->adsp_rate_cache[adsp_num] != e->values[item]) {
 		/* Volatile register so defer until the codec is powered up */
 		priv->adsp_rate_cache[adsp_num] = e->values[item];
-		ret = 1;
+		return 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct soc_enum madera_adsp_rate_enum[] = {
@@ -1061,15 +1056,13 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 	 * Prevent the domain powering up while we're checking whether it's
 	 * safe to change rate domain
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	val = snd_soc_component_read(component, e->reg);
 	val >>= e->shift_l;
 	val &= e->mask;
-	if (snd_soc_enum_item_to_val(e, item) == val) {
-		ret = 0;
-		goto out;
-	}
+	if (snd_soc_enum_item_to_val(e, item) == val)
+		return 0;
 
 	if (!madera_can_change_grp_rate(priv, e->reg)) {
 		dev_warn(priv->madera->dev,
@@ -1082,8 +1075,6 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 		ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 		madera_spin_sysclk(priv);
 	}
-out:
-	mutex_unlock(&priv->rate_lock);
 
 	return ret;
 }
@@ -3041,12 +3032,11 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 	if ((cur & MADERA_AIF1_RATE_MASK) == (tar & MADERA_AIF1_RATE_MASK))
 		return 0;
 
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, base + MADERA_AIF_RATE_CTRL)) {
 		madera_aif_warn(dai, "Cannot change rate while active\n");
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 
 	/* Guard the rate change with SYSCLK cycles */
@@ -3055,9 +3045,6 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 				      MADERA_AIF1_RATE_MASK, tar);
 	madera_spin_sysclk(priv);
 
-out:
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
-- 
2.43.0


