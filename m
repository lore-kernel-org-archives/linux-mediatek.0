Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6927AC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=; b=ChxIPPEt2NJXUyEEWo39FpM/X8
	eJZZ6G0bEZZgPvZJ0l6RktIWDnU5hDJfRdywLjbkPizl8h5yqEXhyZ/omg+NM9iLkwpgbnZ0mvM+b
	Vko1mAdaSLUI9YaxYGgAZpHg0AhwyBuswKnou2ZF93jBrUCsdcfjKOP3TUbC3Rxq1INA9iNgnrBMF
	nZ4eQqu8ym8vYD8AyE9IagejLdgEXNYQ788NCdKJw9WC8MQ691yAIwc9MwDBY7UB22eAg8B2wq6kF
	KuRmkwQkoPp8Tv3x9qNlJbNkW+QNl8E4Wbxz2SxNvEj7tCPHoySYJAwyussL6Rdp/kJitZEnaEJz5
	NmuJN6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9S-0000000HHnY-2ekx;
	Wed, 08 Jul 2026 14:21:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9O-0000000HHjt-3GPH
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:25 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cc84e77e78so6167635ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520482; x=1784125282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=lVYmMGEHLsGsrxoueXVIOZRGRMQndQJS6bL6YvztEawgsbMWAdYFw9sw+o3Ge908fR
         6pRK3m7WgtExANYYizfYXITo+vtC2gpyWzvlvSVfVnZeYYpHWGSNytwGVo9RoHwl5PRn
         RoNW5l5EsEvd47uoDfkMw7DLqllhGU7k4X7r1A3EIYBvIRyDPzN1zDVe8WW5E3D/zM/m
         gIWljH43ctJeUQqGashyGjfwfpipw1vYPnd/jIZGX/hQv5N+HtPmXng8RIIc5Aa62NDJ
         07UKNEQBhl5CPFlxGKuJdXlASpEk5iSNxGYhmSKGR6Y1ckaMLu5K5qV6Z+reKhgAFHOx
         Guxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520482; x=1784125282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=RYt7irgpORXo023yAsGBrUVD6ypH8btUPbGGlYlxYOZNaRkGsL0TMOua0o7H3hgKa6
         dFC1JaPeCncfi+BmpzCxOqvridwt5JxZ5iNRSkvwK1+Ewc5EcFfUI3fh86p7m80Ue5mQ
         DSXawpDv0AEBaTQWh1Yo/10zy1xVqyu16VGLpYWKMGrZy2eN6Wa7XtcJnY8WFXc3C3tu
         kjH2r4vReRR7r+lGa0p+alxY5sT3oermp2+/a14JjzYFiTE5SK62GKH7yTyjPYPZSb0f
         NHsMG9CnMEzqTIubI3GM7imWO7HuRPPwmAI6rhDMOuiguv6T/yUqSAa6vftZrKxMZ97T
         3hSg==
X-Forwarded-Encrypted: i=1; AHgh+RoN5NSFdsnfT9h98NiZ9NPkyGItn5Q8QvRlSLcCHKwlSlZP1r/sya4PXNncmDdNq7hovcpDLM7kBDx35ux5PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ1zkX9YwBvY7D607eGBmAYG4fo+b7sb85M6q+iWQBzlFYyxuO
	H2eVVEyD93mcy/8Pm4QMmkRckRhwAxbkt4silAnghedmen/AxCvAfzIx
X-Gm-Gg: AfdE7cnL2P6tG+mg6IW74ck/O8OIq+c5EFDWtym1xWwxmCJU7c5Ik2CHZHeXfO7mmA6
	ucIcONfX7BKvio2HFH50rmVvbK+oivVbeGouks3eHFrWsMujnp9SoV1LLASUcYPYpl0F0Fb3LrS
	h/EEnlWGB7apQpCXuxl+cV3oDVkRFmZfAZf9dpb0aKr1XnF+smxoIa9CLLzVAOwQYFNQcpSUGCT
	NULUZgK1Wsvqle+3rGIlOOBudqa3wKTX4HELcyJU43kY5B+sr8bUTgLBh19Sy5iq0pJ2u/6N2+v
	Ihv3388WapP9128hzON55Ax2mm/5FoYXCJxSdhZ61DQ/MnJoX4fSeUD0USiPv7cBs6/95Ei5LOQ
	vrFZwUh8wXwNXdgMvpOqYaraR+bRR5FbUa9rZqxiOj+lkbVqWBiu0rU6Og05L1v4SA6jJnFonJI
	/2tZ7naLL9kqQFjnrN0fTEnyQfyH0LUNTf3ZTHHB8SZOaeFaE=
X-Received: by 2002:a17:903:4684:b0:2ca:9ab:e723 with SMTP id d9443c01a7336-2ccea481a57mr30746255ad.33.1783520482185;
        Wed, 08 Jul 2026 07:21:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:21 -0700 (PDT)
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
Subject: [PATCH v2 17/27] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:24 +0700
Message-ID: <20260708141734.578926-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072122_828421_54E60F1C 
X-CRM114-Status: GOOD (  12.67  )
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


