Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8776C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 06:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D6161073
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 06:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71D6161073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+c+okP4gnPKjGTS1lYcDtHoT58g0MLlyd7mQI41gnU=; b=W0d120QDgJXGJ1
	JVP6hfo0YHeag+k1aUFWCRO7Rk5gQDjEsUYkK1j+RMq9FfJWBIy4naQQ/JdO6qwcbFJXlmeLFabzu
	DC135QPX33rVplOog1WaccSpQTr5LC7kDBu0iahPXbPahPXA3tHicL4SnKBM9RLO/PdE/WUg3ZSAg
	DPhKagOR/MWQMW6dE5iUYHXUP9nuaW40npK8Qzkf5jaOR3OWYzJ3vevst7uDy0hyyJbGgiGiZ+B5n
	MBqiMiU+h5Qc9gLBl045tDVBSA02D3weJ4elnEqhS8gLnj6NqBFnBL1MmCziqzRT61HODYacoFHVN
	tZZBnx+Xf5wzcZ2D5fzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meAdR-00CLOH-32; Sat, 23 Oct 2021 06:36:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meAdA-00CLMH-Fw; Sat, 23 Oct 2021 06:35:52 +0000
X-UUID: d2697c529c1e4a6d89f3bc4ed392a291-20211022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=R3aTcF7O0aGUzIL4osqUpcRxNDRTCJBgz3G98SJr1EU=; 
 b=S63THr7lO+N0MB4cD7xeafCuP5Vuptanc8QROEMt9Zj1iVlEpY6u+SF+PbVOyYua0L+xNjJMPIpDVF2PGJLBOgUu79hRkRZ13VpSLXgaxpE877HuwgnRyJ3j5HEWnAdMLyYYtId+qQIXtcJkc6RnCphQ2yrBPKXlVWphyuvrjzI=;
X-UUID: d2697c529c1e4a6d89f3bc4ed392a291-20211022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 841178737; Fri, 22 Oct 2021 23:35:44 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 23:35:42 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 23 Oct 2021 14:35:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Oct 2021 14:35:37 +0800
Message-ID: <df145215a21b67b440405736d9628199ccce2a1b.camel@mediatek.com>
Subject: Re: [PATCH v3 1/2] PM / wakeirq: support enabling wake-up irq after
 runtime_suspend called
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Len Brown
 <len.brown@intel.com>, Mathias Nyman <mathias.nyman@intel.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Linux PM <linux-pm@vger.kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "open
 list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" <linux-usb@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Ikjoon Jang <ikjn@chromium.org>
Date: Sat, 23 Oct 2021 14:35:37 +0800
In-Reply-To: <CAJZ5v0hTR2mZk7FuUVciX766qq0AwWXFBZoBsV3Sd9ToYuErdQ@mail.gmail.com>
References: <1628651069-22162-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAJZ5v0hTR2mZk7FuUVciX766qq0AwWXFBZoBsV3Sd9ToYuErdQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F81D45C16EBD5ADB83FF540E1F395C74EFC9FCDEBE5272D370F7D6D128F92EB02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_233549_994898_3D6A190A 
X-CRM114-Status: GOOD (  52.19  )
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

On Tue, 2021-10-19 at 17:28 +0200, Rafael J. Wysocki wrote:
> On Wed, Aug 11, 2021 at 5:05 AM Chunfeng Yun <
> chunfeng.yun@mediatek.com> wrote:
> > 
> > When the dedicated wake-irq is level trigger, and it uses the
> > consumer's sleep status as the wakeup source, that means if the
> > consumer is not in sleep state, the wake-irq will be triggered
> > when enable it; For this case, need enable the wake-irq after
> > invoking the consumer's runtime_suspend() which make the consumer
> > enter sleep state.
> 
> The terminology above is confusing.
> 
> As a rule, the term "sleep state" applies to the whole system, not to
> an individual component.  It is better to use the term "low-power
> state" instead.  Also, there may be multiple low-power states per
> device and it is not clear which of them is relevant here. 
For USB3 controller, here means enter U3 state (or PCI pm state,
D3hot/D3cold)

