Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C93C3DA61
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 13:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjlS3KeN9meLLfSQsSaPi/f/kHzcBW78TFSUcPryCjM=; b=3MpwQy+fDhMAH+bV75vk+754gh
	WZ2UPzV4qVmqb9eUefHTTc0h5V3h8maQ0o1Lov6KtQPXsYPy6Pd9GFnCIcvqM4gxlR9FsjdD07Jh3
	0rHPuUHrfJaX+ZCpn1t8xxR6z/dXJknCA1wPLulF5YUxYhYCeleI67i7Kne4DWCP1FJq8Cc6zain4
	Ijir6Nj5oNr/jBjLNY4SWgZNgpAbFSZ1dapyTH8qClV/r9vq6vjFvB6qapo5DqZ2UjH1951BO1lPg
	ZNRnWRBCBi7vMGUhUWrbY0ZkMUSKIyti9Dc6KG1bD3+Zy0MxmMpaVMCiEXq/08Rn4tDvYucZmK/4g
	O0N3mo+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcLY-0000000FUhh-0ZF3;
	Wed, 24 Jul 2024 13:48:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcL9-0000000FUd0-0opT
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jul 2024 13:47:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fd66cddd4dso18322645ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jul 2024 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721828854; x=1722433654; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SjlS3KeN9meLLfSQsSaPi/f/kHzcBW78TFSUcPryCjM=;
        b=ol3xxgdKNfItAkW97krY+DeieZe1jlUCJgaytS9t6O7NUwmRti4D+5NeWN+ivSEWPc
         N4XnvNrokhvLHNVPL09XcFdGsScYCRh9tFYHqxGhHRcQ9h4UVQ+a8kWNk7UmkMdwx1Wa
         BkYxmnRUM7G/jVRGEblyNIc5GLSs8SoaEQvDKA9BeuxFZSwrr1+Ru/c5yArfudoHesFE
         +wJopAIRJ0ZzcpKwugan5tTEv6wrjAuRNx0DEswIsNAjB5vR/+UAKuAOZaa5PjjDWe4o
         JZd0lkWpvrcNxeiOM+atqV2UdL8TnEZQrt7wttpJ988x0G5Pm6EY12QrzCc7SW06HMZy
         99cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721828854; x=1722433654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SjlS3KeN9meLLfSQsSaPi/f/kHzcBW78TFSUcPryCjM=;
        b=M7v9zwzGdRlCRsMw4/ziuGDeTZQgK0QB8n8fI3Elb5f4hMEwGgNM20SMQ211QA6TXr
         US8hHZ+HDXW26AbfitUtWN2xuZQGLlruqZ8IeBQkkbofZ02tKnTg/GVx5dAVOcvkv2eo
         LNWJmwsWAgp65jD4G3ArCMIpTVTeNR98KP3TP0RKjMUMRCGWZMFp/Pe8XxilP6x9GRBq
         dvjjh9FOaV/nvn3ymFCHUJ3254IYc+BXrlX2Cqd+iAGQCMBsIGUrNj+0YL0Hk+KPza1R
         uk3FG4Xmn6WTP0gWkryx1VwBmgbxp3QuJd0fsjdg+tI61PuRUHo7l5WNCxZ+1cW4sHrV
         bAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnKxJHhp+KGLgBekEf9tH/x+yrP1nM3ZenigLQuezmYsxULs014Z/HELZr7WqSlS7P5OV61A86JUDpsM0r7bnQoxDVce+1XUq77cWk5G6qn6ab
X-Gm-Message-State: AOJu0Yw35ytHW2fudQk5U7oMvl957OVG8Ul2TT7gI/DSgnWoTTF6Fwx9
	RE9Wd+bI1YByYq2qbMOIMG3syee3ICqIkh0iFW4XG9K9bYBl2g4ugW16IGi6xg==
