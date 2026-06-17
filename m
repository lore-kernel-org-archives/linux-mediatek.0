Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5DACD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWpi+WrLr0HzmCcxgPyTE3MUTCsBXdlrFvgGYBNgrFE=; b=sQ0qXIMkd3RFbBKRrMvMB3BkjR
	nmzKSUY/7eIkdf9CQWO/2mD7eRWFrJ43MjJeKJ4tZTlTu54Ci/NUClCXzxYY+0mdTSVPMyVfOfA5p
	sohEDOYP2Of6ofVTb8Zjk1RyMmFL+vxFs/3AMc7O/dwKt8EJQWmfMxFd1STUDCPc85cYNQ+StY9BJ
	flzx9eY0q1twKO5LUTLqZj8lfWyzdPVlbY7/uSh2Hb+Am3d5YqQ2pJObDBaruKkE3Gk3Z2JxuS6sh
	4gV1P4DJ4LF7rpmI7YcGys8mC85ovTIwt6Mi9qc0/OuzwhwW6QHsf/CoerLMwKoaNAbrKolBFQXVA
	0TYwQ6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhX-0000000H9gG-0lff;
	Wed, 17 Jun 2026 10:40:55 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnhR-0000000H9cf-14nj
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:40:54 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-304d8362a58so604410eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692848; x=1782297648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWpi+WrLr0HzmCcxgPyTE3MUTCsBXdlrFvgGYBNgrFE=;
        b=Kmcr/2+htjcmdsR+GgboVJv8IrK/AujrAcNO7JnVMJ1uKs72JSCDJQHX5KySoh+ZKg
         c10hRusl0n/PDhNPHi2YmcGAlpYfGpRG8lHkBcNgm8puaAkskA6PjjTnvNgtOaEdR/WP
         WziOf6M8vPizaItNGgKojtfoczIluSWsIxvMjCILBh5FNq7S/zDytXQdeffLvBETHCfD
         vslcUYN1ptJUceys+0JjFlSDhV3omBcGw0kHegMo0DYBLxyixXioAuwR4ugLs1IfSoa0
         9M1TrSISg3+QG9rg3GNi8fpUgfYclsXIPZTnvwXXA+7UFZh/E8Ij8kN5fI6EX60rQXy/
         EQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692848; x=1782297648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWpi+WrLr0HzmCcxgPyTE3MUTCsBXdlrFvgGYBNgrFE=;
        b=RSWvxykeMcGvtKu0AuZ+j1DO2bJYsjncBG5tNstcOP46SdsyUFD2nk1M2vGrOw3/Fv
         UUON86UBxcM0W+cPdEkVPm2Yr2XUx19ZRI4gQ/HZzMi5q6IivdW5DO2LRTUFXiMWKssh
         3WzOtfdcHdEP55/UnTXIrweuwjSTyD3ENTaBD1Qpi+5ALe37ERZz9BDJHpZYzrXBi1gL
         SelGVwePqFrxaDKc9/9bXPHlzWri4pA83xDlbwaGACD4JZXel3VXT047hjI3zgoQYlTN
         HxFkeF5HxRhrMfsL5kYQ0ROtnwSUQy5OOygRfOGLptRp0XDBisdWEoYlaYLO2s+mmCHK
         GbcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PSrjPgB785xjYxnbQEqitog4CGDBiLFyVsCgw5g7vOOsmLz8IlHk0p2I3sSRqBaeEaKX/kUURqx14OH+cmw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf+L3YpP3wJNSUPxH2Xe5cMTcpll4jAgLRbW/2FGdkPxCueKct
	sw4uXEsK/iWx232ZWqlSJDtpyC5w3lyBaTW95pa51Hb98UWiqoxPyHvi
X-Gm-Gg: AfdE7clxd1ivfLNWJf+CD+rBCMIVGCkruxEpfBbCeVPWUEtv++fmuOgCx/CV1YPZYi9
	6QSr0Pr2P99S+lzCI/1VuAvkI1HmRp5+IrqZT16wUo5zAAmgtWKMIudO9573pM0GCZtdIOUPwst
	N+P0/4fU7CaZCqZBUuhm849KvqpsH+/PkbDRYrSNq6+nG5UtuVKg2++hJ2znLnpnu6NmPxxB0q2
	quT1z05dQrBCn1yZh7V5x8rzC1BNl85YRQry11bNZk+IpL6lKIoXObNBnLDqgjsbPbLu086OZJ4
	F10k6jygFSJK8PqPxFLvpllR27NI7+9RF3hW2eiFWz7lSQGxjvgCxPhyZFGRVHx2ZwgG7y7GH3B
	UrccjVmEkiA7Nbu36txIk4atcJoNI+LwXr7+oW7dGN2ctx9MQGCCJY+MARRVp6BfQEDuyYoPvyE
	2xo9K6xRuWmDphM9epXX9IpDIXLIVNBanoTl32FhEgKS8StnQ=
X-Received: by 2002:a05:7300:ea06:b0:30b:7bc2:c70b with SMTP id 5a478bee46e88-30bcf0900aemr927511eec.9.1781692848447;
        Wed, 17 Jun 2026 03:40:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:48 -0700 (PDT)
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
Subject: [PATCH 50/78] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:07 +0700
Message-ID: <20260617103235.449609-51-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034049_307169_839850FB 
X-CRM114-Status: GOOD (  13.07  )
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
 sound/soc/codecs/rt721-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt721-sdca.c     |  3 +--
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 58606209316a..0ee78b28a3ce 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -315,7 +315,7 @@ static int rt721_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt721->disable_irq_lock);
+	guard(mutex)(&rt721->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt721->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -382,12 +382,9 @@ static int rt721_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt721->jack_detect_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&rt721->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt721->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -467,13 +464,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -495,13 +492,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..157269ba2723 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


