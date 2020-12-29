Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAE4C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 02:34:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F844207FB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 02:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F844207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FHziplC+z0xjCVxmLnFd2nVDGeuPSBWd/JJXD3eYLv8=; b=AhVN9z5EOCyGOL3pY7EJd0aF3
	AntSD1ObQI3YAtAVtR/BIQlQxpcaj3Ao/OxBEoDw63UpJ3wFoftA5h5EPG3kxc6Ob0i/A0CZfg0E1
	eprLtY5cE+Xn8Ndmyx8YZAvbNtJ6zjhtVjsb4JwhBrUk7XQwf2Ef6ATdMVVqopbIrJH8JQ3ssWMYT
	o3UjcseUFQX4oxqkRloK6rcWS+V4SEuBIngpaPKuRPtx2bFuLN28pH7zRzOhUa21eV8xrvz3AV77h
	d3JaFtDMDtYqcPFmpqcJyhrPmvJt8/TkGPEH5JRC3c4TFc1aPuC+wR1qJ66vHX6+EpXleW59ZB2na
	r6TPhHzYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku4pr-00084u-Nz; Tue, 29 Dec 2020 02:34:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku4pp-00084C-Eg; Tue, 29 Dec 2020 02:34:06 +0000
X-UUID: efade5cf3e5c4c84be8a53fd3c2ba2be-20201228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=keG+UZI1nHMs3AUBoM6od8/3vuSNYBtw8VtXwPXWDYA=; 
 b=IkNVSgNxJlyLjOj5/s3Jo3i78cllbAWcnj2yvUshOdm0ANvHIN38UQ+FhmXvRQBZSShCtee3rPFa4ZRZSKeTl7ZZ2+TTcJ5U5wCAQyMov2dm0tdZZT7ab7a8a9NKZ3UnrjM1Ba5TWtl6bvEgcdcdcYTW+IW7eJFc9x5HF38OTDs=;
X-UUID: efade5cf3e5c4c84be8a53fd3c2ba2be-20201228
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 854851993; Mon, 28 Dec 2020 18:33:56 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 18:35:00 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 10:34:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 10:34:51 +0800
Message-ID: <1609209225.14736.192.camel@mhfsdcap03>
Subject: Re: [v6,3/4] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
Date: Tue, 29 Dec 2020 10:33:45 +0800
In-Reply-To: <87bleeotg6.wl-maz@kernel.org>
References: <20201225100308.27052-1-jianjun.wang@mediatek.com>
 <20201225100308.27052-4-jianjun.wang@mediatek.com>
 <87ft3tpu67.wl-maz@kernel.org> <1609156917.14736.171.camel@mhfsdcap03>
 <87bleeotg6.wl-maz@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AED3668C56EDB0F3703E356D8124B20403CF04091783540A584164C9C947DE562000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_213405_789976_E1C6426F 
