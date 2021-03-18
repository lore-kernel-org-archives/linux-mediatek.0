Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA936C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 23:47:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 488D364DE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 23:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 488D364DE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KATWAi5F4814yJNyyY51lRr5EFhzR+7uPVy0nfM0Lk8=; b=lNaYmHu1QzY88anDUPwR6Fx+k
	IN6WksWtOLv6PaiH+Pcb/yXntpF0U1P/4P/rpfWyh3HL4DDofZjedXzu8BWafdh3MbPDQJhJwXu6V
	MNOvLhkBX2zOuHuHJqWutueA2+wXxmSn0KmZa7HBWbZMuqsSTogvYeY4Gk0s5OQA/M0PKbpY++HbJ
	MPhn+MtXHm65AkW5mXxjkBH2dgbYs1v3uGSXSFrbZ+d5vPjoPX5JhLpRdJpkcg9J4h2umP6bSPHrv
	Td3DRzMBvkVHrht+vf5tSSUghJL2uOPGO+YoJZeCg87F9WUAkHEwwjkAbs7PPbw8gl7yaxIuaDIzj
	Etuz0NWPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN2MU-006BrX-4M; Thu, 18 Mar 2021 23:47:30 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN2MQ-006Bqr-8x
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 23:47:28 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 75so7255826lfa.2
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Mar 2021 16:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOFK5Z7x4fmSXU/29sCiVdnLRxv/rCSizhMtxsSM0ic=;
 b=P6QwJa4XF7QWertR1ymaP42lo6q2WBJHeii4PFGGUWFMQqvd1wOPil5mu5KHEvkaQ6
 n0R5lguHof7KOZKhpAxoFibZHdjRW/3JwWG+c1c99dZbNDKzDvG9O7kV3EZlVxLMx2RV
 uPNbAvo5IB4liP9/Z8wmfHukmYuvDslpUWBEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOFK5Z7x4fmSXU/29sCiVdnLRxv/rCSizhMtxsSM0ic=;
 b=YmJkEo3JP1O4Zd2+o7yByEH9Isnm3zFiY2CQtOvfvqLhtFw045i9VlvzmFi/zotwnn
 YdsMKjFvMx3ikLRt+EbbqzWY7WzegUB0iBvPR+0iEwlmThBimYbcULyLHpRiis1HV915
 HyCLW0DEh4HYFscXgNpzmls0/J7PYJxBFw+u7hkPvvcnQmbp8QupeO6th4EHKtQaY20F
 w6tE6gpUH8E32HssKGwhNEnC/RzSq7FwXOUj+dfpMYJlcnN3f0Of1XKWD5OJ9xI121+e
 DbPz0M7iaN/YDk4PIOc1TYBMuVmeujiJjoD9gHiZVs4EWdPFvqMCycbVEDjhhqzq+DQN
 +wOg==
X-Gm-Message-State: AOAM532sHsHE2vdO0Z8rDtIkUgiJBDlMkwMeBPbW5xlG6Lka/ScO9cgY
 tIKELF/auXkAxdK+dcKAGYn7pmeQSCGUEw==
X-Google-Smtp-Source: ABdhPJyI1oGVCFwuvya4VFrvtzlQHAWfMouC6B/HKkot8+HOtWJJs59dEcZFGyLUukCth6XhL70thQ==
X-Received: by 2002:ac2:4576:: with SMTP id k22mr6748915lfm.523.1616111244294; 
 Thu, 18 Mar 2021 16:47:24 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id b7sm407343lfa.18.2021.03.18.16.47.22
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 16:47:23 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id z7so7264776lfd.5
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Mar 2021 16:47:22 -0700 (PDT)
X-Received: by 2002:a05:6512:3ba3:: with SMTP id
 g35mr2989780lfv.606.1616111242075; 
 Thu, 18 Mar 2021 16:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210318160414.1.Ia2a09ce93b47eac45308205820db0938d47604df@changeid>
 <20210318160414.2.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
In-Reply-To: <20210318160414.2.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid>
From: Evan Benn <evanbenn@chromium.org>
Date: Fri, 19 Mar 2021 10:46:55 +1100
X-Gmail-Original-Message-ID: <CAKz_xw1BYap=igtp0V8Wdo6vW+3=jvsVDJtukmMoPhvDVeMpRA@mail.gmail.com>
Message-ID: <CAKz_xw1BYap=igtp0V8Wdo6vW+3=jvsVDJtukmMoPhvDVeMpRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers/clocksource/mediatek: Ack and disable
 interrupts on shutdown
To: LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, 
 Julia Lawall <Julia.Lawall@lip6.fr>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 Stanley Chu <stanley.chu@mediatek.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_234726_648721_25C7BB74 
X-CRM114-Status: GOOD (  26.01  )
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

Hello,

There is a suspend failure on mt8173 chromebooks that use this timer.
The failure shows as an errno: -95 failure with none device.

