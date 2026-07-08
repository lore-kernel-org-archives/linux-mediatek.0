Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AB8C44501
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=; b=fymmcz4QzAu0n+2cowT4OFikT1
	V2BkCF9xg5CX4/nKeBWoUgEJFfgwhNtjVNeiVVsXogt3GqUp4YlSgKQGssz8zsDz0KzNPAViHqytN
	tzQkTKtyFHMj43N5Xa2vGZay7bxUqYtru9MCSzoWMKQTBaQOnF2wZy3ZwHNlts2214Mjbas3Y+xQz
	lUedl+NyBW+Vi42aMcZS6wGxMg0eTpNIGTBw2Eh/MYColFcGpLisqMqvMd/IcoFkD7XRRZT9kYYDU
	3oERq4setplGbO7Mtj/QuKssSxxfEBpzyB7sYaSdGeTbFTNplERWRKomyj/wd/6q1oHUznQJwyXsG
	WLRn42SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAu-0000000HJ3S-33ZZ;
	Wed, 08 Jul 2026 14:22:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAj-0000000HItL-0gK4
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:22:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caea3f742bso12821805ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520564; x=1784125364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=npTDoh/q1Wvjmit7A2FA1WpSbBGKxBLK9zmlq5Ys7O+LIt4vpwcQs7EqVIabeNirYD
         XPHZLX0Y5WuHluvkMDcFhTxI4jyit87D8E59CA7oCQLDEMTL+0Foqyv+WGt09NaKnP+H
         VFhsKeR9E7fDkwfiDz7J282MOyZO6xLzlB7ZvTHJWaGl9F16DWS33sa77k15zE8zH39u
         izLOcLOGg3xnovhEOLpZfheopiQP29De4NTqnP9R95Mb2fmu02jsVrAqwaspIsVxE3ZR
         62qNaGsUOzMU8ri4x9SQJFsXxKTVw8+5KcUn6m9Kf3tptoMNlL4xXlNBeQbq+D48H/3q
         X8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520564; x=1784125364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=GuY0IYWtYHf8YLD/ZDJSM915eOd0bl41AY/XcBilvr1w/I2nmcCrDljKr97ZJ+Piu/
         4z6xExASWzvBVIS4UGwHXvhnraXH6x+andSMqzzamhFlNnAX0OdeFarzrIDCvXH+CkK1
         HRjD5jgF5+fMQjUskVRt7n9LxiyOIGRFO1qsplXfffqFSrsH4bzypSw5UqEg5idYwVzl
         nI8cuskA2Dst2RlCWJ+7h23vv/TPeSrSe6wFNYaRynhYdQUMeYaR6ipRvqcQpufwcDy3
         /ND7mjfPpa7SRbOA83T23CI23BeZoqvxu0FjPNEK28HTcBVpdDZt+fiVvLxv4wHw2FSZ
         OpHg==
X-Forwarded-Encrypted: i=1; AHgh+RooRolSnBBCGRGV3rp1ymmbHMvCUTeriSHIgkp/XZk7AzqQP/tDs5EEeG8+GMRWGXXub+R1cLYeb7HNWWpVyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw34A4bmChPYZ9D2rm5axh+KvIh+01qt2jRSOu7BbXVCw1OcTi/
	sVcnqKZAbN/0d77Bc3FR8sxtGWXl/8jXapelXNev5QyXHeNgcKl1m/Zo
X-Gm-Gg: AfdE7cleslL/H+gr8r+/cXLEiiQFmQmV/4yLS96qSqeHtaTxgCuh/FxM8Tx9vIIze7g
	wkhsaT7H4TqojCA3r8hDKhrDBuYNKv54jimZMYc9sdkyKVpqNR8pUKau8tg2OBheYwoD/rhQMQz
	NuaxVjpGnklYwcMDkKYpVsgbtRQn3n45UsKPVkhrm1bh0s3F0jqLUm+4V8ueQovRdAhFpfwUYYi
	emX+82H0dtDMpyRLA6v2af+7agbirIUX93cAi9bWRHRe9dN4/WAi8IsUBAFyjwGB0oRJ5WT4gzR
	bKm9xIKfmLU/ooiCWTAal6M/yTwWZ/3DzV9eOf0N8cxTcDrd/vJJTO1j+gnGpySISMXcPV+XMPa
	aw42x3tbkE0tX3n+NvDOX3hpnUIURxrza+F6R4xoqXfAQpH7oivoFM8AY1u4PmjPqtkav1KE4zx
	d7U4YObr3tXvvWbhn1b+b7PXfIEabduCQMCCdR3OKYpCDd504=
X-Received: by 2002:a17:903:234f:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2ccea5962bemr27443295ad.42.1783520564494;
        Wed, 08 Jul 2026 07:22:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:44 -0700 (PDT)
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
Subject: [PATCH v2 27/27] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:34 +0700
Message-ID: <20260708141734.578926-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072245_212799_3D85A1E5 
X-CRM114-Status: GOOD (  14.62  )
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
 sound/soc/codecs/rt722-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.c     |  4 ++--
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 284900933ebf..895b8b2ed607 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -514,13 +515,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -542,13 +543,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..decf9407ab6d 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -294,7 +295,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +318,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