X-CRM114-Status: GOOD (  49.64  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, linux-pci@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 sin_jieyang@mediatek.com, Sj Huang <sj.huang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-28 at 15:12 +0000, Marc Zyngier wrote:
> On Mon, 28 Dec 2020 12:01:57 +0000,
> Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > 
> > On Fri, 2020-12-25 at 19:22 +0000, Marc Zyngier wrote:
> 
> Dropped	<Project_Global_Chrome_Upstream_Group@mediatek.com>, as it
> bounces:
> 
> <Project_Global_Chrome_Upstream_Group@mediatek.com>: host
>     mailgw01.mediatek.com[216.200.240.184] said: 550 Relaying mail to
>     project_global_chrome_upstream_group@mediatek.com is not allowed (in reply
>     to RCPT TO command)
> 
> Please make sure you don't Cc email addresses that cannot accept email
> form the outside world.

Apology, they are team members of mt8192 project, who want to know the
status of this patch. I will replace with the specified email address at
next time, instead of this group address.

> [...]
> 
> > > > +/**
> > > > + * struct mtk_pcie_msi - MSI information for each set
> > > > + * @base: IO mapped register base
> > > > + * @irq: MSI set Interrupt number
> > > > + * @index: MSI set number
> > > > + * @msg_addr: MSI message address
> > > > + * @domain: IRQ domain
> > > > + */
> > > > +struct mtk_pcie_msi {
> > > > +	void __iomem *base;
> > > > +	unsigned int irq;
> > > > +	int index;
> > > > +	phys_addr_t msg_addr;
> > > > +	struct irq_domain *domain;
> > > > +};
> > > 
> > > This looks odd. You seem to say that this covers a set if MSIs, and
> > > yet the irq field here clearly isn't part of a set. Is that per MSI
> > > instead? Either way, something is not quite as it should be.
> > > 
> > 
> > Appreciate all these comments, please allow me to explain the MSI
> > interrupt design in this HW.
> > 
> > The HW design of MSI interrupts will be like the following:
> > 
> >                   +-----+
> >                   | GIC |
> >                   +-----+
> >                      ^
> >                      |
> >                      |[port->irq]
> >                      |
> >              +-+-+-+-+-+-+-+-+
> >              |0|1|2|3|4|5|6|7|[PCIe intc]
> >              +-+-+-+-+-+-+-+-+
> >               ^ ^           ^
> >               | |    ...    |[msi_info->irq]
> >       +-------+ +------+    +-----------+
> >       |                |                |
> > +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> > |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31|[MSI sets]
> > +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> >  ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
> >  | |      |  |    | |      |  |    | |      |  | [MSI irq]
> >  | |      |  |    | |      |  |    | |      |  |
> > 
> >   (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
> > 
> 
> Thanks, that's really helpful. You should consider adding this to the
> driver code, as part of the documentation.

Sure, I will add this to the driver documentation in the next version.

> 
> > In software parts, the port->msi_top_domain is created to maintains 8
> > MSI IRQs from the PCIe intc layer, its hardware IRQ will be mapped to
> > msi_info->irq by irq_create_mapping.
> > 
> > The port->msi_domain contains 256 MSI IRQs in total, it consist of 8 MSI
> > sets, and each MSI set contains 32 MSI IRQs.
> > 
> > The structure of mtk_pcie_msi is used to describe the MSI set, I think
> > it will be more convenient and comply with the HW design when use this
> > structure, we can get the information of MSI set directly, instead of
> > calculated by port->base.
> > 
> > When a MSI interrupt is received, the interrupt handle flow will be like
> > the following:
> > 
> >               mtk_pcie_irq_handler (port->irq)
> >                         |
> >                         |(find mapping in msi_top_domain)
> >                         |
> >                         v
> >                 mtk_pcie_msi_handler (msi_info->irq)
> >                         |
> >                         |(find mapping in msi_domain)
> >                         |
> >                         v
> >                  handle_edge_irq  (MSI irq)
> >                         |
> >                         |
> >                         v
> >             (dispatch to device handler)
> > 
> > Yes, I had to admit that it's not a quite good solution of irqdomains,
> > since the local irq domain is partial coupled with the standard PCI MSI
> > irqdomain.
> > 
> > Should I need to create another irqdomain to maintain the MSI sets
> > layer, and set it as the parent domain of PCI MSI domain? I really need
> > your suggestions, thanks a lot.
> 
> <rant>
> My first suggestion would be to go back to whoever put this HW block
> together and make sure they never write a line of RTL ever again.
> Programming using copy/paste is bad enough, but doing the same thing
> with HW is just terrible.
> </rant>
> 
> Ideally, you would model the whole thing as 8 distinct MSI
> controllers, as that is effectively what they are. Evidently, this
> would cause all kind of issues when associating PCI devices with their
> MSI domain, so let's not do that.
> 
> So what we want is to have a single MSI domain (with 256 entries,
> hence covering all sets), and compute the hwirq from the level below,
> depending on the interrupt PCIe interrupt, and the index of the MSI in
> the status register for this PCIe interrupt. I think you have most of
> the information already, you just need to simplify the way you keep
> track of it, and maybe come up with better names for the various
> blocks.
> 
> I expect you would need something like this:
> 
> struct mtk_msi_set {
> 	void __iomem		*base;
> 	phys_addr_t		msg_addr;
> };
> 
> struct mtk_pcie_port {
> [...]
> 	int 			base_irq;
> 	struct mtk_msi_set	msi_sets[8];
> [...]
> };
> 
> The assumption is that you can build the bottom MSI domain hwirq as:
> 
>     hwirq = set_idx * 32 + set_status_bit;
> 
> From that, you can directly go back from a hwirq to a set, and index
> the msi_sets[] array to find the relevant information.
> 
> Another assumption is that all 8 cascade interrupts are contiguous
> (which is pretty easy to guarantee), meaning that you can directly use
> the PCIe interrupt to compute the set number.
> 
> With all that, you can directly keep a pointer from the bottom MSI
> domain irq_data structures to the mtk_pcie_port structure, providing
> you with all the information you need.
> 
> Once you will have moved the various bits at the right place, and used
> the established MSI abstractions, things should just work.

Thanks for your quick reply, I will make the changes as this suggestion
in the next version.
> 
> [...]
> 
> > > > +static void mtk_intx_eoi(struct irq_data *data)
> > > > +{
> > > > +	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> > > > +	unsigned long hwirq;
> > > > +
> > > > +	/**
> > > > +	 * As an emulated level IRQ, its interrupt status will remain
> > > > +	 * until the corresponding de-assert message is received; hence that
> > > > +	 * the status can only be cleared when the interrupt has been serviced.
> > > > +	 */
> > > > +	hwirq = data->hwirq + PCIE_INTX_SHIFT;
> > > > +	writel(BIT(hwirq), port->base + PCIE_INT_STATUS_REG);
> > > 
> > > All of this is the description of a level interrupt, so this is pretty
> > > much devoid of any information as to *why* you need to write to clear
> > > this bit. What happens if the interrupt is still asserted because
> > > nothing has handled it? Without any further information, this looks
> > > terribly wrong.
> > 
> > Sorry, this comment should be used to describe the mtk_intx_eoi
> > function, it cause misunderstandings at this place. I just want to add
> > the comment to explain that why this interrupt needs to be acked at the
> > end of interrupt. I will move it to the front of mtk_intx_eoi in the
> > next version.
> 
> Is it an ack or an eoi? These are two different things, and really
> depends on your HW. Please find out which one it is, and we will work
> out a way to handle it.

Actually, it's an ack which used to clear the interrupt status.

When we receive an INTx assert message from the EP device, the
corresponding bit of PCIE_INT_STATUS_REG will be set, and it can not be
cleared until the EP device handler clear its device status and then we
receives the INTx de-assert message.

So I set handle_fasteoi_irq as its irq handler, and try to use irq_eoi
callback to make sure it will be called after device handler.

[snip]
> +static int mtk_pcie_intx_map(struct irq_domain *domain, unsigned int
irq,
> +                          irq_hw_number_t hwirq)
> +{
> +     irq_set_chip_and_handler_name(irq, &mtk_intx_irq_chip,
> +                                   handle_fasteoi_irq, "INTx");
> +     irq_set_chip_data(irq, domain->host_data);
> +
> +     return 0;
> +}
> +
> +static const struct irq_domain_ops intx_domain_ops = {
> +     .map = mtk_pcie_intx_map,
> +};

> 
> Thanks,
> 
> 	M.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
