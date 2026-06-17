Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5E4CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRug9eLPJsGmAP+VJnwvB7OkJ9sFAbmMJ4eYi6JABvc=; b=gpD/bQcWzobEBAubwhWhBAQMBD
	FdIGQlQFeXFVetSkWSt/n0SAZ+qOoqmG5GCqo6EpUa5ViLW+2xG2fRLHo2JfJ0fMjsbSSR6mkwqFy
	WawAsPT8WNvEqFu1JYwjGut0GQVIG6jaiuQfMgAtiDeipFlK0ReOKZTp/qq3Ltpp11eNGWFXZhpHo
	gXAwuVuvrJuRDSGVpMaKjn0S4XkyYD5EnSrYNuSIeoHnas3LACWbQjBHAE5dqLUp5oqjJAch0fp+0
	nRpsOvn6Xpy6hr+BcNHal9F6Xk0s3NNSKUpdkMMlFSoASGZpmmkXgAFRnM0mfE8nMJL9Y6qQNr9Du
	BP8FExeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnaE-0000000H3hc-3cZY;
	Wed, 17 Jun 2026 10:33:22 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnaC-0000000H3fc-03C4
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:21 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1620234eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692399; x=1782297199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRug9eLPJsGmAP+VJnwvB7OkJ9sFAbmMJ4eYi6JABvc=;
        b=ZF+zpO1UFuWI7ARJxmyfUFTM/qIh+0xIOkHKY6yWw59/pvMMgMOzfawDsqSZ9C5ynb
         ft9xqaYE4Of7g8zh3/DUkLEee1MQX9p3SxpMUz4Nyciqrf7iVMqp/owHLnXYww7kvayJ
         3ndjjluzwiitlyl4S0aIOJQHxxqeigy1/yx7AK4Yevyxgbtw6N99cWIvnMaJl6bASlEU
         SX9i0ScrQW5v/Hq9KNTF0jHloQfsMvhS+n4tILMNZlM4szf4/pKxFhGhzXWQLz5euKqm
         DnIqfwc7+DxiNYfyBltkvdYVMG/qn9qpSZVorT8Jaz7l5rhvHM0hF+x9NjTmiZyBLl2d
         fQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692399; x=1782297199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRug9eLPJsGmAP+VJnwvB7OkJ9sFAbmMJ4eYi6JABvc=;
        b=F7zXoZq7X80EetWlREA5RP55r3vXHidD01HtjIFEHCV0KNqdJOlXhnZLVvxWS/DQws
         2FfuR/E2T8xGUVt9svYy/xeqHMyeft3t9W9z/QUMdf0za4K4qlGQ3VNGwvCt6huhG3EJ
         n620RJK9NUS2ZEc5euweYPeaeMhZG4pEBpDOi66hBkUeEFE8OHPCkim06Zn6g71xoAYe
         dMw6zmbSVHFvUKGAhxHfP6JJ5OG9lM8fAMZynhKCv0LlvytyQem6cmsfKkpW6yvS6qX6
         yUj8swGN+3ksrhbEIu3/NUXLzicz+x3ODpmZhqksuS78r6592xt4cS0pUExqlrQy8Dc6
         IStw==
X-Forwarded-Encrypted: i=1; AFNElJ/hiwUOExlOwnv2kYJgXzto19KcUOSlOKSHzJ5y01oIH+Pp7w5qm+HYaYnPm58C9uTNw3AiESfTgSrT5ixY+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfnmHQz0u2+Jjndhw2fahsnF5rswL0cNtUImRHFN79h2LfjuMR
	w4EFCOi0dbBnTszU9Kx0i9R/PErrTIB5WhAmo5OaRVLPBNz64zospxDr
