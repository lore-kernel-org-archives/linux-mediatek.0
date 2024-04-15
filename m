Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA95C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPj4rLysv35v3FL1gMmXj+/1SunsuGYRd2PK27endCY=; b=fTSGmz69ox1gc1MEAzC2MTuE1E
	EHDfRiYv9mBQWWvPv2ITCUz/435ysgcctit/dcK76YjUzwOTCLljwhG9dvRVlyS569sjHwIEGSgOL
	OP1SNa0/RZbHHAlAB89LCgVqIFxRQZuMAxNeko771nLaKcSbJ6DQ2GywCHkrPItDzjJryyJcLyOMm
	ieIRe9VpvkK2WaE9U4cDli25OMjzzJggoj04Jk1k9WAbpMVo/w1yC4hcGGX8cQoZZG2kzbeayrEiu
	GkJ0IdxCKQCde7JeUzT987SKZW9w+tX0CZy7IFzgE27SGiUwBQcERFt/jA0huAbrW2KI5ktY2/Dd9
	YcoAfCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIA5-00000007dCE-0I30;
	Mon, 15 Apr 2024 08:58:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIA0-00000007dBM-1X0E;
	Mon, 15 Apr 2024 08:57:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D38C2F;
	Mon, 15 Apr 2024 01:58:22 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E68D3F64C;
	Mon, 15 Apr 2024 01:57:48 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:57:45 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>,
	Antoine Tenart <atenart@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
Message-ID: <ZhzsCYu4PEYaQFaF@bogus>
References: <20240412222857.3873079-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412222857.3873079-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_015756_583410_08FAC051 
X-CRM114-Status: GOOD (  16.26  )
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

On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> The "arm,armv8-pmuv3" compatible is intended only for s/w models. Primarily,
> it doesn't provide any detail on uarch specific events.
> 
> There's still remaining cases for CPUs without any corresponding PMU
> definition and for big.LITTLE systems which only have a single PMU node
> (there should be one per core type).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> SoC Maintainers, Can you please apply this directly.
> ---
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi              | 4 ++--
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi    | 2 +-
>  arch/arm64/boot/dts/amazon/alpine-v2.dtsi            | 2 +-
>  arch/arm64/boot/dts/apm/apm-storm.dtsi               | 2 +-
>  arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts | 2 +-
>  arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi     | 2 +-
>  arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi  | 2 +-
>  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi         | 2 +-
>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi        | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi       | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi       | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi       | 7 +++++++
>  arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi       | 7 +++++++
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi       | 5 -----
>  arch/arm64/boot/dts/freescale/imx8dxl.dtsi           | 2 +-
>  arch/arm64/boot/dts/intel/keembay-soc.dtsi           | 2 +-
>  arch/arm64/boot/dts/intel/socfpga_agilex.dtsi        | 2 +-
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi        | 2 +-
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi         | 2 +-
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi             | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 2 +-
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
>  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
>  arch/arm64/boot/dts/realtek/rtd16xx.dtsi             | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi             | 2 +-
>  arch/arm64/boot/dts/sprd/sc9860.dtsi                 | 2 +-
>  arch/arm64/boot/dts/sprd/sc9863a.dtsi                | 2 +-
>  arch/arm64/boot/dts/synaptics/berlin4ct.dtsi         | 2 +-
>  arch/arm64/boot/dts/tesla/fsd.dtsi                   | 2 +-
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi               | 2 +-
>  32 files changed, 44 insertions(+), 35 deletions(-)
>

[...]

> diff --git a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> index 8db4243a4947..9115c99d0dc0 100644
> --- a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> +++ b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> @@ -102,7 +102,7 @@ timer {
>  	};
>
>  	pmu {
> -		compatible = "arm,armv8-pmuv3";
> +		compatible = "arm,cortex-a53-pmu";
>  		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>  	};

(For vexpress related change)

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

