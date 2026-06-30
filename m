Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39FBC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=bFGDmzEEo4CZC7ZxMYlED990tZ
	0+UYX9y5MkqRf2Kngs7CXQrStssFiCGvHb1f3vI8jvNc/lRUmlWCS938ZLCZu92qVU3hkUkLZOUa2
	+OwiZlPBfO/aLZIfsStBwH4cMnDDLRRCe00jnjRwAm8cZ8g8dVkoch8boloLc1VnrxWQP0piWo8vb
	v3oc6GHxbH5Ea21nrIIbT8vt1UaCigrz0h/U6vipJ5TRou5rSPrZ76gsY4c0JgL0USPZthP3u0d10
	0hWUhYqJN7FzsjW7vULung9QjiQpMb1ClmHqhH0nDZLk5wX/CSWNLJ3i2a1VqhMY1eMHNjkZFx/Bk
	htMAfs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS66-0000000FzQE-04Qp;
	Tue, 30 Jun 2026 06:37:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS65-0000000FzOH-0SyS
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=F0ksodKmDMiQ+RsC5oBMNIJum8
	+Yjftr3NI/b4v+7lqckakFzKA8BuFg4kKp1epqbVpD8kYQMolSnInmwBlv03g5dHsEoiJVB83Xy9J
	Kl1R4KwE90+qZUfe62TORQXS6HrehLHpzQduM81jc3+sO8eAc7RVFaJoxrGgbsmtnfwP6amGKtwcE
	iFYY88vT+9lpp2jSKSxVvL3LIznVTPfYeYJy2NUo0S+7WlkFEBvC3ncIWh/fSbWFmdO4RO6SQeCtZ
	kqr93H9xX1ResLI0S0uMmBsRVIrjRjfl8TkVMV89RHO07h+czeyH83LMxG+r/ko9mHBe2hR+mvDW3
	jabW+1KA==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS5z-00000001ZMI-2fOt
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:27 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9aea40d799so573584a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801441; x=1783406241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=esI6QWBUUn+DzUBsxl20RnuLoMjhD5kbQOKJBPqwuGHlD+a6dvCL4sEJp7cyAqe8lD
         EtAKMCpGHDttI66ZHbHSQKFjMSy2tiaYqQ91WZ6DrNpNZl7uy2YBhCwjs8ew35vrTWZp
         MjlcNrZG/lFxYp09P07RqdM0C1KXnPiM70EAhatWG5DNJIYLJr5me9wBPXsE+2i/Yxgn
         qSqKKMCe9DQZlbV+dg90lS8QP/XG2V+fJiFMwIBKLp8otEEL40NRMGDzbN8D048Uf009
         Jow4Dw0MeAQpmThF3UGmIbSSRNg7yBmtAQl6NjAbJLXpQPxkhv32H3Ai1dd45+mv9fWB
         lxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801441; x=1783406241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=Y1LJpbhzUUD8HyucZ7dyzpcmCtiuAKv6mU3aPCFssxwXt1ORnKjedwGg6bGCSjBJa6
         qKmeRPbh0tVKrdzs3aqA3x6YY7sl2UfregZcWz6BLntR5xdBq2rtOkaunYILePc9pmUd
         wsndZvjaTYpgLEEvY14TKGNiLSev/M39ZF1YOq6NCu+6jv7bXqlKlLrxY1SqJFLi4Y6V
         QYGTcosUGDESz6VS5yUm7ojZV41+fDJ/kbOpBajDbLDJKSin6bjVI7GFJYqjigvQ1Nlc
         tf3r9bFq7qS6/mcMxU+KytyKKDopHmZaGzbCltf/rbNkL4wiy2RbcMLUbiZ1s7MDgJbS
         E1MQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqDOapQN56h9peWQPyFaQWGaTmXYnv6w5zM9Uh0ZC7r1efyrI7IcosSmqyVKN3fWmtEkTdIo55FJTfU9y9mQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWDceepCdzKL4pBiC8cCthBF706pDIi3mb1q41JWdxfB0jpsQ/
	JujStfPedx5WAZRoIlvUL91Mc9aTV7hq0eVc08bNtAGDU3an1jMYqiER
X-Gm-Gg: AfdE7ckGORyMMRtBrFOPeoo0pI7Aq60vaRVmfl6MTevzOe/Lg0IzyQnsmIF+usPZduQ
	6bLz6TvvjnXN43zsrFJhhjLYVQJfvGFFvAokwmKMj5skvJQt5E0k8RMo7NYB9UuVLmuKwCkZ2CU
	SXTiYdpE9/4yP7nan1rdNnH/WyOhiN20ZeTQVa6yu7WDuhkcPGmnd9XPipwDYaUC4xyJeAddt9O
	HA5b8Xbu1hYWQkEIlQQDpWxPjiYFU6Uc+IwIAzZnF/5nQgB+i7vqResu6DD2C2uCdeRkqEUm5M3
	jpuiLHsXV4ygJHcy4enNdOx6rYF8fQd+FbrCKJzQswq3WYcR2rTxaFr1yYJLJraFINjBQPtv+Vq
	MpY25yWngaK9fTq3tOOBPUwhDgl8h5+SrA1W4caEACOTYdV6WfgsjnwuP4wIEGa89x3RBcHsubZ
	++3CjiUDb3j7lRVEz2t2PgUHX7SDWNSVfTNclz1btqGwkW3gM=
X-Received: by 2002:a05:6a00:6c8a:b0:845:e7ee:eae7 with SMTP id d2e1a72fcca58-8479ee9adb3mr1788259b3a.5.1782801441327;
        Mon, 29 Jun 2026 23:37:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:21 -0700 (PDT)
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
Subject: [PATCH 15/27] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:37 +0700
Message-ID: <20260630063449.503996-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073726_235244_D295D8B7 
X-CRM114-Status: GOOD (  12.43  )
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


