Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8915E67805
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Nov 2024 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTkV1XhxJ09OcLM/uZ+nNnIbHFyaFXru4on3d7CL7wo=; b=WHaYjQFnVDNj8U4AyXXJD5aH7e
	NGm7PZGwGakESfHk+dCLwswk+8Esj2dQ/zpjSX2/olVyL38px6zw7vdl61+eRMxdo1AIGa/Q/uekV
	HCGulAhYp4ErOuEQ+vZ9NrJ5Z46IJXkvNqCSIbtcEOo6ehyfFVpIekLybS8ftv/dJU3n1m1Ya0Q27
	zVNHU+3quDOyEmNtn64Mxjrl9lFw8dHRAULT0LiQNeI35aZrffvWD0HfDxF4qe7VjnDp3xlol2nuG
	zcziKiBA05YZtRYw14IA90dbrtsD/UfGZkjUUvFjuRcCPRz8wKl54ftEDaGfbgGs9Y1lNXvXvaCF4
	Y5YS821Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Hme-0000000A6QH-2GSI;
	Sat, 02 Nov 2024 17:19:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Hmb-0000000A6PI-1Grx
	for linux-mediatek@lists.infradead.org;
	Sat, 02 Nov 2024 17:19:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71ec997ad06so2482640b3a.3
        for <linux-mediatek@lists.infradead.org>; Sat, 02 Nov 2024 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730567968; x=1731172768; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTkV1XhxJ09OcLM/uZ+nNnIbHFyaFXru4on3d7CL7wo=;
        b=w6u+l08NxEpx9JD6KebFdoTmDt8gXwNlov9k06bemm8wrqZupuZR0VzR8cQiJlh4Mk
         cAxH6L3D5F4g0v4oFTJFsppwOjc0Ww23X2LqjGOFzK0e6GNFhlssPck2L3AvRqgmUsqb
         lnzQ5jpW9PUg52e1/GnJ7Ir7pQhrTnLrxZ1DtJOCIKxmlC9GuOL8i8HJVp4wOC/2aySg
         +26w+RHfPvl7uCaMjAVdQgdF1OjoGGHybnbAS1uISWLodSsUZq9QYQQgIweLlKqSRaim
         PPWhoXO4gqppgB+U0PzPApGCf8TygTyikT7ibOlUY5z8sPda0Dep50Q1pBCnNQyssw5w
         RLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730567968; x=1731172768;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTkV1XhxJ09OcLM/uZ+nNnIbHFyaFXru4on3d7CL7wo=;
        b=Ll49aHKTdXFrNsTG3pbcJKrY7KwcAplARmyiFnGUr6yqWqvdt/YbgL8JVekZSOd+4y
         mdOtO30DpVeOggdVp2VyBhn/MmlIjCikFlP/XyAozvKXiTYp53OYjif2LI0bsJa812Am
         cMdF+oPCH2NWwO4FiL5bEuP49uyS9ZfHiGrZ3gBADfayr/3deYYQTZ4wJlSv/wmAOPjB
         V1+ML1wZHDggZLZFYl1pwVenCDVN+IWPSure3fmssBlSa+VQ+7ycya4SMa5KSW0v4fbj
         dK2WQir2DjJO2A/jxzcxE9i7OMCUwhJe7W/VtBsvQf0GuORF/p0MZYR++lioAEhlMLkk
         IF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKtRfvIF3Y+Yyg3WG8Dq/w/fu1pEVhw1SSCluda7WcJdsX6W0OVTlpCMyWY+gZvMcUZ6ektSZ2Ryjsenojaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV6Jw9A4R1Pzqdv1pFYXU4ivS5RxxwzWcDf6rPL0Bi+BBX4IFt
	YZ+Ao4hth0JfvxqDCol/yqmzDK74y00d0OddC6dX6/ZZ3h9SCShz9z4kUoITyg==
X-Google-Smtp-Source: AGHT+IFi1cxAsGDs0F8dOgqbrOdXX0s1cA0y/1pfvpYVJz1F9v26FArl0PbmywggQPgDHROhLbLBZA==
X-Received: by 2002:a05:6a00:811:b0:71e:50ef:20f3 with SMTP id d2e1a72fcca58-720ab4c705fmr20397800b3a.28.1730567967567;
        Sat, 02 Nov 2024 10:19:27 -0700 (PDT)
