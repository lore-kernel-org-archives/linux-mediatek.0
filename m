Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B633CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=; b=QyKBgzQoJmYgcvM4TSTUruhP6i
	I5Zl3chdw+bN08KjMsaXh2+9b1qClmRE3XwRknByxIRykzDDyEkQJSaLCFeJfoQNwFY0KLmlOPZwG
	NMwjt2vZTP4e+y6eFFsqJlcM1cgmtqDFkKqCKZZwLz2eEGFLwIopvlMtfV2WoMLe+kk2paxR5YzyD
	aZ0RHHdwJZokJ/C/bDk8qMvITBpwuiFrkf5TQc7snTs3+Yx6wGLusi5CeO7CjLVy7H0bUUAMjAUkj
	wp++YhK8nyfwjwPgEhqGPzdJmRpZaOwJDsL4t9nGEKV5hmtgKdi+J1z/Ovvd91kCP45DTsUuFGwUk
	xREQvhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndG-0000000H6B1-1OfP;
	Wed, 17 Jun 2026 10:36:30 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndA-0000000H65b-0XsN
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:28 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-13986d61b4eso4247227c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692583; x=1782297383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=ssOFwRJ/bTNViA5lbsVCsRgknaKn1sqc+YvpcNgnta8PrH80QEstXMTa21A/GIY/8h
         CxJvLRU7FBOp3DaVLufPtqCLjYZTiNuIYP3PAo8pllK3/HQW1df1v2sn3uaF/wqAsnRp
         +w8X/vVQj1FNbtfOQf02yaDj57NalUHUu3Eo9fwq4YawyiWIWPX8KaEIKU5jIl8Jl0ej
         BLQekR7X6g2TzXYz29oU5wQyUP2oxuu2DClvOc2i4jYekiexTkt9sBlWdU6DavVa+mQ7
         f3feaCDk3k6YCjyM+MvfLdm5LgQX6N7fxy5yY2r7G8oIaB9cevAr0gcjNHYI4HsQrde6
         XMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692583; x=1782297383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=Qv/nCZaU5BwlWtt8kpMSbpV26L/BipGaXgIwYZH2fpy5oIBWUoa1Do41NrwvmNY3om
         UPlkJ4mFDOkDSfP82TKN5H98QWsYWzUql+ZCiKz+gaLazTau0SHokHMN8WJtYsXT67Aa
         Z+czMyPbBHd6dzXzAVE8m/kBUJXlc1/j1bzWolVD2DJCmH+ODwfbw/oB7FmMiNchA14g
         8EUnFTwWB8DLJkUTEqWMHwk0h+1eTe84ybcHdKle5cvrA3P7BYlEiXo/vkT9rnTjRhud
         3tSStkN+b8ZiFM2ou86tdw30Y/gqrCHPJjXbAVsF/ZoZSchT9lK4vCm1fg2ueHzVXVHq
         hSXw==
X-Forwarded-Encrypted: i=1; AFNElJ9Y19JC34IotUh+TA6JClVr5XH/2+WM6euyw2ZuG4I5Z0861EbQASmRS8Gn5vkCTxOy9AAVeiSz1KAAbKu6hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvs+Iawbdi0Qvh8iv57QTCbpDbiw8vA+IRKmMSypx9Q4ykA8HJ
	RRKUoyS/1/qLsOqfm1cPEQ4vhs6DHTyldBB+jFsJnvnJYbsKmu/hQxxz
X-Gm-Gg: AfdE7cn/+iP/UMGbuKpQhKYITKeXFH1AcuwIxrHjiFf7V9TRRDGTh6x/PNNzjV6KWbJ
	AdOc1yDme7AnyUZWU3b/nQc7lO2rJnM6lNKh7tcs7j1jDZUYR+Tf5wGSykjPrZQXsZd6b6Qa6RU
	JyZyfyGNqK5StbGtr9AK33JdTOzpAsgfFephzcSHcON8E8ZiEpMK/GqgnU8K729KTbrkH7XDWyR
	FdI2tRDvruo2kaLrX3nZYRQTFKOwUBJhq+6tKi4Prtw0R3M8RT4uvJYumIzlNvtY/xzeRFNrmXT
	g1tI2IHuga5Q3L5EDNCx5fSuXDaeJH9umhmrLiu0pdA5irvhF95we65Rw8KzINDY23HWtl/SxgP
	58y0xcLrpQuD9OpgpLYnzY9vlgDELKXSgWiqGl3zyQcKT9lJ1CGn5xZ6B8YP3OWeYpd+rVIPrvJ
	jYhaiwC3PbpNlJlehORvKqyGUzBsj++CpchBAJq0etP6RC1ZY=
X-Received: by 2002:a05:7300:430e:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30bca0b8c3bmr1984423eec.20.1781692583469;
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
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
Subject: [PATCH 22/78] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:39 +0700
Message-ID: <20260617103235.449609-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033624_172306_033420E5 
X-CRM114-Status: GOOD (  10.23  )
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
 sound/soc/codecs/cs47l92.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..4abc896caab3 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1892,9 +1892,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1921,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0


