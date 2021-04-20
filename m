Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE2AC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 08:40:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D1460FE3
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 08:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D1460FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u+UJ3UhFs7nK6eiyjtkk/VuQh0zpT5o7XJw7meBRf88=; b=omHBfpriLsj351cgYcohHiYXE
	xL6Sx7psCcG/X1jTox9eDBAip1J8B5YKtrLcT359bgMEkGaTs4lulPT5ADCL5533Uj6N/9MvO4lyj
	9lMxfD7o2vk1BQCRctC+GVP76AyZBodJrcKqti/5QEq5XgsCKiUUq3Hwj+iBsz42PG7tfN52w6Mn9
	Vj4YSZ9SxwJXS0hJOSxPTuKk5wVYKScNOZM2Wr3kbxfSlMSPa8WePD0xOw4z6RrDuSr5nsyeqQLPI
	uYNgMhzBPNy39GBZ3eC2MvQkhhx+yXTNgB3pIGnpdyh9z6CwESVrgXLmkzD4GM+2Id5JQjtDidc8u
	zDPahusmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYlv9-00BbnY-AA; Tue, 20 Apr 2021 08:39:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYluw-00BblM-Ku; Tue, 20 Apr 2021 08:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fDcfQHZJ6E0CFUL2ptCgtMuSZn0zblt2TMJnrOkMnTc=; b=ekVNxtzWJ6YlWmEX00KzNWup7o
 mystH3rgeV+MyJUWAkSLk8HWI0gBcFNafuyGzfU1aG+UnXjSFEWWda+SDpTFae1lc6czXTLa7oeiB
 y27r3ONqe+3R9wLC0yUqRsV2QEj4pOP2lBnvFO4ldXGdRLFjtTbEmEQ1+lN6mp2G52fONLM0IV9yo
 +InNRetIKYbz4/7CNwNhO19kt80AYSTqBN6TNur1XoOaHwERzCS27gcfH4D/uThXdJbyKQeA6YH4B
 KJdMgZnlJkwigiYNI2xn5VEJLiX5VVsTOKCWHNd2r5bgWKmdwBUcmHWwl5E0q96yLjwIiReAOd1kM
 xLDg916g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYlut-00BvnZ-T0; Tue, 20 Apr 2021 08:39:33 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEBFB60FE3;
 Tue, 20 Apr 2021 08:39:30 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lYluq-008S7B-EZ; Tue, 20 Apr 2021 09:39:28 +0100
Date: Tue, 20 Apr 2021 09:39:25 +0100
Message-ID: <87fszlqria.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>, Thierry Reding
 <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring
 <robh@kernel.org>, Will Deacon <will@kernel.org>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, "Stephen\
 Hemminger" <sthemmin@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bharat Kumar Gogada
 <bharatku@xilinx.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-hyperv@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <kernel-team@android.com>
Subject: Re: [PATCH v3 01/14] PCI: tegra: Convert to MSI domains
In-Reply-To: <638a9996-c762-fa11-b740-6a41d4a83bcc@nvidia.com>
References: <20210330151145.997953-1-maz@kernel.org>
 <20210330151145.997953-2-maz@kernel.org>
 <316e8be4-fa70-75e8-8483-ae38036306e0@nvidia.com>
 <638a9996-c762-fa11-b740-6a41d4a83bcc@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, lorenzo.pieralisi@arm.com,
 bhelgaas@google.com, frank-w@public-files.de, treding@nvidia.com,
 tglx@linutronix.de, robh@kernel.org, will@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, mikelley@microsoft.com,
 wei.liu@kernel.org, thierry.reding@gmail.com, ryder.lee@mediatek.com,
 marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 michal.simek@xilinx.com, paul.walmsley@sifive.com, bharatku@xilinx.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_013932_039144_210B101A 
X-CRM114-Status: GOOD (  36.53  )
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

Hi Jon,

