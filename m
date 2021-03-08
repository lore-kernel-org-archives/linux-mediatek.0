Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B15C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 14:45:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F1761583
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 14:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2F1761583
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xau3GXEuswrS9el3oNwO7qR6l7Hp6tIf6ldVf6v4nBo=; b=HROSL/tv607z8Mv04LgVbOJ6y
	LqaKE1FcyfQ8suWcIeFJaLt+900AVVap6v7pbIuuxOsmrOab6t49uYzLjM93OkWt3sTAaHwEiBz8Q
	Q9FIOjn5IS1Qx+FKYFgzX/NxQUlhK1UT5dUXbX80i/umyjOdDrHZUQtuNdj0ZwbFd0Qkq8+Lk1r90
	U/FVE2gnKTQsDIh8zKHWgHFwDxjaH7Dph9aCj+m9peUQFnkLbAbNhssFwJNY/1YjaXd4pt1s0T2bp
	9NjszxJ9ODkQj//IY9s1yPbpVYiHk71TY4BR98f3sbe2wlRRa5jTDZCIbXJwG57gOjSv7840lqF+L
	w+oblEDHg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJH8O-000JYQ-D0; Mon, 08 Mar 2021 14:45:24 +0000
Received: from mailgw01.mediatek.com ([66.171.122.165])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJH8F-000JTP-SV; Mon, 08 Mar 2021 14:45:22 +0000
X-UUID: 1fa77de7ee2e46d4bea949ecc097e8da-20210308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FRUfXs+WE+bjIFhPoBFm7+AJCwahc7RqBP1LfCyV5kI=; 
 b=gKROi5qwun5dB9TC/XgtjwPDcdI8VPa3eW6Ke1KQImXD70KnBPhLJTNRnZaJM2FrbGdGpI9eiAOkWFDh3lVPsg0XFMR2Q3r6LUC4EXtV81Yt9j/TxchLsCaoItCHdVhi3hKVlxcBthi3+pzWWu0K+mwp6LvIh20s88G61Y9EIgw=;
X-UUID: 1fa77de7ee2e46d4bea949ecc097e8da-20210308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 721889868; Mon, 08 Mar 2021 06:45:09 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 06:34:46 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 22:34:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 22:34:24 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
CC: <daniel@thingy.jp>, <jason@lakedaemon.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <tglx@linutronix.de>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] irqchip/irq-mst: Support polarity configuration
Date: Mon, 8 Mar 2021 22:31:10 +0800
Message-ID: <20210308143109.24644-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <01b1c85119619c2418908a2fdabfb5dc@kernel.org>
References: <01b1c85119619c2418908a2fdabfb5dc@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_144516_959944_0EA0DAC3 
X-CRM114-Status: GOOD (  14.47  )
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

>On 2021-03-08 03:01, Mark-PK Tsai wrote:
>> From: Marc Zyngier <maz@kernel.org>
>> 
>>> >
>>> > Support irq polarity configuration and save and restore the config
>>> > when system suspend and resume.
>>> >
>>> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
>>> > ---
>>> >  drivers/irqchip/irq-mst-intc.c | 87 ++++++++++++++++++++++++++++++++--
>>> >  1 file changed, 84 insertions(+), 3 deletions(-)
>>> >
>>> > diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
>>> > index 143657b0cf28..979a4d55bcb1 100644
>>> > --- a/drivers/irqchip/irq-mst-intc.c
>>> > +++ b/drivers/irqchip/irq-mst-intc.c
>>> > @@ -13,15 +13,25 @@
>>> >  #include <linux/of_irq.h>
>>> >  #include <linux/slab.h>
>>> >  #include <linux/spinlock.h>
>>> > +#include <linux/syscore_ops.h>
>>> >
>>> > -#define INTC_MASK	0x0
>>> > -#define INTC_EOI	0x20
>>> > +#define INTC_MASK		0x0
>>> > +#define INTC_REV_POLARITY	0x10
>>> > +#define INTC_EOI		0x20
>>> > +
>>> > +#ifdef CONFIG_PM_SLEEP
>>> > +static LIST_HEAD(mst_intc_list);
>>> > +#endif
>>> >
>>> >  struct mst_intc_chip_data {
>>> >  	raw_spinlock_t	lock;
>>> >  	unsigned int	irq_start, nr_irqs;
>>> >  	void __iomem	*base;
>>> >  	bool		no_eoi;
>>> > +#ifdef CONFIG_PM_SLEEP
>>> > +	struct list_head entry;
>>> > +	u16 saved_polarity_conf[DIV_ROUND_UP(64, 16)];
>>> 
>>> Where is this 64 coming from?
>> 
>> The maximum number of interrupts a mst-intc supports is 64 in
>> Mstar and Mediatek SoCs now.
>> So I just use the maximum number of interrupts here.
>
>Then please use a named constant instead of a magic number.
>

Okay, I will update in patch v3.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
