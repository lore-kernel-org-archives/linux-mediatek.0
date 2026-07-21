Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14CEC4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=; b=wB1xtoz6OrgiwOi6sOQ9m9uT4Z
	J0Lc8zAa2EZuY7oyyhAcQgvmoBN5a+/HnzkVxmH5rqHGRN4p5OgVR/FXbHgZsaY6+vHznaIID1LHw
	khk69Z91DdNokgeC52G7sthIXXhza25iP3xvC0v6BT5fuFgEaax5ttHMNI5F7o+xsKumoFlUWKAIl
	E0pJt0iciKBxsFZYqUwMai9vdMME68FM/mJJamORK+3tY+OC7v48frnbJ1taKlstAy3cWZCLvXz33
	tswFzwZF0nR/Txwsfx/MqUfeIIMDMzLpqDxQ9okJNTubknb5M6/NFEp3YARywVu0arNwFswc57zDZ
	/z16kiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hd-000000099A1-18GA;
	Tue, 21 Jul 2026 10:27:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hb-0000000996r-0gBq
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=; b=SyUofT2itRq7K6jDthIPBzaTtj
	jEJOWGcIn+i59molYwsYewiUG7p/Qczyg3rP+OfOvHGi9OJafokn1/cVhS+7MyXSi5kJ9PMdHSXdF
	4S7rsLyonIyORHFhxDKckDpVRkfaEpqdnOCfOIsBUjNUNe1IKpKYVmTW79qtcCoFpHIyAkPB0jikj
	L4SvLRpc3CTbTnj0QuHB1zGOSoRzBgM4yvvxmgycaxIqchUIsJI6FSrC4TfUPvswoH5czI7MCGEpd
	x7Zc2ptfJ6HDuR7rh/tpl6pB/YPKA7qZdmd3XmLV/kfP33h9dbFr4W19v32nRNQHqqkcLjuG41qhg
	6XGfA3lw==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7hW-0000000HRaO-0pAA
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:52 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cab973140bso136537505ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629668; x=1785234468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=UL/1RwSLLtegnX03037x8XAhg/dCD4gFvIS/R1FiGw60bFupvONDaJc6hd04IyCEwx
         8fDzXYrQkqN9TZAtLe307JIsAHIYgzrWdgwhGuHpjAQs8P/JYq8gh3Z3pBD11cY8BXWb
         yyClGGWpb2uGTqBdzu9z0rqoMGh+y2c+Cw3A7EJE5sAekJM2bTpy7T7Oe5vqLXcHjL4n
         nU93jas1EYKzgyVdR3GiO89RlmKWfGIPTPAEdv9DJBMdAQL87gQSfsNbWL0k4Xw1IW6D
         Cyl1JLKoNsVAHT6rrIkv2JR4fENJeYGuoXszvpIFzeOA4UHxuXljuS0mxQa9Pc5mQER6
         DIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629668; x=1785234468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=LtbWW9c5wRoGvP4SGnNIVrCzo61fco/53+/7OO2i6PGLJfq4hOqTgX1HYIf0As5DM6
         nZddAFLVXb5x7qjRFGFKUiejwN5Rj5BAl9U/AAMppQ9WF8ZQTVfZd78zIWCV0BHZK9XJ
         fCIQrATWnof2V3lv389lDhkTxMrTFUQEymUnT8pbt1VLQQptN01cmTtvrlwCmtuCjlNy
         PCDfAANRHbPvmjxNnGxbGOsG8caxvF10A/75mhiCL9CAKJTsm1GeGXpe2hThl+deOSC9
         IacW7WulFMc19VveAEAvL0FpcgRuKMRNYHx9R4+uSmC0isZLOGkSlyBEiKof7igO0QKF
         X3ww==
X-Forwarded-Encrypted: i=1; AHgh+Rqz9rdgueA+eVSgZ2a327N0ZEgmY2tmw6oxX8J8w8uVXDD3MtC9WtjpHjXO6om31t/vgxv0gCZRQ8y10kKjDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDF5YqLPfQTFRC2cPoB+1JKkPYDHiw7v8kSwEdI/WTdZsbAJ0/
	hC1Xb4FZ+cFlLfm8IbIhviOm1OVmkaaNczNNaEo9FmV4VXNzp3x+yzKi
X-Gm-Gg: AR+sD1154+GU0sSk6xm3GY4qJ/FJjzJLGExql+YnKSc6miRIujfpGRctt1Viibl0jsN
	IuVyWgkUmcII7xV/It77pcaM2ruaj8k8U8u3D18qib/9ZpBZHdu4XHZNx4ZOnu2SU096fj4gkry
	mfuuKmTBoeUEZ3DTlMxIAcCkghCGE/xpwSiQygdt5ROqRRGrrvu5CNtoBTiK5v4Stf185peZKMn
	RbDbcJ05vHFQDmMN+Srnww/zjK/NldvNW8d5xG0HfE0FQlSIs3sy9yFMZ+OPBO7Ux25IGBFaDLc
	Gg98NRU2wTFMo6x8xixMcU/fzT2EX2Y2XbxOvKjOrVs9Uv9wGDdhy+/RCV+meBNR+Uu3prY/P7w
	8NavYRyk80MaMMbxcOmDiL7bAZTci5tPobhVeh9MIQ+F9qKe6RmpWC5eoRgv8c7+tkpaK9h8oo2
	r6tFNNN1/96vOry83k8at8w40s0rnlw384DHqZ
X-Received: by 2002:a17:902:ea03:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2cf34832689mr196284065ad.5.1784629667940;
        Tue, 21 Jul 2026 03:27:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:47 -0700 (PDT)
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
Subject: [PATCH v4 11/29] ASoC: codecs: madera: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:42 +0700
Message-ID: <20260721102600.523199-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112750_434779_1AC33C0B 
X-CRM114-Status: GOOD (  18.78  )
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


