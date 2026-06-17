Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A7FCD98F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eMqE3BBUM7YLjw0Y2Au39yLx+nag/ZXvLG1ZHdqVe8=; b=ex+qknQHqemY080C/Rq0w/2fAB
	zyW7CqJNQjPsGagJBn0kXdTurmjzRq6g+xelVwNCYFrRaqO4R9tVGCgbr4rP5kPdEY3/KgF56sPPO
	BziAsyNU+JU/jlWNqk67iQfaG9l9CtP1YrYmPm3mXV+/hLSwig+dRIe9Cqz3Pc7ZG+EfF25ilYMgm
	j6uAu6AAXRMn3JcOj+4KF7zCqZOIw3jGUwN4k9SquvIWNS7xY2Y6gZBpFV3SmK2Gso52ISzusLO4N
	AgdihPcDiQqSo0LV8YcioXddDyItD7YxFYUu51LMbQUFj5l0BoQWaGDYQYtpUThcZuG7LzoyxxQfK
	75Gc8MKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZneD-0000000H6y2-03gv;
	Wed, 17 Jun 2026 10:37:29 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZneA-0000000H6vg-3qUS
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:37:28 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2337416eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692646; x=1782297446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eMqE3BBUM7YLjw0Y2Au39yLx+nag/ZXvLG1ZHdqVe8=;
        b=jTrgSZtx1v3XpmxUWnFnHN8uoC36lLPvvqIeJjcafj+DO3ehgDhqtgk1qFKKl1jIvC
         h62adiAsZkzLkNQrX+Yhrr+H/5aiyc+PSykCaNQv39ND7QLTR2NnWbTpnAartA/gYt1I
         6dNVzfS5EpGKmSlKPIFH+xR0PGOub/EbH7k5YDmNN+yCSRmDRNjP7zL0tHPkTYYDrNb9
         Z3UG+bSnu10AEVv2+RKy25VH645IHTnQ40l4tXvcWl8zAWa+aXrq1SVV6LY9ueS50CZI
         2YTscUGApQrhjUnEqrW5FNgc/rhGLzER1iaSOiicMbx70u3ICW1Gf8R6Q9s8cPMs0eWw
         QklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692646; x=1782297446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7eMqE3BBUM7YLjw0Y2Au39yLx+nag/ZXvLG1ZHdqVe8=;
        b=JsTbTbUr/MuJ1LEqMFfbEXCyWlmA9yHv/0wdoJ/ad7+pNgdge+91lkz/pzOKYnlAup
         r38v7b/ZQZrnyrz6RYauV34jUVL5xiZsQ3Xy9Cz+JX9SVTLSiJ0PrUbGgZSmrDvN/+qV
         aoq0yJphLgbj5L6eH0PpbevBkTX4ObzIDNfbKKlrcJnCcNkm129/FNBPHyXZcMjiegq/
         PGWF+IIwMP3c7WLsRS/cEpC5lwxxBILCHrxEkNf4Ji7JzqNL+Pm8WYpRtF5O8CiA/2Gr
         kLym70QiTWwWFFj3kwL1SXYF1/tJ6UlpEO8wOcgBWQzEXOBIoANx36KTIxYyIMcDDbMU
         jFCg==
X-Forwarded-Encrypted: i=1; AFNElJ/K+zHwnEtCpJvp/+6Z21yv9LN86/vO1NVvmTJzzggwIDJdEC1kdXFqJw9qYIfkshcmmplqi/0N/dcusO+K/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPvi5EgPlnkKysfAjKI1T/0RN4v2jNHEyL/x34pR6KEnpCP9qX
	jWs/aypgoiNE/Lwh1tamHYzwwij5BiluNribh+itH6tuvfu6CIgaWs/r
X-Gm-Gg: AfdE7cnI2+5AretvBpckqsavudBiCFKGxk8gDM/sGBFH+jWwvtbscfyDFabf9jue1z+
	9qlktv876jZR/DPnwquCvuTwYS6bUP2KXKl9PGe80E8KeDN3Mhb0+x8o21hSPdqSP7hvUJ8/RgD
	2Ibthkb63JWhCW3Ug51rTfaDGGQG2w6+UCy4wcT2qMa0ZzIQYl0qlhxDarF1e/NePnyYF359HF0
	00yqOp/3DqXSMUMulvSERQmsCasue/Ht7yKN1DQB+MTcg4gMq4ABG5YtRIH3UZJOiTsKuPagzo/
	FQkjmAb3jInLUENIqG7veLE/Lfhzhu6gtY2KKXATyOwCFHRBYRwjhK64ED0h+WvT+hr+x3YH1jM
	BqUbCmTEU11wt2GEz+8AsC2Vk9GtEsutojiGiQwXN5xtIYl3kiKItv9rssi3EGHGfb93jcg/KYP
	s/P5lEJ548LS72oN2/MgwBb/AWx/kCOE9JfWSA3d7XnTUP5Z8=
X-Received: by 2002:a05:7300:5b95:b0:304:ed85:5f43 with SMTP id 5a478bee46e88-30bca068312mr1553091eec.24.1781692646184;
        Wed, 17 Jun 2026 03:37:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:25 -0700 (PDT)
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
Subject: [PATCH 29/78] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:46 +0700
Message-ID: <20260617103235.449609-30-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033726_964937_DF65C321 
X-CRM114-Status: GOOD (  11.07  )
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
 sound/soc/codecs/es9356.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 670e918b56a4..1915cce09809 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -501,16 +501,16 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
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
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps?ps3:ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
+		} else
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -929,7 +929,7 @@ static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
 	int count = 0, retry = 3;
 	int ret, stat, reg;
 
-	mutex_lock(&es9356->disable_irq_lock);
+	guard(mutex)(&es9356->disable_irq_lock);
 
 	ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -982,11 +982,9 @@ static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&es9356->interrupt_handle_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&es9356->disable_irq_lock);
 	return 0;
 
 io_error:
-	mutex_unlock(&es9356->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -1092,9 +1090,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
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


