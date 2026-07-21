Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52A3C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=Pe6L3y7CTyNUpk6dEzwALn3ayt
	GAu8WyxPxlO0gvB8tTVrxgNjnnUuoClA1+cfrZ5vfEmsuIWhk2KvOsWKiYdE7cCBCOqXrsAEHnKpC
	P/IGrM2rGRjA+fYEEug8FgITaMZZpNKz76SZGXUcb//CnO0k+xbPWNuP8ro2XAagTtx1thSJf9/pG
	PaoKkcx/8btNO0CH9QOcUpjxqFgF0Js20X+pFqA9Y8ulKdGmK/+S4EeQFwZ0l36C8FcBP178BP+Sw
	bU83UypI6wMUf5tbR/Gms0EVUZIKrBggsSitQX/otUfJpjx9Rtf+1Otsgp+LfH2nCC/M2Ngp/yQTg
	WJ57SbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iG-000000099pU-34Ae;
	Tue, 21 Jul 2026 10:28:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7i5-000000099f9-3aO1
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=YAWGNGpgLZqODkkQO17ry1PJ2I
	1tdZHVRaFnshPjqkdE7e7bvecdazS8FFitj9CEW086f0hK+VaLpxOUObkkksP8vX98LdYUoTxHlL6
	y6MuKq0iI1J4vsCwkdv4wtcknOTWR6xx4839mHqz2b9m5CrFgv4bHDqFFsmGEpehadEv4cYf3ygfJ
	B0Bm8HZ3sKoPILjRHvtTQsOkj3yLfl+6K/P8f/fDzyjPF76WrLhxfiy1kfvDH19CcpqFqlaAmTkvN
	TxWcq9zVbSzzmooQmIyeFFmJTQGXopVKGPSYMKapQcNflUloskDaCp7lCTyldPW8qxw6udWfmztQM
	P+38xYPw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7i1-0000000HRgb-3uNd
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc891373e0so139047695ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629700; x=1785234500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=q2EbBDciXn96q3epqNqyfLYaoudCAvsGUMmw2GcGBoq2W/rL9cd9WX6J/XnVGovJ/H
         2WD9AgWt7fFSznKiQEgmmEF1UEeBfKG+RsZFK/MQIcSZVHn9oh4lCsCA66VBqFIfJPA3
         eEvuecn7Jv2qW8226QlluAn9MOixDIJLtxSZopTQN012lpibJAWTi7J6/LfG72vXx7uI
         IuE5cabHCC82KewxlcfIoO/l2WCbnixk9CZsshAffpC2qR9VV1WYA9IxCQPH6Fy7tts4
         8ngThthzG8rPZbfGdFbQ+WJrXBmCZadQFZ5ug7GOLtcP36iRIu+aZDIFkfBM9K9+mt5l
         ul0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629700; x=1785234500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=cgxKbgp+FJNMiG2SlnrPHJ8pfB2eehL6dJ2cbEaEttGL8oh9hNE7PIApGvT3nJVD2z
         0KKxQDehZtifFpHOgxlpxORfBk9XKfVSruwBIAmJehwqq4jCsp46ioqPxmz0A+8whfL1
         htbsXiM/n8w0ovdUuWnrNxDgRnttnhh2B3W5FIoOmCCkwliqPMx5J+70aDvTFj35vjmn
         mpwVoYNN/9trU4ZBnPGdQvhfjnPrGP/6Go9e6NT00NjN+wCHuhkArEah9YBpYQOIjOx5
         ahCJ/q74Fely8nwtjuKm33KbrJZpliJsKfKVj3ihwGrfwchc/IF0kJ1WE9i+1FLKXvne
         +MpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlRutuztdEXNheUMv8ecVcqMjJPeJsO3/2J1Jyz6TO1YxwBrsfB441nWQP/cIkAg73vEYk/u9PLO0noVHQhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YydpGN4vYjdldIPEfBNcUe9/GamJDy6GnFEhdKQlm0qy7Dzg0R/
	es7hD7KkcTD4YaowTBoyJafplTUJz/J1suN/XVdDF08NMJNrfPMVrjEs
X-Gm-Gg: AR+sD12P66EwS5RN+EvFFkSTvM0WMhznAr9wFXaZO1IjoOb+YzXvwPJ7N8awVO2qH4C
	CIdu70+MkhDGqFIjS+DaMXxkCRRvHxC0DAqE+wfhS2bfZJLaFpXSj6gBZRQxt/Cx6cjB5POA9Mr
	NsFMiOwNa9RGj7Slwb2LKnwMLQFpb4LIsyXU1YH+yxx0H2v91aqUIi7a5VvXWXchru/m0gLXn9P
	w8Wpy0YSio2tRp603wQeVmSfOYOX2kf3NV1DQyEbF3CLT3JcpNoCR0qc/xI5bkCMxl2mvkEUeQj
	jD5IhJOCER6MBsyFDg+FovM1NvxEsonE0A3dPQWHdLDoKllss/YrGRUp6MW1UcNrlg3uhMfxtlI
	aDmCjma5ry9bz2Baz56/xUtav5a9559o1r2xrGBhVT9mkdx8p8ox0hvuLECye5ekz6E3xUJ70eZ
	/ThJAo+rUfC3YS0Gv/QrnMrBulySafrBQM7Rnj
X-Received: by 2002:a17:902:e5cb:b0:2cc:9763:e607 with SMTP id d9443c01a7336-2cf349bc5c8mr181903165ad.27.1784629699763;
        Tue, 21 Jul 2026 03:28:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:19 -0700 (PDT)
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
Subject: [PATCH v4 15/29] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:46 +0700
Message-ID: <20260721102600.523199-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112822_114260_33B7BF05 
X-CRM114-Status: GOOD (  12.54  )
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
 sound/soc/codecs/pcm6240.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ac4448ac3c8..a2b66eae6ac4 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -12,6 +12,7 @@
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -605,7 +606,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int val;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	if (pcm_dev->chip_id == PCM1690) {
 		ret = pcmdev_dev_read(pcm_dev, dev_no, PCM1690_REG_MODE_CTRL,
@@ -613,18 +614,18 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		if (ret) {
 			dev_err(pcm_dev->dev, "%s: read mode err=%d\n",
 				__func__, ret);
-			goto out;
+			return ret;
 		}
 		val &= PCM1690_REG_MODE_CTRL_DAMS_MSK;
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			goto out;
+			return ret;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -632,15 +633,14 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: read err=%d\n",
 			__func__, ret);
-		goto out;
+		return ret;
 	}
 
 	val = (val >> shift) & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
-out:
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return ret;
 }
 
@@ -678,7 +678,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val, val_mask;
 	unsigned int reg = mc->reg;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	val = ucontrol->value.integer.value[0] & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
@@ -702,7 +702,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 			__func__, rc);
 	else
 		rc = 1;
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1645,9 +1645,8 @@ static void pcmdevice_comp_remove(struct snd_soc_component *codec)
 
 	if (!pcm_dev)
 		return;
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_config_info_remove(pcm_dev);
-	mutex_unlock(&pcm_dev->codec_lock);
 }
 
 static const struct snd_soc_dapm_widget pcmdevice_dapm_widgets[] = {
@@ -1890,9 +1889,9 @@ static int pcmdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 	else
 		block_type = PCMDEVICE_BIN_BLK_PRE_POWER_UP;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_select_cfg_blk(pcm_dev, pcm_dev->cur_conf, block_type);
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return 0;
 }
 
-- 
2.43.0


