Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD1CC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:28:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAE46140F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAAE46140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yGYMYs+cmaW3FkV0P3zXOzdVHdCiCSofyIdXlMuePcc=; b=nKPt3dNkiSfzdXkX2n1hAjFTn
	bE+3OdRooO5bY/5KTQ+WIfP1NpxyGbXwo0hz1E02SCZXrconpnxjb0G4TeqCDPPmtlTJwIP2QlUIY
	On3uLaqXhfUhKJDGjBAS0e3+sYPiY1o5XiaScJQ5I6SCZz4VyPV5ZGZcjagjzkOw43kWIU+mEHsBW
	IPg3jhsi6SYz5lpqK2Qn12fZFwIvkJsLApK4hPci27KrwH0avTvv2S+tB6+so2oX0eOj8mxZKId7Z
	8DPKMg5B8CkoOYFgVfjOqg97sKlpBXPBv6zQ1oXTrYcjrv07XxckzzlEhvjFWar+LuN1tG+PNWIvz
	H35a9kAJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZA57-00EDy6-Hr; Wed, 21 Apr 2021 10:27:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZA4r-00EDx3-5X; Wed, 21 Apr 2021 10:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=9IoeKBla8pN9WE4+y5GJhke4Dy+p0ylLEjnf88v7Uqk=; b=z8LxCFgyI/PhWdslUQuD8FLPin
 CXlfsx1RWU+XMfjWzPeuvyQ+ZCFI5HCWnYFu2pnIAcGpwTc3IbQzSQCn2Zun6eqiDJGWzLDZwyyVv
 ztq76viXqJCBjyBXtlF0YV9ZTbc1GsVpyHCmML1+P0nr21NouEysUwtVLFaY+1zB0HjF9CirRJFGC
 CQ2sNi4aMeRP1Pk6T+VxalWWvxPk/a8rQ5plviESjJjSZqtUbEBAqfb6IaMmppb7k215vluKC+qqk
 jx/tZBiiUFas83QJxqJmcMu97t83aNvkmBPhA1TvBEfYf6nCF/eHPNlpexLmpL5c+Yz1UowODVG6+
 CjUKysxg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZA4n-00Co5P-Q8; Wed, 21 Apr 2021 10:27:23 +0000
X-UUID: d6f8a71cb1fd4c518e71b9ac7a3f5fb0-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9IoeKBla8pN9WE4+y5GJhke4Dy+p0ylLEjnf88v7Uqk=; 
 b=fQNY8k1jcr1ai4RxVlKGqy4Sh6iY16HRZ+oA0gEszTI+/RS/kDRdk0rscojYm9Xgs2GFggVQqxEKSGUkzPDGhZOdSQnUPQrk/jNJQ1YywVuZ/U6S5V8mhh1k+tV14lM83t2bo5TjaDiApMlM60cbUG9cd515Uk6JBtNtBz0naIo=;
X-UUID: d6f8a71cb1fd4c518e71b9ac7a3f5fb0-20210421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 593962591; Wed, 21 Apr 2021 03:27:18 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 03:17:15 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 21 Apr 2021 18:17:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Apr 2021 18:17:07 +0800
Message-ID: <1619000227.25707.20.camel@mhfsdcap03>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: optimize systimer
 irq clear flow on Mediatek Socs
From: Fengquan Chen <fengquan.chen@mediatek.com>
To: Evan Benn <evanbenn@chromium.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <dehui.sun@mediatek.com>
CC: LKML <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Date: Wed, 21 Apr 2021 18:17:07 +0800
In-Reply-To: <CAKz_xw2abQyS9Vvx7DUppGGd-AaDQAfdAOwi46fB9yLPJWJeUA@mail.gmail.com>
References: <1614670085-26229-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1614670085-26229-2-git-send-email-Fengquan.Chen@mediatek.com>
 <CAKz_xw2abQyS9Vvx7DUppGGd-AaDQAfdAOwi46fB9yLPJWJeUA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BDB2F9AC03454462D38628DCDC4993140A01337F80411D53696602FA182485272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_032721_876577_10DC7422 
X-CRM114-Status: GOOD (  28.58  )
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

On Tue, 2021-03-23 at 11:48 +1100, Evan Benn wrote:
> On Thu, Mar 4, 2021 at 11:07 AM Fengquan Chen
> <Fengquan.Chen@mediatek.com> wrote:
> >
> > 1)ensure systimer is enabled before clear and disable interrupt, which only
> > for systimer in Mediatek Socs.
> 
> Why does the timer need to be enabled before the interrupt can be
> disabled? The datasheet I have does not suggest that this is required.
> 

Thanks for review. For systimer, you must enable timer before clear
irq,it's a hw limitation that would be easily neglected.

> >
> > 2)clear any pending timer-irq when shutdown to keep suspend flow clean,
> > when use systimer as tick-broadcast timer
> >
> > Change-Id: Ia3eda83324af2fdaf5cbb3569a9bf020a11f8009
> > Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
> > ---
> >  drivers/clocksource/timer-mediatek.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> > index 9318edc..9f1f095dc 100644
> > --- a/drivers/clocksource/timer-mediatek.c
> > +++ b/drivers/clocksource/timer-mediatek.c
> > @@ -75,6 +75,7 @@
> >  static void mtk_syst_ack_irq(struct timer_of *to)
> 
> This function seems to be mis-named. It does more than just ack the irq.
> 
> >  {
> >         /* Clear and disable interrupt */
> > +       writel(SYST_CON_EN, SYST_CON_REG(to));
> 
> This line seems to enable the timer and disable the interrupt.
> 
> >         writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
> 
> This line acks the interrupt and enables the timer and disables the interrupt.
> Are these lines both necessary?
> Maybe this function should just ack the interrupt without changing the
> other bits.

Thanks for review. 

it's necessary.

As described above,we must enable timer before clear
irq, so here is just want to ensure irq clear successfully.

We always disable irq here, and will be re-enable in
mtk_syst_clkevt_next_event.

> 
> >  }
> >
> > @@ -111,6 +112,9 @@ static int mtk_syst_clkevt_next_event(unsigned long ticks,
> >
> >  static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
> >  {
> > +       /* Clear any irq */
> > +       mtk_syst_ack_irq(to_timer_of(clkevt));
> > +
> >         /* Disable timer */
> >         writel(0, SYST_CON_REG(to_timer_of(clkevt)));
> 
> This is a third write to the same register, I believe all 3 writes can
> be combined into 1. Is that possible?

Thanks for review. 

there's a hw limitation here, we can not clear irq while timer is
disabled, and SYST_CON_EN&SYST_CON_IRQ_CLR bit must be write at the same
time or can not  write SYST_CON_IRQ_CLR bit seperately.


> 
> >
> > --
> > 1.8.1.1.dirty
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
