Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABA9C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiQUrf8o+E4Z45qJJcewSiGEv/BVxpXsg/YK4Lr92zs=; b=S2REQCUWtCgx3iN/z1rQYd7/09
	7OG7oLdtaCHfiAj9SKfIeNHXjhJR0i0mn3cV1k2bGMcbFuYnvfThrqnNMwaEtIu+4ERqYRCXDP1m5
	kIgKKKp1prtzFCu027qsGo0IG4z1euBPEfPLw7c+PY5S4tI9/D7nBkLi2+QO/QYbCNYnemoPtMOpF
	gULDd9isYtXmvQNxS4uEINiAsbSFXMFAnJk330qES3sTvKe4rUo1nze02LPIHMTUa3xhixh+vK5m0
	3yI9vXK5ctq0FZEX0X3mQ0REtwDGJm6Kpv2gIPKTIep5w5fQlqwVsufXxQi/Etine4GvPwcQ/gKYY
	AlTHMOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLeXm-0000000FwRy-1WZ5;
	Mon, 24 Jun 2024 07:55:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLeXg-0000000FwPk-2tcH;
	Mon, 24 Jun 2024 07:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719215711;
	bh=UZ48f2dq1hVCb6YM9WT+jFPJEK1haWtngJCNK6x2nII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sj5d3Msl2DDt6hajTlr44EcKJZXS6diHURvjbMV5U/Z+jzeuplGrjayw0EOGyFVb0
	 Loou148vBngw7vhHsrq7MkBSiEvNi2W7bi1ZB2P8M3482Qao5VSk3dr/4t4nvc65YT
	 jayR49RaQIhTs8DdB8zTRaPzkDO422TvzLeDzRU2nc+p3CS3gaJOTK+RB/kygf0s8l
	 vdw832NJUCL7Slq046I9C2XZh6Yj/e0XMnOG4PjJBwoqMNPSeuCN6AtkmOECLWTozm
	 42Axeb0l7DQmGiPM4SEBDcK1xpQPGhIiQBraQfv0rmhSzLcuOg3E7ojJMr7pcd+Txj
	 o6jST4FpIOyQg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3E4F8378216A;
	Mon, 24 Jun 2024 07:55:10 +0000 (UTC)
Message-ID: <ec72c451-4d80-43a9-b469-726a6da29852@collabora.com>
Date: Mon, 24 Jun 2024 09:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
 robh@kernel.org, bhelgaas@google.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, nbd@nbd.name,
 dd@embedd.com, upstream@airoha.com
References: <cover.1718980864.git.lorenzo@kernel.org>
 <f044eb44654522801d4a93e94918a32c72c4c49f.1718980864.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f044eb44654522801d4a93e94918a32c72c4c49f.1718980864.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_005513_044800_057842A1 
X-CRM114-Status: GOOD (  19.87  )
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

