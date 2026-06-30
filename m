Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C83C43602
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=; b=t/xV3E5dUBQOU8mIK7RAJCnMgS
	N/HMlzhCkWIbk+pgnT9CbCnAinrUw9Dh1d46P+4BS1bvLCPwrutS5TM1NsCY6X8wrVDEv97ijyna3
	DfyF3qWPtdABIioiDCNuwn/0ygPHXfyUCZ8Ysyi5X2qX6lIukj3GWZf35cdbrg+BGuwbmoh0N/ExM
	8t4BZpIbBTLMfWIzBRv61UNxds3sUF/lgEPUEzmvZRU7uruz8lgkaflcPPMobbqxQYKnVKLNof0Hf
	qe6itvw0JcKkI8tzLwNRRYcYaSvZsKq814DfMMuy5bxFtYVm+JKWEq7TH7b0trl6HxRLKLnXi06v1
	zSIZpTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7Z-0000000G0tD-20ZI;
	Tue, 30 Jun 2026 06:39:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7Y-0000000G0rR-0dvm
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=; b=fRqxGGSD++5AOxVtKBKt1m6UJX
	zXjdtJ8dnL+nDTW0k84qRFDBH3egfyTLhP+ZglCChbNrG7J/Rp6eBRpwL5tAZR8+PTe8moKrLCb5O
	XxISmS/fqrIbgTzSlhxfEbUJoHmaStWMjeauA2bo6WFPoUgu7xlc293kEVPwH3YqpG6Lj5w5kWzuo
	d9aTNaoVC2a7+nqcd0d/dt0591iBtDPBmeaVJwyUCtG/pdJXd8yvYdwgs8S1EWt5uCIKxO6kYXGXR
	ZGDu//3rjntnzhXvD3c0yuFSUsJZBns+8GdnKQT+a8gQKnXvN6OkwGoDLA58iGBXaDQq2wWFugf9c
	MeiiJYnw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS7V-00000001ZXE-0DBS
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:38:58 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84236f9b638so1782271b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801535; x=1783406335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=qKQKOyp/vq02DUy2NUwNRIb52rZZ+/Cnj3gCgHBZl6NcRYmvKeuVG/sMAzA3+LhFfE
         1HJ3iP08rDBPhNHigBIdfVsFm3Wyu0nlDPf+syspWAHHteu0Kd0R5nx3NtbMKmpf3lcX
         zAJwdEf0/fUPD+16qorasXw+rJb2LwMq1SiulxKGhTuUzmjNnOMcNOnvrhkjJW5Uvtlv
         mwWV6WkTNit/OjNwNSgXr8zJ4ZT69GT6jXEMdX+VpbEH1nzPCnpQmPDldFtnQo7NyAVz
         kXNcY5rOgugGgVZao5YllGHYh9ryTIL1jo0pATS90hXR0uhOstedvYloVBVFbn6kyEQw
         vU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801535; x=1783406335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=MfykelBj/v3snipjMaqHyz93fFnzRqWvjJw/M0M6sSdJ8wOpabthi/yFpYRkI3Uxmb
         x9K6E5BdBuil0M3XukogRp86AIU1dOJdRBpscTCzBvppO28ewzr+nSrkWxR2uysYzC/f
         LOvnz5SukuEmIDvdJHGOhi2gHhD8TjTGZJU3NyLuom8/lqhvGFWeXB1ssmLuYjOHmXF0
         U7RGF2lnoVA5aoz1X0jhpZcNnr0SaMPmJtNA/ofHPeAJOuCPWV5Tz/l3RucC99aOYvxL
         z96DvpRjhlIlphgzHDw9qsaBs7i6X7col86JeG8LoteZvsdhWIbbo9tINFmRWuIvLNA5
         TlNg==
X-Forwarded-Encrypted: i=1; AHgh+RqYnq0ANUhuC76EAbUJBp9tygbi9npIDNI3R/4kwFx55u7CWHENLZkAPYcp1N7dU2iiqyB6VFnh1f73HI7L+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3IQ09nrwOS5urmRn+k+HZDG19kLC5LGa1QLM/OQC5CSCtcYj8
	gk7wdmiCFpK1ODNqCLImdRA4H3ee0TCl1FRm9NNAuQf+DbVv8K0PVMAj
X-Gm-Gg: AfdE7clfgaFLvqK6tp42mu5wDIvmNQjB2gS5lHqydW3DbV1AbnV/DCh4vSrZIZ9CODP
	4/dUULq+D9CiWzMCJpS8vaZguCWsRmtcihBT88heq+ajf7NPPjVRQi62L3UPmH+sWFX1YrXU6yu
	cMzxAgUp4dtwFBmWupCmiuSrhnb6uPRlwYNeTU8XPlCpiYYYZZRzzqTpYcDRNEYDxNiE777EcKR
	PnHQZtdgNQwt//2E38tD/c5CRZvLmgLN2r7z6HQkQ6J4U5kNchnVMrqNkWqKvS0/TBKZsi/9Aaw
	4uSsHt9QESXnjWAt8nbKLIJG6u0lOO6SFVfU+5a28bBUJgjFXWJ5YxrPRiy4CnLu2p1pho6UeUg
	cbJM0QvYxGWb7VRM9rrbedG1elJ3/ukL8+f2rGWgTAnM3vC98MJXfaElyAIvzKaQmu7n0BSQ3mP
	FT/diLl0ztOnvFbFckWuh2K+K+Jk4vmurZDUa5IkMoqnDZ9GI=
X-Received: by 2002:a05:6a00:1797:b0:847:711f:49ab with SMTP id d2e1a72fcca58-8479f137897mr2189312b3a.22.1782801535253;
        Mon, 29 Jun 2026 23:38:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:55 -0700 (PDT)
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
Subject: [PATCH 27/27] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:49 +0700
Message-ID: <20260630063449.503996-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073857_401408_857847A5 
X-CRM114-Status: GOOD (  14.01  )
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
 sound/soc/codecs/rt722-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.c     |  4 ++--
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 284900933ebf..895b8b2ed607 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -514,13 +515,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -542,13 +543,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..decf9407ab6d 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -294,7 +295,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +318,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


