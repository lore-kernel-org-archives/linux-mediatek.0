Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C1ECD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkZBCMurUYtbXlyM1bHHJ4jat4Djw6dn8DDEDOcRodM=; b=WUmfG2CCMSYrqHYT1PcfJ56pyZ
	/4OvdzDyFlfUlcudR66UoPxbRX9yvHqlDhoLlp2cNRVaSV2s67szZYOznfhozjPQfjaSQ7vLOOBNS
	yxeUm54/Lf1SFqMSYQo6QENZuii8dZmfftFDFbYBkR3cEG28kjEFFCNYVT4EKZ/WD0FnsnFKO1uUY
	6fFn6h2z0L2yvFxoMXcH7nuPgP01B1Dgnt/SBhmaY6K2M6KFOeyb+RBJTSHzuqf2YYfAhIYmCXYUS
	uGdPwJKx2OLljAvO0BS0EBhA8Mc3bdCgDvj2oOF6QETdKqaW5SotWOaTkbyxA6VKgXDi9MOv6YPLr
	lE2NswdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfA-0000000H7pu-3HBD;
	Wed, 17 Jun 2026 10:38:28 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnf7-0000000H7mZ-3Lih
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:38:27 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30b6dad2382so6294666eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692705; x=1782297505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkZBCMurUYtbXlyM1bHHJ4jat4Djw6dn8DDEDOcRodM=;
        b=KZFJQZWYfsFjVuMcKQeh1asnRAL1zSvuI6lOMO176qbEQ3gpM6J7bZo6cSAPeoHzk+
         rx0j15OlmdYR6/jJuMRDOGxOCa4pZF7xSc4ntwh3P/t/K2i6satgsdSrRyvkaT8mGaf9
         3Wx+Tk9/f9UWPytTCUkbcNSbnHFtU4nOWNgpEFsUTZMZTjj/jVontyk/XrUrAx2wu1IP
         e38sQINp1/zUqQUKjvBEjmPvqGSnc0Zf+QvKYOFOekPA9NO3TJYbSZYPwql3WdtGINN9
         7pPO30ae5396XdSdENI2Kyrc80m5iIdHkz0tIAaxRL0kEnkMbXQs+E8ZGE9vAzsDy9Mt
         fk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692705; x=1782297505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MkZBCMurUYtbXlyM1bHHJ4jat4Djw6dn8DDEDOcRodM=;
        b=oa9I1CUpSvkKbjwqkbme3IOODXis85kxkte6mk+i2hLhpr8pAaF09SlKrAAJX8m+kx
         E8ABimt8oWt6yObff4tEmMlnvtwGdk4heooYqMD6HH/KFkx7YzqaaAEWEKUQ795yDLT/
         fyu5Bnv5fL5RqFnRzJQH+tnQh49u1XtJchen2VipBsWXBN3+AhWGvVclyTbhsxSdzg2K
         M7Jrf5jO/1X7/GGiDt9b1qXrlQjfnUXXIioYI3N3DGCrTelFt9koqiph6U/fyOUYiiQM
         yw63Dhv8wADOE3M5b06VMvHeXs9rN0nh1JaKX1wzLQNNjTzS8ivhAzGlbGZdhzMwtM4C
         OqPA==
X-Forwarded-Encrypted: i=1; AFNElJ89Fl4mQ5iCDmd06uJAs8uglKbVks0B0GlEqjtA2ypIul0zawIvLD6PQlYsMwUQFxC1iJV/Vusq8LVGj49Qfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz22Qi0tdtOtqfpy4gaW1hWTd5nzhMTExmlWLYmQ3tBaldR9/5o
	JIJTgu4fp/u2ViCcamJrKdSwjrFsUelq08JsLn7WwNEkm7+BeuY3cRi9
X-Gm-Gg: AfdE7cm0Di1SPmxUbGBALDeHbwJ26gCVVlgGezAhG/EhTSK5guYiTtDCI7vNFrDirh3
	qBpMZD+KpsabxI7c6Z11Zt2vw04odW4mNA0UB5zagmUZGETtBu+p0r+M5T9M3ve99HCNLCeAf7k
	/BuLsnqyhfWTZ7NvHgNOV7B1q6fSfFILPVeUX76J0ZdMPJ2im4PGpr84n/ip/QquoXPw7U0cK70
	ieZnH4GHZIKHw8lyWk9/LWKKvb/ehFQJLeoFb323gyctI0rUxag4QTHHbEv85pC6TySStKwIFZN
	EztFvzXzEXUQprooK5zVAG2cQDBZfsmDFyz6rL0+/f+7a12Dij2yit4wv1fSmJwr2euop7GceBc
	vV63TR6RXd6NrqbFyW/RC1La+TEEQcRQl6RMq5LDsYFwiJNAWmw8Jz0CqCw5HzJucFY/wQFKPc2
	1nBi5F/SUkKuHJt8g0MJ7BxG/kamkdzoSXMjYzQy0uqx/7BRU=
X-Received: by 2002:a05:7300:2153:b0:30b:8860:94c1 with SMTP id 5a478bee46e88-30bcae21d20mr1491165eec.23.1781692705015;
        Wed, 17 Jun 2026 03:38:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 35/78] ASoC: codecs: madera: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:52 +0700
Message-ID: <20260617103235.449609-36-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033825_847586_DADB7843 
X-CRM114-Status: GOOD (  13.54  )
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
 sound/soc/codecs/madera.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..03bb1ed70b29 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -513,7 +513,7 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 	 * We can't rely on the DAPM mutex for locking because we need a lock
 	 * that can safely be called in hw_params
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -532,8 +532,6 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 
 	madera_debug_dump_domain_groups(priv);
 
-	mutex_unlock(&priv->rate_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(madera_domain_clk_ev);
@@ -875,9 +873,8 @@ static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 	const int adsp_num = e->shift_l;
 	int item;
 
-	mutex_lock(&priv->rate_lock);
-	cached_rate = priv->adsp_rate_cache[adsp_num];
-	mutex_unlock(&priv->rate_lock);
+	scoped_guard(mutex, &priv->rate_lock)
+		cached_rate = priv->adsp_rate_cache[adsp_num];
 
 	item = snd_soc_enum_val_to_item(e, cached_rate);
 	ucontrol->value.enumerated.item[0] = item;
@@ -903,7 +900,7 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
@@ -916,8 +913,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 		ret = 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
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


