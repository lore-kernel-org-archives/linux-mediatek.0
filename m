Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19BBCD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=; b=gU43hR6vHVyPYBruK2uha5g8wB
	JZnccQy+BVSzcTOEUmcX1w1Eqx+sfr2Lv9vW2rZ37nLSIBmjuseoIJRK/4K+zKqPBN2/4M72saREo
	rpRPC3Vt3XDZ0k/8/Msl13eqWF82umqMAunxWz5hfvFXHQC6WQqDb/V7BKNU1DEgaCx9VeKSZpYwU
	kANoc5ukAVmNzjC+LU5fSgtfklJCAX3E6UPOkvr+Ta/YNCM1OG4MSKmN4zJ+3bGQGpQ2dLzZWpjZT
	6CsKLNLOlRgPOnhcuuSJRwPtRNbojAAIqHbfTlo0A5cIljR1Env8icvwzAtylYkk+9w8+zly9q9CF
	c3jFiSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnct-0000000H5qm-3iNW;
	Wed, 17 Jun 2026 10:36:07 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncs-0000000H5pD-0oUE
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:07 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30bcdf8232fso1790975eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692565; x=1782297365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=N91K16UJUxD2fhp1GCuU15b7IjqHafSjXgQRQkFqjpOK55aofk6Xfw8wrFfTjPeBs7
         2IgN75maYXBPlPjZfVIKmxu2Dg/Esg7TxqI9b8voe2tUzjhR5fBcOrGJm8O5bfe3u4Dd
         OCeDyh4eVoVOlsyr/YxInf4MnM/EXLVQa2F3yZvfZ80ntfFzlSb3NvuyK08255nstqbR
         nl0B5zAiIpuXjzB1p73lCp8klYNAeBPsB/tzaJBZBmRke2QFU3aiINQcFNnHYjIVG6qs
         bDtxWp8SsuANrbwWS4gG6wOMJtljfZeDUAvuc8ESZILNeJAzvHATjpT0rohRLHrdGq0c
         4qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692565; x=1782297365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=JXju7MLoI2DUuZ3pPtUbiiTftRraZyUXxw21m0bIzHoaVKgShUEM+9QYjOBLR4qrMF
         4wJ/pn3IXGYq5jcsxKPUr0GewR7DVo1fQh52oMX+4NoQuDZt+jFFp1aHijuNFDX7ke+n
         wZuLy4TX2aKrlHmYfrnc73bQwj8GwCVok8DdoDPM21sBRCL7BaQ4H+dQhUEbGZDJcmv7
         8wfWCEu4D96pUgOCqFV8dsFLkIdUxyL0GfwQ6TFrYmUfC7S0b5KkJo71IAp6yrEOpX1z
         d6dvdvedFMYZwm7IxFwjUuMLWxrUQ8+BaeStqVZ4oMIT+7y9Ac/lJ4ao0AJcVXq1TjX8
         04aA==
X-Forwarded-Encrypted: i=1; AFNElJ9+Vp1WNIO0jV0QOj/Hk5+sp5fMJZbAgqfkxEMsifeO5LHFwfwmCREMBXWp1/uDcX++8J6vxXkH3GmWwzCpRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwenZC5bOoU7ZB8TdAXnwu0OHxbaaAyxpDy1xY/nkeyIwUjM82U
	KQ7xEmzFP2MEOokOVUknAAKYfWc2afJ1x08D5d/5lNILpvrhUs/Q6Tsx
X-Gm-Gg: AfdE7cknwxYuZoiRVk9eyaChRY7qM4bhe7CZFBJiUKaJiRfqy9t3g0j1MSZ4M24WZ8J
	KR7KLhTu3tjHQvtNcyWfO4ELLSiE52cf0XOdPyIFALuIgMa798RheLusX0aOIx6NBAqggu9djvB
	rWw6vo7kbpSMNfdojlSEphTFXa1wq0FGwqfET3du4prCm3nsqY/JQUy7ORiujqSf9o+YnZCGuXi
	1kHO/KMQQsz4Bfs2Tc/BjjKG2iAb5TohidxCg5qFhuzqfrV03sL8cE1Jj/EQdZDJgV6EB5ndab8
	dACbHEBenFaGHpb7Gup1PxUl2iYDmQezgCi2hMpuI1J4E+BR7xsyaBeIajD1hyyV3yhkPdfiQMY
	B+3zdgvxMvT1Wvqc17Y4xKNf/y44QWrJzzFhhjm7qU+O8QwWfIjDOl/pSi3UX1aceiq6rmIhSHY
	wZujfQorxVHM05fkN/IUhbLlivuBZ3/pI/ny/2CdmnMGftJaQphy/H/rTcMA==
X-Received: by 2002:a05:7300:2211:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30bc9ab88femr1691948eec.11.1781692565454;
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
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
Subject: [PATCH 20/78] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:37 +0700
Message-ID: <20260617103235.449609-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033606_237151_7B6124D0 
X-CRM114-Status: GOOD (  10.74  )
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
 sound/soc/codecs/cs47l85.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9c0eaf24bd54 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2504,9 +2504,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2536,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0