>  My guess
> is that the IRQ will trigger unless power is removed from the device
> and you want to remove power from the device in ->runtime_suspend().
The power is off or on dependents on this devices has independent
mtcmos, no matter which case, wake IRQ need be enabled after
->runtime_suspend().
> 
> Moreover, I'm assuming that "the consumer" means "the device using
> the
> wake IRQ", 
Yes, it's.
> but this is not particularly clear either.
> 
> Now, the problem is that you need the device using the wake IRQ to be
> in a low-power state in which the IRQ doesn't trigger automatically
> before enabling the IRQ, and so you need to enable the IRQ after
> running ->runtime_suspend() for that device
Yes
>  and IMO this is how it
> needs to be described.
Ok, I'll modify commit message.

> 
> > e.g.
> > Assume the wake-irq is a low level trigger type, and the wakeup
> > signal comes from the sleep status of consumer.
> > The wakeup signal is low level at running time (0), and becomes
> > high level when the consumer enters sleep state (runtime_suspend
> > (1) is called), a wakeup event at (2) make the consumer exit sleep
> > state, then the wakeup signal also becomes low level.
> > 
> >                 ------------------
> >                |           ^     ^|
> > ----------------           |     | --------------
> >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> > 
> > if enable the wake-irq before calling runtime_suspend during (0),
> > an interrupt will arise, it causes resume immediately;
> > it works if enable wake-irq ( e.g. at (3) or (4)) after calling
> > runtime_suspend.
> > 
> > This patch introduces a new status WAKE_IRQ_DEDICATED_LATE_ENABLED
> > to optionally support enabling wake-irq after calling
> > runtime_suspend().
> > 
> > Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v3: add new status suggested by Rafael
> > 
> > v2: add more commit message
> > 
> >   Use the falling edge trigger interrupt suggested by Ikjoon [1],
> > it
> > works well at firstly when only use this related wakeup source, but
> > encounter issues if use other wakeup sources to wakeup platform as
> > below steps:
> > 1. use another wakeup source to wake up the suspended system;
> > 2. the consumer's resume() will be called, and exits sleep state;
> > 3. the consumer's wakeup signal will fall into low level, due to
> >    currently the wakeup irq is disabled, the wake-irq is pending;
> > 4. the consumer tries to enter runtime suspend, but there is a
> >    pending wakeup irq, so will resume again, this will repeat
> >    endlessly.
> > 
> >   Send out the patch again for further discussion.
> > 
> > [1]: https://patchwork.kernel.org/patch/12190407
> > 
> > ---
> >  drivers/base/power/power.h   |  7 ++++--
> >  drivers/base/power/runtime.c |  6 +++--
> >  drivers/base/power/wakeirq.c | 49
> > +++++++++++++++++++++++++++++++++---
> >  include/linux/pm_wakeirq.h   |  5 ++++
> >  4 files changed, 60 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/base/power/power.h
> > b/drivers/base/power/power.h
> > index 54292cdd7808..2d5dfc886f0b 100644
> > --- a/drivers/base/power/power.h
> > +++ b/drivers/base/power/power.h
> > @@ -25,8 +25,10 @@ extern u64 pm_runtime_active_time(struct device
> > *dev);
> > 
> >  #define WAKE_IRQ_DEDICATED_ALLOCATED   BIT(0)
> >  #define WAKE_IRQ_DEDICATED_MANAGED     BIT(1)
> > +#define WAKE_IRQ_DEDICATED_LATE_ENABLED        BIT(2)
> 
> This name is a bit long and it doesn't reflect the nautre of the
> problem, which is that you need code ordering that is a reverse of
> the
> usual flow.
> 
> WAKE_IRQ_DEDICATED_REVERSE may be a better name.
OK

