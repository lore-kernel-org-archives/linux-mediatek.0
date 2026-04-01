Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C0AD35177
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQBDnJoVhLwcKafuIZRk96w4yQeYQ1vq8BsBfxQ3u2s=; b=PrZGKqERO7rnwSMBoNtNv83hPo
	160QruvdvU4o4xfxIrRCcjMLsGIMdgvEHyfT2LO9OQRhu+gtenjcfPsikGwZNOjgR8nW/GHM0wGPq
	4ERhFTqZLFAbp+wvvDYuVBd8+4UWhAkZHZAqNyyeDtb/T+UUBgEF0pDHGzCWDazqi2hSk+eSxICiy
	Wb1niJIIP8wwf+OhPd29wgOyUOvJR4q2kajkeMCnRfRWZSaOtRYShpC5nNdqgvv15rZJSiROTP4S+
	Uhyfi2NAVFJxkgATf2aq+NExAaHQ1XFvLLjNYM/WxkuyEtC8IfTS8IDJSjlpuS28nM81FRHkA6y2m
	/hAU5ydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uoR-0000000FBe2-0uy0;
	Wed, 01 Apr 2026 12:36:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uXm-0000000EyoK-1re7
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 12:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E64CF4097B;
	Wed,  1 Apr 2026 12:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4DFC4CEF7;
	Wed,  1 Apr 2026 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775045972;
	bh=U2chIgld3ec2AzP0+woeUhBzxiB30kpsbfVXjgxQpnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozbrvJxp1hCEaO+OqA5RSPyS6ivh97M810FcogJ+qweaHIHH54EX+tW49zBBsA9vp
	 yWFLVaSdVmQPXvJNbHGgcnDHV3Aur16AuZMvik4VkjuT4l85I8iJPOEno7tjEfKKZg
	 ARXfcovEr6/xoL2GuM0H1DES1eCiRg6229ab0ckBJDZTh54JANl4PpXIFklNjUvoBZ
	 unV3ilMoL5eu5X9jj1h2CwfkKUkcCXCcojPlNnT/mg59JvoPCu5lw4jlXOeuwArL4E
	 1eTjDB/OR1cBpa8TqM2sXI9BSnBf2BFtdzI3uFakdcNa9RnciAEdgcOOkKh7v0QvgY
	 rD1pgPN658YBg==
Date: Wed, 1 Apr 2026 17:49:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jian Yang <jian.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, chuanjia.liu@mediatek.com, yonglong.wu@mediatek.com
Subject: Re: [PATCH v1] PCI: mediatek-gen3: Align PERST# sequence with PCIe
 CEM specification
Message-ID: <x6nabkumov75khx4icgibrmd4o3oz5drm3cfthh6j2himsihla@echprgpjanoq>
References: <20260401031917.9108-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401031917.9108-1-jian.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_051934_538192_0420607C 
X-CRM114-Status: GOOD (  26.50  )
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

On Wed, Apr 01, 2026 at 11:16:42AM +0800, Jian Yang wrote:
> Fix the control sequence of PERST# during system bootup/shutdown to
> meet the requirement from PCIe CEM specification. There are two major
> changes in this patch:
> 

You are fixing multiple issues in one patch, which is not acceptable.

> 1. Some of MediaTek's chip will stop generating REFCLK if the
> PCIE_PHY_RSTB signal of PCIe controller is asserted. We have to
> adjust the startup sequence as follows to ensure that PERST# will be
> de-asserted after the REFCLK is stable:
> Assert PHY reset and PERST# -> delay 10ms -> De-assert PHY reset ->
> delay 100ms -> De-assert PERST#
> 

This issue is separate and not related to the below two issues.

> 2. Add 'shutdown' callback to control the timing of PERST# and power
> during the system shutdown phase, ensuring that PERST# is active
> before the power on connector is removed.
> 

Adding 'shutdown()' callback should belong to a separate patch with its own
motivation.

> Signed-off-by: Jian Yang <jian.yang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 39 +++++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index a94fdbaf47fe..66d177918565 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -62,6 +62,7 @@
>  #define PCIE_PHY_RSTB			BIT(1)
>  #define PCIE_BRG_RSTB			BIT(2)
>  #define PCIE_PE_RSTB			BIT(3)
> +#define PCIE_BRG_RST_RDY_MS		10
>  
>  #define PCIE_LTSSM_STATUS_REG		0x150
>  #define PCIE_LTSSM_STATE_MASK		GENMASK(28, 24)
> @@ -133,6 +134,7 @@
>  #define MAX_NUM_PHY_RESETS		3
>  
>  #define PCIE_MTK_RESET_TIME_US		10
> +#define PCIE_MTK_PDN_PERST_TIME_MS	5
>  
>  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
>  #define PCIE_EN7581_RESET_TIME_MS	100
> @@ -430,6 +432,21 @@ static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
>  		return err;
>  	}
>  
> +	/*
> +	 * Some of MediaTek's chips won't output REFCLK when PCIE_PHY_RSTB is
> +	 * asserted, we have to de-assert MAC & PHY & BRG reset signals first
> +	 * to allow the REFCLK to be stable. While PCIE_BRG_RSTB is asserted,
> +	 * there is a short period during which the PCIe internal register
> +	 * cannot be accessed, so we need to wait 10ms here.
> +	 */
> +	msleep(PCIE_BRG_RST_RDY_MS);
> +
> +	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> +		/* De-assert MAC, PHY and BRG reset signals */
> +		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
> +		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	}
> +
>  	/*
>  	 * Described in PCIe CEM specification revision 6.0.
>  	 *
> @@ -439,9 +456,8 @@ static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
>  	msleep(PCIE_T_PVPERL_MS);
>  
>  	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> -		/* De-assert reset signals */
> -		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> -			 PCIE_PE_RSTB);
> +		/* De-assert PERST# signal */
> +		val &= ~PCIE_PE_RSTB;
>  		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
>  	}
>  
> @@ -459,6 +475,14 @@ static void mtk_pcie_devices_power_down(struct mtk_gen3_pcie *pcie)
>  		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
>  	}
>  
> +	/*
> +	 * Described in PCIe CEM specification revision 6.0.
> +	 *
> +	 * The PERST# gose active before the power on the connector is removed.
> +	 * Wait a while to ensure the voltage transition of PERST# is completed.
> +	 */
> +	msleep(PCIE_MTK_PDN_PERST_TIME_MS);

PERST# is asserted by setting the 'PCIE_PE_RSTB' bit. So if that controls the
actual voltage transition of PERST# signal, will reading it back ensure that the
transition has been completed without waiting for an arbitrary delay?

Nevertheless, this also belongs to a separate patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