I tracked this down to the arm trusted firmware aborting the suspend
due to this timer having a pending IRQ, due to not being disabled
during suspend / clockevents_shutdown.

Also reviewed here vs the 4.19 chromeos kernel branch:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2766504

Thanks

Evan Benn


On Thu, Mar 18, 2021 at 4:05 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> set_state_shutdown is called during system suspend after interrupts have
> been disabled. If the timer has fired in the meantime, there will be
> a pending IRQ. So we ack that now and disable the timer. Without this
> ARM trusted firmware will abort the suspend due to the pending
> interrupt.
>
> Now always disable the IRQ in state transitions, and re-enable in
> set_periodic and next_event.
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
>
>  drivers/clocksource/timer-mediatek-mt6577.c | 49 +++++++++++++--------
>  1 file changed, 30 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/clocksource/timer-mediatek-mt6577.c b/drivers/clocksource/timer-mediatek-mt6577.c
> index 9e5241d1876d..44598121585c 100644
> --- a/drivers/clocksource/timer-mediatek-mt6577.c
> +++ b/drivers/clocksource/timer-mediatek-mt6577.c
> @@ -54,13 +54,33 @@ static u64 notrace mtk_gpt_read_sched_clock(void)
>         return readl_relaxed(gpt_sched_reg);
>  }
>
> +static void mtk_gpt_disable_ack_interrupts(struct timer_of *to, u8 timer)
> +{
> +       u32 val;
> +
> +       /* Disable interrupts */
> +       val = readl(timer_of_base(to) + GPT_IRQ_EN_REG);
> +       writel(val & ~GPT_IRQ_ENABLE(timer), timer_of_base(to) +
> +              GPT_IRQ_EN_REG);
> +
> +       /* Ack interrupts */
> +       writel(GPT_IRQ_ACK(timer), timer_of_base(to) + GPT_IRQ_ACK_REG);
> +}
> +
>  static void mtk_gpt_clkevt_time_stop(struct timer_of *to, u8 timer)
>  {
>         u32 val;
>
> +       /* Disable timer */
>         val = readl(timer_of_base(to) + GPT_CTRL_REG(timer));
>         writel(val & ~GPT_CTRL_ENABLE, timer_of_base(to) +
>                GPT_CTRL_REG(timer));
> +
> +       /* This may be called with interrupts disabled,
> +        * so we need to ack any interrupt that is pending
> +        * Or for example ATF will prevent a suspend from completing.
> +        */
> +       mtk_gpt_disable_ack_interrupts(to, timer);
>  }
>
>  static void mtk_gpt_clkevt_time_setup(struct timer_of *to,
> @@ -74,8 +94,10 @@ static void mtk_gpt_clkevt_time_start(struct timer_of *to,
>  {
>         u32 val;
>
> -       /* Acknowledge interrupt */
> -       writel(GPT_IRQ_ACK(timer), timer_of_base(to) + GPT_IRQ_ACK_REG);
> +       /* Enable interrupts */
> +       val = readl(timer_of_base(to) + GPT_IRQ_EN_REG);
> +       writel(val | GPT_IRQ_ENABLE(timer),
> +              timer_of_base(to) + GPT_IRQ_EN_REG);
>
>         val = readl(timer_of_base(to) + GPT_CTRL_REG(timer));
>
> @@ -148,21 +170,6 @@ __init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
>                timer_of_base(to) + GPT_CTRL_REG(timer));
>  }
>
> -static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
> -{
> -       u32 val;
> -
> -       /* Disable all interrupts */
> -       writel(0x0, timer_of_base(to) + GPT_IRQ_EN_REG);
> -
> -       /* Acknowledge all spurious pending interrupts */
> -       writel(0x3f, timer_of_base(to) + GPT_IRQ_ACK_REG);
> -
> -       val = readl(timer_of_base(to) + GPT_IRQ_EN_REG);
> -       writel(val | GPT_IRQ_ENABLE(timer),
> -              timer_of_base(to) + GPT_IRQ_EN_REG);
> -}
> -
>  static struct timer_of to = {
>         .flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
>
> @@ -193,6 +200,12 @@ static int __init mtk_gpt_init(struct device_node *node)
>         if (ret)
>                 return ret;
>
> +       /* In case the firmware left the interrupts enabled
> +        * disable and ack those now
> +        */
> +       mtk_gpt_disable_ack_interrupts(&to, TIMER_CLK_SRC);
> +       mtk_gpt_disable_ack_interrupts(&to, TIMER_CLK_EVT);
> +
>         /* Configure clock source */
>         mtk_gpt_setup(&to, TIMER_CLK_SRC, GPT_CTRL_OP_FREERUN);
>         clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
> @@ -206,8 +219,6 @@ static int __init mtk_gpt_init(struct device_node *node)
>         clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>                                         TIMER_SYNC_TICKS, 0xffffffff);
>
> -       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
> -
>         return 0;
>  }
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
> --
> 2.31.0.rc2.261.g7f71774620-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
