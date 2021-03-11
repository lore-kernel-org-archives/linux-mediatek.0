Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2663DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 09:48:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD5164F95
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 09:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD5164F95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X+6f0mw1VCRmy2z02oeEagqY6vqXgEASDHdGJCsRw5I=; b=lkJlL38EiujF+B3c/rGzDAIsQ
	HNVVMim6ePn2XMPjSAvPipd9Z6sRasSZOH2Q1RReAaxACMv6/r4r3GrhTZ0FiqtrxqdVXVgldXinX
	uAYzcSWbMuNkw+xIUR8vBLAURTX6fKinawoAArPkfSnX2S4YhC1Xx6o0tx8WG9UnvllSFHKTP+afH
	GDlMTZsxScIMdKS1fGVEFGqnBGzwVb8Q00rU7ccvlJu/yyVhVtpqGVSDw68wW9KP6R6cPzUIfnk4W
	IGIZ3RaZoGbSEUSk1gkM0sP0NMg9XJUN4ZcHGp/ZO7lCbmGvHvKe7IToUOJP7VOvb1Ghm5JP0Yttd
	MWncjihGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKHvJ-008mGb-BD; Thu, 11 Mar 2021 09:48:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKHvB-008mFJ-W1; Thu, 11 Mar 2021 09:48:02 +0000
X-UUID: 6b81fd031a314f30929c85be43b0076d-20210311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RNnASkbqhv8ODVj5ReFqDIzkkJKHV9MWUz02H5UDhV0=; 
 b=QjgGCaYJOe1peZaZHiPDwcpAnJBubRkweCWEdGJ9NgJ8lRVB5LT7LycrhEQAAPUGyBT2mbKBfj5TEhjK+4bB6UxGkqSLu+DwzbNevXw0qoyf++g2qtBGhqRjNXxHGtJAfLNjfwPT74zjobpBqb8UulW40I4gkuL/MTgvxehrr4Q=;
X-UUID: 6b81fd031a314f30929c85be43b0076d-20210311
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 61747741; Thu, 11 Mar 2021 01:47:50 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Mar 2021 01:47:48 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 11 Mar 2021 17:47:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Mar 2021 17:47:45 +0800
Message-ID: <1615456065.25662.60.camel@mhfsdcap03>
Subject: Re: [v8,5/7] PCI: mediatek-gen3: Add MSI support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Sj
 Huang" <sj.huang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, <anson.chuang@mediatek.com>
Date: Thu, 11 Mar 2021 17:47:45 +0800
In-Reply-To: <87a6rbxs4w.wl-maz@kernel.org>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-6-jianjun.wang@mediatek.com>
 <87pn08y3ja.wl-maz@kernel.org>	<1615358929.25662.47.camel@mhfsdcap03>
 <87a6rbxs4w.wl-maz@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 75906D7FE3E9CB7C6B4B63E7D7430F2D0076DFB9B07E89AAFCC25501E7DC0BD72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_094758_598070_F8C7B4D0 
X-CRM114-Status: GOOD (  38.85  )
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