X-Gm-Gg: AfdE7ck4Z1wbYAOitpLqoRPZCe8RSNnCapaO52qiBem+Ofta1B1DPalBr0Klw/goMWK
	5ozTWzQ1YL3BmQhD6ZanjsNUJkgboKAUwEee8iEPOwERrOX5BnAdyj4TMYuIbtMR9Em8uTs7exZ
	0TlfTRbLPdHrxBGNHkWGahX1r9eVwMr2IUY0V8NrRjNFBoXiX6W8V83fbtX86gQglnqTl2eeqWU
	lwuEzlNjj9UZm/CWhZzTAc0V38jljD6nnwz+Z8VqZLKpT+5fNEsIqTig8paSsiW6R/Q5koyY8y1
	FSGEKsgMVL/DGTbeCYjSi6GCI9zpKQE95pw5O5KA8mLOzb7208cl0wmM2r9ssawgXMaxndkrRKD
	ImFQ1dQbJK9b9qqOcrQIvdf2bJudDfiTegaYsT3RD0jXCrBWIaUfctcvrLgNfMMioO4q3xhafEm
	LdYGe1kpMa67GbQGE7ucjoPoQHB7NkhjgPUWH4VonYJj0HaBQ=
X-Received: by 2002:a05:7300:30d2:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30bca0ab339mr1950409eec.29.1781692399061;
        Wed, 17 Jun 2026 03:33:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:18 -0700 (PDT)
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
Subject: [PATCH 02/78] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:19 +0700
Message-ID: <20260617103235.449609-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033320_057264_05AC3D19 
X-CRM114-Status: GOOD (  17.60  )
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
 sound/soc/codecs/ak4613.c | 72 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3e0696b5abf5..413ef55b918a 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -384,7 +384,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 	struct device *dev = component->dev;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	priv->cnt--;
 	if (priv->cnt < 0) {
 		dev_err(dev, "unexpected counter error\n");
@@ -392,7 +392,6 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	}
 	if (!priv->cnt)
 		priv->ctrl1 = 0;
-	mutex_unlock(&priv->lock);
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
@@ -507,10 +506,9 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	ak4613_hw_constraints(priv, substream);
 	priv->cnt++;
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -599,42 +597,42 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	 */
 	ret = -EINVAL;
 
-	mutex_lock(&priv->lock);
-	if (priv->cnt > 1) {
-		/*
-		 * If it was already working, use current priv->ctrl1
-		 */
-		ret = 0;
-	} else {
-		/*
-		 * It is not yet working,
-		 */
-		unsigned int channel = params_channels(params);
-		u8 tdm;
-
-		/* STEREO or TDM */
-		if (channel == 2)
-			tdm = AK4613_CONFIG_MODE_STEREO;
-		else
-			tdm = AK4613_CONFIG_GET(priv, MODE);
-
-		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
-			const struct ak4613_interface *iface = ak4613_iface + i;
-
-			if ((iface->fmt == fmt) && (iface->width == width)) {
-				/*
-				 * Ctrl1
-				 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
-				 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
-				 *  <  tdm  > < iface->dif >
-				 */
-				priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
-				ret = 0;
-				break;
+	scoped_guard(mutex, &priv->lock) {
+		if (priv->cnt > 1) {
+			/*
+			 * If it was already working, use current priv->ctrl1
+			 */
+			ret = 0;
+		} else {
+			/*
+			 * It is not yet working,
+			 */
+			unsigned int channel = params_channels(params);
+			u8 tdm;
+
+			/* STEREO or TDM */
+			if (channel == 2)
+				tdm = AK4613_CONFIG_MODE_STEREO;
+			else
+				tdm = AK4613_CONFIG_GET(priv, MODE);
+
+			for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
+				const struct ak4613_interface *iface = ak4613_iface + i;
+
+				if ((iface->fmt == fmt) && (iface->width == width)) {
+					/*
+					 * Ctrl1
+					 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
+					 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
+					 *  <  tdm  > < iface->dif >
+					 */
+					priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
+					ret = 0;
+					break;
+				}
 			}
 		}
 	}
-	mutex_unlock(&priv->lock);
 
 	if (ret < 0)
 		goto hw_params_end;
-- 
2.43.0


