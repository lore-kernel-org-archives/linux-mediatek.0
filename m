Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A49CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=; b=KRN7h/mrcIsvKuHEYsUDZ0eCnf
	+dT1vJf4jCiJEgqbEEZKwa/C+WvA9rBIaV0cI5UuIjA7UHPusYE7EonBSvv0aC3Bl0lkZq3++bspS
	IRo1qFlygak8TzYaSOtNCZYDzD+Mt+3A06yf4gjyN7FoYVlQw7yXJ8Nhd88OnAYRAseSZRYXPEUYf
	EXRD44kzrkgiW99RrXQPDg57mKj/rl9mtfIZx/knlKoq9zaty01fuJTRZ8zcb/ujAFIKYWo0PXBd8
	amCzX1cAnKB81bj1uprxXVtLvH2CvUhTWCsjV+VnCxKh44go4KKAyv0vpyqnIjc99oVyaNpWnne+t
	VQZo1zZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngV-0000000H8o1-1Tcn;
	Wed, 17 Jun 2026 10:39:51 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngS-0000000H8l6-0xCZ
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:49 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30bd7f4fdffso371356eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692787; x=1782297587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=;
        b=Lx5YuZCkhbE2bDplvV7EOC2nBzI0fdjmWG2ZAeC7WH1TJQ9cK9vq5udVH+/WSktGXM
         yt38Zt32Q78cDU1Q3jZtxDN9doEyVn1yLY5S/pRT2EhWmRFgds85gqHjMIZgoCKTigLA
         Kcv6O6VkfnEVaRyI8rH7+CyGFM6blLt1LoPuYGzJWz8FYg2KCpKuYfiURj3zVDAH1leK
         8SWhv9viVyNSHDVwIJwGhfL3RpjtJmBuizMGZO2R3VMRb53iFVqJKaqLni7M4D2N+qOy
         ck0xdvyGAQx9WgibdEgJx/pBw4qv5K2X+f9mh8eu7DQWlqe3aDV7/xo/X7orklSiXo0D
         CgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692787; x=1782297587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=;
        b=FNdk3QXeClRf5io1E7rXtlFVXeKOCsA8JoG7HbtENSzE0Z/lP3wJQFDNdk/PDSKEW6
         39Z8A9c9UvAMJ+H5bI65/mwWolYuhX/nkF3DMMTN+9Hl/NByas9hqv7On7lGT+sFXero
         7MU/NdOhYGdd3K8bHeiVAPsTD8Iz9iUM4OaJIa77oskF0iPLthzFwhBvg6SPs4qhJFSQ
         77Lgr9WXZsJQ76X61IczKEOCOPeTKd62tMIV2Qtb+Im57Y8RizTCaGhKDoMNRAHdGYyo
         5boSSgCyzRK5YFXj/yiPqazEL4a0U7AMbo2tPxg9oE0AyBYWQOzjaSpiDUlNhrL18RYl
         EmlA==
X-Forwarded-Encrypted: i=1; AFNElJ8mFdgDSowUVF2l0iif0nE/cz8NS0HiFAc5Sxy+0h1b2R/1+/YutWAEIg8cjv+dXMhMEVv0nGKRtIgJ6OmWgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2p6LdYpTF5+EDNv2K+caorFHW01XccVwXOtNWFj/LZx1dZCiG
	VW4kI8ksrto12uGr/DxyXZqfgc2954e7MCVJ5DMb8jCzP7nP/lp+9y1v
X-Gm-Gg: AfdE7cmbsxj1IlkSPOHxhu1udVNQwlaPYyw2UOv2kTFH+qa+2ppzJW+VwL3xoAqEzBX
	Rol8aTrl/HtbMFHU8a6RE5kRzuQmm1i43hS8snuRDLJ8fMWVTG5eJrRBCYYbpSDTcAevOGCc/kc
	+GwMS5ieGcPDWoZmyOoNznn1BGXX26xMTM5XGWTpL5oh8NbdJHS4opBjSTvCyKpHpdBv5hU7Jha
	cguKI3uF4NIg1y8hsljJUdWqJ+1fdIR7nVVjSI0oI9NFcydYD4fdub5iqz2oSSx3YVeYHAXAmFp
	n9kXVSzgEFpynzLzrav1MLNYAAAqz5wH0YebMdyyU3fHypq9riJEqr0v770JI6KaJGBMTsxQ7sX
	KkqoHAu5/Xarl5qCslxo2AloPQHTGX/onmZEfMlO8drbuc+ygxbZgLADPsJHkXEvf+QworOb9nB
	sFBQ7sgWtYuY0HpXBBoi5xMjlLzanIcYUv75uME6yijLuvUtANZHMB6dZdfw==
X-Received: by 2002:a05:7300:6402:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30bca09f522mr1864287eec.23.1781692787536;
        Wed, 17 Jun 2026 03:39:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:47 -0700 (PDT)
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
Subject: [PATCH 43/78] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:00 +0700
Message-ID: <20260617103235.449609-44-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033948_326843_A8EC20C6 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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
 sound/soc/codecs/rt5665.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..9048632488ab 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1208,7 +1208,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1274,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4562,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4637,7 +4635,6 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 
 out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0


