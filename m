Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D85C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=; b=wd00B0Qh4VVb4ZxYsG1x6lIgYY
	A4OhyLvk4C00xgx2OalHXL4NUc6y9RSg9ZE0n1ynW04fh8lKfVPda705vrTOZ6EsEi8xc/JRb3qkc
	V5mzZ9djUHOHS7pNGt4Uj5Z5675J2HelQJvEQumdXszRlaXMlUjscehUw/OyvjPqLwSJLkrC8ZmlV
	k50k2YcSvK91nzKyOzMqytUnt0uX50WNBfaOXxOVsQG56qnzmF5jIfzJ7+MTkIovGAy76VXh/OTiH
	Da8gkzk02nwI/Ho4dAdYR//xPvyoxqo06lG1FyMJ9bRadIQKLwN+EHqoEw2/jxXuiQwZYIVJqfUw/
	O5bw3/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3TL-00000004A2P-1Lph;
	Fri, 10 Jul 2026 05:08:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3TI-000000049zB-15zr
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:08:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8487214ad2bso625238b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660099; x=1784264899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=ojcXfYfpQvw5a7W1ad7PF1fujwZ/syRt6s9qyrZ018M01tIkCUaWHhAsW1cBPM3rJi
         8vQADCngtpvomm70DE2s8rknVGAkePr1yA4ftc+mCCETUlPna1DAxMhsDQ4ASV0DIro6
         F2kbpZO7SwbvbWnlayuhl5lj7iwfwEgMapcYg+i1xcLItXD53fuzyHWE1/iF9y2hAiES
         C4ahQrhipXzlFTGrYI0aOEFwJKadBEz3KTfQxr5nfT+TIzmZQ33talAjQBp1h8JqLslG
         xLMCvLaCsLEBCKYSmOewArzeMzAK/T/ZcuKm6/meby6OuyFpVNyYNcGFtmwXjpQXj0rz
         Ekfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660099; x=1784264899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=kzTPcOsaGSx2/4/7WdYwS9GgW3Ug7gxhlzfNmlOJlnDz2SDKBvygmdfA6ly8iKn08C
         37OHSqZspvujVgHwffy33hFgY1ozAPsfMy/0MiE9DJkItleNkBk2KZT7NG9hXe81Sq0K
         j6GYppP4Uzls9OxGvP3KHjWPM/0OsE48CSFbTsiFi9gGBi8TV8r5lKvWP3Dy7ckJw+8p
         jhu9B9rWWAFLLqSzfz8GQaPl8wbIQVKg8brKE7+4aQnoJPS6BlJkX6FJCkS8Yz9PQHZ8
         kSNsgkPndRxWeDB6KpPUpaTw6b0ym8WwxLy+ut+8InvaFL+AOrU+XtF84UA1BUus202Q
         TzCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrss14Hf6r4rQcwgSXCIk119MH/y/ZpxPl4bBeXGno5Op1b+bdXrzqPju5x+74AbNeP/BDIXchbRpFjXJTiHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyEoM6wP0//SPZJaUtWGIeaEi18TcsqPzytTLWGvgftvrSo8+M
	sn1RChBho8UdCO3FZyjtA+Pvk/VrmEEyLVpX5UCdV5C1TCKO3EpoFMwg
X-Gm-Gg: AfdE7cl4djH/v0F1dHii3O84IJd7R0ndAYi3xxcLuFGwxaCDHjoHJXFbOzsgQjgz8OA
	L37H6gGFRybiwy3oC11wfzhHey2aAL1Xd7j5m4e5a2vGAq1dclEDGr7yZknBZmNqRSc9T091GZn
	MQ0XIrx1/CN2tJoJyVhutIWFnVAal8nfe2ULsGCxJAneStgM38Q6hVYyVYBysWBCEEbDWKnzCEG
	L6LRGoVBxNFXrMkFvqtSVNjU31j14nbYyB3OZc12W/x4PsruFNYeMUzxi4zmA0AxgGmlzqkoHCa
	ZuwJXhLza2foOSRTpFcaJ8ydNgXQE+05f9F+HYHMGXXNOWrm7iZGkONDpBOwI224hLUPq7ndci1
	Z8Yzc22IH58npI4HyTArJCn1rMAYpQ+m4ZLRQgdoIk9zh8MZIrNd9ajW3QHWdU38uC5KN5+vcqs
	tEtZMY7aypLQpXor6KuG2LpOkqp0CPom/bDRWzp7xnAWSCDuI=
X-Received: by 2002:a05:6a00:1826:b0:848:2c2e:c7a3 with SMTP id d2e1a72fcca58-8484323444cmr9691356b3a.16.1783660099554;
        Thu, 09 Jul 2026 22:08:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:19 -0700 (PDT)
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
Subject: [PATCH v3 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:07 +0700
Message-ID: <20260710050511.14439-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220820_327960_56DE863E 
X-CRM114-Status: GOOD (  11.89  )
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
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index bb449f08e30c..3ba0cc37acd9 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw.h>
@@ -415,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
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
@@ -499,11 +499,11 @@ static int rt700_dev_system_suspend(struct device *dev)
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


