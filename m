Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1715C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 09:10:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFAC651BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 09:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EFAC651BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ePRsK+/f6HmHkBJot+4+bZgRNGMsItqfQqcjw7E2fF4=; b=Re+cVect4DPSsdMqLBXU9JBIJ
	jou9JyFkN9yPiR+FQoe/v/l+ip/6pv3bW1pSltUHPgKR27Me9PDsR3LsbHOQsH8Y3S1mRdp+qPyeD
	vPR2eRbh7DLm9cAn1+I6PtBWUOJ2YUFUQTU9ORkinOoulB86eOo7VtRuaf+wMj48XnVeA+UT37wz8
	q/6jFbBZHp2PpLcupAi8uHQR2mnUOhBZPeAoSpgwtS+54qRXIhu+IeF9iz49dSlvfzUzsBQf9Ggeg
	ODOdvxpicD3XfselwFSacH6OVXoJdkIfiAFJey05tI5trK3LPzgNPZOmEo3kPPkSBFV+4IJyS5TLT
	kJSY68H5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJBty-00G6jL-Sp; Mon, 08 Mar 2021 09:10:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJBtk-00G6eQ-1z; Mon, 08 Mar 2021 09:09:57 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07720651B9;
 Mon,  8 Mar 2021 09:09:53 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lJBtf-000IHt-0Y; Mon, 08 Mar 2021 09:09:51 +0000
MIME-Version: 1.0
Date: Mon, 08 Mar 2021 09:09:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: daniel@thingy.jp, jason@lakedaemon.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, yj.chiang@mediatek.com
Subject: Re: [PATCH] irqchip/irq-mst: Support polarity configuration
In-Reply-To: <20210308030102.5161-1-mark-pk.tsai@mediatek.com>
References: <874khorux9.wl-maz@kernel.org>
 <20210308030102.5161-1-mark-pk.tsai@mediatek.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <01b1c85119619c2418908a2fdabfb5dc@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mark-pk.tsai@mediatek.com, daniel@thingy.jp,
 jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, tglx@linutronix.de, yj.chiang@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_090956_379020_84F5DABC 
X-CRM114-Status: GOOD (  19.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-03-08 03:01, Mark-PK Tsai wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
>> >
>> > Support irq polarity configuration and save and restore the config
>> > when system suspend and resume.
>> >
>> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
>> > ---
>> >  drivers/irqchip/irq-mst-intc.c | 87 ++++++++++++++++++++++++++++++++--
>> >  1 file changed, 84 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
>> > index 143657b0cf28..979a4d55bcb1 100644
>> > --- a/drivers/irqchip/irq-mst-intc.c
>> > +++ b/drivers/irqchip/irq-mst-intc.c
>> > @@ -13,15 +13,25 @@
>> >  #include <linux/of_irq.h>
>> >  #include <linux/slab.h>
>> >  #include <linux/spinlock.h>
>> > +#include <linux/syscore_ops.h>
>> >
>> > -#define INTC_MASK	0x0
>> > -#define INTC_EOI	0x20
>> > +#define INTC_MASK		0x0
>> > +#define INTC_REV_POLARITY	0x10
>> > +#define INTC_EOI		0x20
>> > +
>> > +#ifdef CONFIG_PM_SLEEP
>> > +static LIST_HEAD(mst_intc_list);
>> > +#endif
>> >
>> >  struct mst_intc_chip_data {
>> >  	raw_spinlock_t	lock;
>> >  	unsigned int	irq_start, nr_irqs;
>> >  	void __iomem	*base;
>> >  	bool		no_eoi;
>> > +#ifdef CONFIG_PM_SLEEP
>> > +	struct list_head entry;
>> > +	u16 saved_polarity_conf[DIV_ROUND_UP(64, 16)];
>> 
>> Where is this 64 coming from?
> 
> The maximum number of interrupts a mst-intc supports is 64 in
> Mstar and Mediatek SoCs now.
> So I just use the maximum number of interrupts here.

Then please use a named constant instead of a magic number.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