On Wed, 2021-03-10 at 09:41 +0000, Marc Zyngier wrote:
> On Wed, 10 Mar 2021 06:48:49 +0000,
> Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > > > +static struct irq_chip mtk_msi_irq_chip = {
> > > > +	.name = "MSI",
> > > > +	.irq_enable = mtk_pcie_irq_unmask,
> > > > +	.irq_disable = mtk_pcie_irq_mask,
> > > 
> > > Same comment as for the previous patch: enable/disable serve no
> > > purpose here.
> > 
> > Replied in the previous patch, the enable/disable callback is used when
> > the system suspend/resume.
> 
> As I said, your suspend/resume should be self contained, and not rely
> on the irq subsystem to restore a viable state.

OK, I will try to find another way to save and restore the enabled state
of interrupts when the system suspend/resume.

> 
> [...]
> 
> > > > @@ -408,6 +677,14 @@ static void mtk_pcie_irq_handler(struct irq_desc *desc)
> > > >  		generic_handle_irq(virq);
> > > >  	}
> > > >  
> > > > +	irq_bit = PCIE_MSI_SHIFT;
> > > > +	for_each_set_bit_from(irq_bit, &status, PCIE_MSI_SET_NUM +
> > > > +			      PCIE_MSI_SHIFT) {
> > > > +		mtk_pcie_msi_handler(port, irq_bit - PCIE_MSI_SHIFT);
> > > > +
> > > > +		writel_relaxed(BIT(irq_bit), port->base + PCIE_INT_STATUS_REG);
> > > 
> > > Isn't this write the same thing you have for EOI in the INTx case?
> > > While I could understand your description in that case (this is a
> > > resampling operation), I don't get what this does here. Either this is
> > > also an EOI, but your initial description doesn't make sense, or it is
> > > an Ack, and it should be moved to the right place.
> > > 
> > > Which one is it?
> > 
> > I think it should be an EOI which used to clear the interrupt status of
> > a single set in the PCIe intc field, maybe I should move it to the end
> > of the mtk_pcie_msi_handler() function.
> 
> I doubt this is an EOI. If, as I suspect, it instructs the HW to clear
> the bit so that new pending bits can be recorded, it must take place
> *before* the interrupt is handled, or you may lose MSIs in the
> interval between the handling of the interrupt and the clearing of the
> pending bit. To satisfy this requirement, this should be an ACK, which
> is consistent with the way most MSI controllers such as this one work.

These bits are similar with the interrupt status of INTx, and the
interrupt status will remain until all the status of the corresponding
set are cleared. There is a while loop in mtk_pcie_msi_handler() which
is used to continuously polling and ACK the status of the MSI set, I
think the MSI may not be lose in this case.
 
> 
> > 
> >                   +-----+
> >                   | GIC |
> >                   +-----+
> >                      ^
> >                      |
> >                  port->irq
> >                      |
> >              +-+-+-+-+-+-+-+-+
> >              |0|1|2|3|4|5|6|7| (PCIe intc)
> >              +-+-+-+-+-+-+-+-+
> >               ^ ^           ^
> >               | |    ...    |
> >       +-------+ +------+    +-----------+
> >       |                |                |
> > +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> > |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
> > +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> >  ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
> >  | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
> >  | |      |  |    | |      |  |    | |      |  |
> > 
> >   (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
> > 
> > I would like to ask another question. In this interrupt architecture, we
> > cannot implement an affinity for PCIe interrupts, so we return a
> > negative value in the mtk_pcie_set_affinity callback as follows: 
> > 
> > +static int mtk_pcie_set_affinity(struct irq_data *data,
> > +                                const struct cpumask *mask, bool force)
> > +{
> > +       return -EINVAL;
> > +}
> > 
> > But there will always be error logs when hotplug a CPU:
> > 
> > ~ # echo 0 > /sys/devices/system/cpu/cpu1/online
> > [   93.633059] IRQ255: set affinity failed(-22).
> > [   93.633624] IRQ256: set affinity failed(-22).
> > [   93.634222] CPU1: shutdown
> > [   93.634586] psci: CPU1 killed (polled 0 ms)
> > 
> > Or when the system suspends:
> > 
> > ~ # echo mem > /sys/power/state
> > [   93.635145] cpuhp: cpu_off cluster=0, cpu=1
> > [  169.835653] PM: suspend entry (deep)
> > [  169.836717] Filesystems sync: 0.000 seconds
> > [  169.837924] Freezing user space processes ... (elapsed 0.001 seconds)
> > done.
> > [  169.839922] OOM killer disabled.
> > [  169.840336] Freezing remaining freezable tasks ... (elapsed 0.001
> > seconds) done.
> > [  169.844715] Disabling non-boot CPUs ...
> > [  169.846443] IRQ255: set affinity failed(-22).
> > [  169.847002] IRQ256: set affinity failed(-22).
> > [  169.847586] CPU2: shutdown
> > [  169.847943] psci: CPU2 killed (polled 0 ms)
> > [  169.848489] cpuhp: cpu_off cluster=0, cpu=2
> > [  169.850285] IRQ255: set affinity failed(-22).
> > [  169.851369] IRQ256: set affinity failed(-22).
> > ...
> > 
> > Sometimes this can cause misunderstandings to users, do we have a chance
> > to prevent this error log?
> 
> No. This HW doesn't allow MSIs to be individually retargeted, and the
> kernel isn't happy about that. That's one of the many reasons why
> hiding MSIs behind a mux (or two in your case) is a *very bad idea*.
> 
> Thanks,
> 
> 	M.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
