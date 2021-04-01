Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73ECC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 11:03:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B4CD610CA
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 11:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B4CD610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EdgTaZtscbv7kppTTpNIpthLGigq5Nq9yWeN9v8caP4=; b=F3RhAXGrTaGbarTzUL1zVXNmx
	0OxzIHPEdY4GwABmFwFZuIUn282yJ6bl+eMlqgGSqc8ok46DztBTmPpS7oVNBavtHdtLrsCywCOpN
	NRax8xm4vlkJMlXsmRJwzYnZGZeIWr0hn431qOH/cvDI2/yDEkE7LIwKUJAqkhxExzS2PcRLHberJ
	0FvzNoWFzLNYgwFtQuaAyIx4wH/oE8Hrvn57rAuSlR4sqXKRtvFF2WdTz/GhtjLYr1KvOleCUjziV
	CULat0tcC7S0tbeJFT3pZy+eCXkPfldaT06EvuFRvf4gssII/zOBC0njhuGVq9X/PJygPwDFus4Mo
	spF0JOpGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRv6h-009Jgy-EU; Thu, 01 Apr 2021 11:03:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRv6W-009Jeq-U5; Thu, 01 Apr 2021 11:03:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A88BD6E;
 Thu,  1 Apr 2021 04:03:10 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A619F3F694;
 Thu,  1 Apr 2021 04:03:06 -0700 (PDT)
Date: Thu, 1 Apr 2021 12:03:01 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thierry Reding <treding@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bharat Kumar Gogada <bharatku@xilinx.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 03/14] PCI: rcar: Convert to MSI domains
Message-ID: <20210401110301.GA31407@lpieralisi>
References: <20210330151145.997953-1-maz@kernel.org>
 <20210330151145.997953-4-maz@kernel.org>
 <20210401101957.GA30653@lpieralisi> <87y2e2p9wk.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2e2p9wk.wl-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_120313_371634_FB2842D4 
X-CRM114-Status: GOOD (  27.36  )
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

On Thu, Apr 01, 2021 at 11:38:19AM +0100, Marc Zyngier wrote:
> On Thu, 01 Apr 2021 11:19:57 +0100,
> Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> wrote:
> > 
> > On Tue, Mar 30, 2021 at 04:11:34PM +0100, Marc Zyngier wrote:
> > 
> > [...]
> > 
> > > +static void rcar_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> > > +{
> > > +	struct rcar_msi *msi = irq_data_get_irq_chip_data(data);
> > > +	unsigned long pa = virt_to_phys(msi);
> > >  
> > > -	hwirq = rcar_msi_alloc_region(msi, nvec);
> > > -	if (hwirq < 0)
> > > -		return -ENOSPC;
> > > +	/* Use the msi structure as the PA for the MSI doorbell */
> > > +	msg->address_lo = lower_32_bits(pa);
> > > +	msg->address_hi = upper_32_bits(pa);
> > 
> > I don't think this change is aligned with the previous patch (is it ?),
> > the PA address we are using here is different from the one programmed
> > into the controller registers - either that or I am missing something,
> > please let me know.
> 
> Err. You are right. This looks like a bad case of broken conflict
> resolution on my part.
> 
> The following snippet should fix it. Let me know if you want me to
> resend the whole thing or whether you are OK with applying this by
> hand.

I will apply it and merge the whole series into -next, thanks for
implementing it !

Lorenzo

> Thanks,
> 
> 	M.
> 
> diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
> index f7331ad0d6dc..765cf2b45e24 100644
> --- a/drivers/pci/controller/pcie-rcar-host.c
> +++ b/drivers/pci/controller/pcie-rcar-host.c
> @@ -573,11 +573,10 @@ static int rcar_msi_set_affinity(struct irq_data *d, const struct cpumask *mask,
>  static void rcar_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  {
>  	struct rcar_msi *msi = irq_data_get_irq_chip_data(data);
> -	unsigned long pa = virt_to_phys(msi);
> +	struct rcar_pcie *pcie = &msi_to_host(msi)->pcie;
>  
> -	/* Use the msi structure as the PA for the MSI doorbell */
> -	msg->address_lo = lower_32_bits(pa);
> -	msg->address_hi = upper_32_bits(pa);
> +	msg->address_lo = rcar_pci_read_reg(pcie, PCIEMSIALR) & ~MSIFE;
> +	msg->address_hi = rcar_pci_read_reg(pcie, PCIEMSIAUR);
>  	msg->data = data->hwirq;
>  }
>  
> 
> -- 
> Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
