Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B8CC3DA49
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jul 2024 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0ZWoiOCM+0xAE6TqN2FuXSL0OE53i2Ls+VX6p34EY1g=; b=jj7CX1PclWPrMh
	LLW5lF4mBA/mcFQ6SfTfPgIRnjivuqfVh6j7mF26XU/eFWUSkMMx/qg8d8U+AElPasCfJogwj2hry
	SP233RoPGQ/iFfuGW6Sls1bbJ5zrFqyCWOQZ6sVSL8M0fzDLCeI62PrKfZXiGBokO+wIpBZBsNWuB
	4qE/u3mJ2rV2A50O1FrOkSfJ0uGn3w+6Om8sT4prnqvEH+c3P4H6J6LvCclaOx8hjmqdjDGdHVHgp
	P22aCdm3LeYDLoYfqPqzhM2onU7U29tCUo21xbL1LELLO38mv4jz7sJDSfcdjKl8vVa+2ymz8ZXQx
	s6nxhzUwdP/S5OhQ1kZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXQ8I-00000004k0Q-3YJg;
	Fri, 26 Jul 2024 18:57:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXQ7s-00000004ju9-3av3;
	Fri, 26 Jul 2024 18:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBD0A61808;
	Fri, 26 Jul 2024 18:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F51DC32782;
	Fri, 26 Jul 2024 18:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722020231;
	bh=Uvx/6FUt2w2n0+6JKlzy90R2S4AjzIQtW71B2uzDqM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=r2BOaxW+oeaI0t/luo31fVhWfq332hRgd8uSffX1taaJHF+otgFrMC8UrVgjxqpmr
	 PKw9NNvznSbSSHI2d5+UsG9WP3T0TJ8CLee4wTUdFJe43ebAINXTIFnv/bWI+Eik0b
	 z1+XANr/gsKATUGXENhm9RjB1L+FM6Q3q/c58Br+2QyUXOyDZbqE/FRGqNqbPcw2SG
	 ia0Sddm+7Ir5JFSqUiX4qlDVhcliw7mGziqECJvdciJ8TJ2Il16ZopOaJged42mNwG
	 s8P9BEPtCal2VvMeUdzWxPEtFIMXHswSsF7VkjgHtTahhHdDlk7d9s0EuIUzGu5Z4J
	 q1Y0B6F4ReeFw==
Date: Fri, 26 Jul 2024 13:57:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 00/15] genirq/msi: Silence set affinity failed warning
Message-ID: <20240726185709.GA915987@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_115713_000749_EB9A408B 
X-CRM114-Status: GOOD (  13.01  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 23, 2024 at 03:27:00PM +0200, Marek Vasut wrote:
> Various PCIe controllers that mux MSIs onto single IRQ line produce these
> "IRQ%d: set affinity failed" warnings when entering suspend. Remove the
> .irq_set_affinity callbacks and make sure they are NULL in all affected
> controllers, so this warning in kernel/irq/msi.c is not triggered.
> 
> This has been compile-tested only on all but the R-Car PCI controller.
> 
> The clean ups are done per-driver so they can be easily reverted in case
> they break something.
> 
> Marek Vasut (15):
>   genirq/msi: Silence set affinity failed warning
>   PCI: aardvark: Silence set affinity failed warning
>   PCI: altera-msi: Silence set affinity failed warning
>   PCI: brcmstb: Silence set affinity failed warning
>   PCI: dwc: Silence set affinity failed warning
>   PCI: mediatek-gen3: Silence set affinity failed warning
>   PCI: mediatek: Silence set affinity failed warning
>   PCI: mobiveil: Silence set affinity failed warning
>   PCI: plda: Silence set affinity failed warning
>   PCI: rcar-host: Silence set affinity failed warning
>   PCI: tegra: Silence set affinity failed warning
>   PCI: vmd: Silence set affinity failed warning
>   PCI: xilinx-nwl: Silence set affinity failed warning
>   PCI: xilinx-xdma: Silence set affinity failed warning
>   PCI: xilinx: Silence set affinity failed warning
> 
>  drivers/pci/controller/dwc/pci-keystone.c           |  7 -------
>  drivers/pci/controller/dwc/pcie-designware-host.c   | 12 +++---------
>  .../pci/controller/mobiveil/pcie-mobiveil-host.c    | 11 ++---------
>  drivers/pci/controller/pci-aardvark.c               | 10 ++--------
>  drivers/pci/controller/pci-tegra.c                  | 10 ++--------
>  drivers/pci/controller/pcie-altera-msi.c            | 11 ++---------
>  drivers/pci/controller/pcie-brcmstb.c               | 11 ++---------
>  drivers/pci/controller/pcie-mediatek-gen3.c         | 13 +++----------
>  drivers/pci/controller/pcie-mediatek.c              | 11 ++---------
>  drivers/pci/controller/pcie-rcar-host.c             | 10 ++--------
>  drivers/pci/controller/pcie-xilinx-dma-pl.c         | 11 ++---------
>  drivers/pci/controller/pcie-xilinx-nwl.c            | 11 ++---------
>  drivers/pci/controller/pcie-xilinx.c                |  9 ++-------
>  drivers/pci/controller/plda/pcie-plda-host.c        | 11 ++---------
>  drivers/pci/controller/vmd.c                        | 13 +------------
>  include/linux/msi.h                                 |  2 ++
>  kernel/irq/msi.c                                    |  2 +-
>  17 files changed, 32 insertions(+), 133 deletions(-)

Applied to pci/controller/affinity for v6.11, thank you very much for
doing this work!

I pushed this branch, but it won't show up in linux-next until after
v6.12-rc1 is tagged.