> 
> >  #define
> > WAKE_IRQ_DEDICATED_MASK                (WAKE_IRQ_DEDICATED_ALLOCATE
> > D | \
> > -                                        WAKE_IRQ_DEDICATED_MANAGED
> > )
> > +                                        WAKE_IRQ_DEDICATED_MANAGED
> > | \
> > +                                        WAKE_IRQ_DEDICATED_LATE_EN
> > ABLED)
> > 
> >  struct wake_irq {
> >         struct device *dev;
> > @@ -39,7 +41,8 @@ extern void dev_pm_arm_wake_irq(struct wake_irq
> > *wirq);
> >  extern void dev_pm_disarm_wake_irq(struct wake_irq *wirq);
> >  extern void dev_pm_enable_wake_irq_check(struct device *dev,
> >                                          bool can_change_status);
> > -extern void dev_pm_disable_wake_irq_check(struct device *dev);
> > +extern void dev_pm_disable_wake_irq_check(struct device *dev, bool
> > skip_enable_late);
> > +extern void dev_pm_enable_wake_irq_complete(struct device *dev);
> > 
> >  #ifdef CONFIG_PM_SLEEP
> > 
> > diff --git a/drivers/base/power/runtime.c
> > b/drivers/base/power/runtime.c
> > index 8a66eaf731e4..97646aa11376 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -645,6 +645,8 @@ static int rpm_suspend(struct device *dev, int
> > rpmflags)
> >         if (retval)
> >                 goto fail;
> > 
> > +       dev_pm_enable_wake_irq_complete(dev);
> > +
> >   no_callback:
> >         __update_runtime_status(dev, RPM_SUSPENDED);
> >         pm_runtime_deactivate_timer(dev);
> > @@ -690,7 +692,7 @@ static int rpm_suspend(struct device *dev, int
> > rpmflags)
> >         return retval;
> > 
> >   fail:
> > -       dev_pm_disable_wake_irq_check(dev);
> > +       dev_pm_disable_wake_irq_check(dev, false);
> >         __update_runtime_status(dev, RPM_ACTIVE);
> >         dev->power.deferred_resume = false;
> >         wake_up_all(&dev->power.wait_queue);
> > @@ -873,7 +875,7 @@ static int rpm_resume(struct device *dev, int
> > rpmflags)
> > 
> >         callback = RPM_GET_CALLBACK(dev, runtime_resume);
> > 
> > -       dev_pm_disable_wake_irq_check(dev);
> > +       dev_pm_disable_wake_irq_check(dev, true);
> >         retval = rpm_callback(callback, dev);
> >         if (retval) {
> >                 __update_runtime_status(dev, RPM_SUSPENDED);
> > diff --git a/drivers/base/power/wakeirq.c
> > b/drivers/base/power/wakeirq.c
> > index 3bad3266a2ad..a612f5c26c6c 100644
> > --- a/drivers/base/power/wakeirq.c
> > +++ b/drivers/base/power/wakeirq.c
> > @@ -215,6 +215,24 @@ int dev_pm_set_dedicated_wake_irq(struct
> > device *dev, int irq)
> >  }
> >  EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq);
> > 
> > +/**
> > + * dev_pm_wake_irq_set_late_enabled_status - set status
> > WAKE_IRQ_DEDICATED_LATE_ENABLED
> > + * @dev: Device
> > + *
> > + * Set the status of WAKE_IRQ_DEDICATED_LATE_ENABLED to tell
> > rpm_suspend()
> > + * to enable dedicated wake-up interrupt after invoking the
> > runtime_suspend(),
> > + *
> > + * Should be called after setting dedicated wake-up interrupt.
> > + */
> > +void dev_pm_wake_irq_set_late_enabled_status(struct device *dev)
> > +{
> > +       struct wake_irq *wirq = dev->power.wakeirq;
> > +
> > +       if (wirq && (wirq->status & WAKE_IRQ_DEDICATED_ALLOCATED))
> > +               wirq->status |= WAKE_IRQ_DEDICATED_LATE_ENABLED;
> > +}
> > +EXPORT_SYMBOL_GPL(dev_pm_wake_irq_set_late_enabled_status);
> 
> Instead of doing this, I would provide a special version of
> dev_pm_set_dedicated_wake_irq() for this special use case such that
> it
> will set WAKE_IRQ_DEDICATED_LATE_ENABLED (or whatever you call it) at
> the allocation time (because this is a property of the IRQ and not
> something that can change).
> 
> Maybe call it dev_pm_set_dedicated_wake_irq_reverse() and implemet
> both it and dev_pm_set_dedicated_wake_irq() as wrappers around
> something like __dev_pm_set_dedicated_wake_irq() taking an extra
> argument that will indicate whether or not to set the new flag for
> this IRQ.
OK, it's a better way.

