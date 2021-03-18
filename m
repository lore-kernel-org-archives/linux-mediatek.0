Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6374EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 05:05:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F407364F21
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 05:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F407364F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VLnu0P2vAAxkcDe6gCGudgqW6GcLPNsXab6g74mLP3s=; b=FrXUSocehRz1AK4CiW4Cs9+uV
	G2Zt2O4/TiKaHaophglNqSlzRszlx0s7OaLKVAwSQLGHNQklbureUDLkaSUDEPEnW/+HVc2lQL1zK
	CdaT+VYrfKfJxpGAxlDi/Ia3IxNRkPDsUXEnivxPWEB6aPDhSeV0W5ZYSfEoi1rVcNIquQ6M+pJP1
	gqpGauBFIPYMtcPwSQmhWi5jr1REIBzehiFTBFmRtXl9mmJOMidI3M2qiOO5aII+5eYI2wf0bpqEL
	Zg64rgKUmYmSrqx6AlOFJcI3jK5VealEw0ObwQr0bGoVr6TMS2LoVltDB1G16bR6hUsPOM1I3xjXq
	WVfBq5snw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMkqr-004UTQ-Ft; Thu, 18 Mar 2021 05:05:41 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMkqM-004UMH-5r
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 05:05:12 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so4414061pjb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Mar 2021 22:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7onWsTpSsS7L6q9I9y9OFyM8B5rHSYCwAdPuuzVWDdA=;
 b=Qo5xIFp0u3RFXcLMywPvucE5stdaYlWfndN3bW9kIk72karyW3dcWY6M+B92+7EbZL
 S4qI14CpnAiPHmv/EWFcrQPuAeQ8RTV/tp9eD+jDXAyBkLoYZ8Uk1DNPTp6Jr48eMlDq
 dUeafyf6xDemOZNZWPlJ+4hKIq5egZAAR5b2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7onWsTpSsS7L6q9I9y9OFyM8B5rHSYCwAdPuuzVWDdA=;
 b=kNR14hnUXxrZYlugkyMRR/YAN0eO4saRKrQ86HjQ4WvvZjJcrWQ5nQtcdTyvy0w5dF
 SWws6/DiYfYt2BehkQCEdl6utAi1OXx22QCextm9QRVTu1vyPerGaGCWENF+pRvp9KY2
 1O9GOjU6LoTLuSnM1TtprQbh/S0qB6T30tbjTZoI25yHjGtt0yRIW7ozqUogh6BMsYqo
 J9dVB9OcV556UNqZk0j5J0kbnH1OggBS61zyccIwv3HTi+K79gqHEE7t9Qz3FnHYangC
 nTBcgrUfzdUrwVDIX65+pataa9bvKAwj10CQtz2b6IQ88nBxhCvMiipaQ9uOYKgmcC6r
 7pMA==
X-Gm-Message-State: AOAM5317X3JwcssJsoNAq1VHfcK0+Sf6lI32g6wT5+K9PlMHvSpOK29U
 8fmJGDixG7Pvye2RZlG8xsEotQ==
X-Google-Smtp-Source: ABdhPJzurdZlUoc6ipkxjFah/4DrB/R5Vj+hTtzkMO+w/3yti/os6EicWmS7hBbyqr3WVdg7KZ35pg==
X-Received: by 2002:a17:90b:305:: with SMTP id
 ay5mr2358668pjb.74.1616043908804; 
 Wed, 17 Mar 2021 22:05:08 -0700 (PDT)
Received: from evanbenn1.syd.corp.google.com
 ([2401:fa00:9:15:d0d6:1466:f005:1b0a])
 by smtp.gmail.com with ESMTPSA id e8sm701450pgb.35.2021.03.17.22.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 22:05:08 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Evan Benn <evanbenn@chromium.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-arm-kernel@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 2/2] drivers/clocksource/mediatek: Ack and disable interrupts
 on shutdown
Date: Thu, 18 Mar 2021 16:04:51 +1100
Message-Id: <20210318160414.2.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318160414.1.Ia2a09ce93b47eac45308205820db0938d47604df@changeid>
References: <20210318160414.1.Ia2a09ce93b47eac45308205820db0938d47604df@changeid>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_050510_452007_281AAC8C 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

