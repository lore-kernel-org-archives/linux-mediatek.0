Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A712C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=; b=sOncCCulcfEKFIKpXK+Xx7Qt9l
	1Evo0u7i59YHdzmfR48gYB3djCu4IgpyL5nfhOYvmTVe7rJC39KcJv/Ab80nZjL4mxA1UFaRJWznP
	lnHp1ikSGtUK/o01IrXuG3rjKfpx73UslBQyy1wBAGuuEPD6qZazhPQrKNPqPyp4p+Y3fEHx7I5++
	yAr/WhmcgbxrVsjRyvyTLN8lDA1S1tJYhzOJD8IuD6b8Ro/EARrNRQjkSpacXxC3rkoMT2Ly+CVIA
	J0nFq9gXYeVC4aeEvvNiqDItyzHmXtned7QlDFBc7ARY0dqO1USxY0VSzScgLGgA6nxdjvKowMgJO
	TDDmFAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ib-00000009A9N-2gOw;
	Tue, 21 Jul 2026 10:28:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iV-00000009A2X-27bG
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cab973140bso136550215ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629731; x=1785234531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=pMB+o+zhEcHVsqgFP7MSk4DbkhO2wbM0JgFa6eVnIBA2rCqNgPJpX/XfclABEDc6fG
         ZLN2uHB+IsvSukg/7fBf4BsBgaK96wNV/QLPYkdIxAZ1cZL8QAuEV9VaX8In5hUi09Eg
         6vb/1meM6qhlvbOkO0T67BfYyt0x52DtHxCmW8xmULJaZJtNMnR1P5pca4+tD7ShWVY3
         H7YS95Q9vWGkON6TLagj1PhU7zf7Rcp1pAfPgSyVIKmWT988+KELs8qO+qRNqTRwkbtQ
         1Z83zAx9KqUnIni2CdJzzPXS8FoCxr4ipsQJ4UEeKKCFeziZlX5SAEbLmfba3JSRmSPM
         L/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629731; x=1785234531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=o7CoHEQvzFTitQ7LRsL8dGR1mlyEAq1xX3ovf6PUjDhf2vOsrAZlZ00hbOoHMp3cxt
         5buHb0SVLYrdnt7ot2r5WsflcS1UN83sZuK9u6XpJ6LNxU31KsqvWAsFmbiO3pJJ+7F7
         t5+7zu04Q5iZETSootovNevIfZ+wq9N6tnxjb84q2PScKxLMVgCNIoviuAweyoGYcRjn
         wQ36Beo9Ug0zaCcoKF8auW9Z5X/GeB8ORMdLGL3bjg8u2ACbieo2pr96qbZMfFQJjXGt
         nl76pZLcjOJKrYl4hSOiAgGE+k/RcYWOMgPQXiOD3BE9hSXOf3ww55jYT5RrreR8S0Y0
         XFoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rryhu9bO/XOg2iih+FFvSP5RoZ3l/v1Y9alTq0MoRIS1vmNLXf9WEVyUgLDS/6DIxv2Xjw++QgqTUi+2KrfKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLlCnN8fYSg7i1b6MVwD+BESE/OwDjzXwMuLJExGMBFnya7M3g
	B0KK13Hmz3SFSj0sqOY7mb3F/QeHsHb2XcCR/z+nmGzOvkxT3EGME1vM
X-Gm-Gg: AR+sD11ZkrirtFexzkbDrssq1SM9wp6hkS8NIS0i0KLa0uPCw7rnLr6bpOuTuMafbJt
	mg+j7/f34aU55+fFU1YG3ezUwiOrgHEDsSJV5yGAX8njD3cr1Ylp7pwDhKjMZiSZ9ViKtZ4q7q8
	LkbI9PCz9GuIT5FbcEgsyaftkD1V9JQhKu35+4lUSUm3Oyt/bZ/KVsp3LpHaxD2s9x3woIiS2En
	JZWZd1YYSKYvomixJgngADmkTG5G1jNbZuPSiurLVMNdda4j4zE42tnqrbMSYSwfoXDwOfS/98u
	pl76UyzgkSQ4SeAy9aJLw9yin7M8/CBOmv3murCiUJVDaHLaNVaiX4FmCcuDpAV9rWYacRSaj2C
	MJyPT1qs/wTsjQNsjSGUod69b3Af/lfIyaUlxglSIQVjI7n/w48+rezsy4+dWelCbfdQ5bDSj9f
	CPZ761+edd+U9LLJGwlbQvxyl2Ig5w4qLgQt8F
X-Received: by 2002:a17:902:ce07:b0:2cf:7d0d:ddde with SMTP id d9443c01a7336-2cf7d1d27camr38565945ad.0.1784629730842;
        Tue, 21 Jul 2026 03:28:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:50 -0700 (PDT)
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
Subject: [PATCH v4 19/29] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:50 +0700
Message-ID: <20260721102600.523199-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032851_590140_9D22D27C 
X-CRM114-Status: GOOD (  10.60  )
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
 sound/soc/codecs/rt5665.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..1d987472ba42 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -1208,7 +1209,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1275,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4563,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4601,7 +4600,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("HP Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4620,7 +4620,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("MONO Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4635,9 +4636,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 	regmap_write(rt5665->regmap, RT5665_BIAS_CUR_CTRL_8, 0xa602);
 	regmap_write(rt5665->regmap, RT5665_ASRC_8, 0x0120);
 
-out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0


