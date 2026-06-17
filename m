Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2879CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=; b=JfBlgU0pPIrqBlHiigLvUzu4AG
	PkDb0Hc2pa/mE2Eu6ctK7aScKmDLE5Frc9hU2ByBECnUm6A77Crr2D+bTRLwUyzt/D4PD1br/RMwU
	byqYdeNRXjDXOMA6E5etGNzOMlcWPYpoXIS4EFOVNIqyqjuAJxCl+BUMQFj78uVWWXRtL1bRTv+HS
	gX64Y0Nv5/ceQgYFHBvtL876z1be2qIzBhXBeASg/xhPpHchiU1PQLqLXtJ584dRBB0mS2EXBKHEd
	f2Mw23xtUV9SS0XgqveNWoFZN2xUyt6lwv1Kblz4mP564pKPmkjXYDGldCzYroC+kjkok6D+jznbz
	+Mb8jPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnd3-0000000H5yv-0BLD;
	Wed, 17 Jun 2026 10:36:17 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnd1-0000000H5xB-0JcY
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:16 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-304d8362a58so601781eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692574; x=1782297374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=KW+jrDOC3ojuQ8/ufFzCVy04DS2hvJo78jYVA281usb41KRFN7aukaKzWwM0r0GNQF
         tAiw//TxwKsdulqMnK9szJZTC3QWFFs8FvtyEwZXfPh+NUSzailhpYUIWXYVCnhdWG8r
         f5kJR2Vlt5nhegdUAjtM9D2Kb6CWAYSl7chFOXm2KrAVATTJh3F5MJ8wreLytZSzrZBL
         blseVP2uJJpELzkT4Jbgo+k6uYLlBOQixaKG6MONUMO88P6RqeSG3D0JH5TRvGSG4Jbu
         tDXXkQdiqDPKPD+Nkxdjh3icfCaZQPU+jy9tMazJFdX7/85PGgzbDz81nZhH0i8fMYDN
         klqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692574; x=1782297374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=ICHhwM/wPrenANWL/wPBv0e+cp3nZ4a7F0cDxgCB1DwDMog6p6rUkkgSJERCvF52qJ
         WZpXQOd3kW00iZM1QbTm6yui0oTBKxp5VnJzCCUFiiTaYteMEXoe9zNsy1TdyrM4DLjA
         b7tZGYCg+NlgvxjI0wFL+jihghvw+KScz3V1zH1Dcj/t6wYadIdp4xkRfwhXZR5MFN1+
         YN4ViQOKRm6wN0Zc2Avq6sQI8dmO3EPBfyN6X7nvtvtLn8C5eywaIHV0TVuYzorr87bU
         7o0Ttu6dwzIWeI5tdIqsXte5Rejt2DknxBMUU98gQ8mgYLrWb5L+CkmGgwUeWmWvqZxz
         SfxA==
X-Forwarded-Encrypted: i=1; AFNElJ/cDCYJRn6g76tgcDh8eqYwyGTXVRn+IBiLZKMgyrw6ikdqeoqVV9X75GhmlpkYgtJm49e/whj/bZDRijO2vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGK2VYIzsDb/yvlQo6ZPRvCCeIjaFEJLFvCVGteCuwCRWfisN6
	8XV0nQwlxMPeBSabfVHKrL3yBH23MO+wDEqlTnXrRjl7FdZ46RnId2t2
X-Gm-Gg: AfdE7ck8lzwzzxdxmai3H+VhU2FDw/C5KDym1zh5iWNk3AIHvlWnaRa0gUdK0LlY/2n
	mYw1WjD791OnGKuCB1Z6UfW1RRwKOp9CuWV/VPQn0rzDgGVt61iYiHAprSX3wbUwiMc+J281kMZ
	qNGqHILNxQ/cd0cVZ8Pu1LyIGgQzGqq8k6BGY7IJ40lOWyJwEvf4/BIgtXJQlnljWfeeqfZsRfd
	nxzbC5yW4Mce7bJAa1fJvAVh/JBFxXJW3AH/KmPwGNCCqvdbuYNUhGdf2RMfhi3l4ct9tFjSMIF
	kvqP6L6ZbGpP21djm3y5t67ZTUapEo9Y0NXPpMQWnoPmMdeue7TcOlMTvImfJFYyosTyWVlwMFT
	OaTBqwmYjZ27yCkY5G4K/NhlvSluhAi3J0n9cjuURQ0qE6UQdMm1pJvzvCOq4hg73wEdT52cif9
	sp9Qnsgdg6h3O4A+Qs6IC+OkJc3QSGWJ1BHHSg5oyb4sWuZ54=
X-Received: by 2002:a05:7301:7308:b0:30b:e524:77aa with SMTP id 5a478bee46e88-30be5247ae7mr89541eec.14.1781692574470;
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
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
Subject: [PATCH 21/78] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:38 +0700
Message-ID: <20260617103235.449609-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033615_115617_0C7986D3 
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
 sound/soc/codecs/cs47l90.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..978149245079 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2423,9 +2423,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2455,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0


