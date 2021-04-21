Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B85C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:28:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 198A46144D
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 198A46144D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RJ9+wN57LxbPRKLrsWKubX52e39DG6xtR0Ey9R/i0TI=; b=gHpQcSWeczOmhGQkIWcHpx7QI
	5LJCgx1t7Wg9zf6L8nK/RSt8K7BdIuL7zt1Wbam/nYWuz2ZKu4Fo+sEx/nAJD8Sp7KjQJl/o0DC6F
	zYQNTj/36MhTwFKJWhJx4NTkWdvFVroE+N4SnGhASTyjc6PCN3NazuSo8Do/o+As0b59cF+JNlmEw
	DDmrXCoGJ0hsSE10GJhUtuyZeauFuDda1LnhehQyzqugYuWsiroSn+kE3sGGKjbpV2DmJKPKgbfMb
	fFxxpvzIgsv6Vkc91LQj280kFh0V50mM0AQI2gS/bfQ/sRfZ3Z3XffItFMAm3gXM08KPX2g152Fgh
	/yPE0tH1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZA5M-00EE0T-Tu; Wed, 21 Apr 2021 10:27:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZA51-00EDxp-ON; Wed, 21 Apr 2021 10:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=zFw8yAnZqHqrgrCE9zr6oWDMCQRp7B4opFO4tAmUvF0=; b=CyNpcs2MakvnNW46H6olLhEkNy
 MJ8sAbmlOAg2o6v1GXfsBW50BrOoIVhJaYGJHdpw0JhZhDh46Ce3s8aHltHcljNafQaNpn9HxRbUW
 AZdakbsglE/wL5Z7PLjgiF+Ylu0dQy7Bunx/R4/ZMr9EtHyLkR0nActw7J1cyh9Hb25MZ9d7D3pJI
 qrgvOH8VZE6zfeqcXuGthGdm5xf0XJKwFxRWboTk6XDwTUAc3dhN1saPRaAyjs1L737zExofBZarK
 fzl0ewEO4Q7WZnBi27osyMlyBOlRWiyQOCRxTd43rCL27u0Nu47MjJ/FGJg4L7zlgrIE+twyDrDPR
 UmDQY6vw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZA4z-00Co7c-06; Wed, 21 Apr 2021 10:27:34 +0000
X-UUID: 5e351f003c994651bdebb0d7ddc5f971-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zFw8yAnZqHqrgrCE9zr6oWDMCQRp7B4opFO4tAmUvF0=; 
 b=qNJSCDvJpYcmQM/1DEKCY2ZFSy91aoFCeKiXFkt7ULStjxUkv+DnkGyHlQjEhVjSOWtPXpUI1HUzS7GQNnoeWyYOtW1RcngAu+5TURso3Pfn/vTa20b7jMRlU3f4s8HJSRTICyQcHeRCYv1Ew1tzl6LXusvwOIctZrVsLfFZOPY=;
X-UUID: 5e351f003c994651bdebb0d7ddc5f971-20210421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 122746744; Wed, 21 Apr 2021 03:27:32 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 03:27:31 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 21 Apr 2021 18:27:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Apr 2021 18:27:27 +0800
Message-ID: <1619000848.25707.27.camel@mhfsdcap03>
Subject: Re: [PATCH] [v4, 1/1] clocksource/drivers/timer-mediatek: optimize
 systimer irq clear flow on shutdown
From: Fengquan Chen <fengquan.chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dehui.sun@mediatek.com>, Evan Benn <evanbenn@chromium.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 21 Apr 2021 18:27:28 +0800
In-Reply-To: <4d3b342c-a14f-f4ac-6860-9f6a88a24501@linaro.org>
References: <1617960162-1988-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1617960162-1988-2-git-send-email-Fengquan.Chen@mediatek.com>
 <4d3b342c-a14f-f4ac-6860-9f6a88a24501@linaro.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 77D99EEB134BE632C746AE0F8EF0FE504702C5572C2084D0759BF152633710EB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_032733_063498_153B0F4A 
X-CRM114-Status: GOOD (  27.54  )
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

On Mon, 2021-04-19 at 10:44 +0200, Daniel Lezcano wrote:
> On 09/04/2021 11:22, Fengquan Chen wrote:
> > mtk_syst_clkevt_shutdown is called after irq disabled in suspend flow,
> > clear any pending systimer irq when shutdown to avoid suspend aborted
> > due to timer irq pending
> > 
> > Also as for systimer in mediatek socs, there must be firstly enable
> > timer before clear systimer irq
> > 
> > Fixes: e3af677607d9("clocksource/drivers/timer-mediatek: Add support for system timer")
> > Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
> > 
> > ---
> >  drivers/clocksource/timer-mediatek.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> > index 9318edc..6461fd3 100644
> > --- a/drivers/clocksource/timer-mediatek.c
> > +++ b/drivers/clocksource/timer-mediatek.c
> > @@ -60,9 +60,9 @@
> >   * SYST_CON_EN: Clock enable. Shall be set to
> >   *   - Start timer countdown.
> >   *   - Allow timeout ticks being updated.
> > - *   - Allow changing interrupt functions.
> > + *   - Allow changing interrupt status,like clear irq pending.
> >   *
> > - * SYST_CON_IRQ_EN: Set to allow interrupt.
> > + * SYST_CON_IRQ_EN: Set to enable interrupt.
> >   *
> >   * SYST_CON_IRQ_CLR: Set to clear interrupt.
> >   */
> > @@ -75,6 +75,7 @@
> >  static void mtk_syst_ack_irq(struct timer_of *to)
> >  {
> >  	/* Clear and disable interrupt */
> > +	writel(SYST_CON_EN, SYST_CON_REG(to));
> >  	writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
> >  }
> 
> IIRC, there is a hardware issue here. If it is the case, please describe
> it and refer to an errata if any.

Thanks for review.
here is just a hw config flow limitation, not a bug.

> 
> Also Evan Benn commented your code and asked a couple of questions [1],
> please answer before reposting a new version.
> 
> Comments ignored == patch ignored

Thanks. i have answered by mail before, but it didn't uploaded to the
list. has been uploaded ok now.

> 
> > @@ -111,6 +112,9 @@ static int mtk_syst_clkevt_next_event(unsigned long ticks,
> >  
> >  static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
> >  {
> > +	/* Clear any irq */
> > +	mtk_syst_ack_irq(to_timer_of(clkevt));
> > +
> >  	/* Disable timer */
> >  	writel(0, SYST_CON_REG(to_timer_of(clkevt)));
> 
> Please check out the patch sent by Evan Benn [2], if you agree, ack it.
> 

Thanks

agree

> Thanks
> 
>   -- Daniel
> 
> [1] https://patchwork.kernel.org/comment/24059277/
> [2]
> https://lore.kernel.org/linux-arm-kernel/20210412132200.v3.1.I1d9917047de06715da16e1620759f703fcfdcbcb@changeid/
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
