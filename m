Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB9ECD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUF1nUSK8JjVFEerCymxn+O2TFW28hvbz/kOFuEnXM4=; b=uNsyE6wOB2kIYON/Lw/wDEiS1/
	Mg/dKNMPL2Jlt+OP8LPBwElwmptpJeRRoTj5+7RoENwB0uVNjdINrySFm+dclrTsJNltjEGEzNFxG
	OfiEl3URnOJMegCk0gOGxwGFXKMyTTEQW1TZ25mFiUq7BQ0ocRv6K1fHrwg7sfQoSPDRrmHehwg/P
	QPOymSzBDCFBJOQEu4X1FK42q3pHS3tiebFTmDhRIHG1CDcioPuonUugOY34TxXbnjcI8Q1OQ223o
	7qu7OEG2hs53raodqVrm4erhr85UcN+i9H4hUdTQT3jRQLLkKRn6R56/QnJ27miF67csMu70eMq2P
	G4414IEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZniA-0000000HAE1-1Vib;
	Wed, 17 Jun 2026 10:41:34 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZni6-0000000HAB1-3QLX
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:41:33 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-137335bc3caso6891539c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692890; x=1782297690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUF1nUSK8JjVFEerCymxn+O2TFW28hvbz/kOFuEnXM4=;
        b=T65F1/nEf3grqtcCDjfyxx9AoArowPGx65CICOfJWnKM1jn8R4wWbNsX1XYCJZOa6P
         5I9Sb5QUjrSdv7Z+5ItZzkz9PqWPDtlQyHHM55PZ6Z1XvkXXQb+V4nct+uBU9GnO3VBY
         qiz6rv+UkHMgTTETbepkZHtJStrMFlXqiNPYb8LltfkzLzEtEXg0fPARRG8AEJkY8SpI
         gSCC7ctRSg0HcrOWidsYI9OqeegLxE8S1NfGGB370Gi84Ku+OwvCTjIKKdXxUXcsRqQe
         iIhlvYWct3pdSlOJc7+DxcCf/UZ83MfrwIpn2NryHQHaX1sVOZT9hb3+xvmGgxg52Dgo
         091g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692890; x=1782297690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUF1nUSK8JjVFEerCymxn+O2TFW28hvbz/kOFuEnXM4=;
        b=JjB4rKjr/nwnQHlej1qgsKCnrNwK72+rrdvKeU9NCzalmOSQ7AEgH+FuRKJSZTqO1D
         optvWeFFFLoVKEbWXxkYyAvZya5dbXtXQ1PlGki5k+OxQFhes8MFbuJFJDpYVDtbjMbM
         PBzGf5em4G6ougbW+4fU//6/FUgq0iE7sjx74VadIyVGbVPAYEX3LO/dxyQzadsbanZA
         MaAuyeGSAiMny8N2zzPInHKFqgSu2TqqGZTv2hhlSYRdCiSVGKkg7tLhajebVL50PFnu
         ne6BHUPpw8ZMulaGvInItoDmWDi2Nfm/T5ZER9sbvnA1HYLqemI5DIBq2mv2yfER1o0v
         ByRA==
X-Forwarded-Encrypted: i=1; AFNElJ8TdLXUHmVsaLqnpnju3HuZfuwXzVzh168A7KdeAPNhjirJC4sPfThTDkg/Il629pl1kTDbZLciMJ4DoZsRgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YySt436pEMfogq7nXvJCWu4q2+Wn/qwAP0MSylID0EGJNxwn5lh
	2D9bN2GLi67Dy3aeypPi6Zfz6F/3R5kJtoZDrnrl70nLHKyTGcN1S1T+
X-Gm-Gg: Acq92OEtTfDuMgHsc4eYRvqHdPZhSKtTe9NibxaL6t71Svw180XmPopXhIwQ/EVE8Jh
	05Ai1Webl22CFRp0y8Kt1R7IdeyEU19pzaYUAAv38UFnF5tmHKcoujXuJ4VaK/D5hUNQl2Qp8hy
	5No/xDqHwuMVG8yK5aGRSqgI6nocmLgOM9l+jRjxqU9SnrgXo4XvLOQh7icxjDxbu+PfJQ5w7UG
	PLUieiLhg97eiHTnzqHfIxVWaMo9Mw83hgbYewSGoGvrez4f60lxnNzTt9OER1Trx8vMzQd1Qrn
	IlakIGhb+RvBhmr4cWgL/0UOyyK/TQO5Z4VmdK/ZGr9LWMnNDo2jVGjTQbOu5+3Zur3nNxjDTxL
	t55JPIKoB5rEZZJ8bS7puUbMkUElOPhzyIcgdKVk/lIALjnro3mRNgUO9/5fe+gDSWtWQyqhvus
	zSpBrvaJt4l8i22XIwn1Od3WQFNPurvxuce1+1wQgOo3DeKwLjIlh+VZRTPg==
X-Received: by 2002:a05:7022:112:b0:137:edc4:a5e6 with SMTP id a92af1059eb24-1398f6b4762mr1323943c88.29.1781692889954;
        Wed, 17 Jun 2026 03:41:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:29 -0700 (PDT)
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
Subject: [PATCH 55/78] ASoC: codecs: tas2781: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:12 +0700
Message-ID: <20260617103235.449609-56-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034130_865295_021E2884 
X-CRM114-Status: GOOD (  13.33  )
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
 sound/soc/codecs/tas2781-comlib-i2c.c |  4 +---
 sound/soc/codecs/tas2781-i2c.c        | 20 ++++++++------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index e24d56a14cfd..85fcb33752a1 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -342,7 +342,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 	/* Codec Lock Hold to ensure that codec_probe and firmware parsing and
 	 * loading do not simultaneously execute.
 	 */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	if (tas_priv->name_prefix)
 		scnprintf(tas_priv->rca_binaryname, 64, "%s-%sRCA%d.bin",
@@ -360,8 +360,6 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
 			ret);
 
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(tascodec_init);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..f2b739780f73 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -843,12 +843,12 @@ static int tasdevice_digital_gain_get(
 	unsigned char data[4];
 	int ret;
 
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		goto out;
+		return ret;
 	}
 
 	target = get_unaligned_be32(&data[0]);
@@ -868,8 +868,7 @@ static int tasdevice_digital_gain_get(
 	/* find out the member same as or closer to the current volume */
 	ucontrol->value.integer.value[0] =
 		abs(target - ar_l) <= abs(target - ar_r) ? l : r;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return 0;
 }
 
@@ -889,13 +888,13 @@ static int tasdevice_digital_gain_put(
 	unsigned char data[4];
 
 	vol = clamp(vol, 0, max);
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
 		rc = -1;
-		goto out;
+		return rc;
 	}
 
 	volrd = get_unaligned_be32(&data[0]);
@@ -903,7 +902,7 @@ static int tasdevice_digital_gain_put(
 
 	if (volrd == volwr) {
 		rc = 0;
-		goto out;
+		return rc;
 	}
 
 	for (i = 0; i < tas_dev->ndev; i++) {
@@ -919,8 +918,7 @@ static int tasdevice_digital_gain_put(
 
 	if (status)
 		rc = -1;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1766,12 +1764,10 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	int state = 0;
 
 	/* Codec Lock Hold */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 	if (event == SND_SOC_DAPM_PRE_PMD)
 		state = 1;
 	tasdevice_tuning_switch(tas_priv, state);
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
 }
-- 
2.43.0


