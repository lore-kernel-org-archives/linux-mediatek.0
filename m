Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55859C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 10:19:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AADC864DF3
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 10:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AADC864DF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xt0ciQyFBd9Q/drkS/0PjGSYYPvGHzF7EpAZnDH2lo4=; b=bYbogE/8/GlP4FkO+CdagJXuH
	CKT0MGUc2FQkTJXXHrWqVTOg/SOqx5QTYc/ErjXMeDnjFK51zwgjU381pymkKM+PxssjtX7FIuXmk
	OlP0YjO9WgdtZs2VLQWLPUODfiaDWNON4DQbP8Ia3uQRmtOJKJXjFojQsabzuhzwy0dVxpLlSMVui
	OVujNSZuVOO336GQHd860WSrtElbRE/iQldsBJW5dRPz3bNWwCaxvygByzfGkt/ukIeml3NZERU1Y
	zoJ8ovc/MNMmHptgnILsvjYaZHpuHE+vK1w5b0G+WJ+ePXW8IFT5Ug4zp9haSzEVx4U8anWn+lYaO
	fpPgZ2iCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJvwD-006ZTl-Az; Wed, 10 Mar 2021 10:19:33 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJvvn-006ZOt-5o
 for linux-mediatek@lists.infradead.org; Wed, 10 Mar 2021 10:19:15 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 30so468637qva.9
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Mar 2021 02:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edRCQjcETTP/TwhrCwOF/p03cqo8+OKWF6FKVjUQ7d4=;
 b=c3crVqzdqxMSrxomGmHwHFysts3ulWh8YjOvMWfaUXzm7Gydu3akwB2gOVltT7ubTS
 KxQsZrGwUaWV6Tn3Khh73cDc9/3JEReNpQ9I9e4qgpJhg97s1eOef5pkWzC+ez/Y68vk
 lMpUNacccaIXGt+4AIXQwLCOF3rqWFcaiFOiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edRCQjcETTP/TwhrCwOF/p03cqo8+OKWF6FKVjUQ7d4=;
 b=BU4jJLCKs3rj5U3gO4Mqb50lqWdoUEa56QP3CdtChchpmyTbtTbphCnTbEoVq1vdf7
 VSpZcni/eSoOcInQTT1xyW24GPzWKWnTxlSxOUxA6AZnX6187WTQRmFwgBUXUBvOJSVt
 pGe9/Y4Q+1CEJDQrkw1VDiXWOeLDA3nTrm9ovlpmFLouZ2RHSt8HeC+2INO5GWc1+b9Y
 uEUDZW14QId4c867mT8vR7jrJLkIS+vUWnU6qDkb99HDSqy0IBezj6G8oV6V/nxVA3Gt
 7/3mU+c4VUceM4TCOVkQxbFXEowtVWrWXM9Doulv5mHr6bKkGwC3aPQZP8qZg6z9XtnA
 AIsQ==
X-Gm-Message-State: AOAM530Cj2a6b4f934l9gCveSgJR4azmwG0PkhUC/q0PJriRvgtXF4bG
 JcO5p1Tbv75jzsYH1BubFVWPYBLAemjloZhSOBXlMg==
X-Google-Smtp-Source: ABdhPJzdKOttsDe74X8zHeSQeexRf8gAvLRVRhYolkg8sTzVUlsHbPT/T4hahLzPkZIjg1z8jyCTdPc+JCADyDnyJSQ=
X-Received: by 2002:a0c:9ac9:: with SMTP id k9mr2044505qvf.29.1615371543518;
 Wed, 10 Mar 2021 02:19:03 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PXmiR9Wo9HxhRLj-k6+O5qu-uLSTCvQRqW-Yqgkk8YK-Tw@mail.gmail.com>
 <20210308143011.24538-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210308143011.24538-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 10 Mar 2021 19:20:27 +0900
Message-ID: <CAFr9PX=dz1kt_BphpWr250asLiHFQNeBgNPhuPje==hzkcHWhg@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/irq-mst: Support polarity configuration
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Daniel Palmer <daniel@thingy.jp>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?B?WUogQ2hpYW5nICjmsZ/oi7HmnbAp?= <yj.chiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_101907_500796_C07F2158 
X-CRM114-Status: GOOD (  15.32  )
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

Hi Mark-PK,

On Mon, 8 Mar 2021 at 23:30, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> From: Daniel Palmer <daniel@0x0f.com>
> >On Mon, 8 Mar 2021 at 15:05, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> >> +static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
> >       > +{
> >> +       if (type != IRQ_TYPE_LEVEL_LOW && type != IRQ_TYPE_LEVEL_HIGH)
> >> +               return -EINVAL;
> >> +
> >
> >Does this mean we can't do rising or falling edge interrupts?
>
> Yes, the interrupt of mst-intc is either level high or level low.
> Actually the input signal can be pulse, but it will be converted to level
> by the latch in mst-intc.

Are the GPIO connected interrupts meant to be configured as level
interrupts then?
For the MStar MSC313(e) there are 4 (that I know of) GPIO lines that
are wired into the mst-intc that requires EOI.
Until this patch with those lines configured as a rising edge a single
interrupt came each time the GPIO was pulled up as far as I remember.

I'm probably misunderstanding but a level interrupt doesn't seem to
make sense for a GPIO as it can't be serviced to clear the interrupt.

Thanks,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
