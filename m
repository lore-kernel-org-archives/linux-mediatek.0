Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72985CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=; b=DoDXRjmAEyoYh68EPag+uTNiU2
	LWRwyRXc1UUGGc0ufpNEkTHI6Uj8mgeBiOAEibu9aSKBs/O9C0pR4mOD/A7CqH8qkZGE+vWSPrIOZ
	GxnAUbLe4YdE0WiLZTBPWC8N/Yz8hnuEF3rsdhO/Qn3B3Qf1EpmrsE/USVsDGBHCFUV5VxtH5ne8H
	TLlA2aVt1yUCMOgmP2sIo+5qoxx0lqfKQH6SvxdQLq4tATQ6gtPZBei32o9pNyehkV/mq6srNpR5T
	gwWKPGv7OiurnogKpNX8GYIpo+gSUzntjdBayr5Bw+uNMYOEED+nGw6REvSA+CpeOEu0WAC4/vvDW
	N/lIfoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncm-0000000H5k7-2MqV;
	Wed, 17 Jun 2026 10:36:00 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncj-0000000H5hk-0YZJ
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:58 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-304f590dd91so6359485eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692556; x=1782297356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=;
        b=czA4nkWeQKc6eAK3ESI/AEpXXOAOs6RAzVpGq7j1nyebsVz05xGl9VnlJlVIuc1To9
         PuNRT3EMGlTDGa8p5VLtFqof1/VC/D+KnNaxAXvmGyqy8NEIrGp1qfuR8PulX84Wzle1
         6ZDZ9o5F/Wu6nNepb0AV8cyzLBlpu+9eAPymYxhtsANivgUTEwP0dB9uFM1ZyKBUMspE
         noZcC3kSbjQrwOqEyFwujL8khjIHVnJhKGBKCAQ+fhyTk9jhQvUPGrD9sWG52kY9H+GP
         msss2M09XaczAX6H15aHwyjQcbgjioz1m0bbu+6FdJjOqqnjlwA10QmtOxbkserATzcX
         fVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692556; x=1782297356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=;
        b=Zuq9xMhGwuvnnGVd+DRmnNDL2+D1ISxhYWVYyZuY7V7RdhoMjITqX52dFo8JSvKV2J
         TQJcvvIg7tgcMA4VxYYWz1FNsnSN1rFf1X7+35Fz4Lp4+NA+cFfkZwKr5qPbd1s4rv4M
         dZUytGkaxR2L9HHVXXul1i5rzvDUbdH7iWTJ0jQYmPuF5EUCD6IQ6dzz+BsAAT7CXrZk
         BiDgONlcsvdeJiVkAGbqnsO4F/USxvBUKNCjfXbxqHCT4RDedJ62GgVFqJinOOegVYLR
         IxqmWUwJ//2YSHVllGxlqQB90KGPQ48MbO5RhOMLHJa8p/4BQDxPVZy91E+WV63d9gpS
         7eZw==
X-Forwarded-Encrypted: i=1; AFNElJ9fU5xus8dgatCqS+DwaEa5SuL08rmeLdf3/iOp7DrluQuBQFT/wjAgW7FJhaV4nkWY7rE8ki5ltnhkFKQytg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRRR1VFoiMdQAbZh9oTNfVU7zpBkIEQ18WQJNRUUnqx35hQZ7p
	vXCj5fOAbAKHObieEDltPOQk+l+Dpf3zxkYtjl1NtPYVlUAohzBHzNne
X-Gm-Gg: AfdE7cldEs7cW1gLS4yyh626onBA11coK8U3OSSY5GxtZ1Xli5d9Qm+FDTNhdP1eUgb
	APeWe34d9ZDFSQ9toWCzJhUSNhs6eqdTxz0/CUDwiV0+QYGV2SfK2Wk4lc2uae9hCrx2I1KycTj
	KH8ALIKg7e4crx1PCGJpSFHWP71wQn6hxNkNSd4DiqAHUQaNdpGW3ZxkZ/IhWkdvH8nGwZxNA7w
	rh1azEaAcOHxVsC6SZ2PrYhBCF1Cvxgt/Gg6Q5RlOwHtnzeaEHj2GoHtiw5p3Pag0fn7IyVk60I
	SIq70QemWZabZ8wzhCYUZfqUdBFIL9mxOFqLAkufJosOPJ2sHQIdfBf17WO2BaL8nd9nITMNsnv
	36eCz1rK3ERHTM/K857LwTT9dp+7+YR2PsjcixWX8XFCRGet7Pgkep3WbKl7cJfonTdDLbUjBd5
	SjD7j8WiHOeV/v1XeKZXHNIQBTVVBcCwDV5rbvSLp5qZvoqew=
X-Received: by 2002:a05:7300:80c2:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-30bc9ab54ecmr1861524eec.11.1781692556439;
        Wed, 17 Jun 2026 03:35:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:56 -0700 (PDT)
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
Subject: [PATCH 19/78] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:36 +0700
Message-ID: <20260617103235.449609-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033557_184212_4755B726 
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
 sound/soc/codecs/cs47l35.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..c22de7356ce7 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1566,9 +1566,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1599,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0


