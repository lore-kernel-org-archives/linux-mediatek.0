Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F5DCD98F3
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=; b=IJRHYQvsaH6tUcX7QF0Dd49Qly
	9xXoxX60irLewUt7jyqC8xe8PRzNW+8mHCrhixzzB6+YG7c9+rKwb+4Gzh3ea9bWS/MmXORF9YMTg
	APi+RfJ5mIk3PM7srBZ/8bCNPvLYeE78FvurSxwo7ZGKMhcNTlBMsUNW9wSFpSCd0+xvUQPKlO7LK
	E5R0t9tmmoWaeHT7ILLU6euM+WmEMXVZMLDscE9KYeaLChT6uPLB9ujqJkpG0jtlOZXd9Ht+0OA6C
	gYE7mp9Q8/PWvflABIWvC6BUKlJe3uM3n9TuypCMi0Hc7/gm2ouhYbhDJa1+uBBS7McS4uZHmDZOP
	cHhQ88Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdk-00000001A0w-0pmC;
	Thu, 18 Jun 2026 11:10:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdh-000000019zI-47sQ
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c132ac5ec2so8954745ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781029; x=1782385829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=;
        b=piSxBFV3KTyBBRIOJ596SD+cwxMNdWCtuApxg7JgLP1XQDrH+T0LhqcikLBSHHqXbn
         Dv8+fJj+Memm27f/fhNAdAarXTen8JwL6sEaOQLdSjD/G6jpZAW1XN4K2J4skXSmEINz
         dM++luc2Mv+NAUaoc0vMVn7jcNCAIq9vQHRowefzCG97aFkP7e2DyL3ExVAGO8aV45VI
         IoXU7mntTqgct39+IoqLBMRhVLiiC/mP10TK1woLNkwH2Q3K1LXSg81V3JCsWeZCBC4c
         s/q+B230ZuhT+4/mFUi2xjkhVEFaALIYzeJQOD3DAD0GdlMUp/9MLJqJiWvz4u0Rj6tW
         Izvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781029; x=1782385829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=;
        b=Q/Wm5ER++gdUJ3az6OOlKdQr8TSKUmqqwoEWPeGgrRLA3XZjKh9vySSOZeKxCPez9F
         gcy35vMCspW4JCxVj1yxc2ZdxZbaA8Kty//O/vDKgafgf/FK9s+feKIflD0Lkx1ZWdxz
         65mn/cpRDK9aTEKb7/EYbPMPX7i1Iyldjz6tH30en3I8Os2mEUU1MyEuG1TO8YYv/Wjl
         6ghdY9E2F7d2fs5dM28+CK/ByMmi9VjT17PG+JcfvpLwxkhTU430/yglh3HlL16+F0h7
         CAXOwtmZWANA7/A4LlQiv/vrfwcnKrnkdZlccQPIoWcVuYOVeYTgT282IHbc3v5+Cwm9
         +Yzg==
X-Forwarded-Encrypted: i=1; AFNElJ9vaV6G1sASa4C12rH8STO7XeSpEubwADLegn/f3UR7sDFFLRs5h+n7iSDIfUebYXnl+6hRxdFVf1nNY9dBoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl8HA9+nMeJO1eZG3ccq6NcKY+MSrjtgDbhuincOhS3Fo/jskl
	6bk0NfHMImNTxfCp8LnPZ3fj4UcRKFPITFnyJr5d8X425P5NT4JfFA3h
X-Gm-Gg: AfdE7cm9SuztqNTWAPz7lG2eFi5ZguYpfW6DN+BTfm7xKoRRdyHT/ttIKhYZl2dKpAJ
	CkArp/scy0j1MZuqm4hu77dAauPmRfP8T6sXfPUVaYmOZiXoJqSwLIIgjR/5UCRVz8SoopzOi1a
	zE+/4GbraIc7mZKiiakmd8TXXxGPxgCZtXSWdcVQcMZa9kD6t9l0qA/Y6DPTk1568IS6VlCGmWx
	L8jXmG2kpITo1jShvh/IltlZubF0/+dN2CbiizgeLfcl6gSbDwN17bUvmq8RG0DPKXBnZXtkZ2S
	kI1KO6RVMA274B8itWnKnzDVjVqkJTeWqvqAH0jrL/gwIdoVdaKu+sYIWHmtgkDQrXcNGlxcCs1
	YaD5xRSdGSitLHAw4m5X/bIyLjzp524DzvVeea9zCjTKMy8Wmy0zoLauYZce7ZQeSLc0nCA8tVl
	3Gzgn9VqeKgXm5Wfq7T0jHFEjtVF1U/B29aDrp1+VJfii9b3hrFWL758DAPQ==
