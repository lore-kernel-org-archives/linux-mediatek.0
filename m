Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC8EC44506
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=; b=JO/DZvUgemHLJpuE8KTNvK+96Z
	moiyUtanNG++RGZ6Hl7mm/Em305V/ECr7/kflZ/HqfUSyAENUDVq1E1tj/D4sSuQY2JUtavl4LCX2
	kch+DraCtUrHyJdjHmAFiCMFBuoeP35ISeUK74VgyzA0t/WpF4sE3CGNn1VBNk3CYWnBNIhBW/3l9
	P+Rv/tRvnN2lNi7br4PQHVKrMqMlxidKhkacMt+sET+5CLwEJhD7C7byoqiVy4g4YwhevCDIi/iD6
	7Rb4M8btt0rUYXOg+H4M6zmwUJF2/tphMcOE4+zCq6rCvAOhIFwSRo32CmaCjgc/NQzJk/oouCLDG
	mPYN497w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Tl-00000004APX-1P5b;
	Fri, 10 Jul 2026 05:08:49 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Th-00000004ALy-3tRX
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:08:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so92493b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660125; x=1784264925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=;
        b=sg6hD+IvMlIzfx4hi31Go0qO1RwQeUjqXOsiqINSFBiBncgQ/gC74CxEgeuWl7swp9
         2BI1Oz3WgL8K8fgWZJs1r++X7lRnZXZM6M4nBMWZpMaRbNaGGoikLYOwx+1qhjjjwBun
         bqpY29ZtmWCBp0Y7LZ5awpI7HEZwYyLLFlMIRxzG0MV4ZS5T5Cdl2SmEDpaghT/3zT6V
         1IwymvKPLVUczxPh8FfT3slEYiSGHlHYK1NA1K7yth6V+GL255O8MOTEAg8FZKlOWJyE
         kI3E78xve28sewmb8+CAMEWksrodKssm9W/q1O+OfqWddahiTdHrG8kGZ25DiRefHgaI
         /fYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660125; x=1784264925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=;
        b=tCiB+AsylBmA//FvmpVWgHJZ+pLJQcT1+RVbDqYH4iM525YqlBd9nz4V/uDCKdnkSg
         Gr2Ze/lwBEoI8ecdLQYoFlDcPOLbaORHAXoULy0rfaPelGFx59CIYn7SrRInk44euHuy
         I9OUw9R1BA4ytU4iKTIbtD0wo6lbte/NNTYIFnEjywGV82h6MznAOHHy+ZeT7gyufiid
         7zvRETINRaet5AhBRZ1pFq3QI4Z/NDkpkdq7Yp44/ym0Jh3nzl0BJklS/N3JZbRo8/rd
         T+xvdy2hppf0Btod1baRu9DdUY0gFE34Go0DJk4NACB4wRoulEtK3pby6gesjDrnj9u+
         RTEw==
X-Forwarded-Encrypted: i=1; AHgh+RpWJybkNi5EoTMITeCWeX2KP4DWd7xPeZIHtlOm5ZIm/coFiiTBUxeNr7PSn3o+2Nc/83XWi6Pb2m4E8iD44A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFkaKNHTqIF1wd34bjvWyrCTxlSoztuO26B2V5u35WeBBkebAb
	BDUbhamlnvyB6vGoMOs12LoDjUH5kP/uoOl9/O/hGWKTnB4vneHCHje3
X-Gm-Gg: AfdE7cnnf5gbaA2Lui0N8eLa/DixlFiBO9rmadTjw3gYNUalNo/mlOe4OgPUCW6Y2IM
	RfCLNCeqBGnH1j9gB74cKTPAqnn6URN5aXdMaRgia6CjaRISjHeYS0uWosVg3zgt3ETmAi2/qzK
	vVKPUj+4CoLiGrWVdrWe0/soR4lKsNeDn8o5cN2ifuAu500zM3t2WdZ2476HlzMvJY7PoQkD/3W
	Skx8CqCRp466nga+4uTxbb4aYVpWAMI6EYvaxj0hzCtmOBgS6g1TNGyfJXSE9tA1Ge/PMbzNqAP
	n+epzBRGo/GXxOQx3/gFPBPNXS5NDC+B9wQOPnFZU/d65LMVqsepG2v2ESKWPLmhQC/kotew5kJ
	/Vg2goFxsv1UAHFVAgMfC8ALkoXjCZOl6Eg0zZ2tZLbjXQTcHOYBuKW4n86HHxoP1eh4MKbKWn/
	JZFl8ovia34m4+uQ3U184wIH1bcMl575oxFa1BjscbfGTGzfw=
X-Received: by 2002:a05:6a00:a02:b0:848:2f73:8fff with SMTP id d2e1a72fcca58-848436944cfmr10668853b3a.72.1783660125218;
        Thu, 09 Jul 2026 22:08:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:44 -0700 (PDT)
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
Subject: [PATCH v3 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:10 +0700
Message-ID: <20260710050511.14439-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220845_974795_D2C05776 
X-CRM114-Status: GOOD (  13.47  )
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 041b381e582b..d54f3f2d5bdd 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -466,13 +467,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -494,13 +495,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..159c35d19dba 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -5,7 +5,7 @@
 // Copyright(c) 2024 Realtek Semiconductor Corp.
 //
 //
-
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


