Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BA7C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 10:52:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0332E6113B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 10:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0332E6113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mEmcDbLw6RdE77Mczsk4+GcmfGheFgeAx54QqYOA0eI=; b=KqSYIWZNJpLxGEsNUGoSfN92V
	6bT1XUAUDMmJGcTfgAhoM+0Wnwyngf9fsUNHISOkt0hUVZEG/crKgfJT0Q/EsWqeqR2Y9Tdn3bynB
	SFs+y8t7eEkII+aQyxwrIqI9R89rAG176OYJ0wmrXrFiClztJsHwR8dPr9m0mfuSl1FIdMf82I6rA
	uUQLUUZSFFOggFskhuq3g7/EdZnkVKXOTHtbFyb+J9d/UuVXImhDEfjijw0iN/Pre0i4Q3nLHGiBt
	7VFUEnoMMmXLMVyl/j6v6GoJhwy32zApfqaCPr+V4MBMu7OIsIeaoKyyevyJ3E6vA1UTWLWvwUdlS
	CYjK5Nq5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXM5S-001nY3-OP; Fri, 16 Apr 2021 10:52:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXM1C-001n3j-L7
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 10:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=C74aGVjrq9NIAUbXd935tljz2LVTxxnWW3CsspAw0SM=; b=rMf7RMO4k3Si+39FUFG3SSU5Fx
 qFnkj0dQSI3bOA6DGonvKVAEyrl5z9Z+zdsOU0mCy+dsPGHKOBWZHa57fN1x7VdIGF/L3b/RbWvXy
 BNcfowEBXKuJdBpBlW5dRQZf9n7FzfUvh4qfhc3aAI7wAMC+vlgiTLyK/w9j39YtXhCRgyv0jygxH
 PDi8CCUUAZv3vIdoQkSWl+FkH6ZFFIXX5e304FkmD81TlTyqNdSbmrbJm/pavCc6h4JmRNBMj5tQI
 JDhwQrJ1U45BCH98y9gagNAR4XTqSThgBiVXRX6EvdmUuSGQCUsrOb5ztWzDWTdBSm3vreIuE6SHc
 la9gsEHA==;
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXM19-009Hwp-JS
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 10:48:09 +0000
Received: by mail-il1-x12d.google.com with SMTP id b17so22732486ilh.6
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C74aGVjrq9NIAUbXd935tljz2LVTxxnWW3CsspAw0SM=;
 b=SpgKXRUhLTKXI01i6cnlypw0MP3mhowAg4qaiV20M7s03kgW9L7qOnPV48VNvIuopm
 /fLYXOoYrWPMGFesjtgbzaEPCnshCYgTS4ikMsTrqdke7tXRRFeWG2232T1iFDfIdq+t
 LzJFnPtF6UIMoFsxR40jZKOkJJvIExmAxX7pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C74aGVjrq9NIAUbXd935tljz2LVTxxnWW3CsspAw0SM=;
 b=G3PhMQS0ulsRno/ZfFfVi1Xf2AMeC134TcExVr0GyY2FgAMi5ZNgyHjjNd/z8mptIn
 5Il0jujVN5EAihOiv6Vt92YFq+QK7ekN2lObskilU23Ks+yWP1+fOzv0y8zOwx6k/gj1
 W4JIGlzMUoqJ/MN2w+TnmgTbPCDHDpNfozgc9tj71SXd8hHGcq3oP1nWwBmlwNt5dds1
 68WjkRTqSr+tfXnbiWcKtUSp2NkAQUokvluRCR2UYt4FrspJueoA86wH+74A4U7VZa1b
 OUM0ZmOyD4EVgaJxLNrxz2nQuYdKrPPWoi3qPmhUuBtM1PD/e8mam1iagYjrWV9u6/Pi
 yEXA==
X-Gm-Message-State: AOAM531dLqaTzPfXINASFuMN7MlDGaPYQlVzr6lUl0Benp6cZ2X2tvQT
 m4Ak2gHC0kIXWA3jMJ8aPoGXO0fHUCKqJ/fENPt0ZQ==
