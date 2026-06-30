Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF3AC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=; b=1e6RspqWNg45E+7LhsZE/31Faw
	rXEh+tbfFHkQeSohXV+fsido3vgNUMHBLTCb7RV7/hBWlMqAlEbARDcJeLf3/E111pt9+yBqI4hVW
	SLytRW3CpwhNrAMkwQKi/4GjjKui/JeVW8Av2uz/nEzbDUJSJ4AU0MozvGeUPAKbNiyT0KY+TJ+AD
	bI6R4rL46hfl8auqVVJzmIXcI005OGlCbeGiDhBlcCQ6mMqTMPp3ynOErzz35WX3v2f/clSRqJcIR
	EH0tTBm2jR6VZmzvIsPGxoj8HMk0ZGqplUvGmtAN+s+WPEJ2+VbARcaGwVQEWlRmBERsYvCuwvqlH
	ir4ffctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6G-0000000Fzb4-07Gf;
	Tue, 30 Jun 2026 06:37:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6D-0000000FzXU-1CZe
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so165786b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801456; x=1783406256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=RvQmI9cJHWM7mOMQ49DgOlpzOrO1bRdA3yldL1PiUPni97uMDV49kT4BZONhIOzY6T
         F+7C5z73wtT8hujkubK7YhsEvY5j0Xo7ofdqsmu2YxLFlA3hk2HJvIwBovs7E79loDZp
         4Ay7EIDKwH/fQeW1eo1YY20c3vZDBeIoarscVYJOfMttrGvSMWKlFhPJijhGF0sNS0Oj
         HTmoonG+da9lLo3RzKLkqaugOuUbGgpl4fHy56Bg0+knlv06slCMZnGIXdepzNjnKD0r
         yQv26nqB9taMYIrw5Q9S3So/y+g7p46uXJT9+VHZX2cNvoeMpTc6L8iLDkeJHDqNx9Rm
         VO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801456; x=1783406256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=bo7WwbCJiVOdNYRI3OMtx7KTP1WvJm62JorUhP/MoPyYra7tV9rrmK2IQ7kJeecInj
         Qi/UMWKksSumH4E587Zebd5hI61ebURcXg9o1Pzannd4080gY6q8DuqdxpV4Gyip60rk
         WsRTW9z0MW9fN1kckOyKu2lhaVbFGMHo5Tc1+sGSl5VmaCbTslhMkeDd7fHnrsQIJVnw
         k0PeiUGl+hmDRtVXN9cKwLptM3RBEUtm0SAVycu0zvH4vPYBjbINiVBIAeL391/lC3cx
         dHuwmGI8KafjZwtyLfrwHTHkB3GSW+oEJxMMgmlOo+esIVifnJSo73rbSh+xATLQ8CfF
         8Q+A==
X-Forwarded-Encrypted: i=1; AHgh+RoFrojFyIJ1jvCZCG0+67Q7oWgJzvJklKOJ4Nc86Ta71uhrquPIEswb6Fphdegkz3DbPyOgU0nYjFmSc5aNQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDbmqvu4nqAVlreqJu+rnyNJnyZy7LxsVph5NyM5LnNHLIXS+l
	7BTr5nyGT/DX8TV1+L8Qmre+mRVAcMHcqrUuwat2C+kUTgjMuJfhFGbV
X-Gm-Gg: AfdE7clfWfIB1RgzjZQaZmZSCq3gXC9OU14gVUQkbdd1ugcX7ttTz1BrcLrV7txJzUw
	us6WYFTJW1W7r0ppbRIRWHeO2RzxfFUhPzXWZYEwaq24FAhYNoxmQK17lIvNwI27J4s2bEpJNQK
	q3qJ7TALpP/ih2KnAjvxacmiPp5RCgS+fdWnC99mH6inhX1JSW6Qk33xAiNywfE6LWXj5MBWXgg
	a3Gnd5bVmyI9LG8FYHBMqJJTVGzMGL2D9303CqIjeoCg67+kbetzzi5Xx3x6C8PeejJ5+b7bIdA
	dovZj/HLM6Oi6FXOvQ89dPmB6KTl2riOo2Il37L0NZQSPdshotIxBe4kLB/aE1WE+NhB6VhAhtT
	HUGDK9BdDV0BIzV+UbEpK1qtpe+Whfy7lqmVG/zNPKv1TjjafLdLyD1X4Q4iWI9D5oklfqaqtsT
	WhOUezN7EAgvWiUZgXnf6HF31UEoDVe1sn0h4n8a/9DThYnrs=
X-Received: by 2002:a05:6a00:3d04:b0:837:f111:b70 with SMTP id d2e1a72fcca58-847a81835d1mr428150b3a.4.1782801456574;
        Mon, 29 Jun 2026 23:37:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:36 -0700 (PDT)
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
Subject: [PATCH 17/27] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:39 +0700
Message-ID: <20260630063449.503996-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233737_732467_F23FBA22 
X-CRM114-Status: GOOD (  12.09  )
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


