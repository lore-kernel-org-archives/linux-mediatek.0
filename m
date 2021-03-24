Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C88C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 13:16:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E74619B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 13:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7E74619B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bnrmh3enXe9hJNF44gUtZqyXIe0Y1F51WC7Y2goJ/wk=; b=n6YhHTcZSYk8Z3kVCjqdh5bMK
	C2kTlZY8jxasoVNit3j2S/tG3a9z2MsNd7J96f9LjOO3Q4n6j/AqrBWApgAt29U9Puyrmd1dD26a7
	yAasrdD/opDG8cJnSfpwiAXcF31Oq+4lvRD9unIEewd3P2l27KHe03Xq2BUzAHG/50mmHLXP5PXze
	jOXjaWSWwsYgd4loE5d9J3bQbWJ6pElTVNCCvhk0VUER/HDTqB1vhvYSrsbLj6j4NxDH6jnmWrl2c
	nIrK/zxhIGEoSJ7gWe4mLvNQmmJYDf6qZiwVwepVvxFS+3igrkiPF0js7nFcDpHXuTivKDCWK/lgO
	G4LMv+mUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP3Md-00H8io-1i; Wed, 24 Mar 2021 13:15:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP3MR-00H8iD-P7; Wed, 24 Mar 2021 13:15:49 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51C1060C3D;
 Wed, 24 Mar 2021 13:15:42 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lP3MK-003Wd7-2d; Wed, 24 Mar 2021 13:15:40 +0000
Date: Wed, 24 Mar 2021 13:15:38 +0000
Message-ID: <877dlwk805.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Bharat Kumar Gogada <bharatku@xilinx.com>
Cc: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>, Thierry Reding
 <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring
 <robh@kernel.org>, Will Deacon <will@kernel.org>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen
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
In-Reply-To: <BYAPR02MB5559A0B0DA88866EDC7BDFE5A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
References: <20210322184614.802565-1-maz@kernel.org>
 <20210322184614.802565-6-maz@kernel.org>
 <BYAPR02MB5559A0B0DA88866EDC7BDFE5A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
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
X-CRM114-CacheID: sfid-20210324_131548_243594_B215F0B7 
X-CRM114-Status: GOOD (  35.41  )
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

On Wed, 24 Mar 2021 12:42:24 +0000,
Bharat Kumar Gogada <bharatku@xilinx.com> wrote:
> 
> Hi Marc,
> 
> Thanks for the patch. 
> 
> > Subject: [PATCH v2 05/15] PCI: xilinx: Convert to MSI domains
> > 
> > In anticipation of the removal of the msi_controller structure, convert the
> > ancient xilinx host controller driver to MSI domains.
> > 
> > We end-up with the usual two domain structure, the top one being a generic
> > PCI/MSI domain, the bottom one being xilinx-specific and handling the
> > actual HW interrupt allocation.
> > 
> > This allows us to fix some of the most appalling MSI programming, where the
> > message programmed in the device is the virtual IRQ number instead of the
> > allocated vector number. The allocator is also made safe with a mutex. This
> > should allow support for MultiMSI, but I decided not to even try, since I
> > cannot test it.
> > 
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/pci/controller/Kconfig       |   2 +-
> >  drivers/pci/controller/pcie-xilinx.c | 234 +++++++++++----------------
> >  2 files changed, 97 insertions(+), 139 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > index 5cc07d28a3a0..60045f7aafc5 100644
> ...
> 
> 
> > +static struct irq_chip xilinx_msi_bottom_chip = {
> > +	.name			= "Xilinx MSI",
> > +	.irq_set_affinity 	= xilinx_msi_set_affinity,
> > +	.irq_compose_msi_msg	= xilinx_compose_msi_msg,
> > +};
> > 
> I see a crash while testing MSI in handle_edge_irq
> [<c015bdd4>] (handle_edge_irq) from [<c0157164>] (generic_handle_irq+0x28/0x38)
> [<c0157164>] (generic_handle_irq) from [<c03a9714>] (xilinx_pcie_intr_handler+0x17c/0x2b0)
> [<c03a9714>] (xilinx_pcie_intr_handler) from [<c0157d94>] (__handle_irq_event_percpu+0x3c/0xc0)
> [<c0157d94>] (__handle_irq_event_percpu) from [<c0157e44>] (handle_irq_event_percpu+0x2c/0x7c)
> [<c0157e44>] (handle_irq_event_percpu) from [<c0157ecc>] (handle_irq_event+0x38/0x5c)
> [<c0157ecc>] (handle_irq_event) from [<c015bc8c>] (handle_fasteoi_irq+0x9c/0x114)

Thanks for that. Can you please try the following patch and let me
know if it helps?

Thanks,

	M.

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index ad9abf405167..14001febf59a 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -194,8 +194,18 @@ static struct pci_ops xilinx_pcie_ops = {
 
 /* MSI functions */
 
+static void xilinx_msi_top_irq_ack(struct irq_data *d)
+{
+	/*
+	 * xilinx_pcie_intr_handler() will have performed the Ack.
+	 * Eventually, this should be fixed and the Ack be moved in
+	 * the respective callbacks for INTx and MSI.
+	 */
+}
+
 static struct irq_chip xilinx_msi_top_chip = {
 	.name		= "PCIe MSI",
+	.irq_ack	= xilinx_msi_top_irq_ack,
 };
 
 static int xilinx_msi_set_affinity(struct irq_data *d, const struct cpumask *mask, bool force)
@@ -206,7 +216,7 @@ static int xilinx_msi_set_affinity(struct irq_data *d, const struct cpumask *mas
 static void xilinx_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	struct xilinx_pcie_port *pcie = irq_data_get_irq_chip_data(data);
-	phys_addr_t pa = virt_to_phys(pcie);
+	phys_addr_t pa = ALIGN_DOWN(virt_to_phys(pcie), SZ_4K);
 
 	msg->address_lo = lower_32_bits(pa);
 	msg->address_hi = upper_32_bits(pa);
@@ -468,7 +478,7 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_pcie_port *port)
 
 	/* Setup MSI */
 	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		phys_addr_t pa = virt_to_phys(port);
+		phys_addr_t pa = ALIGN_DOWN(virt_to_phys(port), SZ_4K);
 
 		ret = xilinx_allocate_msi_domains(port);
 		if (ret)

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
