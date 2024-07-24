Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B180FC3DA61
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbALP3QIjCL6mWz14PmpKACkxPrqfTSuSK7rkKg3La4=; b=pBZYF6ybDzS40AAv/oabf1XCD+
	eb1C+kFO5HBbXJ63jvpgYfODDb+yNJxv3iIy+d4/rdhripy0TyxAeQdfPEhlBK0dARGXrIYOQc9x6
	w8nrbOb/LXcwMO1g756Z8JcGOnF1O9J852ThtnHYK68ryZ86UCeF7ICWNdZe75FJtYowwBdoY81c3
	A2pQqbk8EAv2DSm48yZ/DqyjbEUria/ouIZ+iBE0xV/EGIv1BzMoGv5oCOnidOzEsiyZ3I02PiTlN
	ftgDyXHWsiKyqrzcUTjG+BlYAv32enzbBGooIdRgAK/mv5cpNWjfJ68lhgxU7bortg2ZFTQd3WPqc
	nEiwpDTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcO4-0000000FV1Y-1LWd;
	Wed, 24 Jul 2024 13:50:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcO1-0000000FV0N-037b
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jul 2024 13:50:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d333d57cdso1990242b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jul 2024 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721829032; x=1722433832; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pbALP3QIjCL6mWz14PmpKACkxPrqfTSuSK7rkKg3La4=;
        b=nnU9yw3gAPjmkdYka5wiTq5riM9YQIaYWIAPLfU+ZojGGv2fc3W/LpkB2gccDLAX7j
         iFHdSbyDDPb4RoeiZwOdDTfsHNBnr1dSMj7ITQDHDrCbP0ub0wmaQP3Nlfya3twenCzJ
         4jnocpi+DBoNTXdtWM7eJLnBKHkJUItC1cWuV93ZYplwAts28/ZTHGWs13/yNwyuWWnh
         PbqSlLzhrrJioXSnwCPlhpOP4XKnnFcDDk1+6BZ6o3BOutUWsEVLZyeKqpt2E7TCVUw8
         5eJRLZ40GpnkSydfU4OVOoxT6r38V7Qhp8gjwhzQPWloXGPaB6+hiNvaqZIQFVj32jXq
         O7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721829032; x=1722433832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbALP3QIjCL6mWz14PmpKACkxPrqfTSuSK7rkKg3La4=;
        b=wAPyu9diIqSOlTKcTW/ZpaUchtXmxVp1dByfKi6S8OWqITpSek+nR4walCmC4BwfDd
         dtqffio7d0HesndC2+WL9HkoF+Vp3xjDi1J2sOGuqkArREPxa/t67nfOBZBO9swM8/Xc
         y4npgrX07sC22GrVdv0PxtPHSRl2NC0UW4R5KytOc/fXtqp7u/IWYYFs+C4MIYm/HAXf
         /b1tvjsg+hsdv141rLa9AqyOzyeO01fahKSX8m7dQlY5pXHKB8NKzYRK2MZqYL8RnZ1K
         AQGiq3H/6O6NHfk+6Y3RSFXs7iXaGRLsIWFz7+DxNChZD3+wRDcUenitLf6WXKJhgRyT
         +e/w==
X-Forwarded-Encrypted: i=1; AJvYcCVVW1DCKWTRZ1EkAVrBpxCj4EFoEoM3IRrhaWuIAKFvC2zblgTS66E34FJ0rxFLtGeFphc1BIIQ3Po94h+S8+PakVvwQfvK9dW9037J5FRK+ORh
X-Gm-Message-State: AOJu0Yztd19ovCBbg5n60nTDoymWgAs9wY7DYGVWeugFQkzwxfk47/eg
	t4wzhrg9b2/laO4RXrLc4NXBS8i64VmDQiNn9KluDsqLva+1FKkF2takexHrRA==
X-Google-Smtp-Source: AGHT+IG0YFoIL4lPnBLT+Aopu2jQ/kCeCrRtyAOg5jS+eqaqVK57qCofzoxxbC6rl3vwtZMbLKsHKg==
X-Received: by 2002:a05:6a00:a82:b0:70d:3337:7820 with SMTP id d2e1a72fcca58-70e99689086mr3278241b3a.8.1721829032049;
        Wed, 24 Jul 2024 06:50:32 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d22f50f46sm5507795b3a.77.2024.07.24.06.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 06:50:31 -0700 (PDT)
Date: Wed, 24 Jul 2024 19:20:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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
Message-ID: <20240724135020.GD3349@thinkpad>
References: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_065033_086378_5426A445 
X-CRM114-Status: GOOD (  14.77  )
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

Whole series looks good to me (PCI controller specific patches).

FWIW,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

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
> 
> Cc: "Krzysztof Wilczyński" <kw@linux.com>
> Cc: "Pali Rohár" <pali@kernel.org>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: Daire McNamara <daire.mcnamara@microchip.com>
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Cc: Jianjun Wang <jianjun.wang@mediatek.com>
> Cc: Jim Quinlan <jim2101024@gmail.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Jonathan Derrick <jonathan.derrick@linux.dev>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Joyce Ooi <joyce.ooi@intel.com>
> Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: Koichiro Den <den@valinux.co.jp>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: Niklas Cassel <cassel@kernel.org>
> Cc: Nipun Gupta <nipun.gupta@amd.com>
> Cc: Nirmal Patel <nirmal.patel@linux.intel.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> 
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