Il 21/06/24 16:48, Lorenzo Bianconi ha scritto:
> Introduce support for Airoha EN7581 pcie controller to mediatek-gen3
> pcie controller driver.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/pci/controller/Kconfig              |  2 +-
>   drivers/pci/controller/pcie-mediatek-gen3.c | 84 ++++++++++++++++++++-
>   2 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index e534c02ee34f..3bd6c9430010 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -196,7 +196,7 @@ config PCIE_MEDIATEK
>   
>   config PCIE_MEDIATEK_GEN3
>   	tristate "MediaTek Gen3 PCIe controller"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
>   	depends on PCI_MSI
>   	help
>   	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 9842617795a9..2dacfed665c6 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>   #include <linux/delay.h>
>   #include <linux/iopoll.h>
>   #include <linux/irq.h>
> @@ -21,6 +22,8 @@
>   #include <linux/pm_domain.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/reset.h>
> +#include <linux/of_pci.h>
> +#include <linux/of_device.h>
>   
>   #include "../pci.h"
>   
> @@ -29,6 +32,7 @@
>   #define PCI_CLASS(class)		(class << 8)
>   #define PCIE_RC_MODE			BIT(0)
>   
> +#define PCIE_EQ_PRESET_01_REF		0x100
>   #define PCIE_CFGNUM_REG			0x140
>   #define PCIE_CFG_DEVFN(devfn)		((devfn) & GENMASK(7, 0))
>   #define PCIE_CFG_BUS(bus)		(((bus) << 8) & GENMASK(15, 8))
> @@ -68,6 +72,7 @@
>   #define PCIE_MSI_SET_ENABLE_REG		0x190
>   #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
>   
> +#define PCIE_PIPE4_PIE8_REG		0x338
>   #define PCIE_MSI_SET_BASE_REG		0xc00
>   #define PCIE_MSI_SET_OFFSET		0x10
>   #define PCIE_MSI_SET_STATUS_OFFSET	0x04
> @@ -100,7 +105,7 @@
>   #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
>   #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
>   
> -#define MAX_NUM_PHY_RSTS		1
> +#define MAX_NUM_PHY_RSTS		3
>   
>   struct mtk_gen3_pcie;
>   
> @@ -848,6 +853,72 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
>   	return 0;
>   }
>   
> +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> +{
> +	struct device *dev = pcie->dev;
> +	int err;
> +
> +	writel_relaxed(0x23020133, pcie->base + 0x10044);
> +	writel_relaxed(0x50500032, pcie->base + 0x15030);
> +	writel_relaxed(0x50500032, pcie->base + 0x15130);

Can anyone from MediaTek/Airoha help to identify those registers and the layout so
that we can avoid using magic numbers around?

Please.

Regards,
Angelo

> +
> +	err = phy_init(pcie->phy);
> +	if (err) {
> +		dev_err(dev, "failed to initialize PHY\n");
> +		return err;
> +	}
> +	mdelay(30);
> +
> +	err = phy_power_on(pcie->phy);
> +	if (err) {
> +		dev_err(dev, "failed to power on PHY\n");
> +		goto err_phy_on;
> +	}
> +
> +	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_rsts,
> +					  pcie->phy_resets);
> +	if (err) {
> +		dev_err(dev, "failed to deassert PHYs\n");
> +		goto err_phy_deassert;
> +	}
> +	usleep_range(5000, 10000);
> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +
> +	err = clk_bulk_prepare(pcie->num_clks, pcie->clks);
> +	if (err) {
> +		dev_err(dev, "failed to prepare clock\n");
> +		goto err_clk_prepare;
> +	}
> +
> +	writel_relaxed(0x41474147, pcie->base + PCIE_EQ_PRESET_01_REF);
> +	writel_relaxed(0x1018020f, pcie->base + PCIE_PIPE4_PIE8_REG);
> +	mdelay(10);
> +
> +	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
> +	if (err) {
> +		dev_err(dev, "failed to prepare clock\n");
> +		goto err_clk_enable;
> +	}
> +
> +	return 0;
> +
> +err_clk_enable:
> +	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
> +err_clk_prepare:
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
> +				  pcie->phy_resets);
> +err_phy_deassert:
> +	phy_power_off(pcie->phy);
> +err_phy_on:
> +	phy_exit(pcie->phy);
> +
> +	return err;
> +}
> +
>   static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
>   {
>   	struct device *dev = pcie->dev;
> @@ -1117,8 +1188,19 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt8192 = {
>   	},
>   };
>   
> +static const struct mtk_pcie_soc mtk_pcie_soc_en7581 = {
> +	.power_up = mtk_pcie_en7581_power_up,
> +	.phy_resets = {
> +		.id[0] = "phy-lane0",
> +		.id[1] = "phy-lane1",
> +		.id[2] = "phy-lane2",
> +		.num_rsts = 3,
> +	},
> +};
> +
>   static const struct of_device_id mtk_pcie_of_match[] = {
>   	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
> +	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);




