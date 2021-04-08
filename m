Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B20C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 17:43:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95DA461040
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 17:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95DA461040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VRgli1m/ncK3ngvecyOiCV0ib1+IHQokm6LJ4WBVYls=; b=H81GBS/gdSn+8ZS5UIbfHFeKQ
	1RpM9El1jTHVc9hDQG7Ie4vB81zb1eYn3K54OqmAsQ2jO2fiX2Wf/IuNes04nkWfmcWe8lG/O52aX
	AJbQQlcezA7+BNxMkwc3WwdPWwThYq19+POW7queEw41jSyJ0TZqYIMMDysYGFniVAEVKzael+zUK
	MlD8VS5/+Y4Dd+Lhb8zehyMVisSihsAaGuYTw3R2s61y9QqPeU7bMaTu5KCBhrZ7dVZ5QrhDr1b6L
	dqWA49qO/TUZuTjuMtnrEMZXWKs7yPqGlsxrQptXKcr4dpYu0PmcYFqwNj/bAbo3m3k/oDn66ao2b
	DU6luSF3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUYgJ-008oOd-Hg; Thu, 08 Apr 2021 17:43:03 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUYek-008oBy-1H; Thu, 08 Apr 2021 17:41:31 +0000
Received: by mail-oi1-f174.google.com with SMTP id n8so2983244oie.10;
 Thu, 08 Apr 2021 10:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MxPv9rGDLS4kNaUwF1zjTD50xd/6Z8XGBbW4dmhPKD8=;
 b=bE3oCV1v9CAD/OeqB2qUXAAjXh9zxh+rHeL6+oUFIvGWVzVUJxX2cw8r09o2HraOoe
 WSmVMKfMWBvjt6FwRfJ7MaUTqxPM3hcxSKWRsLVqB8cmBta4e8ArK75kfk1CQF0jIfR8
 SmY9rbXgb2s5cOUpcyN3/ALSccmVSAzXNOiU3Gbeep8UN3eWJDoz+VcTkwmF9NcGXS62
 bOG8vtdgfPHS5aTsZgRx8MQoKcAwYsL3sPaiKQhlIH2WjyemY8gzkA3cCzGwtlXUSBNY
 lWml0bZ3R0qmKdAY697Niv5Hxp1pCkvGnO319QuWikdPhM4Ax3Zj/C8veVeuJSol/8Og
 Zfvw==
X-Gm-Message-State: AOAM533KJSC3iiQ0Oy9AOoWSZ9cG1eSsf+qS1ie0ShNfS89kLfLwEchW
 7rrUve4dwsgu3l80Gt/5Q7a0Q00934HkYo0zPiI=
X-Google-Smtp-Source: ABdhPJzwd+elJ0tSpUAZ/bAgTRpxq7RiABgs8Q08DleA2nKQdp22al42iOL7Z8aA5oAFMXMC6gZjSOTm29nDYVKPpLc=
X-Received: by 2002:aca:5fc3:: with SMTP id t186mr6817482oib.69.1617903681158; 
 Thu, 08 Apr 2021 10:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 8 Apr 2021 19:41:10 +0200
Message-ID: <CAJZ5v0gGntbfnvAP5A491_hUh-JUuqZjZRdPPLwWJjnZRtemcQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, 
 "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" <linux-usb@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Tianping Fang <tianping.fang@mediatek.com>, 
 Eddie Hung <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
 Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_184126_692189_8326E8F3 
X-CRM114-Status: GOOD (  20.09  )
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

On Thu, Apr 8, 2021 at 11:35 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
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
> if we enable the wake irq before calling runtime_suspend during (0),
> an interrupt will arise, it causes resume immediately;

But that's necessary to avoid missing a wakeup interrupt, isn't it?

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
