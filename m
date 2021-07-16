Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC27AC07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 12:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4093A613F3
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 12:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4093A613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShvbHh1L/YnGDaBaGs7mo4pF1z7AEcjBgzgOgl1N/lo=; b=skHtdGRU1DEJ7z
	cLvlUdm0mivrPdFZw10gqcslD+dXVEPZyjtpNqV5sSolvDQHo3IVbyWpfzntgHjVVzYSEaDdcgzoV
	CPNTNGQsBO7pHtrq5WGFb/O5/BAcZJUaR1/MZJ6Zl6DnP1dWiUY1ZixvgBCXqnMu46eGOSjPNhPi4
	GxRcyavYULwPB6odAjjf1VgBE9OM0guXm2gfO2wakkMt/YqtICL3vd8J20cZS2gMuxJeqt43X6R5E
	P81qp7obnZ7wmdoNhuptN8xSI+pgcUnr1BpUOW+dvaaN27caLiEJeIP3dWql7z54M9Pm6C2Fbv9IX
	h+uh6o6eJyP5cuBrsYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4NKh-004Odx-1E; Fri, 16 Jul 2021 12:52:47 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4NKT-004OcA-9T; Fri, 16 Jul 2021 12:52:34 +0000
Received: by mail-oi1-f182.google.com with SMTP id u11so10794619oiv.1;
 Fri, 16 Jul 2021 05:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OhBcbe2dVSwxljU3THZHc5weqYHN49Maj4g0lBcFesI=;
 b=YWNpbt5AB44bUkwY1vf//O2UbCcM631CXs05GzM1xnR2wGmIIYzbl0U1+lDB8dQO2r
 xn1gJUU1SHZbftJXhLIlVVJQpp4ExapnTFRkSzYnJRzD7VhWYGXupzLHnUue90EnBa93
 cXhhmkWDEYyyyrh0Xq8ByfA6Bbe07PxxUtQ1A+rWO2MqV5lqAowDI0puwCjC8bVVSBaj
 +eGAdq8wwGQbtkujdWXPN0uSW/x79YRAeoMPtHSRRQyH85Z83++kck5RqmGu6VhIfm1Z
 2g6yQZsh5Lzre8DiEmVO8SSHTAIW0qnZ3iQ2m7MrkWsjtjxipU1IyRuZrGFskuYXlPPg
 ZN9w==
X-Gm-Message-State: AOAM5337TtKdN/cXv+CUVtxk8TgqDTeGDGKfpt+0Tjyvfl8GswcgAFHv
 65FGTwSFu4fYx9wmzP677T8QfM8iRz10FvBgPd8=
X-Google-Smtp-Source: ABdhPJyUZyO2re08hoo9vsf7166rXHZT/04sruY6Fk2rTLDKNBvM7NGzIrvcsP5I+IDtq5aWTFizOhEpIYPvFzgIIx4=
X-Received: by 2002:a05:6808:10d0:: with SMTP id
 s16mr7413089ois.69.1626439951624; 
 Fri, 16 Jul 2021 05:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <1626427381-30131-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1626427381-30131-1-git-send-email-chunfeng.yun@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 16 Jul 2021 14:52:20 +0200
Message-ID: <CAJZ5v0iH7D=D70ea7Q0LqP0iUdRYPf4GH2g7dC7J2_54WW1C8A@mail.gmail.com>
Subject: Re: [PATCH v2] PM: runtime: enable wake irq after runtime_suspend
 hook called
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux PM <linux-pm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, 
 Ikjoon Jang <ikjn@chromium.org>, Tony Lindgren <tony@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_055233_383419_F7B32992 
X-CRM114-Status: GOOD (  32.12  )
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

On Fri, Jul 16, 2021 at 11:23 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> When the dedicated wake-irq is level trigger, and it uses the
> consumer's sleep status as the wakeup source,

This is not a typical case, though, AFAICS.

So you seem to have a special requirement and you want to change a
generic framework in an incompatible way to accommodate it.

> that means if the
> consumer is not in sleep state, the wake-irq will be triggered
> when enable it; For this case, need enable the wake-irq after
> invoking the consumer's runtime_suspend() which make the consumer
> enter sleep state.
>
> e.g.
> Assume the wake-irq is a low level trigger type, and the wakeup
> signal comes from the sleep status of consumer.
> The wakeup signal is low level at running time (0), and becomes
> high level when the consumer enters sleep state (runtime_suspend
> (1) is called), a wakeup event at (2) make the consumer exit sleep
> state, then the wakeup signal also becomes low level.
>
>                 ------------------
>                |           ^     ^|
> ----------------           |     | --------------
>  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
>
> if enable the wake-irq before calling runtime_suspend during (0),
> an interrupt will arise, it causes resume immediately;
> it works if enable wake-irq ( e.g. at (3) or (4)) after calling
> runtime_suspend.
>
> In this example, can't fix it by using falling edge trigger without
> this patch, the issue will happen as below steps:
> 1. use another wakeup source to wake up the suspended system;
> 2. the consumer's resume() will be called, and exits sleep state;
> 3. the consumer's wakeup signal will fall into low level, due to
>    currently the wakeup irq is disabled, the wake-irq is pending;
> 4. the consumer tries to enter runtime suspend, but there is a
>    pending wakeup irq, so will resume again, this will repeat
>    endlessly.
>
> This patch seems no side effect on edge trigger wake-irq that works
> before.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: add more commit message
>
>   I use the falling edge trigger interrupt suggested by Ikjoon [1], it
> works well at firstly when only use this related wakeup source, but
> encounter issues if use other wakeup sources to wakeup platform as
> described in commit message.
>   Send out the patch again for further discussion.
>
> [1]: https://patchwork.kernel.org/patch/12190407
>
> ---
>  drivers/base/power/runtime.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 8a66eaf731e4..90a91b2b1364 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -639,12 +639,12 @@ static int rpm_suspend(struct device *dev, int rpmflags)
>         __update_runtime_status(dev, RPM_SUSPENDING);
>
>         callback = RPM_GET_CALLBACK(dev, runtime_suspend);
> -
> -       dev_pm_enable_wake_irq_check(dev, true);

I would suggest adding a wake IRQ flag to indicate that it needs
special handling and modifying the above to take that new flag into
account.

>         retval = rpm_callback(callback, dev);
>         if (retval)
>                 goto fail;
>
> +       dev_pm_enable_wake_irq_check(dev, true);

Then, you can add an entirely new call here, say
dev_pm_enable_wake_irq_complete(dev), that will do the actual enable
for the wake IRQs with the new flag set and nothing for the others.

> +
>   no_callback:
>         __update_runtime_status(dev, RPM_SUSPENDED);
>         pm_runtime_deactivate_timer(dev);
> @@ -690,7 +690,6 @@ static int rpm_suspend(struct device *dev, int rpmflags)
>         return retval;
>
>   fail:
> -       dev_pm_disable_wake_irq_check(dev);

And obviously this will really disable wake IRQs with the new flag unset only.

>         __update_runtime_status(dev, RPM_ACTIVE);
>         dev->power.deferred_resume = false;
>         wake_up_all(&dev->power.wait_queue);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
