Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DB6C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 05:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=; b=xEqI2l2/qWwDEnl66A/GGO0C/Q
	Qu/GlEF8a0YoRm2Kh+P5qnHDS79+oxpinDU/Vddfj6uP7DgaNhvtJZpSjBciNygUfdmKBqg/uNLq0
	0p3C9yNKS+LuwokrpxoBSnQNpwKx27wGLBCxWCGCaoVFSU1VzlrMtFRt1TavcpE7FHcUmbr0x2Gtq
	Lc7yXp7KIF8zXhNiwe6UBfq1ciUXRTgiglY+ox/EJCtDlZ8nKYQPRgTqKJSzE2qd19JsdBLw6M+f5
	buBpFOsd1zsZA0XGNcZ1Kag/GxnMAbhj/49K9NVbJycC/tau9XpOIO+UnEPbmn4f41qMBpyZbQ4Ug
	Vy0F884w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RJ-000000048DY-20uH;
	Fri, 10 Jul 2026 05:06:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RG-000000048BF-1UW9
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso480621b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 22:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659973; x=1784264773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=gYK1+CFYtnXlGqoTT1NVlexvGgUqkp+bOywPo4zbfN1D3zoworNIZ/KKvb+c5S8Y+3
         l8r+x+4ATv5bhVQ1nJeSmoIT2Ad+e07GLyq5bV4k7F+usUeidC8pSbMX89W5E4e2qQzE
         V16WXK+/uT7R3jbSzwQng+uIzbWSUIsGvonWFkXXkhOHVyQfyQvYxUW2qG/mZjJ29D2/
         XZZd3k45TNb9ZMfK1lckEgi8u0MqOrQOV7UGRmznDX02ORU8twSBOdQD/vHJ1qOFAr4J
         mDacH7VbPK2Jqcljdm1pl9uIaFMF53LEJm0TgmLm6ZMeGkWnNugQ4FhNi+7mNC/6kjcV
         QM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659973; x=1784264773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=CO/DRrQ52IelP0SiMs0D0Cy61Kg+3Www0GwG1HR8YweWJmXLs5WxcV7ojvWAlYC2gR
         NO3+ZsesRhMYYGi7Y8xO6KuaDYO2/ONJPYipP+e+IHkn4tmHkE8mRh+dVgSuLNb8yvnv
         3Mtl0pfneOhVZepRXrDB9ITMOCqOqVkKHgx6S3amwly0Hjxjkx+ijxoyrmxBN485O1qS
         2O+lyaNODwnEHjsGSOOa7p3AVOzLbIj1iLB3btY2Wjc7XLZkX2jQVjkUlIl5IP2013Aj
         KAIhjkulUvrQ+3oHRN/iygEZcPaBUc3K+iCOuo4yDyYAOp1b2rOJ4yHQfEHvA/ileetI
         Vecg==
X-Forwarded-Encrypted: i=1; AHgh+Rrd45glGPwpRQntQ+oHvUE2BX8dcFFogcIiCo2s5PhnGjdp/TD2F9amlvaWGCIxQfQjbP4C6gsa8N8roZ2Jhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC21hiYzw8cUIc2L5mCeoHQTEgVO+Q0UgdLbLaHipDGY4lhqAu
	xfifZTKnCazzAAkiS8pFlUEzKgpLnxczmdx7LirADRvRYTObcTXIcBsX
X-Gm-Gg: AfdE7cnMTR+mY0L/xfzPtmGuwvibYde3KMOLgA5RSNZTccQRgP1pgnT0kMDw09qov1/
	x0A1q4BM9chYIby+dVgd8CkmyccnD9OmjeIYjiaSm/neDGsq8r1kgRYqdfJA7gvYmpNTI51i869
	TQDHL7ovcF1AXafg7ftOdbR74OQkzlv8Lcqv9eh4qRf76IeQkJFjSPAWsWj6dL8lDUmiTDmAXa8
	O7JtJVZIWJ038wyj0c7TSnU3Yej74F5j3LvwJ2g/yB+xCDb5UHKL3NRvOZAhklyocmjOlOu6wnX
	rPoi7YljSx3cmRVroAfLALfRY/igNX2kwIiTsZ/bkTvp2dMjjjh52arfQsJCDNrGR2SjhFWdAqa
	Uvpw06zBZazzmE5wBU0eKCqWdXUpyIqBtJSbKN6DGQeyDZFwk+0fzYGU1U/atEvjFOZMkyLbr62
	HnJ239E5PgdaFYU6UswGbNid9iJAVYMe2DHHNQRHqXgCAGrH4a+1XVpxgGSw==
X-Received: by 2002:a05:6a00:98d:b0:848:63c9:ee38 with SMTP id d2e1a72fcca58-84863c9f684mr4368247b3a.39.1783659973416;
        Thu, 09 Jul 2026 22:06:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:13 -0700 (PDT)
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
Subject: [PATCH v3 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:52 +0700
Message-ID: <20260710050511.14439-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220614_398075_6703ECD4 
X-CRM114-Status: GOOD (  11.64  )
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
 sound/soc/codecs/hdmi-codec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..bc2c22436ba6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/core.h>
@@ -452,31 +453,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +484,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +501,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0