X-Google-Smtp-Source: AGHT+IGQ1pRozmQ8WsiHI1I3zmEDTN6hvlFln3KcelbKxSnwPg41LAbjogxZsXYR2+UZUvCxUcYACA==
X-Received: by 2002:a17:903:244a:b0:1fc:2ee3:d45a with SMTP id d9443c01a7336-1fdd54f46f3mr24825785ad.8.1721828853831;
        Wed, 24 Jul 2024 06:47:33 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f4c4sm94151845ad.224.2024.07.24.06.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 06:47:33 -0700 (PDT)
Date: Wed, 24 Jul 2024 19:17:21 +0530
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
Subject: Re: [PATCH v4 05/15] PCI: dwc: Silence set affinity failed warning
Message-ID: <20240724134721.GC3349@thinkpad>
References: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
 <20240723132958.41320-6-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723132958.41320-6-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_064735_313383_99A08A3A 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, Jul 23, 2024 at 03:27:05PM +0200, Marek Vasut wrote:
> Use newly introduced MSI_FLAG_NO_AFFINITY, which keeps .irq_set_affinity unset
> and allows migrate_one_irq() code in cpuhotplug.c to exit right away, without
> printing "IRQ...: set affinity failed(-22)" warning.
> 
> Remove .irq_set_affinity implementation which only return -EINVAL from this
> controller driver.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
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
> ---
> V4: - New patch
> ---
>  drivers/pci/controller/dwc/pci-keystone.c         |  7 -------
>  drivers/pci/controller/dwc/pcie-designware-host.c | 12 +++---------
>  2 files changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 52c6420ae2003..ce9d9e0a52609 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -189,12 +189,6 @@ static void ks_pcie_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  		(int)data->hwirq, msg->address_hi, msg->address_lo);
>  }
>  
> -static int ks_pcie_msi_set_affinity(struct irq_data *irq_data,
> -				    const struct cpumask *mask, bool force)
> -{
> -	return -EINVAL;
> -}
> -
>  static void ks_pcie_msi_mask(struct irq_data *data)
>  {
>  	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(data);
> @@ -247,7 +241,6 @@ static struct irq_chip ks_pcie_msi_irq_chip = {
>  	.name = "KEYSTONE-PCI-MSI",
>  	.irq_ack = ks_pcie_msi_irq_ack,
>  	.irq_compose_msi_msg = ks_pcie_compose_msi_msg,
> -	.irq_set_affinity = ks_pcie_msi_set_affinity,
>  	.irq_mask = ks_pcie_msi_mask,
>  	.irq_unmask = ks_pcie_msi_unmask,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index a0822d5371bc5..3e41865c72904 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -48,8 +48,9 @@ static struct irq_chip dw_pcie_msi_irq_chip = {
>  };
>  
>  static struct msi_domain_info dw_pcie_msi_domain_info = {
> -	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> -		   MSI_FLAG_PCI_MSIX | MSI_FLAG_MULTI_PCI_MSI),
> +	.flags	= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> +		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_PCI_MSIX |
> +		  MSI_FLAG_MULTI_PCI_MSI,
>  	.chip	= &dw_pcie_msi_irq_chip,
>  };
>  
> @@ -116,12 +117,6 @@ static void dw_pci_setup_msi_msg(struct irq_data *d, struct msi_msg *msg)
>  		(int)d->hwirq, msg->address_hi, msg->address_lo);
>  }
>  
> -static int dw_pci_msi_set_affinity(struct irq_data *d,
> -				   const struct cpumask *mask, bool force)
> -{
> -	return -EINVAL;
> -}
> -
>  static void dw_pci_bottom_mask(struct irq_data *d)
>  {
>  	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> @@ -177,7 +172,6 @@ static struct irq_chip dw_pci_msi_bottom_irq_chip = {
>  	.name = "DWPCI-MSI",
>  	.irq_ack = dw_pci_bottom_ack,
>  	.irq_compose_msi_msg = dw_pci_setup_msi_msg,
> -	.irq_set_affinity = dw_pci_msi_set_affinity,
>  	.irq_mask = dw_pci_bottom_mask,
>  	.irq_unmask = dw_pci_bottom_unmask,
>  };
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

