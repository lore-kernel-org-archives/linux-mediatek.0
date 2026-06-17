Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450F9CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=; b=NuRWrcc1LpuYO2r8kYqkpzX+cg
	ZNc37NcMPm2amqwKsgnlQnhTZi1Q5J4yjpjcsc23pl+F+cfNZabx2hXnV0xH4e5r/v7YZDwqWE5IQ
	kGCbZXuKJ+kufYsrUZy1CcQC5wNGtL4d4sqN1T9qdRMjl2vGHCYmr8M6j50ZPHNoi8KHsLtYda5G5
	t/LcvbV56kBJL1zaQH7aX4CBmQWz1jIZq2KKyszyeysNCBmukGhjNjEgqbjGwkn1ZzThpaBXj9Rnn
	ntJu6kCM5YDl5yBIzrG8urtkZpOGhoGVkOMWfoVTLfhBONTuEUWbbanKQdTdMhwCqrXoP0X6A1Wlx
	6UpZwcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZneh-0000000H7Pq-2EsD;
	Wed, 17 Jun 2026 10:37:59 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZned-0000000H7Ln-1hnR
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:37:57 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1384eb94d20so733991c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692675; x=1782297475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=rfNlha7t6TfDeydDzJQufKwGUspHtGxPt23GKbyp0oXQ1jvamg5Tw9wamC04PZYCrw
         JjEGcvbRwcfbjBucvEZbzhg9lZhcfAVhaB99FfooWcQzh5Rf9Z9vRVlHUtJ1gIJxl004
         OqOJZbk5M3vwI+ufP2ACRxV+/RoJKRVPH81UG25bM8Mm9pLhP+KhWYM5cVLSrPds/e7U
         UtnWgj1st1NDfPyUm8BE058uXpzr6eWHQnap5Zj8o9AEFIBHgqFv6z8XVOui3GJlL4UT
         ZKFuQpwH11lA1ODtgqgTOP8rEzb9YC7yzPj6D9sePHofVu1Vk5e3JLMfP/Sh02E4xAD7
         suAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692675; x=1782297475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=oRLP9Fvhbg73MI5IfVqAhZtfXRNeHAsCilQgdP9VXojl7cC7bUCzIlGtdaJfNx275i
         FVvpynCfad0o2FKwYmZd/7aS5CCf71RL2//kT1Jq0s50k9C12l77suF71j2nzRziXI2Y
         b2HDWc9r2O9Ad066asRQIM3LMOqWCJ3L5Ljhkg4Uaa4rcEaDnmI2U2v+YzNUJVhh6Ml6
         647YbkAmm925BN4iF8aK4hTaFgzN6F2OFXoXxrqhvEIaqpXmN3ZQoZRDTEWgroQKdYUM
         glLDiUcUm4LxS60zo3+V9iVnmPL5Aflc1UjvtX6dSSYItV3kbFzVHLh+nRxU06GQ4nqj
         thPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aXxNJ1c2ulp4BFEqPNMoz/pyAqAL/ktOP/ZdeP9KGuYJiyzQS5H5S4fqm+gSXRhfN5lFERQqcLWnBrpe9fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRXS5u8XKpxPYGP0nMRVjX5hBhZE1VASvrmkeSlXUMSARc4SpH
	bVIHlQKYgHo27RkF1HN1JRjxv8uxBcCh5rZOtO9RAbbFzyi9hVxWrpLu
X-Gm-Gg: AfdE7ckl57WWINe21uX4bRpRDajSkeY3g1hSKIQB+N2lWf5cIMIPCva3sV03lvCQ4Ut
	MZl4g7O3etkSrMCv2/G3RZGB3ERzZDsfVvke2RmYRNx+hny+yWrDSrSbjemrHlX8W2EMzsKDkj8
	WC7i7DkPqAOZvLN1DL60gr6YNDoSzoYS+uZCB0pECzKlT2UkNdy0EhF1vhz+Q0W7uKZr+4qpZNG
	368UQ3HAjakkZbZi0P+tPuPCvye5CJfzUcgtW3dO1P6qSU2zlWBY8RAWIVVvIOTJcv2CM0sPWuQ
	hlS3WUt+VwXZPSv+1e84wui/OVJmiKkCFdmGwhgdn9SRzM/Y9s5AfEs4UdzmSVjZ3UrbBsAEh6E
	2/Dn2pIW9VeXW65C5fRUGwz0tSBpy5FxoEFfym8dhYtFhzUsbaTP8q6Bl1t8ymhD4UxWoPYfMjN
	rZ6PhZEaop5NnK1bApYcUA6TQ3fSZR+GUy+46otyh5w11ERps=
X-Received: by 2002:a05:693c:2288:b0:304:de2b:446f with SMTP id 5a478bee46e88-30bca0aadf5mr1738283eec.28.1781692674617;
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
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
Subject: [PATCH 32/78] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:49 +0700
Message-ID: <20260617103235.449609-33-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033755_453283_BA042A90 
X-CRM114-Status: GOOD (  10.17  )
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
 sound/soc/codecs/hdmi-codec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..608a0bf28887 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -452,31 +452,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +483,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +500,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
-	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
+	scoped_guard(mutex, &hcp->lock)
+		hcp->busy = false;
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0