> 
> > +
> >  /**
> >   * dev_pm_enable_wake_irq - Enable device wake-up interrupt
> >   * @dev: Device
> > @@ -285,27 +303,52 @@ void dev_pm_enable_wake_irq_check(struct
> > device *dev,
> >         return;
> > 
> >  enable:
> > -       enable_irq(wirq->irq);
> > +       if (!can_change_status || !(wirq->status &
> > WAKE_IRQ_DEDICATED_LATE_ENABLED))
> > +               enable_irq(wirq->irq);
> >  }
> > 
> >  /**
> >   * dev_pm_disable_wake_irq_check - Checks and disables wake-up
> > interrupt
> >   * @dev: Device
> > + * @skip_late_enabled_status: skip checking
> > WAKE_IRQ_DEDICATED_LATE_ENABLED
> 
> I would call this argument "cond_disable" or similarly to mean that
> the IRQ should be disabled conditionally depending on the new flag.
> 
> And the description of it would be "If set, also check
> WAKE_IRQ_DEDICATED_LATE_ENABLED".
OK
> 
> >   *
> >   * Disables wake-up interrupt conditionally based on status.
> >   * Should be only called from rpm_suspend() and rpm_resume() path.
> >   */
> > -void dev_pm_disable_wake_irq_check(struct device *dev)
> > +void dev_pm_disable_wake_irq_check(struct device *dev, bool
> > skip_late_enabled_status)
> 
> Can't this function be static?
If want to make it static, should move it from wakeirq.c into runtime.c

> 
> >  {
> >         struct wake_irq *wirq = dev->power.wakeirq;
> > 
> >         if (!wirq || !(wirq->status & WAKE_IRQ_DEDICATED_MASK))
> >                 return;
> 
> And I would just add the following line here:
> 
> if (cond_disable && (wirq->status & WAKE_IRQ_DEDICATED_LATE_ENABLED))
>         return;
This change doesn't cover the case (WAKE_IRQ_DEDICATED_LATE_ENABLED and
 WAKE_IRQ_DEDICATED_MANAGED are both set 1):

-->rpm_suspend(): wirq->irq is enabled
-->rpm_resume(): disable wirq->irq; (if change it, doesn't disable
wirq->irq)

> 
> > 
> > -       if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED)
> > +       if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
> > +           (skip_late_enabled_status ||
> > +            !(wirq->status & WAKE_IRQ_DEDICATED_LATE_ENABLED)))
> >                 disable_irq_nosync(wirq->irq);
> >  }
> > 
> > +/**
> > + * dev_pm_enable_wake_irq_complete - enable wake irq based on
> > status
> 
> "Enable wake IRQ not enabled before"
> 
> > + * @dev: Device
> 
> "Device using the wake IRQ"
> 
> > + *
> > + * Enable wake-up interrupt conditionally based on status, mainly
> > for
> > + * enabling wake-up interrupt after runtime_suspend() is called.
> > + *
> > + * Should be only called from rpm_suspend() path.
> 
> This part of the kerneldoc comment needs to be rewritten too,
OK
>  but it
> looks like the function can be static, in which case it won't need
> the
> kerneldoc comment at all.
Will also need to move it into runtime.c if make it static

Thanks a lot
> 
> > + */
> > +void dev_pm_enable_wake_irq_complete(struct device *dev)
> > +{
> > +       struct wake_irq *wirq = dev->power.wakeirq;
> > +
> > +       if (!wirq || !(wirq->status & WAKE_IRQ_DEDICATED_MASK))
> > +               return;
> > +
> > +       if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
> > +           wirq->status & WAKE_IRQ_DEDICATED_LATE_ENABLED)
> > +               enable_irq(wirq->irq);
> > +}
> > +
> >  /**
> >   * dev_pm_arm_wake_irq - Arm device wake-up
> >   * @wirq: Device wake-up interrupt
> > diff --git a/include/linux/pm_wakeirq.h
> > b/include/linux/pm_wakeirq.h
> > index cd5b62db9084..92f814d583f8 100644
> > --- a/include/linux/pm_wakeirq.h
> > +++ b/include/linux/pm_wakeirq.h
> > @@ -22,6 +22,7 @@ extern int dev_pm_set_dedicated_wake_irq(struct
> > device *dev,
> >  extern void dev_pm_clear_wake_irq(struct device *dev);
> >  extern void dev_pm_enable_wake_irq(struct device *dev);
> >  extern void dev_pm_disable_wake_irq(struct device *dev);
> > +extern void dev_pm_wake_irq_set_late_enabled_status(struct device
> > *dev);
> > 
> >  #else  /* !CONFIG_PM */
> > 
> > @@ -47,5 +48,9 @@ static inline void dev_pm_disable_wake_irq(struct
> > device *dev)
> >  {
> >  }
> > 
> > +static inline void dev_pm_wake_irq_set_late_enabled_status(struct
> > device *dev)
> > +{
> > +}
> > +
> >  #endif /* CONFIG_PM */
> >  #endif /* _LINUX_PM_WAKEIRQ_H */
> > --
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