set_state_shutdown is called during system suspend after interrupts have
been disabled. If the timer has fired in the meantime, there will be
a pending IRQ. So we ack that now and disable the timer. Without this
ARM trusted firmware will abort the suspend due to the pending
interrupt.

Now always disable the IRQ in state transitions, and re-enable in
set_periodic and next_event.

Signed-off-by: Evan Benn <evanbenn@chromium.org>
---

 drivers/clocksource/timer-mediatek-mt6577.c | 49 +++++++++++++--------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek-mt6577.c b/drivers/clocksource/timer-mediatek-mt6577.c
index 9e5241d1876d..44598121585c 100644
--- a/drivers/clocksource/timer-mediatek-mt6577.c
+++ b/drivers/clocksource/timer-mediatek-mt6577.c
@@ -54,13 +54,33 @@ static u64 notrace mtk_gpt_read_sched_clock(void)
 	return readl_relaxed(gpt_sched_reg);
 }
 
+static void mtk_gpt_disable_ack_interrupts(struct timer_of *to, u8 timer)
+{
+	u32 val;
+
+	/* Disable interrupts */
+	val = readl(timer_of_base(to) + GPT_IRQ_EN_REG);
+	writel(val & ~GPT_IRQ_ENABLE(timer), timer_of_base(to) +
+	       GPT_IRQ_EN_REG);
+
+	/* Ack interrupts */
+	writel(GPT_IRQ_ACK(timer), timer_of_base(to) + GPT_IRQ_ACK_REG);
+}
+
 static void mtk_gpt_clkevt_time_stop(struct timer_of *to, u8 timer)
 {
 	u32 val;
 
+	/* Disable timer */
 	val = readl(timer_of_base(to) + GPT_CTRL_REG(timer));
 	writel(val & ~GPT_CTRL_ENABLE, timer_of_base(to) +
 	       GPT_CTRL_REG(timer));
+
+	/* This may be called with interrupts disabled,
+	 * so we need to ack any interrupt that is pending
+	 * Or for example ATF will prevent a suspend from completing.
+	 */
+	mtk_gpt_disable_ack_interrupts(to, timer);
 }
 
 static void mtk_gpt_clkevt_time_setup(struct timer_of *to,
@@ -74,8 +94,10 @@ static void mtk_gpt_clkevt_time_start(struct timer_of *to,
 {
 	u32 val;
 
-	/* Acknowledge interrupt */
-	writel(GPT_IRQ_ACK(timer), timer_of_base(to) + GPT_IRQ_ACK_REG);
+	/* Enable interrupts */
+	val = readl(timer_of_base(to) + GPT_IRQ_EN_REG);
+	writel(val | GPT_IRQ_ENABLE(timer),
+	       timer_of_base(to) + GPT_IRQ_EN_REG);
 
 	val = readl(timer_of_base(to) + GPT_CTRL_REG(timer));
 
@@ -148,21 +170,6 @@ __init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
 	       timer_of_base(to) + GPT_CTRL_REG(timer));
 }
 
-static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
-{
-	u32 val;
-
-	/* Disable all interrupts */
-	writel(0x0, timer_of_base(to) + GPT_IRQ_EN_REG);
-
-	/* Acknowledge all spurious pending interrupts */
-	writel(0x3f, timer_of_base(to) + GPT_IRQ_ACK_REG);
-
-	val = readl(timer_of_base(to) + GPT_IRQ_EN_REG);
-	writel(val | GPT_IRQ_ENABLE(timer),
-	       timer_of_base(to) + GPT_IRQ_EN_REG);
-}
-
 static struct timer_of to = {
 	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
 
@@ -193,6 +200,12 @@ static int __init mtk_gpt_init(struct device_node *node)
 	if (ret)
 		return ret;
 
+	/* In case the firmware left the interrupts enabled
+	 * disable and ack those now
+	 */
+	mtk_gpt_disable_ack_interrupts(&to, TIMER_CLK_SRC);
+	mtk_gpt_disable_ack_interrupts(&to, TIMER_CLK_EVT);
+
 	/* Configure clock source */
 	mtk_gpt_setup(&to, TIMER_CLK_SRC, GPT_CTRL_OP_FREERUN);
 	clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
@@ -206,8 +219,6 @@ static int __init mtk_gpt_init(struct device_node *node)
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
-	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
-
 	return 0;
 }
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
