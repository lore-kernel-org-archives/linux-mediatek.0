Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59847C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:12:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F906142F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F906142F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=StxP8X+CqdZ2IrcimpXdcy8Wwe6C59V+/NnlZzz7kWA=; b=UkfW8jSa6bf6xYr5OMl16eHhL
	/Z/ymMUIQ2QDjrtgVtwwyRGwF21Lxe3KkyGSivpjSgWI3fVXzQ5TqYggZGqWY3bZMMm+AejuNHRAn
	QC+TBPvW13uIwMhoEWbTOi+2fdoNdHB6eRpTZWX9OoPWIskHNIodFO8hXSfr98cetbE0rgqqNtOxz
	nv7sQQgKZgSJK3R4GmoQxa3Y9neUXfazIOu0i2dYiM31A8kDjreJMHn/36LXtlMZ3E/Eicwjgy+ks
	78c4IAnc3jgA4/MtgKzMroU+pfp8s3gu/FU2zrVXZscQxgUCQaUnGHSim9ktIb5kJJgLizZ21Lyv8
	TxUgyojog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ9qO-00ECSb-5b; Wed, 21 Apr 2021 10:12:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ9qL-00ECSS-UI; Wed, 21 Apr 2021 10:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Vn/ic3Au+/MFZkrpkPv53uQSDSyk0G7+n+ZUcV848Ek=; b=Yzq1BQfqUe5+dDs+FrMXnFvEjR
 FNlM70MwTLR2kHwxXJMSjhrC8Gqzr0G6ynYQulUwFBAKA00ZRyKoNhrXGBqRUBkyyJevkGU38ZLvr
 mWw1lkDDhbCw6Hn+ffrWHrF7KbJPBn2XOMso6hC38z+CZ1kPCCJYjFZZe4MQ3QC3BYjYiCn3f674X
 gQWBoNqOLAUbMn+Tw6pEXSi0dW5szAXYGUawHOLAsmZugv1wL+FXuzTrBuXenR7M4/RVP2+aK+PZg
 QLGg3doByJ0DHrWhnvqRETmPzG/JlrFUDL9I85MITYEguZzZZ0mpizQxrKDowb1k+SW8vanQmjOfH
 0OEgSRmw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ9qH-00CnO7-0C; Wed, 21 Apr 2021 10:12:23 +0000
X-UUID: eb4e6a0a87c2407b9814e4655ee02ec4-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Vn/ic3Au+/MFZkrpkPv53uQSDSyk0G7+n+ZUcV848Ek=; 
 b=GLl4prc/0BrfuBa+7d235BMsSfxQkNY1DWKHu1HMy6lQ8WKvrLSjQGC1nQnsFZq03e8w9uhG88ILZGgXmqpT7BTkba5WnYqnlNfWSkKf7BMGPboo41yDgfDf5m0YHSTgDBmv7jodPdP7Ifg4iDGolncnUWRyyfwIvbQRXdmvtRk=;
X-UUID: eb4e6a0a87c2407b9814e4655ee02ec4-20210421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 881312377; Wed, 21 Apr 2021 03:12:16 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 03:07:57 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 21 Apr 2021 18:07:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Apr 2021 18:07:52 +0800
Message-ID: <1618999672.25707.13.camel@mhfsdcap03>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: optimize systimer
 irq clear flow on Mediatek Socs
From: Fengquan Chen <fengquan.chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dehui.sun@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 21 Apr 2021 18:07:52 +0800
In-Reply-To: <c91e9afc-8b04-f35b-bcf9-1fcf9a6f425f@linaro.org>
References: <1614670085-26229-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1614670085-26229-2-git-send-email-Fengquan.Chen@mediatek.com>
 <c91e9afc-8b04-f35b-bcf9-1fcf9a6f425f@linaro.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7FCA932D73FF3B2DC81C4B0FD3A5E49DA968D3CAE9ACD0F98B07D7C70245117B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_031221_076033_8D85D864 
X-CRM114-Status: GOOD (  28.16  )
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

On Mon, 2021-03-22 at 11:10 +0100, Daniel Lezcano wrote:
> On 02/03/2021 08:28, Fengquan Chen wrote:
> > 1)ensure systimer is enabled before clear and disable interrupt, which only
> > for systimer in Mediatek Socs.
> >
> > 2)clear any pending timer-irq when shutdown to keep suspend flow clean,
> > when use systimer as tick-broadcast timer
> > 
> > Change-Id: Ia3eda83324af2fdaf5cbb3569a9bf020a11f8009
> 
> Remove the above.
> 
> Add a Fixes tag.

Thanks for review, has been fixed in V4:
https://patchwork.kernel.org/project/linux-mediatek/patch/1617960162-1988-2-git-send-email-Fengquan.Chen@mediatek.com/

> 
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
> >  {
> >  	/* Clear and disable interrupt */
> > +	writel(SYST_CON_EN, SYST_CON_REG(to));
> 
> 	SYST_CON_EN is set below, why do you have to do it before?
> 
> Is that a hw bug ?
> 
> It is confusing what the description of the SYST_CON_EN says:
> 
> /*
>  * SYST_CON_EN: Clock enable. Shall be set to
>  *   - Start timer countdown.
>  *   - Allow timeout ticks being updated.
>  *   - Allow changing interrupt functions.
> 
> What means "interrupt functions" ?
> 
> Does writing writel(SYST_CON_EN, SYST_CON_REG(to)) before
> SYST_CON_IRQ_CLR allows to clear the interrupt flag?
> 
> Can you explain how the timer works regarding this part?
> 
> It sounds to me a bit strange.
> 
>  *
>  * SYST_CON_IRQ_EN: Set to allow interrupt.
>  *
>  * SYST_CON_IRQ_CLR: Set to clear interrupt.
>  */
> 

Thanks for review, descriptions about
SYST_CON_IRQ_CLR/SYST_CON_EN/SYST_CON_IRQ_EN have been updated in v4.

And for systimer, there's a hw limitation that before clearing pending
irqs, we must enable timer first. so we added a SYST_CON_EN write before
SYST_CON_IRQ_CLR write to ensure irq clear successfully.

Also, we cannot only write SYST_CON_IRQ_CLR without SYST_CON_EN bit,
because EN bit is also timer clock enable bit. 

this is a hardward design limitation but not a bug.

> 
> >  	writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
> >  }
> >  
> > @@ -111,6 +112,9 @@ static int mtk_syst_clkevt_next_event(unsigned long ticks,
> >  
> >  static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
> >  {
> > +	/* Clear any irq */
> > +	mtk_syst_ack_irq(to_timer_of(clkevt));
> > +
> >  	/* Disable timer */
> >  	writel(0, SYST_CON_REG(to_timer_of(clkevt)));
> >  
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
