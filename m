Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA97C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 07:07:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF4D60FBF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 07:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FF4D60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6pN84X787l8RRz8pYtOFsSfyR1bKsODyDmBeojGWus=; b=CoiLa5Aza730cW
	xmONoje7skt6C0Ci62+zgcRP1sfM84M6nxDYjCL/XD3zLN6h3Se0frVcxOTBuDQaixLOOnx7+i0WG
	XW6jkKg4QVEMPRmEi03EgmKi637HumpP3E34GdXh9NmRXFpyarDJOKBFdgZe2rH7ulza4J5R4Oyh4
	kH1UYOJOzA2AuG8MbwIuaDiNIkkP9xn3EF64PDqbDnhTQzaHcLz+ALm6RNaLXLEWpnmG/+yO5i4zC
	2WPU4AF9a2UK15WADpWJeNDJkO6cIwsibp724zgU7J2DPGFlb8QyChIIC9/i86ncCYLNQ3gLttoQ0
	PUapPg9PKuWeAig7OkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meB7z-00CMjI-Gp; Sat, 23 Oct 2021 07:07:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meB7k-00CMi0-C8; Sat, 23 Oct 2021 07:07:27 +0000
X-UUID: 45b7ad5c7a7d40308d4a74e7d676d7e8-20211023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PmZWJ9UWN+c3zsZcmYLjxNzeeNw+AKsJe5gbnHhBlIk=; 
 b=jMbArvjaCeDjNgCQL4Qljon7aOuL0l0CpO6L7kxdjvJEEKcvNK0LzFuVSsDgTRHohBE9p9Y3vCH9WmBo6Zrx2VOF7fokn9W12TQC8Y2SBaVNUnplR/tVmloxTI2cM4xfdjvnjIs59bn324GDgQfNDDFvA2HygFbsA0MvV6Ch6fw=;
X-UUID: 45b7ad5c7a7d40308d4a74e7d676d7e8-20211023
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2069492631; Sat, 23 Oct 2021 00:07:20 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 00:07:18 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 23 Oct 2021 15:07:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Oct 2021 15:07:12 +0800
Message-ID: <ab177213e7aa808b3803cac46146d96a02724425.camel@mediatek.com>
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
Date: Sat, 23 Oct 2021 15:07:12 +0800
In-Reply-To: <df145215a21b67b440405736d9628199ccce2a1b.camel@mediatek.com>
References: <1628651069-22162-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAJZ5v0hTR2mZk7FuUVciX766qq0AwWXFBZoBsV3Sd9ToYuErdQ@mail.gmail.com>
 <df145215a21b67b440405736d9628199ccce2a1b.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 69F60639D0B2889D7551EF1742E782FD3C13CD9681A813A705DCFB5C80DDD6F22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_000725_869733_83F565B3 
X-CRM114-Status: GOOD (  21.86  )
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

On Sat, 2021-10-23 at 14:35 +0800, Chunfeng Yun wrote:
> On Tue, 2021-10-19 at 17:28 +0200, Rafael J. Wysocki wrote:
> > On Wed, Aug 11, 2021 at 5:05 AM Chunfeng Yun <
> > chunfeng.yun@mediatek.com> wrote:
> > > 
> > > When the dedicated wake-irq is level trigger, and it uses the
> > > consumer's sleep status as the wakeup source, that means if the
> > > consumer is not in sleep state, the wake-irq will be triggered
> > > when enable it; For this case, need enable the wake-irq after
> > > invoking the consumer's runtime_suspend() which make the consumer
> > > enter sleep state.
> > [...]
> 
> If want to make it static, should move it from wakeirq.c into
> runtime.c
> 
> > 
> > >  {
> > >         struct wake_irq *wirq = dev->power.wakeirq;
> > > 
> > >         if (!wirq || !(wirq->status & WAKE_IRQ_DEDICATED_MASK))
> > >                 return;
> > 
> > And I would just add the following line here:
> > 
> > if (cond_disable && (wirq->status &
> > WAKE_IRQ_DEDICATED_LATE_ENABLED))
> >         return;
> 
> This change doesn't cover the case (WAKE_IRQ_DEDICATED_LATE_ENABLED
> and
>  WAKE_IRQ_DEDICATED_MANAGED are both set 1):
> 
> -->rpm_suspend(): wirq->irq is enabled
> -->rpm_resume(): disable wirq->irq; (if change it, doesn't disable
> wirq->irq)
Seems I'm wrong, check again.

> 
> > 
> > > 
> > > -       if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED)
> > > +       if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
> > > +           (skip_late_enabled_status ||
> > > +            !(wirq->status & WAKE_IRQ_DEDICATED_LATE_ENABLED)))
> > >                 disable_irq_nosync(wirq->irq);
> > >  }
> > > 
> > > +/**
> > > + * dev_pm_enable_wake_irq_complete - enable wake irq based on
> > > status
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
