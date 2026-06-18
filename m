Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA43CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=; b=zAn+J1L5eZL/S5bCy4/c/YgVOq
	S8ZeI9yMyG9b0Ez+F8S8UEb/Hc/Cqj7I/53VF1aoR6l3PJH2S3VRL134mJ1tAn8FCPnRnn7Fh2wqQ
	txhxUY3OpmJn2d9JoMHREG1rfXlfzMUu/V9+YruVcfJFlMCD62L0c5SZn5cg5UCBxLX/+sc8KS3Sg
	42L8+CqsQ0omChUqRRQlZGMcuBaYZQ1pL947VdvqbJFk8ZNzRiJUlqH/AYpeR0XMWZToGmyc2MZOo
	r2ZfglFUC9+LqkGYxQPFUqupJFV0TigwrzIuynJIGjiAkCWdlE9v2gNSX7Iv7gnvz+Fri3fK9E0ZS
	yRBUcQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdL-000000019gB-0PHV;
	Thu, 18 Jun 2026 11:10:07 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdH-000000019dh-3Ics
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0b9328c4aso5614995ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781003; x=1782385803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=tNnmmymnQwCH1vkfkPcVYSAfZLWsS98V7r0I+4gHksLlrckgZ3JmVKBzjkjSYeMaln
         hnmaqIj1kaRrjUiAHsexo6glXSP0DRPqcp5o00zBG6jJe92vgQiRuhrfyEhLeEfzmHDo
         aR38KcUBssngcAr9Lsgr7OShHe71fqIoBtILhJKuv8R6gH7Z1VXwuiUfBXMMvy5bae/0
         P+QYptUwS25HKIyZ0fq1DE05hbMO6G0Gcqe3znCeETmchJr1tEpxXlFzZjk7hpqP45KA
         /3GEfD1+WPdZ+TzYnz6mv9o/OQVPOj8lzRsa30B0KMkgiBUElpr95b8kgRMhDT50tulY
         IrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781003; x=1782385803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=KQRQv/xI9hc1msmhfleRdqS0JKSeK1kP8xihFfXt+54e2POZ+0oKr9B2qihROlAa7N
         EUXkDIwDbL7ntYpBJ20J2/cGQbxxOaI0oGEJAgWUW1i3HVINE9Zbzca6yY4PB7pzT6qD
         EYHFiVXVKnUubBao8bnbtJ4Ltt+WeKlYU/ISlVTcX1Wrd1PabTkyvSrhrD5onHroZt/V
         r2HPjC+wWH23cQ7yLpipI0Z8YoluzrirzABKeTaZZmgZ5pDoiW0h8eXZTSTAJZRZUlGA
         /lJ/ljS4FTSyLHQ9pMgqrRX0MzuMQht8RgQ8ObjbGAJrje9pA03CkOIesyEiPtO+AkY+
         PgbA==
X-Forwarded-Encrypted: i=1; AFNElJ8EE4VrZ/DoXhseYlRFcXre7m4fDiiFHidoHm42MwUbKHY1epvAiBczxSV/r1rWrVh0fvMpbXm93F1jW4DV3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0pQyT28mbMvjyQ+Y31Ez/A7Y9oJEFWIphbqoi8b/DEGd3N5XJ
	lfyTSRTwCVQCe1jzfQE1R+PQoU1TSNdXENJukQqbTqYh68RXuuxp97in
X-Gm-Gg: AfdE7cnZBH7UW7kpUnu5KJkr/OV7ufl2xMd2ke7KdtKPLRIpUEc+lqOdznshBtgxTi8
	YUeYbBb1xDn5Ev5vjASTmEc3tF+tFRd2LyZZ3Esw2fVeBZYR+CqMqV7VkB7p0IohxfF3N64Uz6g
	orEru5RU/cyWquqIwShPYzEY/5xONKZGhKg/JDHnmSEhugw5bYUHwuoLxxvsdPPcw9/QBIS5xZY
	jz9tWMeryXw4KyVFSr1KvGTS86S+0A9q0RR10+2Maa7BxcK5ffIE+CwuhCJ/MQxXGr/wK32wJSH
	3eqvTm3ZLMFXcorCSKLR6uW77CLw7dmUm9iTIrPpZ5Gc9x4ZKzn9YQP9UFacpzsDde24ACYCyDd
	gDD1LXEk61UMD/YYOx+KSTiVYCejFhoraR+LYT89ZMTrTdw0/jk6n69wLjsoJ0rLLKcL+asM7p6
	CVm4yhjve3sSC/xzZBOPKpV9ZLVK8B5ZDPbkD+bZlNr64ZxI0=
X-Received: by 2002:a17:903:249:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2c6f347409fmr21914825ad.31.1781781003000;
        Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:02 -0700 (PDT)
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
Subject: [PATCH 65/78] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:14 +0700
Message-ID: <20260618110827.232983-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041003_828652_C0C30078 
X-CRM114-Status: GOOD (  13.03  )
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
 sound/soc/codecs/wcd937x.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index e0169e783ee9..8336316866ea 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1056,7 +1056,7 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
 		wcd937x->pullup_ref[micb_index]++;
@@ -1136,7 +1136,6 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		}
 		break;
 	}
-	mutex_unlock(&wcd937x->micb_lock);
 
 	return 0;
 }
@@ -1460,7 +1459,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1475,7 +1474,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -1490,15 +1489,11 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD937X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD937X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -1519,9 +1514,8 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd937x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0


