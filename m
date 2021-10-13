Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B22AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 11:09:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03DE461053
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 11:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03DE461053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eH4xxrNiGBE/i7L44QW+Hn4u9q8aVCE63WpBan+CFRs=; b=oZKx0+4tlbT3Hq
	vaKxYUxFGRKWaYeVmfXhC8U3Zli/oHCTmMZbf5i6vfdGUr5ukDCNlUMBWR10++ETpB9Fv3kK0Qkp3
	B8HDd3tJ7uCu2C3d6MwZPaLp0uMAf4vuz52yUEqUso1LxlrISShzgZS4kNzk/04eu/F77vE2ZVGaE
	D7gTFWYioXRMRd5kLs8MpLSUYiAzVcLti4nuR/W/Nqp7jyt+dnJNHxvJGroB7/dnV/KH8LjZY4Df/
	pyaPR7Eo/TQdyXIUaqtYEH8VNmsktuQfuMpV7YBMlpJezhOyZWowjT4NG4xGnFrJRvF8f+uQx9Twb
	dj5U60jkhEw1odYM31jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mac8W-00GCkT-Ph; Wed, 13 Oct 2021 11:09:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maaCk-00FhqQ-DM; Wed, 13 Oct 2021 09:05:48 +0000
X-UUID: ca1914ee3c234cc389214429c0cfec93-20211013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qyw2jvRrWrpLU3Qi9lhBa5j9cxz4dl/xIrGBRFmd6hc=; 
 b=S6jGg8GC+L26rlIuvhk2A9j3VkLfib5/AvGre4Xvm+IPUvrE3Gckf+VvjGBMR1QvVmJJSgY53j2t+ShWhnJcEA0rIyGOpzttfR1I4te3zrKQ9Ul4V13GXG1toZ5JPAW7iYoDvyrvDsahI/4s3Fpwftpcr9mzsUQpMEtPMj+lifo=;
X-UUID: ca1914ee3c234cc389214429c0cfec93-20211013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 815920474; Wed, 13 Oct 2021 02:05:33 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Oct 2021 02:05:31 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Oct 2021 17:05:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Oct 2021 17:05:24 +0800
Message-ID: <6ed7c99ea2f8ef46d62785ecdbe4ae29bd66a630.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 1/2] PM / wakeirq: support enabling wake-up
 irq after runtime_suspend called
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
CC: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>
Date: Wed, 13 Oct 2021 17:05:27 +0800
In-Reply-To: <20210924023746.22423-1-chunfeng.yun@mediatek.com>
References: <20210924023746.22423-1-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CB26C819106148658AD623A5739B6A41013C67FBEF91DC638C8C2A10594EBE112000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_020545_677123_C5F7B306 
X-CRM114-Status: GOOD (  35.46  )
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

On Fri, 2021-09-24 at 10:37 +0800, Chunfeng Yun wrote:
> When the dedicated wake-irq is level trigger, and it uses the
> consumer's sleep status as the wakeup source, that means if the
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
> This patch introduces a new status WAKE_IRQ_DEDICATED_LATE_ENABLED
> to optionally support enabling wake-irq after calling
> runtime_suspend().
> 
> Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: add new status suggested by Rafael
> 
> v2: add more commit message
> 
>   Use the falling edge trigger interrupt suggested by Ikjoon [1], it
> works well at firstly when only use this related wakeup source, but
> encounter issues if use other wakeup sources to wakeup platform as
> below steps:
> 1. use another wakeup source to wake up the suspended system;
> 2. the consumer's resume() will be called, and exits sleep state;
> 3. the consumer's wakeup signal will fall into low level, due to
>    currently the wakeup irq is disabled, the wake-irq is pending;
> 4. the consumer tries to enter runtime suspend, but there is a
>    pending wakeup irq, so will resume again, this will repeat
>    endlessly.
> 
>   Send out the patch again for further discussion.
> 
> [1]: https://patchwork.kernel.org/patch/12190407
> 
> ---
>  drivers/base/power/power.h   |  7 ++++--
>  drivers/base/power/runtime.c |  6 +++--
>  drivers/base/power/wakeirq.c | 49 +++++++++++++++++++++++++++++++++-
> --
>  include/linux/pm_wakeirq.h   |  5 ++++
>  4 files changed, 60 insertions(+), 7 deletions(-)
Ping ...

