Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D39CD98F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=; b=TkNk1Ke8KoNh0E383pgs8bOrvC
	Ikvx4cJyp2m0eyIdUHpnfQHPCxVCXYRs8AlBSplBEw0qsyfOK1QMUy8kKBx5oECUS84kfOqptaOFg
	Qgsb0aujBbQsJMFWFj9K2glG2c6TUoEim00R1y2dTFSKRnxQp9D8njQNymlsVDQaf3M67XkFfdw1V
	8BPcTlyHQde1lsh6w4ekL+AJIpISoB5HM0D1yY3Wz4OF9tkzylbKX1idgL/KASC7g1lFlF/WkJojn
	Pho8hP7WBL8nSxKj9qtZDGpbR3owjJhaH8rk66KZ1qIF1XOtgbtlDiP8Gvesk+cP/m/Bhe/VBJ/XG
	JNDZA+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdU-000000019pT-2R1D;
	Thu, 18 Jun 2026 11:10:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdS-000000019mJ-1nvN
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0c379e8ffso6926285ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781012; x=1782385812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=;
        b=S4bGZgEL9UtjS5lT/1Ii5W1aIPrGb4HFBWstsBTGWdYdgsytHNRDI9J84MQWOeSnHb
         GBDdoqu+ukHQynUJFlWcIt4zRgNesgg/TGx2KJ2yHxbA9ak4QaoN1qCeLUWKZTwawvuW
         FBhElrktWU87nPtBLzut57nmvIKbzZpCQw3Y0SUt7OOGnVPFRvNsgHYdndzDW2EDL2P9
         HbmOn3KalVRNXhvKZQ/D550NOOMsI0aAge/ttvEiSed2VTRjJdZ6TE6abqoKGoQvX51a
         FDC0q/wUvn4vC7O7J4H8yVtHcQduwT28op+9ycrE+koevSyrSKm9c6gjjzuVekhqyTi+
         iCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781012; x=1782385812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=;
        b=qADrOG1xYF7V2dJ4AcyjdGdfvvQ9cls74WpxGOCOv9vL6mHTpYUNGrWXHOXyEXin6o
         BgEKLS9DvFzIT57W0HZy4XG7PEEkKd6js7dzv5+Oy9uy4pBEjJA3XNKTuaQkVj196U8X
         PMbNwkXRLBo+z3iDv6JyTSMU3e6qXVW/L0HvtearWXaniFshXS752oe2HFdowUO6YiKl
         Dz0JZVkOevNWP/ub5bJUL0ZGRXgLsXFWzCa/VLCXq4IIdfrjYWp0j0XY+94jnaAu05we
         dklqGwrqoNM/4ZSuVzXe+7NxUUUjZGw3pX5XM0RQ2r4GpDgFAxFXxZTzWgsPckM8tzUQ
         C2cg==
X-Forwarded-Encrypted: i=1; AFNElJ8Jbs/z4SvJkJXvR4Y72HrHfQbhTUdpjhWUcdtGMDjZHrF47P7WiX1G9tLL+PCbtUwD9gBvVwkow3U4Jf6nWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGd+vmGvEmJK0rOECfl7OT3S9B3qO30+wHbtNJUoDINhKQmmrR
	ZrsAPP8KUE6GdjTK0LabDbd60slLThA0JwqCw2lJcvlvZdktXe40oAZY
X-Gm-Gg: AfdE7cnYF4wjgJWolwdRQ/CHCOL+bo/zgQT1rCRqEsV48ANprGqYZDOL2TP1VuxATN4
	YUI08NpDX7KjgUcLEgeytGPoq6zxyvnDpen9pIg7SJGENTshgfStz6/xOglpSpip346kZqnQ3bo
	+2K/K2bWm3/pNOzET952uagWyqCYrVkh4jA0Ar2p4B4DXpVcRI+vqgC3DoCEW5fYWH7pINyxmmP
	vPDQ27sBPCfhBiGvysh6eLE5EfYvs8FgJDDNw0gyntYz9TAX1xKC8VbHEofbx345CwKFR/uLxNv
	0FKeXXqnw8vWmrGZ6aD7ik6PMlqHzrr1OfJjke3S4UuatlYbysG1Fyw6uu+bPAk8bY3C/KMf8MB
	rgpg1RwPawlTisR1t8F/k7HcCOq3JTWyHgCPwuKmUeGekjV5nw88EixAllINWKl586VJEidI6sS
	9HCAuV7ZNEVMjfCKT+Y55marhYgo+CDdumJZrmFuX24fkkMSg=
X-Received: by 2002:a17:902:ec82:b0:2c0:b5c1:8e3e with SMTP id d9443c01a7336-2c6e472d580mr33156445ad.8.1781781011500;
        Thu, 18 Jun 2026 04:10:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:11 -0700 (PDT)
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
Subject: [PATCH 66/78] ASoC: codecs: wcd938x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:15 +0700
Message-ID: <20260618110827.232983-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041014_566850_59522978 
X-CRM114-Status: GOOD (  12.98  )
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
 sound/soc/codecs/wcd938x.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c69e18667a85..9eef1ecec352 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1976,7 +1976,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1994,7 +1994,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+	guard(mutex)(&wcd938x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2009,15 +2009,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD938X_MICB_VOUT_MASK);
 
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
 
 	if (micb_en == WCD938X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2038,9 +2034,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd938x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0