X-Received: by 2002:a17:902:c945:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c6e5155763mr34980605ad.19.1781781029264;
        Thu, 18 Jun 2026 04:10:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:28 -0700 (PDT)
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
Subject: [PATCH 68/78] ASoC: codecs: wm0010: Use guard() for mutex & spin locks
Date: Thu, 18 Jun 2026 18:08:17 +0700
Message-ID: <20260618110827.232983-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041030_034665_DD5C53AF 
X-CRM114-Status: GOOD (  15.60  )
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

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm0010.c | 63 ++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 2a8c61a72c17..aeca42e4caba 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -148,13 +148,11 @@ static const char *wm0010_state_to_str(enum wm0010_state state)
 static void wm0010_halt(struct snd_soc_component *component)
 {
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	enum wm0010_state state;
 
 	/* Fetch the wm0010 state */
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	switch (state) {
 	case WM0010_POWER_OFF:
@@ -173,9 +171,8 @@ static void wm0010_halt(struct snd_soc_component *component)
 		break;
 	}
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_POWER_OFF;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_POWER_OFF;
 }
 
 struct wm0010_boot_xfer {
@@ -190,11 +187,9 @@ struct wm0010_boot_xfer {
 static void wm0010_mark_boot_failure(struct wm0010_priv *wm0010)
 {
 	enum wm0010_state state;
-	unsigned long flags;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	dev_err(wm0010->dev, "Failed to transition from `%s' state to `%s' state\n",
 		wm0010_state_to_str(state), wm0010_state_to_str(state + 1));
@@ -558,7 +553,6 @@ static int wm0010_boot(struct snd_soc_component *component)
 {
 	struct spi_device *spi = to_spi_device(component->dev);
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	int ret;
 	struct spi_message m;
 	struct spi_transfer t;
@@ -568,10 +562,10 @@ static int wm0010_boot(struct snd_soc_component *component)
 	u8 *out;
 	int i;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	if (wm0010->state != WM0010_POWER_OFF)
-		dev_warn(wm0010->dev, "DSP already powered up!\n");
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock) {
+		if (wm0010->state != WM0010_POWER_OFF)
+			dev_warn(wm0010->dev, "DSP already powered up!\n");
+	}
 
 	if (wm0010->sysclk > 26000000) {
 		dev_err(component->dev, "Max DSP clock frequency is 26MHz\n");
@@ -579,7 +573,7 @@ static int wm0010_boot(struct snd_soc_component *component)
 		goto err;
 	}
 
-	mutex_lock(&wm0010->lock);
+	guard(mutex)(&wm0010->lock);
 	wm0010->pll_running = false;
 
 	dev_dbg(component->dev, "max_spi_freq: %d\n", wm0010->max_spi_freq);
@@ -589,7 +583,6 @@ static int wm0010_boot(struct snd_soc_component *component)
 	if (ret != 0) {
 		dev_err(&spi->dev, "Failed to enable core supplies: %d\n",
 			ret);
-		mutex_unlock(&wm0010->lock);
 		goto err;
 	}
 
@@ -601,17 +594,15 @@ static int wm0010_boot(struct snd_soc_component *component)
 
 	/* Release reset */
 	gpiod_set_value_cansleep(wm0010->reset, 0);
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_OUT_OF_RESET;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_OUT_OF_RESET;
 
 	if (!wait_for_completion_timeout(&wm0010->boot_completion,
 					 msecs_to_jiffies(20)))
 		dev_err(component->dev, "Failed to get interrupt from DSP\n");
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_BOOTROM;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_BOOTROM;
 
 	ret = wm0010_stage2_load(component);
 	if (ret)
@@ -621,9 +612,8 @@ static int wm0010_boot(struct snd_soc_component *component)
 					 msecs_to_jiffies(20)))
 		dev_err(component->dev, "Failed to get interrupt from DSP loader.\n");
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_STAGE2;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_STAGE2;
 
 	/* Only initialise PLL if max_spi_freq initialised */
 	if (wm0010->max_spi_freq) {
@@ -693,11 +683,8 @@ static int wm0010_boot(struct snd_soc_component *component)
 	if (ret != 0)
 		goto abort;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_FIRMWARE;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
-
-	mutex_unlock(&wm0010->lock);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_FIRMWARE;
 
 	return 0;
 
@@ -708,11 +695,9 @@ static int wm0010_boot(struct snd_soc_component *component)
 abort:
 	/* Put the chip back into reset */
 	wm0010_halt(component);
-	mutex_unlock(&wm0010->lock);
 	return ret;
 
 err_core:
-	mutex_unlock(&wm0010->lock);
 	regulator_bulk_disable(ARRAY_SIZE(wm0010->core_supplies),
 			       wm0010->core_supplies);
 err:
@@ -734,9 +719,8 @@ static int wm0010_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
-			mutex_lock(&wm0010->lock);
-			wm0010_halt(component);
-			mutex_unlock(&wm0010->lock);
+			scoped_guard(mutex, &wm0010->lock)
+				wm0010_halt(component);
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -832,9 +816,8 @@ static irqreturn_t wm0010_irq(int irq, void *data)
 	case WM0010_OUT_OF_RESET:
 	case WM0010_BOOTROM:
 	case WM0010_STAGE2:
-		spin_lock(&wm0010->irq_lock);
-		complete(&wm0010->boot_completion);
-		spin_unlock(&wm0010->irq_lock);
+		scoped_guard(spinlock, &wm0010->irq_lock)
+			complete(&wm0010->boot_completion);
 		return IRQ_HANDLED;
 	default:
 		return IRQ_NONE;
-- 
2.43.0


