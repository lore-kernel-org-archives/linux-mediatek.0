Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30381C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 14:46:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0FC6619F3
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 14:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0FC6619F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8uC4T0uSxIUXg3DdKPCzf1e+cHcIG8unMmDq5IrrNyc=; b=XH9w0Bxz8AiyMj7CcgeYDBQkm
	qvSjXuIBaGu1hQFusgc4tgGByAf0fJtP9wlFt1tYQImCNqZiKdzhA+mmAGrPN+IrwVdNeR3T6EooM
	AW1WrF4k9gvHtzLNn4IcSga/DIWaDFWOPSXxqoMVbmrSMZpftOO7VRwsdVkpdewF5Aiw++m1iZ5nK
	DTg00BS1sKSST8INnBP5dd3W3KoCfnPzeTzEGlpgAMqevk4ZcoH7522SxkAq5PLUXYMXNbib6jS3s
	onin+AD+TZcoVojZ5Ikhr8vL3I8Us5ByHLXKTPXue7PLJF8B8OBAUaCcGvB35XpmlM4GMq0SQv/UV
	nw4Jw253Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP4lx-00HE5J-7c; Wed, 24 Mar 2021 14:46:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP4ln-00HE3n-EW; Wed, 24 Mar 2021 14:46:05 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12A87619F3;
 Wed, 24 Mar 2021 14:46:00 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lP4lh-003XaC-No; Wed, 24 Mar 2021 14:45:58 +0000
Date: Wed, 24 Mar 2021 14:45:56 +0000
Message-ID: <874kh0k3tn.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Bharat Kumar Gogada <bharatku@xilinx.com>
Cc: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Frank Wunderlich <frank-w@public-files.de>, Thierry
 Reding <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Stephen
 Hemminger <sthemmin@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michals@xilinx.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "kernel-team@android.com"
 <kernel-team@android.com>
Subject: Re: [PATCH v2 05/15] PCI: xilinx: Convert to MSI domains
In-Reply-To: <BYAPR02MB5559590C1395C15205582976A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
References: <20210322184614.802565-1-maz@kernel.org>
 <20210322184614.802565-6-maz@kernel.org>
 <BYAPR02MB5559A0B0DA88866EDC7BDFE5A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
 <877dlwk805.wl-maz@kernel.org>
 <BYAPR02MB5559590C1395C15205582976A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: bharatku@xilinx.com, lorenzo.pieralisi@arm.com,
 bhelgaas@google.com, frank-w@public-files.de, treding@nvidia.com,
 tglx@linutronix.de, robh@kernel.org, will@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, mikelley@microsoft.com,
 wei.liu@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 ryder.lee@mediatek.com, marek.vasut+renesas@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, michals@xilinx.com, paul.walmsley@sifive.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_144603_851620_9AC397EA 
X-CRM114-Status: GOOD (  27.66  )
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

On Wed, 24 Mar 2021 13:56:16 +0000,
Bharat Kumar Gogada <bharatku@xilinx.com> wrote:

> > Thanks for that. Can you please try the following patch and let me know if it
> > helps?
> > 
> > Thanks,
> > 
> > 	M.
> > 
> > diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-
> > xilinx.c
> > index ad9abf405167..14001febf59a 100644
> > --- a/drivers/pci/controller/pcie-xilinx.c
> > +++ b/drivers/pci/controller/pcie-xilinx.c
> > @@ -194,8 +194,18 @@ static struct pci_ops xilinx_pcie_ops = {
> > 
> >  /* MSI functions */
> > 
> > +static void xilinx_msi_top_irq_ack(struct irq_data *d) {
> > +	/*
> > +	 * xilinx_pcie_intr_handler() will have performed the Ack.
> > +	 * Eventually, this should be fixed and the Ack be moved in
> > +	 * the respective callbacks for INTx and MSI.
> > +	 */
> > +}
> > +
> >  static struct irq_chip xilinx_msi_top_chip = {
> >  	.name		= "PCIe MSI",
> > +	.irq_ack	= xilinx_msi_top_irq_ack,
> >  };
> > 
> >  static int xilinx_msi_set_affinity(struct irq_data *d, const struct cpumask
> > *mask, bool force) @@ -206,7 +216,7 @@ static int
> > xilinx_msi_set_affinity(struct irq_data *d, const struct cpumask *mas  static
> > void xilinx_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)  {
> >  	struct xilinx_pcie_port *pcie = irq_data_get_irq_chip_data(data);
> > -	phys_addr_t pa = virt_to_phys(pcie);
> > +	phys_addr_t pa = ALIGN_DOWN(virt_to_phys(pcie), SZ_4K);
> > 
> >  	msg->address_lo = lower_32_bits(pa);
> >  	msg->address_hi = upper_32_bits(pa);
> > @@ -468,7 +478,7 @@ static int xilinx_pcie_init_irq_domain(struct
> > xilinx_pcie_port *port)
> > 
> >  	/* Setup MSI */
> >  	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> > -		phys_addr_t pa = virt_to_phys(port);
> > +		phys_addr_t pa = ALIGN_DOWN(virt_to_phys(port), SZ_4K);
> > 
> >  		ret = xilinx_allocate_msi_domains(port);
> >  		if (ret)
> > 
> Thanks Marc.
> With above patch now everything works fine, tested a Samsung NVMe SSD. 
> tst~# lspci
> 00:00.0 PCI bridge: Xilinx Corporation Device 0706
> 01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller 172Xa/172Xb (rev 01)

Great, thanks for giving it a shot. Can I take this as a Tested-by:
tag?

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
