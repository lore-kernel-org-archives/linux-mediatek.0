Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16004CD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rJRzCL8/vGU1Cnds6wAoa9R/cBJXeGAkkZCjOz43G0=; b=oRa0U9SIbm2hKD1N7TlYWU7rar
	0XOJrf1TV40cYGN7C+sa4lcyHgKn8LWlHXfyNeJ+VX4ZhCYl0JWmZ5TmSb7dSdUlyI+jjFAhD0YHr
	UaoR6gnAEI08GqfftzO83ZqmPVt9GCUmrCfsYEnQ9zJrv4cbAWPhNH7WyR5AnD9YV+zi8HfP6pB9b
	HuKfrVnqb/w0ISX2JqI8FZZCH6SKv3vCLskPK61CBdIRkuM08tTiAv8cn31x+fied0t8aOMJ5u+7R
	f9Fs5zfsqiHuWN8VR3WQppZengnuoNGLmE3Zh9P3b5VIadqgjE316wt2LbE0DOrLMZk0bLcyWtFFq
	AsbQdNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3i-00000007NLS-0el8;
	Wed, 10 Jun 2026 10:21:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3f-00000007NHi-1RL9
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf2247e38eso68168065ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086875; x=1781691675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rJRzCL8/vGU1Cnds6wAoa9R/cBJXeGAkkZCjOz43G0=;
        b=o9ArvtDcjScFkOvsC+hvxhxe0hw+nKFk4S3o08sn3EDBH3cj5WNTmqSXruqgvtV5Jx
         ynqF4kAYwxrLt0aTlyoShn30Lh21uWngT0CbqShfijSCV2d7B96Um5prAv6IbtMQNtRp
         LE0+S+29zlCk/6YzZYNCV0CissBEDZhV0W+iyU9yhFVDLxhe7djgl4bYVvqDKnsdGhX7
         o9kh+JasUz8Y56AmBBuPGsUU2YrFcyDq5DUE4uxRhEtT78kSUBbItZA8+udEo9f+AqNf
         DpE4Sb5JuRP7wdP7Pb1BA4oaWvE1TNXhwqltOvOt1FyoCtwpG/0ludzzVbeLjAqxC5FT
         RG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086875; x=1781691675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8rJRzCL8/vGU1Cnds6wAoa9R/cBJXeGAkkZCjOz43G0=;
        b=T1iOvwfBOftsX42Kkl9Z4ApXjVrvgQiV3PGWJbgVvIIy3A6ydx9G52kchhCaEk/72i
         Zzz3PO0kYVRdCVIkX4H19Zgc3R6CP54ZV4PUYcldQx14V4v0ulYsEZT3kCB6E3oPDBSQ
         Wa+TQ4FzDENy68G0rff6jCeBcHiEdaJ9W/kDaFRbyNUl6cSTGMQmEZWuM9BG+HAnd6/8
         P99JNAfg0H1I1k+wxFuYwBq2IYAyfgYZ7ZIw123bbFuo/tmgrFpvLTFwTe+auzhvP6yc
         NE5v1TKTx2ds2/8UmmQVq/RTXXlxn0SCWwra9BsmoidOVoR67XWCdCjGoSBdOMZtDK7G
         ghsw==
X-Forwarded-Encrypted: i=1; AFNElJ9VJDytsQmQgjCi7Ot6lH4N626Z/NajjeC8btmMuTF3kN+bl/Bowk5upIgchhzGNz30257jPGCq6zKXm4LslQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yze0sa7JZlxh8rhPXGgDfmgJzG46cQCQCqvyQajr9+H33Lvh1mb
	yPdNlWbOC9rtQ3Z8vqYxBsHc9gIeorZSpzxummvGn5+ebJYBwYLAIWbj
