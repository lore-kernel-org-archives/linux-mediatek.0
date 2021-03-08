Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AD6C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:05:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 055E36514A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 055E36514A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SJL6vQ5wBdb3To8kMCDDSo7gQ2HkyhI1reGa1zNF1Rs=; b=iqGCkrL+qMiVadBCoTGJniJ/S
	Fy+/J2d60IU/j1dq47TIrihGsySMDmD6EoYst5tmLSNtnqhLRkLVilmcLTMFcKnpjPS5l+0TKHqU+
	ev/XFKzWDLCUUHK/wFgKOew3WMOS5CbT7bHlGXMu03S5sIeRFjQEIzfBHY3/46UNEJqplbsb1cdN0
	+dPe+G7ngkxCYDjalA5S52hjoDLmI2+SvUBL51ZUeE0tuGnIyb7fCH5ncu/wZkf1Z5LTwAuX+MwO9
	sxpGY8nPEqYln7ROWw5a2LCW58r3KGdYFialDWje6q4gNoipQJHiJgqRLoWrCLOInJnDlgfG6CB+A
	1r7wtWVGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6Ck-00EiU2-Sk; Mon, 08 Mar 2021 03:05:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6AZ-00Eh75-8n; Mon, 08 Mar 2021 03:02:57 +0000
X-UUID: e58489002eb64d69baf0d4110dd0023c-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AZ70FUNM6vaPE0Iwc/GWiXn+RXqyBkgt8BMCq5f6NZs=; 
 b=V16KQfWHUnWwWReW8xQ8NMw6IojOzc/w62cA0aYxNGCdQu3odjxK2/QMa+VC+7U5SVy94jUMniLnG5yyYmXRoatRZjNYfVW/obf3EF4CkA7g9eogn/lmvEpxeQfq7QqAhbm/UqAxP5nu08jhhcjJDN2vjWJRhPJMeUnD5A2wIsA=;
X-UUID: e58489002eb64d69baf0d4110dd0023c-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1566064134; Sun, 07 Mar 2021 19:02:24 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 19:01:34 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 11:01:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 11:01:33 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
CC: <daniel@thingy.jp>, <jason@lakedaemon.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <tglx@linutronix.de>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] irqchip/irq-mst: Support polarity configuration
Date: Mon, 8 Mar 2021 11:01:01 +0800
Message-ID: <20210308030102.5161-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <874khorux9.wl-maz@kernel.org>
References: <874khorux9.wl-maz@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_030256_266319_E458E63C 
X-CRM114-Status: GOOD (  21.17  )
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

From: Marc Zyngier <maz@kernel.org>

> > 
> > Support irq polarity configuration and save and restore the config
> > when system suspend and resume.
> > 
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  drivers/irqchip/irq-mst-intc.c | 87 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 84 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
> > index 143657b0cf28..979a4d55bcb1 100644
> > --- a/drivers/irqchip/irq-mst-intc.c
> > +++ b/drivers/irqchip/irq-mst-intc.c
> > @@ -13,15 +13,25 @@
> >  #include <linux/of_irq.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> > +#include <linux/syscore_ops.h>
> >  
> > -#define INTC_MASK	0x0
> > -#define INTC_EOI	0x20
> > +#define INTC_MASK		0x0
> > +#define INTC_REV_POLARITY	0x10
> > +#define INTC_EOI		0x20
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +static LIST_HEAD(mst_intc_list);
> > +#endif
> >  
> >  struct mst_intc_chip_data {
> >  	raw_spinlock_t	lock;
> >  	unsigned int	irq_start, nr_irqs;
> >  	void __iomem	*base;
> >  	bool		no_eoi;
> > +#ifdef CONFIG_PM_SLEEP
> > +	struct list_head entry;
> > +	u16 saved_polarity_conf[DIV_ROUND_UP(64, 16)];
> 
> Where is this 64 coming from?

The maximum number of interrupts a mst-intc supports is 64 in
Mstar and Mediatek SoCs now.
So I just use the maximum number of interrupts here.

> 
> > +#endif
> >  };
> >  
> >  static void mst_set_irq(struct irq_data *d, u32 offset)
> > @@ -78,6 +88,16 @@ static void mst_intc_eoi_irq(struct irq_data *d)
> >  	irq_chip_eoi_parent(d);
> >  }
> >  
> > +static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
> > +{
> > +	if (type == IRQ_TYPE_LEVEL_LOW) {
> > +		mst_set_irq(data, INTC_REV_POLARITY);
> > +		type = IRQ_TYPE_LEVEL_HIGH;
> > +	}
> 
> If you are introducing a irq_set_type callback, you need to return an
> error for the settings you don't handle.

Got it, thanks for the comment.
I will add it in the next patch.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
