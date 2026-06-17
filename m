Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4F6CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=; b=y++Ec4yuaR/xwyhvp+7toknDJJ
	OnwfTfVLedkbf3J+YisjlUzycSepLBNJJKB9DpjH64qSg8ZyIX8EeCUEa+b596/xgLM7e99ilxIJ1
	I9g7jCWCrlsAMjR7FQWUINj4J+y/kv5omLt8vyPYI7CLVr4be4sAcE+fo1/7Gs0a0a8e5e3WhMJbz
	3VMBkovxTZp3Gbka4ryb5uW20iAMEDv+SBeP/H42BNd3I3BfU33Sdc4S+tUYZA8XVFOv+EJ9CqTl0
	167o0Aio9e2sDsPwJ85JrAlumJ2DJ9+a3sVpPpTjQ2goLFFp1vyBxy1eaElhqA3m7whY76a3R6fdD
	5RwqOAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnh4-0000000H9IZ-3aaU;
	Wed, 17 Jun 2026 10:40:26 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnh2-0000000H9Fn-1xTl
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:40:26 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-13721dfd471so6240140c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692824; x=1782297624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=LilvcNdIbvkAXwzCfhHPbSCCctRc9D02gzW7jIbJEtcMEYo3+RthOu3PrxO7SmJ4pf
         vHnbglvx9ZYHi+1D1ecUwhhSmzcKjSM+55m5raDXAaWnlYZcaxGY/ygshSon5MwBcQlC
         5JjBT3196+F2q7mT6375I+uHKCA9r0CGHe3EuvlYCnOafhUB611DYrZVTF+Do3lEG56h
         Lp50FOsZWnKlRNN53G4F0TIQUBPDGaNYcvPnN22v/MpmUGk5vbiZOo4ukmbEflm7ASwB
         2qMBh4+yV/yJBIg+tyL+ilnqZ/2ZG0JxtKNThd6kD/HKIrGu5EKVSZsGCm3DSlV7/cHx
         ZVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692824; x=1782297624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=BzONGCNeayABKSXi5jZPw2A4KaU4XggmI7uBN+dQKciPMaFlfC80OOEs1uLDIzPOuh
         SBhTr6JnkWn4dAIk2FJCqraLnogi6WceBrunDe4n8fykgb2hlpZJC1nvxtZ+K1VtpHOT
         UG8vAQoNvLpRoD2Fq1E2WnCB9xtQW2YAtUUiiIGhrztKm33l00WRC5Z+5FHdDIrlNgns
         MHQx93M+2z/u+QcbixwXN8omwawchHCGMSGotREKpT/ctAFeHrq4nqDdkq1huF42UDUD
         n60e59dOrAM+O5k+08+eX1yAZPcHjbVPOmTV5fd3Lo+sQlKHLJvJO9byBt/T157BcIib
         ifSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Nrv/xaniyXt3ESlcWfla5EcXLiThY3Deo22IZymP1Cnyf+/FbMw2JEOtz48+BAwn4qzoGUCeJoiyAP6430A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy82EDWPsX0A/qv0SzB5Y5PUdp8UbBGyARtxkCALMkhCZVwDxTo
	tTDuDGBAG3BHAiGlSaKDSExxsdCH1WAmmEKm4tZE+bxZQ/YrBJo/Kdf1
X-Gm-Gg: AfdE7clMqA32Qn1uwp2rfrj5eY89rUSxpF653SJF372grPwiV7ZodzNODbOZozfc4GF
	2jL7+8XGuxBeU4/uB9YZ5sCIZuwxCFdlWORHehqlFfpULkaN9cxajQw/wDujNc47DjnTT0jZhMZ
	1wcHDJJ5AyTZCE0SWhNCp3DIXk0CP9Th01n1wW6/EUz7rrEzBmogiJXtbK/TRhzw+UvqutzD0+r
	N8uNffYYAp7qliCRcQ75PK+aypR4nonFVNRJnyyS1SWjFI3FLqNijLeQ3wI6jBX8pdLFo44iHsJ
	AttVj4g81gfBD2Q9DjsLESIgAeRpyICzaj8YChMybEg69uU3QrR36iwLWwVuZ/IaRUEeAU6YJCd
	Wkcnh+B8ZLrjn1E4ZFHDYNFnKeUizQKwKRHY8gYLksVXuqDFFitLSYwsYKw58E1l0wYH2VgJhQu
	e5pdQrCTMVekPlFVOu1dusLB7DnP7+B9Gny5Rg98fo2hpak73djSaw9bG9gw==
X-Received: by 2002:a05:7301:6583:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-30bca0e2049mr1526809eec.24.1781692823559;
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
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
Subject: [PATCH 47/78] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:04 +0700
Message-ID: <20260617103235.449609-48-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034024_501309_3F2141AD 
X-CRM114-Status: GOOD (  11.16  )
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
 sound/soc/codecs/rt700-sdw.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 30fcca210f05..8b15bbc31ac3 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -416,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +501,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0


