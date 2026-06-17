Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF43CD98F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=; b=c6ltSN9VU7OeQUOir2f8xKcN9N
	DiUck1EkNfLWiI+nEttHCqTjviacSPAGUMtwkqUK7P6z0bdABYRMG1f6hVZNz5Tsknuy1v1mcd4ro
	ZhPjbEDw+fKnsmb4TMzNEjPbmCw2yGYbsrkn4NqQnbmvyIcjfV/M3dcTJaWJWK3JNk8l+Y91Mctbn
	zgmSJ0C4S85O8+dtkSAh17AsFXwzHNUgdJG/codzG6oH5QI9tNh1eU3YxAog96+0iAg1fKmI7/F/k
	FX++aBKoLW0I6vjwQIbicMCmzdXST07ktwGKs7tHmNP00bqy+JaqdSXFgzi1L7P/0F1aHlY+BhOoo
	yiHItZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhM-0000000H9WO-0zJW;
	Wed, 17 Jun 2026 10:40:44 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhI-0000000H9Th-419Q
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:40:42 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2731686eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692840; x=1782297640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=d7Ehd9P7wSQVOG32OzQ7ayo2GAB6tO1tvs/LenkCeY+n1Xd3d19XYnV+H6M8zNysmk
         X0CYhB+Wbag/ww5yXSneOooLoq31iNS7g5yFLT1UsF2JrayhlgafFbKYbDfl9O4Hx/3q
         d8y5zCO6f3Qaxu7p56BdQyuPmp7VurIR/GUfRGPHdgvrXa4fTEvwtRNL1xAF4KaAJ5sv
         4IwNj+fZYMY3InQ2G4EbEQoMoG4neqxLxtJ1GDTtSlBcS5s3yYvT3yieb+xr08XF5kKn
         w+tYMXdDBU91PM18KSci9ywlsH4sHh4ZWZ12suiMMxIbB/xKE3HBICDI7JtEUgcVaXva
         MruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692840; x=1782297640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=q87EtPN6IrgU8/of3v4Gx0Bawi6gw3AU8ZZA24Bodymo4181WtaeWrTdaNBWkyUcL9
         ztVVn5SK/f6qHyieIMSsE8KF2VDEvqT5Hx/ZCyJU8WUQUXW/8KIVQVbFP37MzdqZZJO3
         AMSsOGTifqgE3eJkyEzQPvg2kMnZcuhIhiR4X15Lrn4i/4LAClUUPYMGd9GjerXtY3k6
         YLxB4Gakf0CLZy4YP9P5q1X4eBFThCJ2svO6m9zm4K+awvXuStCQrcLebDxBsczaaHL3
         2lZ3BQP1S1+7k1jr2PMpB1R8tqDKoZwmJdx746JslBJZYtEd+pvegfopYfz0upBYbca4
         IVLA==
X-Forwarded-Encrypted: i=1; AFNElJ/WO/gS9NHrUe9ESs/qTmIa1Uq+DdO86iqBKUW2tcKMJXgWI7H+MdMNmzYb78dhL9oLeZBD0uLyKXJDaQXP5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJc02unR/0R3yw/F1zVuxaVzuImVW+pCXf28eh0njbS48zWcH
	bPg1lleul/+Aut0+xScXrejBR09YYDawhrBPMYK4rRH56/8293xlH8Fo
X-Gm-Gg: AfdE7ckdj17mqUVjaxd1lPHIGwKYYJcnqcHjZYYp5Vfmd/l1uIL4d8QpOpejk2CoGe2
	utC1JwtXlSCI3+5nu0+rULC9/ua3odQbcLdagM0cQG/QOVXHDCYISH50JA8F7NpHZNHYhilfSYA
	3N91/c33AFkKvtXnH2YLJ5uomF9gtgHTyoxPOD7TWBishRvlGNgMeKKzHQz/v4sGtBe9HLs54Zv
	Cwk9cl1Bn5BZ83qAB+ok0kIiszEWjilzS4OnXpsD2o1O4DeBU43OqZ54sbZD+5eZrjmqPiQW/3H
	a+iVuAr9ibbxvMgvQo4Fu/x+xDV7YqOgil6GL+ikRUDULnJBc8hl8OVgWHFrf0WCE2Jn4jzwnVO
	mfB+wPEVb3Sv2UafBjXvvt6xiWQOXrQ9H3lAYPExHlRcIBGBqaefd3yodJCAFuX7/E8kBEhr2FI
	7DICW87gL9lbeoBTityVRspOkIhc80bHDQSMJkOuU0BMhLizLQz2339sxFvQ==
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr1722160eec.29.1781692840150;
        Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:39 -0700 (PDT)
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
Subject: [PATCH 49/78] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:06 +0700
Message-ID: <20260617103235.449609-50-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034040_999924_CB0BD6E7 
X-CRM114-Status: GOOD (  13.20  )
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
 sound/soc/codecs/rt712-sdca-sdw.c | 34 +++++++++++++++----------------
 sound/soc/codecs/rt712-sdca.c     |  7 ++-----
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 581732180473..066d15399bd9 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -277,7 +277,7 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt712->disable_irq_lock);
+	guard(mutex)(&rt712->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -341,12 +341,9 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt712->jack_detect_work, msecs_to_jiffies(30));
 
-	mutex_unlock(&rt712->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt712->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -428,13 +425,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -456,14 +453,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 4796fce084ff..5db478633f17 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -79,7 +79,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +126,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +402,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +449,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


