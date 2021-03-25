Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E907DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 01:36:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 882EC61A1E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 01:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 882EC61A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=htt5gNyVEicgAPu+8qPPlRaJb/wR1Zv3NbaGEstGY64=; b=gahUT05ThiaNOxC8i19KZ4aCMl
	Mh76xFYVFHEK9eith8FPUqTWkv5heNO4ZBPWQyQOL9+faBcOzAfdjSfu6hd+KwML7W0Z8YS1nz4u8
	e1JnpvwxSeVpmwSYYZZ2aW4e+am7DgioOfIvp/GuI8z6KuNa2ap56wIQAc2XBz24IwnyUJOrdmFv6
	RAlSaTtfC2CQyfY6yDNBawWkBLnCOrJxiJZT7vP6JYUcZSFma6RmPoIBhw3YBRWSVKOyaSgLfTznL
	t7utgSekn3LeC4TySIp+UtqqbfIE5lV6En7VcWC+0uTNo+2QjJYMXlqELB3QWODFsCI176Utb+jzN
	8Ja3yeFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPEui-000RTv-15; Thu, 25 Mar 2021 01:35:56 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPEuV-000RST-O3
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 01:35:45 +0000
Received: by mail-pg1-x532.google.com with SMTP id l76so199807pga.6
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Mar 2021 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNclna4r96z+ADs9Z6sKNU7TGol0SXSB3VYQsdRhSU4=;
 b=hBxECUX1Vkcjb71TpZJ98CXLuQr84nnIqLkomuaWFi3m+H6fZ2NSrM49RBs5o5bq11
 MyjI2tenjLJYYDG6wo07g94ffQSH5rly9K/9y6ne3voOIEhEsy81mTQOAyTM1viam5yE
 KVUA1B+unox70IVa0Jj+OdAzv67Za8B0nswRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNclna4r96z+ADs9Z6sKNU7TGol0SXSB3VYQsdRhSU4=;
 b=sZf7/H4z1KXQsEQ38Cn+uj5QdRRET8r78/gEsu5TNLi65dIveo4Zq6D7bL1ThrUbCg
 mN15BstQMFaPuT8xckCWmmoQzEI+Xbiwpt2vfqJ92LPtBgLvOLjwiJsg8dQYGGEdm7P8
 8tcdfdlUw2by8x71APQu7X4Z/8s6Z1s7nlt/4kwogGJ6rCADya83aQCOizhmUrzL8fX9
 DBiJ0cpuuNffKl77mJeWJCu5pSzVob2mgWGYUyKYHPVIPlXndi96rnZHlY336wTKP0gV
 Qz11HnUuN5eeaUqUp7l/2ZHJsh12qYwPCL/l7YHcSnkEprLoVYWIoXKOrCbT4fsjZ7nV
 ukaw==
X-Gm-Message-State: AOAM532hecYo6JSCZfZqVflZXiSto7EDo+k9eafDQaO3tX+5FE6OwF7Y
 VflmecQnhBLUsyKTcVN01HnNjg==
X-Google-Smtp-Source: ABdhPJyaMBulk3s1mm/SNbnsxJGB+1AhFTA5Tqmuc39h8ixwGUrWDFzcvYQdzesbAeUlzQjkr6jIXA==
X-Received: by 2002:a17:902:7c94:b029:e6:e1d7:62b7 with SMTP id
 y20-20020a1709027c94b02900e6e1d762b7mr6522874pll.29.1616636141541; 
 Wed, 24 Mar 2021 18:35:41 -0700 (PDT)
Received: from evanbenn1.syd.corp.google.com
 ([2401:fa00:9:15:5d74:fcca:830d:3b2f])
 by smtp.gmail.com with ESMTPSA id w203sm3645602pfc.188.2021.03.24.18.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 18:35:41 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Julia Lawall <Julia.Lawall@lip6.fr>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mediatek@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Evan Benn <evanbenn@chromium.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v2] drivers/clocksource/mediatek: Ack and disable interrupts
 on shutdown
Date: Thu, 25 Mar 2021 12:35:00 +1100
Message-Id: <20210325123446.v2.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_013543_973204_B9E16ACE 
X-CRM114-Status: GOOD (  15.91  )
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

Changes in v2:
Remove the patch that splits the drivers into 2 files.

 drivers/clocksource/timer-mediatek.c | 49 +++++++++++++++++-----------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 9318edcd8963..fba2f9494d90 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -132,13 +132,33 @@ static u64 notrace mtk_gpt_read_sched_clock(void)
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
@@ -152,8 +172,10 @@ static void mtk_gpt_clkevt_time_start(struct timer_of *to,
 {
 	u32 val;
 
-	/* Acknowledge interrupt */
-	writel(GPT_IRQ_ACK(timer), timer_of_base(to) + GPT_IRQ_ACK_REG);
+	/* Enable interrupts */
+	val = readl(timer_of_base(to) + GPT_IRQ_EN_REG);
+	writel(val | GPT_IRQ_ENABLE(timer),
+	       timer_of_base(to) + GPT_IRQ_EN_REG);
 
 	val = readl(timer_of_base(to) + GPT_CTRL_REG(timer));
 
@@ -226,21 +248,6 @@ __init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
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
 
@@ -292,6 +299,12 @@ static int __init mtk_gpt_init(struct device_node *node)
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
@@ -305,8 +318,6 @@ static int __init mtk_gpt_init(struct device_node *node)
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
-	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
-
 	return 0;
 }
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
