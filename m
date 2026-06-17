Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75312CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=; b=sgV+f9UkER/Ia/moWB/jbmiDxe
	dW3i6x2HDBgoridLdlomeg7P6JLPrELdyqmO9HNoI1hhzqVszCfrY1RKlrrfb1XCmjFeW27O2RsgI
	FwFU+0ZVvA5HlaTFAEpguOOmhtcWxAhhppWcPSlKaajVEn1VKyP3RxvDFbyjrTtKbyZeP54FuORmn
	Ne3909g+ffggY2Se1Lp9BXf8lyJdn0aZdKgzOoyPJNgn5dvug/KB6Z+RKxpxmA5vv+DPOqoWxHcmI
	VZ1dMk91Vi0DCIwx+NnTsExcJ+2witSAnSI5L1jUGK+ZuNuJCbJKfR1LTpl+VDRG7/j2iG2Sc8pm0
	uSJrQXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbY-0000000H4hn-2aTv;
	Wed, 17 Jun 2026 10:34:44 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbW-0000000H4fb-1ecz
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:34:43 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-307d0405e07so8456645eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692482; x=1782297282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=bs/f+x/OSQ3ovw5Y/XlzNfoU0NRm/nPbuINTKuLajlg/41flRNWubucyOM+Ibo7BV9
         YAAjIQiDVZJlcK99Ua5eayVfOjHyC5W/eQvdfyVGQRghViLMRoLmk7o+I+3lsP8fJm7j
         CCBv0iZddqcuH57mIw83tZWAvBKFKKUkP/fE/9rvRQklQ4PGWeNjhKIBq/mP2MYdWgit
         SUHXqeUZegN0oOkUko8h+UOQXzSsmSQQ6iri0SXtiIEGorch0/udxboqacnMNf/bWwJX
         jJYNHAoIgLRA3cQfXraXUIJl8kiTZLyiz9Mg4jXvIQNJUMwO97CZGTvgmb0vTrfbiLHq
         254g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692482; x=1782297282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=L357jnGn4WqxWo53DTw6/kihvzuolkg7egO2C8aITvjaQnxDQmpz2OzAMfn/h3ptMM
         YO0DnadzK2/p1ovT3M3zdJLA4TPZS44DAhD6/rMVT7ni1Bsou0vm7pLn1yZtR07fZ8v4
         IgbChvqrUl9iDPBWyix6eYn6MgyQ/2KER6BYzrZ2Iu0ILPRSBzeeIfkyk7SSAupT9QJx
         IGBvwq4QWsONI58+rrnlcYN4S7DtNnfsKFqwAA9FJUvdZhKdWD23UvlWh9sUkDtzWI/D
         rQCbGLXgTD4keWHjKirnWYVRw/1NkI47SOFIAdui+Kg8LNu8qxM7xmPnGl2IzhEH03xr
         PEiA==
X-Forwarded-Encrypted: i=1; AFNElJ8NbLitv6nkU/i0MoAeOxjnMUFcLF37tcSKtPTONQv7bxZubUG4wOUBinzgAVdOk/48ka95umD7im999BnvPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqlXMnqZKvmQFBym9kM5211Rb3FEfg+oF4SjyEebbPG59xCWv6
	4yCw/6C24H+80TfdumYAV3D+TPwtJAgmMR5CNbYChAOsO53Ih3AmFkPM
X-Gm-Gg: AfdE7cnj/OZfku3Z3lgKvN8InXgU8kZdkML5LPercaj6CVGlJVQLC23/M1W5p/akCC0
	p2+mpOiUVcQjPCaIBkC8XOKNIDtwyftmbxyDCGWgXPsyfZ7c7SmdK8rOmb982iaynna4OHeRQ3o
	8uWYrMo/6+GvfyozahVCRBfba66/tLwwY9YtO6Q2jLmTgh0utSd5QBWbiXLZYpoXED7wRm2hxms
	wM9+DUfULldENQ5omDHheXMQxB00OrO7TK/lwKsud4i/sZo8y7YHJ0JGbUVas+VZ2Db2mAwuI9q
	+3/wQek34LI7EX0iorHqh/QpZ3VlF09ErCLPV62LbfB8n6c9g1KL6ZgkHmdPm8R7Okq4oc9qM/T
	ww+HdqX5Hu4PHme12gxIoeBDui018LF6UjV/mCZ8MsMdj7O9nzkgbM0KBulOeWF3rtNtCHVWhXY
	aUToomzLCJQ7TrGJauylrbwrwQPXwkKGuzUYu+EjdtsmpWfuQ=
X-Received: by 2002:a05:7300:6d15:b0:2ed:b131:240e with SMTP id 5a478bee46e88-30bca0dabccmr1625180eec.23.1781692481713;
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
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
Subject: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:28 +0700
Message-ID: <20260617103235.449609-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033442_439272_77847794 
X-CRM114-Status: GOOD (  10.18  )
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
 sound/soc/codecs/cros_ec_codec.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96..c522bacf06de 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -608,10 +608,10 @@ static void wov_copy_work(struct work_struct *w)
 		container_of(w, struct cros_ec_codec_priv, wov_copy_work.work);
 	int ret;
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	if (!priv->wov_substream) {
 		dev_warn(priv->dev, "no pcm substream\n");
-		goto leave;
+		return;
 	}
 
 	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM))
@@ -624,8 +624,6 @@ static void wov_copy_work(struct work_struct *w)
 				      msecs_to_jiffies(10));
 	else if (ret)
 		dev_err(priv->dev, "failed to read audio data\n");
-leave:
-	mutex_unlock(&priv->wov_dma_lock);
 }
 
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
@@ -895,12 +893,11 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	priv->wov_substream = substream;
 	priv->wov_rp = priv->wov_wp = 0;
 	priv->wov_dma_offset = 0;
 	priv->wov_burst_read = true;
-	mutex_unlock(&priv->wov_dma_lock);
 
 	return 0;
 }
@@ -911,10 +908,10 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
-	wov_queue_dequeue(priv, wov_queue_size(priv));
-	priv->wov_substream = NULL;
-	mutex_unlock(&priv->wov_dma_lock);
+	scoped_guard(mutex, &priv->wov_dma_lock) {
+		wov_queue_dequeue(priv, wov_queue_size(priv));
+		priv->wov_substream = NULL;
+	}
 
 	cancel_delayed_work_sync(&priv->wov_copy_work);
 
-- 
2.43.0


