Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285A6CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=G9JGYCLJsF+BLi/SI6+OXf4bMU+ZaaqG71/F1DzpQ7Y=; b=L0N8pJ6rylSQ8J
	61hVmK++CeOz/1AE7BJ//I9HNnHwXZsqMQirSUC5DWhGCTYyxZ6IlpTnfV3A8f1LVswIuP9p//Avw
	mqcTd94AN3qQq++1dCknCOMUQwvxrQ907Uj5TcaO88cTTxYsL52zJ/Z9XqdAR7jTCrAxLsLIwENcU
	gtz/SPcjctwNYA/FQoT0MYIlV1OvY/FFTHgb9vfr51Xtrai6btAQhKC68BMurFNvDtdHHuUzqLtfq
	ICH4IDL4LEbMnLj8RJfLmIXrPz6PtgCBqSKhbnJAPSQRNKHzKBl8+PFhCn5EmdVzZHmy2UAmK3QaB
	PBACjDQ4NotzGIW5VBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmbM-000000006Re-0j7b;
	Mon, 23 Sep 2024 17:11:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmaD-000000006Nh-1OxJ;
	Mon, 23 Sep 2024 17:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 160635C42A1;
	Mon, 23 Sep 2024 17:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAF4C4CEC4;
	Mon, 23 Sep 2024 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727111443;
	bh=ERL1mF7EifE8Btv5ZllVfGqAXg7eda+uXs6jOm6xI4c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=k+zpBNoWwL1UaXRyVPe3bA+peFdHQ6shIBOEnqufaDmEx37SI4K2MahdzJxgyqPLJ
	 UiyM3xlhk/JjTIOYHOAmhuNbYGIVDIMHwEmo9J+PsmJIMQGPegO0I8+DwB/nF749ar
	 4spbjxYlStgCBaBgMY8EFlhHyfPAm4eX3OI7S8MFvpQmUD5dr9NOOkkN+XzvCTiy8L
	 8xU0d8/25IpycmP/AVYkf6qbn9SZPNdYxFQgNcHkco+DIRt+U5g6ks5lM8nn0/eflU
	 bOeQyagxlfPAtUGwKDa4cxWrydYP1C8X4tf6cZPF1blByhxRywzuaihi74Zs1r1oFR
	 +bH/9Sa+rHibA==
Date: Mon, 23 Sep 2024 12:10:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Avoid PCIe resetting for Airoha
 EN7581 SoC
Message-ID: <20240923171041.GA1158802@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_101045_556742_220284B6 
X-CRM114-Status: GOOD (  26.21  )
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

On Fri, Sep 20, 2024 at 10:26:28AM +0200, Lorenzo Bianconi wrote:
> The PCIe controller available on the EN7581 SoC does not support reset
> via the following lines:
> - PCIE_MAC_RSTB
> - PCIE_PHY_RSTB
> - PCIE_BRG_RSTB
> - PCIE_PE_RSTB
> 
> Introduce the reset callback in order to avoid resetting the PCIe port
> for Airoha EN7581 SoC.
> 
> Tested-by: Hui Ma <hui.ma@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 44 ++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 5c19abac74e8..9cea67e92d98 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -128,10 +128,12 @@ struct mtk_gen3_pcie;
>  /**
>   * struct mtk_gen3_pcie_pdata - differentiate between host generations
>   * @power_up: pcie power_up callback
> + * @reset: pcie reset callback
>   * @phy_resets: phy reset lines SoC data.
>   */
>  struct mtk_gen3_pcie_pdata {
>  	int (*power_up)(struct mtk_gen3_pcie *pcie);
> +	void (*reset)(struct mtk_gen3_pcie *pcie);
>  	struct {
>  		const char *id[MAX_NUM_PHY_RESETS];
>  		int num_resets;
> @@ -373,6 +375,28 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie *pcie)
>  	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
>  }
>  
> +static void mtk_pcie_reset(struct mtk_gen3_pcie *pcie)
> +{
> +	u32 val;
> +
> +	/* Assert all reset signals */
> +	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> +	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> +	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +
> +	/*
> +	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> +	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> +	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> +	 * for the power and clock to become stable.
> +	 */
> +	msleep(100);

I see you're just moving this, but it's a good chance to use
PCIE_T_PVPERL_MS.

> +
> +	/* De-assert reset signals */
> +	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
> +	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +}
> +
>  static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  {
>  	struct resource_entry *entry;
> @@ -402,22 +426,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
>  	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
>  
> -	/* Assert all reset signals */
> -	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> -	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> -
> -	/*
> -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> -	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> -	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> -	 * for the power and clock to become stable.
> -	 */
> -	msleep(100);
> -
> -	/* De-assert reset signals */
> -	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
> -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +	/* Reset the PCIe port if requested by the hw */

I don't see any real "request" from the hardware.  IIUC, this is more
like "assert reset if this hardware supports it".

> +	if (pcie->soc->reset)
> +		pcie->soc->reset(pcie);
>  
>  	/* Check if the link is up or not */
>  	err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
> @@ -1207,6 +1218,7 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
>  
>  static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
>  	.power_up = mtk_pcie_power_up,
> +	.reset = mtk_pcie_reset,
>  	.phy_resets = {
>  		.id[0] = "phy",
>  		.num_resets = 1,
> 
> ---
> base-commit: f2024903cb387971abdbc6398a430e735a9b394c
> change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
> 
> Best regards,
> -- 
> Lorenzo Bianconi <lorenzo@kernel.org>
> 