On Mon, 19 Apr 2021 21:02:10 +0100,
Jon Hunter <jonathanh@nvidia.com> wrote:
> 
> 
> On 19/04/2021 20:19, Jon Hunter wrote:
> > Hi Marc,
> > 
> > On 30/03/2021 16:11, Marc Zyngier wrote:
> >> In anticipation of the removal of the msi_controller structure, convert
> >> the Tegra host controller driver to MSI domains.
> >>
> >> We end-up with the usual two domain structure, the top one being a
> >> generic PCI/MSI domain, the bottom one being Tegra-specific and handling
> >> the actual HW interrupt allocation.
> >>
> >> While at it, convert the normal interrupt handler to a chained handler,
> >> handle the controller's MSI IRQ edge triggered, support multiple MSIs
> >> per device and use the AFI_MSI_EN_VEC* registers to provide MSI masking.
> >>
> >> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> >> [treding@nvidia.com: fix, clean up and address TODOs from Marc's draft]
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> Signed-off-by: Marc Zyngier <maz@kernel.org>
> > 
> > 
> > This change is breaking a suspend test that we are running on Tegra124
> > Jetson-TK1. The Tegra124 Jetson TK1 uses a PCI based ethernet device ...
> > 
> > $ lspci
> > 00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
> > 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> > RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)
> > 
> > After resuming from suspend, networking is no longer working. The reason
> > why this breaks our suspend test is because that setup is using NFS for
> > the rootfs. I am looking into it, but if anyone has any thoughts please
> > let me know.
> 
> 
> So the following does appear to fix it ...
> 
> diff --git a/drivers/pci/controller/pci-tegra.c
> b/drivers/pci/controller/pci-tegra.c
> index eaba7b2fab4a..558f02e0693d 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -1802,13 +1802,17 @@ static void tegra_pcie_enable_msi(struct
> tegra_pcie *pcie)
>  {
>         const struct tegra_pcie_soc *soc = pcie->soc;
>         struct tegra_msi *msi = &pcie->msi;
> -       u32 reg;
> +       u32 i, reg;
> 
>         afi_writel(pcie, msi->phys >> soc->msi_base_shift,
> AFI_MSI_FPCI_BAR_ST);
>         afi_writel(pcie, msi->phys, AFI_MSI_AXI_BAR_ST);
>         /* this register is in 4K increments */
>         afi_writel(pcie, 1, AFI_MSI_BAR_SZ);
> 
> +       /* enable all MSI vectors */
> +       for (i = 0; i < 8; i++)
> +               afi_writel(pcie, 0xffffffff, AFI_MSI_EN_VEC(i));
> +
>         /* and unmask the MSI interrupt */
>         reg = afi_readl(pcie, AFI_INTR_MASK);
>         reg |= AFI_INTR_MASK_MSI_MASK;
> @@ -1837,13 +1841,17 @@ static void tegra_pcie_msi_teardown(struct
> tegra_pcie *pcie)
> 
>  static int tegra_pcie_disable_msi(struct tegra_pcie *pcie)
>  {
> -       u32 value;
> +       u32 i, value;
> 
>         /* mask the MSI interrupt */
>         value = afi_readl(pcie, AFI_INTR_MASK);
>         value &= ~AFI_INTR_MASK_MSI_MASK;
>         afi_writel(pcie, value, AFI_INTR_MASK);
> 
> +       /* disable all MSI vectors */
> +       for (i = 0; i < 8; i++)
> +               afi_writel(pcie, 0, AFI_MSI_EN_VEC(i));
> +
>         return 0;
>  }
> 
> 
> Any reason why that code was removed?

Two reasons spring to mind: it obviously wasn't tested enough, and
part of the above code isn't quite right. You can't just blindly
enable all MSIs, irrespective of what has been actually enabled.

The following should hopefully cure it (compile tested only). Please
let me know.

	M.

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index eaba7b2fab4a..507b23d43ad1 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1802,13 +1802,19 @@ static void tegra_pcie_enable_msi(struct tegra_pcie *pcie)
 {
 	const struct tegra_pcie_soc *soc = pcie->soc;
 	struct tegra_msi *msi = &pcie->msi;
-	u32 reg;
+	u32 reg, msi_state[INT_PCI_MSI_NR / 32];
+	int i;
 
 	afi_writel(pcie, msi->phys >> soc->msi_base_shift, AFI_MSI_FPCI_BAR_ST);
 	afi_writel(pcie, msi->phys, AFI_MSI_AXI_BAR_ST);
 	/* this register is in 4K increments */
 	afi_writel(pcie, 1, AFI_MSI_BAR_SZ);
 
+	/* Restore the MSI allocation state */
+	bitmap_to_arr32(msi_state, msi->used, INT_PCI_MSI_NR);
+	for (i = 0; i < ARRAY_SIZE(msi_state); i++)
+		afi_writel(pcie, msi_state[i], AFI_MSI_EN_VEC(i));
+
 	/* and unmask the MSI interrupt */
 	reg = afi_readl(pcie, AFI_INTR_MASK);
 	reg |= AFI_INTR_MASK_MSI_MASK;

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
