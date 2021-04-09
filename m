Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6180DC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 01:54:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDABA610CF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 01:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDABA610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WjucLGre1dVPmMwf8HXhTQBLySSTR9UUwR/xxfZ/h5k=; b=kPQQ49I74QSEgZ80WX/OIxq4Z
	tXn1QsprIulO1KZrhWATvUuP1CVZZcI/HsCs0tQiUAeVbhPtTNxfpouJMHXhY46QPdLZ+8VElK2EP
	l1/L1eNXThTdacfduia+V8S7aI2xOC9Dm+RVuSwMMEKo6SJLWiu6vjWbuZPO8bCeJ2BwbblRhx2jL
	zIFW6rpAprYBT140IsyHh5LFkY8MqbgbLA0k/Hc3HxOCyqB13tEceVNjVYnvgZG7knbXEkjZ8UmEU
	GAKzwd8VGstyMxnAqp4bdWFWwz85XaXCo17uqrlc8Hmn7NJYlAiBPfG2J36r1Yk2LvrH45669pVEj
	KozI8xzlA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUgLT-009g2G-Ag; Fri, 09 Apr 2021 01:54:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUgLE-009fzc-9k; Fri, 09 Apr 2021 01:53:51 +0000
X-UUID: 1603c39a782f480fb2ab401623b177cc-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WCCGjD2i/tFPN4rjc7RFbfR3PPHyPKT9cvYT4d2kpJs=; 
 b=RPR/Pij836Dpvi/cGMBt6qLaKJ1hV9zfT3jL/leLXqBHkY2o/5mnHC0dZ8dO/MSewvInLyd5JMIK95AbobFPb8f5fcDr+F/IpL8KySpdoW8tZzf9pBu8vhNiVor1eZ3X4y8x+keS5e/68VcQBzRO20sGfW08kJjOMVg0rSmMoIs=;
X-UUID: 1603c39a782f480fb2ab401623b177cc-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 664061262; Thu, 08 Apr 2021 18:53:42 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 18:53:40 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 9 Apr 2021 09:53:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 09:53:31 +0800
Message-ID: <1617933211.12105.22.camel@mhfsdcap03>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown
 <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "open list:ULTRA-WIDEBAND
 (UWB) SUBSYSTEM:" <linux-usb@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, Tianping Fang <tianping.fang@mediatek.com>, 
 Eddie Hung <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 9 Apr 2021 09:53:31 +0800
In-Reply-To: <CAJZ5v0gGntbfnvAP5A491_hUh-JUuqZjZRdPPLwWJjnZRtemcQ@mail.gmail.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAJZ5v0gGntbfnvAP5A491_hUh-JUuqZjZRdPPLwWJjnZRtemcQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ACE7095BD198D82D0CD3C193451A34F2488D21E8BCBB24999214E20CCB4948BB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_025349_345910_8D017EB7 
X-CRM114-Status: GOOD (  25.70  )
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

On Thu, 2021-04-08 at 19:41 +0200, Rafael J. Wysocki wrote:
> On Thu, Apr 8, 2021 at 11:35 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > When the dedicated wake irq is level trigger, enable it before
> > calling runtime_suspend, will trigger an interrupt.
> >
> > e.g.
> > for a low level trigger type, it's low level at running time (0),
> > and becomes high level when enters suspend (runtime_suspend (1) is
> > called), a wakeup signal at (2) make it become low level, wake irq
> > will be triggered.
> >
> >                 ------------------
> >                |           ^     ^|
> > ----------------           |     | --------------
> >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> >
> > if we enable the wake irq before calling runtime_suspend during (0),
> > an interrupt will arise, it causes resume immediately;
> 
> But that's necessary to avoid missing a wakeup interrupt, isn't it?
That's also what I worry about.
It may happen if the trigger level only keeps a very short time, and the
interrupt controller can't process it timely, but I don't think it
follow the level trigger mechanism, the HW should latch it until the ISR
is called. right?

> 
> > enable wake irq after calling runtime_suspend, e.g. at (3) or (4),
> > will works.
> >
> > This patch seems no side effect on edge trigger wake irq.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/base/power/runtime.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > index a46a7e30881b..796739a015a5 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -619,12 +619,12 @@ static int rpm_suspend(struct device *dev, int rpmflags)
> >         __update_runtime_status(dev, RPM_SUSPENDING);
> >
> >         callback = RPM_GET_CALLBACK(dev, runtime_suspend);
> > -
> > -       dev_pm_enable_wake_irq_check(dev, true);
> >         retval = rpm_callback(callback, dev);
> >         if (retval)
> >                 goto fail;
> >
> > +       dev_pm_enable_wake_irq_check(dev, true);
> > +
> >   no_callback:
> >         __update_runtime_status(dev, RPM_SUSPENDED);
> >         pm_runtime_deactivate_timer(dev);
> > @@ -659,7 +659,6 @@ static int rpm_suspend(struct device *dev, int rpmflags)
> >         return retval;
> >
> >   fail:
> > -       dev_pm_disable_wake_irq_check(dev);
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
