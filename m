Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B29DC44501
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=JOCTqfOdh7H3fLHMnz4cvOPmwh
	8KY35+jJOOUJL6DWl0/eeyu2dzOubUbO3nktTqPPQq3T0eCxQmCExKZOd1gojttpEGtXtnqe5p86L
	o6oAvqMTsWtZA9x1uBa88pZChJElsjhzsdp2yJARdtU+64M7oni8PInlPKreSumax0yg0s24wTiP4
	oxYydID35+IR2qL3QsjZiQ0Z6MmW8JOAcKs/2qUCZVzdOIPxy2adA4Ic45oMR2cN5diLgHS6MhGyW
	0zkxkTEQAF1rp8X3722CmFSydmSgzh4WdPeQH6dxQkWVTf/f8ka3TJl0sA4mU/ShWobbl51gaKeQG
	XCPyLHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SL-0000000499I-3ASd;
	Fri, 10 Jul 2026 05:07:21 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SE-0000000492r-0EDz
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:07:20 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848743155bcso79338b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660033; x=1784264833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=bu932MS88hdn2lVWpS1Fp6Kdz+1jNY8Bz2BgL9egT/43VcNcjhjol+6h27YKyi8v11
         jiKjNrZt4YSIo0qFVwjpTCnp6vscxmalr0Jq2/SsLRqbyeHmgCJq55NPBpHIkrEVmn5b
         XjuPQ84iPiIh42aGYzuE0oFBx+Izu8JZgez5NEcOaaw1Q5dURQiOsi+nR+nJqXaU3Awp
         TGEz5r938wfvMiiwZEOfiFVv/STpx5qA+5NQHCRAg4udT6jDqfU0xl2b9wrggfApU6mB
         iUT6587+w5PR4BI6uATtr6xatduCzGkmW0uBJDf85+Xn6q/8JGZfW47gokKitdTPg1OQ
         5Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660033; x=1784264833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=I4xdoyLBAe0CxFNXGs4QEWJvy/OJOjMUozbzNXHLQcoqrg5AtzsAxjHh+rB0p5/rCS
         oNSAFpk5SGO5u9lYkcPM++8DFvbbM+ATuJViGDabKcu8Zf+qN+I63iuj9U2fxI9IGdQ0
         vOrDC3ZVp8/BLX4NeHyM5tZBhBAg1CS1BPz+hRmvZIPLOkKhzGceBYGwTKGrWdKgMJrA
         AOP/w5bz5USoJmSqhkd5KlgCA7Zl2SGGdAqnqw3JVCR/JAZbUYfQd/FdryxKVZFvdkLA
         4skFqga0RHKvODCmlCL1VMvyqmfyBZ4L2GLk05zpBfSN+1Rs6eWcrGxkMfYYouuj/Dty
         4Zag==
X-Forwarded-Encrypted: i=1; AHgh+Rpf8z56liWo1Qk1yI8WQ7l/mZX1BvzxW9DahUHfAM9TMeLhaNe9vyuw6Yvai4gShwLP5Bud1vEYmynJy4w1qA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRvdqoTOHZlS/+IY+1oGH+F/9vm9RVMvn0fRz8PGhEYgpbL1bm
	JLQezQEBK/eBT8mY4xxGTp4KprHQBnNev5tpoyZf7fAxRM+vbg3ig43v
X-Gm-Gg: AfdE7cmOhw8kfxCwVdTtTSfO7OPwz5hU8Xl3bABdSjfoM9WQaHhn61VOqLNzkaUJ8tl
	zf8R5ThyyZ3T+WEmwYqOALot5YDU4znZSYl+xGFY/2/oJzJ75h8bV48EKmcCwJt2geunuZ8z1lz
	KSmK8LlCyB8amzoZ3dYqvvnwTHX5nBjAdh/Um9u6kHutILVVyaVGmpZWRfdP9GSQOnLQQhwa2X6
	0QaJPUq18adD36z5o7cRvI9j3oFH9UWYUcq21bAkBhKvSk85eoHbKdoJ9EP+1nS1Ptaeebqsze5
	VWfPbca/UtkiJiAyXgsmW+Cmqk67427vgAXU0S1KIp/cNBKxSJ4LbMG/LzjPhJEv7xfZNcyRtUB
	L0oBhMp8HUqyBRAFi4vXXnD8JhY0DXDOUbhCwpS1YfRPkhL/q3y+cXo4Dat/58NCZA4cyqtSXdP
	fJHsjlAOkPv25aRd5TVsbNOHzNvLL1l2iWwhpbWp58se62ReA=
X-Received: by 2002:a05:6a00:348a:b0:848:2f74:1d5d with SMTP id d2e1a72fcca58-848438a7e5fmr9480496b3a.67.1783660033363;
        Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
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
Subject: [PATCH v3 15/27] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:59 +0700
Message-ID: <20260710050511.14439-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220714_112140_DE8670D5 
X-CRM114-Status: GOOD (  12.48  )
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


