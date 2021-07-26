Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A369C4320E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1DC60F5A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF1DC60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RaghXveGYzo0dxPZGywC0VAElKwiRvd5dIpChg+opY=; b=OecTvrh0pVZ7qx
	EW3z/hXbWxWYkygqguzh8CR0w85enafA0YL/meyjZmcnOUxJIlFnqd2ggUGWHHODoPRfXXkw+pv15
	oyJqTw3JD/Ih6Z/yCXYfgyVh/ETdqnj2xfj/eaB8lPqPVWqojuUfoC4BrPk1PJWkxcvRgKtTaspaS
	FRjBVKmQOcBD8XIMN8DeREO788Y7Mf078OFzEpTZgb4OPQbOHMs+A+uyOgy4nKSfVFHQeTyD7DngB
	X8LKQRsGewRviG0cE3iSC5zmCWuqY1t7wZEfBXK8jrJojlLhJnkTGo703/lgcV17gkdqXmXMtqBb9
	i3Mq4ZgWB7A4+XkQdjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xZ1-00AdgA-KE; Mon, 26 Jul 2021 10:10:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xYy-00Ade9-OJ; Mon, 26 Jul 2021 10:10:22 +0000
X-UUID: af67c3ae747846ffbe1ff8381bfe266f-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
 bh=rv/DOWyX88A+TeQfnHqh9Nw3aWoA1q2sNpe/dznTr2U=; 
 b=AOJLJ8ozcTMyPtvPRPC+NSPrpIpaygdbhYaq0QAtGd+WmuhauCu5yvrjrSOrt7kZzmLBj78OgRcrvwzQiILUn1tGPCy2sWhrGAKoaNPEHdZECfTLsaOyhP4xmIsPGBfS5FlOYajEWxLJA2hOwkKs1c5L+iZHXpJ1CjJMko3j9hs=;
X-UUID: af67c3ae747846ffbe1ff8381bfe266f-20210726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1155562670; Mon, 26 Jul 2021 03:10:15 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 03:01:54 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 26 Jul 2021 18:01:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 18:01:48 +0800
Message-ID: <1627293708.10231.3.camel@mhfsdcap03>
Subject: Re: [PATCH] [v4, 1/1] clocksource/drivers/timer-mediatek: optimize
 systimer irq clear flow on shutdown
From: Fengquan Chen <fengquan.chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dehui.sun@mediatek.com>, Evan Benn <evanbenn@chromium.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Mon, 26 Jul 2021 18:01:48 +0800
In-Reply-To: <1619000848.25707.27.camel@mhfsdcap03>
References: <1617960162-1988-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1617960162-1988-2-git-send-email-Fengquan.Chen@mediatek.com>
 <4d3b342c-a14f-f4ac-6860-9f6a88a24501@linaro.org>
 <1619000848.25707.27.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 28765AAEE42228EE297569FACD9DAB7DBF080DFBB6BF177F00CB4D1BDB38CD5B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_031020_849591_1B556444 
X-CRM114-Status: GOOD (  29.86  )
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

hi Daniel,

Gentle pin for this patch.

Thanks
Best Regards
Fengquan


On Wed, 2021-04-21 at 18:27 +0800, Fengquan Chen wrote:
> On Mon, 2021-04-19 at 10:44 +0200, Daniel Lezcano wrote:
> > On 09/04/2021 11:22, Fengquan Chen wrote:
> > > mtk_syst_clkevt_shutdown is called after irq disabled in suspend flow,
> > > clear any pending systimer irq when shutdown to avoid suspend aborted
> > > due to timer irq pending
> > > 
> > > Also as for systimer in mediatek socs, there must be firstly enable
> > > timer before clear systimer irq
> > > 
> > > Fixes: e3af677607d9("clocksource/drivers/timer-mediatek: Add support for system timer")
> > > Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
> > > 
> > > ---
> > >  drivers/clocksource/timer-mediatek.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> > > index 9318edc..6461fd3 100644
> > > --- a/drivers/clocksource/timer-mediatek.c
> > > +++ b/drivers/clocksource/timer-mediatek.c
> > > @@ -60,9 +60,9 @@
> > >   * SYST_CON_EN: Clock enable. Shall be set to
> > >   *   - Start timer countdown.
> > >   *   - Allow timeout ticks being updated.
> > > - *   - Allow changing interrupt functions.
> > > + *   - Allow changing interrupt status,like clear irq pending.
> > >   *
> > > - * SYST_CON_IRQ_EN: Set to allow interrupt.
> > > + * SYST_CON_IRQ_EN: Set to enable interrupt.
> > >   *
> > >   * SYST_CON_IRQ_CLR: Set to clear interrupt.
> > >   */
> > > @@ -75,6 +75,7 @@
> > >  static void mtk_syst_ack_irq(struct timer_of *to)
> > >  {
> > >  	/* Clear and disable interrupt */
> > > +	writel(SYST_CON_EN, SYST_CON_REG(to));
> > >  	writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
> > >  }
> > 
> > IIRC, there is a hardware issue here. If it is the case, please describe
> > it and refer to an errata if any.
> 
> Thanks for review.
> here is just a hw config flow limitation, not a bug.
> 
> > 
> > Also Evan Benn commented your code and asked a couple of questions [1],
> > please answer before reposting a new version.
> > 
> > Comments ignored == patch ignored
> 
> Thanks. i have answered by mail before, but it didn't uploaded to the
> list. has been uploaded ok now.
> 
> > 
> > > @@ -111,6 +112,9 @@ static int mtk_syst_clkevt_next_event(unsigned long ticks,
> > >  
> > >  static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
> > >  {
> > > +	/* Clear any irq */
> > > +	mtk_syst_ack_irq(to_timer_of(clkevt));
> > > +
> > >  	/* Disable timer */
> > >  	writel(0, SYST_CON_REG(to_timer_of(clkevt)));
> > 
> > Please check out the patch sent by Evan Benn [2], if you agree, ack it.
> > 
> 
> Thanks
> 
> agree
> 
> > Thanks
> > 
> >   -- Daniel
> > 
> > [1] https://patchwork.kernel.org/comment/24059277/
> > [2]
> > https://lore.kernel.org/linux-arm-kernel/20210412132200.v3.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid/
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
