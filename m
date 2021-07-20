Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB49C07E9B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 05:37:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DE916113C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 05:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DE916113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omHGYZxt8OED7MsomgrADAJW/+x52/xfoNbf/6dwiqI=; b=F/7KjlrVVEDCjr
	8WonZhDEMdHlBIyS6LztT3Mksox8bNGBytrYwnyfaWfO5yk/kt5mJcrQ6Xn04t38v+k33RPuhKI9o
	1JS3ue4apnWpOsPnQ+DOKSEC3YBbJlCmj2RVCq0ti4al+x0Zx4ermnD4UptbooOxbqoXtzeTdWE+U
	Rxx+mKdOs3Q6BLY509gV7x9wGwvqsg/CrKehybSg+dMG4wl5Neznj2XeV5+afS8JZkz+VpUtNuKYh
	kjO+8Cb5af1XXqxBCZrshyMZO+hmrv8oJo3RTvWjoeGtke5XUtCRXiu9HEhl147aWF3OTFH4Rbzse
	JjE/cyl5GrUWc1+zXgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5iRK-00Bull-08; Tue, 20 Jul 2021 05:37:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5iRF-00BulE-FY; Tue, 20 Jul 2021 05:37:08 +0000
X-UUID: 5e22307b210c4ff19c8ebd5d9d42648a-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zIpik6hQDWaGC/2nFu39BaoEG37VtqOoY4AV0DzRV20=; 
 b=UaVE8L2x+FYhlX8l/9e5qNEgZ/FmqXO/WFNRU4TOL6rpWq8q2eZce2kGW3JBt/ye/rLOA0TJYqmgWnUKl12T8szJ/1huzv0Umwl6abNk9bLA85stPSlYBikHEViy556iQTMniH/YVEB+KxcsSth5z9zuEiG7LiEcQUL6Y4Q2TFY=;
X-UUID: 5e22307b210c4ff19c8ebd5d9d42648a-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1934843028; Mon, 19 Jul 2021 22:36:59 -0700
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 22:27:06 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Jul 2021 13:26:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Jul 2021 13:26:58 +0800
Message-ID: <1626758818.4247.0.camel@mhfsdcap03>
Subject: Re: [PATCH v2] PM: runtime: enable wake irq after runtime_suspend
 hook called
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, 
 Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Linux PM
 <linux-pm@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, Alan Stern <stern@rowland.harvard.edu>, 
 Ikjoon Jang <ikjn@chromium.org>, Tony Lindgren <tony@atomide.com>
Date: Tue, 20 Jul 2021 13:26:58 +0800
In-Reply-To: <CAJZ5v0iH7D=D70ea7Q0LqP0iUdRYPf4GH2g7dC7J2_54WW1C8A@mail.gmail.com>
References: <1626427381-30131-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAJZ5v0iH7D=D70ea7Q0LqP0iUdRYPf4GH2g7dC7J2_54WW1C8A@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B75593554F78E799DF0F2B58C24AF4BD7A55A65701F1E2F16AF9C5BA25CC284B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_223706_375439_6C56CAA0 
X-CRM114-Status: GOOD (  38.32  )
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

On Fri, 2021-07-16 at 14:52 +0200, Rafael J. Wysocki wrote:
> On Fri, Jul 16, 2021 at 11:23 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > When the dedicated wake-irq is level trigger, and it uses the
> > consumer's sleep status as the wakeup source,
> 
> This is not a typical case, though, AFAICS.
> 
> So you seem to have a special requirement and you want to change a
> generic framework in an incompatible way to accommodate it.
> 
> > that means if the
> > consumer is not in sleep state, the wake-irq will be triggered
> > when enable it; For this case, need enable the wake-irq after
> > invoking the consumer's runtime_suspend() which make the consumer
> > enter sleep state.
> >
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
> > In this example, can't fix it by using falling edge trigger without
> > this patch, the issue will happen as below steps:
> > 1. use another wakeup source to wake up the suspended system;
> > 2. the consumer's resume() will be called, and exits sleep state;
> > 3. the consumer's wakeup signal will fall into low level, due to
> >    currently the wakeup irq is disabled, the wake-irq is pending;
> > 4. the consumer tries to enter runtime suspend, but there is a
> >    pending wakeup irq, so will resume again, this will repeat
> >    endlessly.
> >
> > This patch seems no side effect on edge trigger wake-irq that works
> > before.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: add more commit message
> >
> >   I use the falling edge trigger interrupt suggested by Ikjoon [1], it
> > works well at firstly when only use this related wakeup source, but
> > encounter issues if use other wakeup sources to wakeup platform as
> > described in commit message.
> >   Send out the patch again for further discussion.
> >
> > [1]: https://patchwork.kernel.org/patch/12190407
> >
> > ---
> >  drivers/base/power/runtime.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > index 8a66eaf731e4..90a91b2b1364 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -639,12 +639,12 @@ static int rpm_suspend(struct device *dev, int rpmflags)
> >         __update_runtime_status(dev, RPM_SUSPENDING);
> >
> >         callback = RPM_GET_CALLBACK(dev, runtime_suspend);
> > -
> > -       dev_pm_enable_wake_irq_check(dev, true);
> 
> I would suggest adding a wake IRQ flag to indicate that it needs
> special handling and modifying the above to take that new flag into
> account.
> 
> >         retval = rpm_callback(callback, dev);
> >         if (retval)
> >                 goto fail;
> >
> > +       dev_pm_enable_wake_irq_check(dev, true);
> 
> Then, you can add an entirely new call here, say
> dev_pm_enable_wake_irq_complete(dev), that will do the actual enable
> for the wake IRQs with the new flag set and nothing for the others.
> 
> > +
> >   no_callback:
> >         __update_runtime_status(dev, RPM_SUSPENDED);
> >         pm_runtime_deactivate_timer(dev);
> > @@ -690,7 +690,6 @@ static int rpm_suspend(struct device *dev, int rpmflags)
> >         return retval;
> >
> >   fail:
> > -       dev_pm_disable_wake_irq_check(dev);
> 
> And obviously this will really disable wake IRQs with the new flag unset only.

Ok, I'll try it, thanks a lot

> 
> >         __update_runtime_status(dev, RPM_ACTIVE);
> >         dev->power.deferred_resume = false;
> >         wake_up_all(&dev->power.wait_queue);
> > --
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
