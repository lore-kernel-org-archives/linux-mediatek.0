Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CAAC4452D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=; b=sLFyYoQ5michsIf6vxPLBsE6Y6
	9sZy9+6uHv+jlcXl7Bisho6UKczQKziQ/7t0ZCdAEmyqkZhn3Rw2aFyxLZ4LQf48AI4EkHUbh7Uzo
	oli388R0NIw1iHkgPM7QWaCvdit+X5IgJrPFZ/kR01jmu8i5VLKkVTD7mgf1r+KuZDONRkqsBZuIy
	tBbS35uXDYTqmk9JRr0mPJKfbF63u6p5Q1PZs9Wddpvhjqx4R8kvx1TLQ6wvae67O8AHU49Ddju6N
	fjxy6iDtkpCeQV2ByoXM3XMVWlykHnVdT0CB9wy/X6k1pV5J4YzurKQNIquftf9Arl+4Y7gST47S9
	qYj0CPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iN-000000099v4-0iYf;
	Tue, 21 Jul 2026 10:28:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iG-000000099o9-07gb
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2caea3f742bso132678895ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629715; x=1785234515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=KFydPjcr1c3maGXJaU/DdaClOr8gpBCEIlYJSiE8I9SiFlyofe+SKGu/GI/e2qLg1z
         VhyrLIHDlejdDfOx67Ow593WY6H4Ab6rSS6NLvT7JLwGAQrassWRyBYsxfoIF4m4PvVV
         UGxRvSEAKldysBDhgxZi6tnOtDriBNbdmHIURcdf7Pyqg7SWs0tWfKVqVpLpDnOl3fFr
         ybL88t+OmQUWkSQ8ycg6SS/xVK7erV/YCPCZTLdo4la8kvano7eYBn0VremLudJGcREA
         YK84a2qPN7OySFf5oe/8I/BlYpcTMP3MpI8Lq2QUVxJ92SzhMs80Z0PzuXb4qnKOm0Qu
         tLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629715; x=1785234515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=CTelZR9HlQ06IFF58AGh2IyZ7qiljVeG89qYFGPzAcSUNPIG5DcOtANED4n3RnzSAz
         JusTDxT+QHPOcxW+TdUpVGzjG380NdaPkALwShl4dMvuZftbBZltuy9KR+vuZXWEPmuk
         mT9Ut0kSSgw0zCT0hukFq/gDqKgUhyy2QzX3nZ8ujrMaX8kYYv/APRpneGZaHFvZxhYY
         JYip9WaYAHuxtSh+sl5L38FDQRJ7QNDbKnXGJ+lqep39EPza8Zm/USNCG6RbKhtRruCo
         hsXtxOEUUprYme/xVMfBPdGuU8K/gsGGcAD+n/Vb5TI0kTYRcN5b/OitjG9DwyAUVXj3
         NhQw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/rf8oooC74cG2RD3bVm32hlNq6zYDgGiVBTDILSpTs3eRGTMJbWhGSBsSVsnqvDWD3Mn24yagiNniYqaHMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI7btANtf1mIR9inYQAtrUI7rmtrq3Iu69pZjvMlOjCzr1F60J
	yfpCiWsi7+JoGow2VnI49CkKgrfPAYVRCmjhkNb4AR/Bn3ICdxbdF0uw
X-Gm-Gg: AR+sD12pGFC+wWk5IRPUFqlXg2gIf2fEbNkCvDnz7Hjlp7bu9/lF+VhboEEHxYBAbtW
	BPS0whIBIFzQr7v0et0Ri9qgedGqllXNoIAoRhwt2VlIz0vADWF3WJ6VJ0Yu6QEI+3v7t6G5Rnv
	gh+M+IywvWV+hk0SlpD51K2t4he+4jO0ciQhMxIul/jQsBaHeHbyDSZh0SHu3HWy8yD6pyrjZyC
	pqpbzxUPbPDR2fyGqbpmPY/Z/kAVXTU8KbXnP8i/EMdGV+IrAsEHLlicTRrQYuA/6uR+pfAtD0g
	EttbJyqYmevRwT0hcRc032Wba2xykYWcPlbBK4DFebCSp/DR8yKeh0AHLIp17eDHAOf1Se/kvmB
	acM4aBbx6EWVXs7vbwfIjVus3FpXswMxyHqmEeRQW4twBzE6cYFZExmsmcJg+FflpgN9/BCTDOG
	ExKURI1s8i8hf/H5OlztAmJLdTeCm1eYtZ/aHJ
X-Received: by 2002:a17:902:cecd:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2cf34a4c9d7mr187717855ad.40.1784629715407;
        Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
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
Subject: [PATCH v4 17/29] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:48 +0700
Message-ID: <20260721102600.523199-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032836_128941_2E31309D 
X-CRM114-Status: GOOD (  12.22  )
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
 sound/soc/codecs/rt5514-spi.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 199507d12841..91290bfe8daa 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -6,6 +6,7 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/spi/spi.h>
@@ -79,17 +80,17 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	unsigned int cur_wp, remain_data;
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	if (!rt5514_dsp->substream) {
 		dev_err(rt5514_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5514_dsp->substream->runtime;
 	period_bytes = snd_pcm_lib_period_bytes(rt5514_dsp->substream);
 	if (!period_bytes) {
 		schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-		goto done;
+		return;
 	}
 
 	if (rt5514_dsp->buf_size % period_bytes)
@@ -111,7 +112,7 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 
 		if (remain_data < period_bytes) {
 			schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-			goto done;
+			return;
 		}
 	}
 
@@ -146,9 +147,6 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	snd_pcm_period_elapsed(rt5514_dsp->substream);
 
 	schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-
-done:
-	mutex_unlock(&rt5514_dsp->dma_lock);
 }
 
 static void rt5514_schedule_copy(struct rt5514_dsp *rt5514_dsp)
@@ -216,7 +214,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 		snd_soc_component_get_drvdata(component);
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -225,8 +223,6 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	if (buf[0] & RT5514_IRQ_STATUS_BIT)
 		rt5514_schedule_copy(rt5514_dsp);
 
-	mutex_unlock(&rt5514_dsp->dma_lock);
-
 	return 0;
 }
 
@@ -236,9 +232,8 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5514_dsp->dma_lock);
-	rt5514_dsp->substream = NULL;
-	mutex_unlock(&rt5514_dsp->dma_lock);
+	scoped_guard(mutex, &rt5514_dsp->dma_lock)
+		rt5514_dsp->substream = NULL;
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-- 
2.43.0


