Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CE4C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 02:26:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0857461432
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 02:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0857461432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=swsL6/gQBDcCJThswkC2zPFjkHkH0k0uVEWAH36WW00=; b=UsD0jvf+deCfYNqedBgX9Nnpev
	5x1vN3tmO8wj/U42Wn1YarYYuJAgpgt0ddmCcRfZVq30R/hNDf71X/lKAumqOywN56TG6kqVnu0a7
	icxEu3yVqUL850mTOhGUwykUIjXpVsMDllvS2v7uWbJC5XIHNpGMhx8dZBsZcuOe93GEvWxpKovu6
	hEm+aRqj8SwgMHaSZbFMDKO9uAKi4uKjxHyFmfkwr39eFu48KL1opmslwFdSBCwOcrrV+E2cQ4TGc
	b9faqb7i+6TZ8XCQv3th51hl7WrJRvEW+pGUzmW92QaAsTC0b/XbiGOJM07fLo6W7Pb8A0PG/NzQ3
	Kv97d+Sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgeZo-001mL2-Qn; Wed, 12 May 2021 02:26:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgeZY-001mIY-Ag
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 02:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=NFXf1SUAkReC3MtaV1k9mib3TBX01qLYNs8RqJ8r1VY=; b=WFDDSupi6YfqkxpAoSYisNRxdh
 12oOFNpxSC8y2YK2JzG2E4HlHk0Pdo0Skl0Zea5twW3fSI+9vwQlZFIzGkT2iDOsMEbAecFCqYSs0
 YRazomtQsGrLpM51A+YH/7aiG3A1W8lMpow1gVbFxWvS61+MHOzoKqIii5gRu9MpG2/hUQ23tBgxN
 kIUiCg+s+F3J/CzxIYpYD3y8A+xHnXvIvGmabb+PkckUvHtMs8cwGJMLysfzURaTea8SpaxUdYjKa
 on0QTgFwNG7wwurvdto/bOuB6rp97bKhPMQruEMBH1XNSAA24FJ+KjyJHAzPDQluv4bkeqibHhDwJ
 EqgYogTQ==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgeZV-00A3Cb-OU
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 02:26:03 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 lj11-20020a17090b344bb029015bc3073608so2473553pjb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 11 May 2021 19:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NFXf1SUAkReC3MtaV1k9mib3TBX01qLYNs8RqJ8r1VY=;
 b=WDry/cE9LcDDsvZONla927KdK58kdOq5cMvJBpA/+C5Roqpjz/q/YVsY9EPXO1hhfr
 K5wljKBiFwRzt19KANN0iSIz1JSgxbM1OGBwg4wa3rYfw3xFn6/zmE1hmjPB4jCpCQNH
 qgw/AdJ0gSIPx9mIWLjg3MP7RbYX1IU3BnB3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NFXf1SUAkReC3MtaV1k9mib3TBX01qLYNs8RqJ8r1VY=;
 b=UM7BsCQMLE05wQAea8lsISaSC2FzU+UXFap11tCEgBr30Dm5hdosHoAumdaBcEI4k7
 7YlhK1qRlUdp/6vnrVkunEHShtj9VjPbo6TvYpSJWvi0t4V1CVaUjppLIHRLeNVGRmKQ
 fLUC3i6TfBhv7ij7t9hax2mR1l32vQ6XYP74aH0NlD2s6Po6/yrKlZZXxKZsYNbvHVke
 Cq1aGvXjQzEMSC5UEmdSAyj348v6E8/0XmxzUpo1PVY+kG7KCMGl3oBOwkC98pVNLkv8
 ZUjTr2KfoRESy4g2Ry1/Fh4ji2NFAh9PgY4nA/Ekfpgu5A4+Ry2m2jYwlTQS2CiB/8Up
 14Sg==
X-Gm-Message-State: AOAM531k3625kUTRDODQ2YDx4el9yVfpzy/4Lkizmp4ZdkA7iaiKUcNq
 LZRZWJAy4AnHR859SFfgzCgAbQ==
X-Google-Smtp-Source: ABdhPJxZh9XbVa0O5QvQA3ScydCZHBQ1k/eVLELOoCUCninL/YfEiRK9LcXbyUUwaKWXqBq1ffFctw==
X-Received: by 2002:a17:902:b183:b029:ee:ff72:f580 with SMTP id
 s3-20020a170902b183b02900eeff72f580mr29650246plr.26.1620786360149; 
 Tue, 11 May 2021 19:26:00 -0700 (PDT)
Received: from evanbenn1.syd.corp.google.com
 ([2401:fa00:9:15:83b5:4bca:90bf:147c])
 by smtp.gmail.com with ESMTPSA id t10sm11716797pfq.68.2021.05.11.19.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 19:25:59 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Evan Benn <evanbenn@chromium.org>
Subject: [PATCH v4] drivers/clocksource/mediatek: Ack and disable interrupts
 on suspend
Date: Wed, 12 May 2021 12:25:44 +1000
Message-Id: <20210512122528.v4.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_192601_831281_9BD7609B 
X-CRM114-Status: GOOD (  12.74  )
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

Interrupts are disabled during suspend before this driver disables its
timers. ARM trusted firmware will abort suspend if the timer irq is
pending, so ack and disable the timer interrupt during suspend.

Signed-off-by: Evan Benn <evanbenn@chromium.org>
---

Changes in v4:
Fix the comment style.

Changes in v3:
Move the ACK from the shutdown to the suspend function.

Changes in v2:
Remove the patch that splits the drivers into 2 files.

 drivers/clocksource/timer-mediatek.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 9318edcd8963..ab63b95e414f 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -241,6 +241,28 @@ static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
 	       timer_of_base(to) + GPT_IRQ_EN_REG);
 }
 
+static void mtk_gpt_resume(struct clock_event_device *clk)
+{
+	struct timer_of *to = to_timer_of(clk);
+
+	mtk_gpt_enable_irq(to, TIMER_CLK_EVT);
+}
+
+static void mtk_gpt_suspend(struct clock_event_device *clk)
+{
+	struct timer_of *to = to_timer_of(clk);
+
+	/* Disable all interrupts */
+	writel(0x0, timer_of_base(to) + GPT_IRQ_EN_REG);
+
+	/*
+	 * This is called with interrupts disabled,
+	 * so we need to ack any interrupt that is pending
+	 * or for example ATF will prevent a suspend from completing.
+	 */
+	writel(0x3f, timer_of_base(to) + GPT_IRQ_ACK_REG);
+}
+
 static struct timer_of to = {
 	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
 
@@ -286,6 +308,8 @@ static int __init mtk_gpt_init(struct device_node *node)
 	to.clkevt.set_state_oneshot = mtk_gpt_clkevt_shutdown;
 	to.clkevt.tick_resume = mtk_gpt_clkevt_shutdown;
 	to.clkevt.set_next_event = mtk_gpt_clkevt_next_event;
+	to.clkevt.suspend = mtk_gpt_suspend;
+	to.clkevt.resume = mtk_gpt_resume;
 	to.of_irq.handler = mtk_gpt_interrupt;
 
 	ret = timer_of_init(node, &to);
-- 
2.31.1.607.g51e8a6a459-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
