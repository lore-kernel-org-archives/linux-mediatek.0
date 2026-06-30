Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC75C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=; b=fc3g/BLIQf8kPBz4n4ZbPna9+V
	fVJxtFRH0Kg4QkBuGTufTWSs3VrJg4s9op9VxLYf7yuvN3h000QQ2Xh2gZOVRmYYX2/KCd74WIOPQ
	u/WRovsKFUQOJKEHFbBpkH4kAt9JSxcvS0vlfMRNaF7L2cnUHd274RetnGoDLP9fjScESUY4+3W/V
	lBZY4n7GZgpE3jogAqyxptebluENIod5JELRL+Gl8FUZhrn2QT7n3QlkS3mIz7Pk50+pIk7vpYgm6
	Vzw1kCDncNn7VzBuBmN8RM+thAYLe/xcvImaH9oWWDF0DjpN8mX8bZmLNcnlsM/yujsO3Q4cJalQd
	5JGn5nVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7Q-0000000G0lK-1PEk;
	Tue, 30 Jun 2026 06:38:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7P-0000000G0k7-1iXQ
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=; b=iLz6UT+RjmawBxR/F7JcJGCbjS
	00oGGQihxDqAtD1Fk1uDaOeE9r4ZYsPNZthxIRENELms3MyLRtl9NOcyCdoE8WddCDdA7B0o9XjJM
	rP+MlD5dCCKFEprVfIox9zxbRdrSjjhk7JUCwuYLqbMVvBJL0Ntkpx2a553ayOnuSK6xj7e5ZpPuy
	BrXnChL63KtYAayBDtJsGJI87H+g82DkZHYTrnTOe3gX4jvol00UTHJV4UP4qTHY17wCtmI+Ja1N9
	LBi1lFHcis+eSBHWOyTX4kC7JgaRTf5vmM/UTryqIg9+z0diWu9nHVib85slptBEdF+FO8eKy7LCm
	9M1c6nfg==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS7F-00000001ZVY-3kZ7
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:38:49 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c9aea40d799so574098a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801520; x=1783406320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=ktVdRmxbM4gvoLn8V1MQD24kHWy/niLDMRNijMDsfpNB+Q327FdgD4CD+4yfq9bOrg
         lUXXhloVLrRcHn+wbNqaKT/7o4O7E2tSJtpgaMhbQWPXZvVSjGe1niAEI/PEd2q57K9y
         i8lD3VYuqUiy5JMY8af1bi7jQL7itDptOABO8nR8sTwLI4Djdtx0rcxKrciJRvhm3guc
         oFGDYGmgFwrNgFVYg/GDnkR2ns693HYFe95St/0tzXXGb68hvx6OJLRoVxEvu+A26Mxl
         vvADdlUuy9mfaLc1P4/bdirEZg74Sbo8flmgdJ9JR2+jyq90oxi3S4QnMvbt+iDMLk9R
         RNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801520; x=1783406320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=YhsWEU9YnUt+JxZXyAuVbHHRAr5pjXGQdBC53+zdPS2CypGeZbzuofiVKNbJ0gb+xf
         kKJy4f93nOT+bEVEfd4qD46HWyRQ0yaQIXQoc6jfBd9fnvauY0puZlyUG/rrGGH/UFIl
         XkWBmo4Uy0g7rel0TFzKL+w6h3CfNS/WCzqnU6c+IaZUfufFAGvE95KLAE+RigdnAJ1U
         MEbHDcuAbI5awxmLGetijSppWF9ynDkyRNVgEli9ZDf7AUJV354Vrck9HnVMMvDJ5ByA
         6aZAi0z84CaPP7P1SKEZLRECGE8sjjCXeM32PdpzP3ylbPkJ4wOemlhWgqeS/qXkhICt
         ZXmA==
X-Forwarded-Encrypted: i=1; AHgh+RqijGf+Z2hMf+yI64ZfoR/fJDXQprYTuWhM7r3ziL8NnqNUDsBpKHS+GrUODexBisItRnJes0ZxOrfcb9Nnwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKIbwM2dINJ3wn95hX960pDi7j87yRD1aa4Zt9L8oPWPUFTiJB
	ZTJXKF+2u4UOxDIKrAxZrVFmNx8B2WfDpgzrJHXzHrmbiyQL/DhUb1qF
X-Gm-Gg: AfdE7cn4QW8kQVSnfK3l3rVQ9v7T0qtHDFOOdQiTMlOvFrMplHC0yfBT/OBm7GiB9sd
	fzGTCmOuoMZ+jkzmPTdWuEOtpvfzVwUXnTpvwljAKNmLZzqFI9dnKJtg+jyYNv38Qz+uV292YSS
	esA61B8crqx2PwDWTcV5s+4/1PYfPWA/KcUvcnwrXdmdQcJRnMK6u2ujQ6YxXUi/AB46PeOyhkO
	Pvm2htsIg+HSl/CkYZzrK98RXPvQq5MLh/kI/1xLuJYHy77EDFRDY71kbsKm71XiXpIqlk4NfsZ
	6qilKlQEJF2z74my3j7eYWLNt4JP6ol0ptGxzdeyXgUDuL+TXrRLcgDmCLCTdvV1Bjjme9/boJM
	YScbgMv57A2Mo+75SL9aUWDQ34CDirK107c/3yCAVKWE76/7cUlEb8tFy+ODAdizeEIeI4rgmWk
	1oLUfA9iHkMh5jITPfWf8bA3r+8Qx8ATWNCvwLBe3lnlVfK3Q=
X-Received: by 2002:a05:6a00:44ca:b0:845:d285:3b67 with SMTP id d2e1a72fcca58-8479f26f9b7mr1978158b3a.51.1782801519609;
        Mon, 29 Jun 2026 23:38:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:39 -0700 (PDT)
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
Subject: [PATCH 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:47 +0700
Message-ID: <20260630063449.503996-26-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073845_374655_B04EE644 
X-CRM114-Status: GOOD (  14.12  )
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
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  8 +++-----
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 2787524c796e..e784e8b7d167 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -428,13 +429,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
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
@@ -456,14 +457,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq) {
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
index 4796fce084ff..5ab1d3961409 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -79,7 +80,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +127,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +403,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +450,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