X-Google-Smtp-Source: ABdhPJx1lpsYR8uqB8Dt2Mv/cWIzyoAlXwzfDls5vff3WgmSA1BM7Hj5eRWvVdDYgjTim2dW5iiRImMWRzIH1VqLXkk=
X-Received: by 2002:a05:6e02:1282:: with SMTP id
 y2mr6431543ilq.308.1618570085698; 
 Fri, 16 Apr 2021 03:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <1617960162-1988-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1617960162-1988-2-git-send-email-Fengquan.Chen@mediatek.com>
In-Reply-To: <1617960162-1988-2-git-send-email-Fengquan.Chen@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 16 Apr 2021 18:47:39 +0800
Message-ID: <CAJMQK-jyUzAQu_Yi5zJSRREC5fzPvQoTFpSVyKB8YBi1cK2j7g@mail.gmail.com>
Subject: Re: [PATCH] [v4, 1/1] clocksource/drivers/timer-mediatek: optimize
 systimer irq clear flow on shutdown
To: Fengquan Chen <Fengquan.Chen@mediatek.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dehui.sun@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_034807_689790_B35B4980 
X-CRM114-Status: GOOD (  20.08  )
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

On Fri, Apr 9, 2021 at 5:22 PM Fengquan Chen <Fengquan.Chen@mediatek.com> wrote:
>
> mtk_syst_clkevt_shutdown is called after irq disabled in suspend flow,
> clear any pending systimer irq when shutdown to avoid suspend aborted
> due to timer irq pending
>
> Also as for systimer in mediatek socs, there must be firstly enable
> timer before clear systimer irq
>
> Fixes: e3af677607d9("clocksource/drivers/timer-mediatek: Add support for system timer")
> Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested on a mt8183 device. This patch solves an issue that device
would hang on resume during genpd_resume_noirq:

[  724.342834] mtk-smi-larb 17010000.larb: genpd_resume_noirq+0x0/0xd0
returned 0 after 976593 usecs
[  724.351721] mtk-smi-larb 1a001000.larb: calling
genpd_resume_noirq+0x0/0xd0 @ 6629, parent: soc
[  736.845047] Kernel panic - not syncing: Watchdog detected hard
LOCKUP on cpu 3
[  736.852268] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G        W
  5.10.26 #17
[  736.859743] Hardware name: MediaTek krane sku176 board (DT)
[  736.865309] Call trace:
[  736.867756]  dump_backtrace+0x0/0x1bc
[  736.871415]  show_stack+0x20/0x2c
[  736.874728]  dump_stack+0xc0/0x11c
[  736.878124]  panic+0x174/0x378
[  736.881178]  watchdog_check_hardlockup+0x11c/0x124
[  736.885963]  watchdog_timer_fn+0x70/0x274
<snip>



> ---
>  drivers/clocksource/timer-mediatek.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 9318edc..6461fd3 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -60,9 +60,9 @@
>   * SYST_CON_EN: Clock enable. Shall be set to
>   *   - Start timer countdown.
>   *   - Allow timeout ticks being updated.
> - *   - Allow changing interrupt functions.
> + *   - Allow changing interrupt status,like clear irq pending.
>   *
> - * SYST_CON_IRQ_EN: Set to allow interrupt.
> + * SYST_CON_IRQ_EN: Set to enable interrupt.
>   *
>   * SYST_CON_IRQ_CLR: Set to clear interrupt.
>   */
> @@ -75,6 +75,7 @@
>  static void mtk_syst_ack_irq(struct timer_of *to)
>  {
>         /* Clear and disable interrupt */
> +       writel(SYST_CON_EN, SYST_CON_REG(to));
>         writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
>  }
>
> @@ -111,6 +112,9 @@ static int mtk_syst_clkevt_next_event(unsigned long ticks,
>
>  static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
>  {
> +       /* Clear any irq */
> +       mtk_syst_ack_irq(to_timer_of(clkevt));
> +
>         /* Disable timer */
>         writel(0, SYST_CON_REG(to_timer_of(clkevt)));
>
> --
> 1.8.1.1.dirty
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
