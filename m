Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F2606A326
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2YSnG/X;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VQVB+vHH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=; b=Y2YSnG/XN7W4sMduvnoCjOwJH2
	xdSNk+P9SlTORXTQd9pzmBx1IoUP0aTpXlIq8F6ISvU0CSEn9C9OSLARfhERJTkJ/2gAOJtK4lnXz
	+aU44V4R1C+WeM861RF0mP5WWBBTTsw9rcGpb1VQY1sAU382MlzOtOPJ4PtSP1nybLat37mEMtEzI
	qELbsGIqx6HhEvvJNo0JcAQtnlWGhK2YBGFU1JiM4xBPrzB6TtXSkgrHcj/J12Ecf2KAqGnbNWTt5
	RBLlEVFegx9AEeL16VZJvWZHqydV3PmASDxOFmDnC4by7a+rCzCjqjjocN5bKiy5o23hyJXtb4hgV
	kV2LHYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOAf-00000000cxd-3MI6;
	Mon, 09 Nov 2026 12:08:21 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOAd-00000000cwm-2QaW
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 12:08:21 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-15ea896ddc8so1438100c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 04:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794226098; x=1794830898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=;
        b=VQVB+vHHRYO/c6ADphSOberJeb/AcxVIhkj7/l237BInDdsert5zos9Qtj0tW6wlEo
         xRqlwST/rZmzJ5cZRk4a8PdtIh932Y7PGZGjP7UmLNqiyM07GziJUtFC4w/N/AyF2+No
         eGvdxj3vbigvByXqCHaGqKSEFa22WP3Bk/IxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226098; x=1794830898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8x7zVGGkfSdWA+EkndmqEqSgl70Bo/p7FSSNehigJg=;
        b=SFHt343sLxvR79DYGVU6QyRNsMaP/VpZXQFlnAD+UBkxpNU0Xt4xftgKcCj9X0Uciu
         XVBeq6izk87ujjpclAXpfrthBEod5AJ2Y/1834DPsPaLnBikH6IYuvNu8TOy+joew4lV
         /MMYjwS3nB2r1LowQNTJ3nbwtkx80+pYp6Xwtn3gjAXn93QdAi1VadbAjlCHmHS+pbkE
         7+gYl7mhA4K9ryyNiMgFT25IDOHjY+yzqAkkPtDBx1zHsG6yPwVqvl/IWxmncTR4qt5h
         xEFLPtsSWFPehxlLw8F9CMbY8JL7NxHcMsxCmQxDIpQndS6Lw1Wp6spyVAETEKi6M9ne
         0C3w==
X-Forwarded-Encrypted: i=1; AL+hErGgo9aqWC43xXLjuoZsrmqrFhKH26ZprOwnJ1UwcXzrCzrwWGjICf2ep5oURDe0w+4ojAcUuv+JE6ePi/iIjQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8EM0ictFqmBbAUoN8ZO6LFfSMvdfCO3zFmUHpLZgn4aG+ZbpUv
	K95OovOSe/gnG54BkRX+HWM6yn6zTnqF3L+SPKpdzKkTtyO6q6zF8OxN4Ba5wr4LuDpUcyDTfz6
	K/L5xlIg4
X-Gm-Gg: AYBFou0hg8vAmyJpS33WxygWbyZ688TNw5dgej56QAH8OJ9tmekTQtLKvqqFXvOjhDx
	EYqM/z97eOi1CznPaNTyxi872Ezv6uX+dR8S0OjnK2N3wK4S3tEXS9PV7pJbGTlUX168ZBv0mt/
	WJe2bpHmrEPjm7+7f2X9XKgXT52/v1gKDGIg1icyUPMqLQwfiYRFAFmj49h2ZqOWOY/tiFDv75h
	fW/8Vblp1l8FfRlrLC6ygYZprUChESd9748FvFNLY43GmoYSZmWy19FYtHjvjSRfqIw6rQb2NFZ
	R0NMlwfkshrIz51CzKfgPTy2l9G3upUakePJyjd+QGkkxTg/jDFozuYzVhDVHkS3UieeqUOL6tA
	+7c1l7mZUV0I2U0EizLMoAOnLhMeHZHGY9ut9Ec3e48rmco0TtWRPW2y7+HEsEGKaOqCwaHMwIy
	1zLXbtT4aCOSSjL1GPJ+ZIwiOvYxJCYD+5apVbC3mwwVXY7a3Pi3APT7NeVfvF0muCi5M/tL2Gw
	EpJBDkfhgLvYHO8700N761f3bPaknCOy41yApKiKqswPZTLgZDtImRrNVWEucV8tmrO0W5PnDvh
	iQyxWjTHrUuJt+slWwLBnrbV2bsY55ordt21ZGDF3FSVDJmm+7f8U+wM9OStWzBLNAamCmcqJGl
	Ubami/w==
