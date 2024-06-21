Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B717EC27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YRzhstaseY2ifdUr0FgOkk8cSDBL49ID1iiWNURns4k=; b=Ko7KFXnQyFwWMT
	6CiS4NnTbFeceH5+8LolsvBW4lcH3nsmBqaFVG/EKXjg8u36vwqLqBpYXgwO6weESxnlldse0wDsv
	mWm8xUPH/POlxJHuDCOYTMCWjS7VyT5abGOIek3ZZxE+o1YjK9t7PD9SqhyjyK0c5AImUa8+X8gN0
	VKD7mtiaR37GO2duWgXnvR5bYlAsYQSz1EGa/XwyZ540/t1ccMFycvlBAw8UGk/eU0ZgTkFXg59ea
	POROZ2illDLBevX5uZZ61Ac55iS08C+Popf6OBN67ZXrKEySiYA9UW0LrAe3WAJoAl4Pf7Odlq+J7
	k43YAG2SMi1quQpiA6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKibF-0000000AAeS-0qAe;
	Fri, 21 Jun 2024 18:03:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKib9-0000000AAda-3gCh;
	Fri, 21 Jun 2024 18:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F725CE2F7C;
	Fri, 21 Jun 2024 18:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE25C2BBFC;
	Fri, 21 Jun 2024 18:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718992972;
	bh=0qSdXM3yj/mMwv7tZU9uHYRGL9WyAMjg+G7TZPlR4z8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Qq7ZIiTCUXUjx6tAnvbup/wd+ARGZYKZwP/9FG8IhaWWxMX6jsbVx1VUkmckzybp5
	 ROYebHd67CcWXkmzBQw6GiOMeyG/qOuQGV+SIZ7XFFe/VXLX3VC41C/10XduzTJpMZ
	 iZFtHDsDiBVszdza8a1xyhljWd+XdR3ckgpq72UsGu7ZVkmPdLBWOmANXCv0a2UeJS
	 2AzkHpsB45ZoXIqlhsDhE6+6ycKtlz22yi1jik46Qx6k7DGFdDBozh3oXsoXrHjtVA
	 kV2si6OrvneBeEx2JKnIyT9HSsATrWLxMjaavXF8V4NY4irzBGsx/NUOFmE2jwBpF9
	 wZcI3Sf1DlDQQ==
Date: Fri, 21 Jun 2024 13:02:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <20240621180250.GA1396831@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f044eb44654522801d4a93e94918a32c72c4c49f.1718980864.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_110256_437858_A2820CE3 
X-CRM114-Status: GOOD (  18.49  )
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

On Fri, Jun 21, 2024 at 04:48:50PM +0200, Lorenzo Bianconi wrote:
> Introduce support for Airoha EN7581 pcie controller to mediatek-gen3
> pcie controller driver.

s/pcie/PCIe/ (twice)

> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/Kconfig              |  2 +-
>  drivers/pci/controller/pcie-mediatek-gen3.c | 84 ++++++++++++++++++++-
>  2 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index e534c02ee34f..3bd6c9430010 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -196,7 +196,7 @@ config PCIE_MEDIATEK
>  
>  config PCIE_MEDIATEK_GEN3
>  	tristate "MediaTek Gen3 PCIe controller"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
>  	depends on PCI_MSI
>  	help
>  	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 9842617795a9..2dacfed665c6 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/iopoll.h>
>  #include <linux/irq.h>
> @@ -21,6 +22,8 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> +#include <linux/of_pci.h>
> +#include <linux/of_device.h>

Existing list of includes is sorted.  Preserve that sorted order.

> +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> +{
> +	struct device *dev = pcie->dev;
> +	int err;
> +
> +	writel_relaxed(0x23020133, pcie->base + 0x10044);
> +	writel_relaxed(0x50500032, pcie->base + 0x15030);
> +	writel_relaxed(0x50500032, pcie->base + 0x15130);

Magic.  Needs #defines at least for the registers.  These offsets are
HUGE, far bigger than the existing offsets:

  #define PCIE_CFGNUM_REG                 0x140
  #define PCIE_CFG_OFFSET_ADDR            0x1000
  #define PCIE_TRANS_TABLE_BASE_REG       0x800
  #define PCIE_MSI_SET_BASE_REG           0xc00
  #define PCIE_MSI_SET_ADDR_HI_BASE       0xc80
  #define PCIE_MSI_SET_ENABLE_REG         0x190
  #define PCIE_INT_ENABLE_REG             0x180
  #define PCIE_SETTING_REG                0x80
  #define PCIE_PCI_IDS_1                  0x9c
  #define PCIE_MISC_CTRL_REG              0x348
  #define PCIE_RST_CTRL_REG               0x148
  #define PCIE_LINK_STATUS_REG            0x154
  #define PCIE_LTSSM_STATUS_REG           0x150
  #define PCIE_INT_STATUS_REG             0x184

> +	err = phy_init(pcie->phy);
> +	if (err) {
> +		dev_err(dev, "failed to initialize PHY\n");
> +		return err;
> +	}
> +	mdelay(30);

Source?  Cite the spec that requires this delay and add a #define if
possible.

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

Source?

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

Source?

