Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0D2C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=; b=ztL5RJpfa8O6bUXfbAasq0d2ya
	Ua8gCc2Vbve1cxrKYkccncAuP8OLV69ky9gfazMzCaQWARjZYT0S+DaoVRqKeuaAVrB6sD1SrDci4
	Fax3gE4QJts7BBTf2Rbdej+2nQ9G/qEkUDwhVm6tDH+ex6u1PWsbxW2M5JNue1SGTlDp1fYN94wpR
	gjBk8XA2gqOoaw5LfabCjl+17MHnvoOtrT5uvwelszQYkWOasE9ql7yT2hSgnWNr7VjAeyJiO1dEc
	M3JJg+IFClQm414BjYFWNoi6YgFOslinTtquWY9NLyRVRxULMWbNKoXmnLNm2p4+CSt0Dl9b4hWri
	VM0IMEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9p-0000000HIAT-36AQ;
	Wed, 08 Jul 2026 14:21:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9e-0000000HHzY-49qY
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so10647765ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520498; x=1784125298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=a+0rRsGYdwWnRKD+cgKO4ArWWuFbVAOfOTsaopDRpsEpCKjKNRgMQxTNic10N1ITjW
         aTup8QdVWtlcREAPvuVj5IRhCh3jZbCz42/Z+bDbr3qa2divlkaHEa8niyXYYxzKmE3G
         Bx/lAYlgoPPmtohBiYg1Mey2x35tohcTUaMnA8kQiM70d/58NZEjfUMf/YV8FH/21g56
         NyjGZVYu/nzdJWPPI3XQ/Tj7BSXuv1xrxpjZlWgUxto7E2Uks0jhsoMu5jHTem1lLgGJ
         fr8OSEMjb3o+q2p0OKjoNHoTTAD3HuDfPnp8pjWgH9M0ZcePcJBm9s7ppwu1WJVPhdL3
         k8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520498; x=1784125298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=sB7hE0SZ7I12K0G0/tAcpQbA+bsjiIHBOKPd0VLPzDdyGRJrq3GAZjNea9CQIwNioA
         KHvHMULPzqP3VrNCUf2yAE33YzV4M/nKfdHsWxwIfrtPKWn97Ev07Bxr41vIt7vcwxJO
         HigCGn88LPZQEOywfNpBP+is4HekC2QrRqCQ3RM973TRzMO0W93a1K/Q6p4Bd449Dn1W
         l6gCxPYb5QhoSMgBRYp5CQO/Tcp+MzQV4jTw/XxYKa6+ywoj45+WaQHqsj9erTID3ky1
         SVg6lHsQMtZAh/Z4SayhCvv31W22eCHJ8JNMCvOP96qNB5eqzOacnGmoi7os0RubeKcB
         kbcg==
X-Forwarded-Encrypted: i=1; AHgh+RotxnwPdkz4hp4YYQNN/tXnOOo38EzZmEwecYVotMf+AMRtPujLZiRHUDU65TD/esVxRF65KYEZvGcBZ8ettA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaFDZdpdoWjzHnmW2DXETV8qhJOaPa8MjoQTKPL+4BxknMUxCA
	SnAsOfpU9xmfLpKYLyPHk59JAp4ugZMD6nNKbFqHzeE4HYvXOWpseSGc
X-Gm-Gg: AfdE7clH4hvvmxsakqOFu1+A/1XK276PrNVnltT9Um7pfE3wLnhSm/u9K9UU5uDGPGH
	uqMtJm8/JkHeqL4i6ulXrKte7bfxN6jFjhW0lKn5sH3SjZewkRGyU6w55emgwWbLg7OVhvj95t5
	ChB1oI57fWPSSFBf8U1Kh+le2G6soelwNe5ln1JK+h9y3PltXHEoA20HjivFsBlm3qXgLuXiule
	yaebbiS7cCfEIcOTWQxQOrgy7MiVplCoIJuN+R8i32/Oufi7kSJFxhky5+FAL3wO5lhkNs/iY7h
	5GSQOWvreYg+tDZsUhxS5ZdOL21GNcaU1oJ67t/Ig/E5m0TAzRpwF+o6hq9x+9Sa+lyLBbFYcCc
	F1k/+EUF/pw8MpNEuNr+zfeLaLVm3h3YfSVVMGoa/2y2SAJw8JRWUNTfvKRtv9VKSdnDMX3yMKP
	Kqc/dr5mRZ7blI1TGwAnJmggN5frSPqX+DFERELjH7U30lPQE=
X-Received: by 2002:a17:902:ebd2:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2ccea39354fmr32045325ad.18.1783520498057;
        Wed, 08 Jul 2026 07:21:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:37 -0700 (PDT)
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
Subject: [PATCH v2 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:26 +0700
Message-ID: <20260708141734.578926-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072139_090313_997CC1B1 
X-CRM114-Status: GOOD (  11.05  )
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