X-Received: by 2002:a05:701b:270c:b0:14a:8cff:fbb8 with SMTP id a92af1059eb24-1b39fea8a78mr6100575c88.28.1794226098355;
        Mon, 09 Nov 2026 04:08:18 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3755e936bsm16025308c88.6.2026.11.09.04.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:08:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Ryan Brue <ryanbrue.dev@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource/drivers/timer-mediatek: Don't override the arch timer sched_clock
Date: Mon,  9 Nov 2026 20:07:56 +0800
Message-ID: <20261109120757.847266-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_040819_782375_9DEE6DC0 
X-CRM114-Status: GOOD (  20.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the driver was converted to a platform driver, the GPT probes
late, after the architected timer has registered itself as sched_clock.
sched_clock_register() only refuses counters with a lower rate, and
sched_clock has no notion of priority, so the 32-bit GPT counter, which
runs at the same 13 MHz as the arch timer on MT8173, replaces the 56-bit
arch timer counter as sched_clock:

  sched_clock: 56 bits at 13MHz, resolution 76ns, wraps every 4398046511101ns
  ...
  sched_clock: 32 bits at 13MHz, resolution 76ns, wraps every 165191050201ns

Before the conversion, both drivers used TIMER_OF_DECLARE and
timer-mediatek.o is linked before arm_arch_timer.o, so the arch timer
registered last and won.

The narrower GPT counter wraps more often and is slower to read over
MMIO than the arch timer system register. Doing the switch at runtime
also runs enable_sched_clock_irqtime(), which may sleep, with interrupts
disabled, causing a splat.

Other drivers worked around the same problem in the same way, see

  commit 37b8b003c483 ("clocksource/drivers/sun4i-timer: Only register a sched_clock on sun4i and sun5i")
  commit 10720e120e2b ("clocksource/drivers/imx-tpm: Exclude sched clock for ARM64")

Only register the GPT as sched_clock if the ARM architected timer is not
present. This currently includes MT6572, MT6580, MT6582, and MT6592, as
seen in their respective .dtsi files. This follows the example of
sun4i-timer.

The analysis of the boot log and git history, and drafting of this
change, were done with an AI agent. The agent originally proposed using
arch_timer_get_rate(), which was replaced by the author.

Manually tested on a MT8173 Hana (Telesu).

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

For the ARMv7 SoCs such as the MT2701, MT8127, and MT8135, the firmware
has to correctly set the arch timer frequency, as their device trees do
not have the clock-frequency property.

OTOH we could let sched_clock_register() reject replacing the current
counter if the new one runs at the same rate. But that would be a
separate discussion: if more drivers are converted to standard platform
drivers, then the probe order is no longer easily known like before
by the link order.

The splat is a separate issue that I already reported [1].

[1] https://lore.kernel.org/all/20261109095036.GA722431@google.com/
---
 drivers/clocksource/timer-mediatek.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 1b2cbcc2795a..ef67cc783635 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -15,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
@@ -334,8 +335,20 @@ static int mtk_gpt_init(struct platform_device *pdev)
 	clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
 			      node->name, timer_of_rate(&to), 300, 32,
 			      clocksource_mmio_readl_up);
-	gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
-	sched_clock_register(mtk_gpt_read_sched_clock, 32, timer_of_rate(&to));
+
+	/*
+	 * sched_clock has no priorities; a counter with the same rate
+	 * replaces the current one. Only these SoCs lack the ARM architected
+	 * timer, which is otherwise the better sched_clock.
+	 */
+	if (of_machine_is_compatible("mediatek,mt6572") ||
+	    of_machine_is_compatible("mediatek,mt6580") ||
+	    of_machine_is_compatible("mediatek,mt6582") ||
+	    of_machine_is_compatible("mediatek,mt6592")) {
+		gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
+		sched_clock_register(mtk_gpt_read_sched_clock, 32,
+				     timer_of_rate(&to));
+	}
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
-- 
2.56.0.455.g6c5a503b38-goog


