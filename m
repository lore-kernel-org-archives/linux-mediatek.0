Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5BCCF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 09:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCzLuOcme9U2o1KqHq1c0hgXllBvyJ5BADQSp+Pqu9U=; b=mHI0YKeur2k8zHgZfsSD9ouJ2+
	9KHSreBffSQJqI2BhgZJyewC/UXxNihfJMT/pJiDy0NBuYAu8xCiFCGum+94iUy/H6x93RqWvhNtR
	/UYju9MxgzpNcuNgYsdrnb+t9mer8N33fI4KwQwSJPWWS86GUEV5dpjc5CpZ0FcaKQAGzr6FJCYLi
	LbFTBbe8mJE3yv9YuqhWewdLHodse73BdrgpJzB8whXcgVtfoZQn6+JthKoqLYHjKbA+Wddcxj9Kb
	oGzBcoLjSAqcwqy0hf19C9Ko37OkUxhdbWc0ivGm3gVRSRdceWk/AD6zINGDsLYbWLMD3oVaL8/4R
	TAMJgFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfap-0000000GrQu-1FxV;
	Mon, 23 Sep 2024 09:42:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfZg-0000000GrMH-161p;
	Mon, 23 Sep 2024 09:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727084502;
	bh=GRnjXSpl7frDI6cTVufd4Tb5HHjLXwrTKQEtkTBHYxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SbsPVhNG82UW0fgWeME1nVKz+9KnUBEZGROHGCQrTfFS54sPGJdiut28l3814a0zi
	 0ELjx/zvnArs3teaxH4zZzlVV11968VV4B5GIJi3wOaWBb6Hjc3y1kBCfELbFsiMvi
	 FX8ZNZrareec+lPJ6E4X5gz7pdZRp+TAiHXlGXxM5IxL8K5SAu/m12aStqXRkEWy09
	 B0XV7VK3/xwVF5kTioR1kx7ebmIdolLKTLtobssQypHNQZJgaYJGj/XWDgzYjp4C1H
	 dx5uaX4k8UvWgW/lTvKNT7EhULas+6uiGcPT4NOrao5sXK9+z2OpJFp+m4dgO1a5CT
	 SJLmSZ7rYUgeQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2B0A17E10AA;
	Mon, 23 Sep 2024 11:41:41 +0200 (CEST)
Message-ID: <d8941149-9125-4fe2-a1c0-ab29223a0c87@collabora.com>
Date: Mon, 23 Sep 2024 11:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: mediatek-gen3: Avoid PCIe resetting for Airoha
 EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com, Hui Ma <hui.ma@airoha.com>
References: <20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_024144_517568_E33996EF 
X-CRM114-Status: GOOD (  21.96  )
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

Il 20/09/24 10:26, Lorenzo Bianconi ha scritto:
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

EN7581 doesn't support pulling up/down PERST#?!
That looks definitely odd, as that signal is part of the PCI-Express CEM spec.

Besides, there's another PERST# assertion at mtk_pcie_suspend_noirq()...

Cheers,
Angelo

> Tested-by: Hui Ma <hui.ma@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 44 ++++++++++++++++++-----------
>   1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 5c19abac74e8..9cea67e92d98 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -128,10 +128,12 @@ struct mtk_gen3_pcie;
>   /**
>    * struct mtk_gen3_pcie_pdata - differentiate between host generations
>    * @power_up: pcie power_up callback
> + * @reset: pcie reset callback
>    * @phy_resets: phy reset lines SoC data.
>    */
>   struct mtk_gen3_pcie_pdata {
>   	int (*power_up)(struct mtk_gen3_pcie *pcie);
> +	void (*reset)(struct mtk_gen3_pcie *pcie);
>   	struct {
>   		const char *id[MAX_NUM_PHY_RESETS];
>   		int num_resets;
> @@ -373,6 +375,28 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie *pcie)
>   	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
>   }
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
> +
> +	/* De-assert reset signals */
> +	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
> +	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +}
> +
>   static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>   {
>   	struct resource_entry *entry;
> @@ -402,22 +426,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>   	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
>   	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
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
> +	if (pcie->soc->reset)
> +		pcie->soc->reset(pcie);
>   
>   	/* Check if the link is up or not */
>   	err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
> @@ -1207,6 +1218,7 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
>   
>   static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
>   	.power_up = mtk_pcie_power_up,
> +	.reset = mtk_pcie_reset,
>   	.phy_resets = {
>   		.id[0] = "phy",
>   		.num_resets = 1,
> 
> ---
> base-commit: f2024903cb387971abdbc6398a430e735a9b394c
> change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
> 
> Best regards,


