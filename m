Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0228FCD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=; b=wc61cLrc1SVAkDpLK25NQPLeR7
	cRfm6TOpQIP6uJWnKInQNW3z/SOmeurTrZPu/F3Kl9zarpmD6YPY3YBovy8mFFwosPLvwTIkdHN1H
	klLzwa4VnIZFN7OQdqB/6c05T4lAsRtqHHg4B4ZDH0iDXKan1wxyUAfb4CFaZ2Yl2254zG6yswoZ7
	PLEsJY8GLG77UfzNfp0Yh6M9TgfLxUwrN+yC6IqcNep+PxLqqGM+W+Bpa1WsqJbo1ITs05cWYFnyr
	+0oSQU9fSuHdlEUlLjrMLP/dH1mTVFrpPQpMaNINuh/19G4wBe/2h8eVA25Xe7ocJFlg4t2o3ZMmU
	RT82Iq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdC-000000019ZL-49Xh;
	Thu, 18 Jun 2026 11:09:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAd9-000000019WF-1cYu
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:09:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so7311585ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780994; x=1782385794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=;
        b=VSaWI3zQVKqX+j4BEHgS2hjqqOl+hSMf619L6bf89yOyAbVez+tZPhJZluGAzobibN
         +bhtoo0RN0KrGA6rc2p3KpNMx2876jfvJYXUTaUxnCu4owz3rUnkCczuV0u49v9kOiys
         8TuqvlyCHztmDrCZBoDgvaQt6GR8WtOFi4eKL4A+GXfFnpLQihviOH4+DfkE85IYTzDY
         aIjd7O++oNLOhElz/LSaTBTZnaOQcSLq/ftwnzlDJSeyOlGnLQiun1sp7MpbGjb6qzqJ
         F8qp2bl04ULOJvCXbKx4M2mk0rop3wjrnKw02HC0HTaH7w2kuqqqQz6DdIKFvIVaO/vD
         PzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780994; x=1782385794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=;
        b=gniN4P03bu147uHsJgdpErEWgduMQDOKnShyxay+wX5wuWNf0YFfHGZIqiEsHTywlJ
         w+NFKfqSCq+/0PwFLJVnRI1YBmDRGcBEgHeznogDAQYjT368k8X1LbErhz8mOpYOWQT4
         DQZ2A1hF4x+F+QPro5g37h4fERtqIsP1ymcjgULTdSJ1iBkRUw7+r1AFoyy8pFz5S1RH
         VVp+WtYDja4z7+SmTTThSk3vobEJONyV53bcG4NstUg0X2oyFGazi572fPK+atpCNqj7
         qCNcxOnsTXbYPEe/WgRMIvuMSWWJhVlNiGCtyugAadFRypHWBmsPInpfepc/mJ527hu0
         r7ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dnFXRsLnP+yzVC9bsy5sugvSU6Brjud2TvP08S0JSCZR98N7SPrpDi6+p9fUAcAC6kLqw8jz1bVFulCeufw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB6uehztqF8Lo0gVHWpeKQrUSbyW98zAk3uLVaM0/XfSl4syne
	+Sxa4syvq29m9myyXecGDYt2PylSDpj2A9WXXChW95RTnZcEDdSqfRwe
X-Gm-Gg: AfdE7cmKeh3NfDAdZCHkeORgwhyAiJUg0qwC8hHjx9GVq6n5+H772VxOQewjOm8yCDX
	JCZoczspBSCtL01bfEyVFhU2FfoayrG1scd1P1MoOs6RWmNR0LSSDaePgbXMt4q+igCa/wRD3WZ
	XBZpFg4xQm/8N9DqP7O2P5VEI7XXJ5lYrZ8G/J1D/8gX0uCE/Kdale2Rh24P9q4d4P1sJNk+0EG
	SesTvbnSXn9bg+NPEC3lwyEuZPZdiGAAOlFGN5FdHotv/2dGpUWnz4Wk2gqnwKmpvPTc8dvVnV7
	yVwE5K+S8Xs3C9MRUH+qEEMr2hg3p5qOG/rTPXAM/Sb6Oogru/Oh7+JuXYMknPz5CtFvTZ/s4Ku
	j5TGNjN3pTOm6F6ScmYawsw53XBbIGv7kDmamrF1jNgxCjqlKlajE/08N8Xj7dhtbQYAxM4mADX
	7QSXv2SaxMggXI8GWPo5l46u+6Zt0+M1tmoAaN9YIN8howkcA=
X-Received: by 2002:a17:903:1b6f:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c6bc25ca62mr81275545ad.30.1781780994455;
        Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
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
Subject: [PATCH 64/78] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:13 +0700
Message-ID: <20260618110827.232983-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040955_435880_4F2A66E4 
X-CRM114-Status: GOOD (  13.65  )
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
 sound/soc/codecs/wcd934x.c | 46 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..817ad53595fc 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1265,13 +1265,12 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 
 static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-
-	if (++wcd->sysclk_users != 1) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (++wcd->sysclk_users != 1) {
+			mutex_unlock(&wcd->sysclk_mutex);
+			return 0;
+		}
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
 			   WCD934X_ANA_BIAS_EN_MASK,
@@ -1328,12 +1327,12 @@ static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 
 static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-	if (--wcd->sysclk_users != 0) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (--wcd->sysclk_users != 0) {
+			mutex_unlock(&wcd->sysclk_mutex);
+			return 0;
+		}
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
 			   WCD934X_EXT_CLK_BUF_EN_MASK |
@@ -2384,7 +2383,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 			__func__, micb_num);
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
@@ -2446,8 +2445,6 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&wcd934x->micb_lock);
-
 	return 0;
 }
 
@@ -2488,7 +2485,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -2506,7 +2503,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2521,15 +2518,11 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD934X_MICB_VAL_MASK);
 
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
 
 	if (micb_en == WCD934X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2550,9 +2543,8 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd934x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0


