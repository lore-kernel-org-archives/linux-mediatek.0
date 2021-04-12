Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2630DC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 03:22:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C39C36120B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 03:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C39C36120B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0XqC60Z01DQ2PZwMC/N68JzkAwhIipnAQF8SnerQubI=; b=QvC06RteyP5PAz4vw/qov44yOr
	S8Hr/0UEOpWGILnakHmOPAGdMKl96YMeyTZ2OHCJk8dBtxCRA/X4grAxBAOizihAY5EREp6PmpY4l
	LVN6ap44sXBjRBJ5eipcrVBjXXGNENVawAQ1faOoBUtY+okfSyTOdwvCVCFb1VAaWqMidlLBbBWGX
	GXBZJvRWL1uAMXt7QepWrgK+zYsSp/lVYDFnzdFlBw2LDYyeE25t05W66+ac9gxQ80HI+j3+Q0Szv
	xeuHoXdCvCioBSbOM06JfSwARpHCLp+ijgVLqGvPpeB97PDFhs50lHBnXZ3XzMN3VEUprAu1O/OGg
	Yk7GDA4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVn9q-005acc-Nl; Mon, 12 Apr 2021 03:22:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVn9p-005acN-1Z
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 03:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2MIF0iAJlOzjRFkD1X3zRNDFEO5YU1OCow9vUrQ1Ec0=; b=dlBGWaUmBptIuB+/m4aVjd8Nql
 BtOfY0CE/2lQrBNuZvwi76D1Jif8Y0J16Wwo3pyV8O81mEtI3iY/pUSG/DIgLJevHak0WHatXz4QP
 xvoiBsA5k6DQnPQw6/mHuGols02/FRPAxReSicoYBUHjPfW15uHNH4PBox4ZxQiOyjdGsqIMqeup8
 3taWBT5UVAIXkPc+6V4NEQ+179m5lIY0grobU4ySJLl/Jg0AkYa6nrTWHPA+RpkDubQgtatpZaaEE
 KFB5NClIRNQr2i8l6SG04zmCNxuaTjYMVBW+hsE+D1n12LqvNGN0s5xB9J0/o7fHePH0jlwsVrJFd
 QZp0/ucg==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVn9m-005rB7-7f
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 03:22:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id t22so5290047ply.1
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Apr 2021 20:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2MIF0iAJlOzjRFkD1X3zRNDFEO5YU1OCow9vUrQ1Ec0=;
 b=eqJG/xyJz4pFsiGLXd8iRXk6L7TKPaSTVxu31AE1BxCVz/bKjGYUGV43TZ1+wXQi44
 f5RdejpDlM1yY8aNsVhvcLc4S9AHNUxfEjzOl5E6O9WkIkBSlZJuh/akbrJ0PAIeptXm
 IOArD+4S1RvBmvgQ6zO35TEIK/zEBSZW+scg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2MIF0iAJlOzjRFkD1X3zRNDFEO5YU1OCow9vUrQ1Ec0=;
 b=TdxZ298twOT4ZVKUAL3Y4I40JXVN5w8z8c3bpRXBs73aFzJmqOoufHl80O+F4TrVzd
 upr2WHH9GZayH443bBqgQ1TTg5rnt2XK5k62OMqJ6lXMS9BRQ6iPfM3n2WOpqkh3sCq0
 6sQFVGPSatlyiRenwqgbDUZn83mFVEo6q65C7nzHXYiG2jXqbYhekHqXx0taJm8VEr6F
 ktd6BOpEvySw2G5mOHCgNaMwWA2WE8AjeNsDXkD71bvFTiprqxTuXfAnsONaLTnSUEZL
 zn/utV5iLF/i0Np+C55tVEQYyMsY1/6KrBDvRcxqB0W7vv/2pFmdJuwDsiH2GZawYR17
 I6/Q==
X-Gm-Message-State: AOAM533hAludsXCV9jmUwR6oly9ByxEP6TK1pNI54hLZPuCZeQtS1mDO
 dEn64NOYnz50vqwY8rbHK088Ew==
X-Google-Smtp-Source: ABdhPJwmDZ638Yqs1btdo68wp/5hoyLDHJEcFhSlXcJCXASInPEUYg3KQwuvbRhg+wHRmIQqw/wkhQ==
X-Received: by 2002:a17:902:7589:b029:e8:c011:1f28 with SMTP id
 j9-20020a1709027589b02900e8c0111f28mr23859383pll.35.1618197752825; 
 Sun, 11 Apr 2021 20:22:32 -0700 (PDT)
Received: from evanbenn1.syd.corp.google.com
 ([2401:fa00:9:15:9f69:197:25b3:20f8])
 by smtp.gmail.com with ESMTPSA id f17sm9558020pgj.86.2021.04.11.20.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 20:22:32 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Evan Benn <evanbenn@chromium.org>, linux-mediatek@lists.infradead.org,
 Fabien Parent <fparent@baylibre.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drivers/clocksource/mediatek: Ack and disable interrupts
 on suspend
Date: Mon, 12 Apr 2021 13:22:19 +1000
Message-Id: <20210412132200.v3.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_202234_314444_D1458BE3 
X-CRM114-Status: GOOD (  12.61  )
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

Changes in v3:
Move the ACK from the shutdown to the suspend function.

Changes in v2:
Remove the patch that splits the drivers into 2 files.

 drivers/clocksource/timer-mediatek.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 9318edcd8963..1ae8fee639bf 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -241,6 +241,27 @@ static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
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
+	/* This is called with interrupts disabled,
+	 * so we need to ack any interrupt that is pending
+	 * Or for example ATF will prevent a suspend from completing.
+	 */
+	writel(0x3f, timer_of_base(to) + GPT_IRQ_ACK_REG);
+}
+
 static struct timer_of to = {
 	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
 
@@ -286,6 +307,8 @@ static int __init mtk_gpt_init(struct device_node *node)
 	to.clkevt.set_state_oneshot = mtk_gpt_clkevt_shutdown;
 	to.clkevt.tick_resume = mtk_gpt_clkevt_shutdown;
 	to.clkevt.set_next_event = mtk_gpt_clkevt_next_event;
+	to.clkevt.suspend = mtk_gpt_suspend;
+	to.clkevt.resume = mtk_gpt_resume;
 	to.of_irq.handler = mtk_gpt_interrupt;
 
 	ret = timer_of_init(node, &to);
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
