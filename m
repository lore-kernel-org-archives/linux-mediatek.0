Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D374C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 00:49:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECBBE6199F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 00:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECBBE6199F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XQc4maWDi6miPq6T77u4DfqtslauMldMKi/tq1AgY8Q=; b=IaDWy8ikhlhM7SDZ2rFkVlhRq
	JCZ0oCKgO7LahSMtQgNFKk58NZh2ClUUTF0x9QyKI6vV9jI0wAU+GlhiB/LlBJHcKFDLeTdFJq61/
	FfZeM+NHG8KnWU/LDG75eJfZ15EIu/Ep+1HhzcSeSWugGW950X4AfqH1kGfpKPVOcMU/MnYLVnDmi
	RUzZ9Wb4+znBaLQ201+pWJjISQzqSrWWlEaKOV95VUs8cuvXI2aJAq5phyCs9wwNrbGay9IrEyc7c
	NCcf4q8O4SDZDmcCanNWtrOXgSHnsSYE4s/LIeDVi794PzPhOQB+LaQEtiBes2Z7hqEwK/Z7d9xEZ
	piqk/zQ1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOVEi-00D7Di-CE; Tue, 23 Mar 2021 00:49:32 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOVEY-00D7BB-S8
 for linux-mediatek@lists.infradead.org; Tue, 23 Mar 2021 00:49:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id b4so196576lfi.6
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Mar 2021 17:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=psFvZTcsXnFClDCw3WS/jrtZadVPprmyJZOMq/BiXME=;
 b=maZXsFKmzgvWfbafopsGnlJJGTcA1Ohpdek3S34FwKhEmK/rteIC/poImo8Zie1oYI
 Pd+ANDFgJgNpksWD9R0gjlX02HUfKLpGLDHGJwfGcyzAcnH8bGCyh77d8VCbqfW68XA/
 2TEwO7uOMWbDP9Gu0d8WglGRiyDWt3OiR5DEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=psFvZTcsXnFClDCw3WS/jrtZadVPprmyJZOMq/BiXME=;
 b=flTaPdyc4SfqdZ98OzKHZ1iKva4Q2Z8n4eWt0XAaRwd6CqmFJ1Jj/K3M2h8REahtUo
 xNQTeEIRjJLLpEEpQcJ5oNTMw4Hnx1SZRxC5uUo6u+mc6ap77vtCUkCVVaFgbu2RNGjJ
 xoIc01Dlls9s5ZnbufnDOanrFbCMixtWsaO9rOciw6nuOO9E2e2g0fGBiibOY3vSLgTB
 eV9m5pzIDgEAQkxsamLi8ER/qOPmDbJ9VoON6+XhYziDT904qZgtiNhQ4qb2SCD6ic+g
 5XqNH+heo5h8FO6nq2PdzligDETVIBf2yIYv2yQYOS78s0q3G4sVYcTMZN2Kr2NJoSnK
 ECCw==
X-Gm-Message-State: AOAM532CRrRGmxeV4rCTaD0phnEWqojEaUcZfgzycF2PjxxAwhUlhjUc
 Z3IX2hXCgQ1T4iwE2ROgAB4ORbLFlfEykA==
X-Google-Smtp-Source: ABdhPJxCQFxzaXrtOnmTvXGBpbcQl//WreLrpFi5CdMCaHvrvP7BxFE2xwiT/SJluhN6Z1kTxySpRQ==
X-Received: by 2002:a05:6512:23a5:: with SMTP id
 c37mr1085784lfv.287.1616460560653; 
 Mon, 22 Mar 2021 17:49:20 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id r27sm1703075lfm.188.2021.03.22.17.49.19
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 17:49:20 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id a1so23434625ljp.2
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Mar 2021 17:49:19 -0700 (PDT)
X-Received: by 2002:a2e:2e19:: with SMTP id u25mr1335258lju.487.1616460558555; 
 Mon, 22 Mar 2021 17:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <1614670085-26229-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1614670085-26229-2-git-send-email-Fengquan.Chen@mediatek.com>
In-Reply-To: <1614670085-26229-2-git-send-email-Fengquan.Chen@mediatek.com>
From: Evan Benn <evanbenn@chromium.org>
Date: Tue, 23 Mar 2021 11:48:52 +1100
X-Gmail-Original-Message-ID: <CAKz_xw2abQyS9Vvx7DUppGGd-AaDQAfdAOwi46fB9yLPJWJeUA@mail.gmail.com>
Message-ID: <CAKz_xw2abQyS9Vvx7DUppGGd-AaDQAfdAOwi46fB9yLPJWJeUA@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: optimize systimer irq
 clear flow on Mediatek Socs
To: Fengquan Chen <Fengquan.Chen@mediatek.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dehui.sun@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_004922_949238_7F38DC8F 
X-CRM114-Status: GOOD (  22.49  )
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

On Thu, Mar 4, 2021 at 11:07 AM Fengquan Chen
<Fengquan.Chen@mediatek.com> wrote:
>
> 1)ensure systimer is enabled before clear and disable interrupt, which only
> for systimer in Mediatek Socs.

Why does the timer need to be enabled before the interrupt can be
disabled? The datasheet I have does not suggest that this is required.

>
> 2)clear any pending timer-irq when shutdown to keep suspend flow clean,
> when use systimer as tick-broadcast timer
>
> Change-Id: Ia3eda83324af2fdaf5cbb3569a9bf020a11f8009
> Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
> ---
>  drivers/clocksource/timer-mediatek.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 9318edc..9f1f095dc 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -75,6 +75,7 @@
>  static void mtk_syst_ack_irq(struct timer_of *to)

This function seems to be mis-named. It does more than just ack the irq.

>  {
>         /* Clear and disable interrupt */
> +       writel(SYST_CON_EN, SYST_CON_REG(to));

This line seems to enable the timer and disable the interrupt.

>         writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));

This line acks the interrupt and enables the timer and disables the interrupt.
Are these lines both necessary?
Maybe this function should just ack the interrupt without changing the
other bits.

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

This is a third write to the same register, I believe all 3 writes can
be combined into 1. Is that possible?

>
> --
> 1.8.1.1.dirty
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