> 
> diff --git a/drivers/base/power/power.h b/drivers/base/power/power.h
> index 54292cdd7808..2d5dfc886f0b 100644
> --- a/drivers/base/power/power.h
> +++ b/drivers/base/power/power.h
> @@ -25,8 +25,10 @@ extern u64 pm_runtime_active_time(struct device
> *dev);
>  
>  #define WAKE_IRQ_DEDICATED_ALLOCATED	BIT(0)
>  #define WAKE_IRQ_DEDICATED_MANAGED	BIT(1)
> +#define WAKE_IRQ_DEDICATED_LATE_ENABLED	BIT(2)
>  #define WAKE_IRQ_DEDICATED_MASK		(WAKE_IRQ_DEDICATED_ALL
> OCATED | \
> -					 WAKE_IRQ_DEDICATED_MANAGED)
> +					 WAKE_IRQ_DEDICATED_MANAGED | \
> +					 WAKE_IRQ_DEDICATED_LATE_ENABLE
> D)
>  
>  struct wake_irq {
>  	struct device *dev;
> @@ -39,7 +41,8 @@ extern void dev_pm_arm_wake_irq(struct wake_irq
> *wirq);
>  extern void dev_pm_disarm_wake_irq(struct wake_irq *wirq);
>  extern void dev_pm_enable_wake_irq_check(struct device *dev,
>  					 bool can_change_status);
> -extern void dev_pm_disable_wake_irq_check(struct device *dev);
> +extern void dev_pm_disable_wake_irq_check(struct device *dev, bool
> skip_enable_late);
> +extern void dev_pm_enable_wake_irq_complete(struct device *dev);
>  
>  #ifdef CONFIG_PM_SLEEP
>  
> diff --git a/drivers/base/power/runtime.c
> b/drivers/base/power/runtime.c
> index ec94049442b9..e8b807cd7010 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -645,6 +645,8 @@ static int rpm_suspend(struct device *dev, int
> rpmflags)
>  	if (retval)
>  		goto fail;
>  
> +	dev_pm_enable_wake_irq_complete(dev);
> +
>   no_callback:
>  	__update_runtime_status(dev, RPM_SUSPENDED);
>  	pm_runtime_deactivate_timer(dev);
> @@ -690,7 +692,7 @@ static int rpm_suspend(struct device *dev, int
> rpmflags)
>  	return retval;
>  
>   fail:
> -	dev_pm_disable_wake_irq_check(dev);
> +	dev_pm_disable_wake_irq_check(dev, false);
>  	__update_runtime_status(dev, RPM_ACTIVE);
>  	dev->power.deferred_resume = false;
>  	wake_up_all(&dev->power.wait_queue);
> @@ -873,7 +875,7 @@ static int rpm_resume(struct device *dev, int
> rpmflags)
>  
>  	callback = RPM_GET_CALLBACK(dev, runtime_resume);
>  
> -	dev_pm_disable_wake_irq_check(dev);
> +	dev_pm_disable_wake_irq_check(dev, true);
>  	retval = rpm_callback(callback, dev);
>  	if (retval) {
>  		__update_runtime_status(dev, RPM_SUSPENDED);
> diff --git a/drivers/base/power/wakeirq.c
> b/drivers/base/power/wakeirq.c
> index b91a3a9bf9f6..1acf785ebdcd 100644
> --- a/drivers/base/power/wakeirq.c
> +++ b/drivers/base/power/wakeirq.c
> @@ -212,6 +212,24 @@ int dev_pm_set_dedicated_wake_irq(struct device
> *dev, int irq)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq);
>  
> +/**
> + * dev_pm_wake_irq_set_late_enabled_status - set status
> WAKE_IRQ_DEDICATED_LATE_ENABLED
> + * @dev: Device
> + *
> + * Set the status of WAKE_IRQ_DEDICATED_LATE_ENABLED to tell
> rpm_suspend()
> + * to enable dedicated wake-up interrupt after invoking the
> runtime_suspend(),
> + *
> + * Should be called after setting dedicated wake-up interrupt.
> + */
> +void dev_pm_wake_irq_set_late_enabled_status(struct device *dev)
> +{
> +	struct wake_irq *wirq = dev->power.wakeirq;
> +
> +	if (wirq && (wirq->status & WAKE_IRQ_DEDICATED_ALLOCATED))
> +		wirq->status |= WAKE_IRQ_DEDICATED_LATE_ENABLED;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_wake_irq_set_late_enabled_status);
> +
>  /**
>   * dev_pm_enable_wake_irq - Enable device wake-up interrupt
>   * @dev: Device
> @@ -282,27 +300,52 @@ void dev_pm_enable_wake_irq_check(struct device
> *dev,
>  	return;
>  
>  enable:
> -	enable_irq(wirq->irq);
> +	if (!can_change_status || !(wirq->status &
> WAKE_IRQ_DEDICATED_LATE_ENABLED))
> +		enable_irq(wirq->irq);
>  }
>  
>  /**
>   * dev_pm_disable_wake_irq_check - Checks and disables wake-up
> interrupt
>   * @dev: Device
> + * @skip_late_enabled_status: skip checking
> WAKE_IRQ_DEDICATED_LATE_ENABLED
>   *
>   * Disables wake-up interrupt conditionally based on status.
>   * Should be only called from rpm_suspend() and rpm_resume() path.
>   */
> -void dev_pm_disable_wake_irq_check(struct device *dev)
> +void dev_pm_disable_wake_irq_check(struct device *dev, bool
> skip_late_enabled_status)
>  {
>  	struct wake_irq *wirq = dev->power.wakeirq;
>  
>  	if (!wirq || !(wirq->status & WAKE_IRQ_DEDICATED_MASK))
>  		return;
>  
> -	if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED)
> +	if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
> +	    (skip_late_enabled_status ||
> +	     !(wirq->status & WAKE_IRQ_DEDICATED_LATE_ENABLED)))
>  		disable_irq_nosync(wirq->irq);
>  }
>  
> +/**
> + * dev_pm_enable_wake_irq_complete - enable wake irq based on status
> + * @dev: Device
> + *
> + * Enable wake-up interrupt conditionally based on status, mainly
> for
> + * enabling wake-up interrupt after runtime_suspend() is called.
> + *
> + * Should be only called from rpm_suspend() path.
> + */
> +void dev_pm_enable_wake_irq_complete(struct device *dev)
> +{
> +	struct wake_irq *wirq = dev->power.wakeirq;
> +
> +	if (!wirq || !(wirq->status & WAKE_IRQ_DEDICATED_MASK))
> +		return;
> +
> +	if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
> +	    wirq->status & WAKE_IRQ_DEDICATED_LATE_ENABLED)
> +		enable_irq(wirq->irq);
> +}
> +
>  /**
>   * dev_pm_arm_wake_irq - Arm device wake-up
>   * @wirq: Device wake-up interrupt
> diff --git a/include/linux/pm_wakeirq.h b/include/linux/pm_wakeirq.h
> index cd5b62db9084..92f814d583f8 100644
> --- a/include/linux/pm_wakeirq.h
> +++ b/include/linux/pm_wakeirq.h
> @@ -22,6 +22,7 @@ extern int dev_pm_set_dedicated_wake_irq(struct
> device *dev,
>  extern void dev_pm_clear_wake_irq(struct device *dev);
>  extern void dev_pm_enable_wake_irq(struct device *dev);
>  extern void dev_pm_disable_wake_irq(struct device *dev);
> +extern void dev_pm_wake_irq_set_late_enabled_status(struct device
> *dev);
>  
>  #else	/* !CONFIG_PM */
>  
> @@ -47,5 +48,9 @@ static inline void dev_pm_disable_wake_irq(struct
> device *dev)
>  {
>  }
>  
> +static inline void dev_pm_wake_irq_set_late_enabled_status(struct
> device *dev)
> +{
> +}
> +
>  #endif	/* CONFIG_PM */
>  #endif	/* _LINUX_PM_WAKEIRQ_H */
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
