Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416F1E67805
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Nov 2024 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VX3YOh1jhDj1AiTiXMyf+CQYHVDjjL3hhDOyBFnTXKs=; b=VHSB5KpEIMh/vqP3wYVFrpfequ
	nIqkZRDci2cASMt1wTYwi4Ij11/CA6ghf6W4u8Gt7D/HauMxR2mxZvzKwlU2YNGe2u39Z/t3PnLEq
	sDEywsIhC9LRSMLF55EzPEE1YdU058Tw3PrRa3g4qubazDHbI6jYm0LbXcGQVsqkzjqK1iRQ2mLFN
	YtnNFvhoxrdebakcDUSGh/sMhldzPO+dToH45a31A9nosCc7vwqTuCf9HOBGL1ERWM0yYQgnEUCMl
	OvXSXlBLitOC+f7yR6qzMZkdygn1QOdSdwe4lqNdFu3zOQmo5iWniOCrFNXyKy8S0QULpyb3LwEa/
	wEKj0e5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Hrp-0000000A72n-3p8t;
	Sat, 02 Nov 2024 17:24:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Hrn-0000000A71w-2v3R
	for linux-mediatek@lists.infradead.org;
	Sat, 02 Nov 2024 17:24:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so2591125b3a.3
        for <linux-mediatek@lists.infradead.org>; Sat, 02 Nov 2024 10:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730568290; x=1731173090; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VX3YOh1jhDj1AiTiXMyf+CQYHVDjjL3hhDOyBFnTXKs=;
        b=bLcgkWkjPs43S7o9eXwaG//imn4cHOaHs5NLYnMPSD6OfhUqw4tOQ5C0nBITgAlWHG
         oTNO3u5gQIIdgOOvC0XkVx8VCs9Fn6PCudg1O3K8BMvE7REOrbiKGR5dAEREFLOkCVuC
         ynH+lccxUPFuG2Z95QiqqBNxIiTMzW56hzWHG6/enMoGhRELeBY/3VFtFAhXBux0YwZk
         bfnKHMstfopNJuctbaR801M8L68OfGF24ZkWuF2QNJ1Kk1cT9GjCAzPNavoXxrwTrdZ5
         +8j5mmxSB9UhlSI9I/VfO901Gysbtl1DPs1D6Jg1caoQHq+lPMGoLV1Di2uWPTGAt1yu
         huAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730568290; x=1731173090;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VX3YOh1jhDj1AiTiXMyf+CQYHVDjjL3hhDOyBFnTXKs=;
        b=XrkW3XMfG6nIKfpZMX0KH7qAJkCFNpAWHO2m3GslF97+Z7PW6O7i07bZvOtwkVpGoW
         p05aeyzPHYQeOljsLLcK3eI9szmXJR7ZC5Ua8hyvPe1bs3B6K80ZqwGMG33SqnJZtR4z
         zrJe3i2BxA8N7W8QSBaRDtkxAtjdND1TfGS1B0h77hOHbWGMZiEmCF5CqWHDugI8xO2E
         VSQUQ260meSjX3DcjkmEfdRFJv5vjowaRrGeVQpKx956YSY73+NfuywX95mZXLraHbNe
         Z1h3WszRLIba+RPoERUFOD2ibWsSwkDPmqSbhLcQ/p5nIT9O4VUNKJmHSbS6hpeIWDZh
         EJYw==
X-Forwarded-Encrypted: i=1; AJvYcCXfJCl94dPLi7zDaWN38ogddozylq15FDCD9nlpcnY0V4h1GwJ2CpOAXxBB0sFlgtc2BlLL4WuEAanyMGC95A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8P8dTVXy+sqJlf2qoaLGQDldulNwXa1p7h68p0/16ZwmXY8ZL
	5O4gP7FFt6GaJBRllbipa+t6NjIdLDcXDSccNKwsGwsE8iLM6YSYcVHgGrlIyQ==
X-Google-Smtp-Source: AGHT+IGA3j5kLgj3Ycd5t1j/xeCFdUUpBT/WCxH5pGi54rtX4/oqeQvKBabE6xsNBLnzECZuDrv/1Q==
X-Received: by 2002:a05:6a21:e591:b0:1d9:789:b9bd with SMTP id adf61e73a8af0-1db91ec4045mr15056246637.43.1730568290439;
        Sat, 02 Nov 2024 10:24:50 -0700 (PDT)
Received: from thinkpad ([220.158.156.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452979e4sm4093637a12.9.2024.11.02.10.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 10:24:49 -0700 (PDT)
Date: Sat, 2 Nov 2024 22:54:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/2] PCI: mediatek-gen3: Add support for restricting
 link width
Message-ID: <20241102172442.5dpmca6yeb2gmpjt@thinkpad>
References: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com>
 <20240918081307.51264-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918081307.51264-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_102451_787478_8CDA13AC 
X-CRM114-Status: GOOD (  23.91  )
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
Cc: robh@kernel.org, ryder.lee@mediatek.com, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, bhelgaas@google.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 18, 2024 at 10:13:07AM +0200, AngeloGioacchino Del Regno wrote:
> Add support for restricting the port's link width by specifying
> the num-lanes devicetree property in the PCIe node.
> 
> The setting is done in the GEN_SETTINGS register (in the driver
> named as PCIE_SETTING_REG), where each set bit in [11:8] activates
> a set of lanes (from bits 11 to 8 respectively, x16/x8/x4/x2).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 8d4b045633da..8dd2e5135b01 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -32,6 +32,7 @@
>  #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
>  
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
> +					  GENMASK(pcie->num_lanes >> 1, 0));
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
> 2.46.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

