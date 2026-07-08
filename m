Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66736C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=dWHnGBW4WrXt/b7Sg4B2gBDH9+
	8vzeG9M2F6qJksjUgIMIev0reitvjorF5of/H2BE/LvPLWxCS9w3QyQNVyamujz1R8ZMCVuiprJYx
	tTcF42y5Aq8vTcVEElZhHKZxP1hNUHDbA5xb4+a73PYkrej1JWO17RxvVYcYYLTKBNuy8XrLndCFB
	uNKSPw5CQQfggdA3e2OTXDDc47/OdYX+UVQ7pdLzQaPaxg0BDsqiLayOZEeGewKHsoXMUdVkJ6rdw
	XY4YaKUFOavy+cMHakk8/+od4ISWE5NJNl+rWrvk5hWhMoSdLvsrXzQGpUrBUVgrWu+ogiqgO1kTb
	0VTWboEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9K-0000000HHgi-1zPR;
	Wed, 08 Jul 2026 14:21:18 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT97-0000000HHXT-2H8R
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:16 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so10117525ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520465; x=1784125265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=okB1n4J9A6QOAy5V6dq7nQ3oB9wla+6G7R+H0nMXKeR56eGbY+NEop3gL7bMHMdMnQ
         B8zPh8OqgeBzPiYPw5f8IB8FcgpItWtkHGEpU6fFkKLxdUVnpVdxNCNRzresjwckT3jM
         GINhta/fRXVa1QpOiAxJst6Boe71XKWg7c429D+Hj/Bt6wGsItrrwCmXs0mRYreUvRMp
         x7ams+Jb2OeixacQhTzXN6y1NO0UctapumNZBoc276n/Orud2afJJhCSjvxEymSImW5O
         +Mj/T1V1+UyGGkMvzIi7mli/sWZrNZ/ZAffxG5PONwTuDftd26gEzzoiuKoEq7DjjGyZ
         g5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520465; x=1784125265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=O7zXodwE19S4OGJVYq/3K1q1GU8w2Y0ItIobEvshqWv2TfyBq/FZyQkyCb/D9J6NfN
         XrJkmvlUy6BJlUjTOjN343OVzMdTE0LJqTOiKk3tceyDIAbc+dX+fKlVyHbGRThvoYup
         LMLg2vxszpiaUZ5z7/opQ6ZAxUr9IgEhg7OeisP/6pwuApEtLi2f9YupfTMX+SBxLo1P
         kmtYRfhFizW+y4CIXH2nL/rkQ5HAziv/EznYr5HFMmxJ9JxVe3Gzj+JjYpgGz1S6rWJc
         Zmiec8LLbYAtAi3Troq+s8/cjHtab5q/9VknJTrKgfF3L2ef1b9NTN7ytuybHAhd0Ved
         B7og==
X-Forwarded-Encrypted: i=1; AHgh+Rr+NippvnGWPArA7amE8ZB3IwA4d4BrZTGvMxspyeaxmVBOY2T3vlEVmVums3ur8qb3iXTaT5/2vCAQk8JHDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2uV+wGJsBPZOotmEX4Yd+7Vi3ocSAKhVggeNh2FwOfqo3OWUw
	/8xyNQm9NeY6Fz1E7RS96V6g1X2IPW1WM/a9VUn5yk8AN9xjgIOMWuc6
X-Gm-Gg: AfdE7cnUHQi3mkfw8cFbMgfFzu3OJAJUO3Fqisf2WwDjWS8zx2m8DZTE92whU0KQ6FR
	2JmB9N5nE2yjwEZBeCt+fN4ScxIv4XQ6me/FKLu9TQ/6iYsIEbv0FdltUfpkj64LoXeaEYtGhVp
	Evcq+r+By7H6bo/5rgWCcNfqePRrFBB5ymSkuXhiHu5Ld3yF3k/i8hPcaur53DtuK24ebFXB68k
	bH23zWrQNsuxZ/KOL8zFpmgCCz4lu6HNyaTbL5pwddKvwJPd+j5HsgF6XHohXskIgOVQSa7z5LH
	qHKqaWfZOtocRaq0RkAhA1AtCsBN/Ahk/J9iwg+Qo8X3JUYZ2IGOth7/pfg8tddznbZT0xGDxF1
	vh58J30T6U8x0JIeHB5RNs4llh98MkLQsYVZljycSjZ6c+/qTgoF7S07WpxAuv/WZ3uDlXt9oaV
	HgJqgLp6TrQfC4fbc1z0NsbNCvklfB876deyB8TqPUqdZxxc8=
X-Received: by 2002:a17:903:110f:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2ccea388b1bmr30568515ad.14.1783520464839;
        Wed, 08 Jul 2026 07:21:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:04 -0700 (PDT)
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
Subject: [PATCH v2 15/27] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:22 +0700
Message-ID: <20260708141734.578926-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072105_721928_9F03C9B0 
X-CRM114-Status: GOOD (  12.95  )
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


