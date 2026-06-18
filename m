Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DFFCD98F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=; b=o83JlZRTJusRvaZ/v/UmqtOfBK
	jW9d2aBOcewBtG5AcuBiWUuDmkjwbncHvNaonyBk0UGLPoRIpsdfXlKZe7FDbZlFLo1nuQPm8WxRA
	hFQxZLZbVNejRKKsIHaQZvmrAlkxhRFYsg+RBZDYftPvXRw5QIOoLpZUDKrh8PNmICI5i0wHHf6Wr
	cP3vaKzutrxXOqkvVMpfjJ51ZwvxTWVBP9dW3qLNS2qZ7EMwi+oObXbZInDQd1UoWlCX5pFjeZJ0j
	9hLffBPwhv/FreepfuJ+1vU43GiAsP+zo9q4FFZmIh6hewdE+aQChCZsPG/EA7tOGMXNSl2lc4NY1
	O4mCPU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeJ-00000001ATA-1FKB;
	Thu, 18 Jun 2026 11:11:07 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeF-00000001AQN-32h5
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c40397e746so5409165ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781063; x=1782385863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=VumaDQfMMfmQbJ8niiK2iGik2ZopdtI1FQAa8Y/+WZNhAVJNpIVFtMEo9TtkQrc/41
         haIsGcmEF/9S54YfYiyxHgTBpLpLNS2E4aQb+F4y0LqBev6TRWYiAvrEIlhdJ7xsmIsi
         t1kzd4zm32tPqSjt9LGCGiCdqBXBgopAlD/jGgdBK4emIuXkQe15kqTsYiju16M6HEyU
         w2DSmDbTN6gXsNZA2BLVS+e4igIrVimySUxS1old+YpO5kBYOzoNVGzasa2HICjq5hY+
         YIJhSQ/A2kk9jhoGvPN/p57qHR9FIww8F3tHD6G+TSERdNbhHVKmifJTMMqgJboiq3Bj
         IMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781063; x=1782385863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=DM0RJBQgiTbubWH3RllDkEivtKXpE2sc18pi3P/caFhvAq6gNwBM5DEENL8uFXvBES
         Tu/lo+csnt488nbUhpvIhGB2ylQK4GYzxK6TjIsG63pQzj6cQKVlv6pMWjsXn7+EqWUk
         r30uMKxyPo1Sd4BfIv3aLE5EvwqDUXmbAtHbTVwtK/QZmqRBkYzxhQWeiC3+nSbIBtN7
         DOeHCUAzSru+orGTLGaccG0f65Gix9OVTKwR5vIOaZwxkJ0AFkYWFtOvXOaxajH3qPcQ
         XQrAPaVhuenz68PIYJUsSeI5osY8U6+wVOAngIzClHIrpd6IEc+PavSP/61TM5Bfq/s1
         pLRw==
X-Forwarded-Encrypted: i=1; AFNElJ++F6uwy0CTDLABiOsJ16qef5M9RjwKA17qmW5YBkJs/hc8Z6ONABMlQ8eS41Q8iaLrie1GsV5K8U0F8//shA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK4EsTJ8y3hT6ZBdRg9pSGRSZkwOBZ33xkUtJ3FSTRT/7qRfdo
	3vWg4WU4q+1KA1dygH18MU5SYTrjY/DDCDXCI4uzFrHvrr5Qf0/Kd4VC
X-Gm-Gg: AfdE7cko1w3X5+uxKqdQSrpYJLyPH53j3FpfEXLr13OBXSplOvV0wnoEFOeD5MHZLW+
	zR/sNAZFp6MsyIvO3/CVYz+3EBblTiijHNadQbY/KvxIjC/iH54YM4q6SQA2XS5fj2rDB5vScG0
	kPR8FSNxsxysvbJE6iFQJ1fhqS8G0ZUJLL+/y37JTmLoZaY2AMaI25da4dP5BAHQ5o75oGiNHS5
	Mn4VfSISTsjUhE4oTo/0QPxY1+wqn2sY/WBTGsg+qQRJ9ecgY5NcBbS/k+WrVYt51Pyqu0AtPLp
	iqB2W7dJcZEEtGe9jbAov2CciT+SObG4ZtFNGG4YWkaJuLPhxilBJgYAwAMNAiGXg/T5pI5eR0g
	AX9F8VgWTvu3nGbT81QOE5GKbGEuEpY+vnoiGzBo++h2FgZmmS6dlfCHflSE8QDterWhzIbRPKG
	r40kYietbd6NuFI0Zk8YOxXk96U4HaTE+UTrmXnNZk88dPY7E=
X-Received: by 2002:a17:902:ec87:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2c6f340c89fmr22802915ad.6.1781781062990;
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
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
Subject: [PATCH 72/78] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:21 +0700
Message-ID: <20260618110827.232983-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041103_863213_730B6FA6 
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
 sound/soc/codecs/wm8903.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..7c87e927836b 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -463,7 +463,7 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
@@ -471,7 +471,6 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
 	return ret;
 }
-- 
2.43.0


