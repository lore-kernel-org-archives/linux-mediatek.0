Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE960C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 09:00:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B49364E77
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 09:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B49364E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o9jQcDkYzWV7Q3O4kvKECk06eZGpB2HEM6XtlOce5GM=; b=lJX1a8g6RnEHqRP1JmNgkJmK6
	HAwHnt7ewsgkUDz4/Bp09E3qdmJmi+Gk66KAmo02Iklko+FbslxgveJFI8nvvniyKNfBawEfLv6H/
	QpPZ14GeRlAHsnAieHaarFmqnY2wPd+ixr5RfpXj4zksD0J7N2BeZNhqWo4DtwGxRldGmATe6zArX
	C/KRee+0cjEC7lBRbxJXcp1JiI9estVmOc1Bovwy/2kOH8vmE9Lw85sTR38YeOpWC53OMw+LT+XZr
	uznnz65oOnFNVKyaNl6IOOBM3QTqH1y7MYUI6chYBM28B3vOBcBZ0sxkbNCRpRWJuCjVgabuB56wi
	ZmhZonbUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLj5X-00FKIx-S0; Mon, 15 Mar 2021 09:00:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLj49-00FJwr-R1; Mon, 15 Mar 2021 08:59:17 +0000
X-UUID: 95de30fb44114d95bc19cd097e073ef0-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=b2hQuAvRaQ8mIcBVsU6h+xV+v6k3azE9M61b/yZfD/Y=; 
 b=IjmK4ffGwDTD9UXh24Na8vdfETw5oRbZIWBcJ4tQKuzoQbA5KG7RA9aFIf1HDLLoW2mQmEVGW6YTAiR9sgrAOFK4r52tyMRSRaLRhOlrySZI+NDhnmEME2kt4T7a/UBJWwyi0aUY4uL31ZCgyvDq3A4tcU2IhPKQx+qbEYEbs3s=;
X-UUID: 95de30fb44114d95bc19cd097e073ef0-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1463882686; Mon, 15 Mar 2021 00:59:01 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 01:58:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 16:58:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Mar 2021 16:58:57 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <daniel@0x0f.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
CC: <daniel@thingy.jp>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <maz@kernel.org>, <tglx@linutronix.de>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] irqchip/irq-mst: Support polarity configuration
Date: Mon, 15 Mar 2021 16:58:55 +0800
Message-ID: <20210315085855.23730-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAFr9PXmwp5FQP8dOZed0siz76qj4Lo-ytt=nt+1GR5qAFtEr9g@mail.gmail.com>
References: <CAFr9PXmwp5FQP8dOZed0siz76qj4Lo-ytt=nt+1GR5qAFtEr9g@mail.gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5007523079440117CCE27AD2F0035B5726B867D344927A1A117F87F9928E1A362000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_085911_871370_CBFCE671 
X-CRM114-Status: GOOD (  28.53  )
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

From: Daniel Palmer <daniel@0x0f.com>

> On Fri, 12 Mar 2021 at 01:11, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > Why irq could accept either?
> 
> As the irq intc has no way to clear it's triggered state (no eoi) it
> must just pass the signal through instead of latching it?
> Otherwise it would latch once and never again right? That's what I
> really didn't understand.
> If it just passes the signal through and maybe inverts it then the GIC
> can use edge or level I think.

Yes, but if we accidentally loss a irq and the interrupt is edge triggered which is
latch to level by mst-intc, we will miss all the follow irqs because the driver
didn't reset the interrupt status.
Actually, I'm not sure if it's possible.
But even if it's not, I think use level for parent GIC can better match
the hardware signal processing.

> 
> > So maybe we don't need to do extra work to check the type for an fiq or irq controller?
> 
> I think without the eoi callback for the fiq it would only ever fire
> once. I don't think doing the same eoi callback for the irq intc hurts
> anything but it wouldn't do anything either from what I can tell.

The reason why I don't do the same eoi callback for irq intc is that
it's not ont spec.
And some of MTK TV SoC use it for certain debug function which
may cause unexpected result.

> 
> > And I will update the patch as following:
> 
> I think maybe Marc or someone else that knows better than I do should
> comment on what needs to happen.
> My input is just that the fiq controller seems to trigger on an edge,
> holds it's signal to the GIC high until eoi happens and then only
> triggers again on an edge.
> I guess it doesn't matter if it's an edge or level if that's how it
> works but you'd only get one interrupt out of it per edge even if
> configured as a level interrupt.
> 
> The main thing I didn't want was filtering out edge interrupts
> entirely as that breaks using edge interrupts with gpios i.e. using
> gpiomon.
> With the changes to set the polarity it can now detect rising or
> falling edge gpio events. :)

Thanks for your feedback and I will send patch v4 which includes the
change I proposed in this thread.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