Received: from thinkpad ([220.158.156.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5722sm4335321b3a.71.2024.11.02.10.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 10:19:27 -0700 (PDT)
Date: Sat, 2 Nov 2024 22:49:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
Message-ID: <20241102171920.epjf3j4pkbb5u4xq@thinkpad>
References: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com>
 <20240918081307.51264-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918081307.51264-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_101929_397620_BAD60C79 
X-CRM114-Status: GOOD (  28.25  )
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

On Wed, Sep 18, 2024 at 10:13:06AM +0200, AngeloGioacchino Del Regno wrote:
> Add support for respecting the max-link-speed devicetree property,
> forcing a maximum speed (Gen) for a PCI-Express port.
> 
> Since the MediaTek PCIe Gen3 controllers also expose the maximum
> supported link speed in the PCIE_BASE_CFG register, if property
> max-link-speed is specified in devicetree, validate it against the
> controller capabilities and proceed setting the limitations only
> if the wanted Gen is lower than the maximum one that is supported
> by the controller itself (otherwise it makes no sense!).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 55 ++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 66ce4b5d309b..8d4b045633da 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -28,7 +28,11 @@
>  
>  #include "../pci.h"
>  
> +#define PCIE_BASE_CFG_REG		0x14
> +#define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
> +
>  #define PCIE_SETTING_REG		0x80
> +#define PCIE_SETTING_GEN_SUPPORT	GENMASK(14, 12)
>  #define PCIE_PCI_IDS_1			0x9c
>  #define PCI_CLASS(class)		(class << 8)
>  #define PCIE_RC_MODE			BIT(0)
> @@ -125,6 +129,9 @@
>  
>  struct mtk_gen3_pcie;
>  
> +#define PCIE_CONF_LINK2_CTL_STS		0x10b0
> +#define PCIE_CONF_LINK2_LCR2_LINK_SPEED	GENMASK(3, 0)
> +
>  /**
>   * struct mtk_gen3_pcie_pdata - differentiate between host generations
>   * @power_up: pcie power_up callback
> @@ -160,6 +167,7 @@ struct mtk_msi_set {
>   * @phy: PHY controller block
>   * @clks: PCIe clocks
>   * @num_clks: PCIe clocks count for this port
> + * @max_link_speed: Maximum link speed (PCIe Gen) for this port
>   * @irq: PCIe controller interrupt number
>   * @saved_irq_state: IRQ enable state saved at suspend time
>   * @irq_lock: lock protecting IRQ register access
> @@ -180,6 +188,7 @@ struct mtk_gen3_pcie {
>  	struct phy *phy;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> +	u8 max_link_speed;
>  
>  	int irq;
>  	u32 saved_irq_state;
> @@ -381,11 +390,27 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	int err;
>  	u32 val;
>  
> -	/* Set as RC mode */
> +	/* Set as RC mode and set controller PCIe Gen speed restriction, if any */
>  	val = readl_relaxed(pcie->base + PCIE_SETTING_REG);
>  	val |= PCIE_RC_MODE;
> +	if (pcie->max_link_speed) {
> +		val &= ~PCIE_SETTING_GEN_SUPPORT;
> +
> +		/* Can enable link speed support only from Gen2 onwards */
> +		if (pcie->max_link_speed >= 2)
> +			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT,
> +					  GENMASK(pcie->max_link_speed - 2, 0));
> +	}
>  	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>  
> +	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
> +	if (pcie->max_link_speed) {
> +		val = readl_relaxed(pcie->base + PCIE_CONF_LINK2_CTL_STS);
> +		val &= ~PCIE_CONF_LINK2_LCR2_LINK_SPEED;
> +		val |= FIELD_PREP(PCIE_CONF_LINK2_LCR2_LINK_SPEED, pcie->max_link_speed);
> +		writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
> +	}
> +
>  	/* Set class code */
>  	val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
>  	val &= ~GENMASK(31, 8);
> @@ -1004,9 +1029,21 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  }
>  
> +static int mtk_pcie_get_controller_max_link_speed(struct mtk_gen3_pcie *pcie)
> +{
> +	u32 val;
> +	int ret;
> +
> +	val = readl_relaxed(pcie->base + PCIE_BASE_CFG_REG);
> +	val = FIELD_GET(PCIE_BASE_CFG_SPEED, val);
> +	ret = fls(val);
> +
> +	return ret > 0 ? ret : -EINVAL;
> +}
> +
>  static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  {
> -	int err;
> +	int err, max_speed;
>  
>  	err = mtk_pcie_parse_port(pcie);
>  	if (err)
> @@ -1031,6 +1068,20 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  	if (err)
>  		return err;
>  
> +	err = of_pci_get_max_link_speed(pcie->dev->of_node);
> +	if (err > 0) {
> +		/* Get the maximum speed supported by the controller */
> +		max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
> +
> +		/* Set max_link_speed only if the controller supports it */
> +		if (max_speed >= 0 && max_speed <= err) {
> +			pcie->max_link_speed = err;
> +			dev_dbg(pcie->dev,
> +				"Max controller link speed Gen%d, override to Gen%u",
> +				max_speed, pcie->max_link_speed);
> +		}
> +	}
> +
>  	/* Try link up */
>  	err = mtk_pcie_startup_port(pcie);
>  	if (err)
> -- 
> 2.46.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

