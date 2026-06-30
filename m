Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF9C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=; b=rUu+WkrQP1XJWg2HaJ0JRxLuEI
	1f+D7qgyyRZ111LdLpSLvKb2lgUMF2BnD89FcR8iS/0ZojY3eIroRoYKYsTjIjteaK7s0NWqM6WOb
	tzbD/aKQxlTBQ9Q+yAiPJlDFhAKuDxEg4vQxKofZTv9UBo8YlOb606uTT45xf660WGQqlzL4gnBso
	iDcVKBmBNz7M4gGkZtf/x5B0govKpMUt9ak4cKq4EPhRssjHVN1TA28JbOBGBS8vlTvtMmvYh6Xxa
	MOe7U8/vt5PLlbY2JEl8WC4ST+wUiTqwxywa7i9ekCcJxbOTxRHtRWIGMFbVgMxr3fXjJy50/LwZX
	WF1zLqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7O-0000000G0jh-16Jp;
	Tue, 30 Jun 2026 06:38:50 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7L-0000000G0hT-3wop
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:38:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8471013fac2so1079248b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801527; x=1783406327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=LhLedLuYywyqaabEyxekawe95h4rImpCmXFGTk8YPqJJ4iBfNsP3o5yULK8U11cMXe
         3zDfERGMSKZiBxwDkrQSexviJJle+RsvRex3Pm8rKs5/zP56j8gBYoQgUbBx96O5/9nb
         AZhxazWWFzXoGSg3ceIJI6LAiu0n4z7lbci5VrnIAYwH7uMfDSpQenGfUnOJ9H7LP3TL
         YaXuemDeHbUoxiReyw++uA/dwAGZ1e7Z9Deu0taT9ND7noIjvVwzHmy0q0vlmHET8F/r
         +yOMk+BrQSfRIFZ7TKid/DqcuMvbOPD5526xsaWnIKU/pbJY2g0ecVbPBPmsxayHhKcY
         6MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801527; x=1783406327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=oVzkFb1G7pwcX5eEZEaX1zFnyxLr7q4cfQ8yXr6Sw3ipx4g5SxvT8S7aXJ5mDAPB4G
         VaAv0EMK9wMzTi3YDACJ3FlC0gZdbep0uz9nk2p2nENC8YfnKnnirmNRgKX+ypL/8pZ+
         OHSg30JXq5QHsuRkyrvMpw5DTT1wckMMmBJMA4AYoizfXwZ3Xr7YQjUBjfb1pH+mUpdV
         i2Eq9KTz/RAhvhy3yLykQhSd1vPYr8qezWEJ2zjeVYsJ6j9ULK6oE1jfVesnc7ROikRz
         KJlqNe5oUS+1IjWAYbaizTdClahkXjSgOWvWoq53JRp2wP+AdnVsBMnZgoBF+GGSoxNG
         EjvA==
X-Forwarded-Encrypted: i=1; AHgh+RqzHRAiQWlrw3VSwL2YBUOCV5UHX34+S1yYnfjjoYrQW7qHqbhtIXekic7bZ1Bi/THQZNTOc9jg2g2Bk/s46Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3F6dLfdMSfg32pYVO3+step+KcDIA72esAX1pQH/ByUJE9UvB
	tnY5XSUb85IYxzTDOp15ew9xFx4jQVKrRDQtugkSnEFvcAifX3QbWRy9
X-Gm-Gg: AfdE7cno/5BKzy0cIzNxDZi+wpzPJlEpvDgjZry3ffdrlCmrddPptNWYYqfp326OUZB
	mqQpfdRc9/3+Kg1WtAmxZElo5PPj/O6DuO3QJxUOXndc/fOAYwmf2bfKEOrL/c1IbmaHkuGzRfb
	PqWsbPxl6f5RO3W+OyDJ+EK/5db47soXTwwwxfMdMvXa1BkIfOolzjEiOsmx89WNc5qiS30W7Ul
	3+jpWVhdRW2oiQarZm8+o1cnquEQoMOyR1EuRl8JZYUTffQEvCaXNNm0kbIqOagmh4GuP9UBGu6
	jwDB0bbTPoHMtfaGdPm7jClOljMMlnN+31ht+MBmd0jh89qG+QMOXWd++EmOPdsdZwZbJtcg7nH
	tJIVVNaedsinBPf2/++ghu/y3tm6Oe1XxrIa8TrguA1maCFC1cNOvHh/2ZbZDGwgxnwjYLPLOUn
	mzqaA2Lu8XOLfDsgm0dKVHbpBWDitvAdQ5DA1gdzFB9opbiB4=
X-Received: by 2002:a05:6a00:1256:b0:845:bda6:574b with SMTP id d2e1a72fcca58-8479ee84b9emr1943239b3a.5.1782801527316;
        Mon, 29 Jun 2026 23:38:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:47 -0700 (PDT)
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
Subject: [PATCH 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:48 +0700
Message-ID: <20260630063449.503996-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233847_997741_3131B4D2 
X-CRM114-Status: GOOD (  13.45  )
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 02df04a0ddad..f4f7fc306ea5 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -467,13 +468,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
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
@@ -495,13 +496,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq) {
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
index 35960c225224..159c35d19dba 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -5,7 +5,7 @@
 // Copyright(c) 2024 Realtek Semiconductor Corp.
 //
 //
-
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
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


