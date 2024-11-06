Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0EBD35E5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 01:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NfRi646HS84oSCvzTpTulK406nYildFYCUdmApHGYnk=; b=OwzlSVzVtn1sUx
	IQJr+szrO0oRSJvi6Z2TtrkGIHcA2vJx9OJAbk/VaB0802LW2fQIfrV2AIXjrkX3LOc76Mc+crom3
	kXANnqC+390r/snQ6BxtRBqm2Na8CVSrxfgH95/SeNvIRRem1oVFGwfKCjrIhTDT7WCeOoj5GA/H4
	2jFshpJFBp+rq7i++D95mS3XgXKKI+v5UeEiRIEGZtIeMYnmeDqrARe1la1bEWh/3T7iVqEFmEMyj
	Mq2mN0876onfYfcgSolUN6FT2V9ElcK398vwYq6v645j3NTBMRkHt6IPtxROOTpjfqYReRZPOboiX
	fP/MH5s6gIyxRBTTEXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UoV-00000001JYp-2tiH;
	Wed, 06 Nov 2024 01:26:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Umn-00000001JLf-0H9G;
	Wed, 06 Nov 2024 01:24:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FDEEA4186C;
	Wed,  6 Nov 2024 01:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB28AC4CECF;
	Wed,  6 Nov 2024 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730856280;
	bh=vRrn7XQk4kYfX51iKVeX0HgljCZepsJnBMOjVJ6g2Bg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nWATgZ+XOzJ9SOtN5ClvbdkViMbSB0pgH0Qt1zG7hb7JHCvlY3N76E3zuJd/nsCSJ
	 YtQUHjI6CERW+spVKSegFc9n35iUIR7UQCeX1y1PxIFgPUwGoGNpL5CdXYbZaRpzoE
	 IAkCyxyeBcsX7vEaCLIr9IvjGkhLdjwF3X7Qh2yMsrgSJsjtDuazrGIthE9IfWtyzs
	 Gp60qyvBHlheUZuYZgVSMJowGBTXQuPoJgEIS7GEaJ+GtgWnUkG+wXnU9mwhO+7wHk
	 N4r+wXrf307/oo624bqriW0pAXcOyoQv6kQnNlodlk/wZzcUWhE6uhJ78dWAfW2yll
	 2xoA4+QTWqsBQ==
Date: Tue, 5 Nov 2024 19:24:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 2/2] PCI: mediatek-gen3: Add support for restricting
 link width
Message-ID: <20241106012438.GA1499437@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104114935.172908-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_172441_272672_9B0387BD 
X-CRM114-Status: GOOD (  20.34  )
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
Cc: robh@kernel.org, ryder.lee@mediatek.com, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, bhelgaas@google.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 04, 2024 at 12:49:35PM +0100, AngeloGioacchino Del Regno wrote:
> Add support for restricting the port's link width by specifying
> the num-lanes devicetree property in the PCIe node.
> 
> The setting is done in the GEN_SETTINGS register (in the driver
> named as PCIE_SETTING_REG), where each set bit in [11:8] activates
> a set of lanes (from bits 11 to 8 respectively, x16/x8/x4/x2).

I guess GEN_SETTINGS doesn't correspond to a register defined by the
PCIe spec, right?  The only thing in the spec that looks similar is
the Target Link Width in the Device Control 3 register, but the bit
position doesn't look like this PCIE_SETTING_LINK_WIDTH mask:

>  #define PCIE_SETTING_REG		0x80
> +#define PCIE_SETTING_LINK_WIDTH		GENMASK(11, 8)
>  #define PCIE_SETTING_GEN_SUPPORT	GENMASK(14, 12)
>  #define PCIE_PCI_IDS_1			0x9c
>  #define PCI_CLASS(class)		(class << 8)
> @@ -168,6 +169,7 @@ struct mtk_msi_set {
>   * @clks: PCIe clocks
>   * @num_clks: PCIe clocks count for this port
>   * @max_link_speed: Maximum link speed (PCIe Gen) for this port
> + * @num_lanes: Number of PCIe lanes for this port
>   * @irq: PCIe controller interrupt number
>   * @saved_irq_state: IRQ enable state saved at suspend time
>   * @irq_lock: lock protecting IRQ register access
> @@ -189,6 +191,7 @@ struct mtk_gen3_pcie {
>  	struct clk_bulk_data *clks;
>  	int num_clks;
>  	u8 max_link_speed;
> +	u8 num_lanes;
>  
>  	int irq;
>  	u32 saved_irq_state;
> @@ -401,6 +404,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT,
>  					  GENMASK(pcie->max_link_speed - 2, 0));
>  	}
> +	if (pcie->num_lanes) {
> +		val &= ~PCIE_SETTING_LINK_WIDTH;
> +
> +		/* Zero means one lane, each bit activates x2/x4/x8/x16 */
> +		if (pcie->num_lanes > 1)
> +			val |= FIELD_PREP(PCIE_SETTING_LINK_WIDTH,
> +					  GENMASK(fls(pcie->num_lanes >> 2), 0));
> +	};
>  	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>  
>  	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
> @@ -838,6 +849,7 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct resource *regs;
> +	u32 num_lanes;
>  
>  	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
>  	if (!regs)
> @@ -883,6 +895,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
>  		return pcie->num_clks;
>  	}
>  
> +	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
> +	if (ret == 0) {
> +		if (num_lanes == 0 || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
> +			dev_warn(dev, "Invalid num-lanes, using controller defaults\n");
> +		else
> +			pcie->num_lanes = num_lanes;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.46.1
> 

