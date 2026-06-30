Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DAEC43602
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=; b=m75VPkLd+Km5y7TMs6i3qCRp2B
	zdnuHIxK3jUmMpuwUM+pFiKBKHTzjkrQRvKWnpgXf4s376srG7phfo8lf+ruwtzYdLFSSVKSccoDW
	m6hiW/Z+pN8rj7soyCsxIF68FwObSGOTCxIWvP3kvtwcSKGARudhdxfMleGie+m1yre3P49wzj3gT
	dEGATprNgLpVmj9WA4VB7W1DcxJgcZUhZfhhS+cZQZRqo/LpsTtRWzTeai1NO42YTlWI8kPWaXIMB
	hFam35EFdj5jwH7FxWqe8cDuw8+7DNupurDq42cr6pkmFlYTyN8iBABQgoqQz7t7UfIatdOpJM1bj
	n4u5BYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4Y-0000000FyAP-0EVO;
	Tue, 30 Jun 2026 06:35:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4U-0000000Fy7R-1avW
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=; b=ffqCsspPu+MwKDgEiTbTmUgwu9
	63+TeHCQYWxz+QRaAYeRdb/WA8lVlQ7avNOjZRwUMF/3p9wom9WxBqFsFljBdClgGe4Y3uQpu/gNB
	p53/tZrdNZAtlbiJE9lxHNQ1WBDcAfIfTuhnnP9b6rtnPuwczScMS9S40CkisYkS5jISP85eOkWCn
	zzDnVqyX/h99Kgo15FLKvSx0UD3i9VbWjNqHmUcs3azzPm8l5FE2q08aiC/oHdCU0i2Z4jdUdZ6OM
	Hlz/NBQAs+MiiS5eIMULbQRxlT8yAop8GM6dQPl9VQAe0pbAKK+J6oNHUPhZCuDFVm/6ds0ujG13n
	aBrfYufQ==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS4R-00000001Z84-0m85
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:49 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-847968ca62fso921031b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801345; x=1783406145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=SX5D076v7M8/RgWFaz+NCoKO3GPRa1yBeSMSEZSei3gF3whWljB94iVgiI7pdLqFZe
         0rp1EwOBgm+m1leOLmOwqw23K7Xc3r28LzaJZ2fnN1RaixYpzxi+5T37sjHKGi4v0J2w
         mZF08EV72rzdrO0T+z7v5wzLxokcn7SiO5iqveZ3dFgm319s1Ui0Y4T0BD0ZZ/+uarUg
         H7xlkYJbmgIxvDEVyfqiQNYWKC17RCjUxh3BWAolg+8bUmJ30dHdO1pR71MeueBqf65M
         ZtkIuSsDckY+5v19SWVv7EPGGKW4Hp1u3PrVxbLgpbnspvsFyUl+sp3b2W5l/zvw9dan
         UTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801345; x=1783406145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=Ow+uZj8x39kpnuIGjHNGz/zMrhkdCfuRXE2+udA702J+MNzNsGPNRnxHkLfp76GO2P
         EvgK5pdg6j7CBjJVqG1oRPoJlICoi8LmKZkcur5aelSWGj09jLi+BpEMeMvZ3mC0zVHa
         FjGzkF6fzwF14rXVHINAYn8vbVX2dVC4QU30VHAgpDF37KCPLnMJeyi2KaiYUxGWxjH1
         Fs3+bJkHIYVLf2FUPdVlvYaSHIZorHlRKyLSOsJS9/3bz1B7br9xCpY9cl2ARV4T4RXo
         YvEDE2KsFxJRPaSnr53Btb1igRuvhnJhVBL+JrHlqaBHNJdVWrIO0pnpvP7TjdBOG3ea
         GN5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKr8nKQhYUXEnvsrfJ8G54+v6TVO31xdx/lNAYS7TGOrR1E5JAO65Gl4nNRzM7UD4H+wpyJ8vJ4OB5RaMHHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu287Si6cvIc9wLCrDsOdB6NfEePS4WdGsNKrCsF+iraYu7zG0
	sqVbXSIM4Yqf1OQeFgs5hZGIe44OYONV1aHugI/wqWgk+W+UtU3LEyVK
X-Gm-Gg: AfdE7cn6QnngnZgbV83MCQF2ALmlhGTYny6/Ru5JUzhm5zI5g8NvYTa2Odf6tDIuVBO
	zHHqEZ7rRaRZQDrwUCNKiY54IiPo3GPOtwnxBVu/S6KW3x10hF9E3AwzDtPDSQ1906t14qZ7WOw
	lS+vowWPr/fE2SzsZkqUxJbfB+2jj8Dg5feL8j2f58xdN5IhUr89KgDFsfq6OViqJwRdnURoE//
	fsRimyFPB2f4yNOJu9pJNpIu7AA1FYL1r3NAeyJyHYLcNN1xqamM9ja0cuBBzLC2Tl5YX1dGt6P
	+jfhNtDvgBlnyLInDGvm7xqbD/gX+9VECzZSmvy5v7bu6pGYihIEVusMTrM0TxNLQMB7gcPcU9y
	vpKtbl/g56S1fVrdwI0n51y3JoJxMzioT5xmDir0H59Nt8ATYeHF3oa4OmENUKPbApBb3CFC27H
	APFHaZMq8IjLvbPRbY/YYqB1BtdRfo+993OIXbJAlXVIiC7C0=
X-Received: by 2002:a05:6a00:3e12:b0:845:e873:4248 with SMTP id d2e1a72fcca58-8479f3fa66emr1886818b3a.56.1782801344986;
        Mon, 29 Jun 2026 23:35:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:44 -0700 (PDT)
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
Subject: [PATCH 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:27 +0700
Message-ID: <20260630063449.503996-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073547_518949_9E781DCF 
X-CRM114-Status: GOOD (  12.07  )
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 8db81d574624..8ef9e70a9316 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -501,16 +502,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps0 : ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				     SDW_SDCA_CTL(func, pde_entity,
+						  ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				     ps ? ps3 : ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps3 : ps0);
+		} else {
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__,
+				ps ? ps0 : ps3);
+		}
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -1092,9 +1096,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0


