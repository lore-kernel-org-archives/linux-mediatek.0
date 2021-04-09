Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA614C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 05:33:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D81600D1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 05:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D81600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CKzDLKDr/Bpt52Y3Y0u7HFQ6FRgzyeOX3T0oDTTrx60=; b=Ce+oYY1YWku9RbR79gKC0WBGI
	dCH5t3E9N3m1CWWFqjNoG1Q+szqooH8Uxo4SoDtw3hZUYhgF+L7g1gAIJE9rt8K/wP4e49SDaO8sf
	YDOoR20FUxDZZFgQh0hqFwBQNpMMEcezPNR/+dJtKNsFzEeIW9O4ldh02658yw61r616EfNzgWNaU
	V2d1KRdZnTFdQNPIRLNIl97Evuo1pb2hS74b+zel3Nb5LWfBA3Za7roi0ko9CGViCtU504v8uLtnA
	vOev+ap5bI3hgCUGz+KCWzq9EPSG4J53jNQA5Fo4VuIFPhauxXNXCpXiVZtXt0Gr1celpqKvVzTrw
	nKYkGT5WA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUjlV-00A9Fk-4F; Fri, 09 Apr 2021 05:33:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUjkg-00A9BV-JM
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 05:32:31 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so4384939pji.5
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Apr 2021 22:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F9hM9nVGMcr2Nn1IqoOQ93AahNtfT8Yn/VYqHGfn/7I=;
 b=MlT+CXpVe+YEXKYqQu+W958NQrZdgi88YdwzAZb96qmte++WWwYbcPdfBo8w4W3bF5
 JIaOtfDEIqS8acjBkZCExhGijH3MWedQIyH4PXz3ifDaeWUiS1qCyBAowfUb27mx9Rpu
 3f9lWtKfDlW4KBt36XMD4DabDKOX6pOSbHuKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9hM9nVGMcr2Nn1IqoOQ93AahNtfT8Yn/VYqHGfn/7I=;
 b=pNuBjUIC3Zu/F9y3kYB3tkCYR9AiFaJathmagCtcHhUIz02+s9mr2Sn53HHVhf6/gG
 1spkp+sNMJofi5kYK81jf6nV5J3/wQWoI4eShIzd3A78SQ9WNIVchmeveL2bc3/g/CKx
 t0OTqNTNOOd3661AwqfnYkCmLX4bns6+9GKgVDkMJ0Bh4ccNCtdDG/9InKrYd4tzbWxr
 oBRr+u6A6jSZlBv+RbWuv0QLI5m6w01cZMEehGMGip+VY7sU4xgrHpzGlnPWv97dt1YX
 VJuhQBeX3bjUhsz5EsUDHpKp+ViGdYtFTqzhdOwSos92kR1sHGAofTmYYJt/8SjwzZ+Z
 BR1A==
X-Gm-Message-State: AOAM530XEGwEBdEM/fWiMb0VFAD6n3gb1fXBRlmip+rbMbasCmnOzS6i
 bd080WNqm/mPPm8Fh/vu5xI5YUDzKa+ugwaLvPcZoA==
X-Google-Smtp-Source: ABdhPJw4untB2Yt+WuL7MDli++gq98wN7FFwz1Ypr7nEtpVbX1vrn8JldU8HxzojRAQ4i24YV68DXHWAvSagpB3Hq60=
X-Received: by 2002:a17:90a:d3c8:: with SMTP id
 d8mr11825381pjw.144.1617946335435; 
 Thu, 08 Apr 2021 22:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 9 Apr 2021 13:32:04 +0800
Message-ID: <CAATdQgCQ5Gm1CNEbVgLFiFcgDX0yP5G=48Fa29WYbpSuz25WXg@mail.gmail.com>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, linux-usb@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 linux-pm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
 Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, 
 Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_063228_634488_C7C73824 
X-CRM114-Status: GOOD (  19.90  )
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

Hi Chunfeng,

On Thu, Apr 8, 2021 at 5:35 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> When the dedicated wake irq is level trigger, enable it before
> calling runtime_suspend, will trigger an interrupt.
>
> e.g.
> for a low level trigger type, it's low level at running time (0),
> and becomes high level when enters suspend (runtime_suspend (1) is
> called), a wakeup signal at (2) make it become low level, wake irq
> will be triggered.
>
>                 ------------------
>                |           ^     ^|
> ----------------           |     | --------------
>  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
>

Can't we just use a falling edge type for this irq line?

> if we enable the wake irq before calling runtime_suspend during (0),
> an interrupt will arise, it causes resume immediately;
> enable wake irq after calling runtime_suspend, e.g. at (3) or (4),
> will works.
>
> This patch seems no side effect on edge trigger wake irq.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/base/power/runtime.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index a46a7e30881b..796739a015a5 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -619,12 +619,12 @@ static int rpm_suspend(struct device *dev, int rpmflags)
>         __update_runtime_status(dev, RPM_SUSPENDING);
>
>         callback = RPM_GET_CALLBACK(dev, runtime_suspend);
> -
> -       dev_pm_enable_wake_irq_check(dev, true);
>         retval = rpm_callback(callback, dev);
>         if (retval)
>                 goto fail;
>
> +       dev_pm_enable_wake_irq_check(dev, true);
> +
>   no_callback:
>         __update_runtime_status(dev, RPM_SUSPENDED);
>         pm_runtime_deactivate_timer(dev);
> @@ -659,7 +659,6 @@ static int rpm_suspend(struct device *dev, int rpmflags)
>         return retval;
>
>   fail:
> -       dev_pm_disable_wake_irq_check(dev);
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