X-Gm-Gg: Acq92OFfUG+DBTWE9xMtf5yq1DaobE8CEP4fvovC5PaCOxlAuLwiDnPySshAZ6Y+7F1
	4ZA6vYZZSGPhfqTlqMm5sajE/LkVo7b7OESXOjHLfllfc71FolnaKBES75UMeBHdzczoTjzTG8q
	3ab6YVicCDiR76xkaBgMbfHaJtXWL6m6bo+6UflPQntwr7ybwZllFl7oS/Xp8LoPWsSMVJAGFmQ
	XXg/t5g+Z5a8kX41SWqjOEnv8Xq+cKjRJMvbg7XkpVj/v+KzxO1I8t7lMGZqYS+5QZES1FBboxI
	KV+E+AHMajxx5ntwggK+hkCjLxs1L9mBTEM6fY6jJxT3YrrAOlHP5CYLjKuhIq9nZQhHfb7e3VY
	ka5TPWgL6u5g8GhxEWEfVAAmpVsRXbUjJAGOtKt4KsNwhZ1BTPICiQJDAav60tewQQL8V/B+/2e
	2lUrXTWiwjE5S07+w6kFQMfm3oVFt/g9Hou5RM93fJuAzRiJKPe5Z+/Bz4rFZySBfHHXWg
X-Received: by 2002:a17:903:2a84:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2c1e85c5022mr288228085ad.31.1781086874701;
        Wed, 10 Jun 2026 03:21:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/10] ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin locks
Date: Wed, 10 Jun 2026 17:20:19 +0700
Message-ID: <20260610102021.83273-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032115_391832_045961BE 
X-CRM114-Status: GOOD (  11.14  )
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
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c | 30 +++++-----------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
index 7078c01ba19b..af96aa446fe2 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
@@ -194,16 +194,13 @@ int mt8365_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	unsigned int reg = get_top_cg_reg(cg_type);
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_on_val(cg_type);
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->top_cg_ref_cnt[cg_type]++;
 	if (afe_priv->top_cg_ref_cnt[cg_type] == 1)
 		regmap_update_bits(afe->regmap, reg, mask, val);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -213,9 +210,8 @@ int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	unsigned int reg = get_top_cg_reg(cg_type);
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_off_val(cg_type);
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->top_cg_ref_cnt[cg_type]--;
 	if (afe_priv->top_cg_ref_cnt[cg_type] == 0)
@@ -223,8 +219,6 @@ int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	else if (afe_priv->top_cg_ref_cnt[cg_type] < 0)
 		afe_priv->top_cg_ref_cnt[cg_type] = 0;
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -263,25 +257,21 @@ int mt8365_afe_emi_clk_off(struct mtk_base_afe *afe)
 int mt8365_afe_enable_afe_on(struct mtk_base_afe *afe)
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->afe_on_ref_cnt++;
 	if (afe_priv->afe_on_ref_cnt == 1)
 		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
 int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->afe_on_ref_cnt--;
 	if (afe_priv->afe_on_ref_cnt == 0)
@@ -289,8 +279,6 @@ int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
 	else if (afe_priv->afe_on_ref_cnt < 0)
 		afe_priv->afe_on_ref_cnt = 0;
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -322,13 +310,11 @@ int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	mutex_lock(&afe_priv->afe_clk_mutex);
+	guard(mutex)(&afe_priv->afe_clk_mutex);
 
 	afe_priv->apll_tuner_ref_cnt[apll]++;
-	if (afe_priv->apll_tuner_ref_cnt[apll] != 1) {
-		mutex_unlock(&afe_priv->afe_clk_mutex);
+	if (afe_priv->apll_tuner_ref_cnt[apll] != 1)
 		return 0;
-	}
 
 	if (apll == MT8365_AFE_APLL1) {
 		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
@@ -342,7 +328,6 @@ int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll
 				   AFE_APLL_TUNER_CFG1_EN_MASK, 0x1);
 	}
 
-	mutex_unlock(&afe_priv->afe_clk_mutex);
 	return 0;
 }
 
@@ -350,7 +335,7 @@ int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apl
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	mutex_lock(&afe_priv->afe_clk_mutex);
+	guard(mutex)(&afe_priv->afe_clk_mutex);
 
 	afe_priv->apll_tuner_ref_cnt[apll]--;
 	if (afe_priv->apll_tuner_ref_cnt[apll] == 0) {
@@ -365,7 +350,6 @@ int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apl
 		afe_priv->apll_tuner_ref_cnt[apll] = 0;
 	}
 
-	mutex_unlock(&afe_priv->afe_clk_mutex);
 	return 0;
 }
 
-- 
2.43.0


