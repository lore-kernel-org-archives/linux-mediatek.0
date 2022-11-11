Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2986C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jel38J1a9uL1OPaQKUSp38nO5k1Zrs1cWfc+j0Y3MDg=; b=vwkeDFCxi+08vs0gXZt4sg0VKY
	o9OdgDXbuh+NdjVj3nBfbqeFvO2Q654mjnLn7DTyTJoNZiFKFi1Dj0IDQ2Jfd4EA+Nf7jThRP5F2p
	aAO+KXLDWe1vuL+5YvMQ6RfHGuFcLrmB3a9Y1AhpqmjGvnb1QrVa5FGM4lxB11AaRJIcEm2pPVVXl
	LrvWRjuYFmHTkk3hCsMoSbR9YsQM+Z8RMRZLqa+BCrwmhuAzcDV2efdx1SqZ6IfzDHaJV6p2FR4NF
	8OHsbcd+In2YdxhvodKG6RRdcSClv+0i9P8IQVQWIJdz9rbzP40d1D4FwQmUOys2d7awnxmD/Mfwx
	f+G48vFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPhg-00EJb9-7A; Fri, 11 Nov 2022 08:48:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPhc-00EJXL-GL; Fri, 11 Nov 2022 08:47:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id y16so5538448wrt.12;
        Fri, 11 Nov 2022 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jel38J1a9uL1OPaQKUSp38nO5k1Zrs1cWfc+j0Y3MDg=;
        b=Fm7G0bOk0tvTIcN5yeEQS5af4MwHmAmvhaSXVhGM7Wc2pa2bz5xYMqreRxOOFa4XEe
         gx7SDj+1vBsqz6MYun8KjivOWx0jwMx1wBaaf3AsKKaJCbhvgt33WGghHf5wp45KVhci
         0k7iqo4XI25XnD76+iHBUTgtjLt4s0unzaWRdGZNHauSkOpmOPFUNy2jPN2/nvpdzT2Y
         Hvgj9lfjlUm/lG0LYdZ/N3vsBP+HGxVnxTwREE9WD19i5l6Ci57UC3BUnuZKhkL9xIxL
         tbciCHUYQV9rW486W4HmNoMdSwqqsaxU2hYrj0L9t+0GnYFXEMwEIetM2Ri2liF019Jg
         9TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jel38J1a9uL1OPaQKUSp38nO5k1Zrs1cWfc+j0Y3MDg=;
        b=hIvFXy0LU0XgduFlUKuXIPZrTP2MoxbqYZD62AhdqsgoEAXsmrsw8eAWewZXzlcsC3
         XwJjcA7xUSAa1LmeZ1ZaU5nH7amzf04fSp76SQBS7ckI6Jo6V1raea/rLhthr5cH4wQN
         f3rLEgAen6qer/FyVHr+n3tUs4XLMcc6mcRaMX2edG6sMIWst73259bi8ozzycZy35cD
         QPK6cuZmtN3zPX6kjakwznMh2Wwvsg+aKx1h1/R7FB9E+Z3gWVC8+YwlclpnMxRx/gnR
         dkQ4uvKWUlt8oNiWWxXnKTDpnFM7lrQzeApchIbkYcbggF7bGd2U3O8odzLts3xAB/Qv
         kvYA==
X-Gm-Message-State: ANoB5plwHsx/naIHwAS9fcvKUb7nuYU6aVyYojar7V62RaSbYZrbNrk0
	gWroCDKWdEiU4ob+aNk8YDE=
X-Google-Smtp-Source: AA0mqf5jHGLCbHg6kRQS6wlZ8SNwRCkkqeGaAsG2XNoT6746K/UtemlW/nWekvFCpiGrr3GvyRFSxA==
X-Received: by 2002:a5d:4386:0:b0:22e:3177:1401 with SMTP id i6-20020a5d4386000000b0022e31771401mr594871wrq.148.1668156472076;
        Fri, 11 Nov 2022 00:47:52 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q189-20020a1c43c6000000b003cf483ee8e0sm8043194wma.24.2022.11.11.00.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:47:49 -0800 (PST)
Message-ID: <50a2022c-d535-1162-e1b5-ae6b6e7bbd32@gmail.com>
Date: Fri, 11 Nov 2022 09:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 2/3] arm64: dts: mt8195: Add pcie and pcie phy nodes
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221103025656.8714-1-tinghan.shen@mediatek.com>
 <20221103025656.8714-3-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221103025656.8714-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_004756_594743_6E0ED3C7 
X-CRM114-Status: GOOD (  16.15  )
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



On 03/11/2022 03:56, Tinghan Shen wrote:
> Add pcie and pcie phy nodes for mt8195.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 150 +++++++++++++++++++++++
>   1 file changed, 150 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..7d74a5211091 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>   #include <dt-bindings/power/mt8195-power.h>
> +#include <dt-bindings/reset/mt8195-resets.h>
>   
>   / {
>   	compatible = "mediatek,mt8195";
> @@ -1182,6 +1183,110 @@
>   			status = "disabled";
>   		};
>   
> +		pcie0: pcie@112f0000 {
> +			compatible = "mediatek,mt8195-pcie",
> +				     "mediatek,mt8192-pcie";
> +			device_type = "pci";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			reg = <0 0x112f0000 0 0x4000>;
> +			reg-names = "pcie-mac";
> +			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>;
> +			bus-range = <0x00 0xff>;
> +			ranges = <0x81000000 0 0x20000000
> +				  0x0 0x20000000 0 0x200000>,
> +				 <0x82000000 0 0x20200000
> +				  0x0 0x20200000 0 0x3e00000>;
> +
> +			iommu-map = <0 &iommu_infra IOMMU_PORT_INFRA_PCIE0 0x2>;
> +			iommu-map-mask = <0x0>;
> +
> +			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P0>,
> +				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_26M>,
> +				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
> +				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_32K>,
> +				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
> +				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
> +			clock-names = "pl_250m", "tl_26m", "tl_96m",
> +				      "tl_32k", "peri_26m", "peri_mem";
> +			assigned-clocks = <&topckgen CLK_TOP_TL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4_D4>;
> +
> +			phys = <&pciephy>;
> +			phy-names = "pcie-phy";
> +
> +			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
> +
> +			resets = <&infracfg_ao MT8195_INFRA_RST2_PCIE_P0_SWRST>;
> +			reset-names = "mac";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +					<0 0 0 2 &pcie_intc0 1>,
> +					<0 0 0 3 &pcie_intc0 2>,
> +					<0 0 0 4 &pcie_intc0 3>;
> +			status = "disabled";
> +
> +			pcie_intc0: interrupt-controller {
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		pcie1: pcie@112f8000 {
> +			compatible = "mediatek,mt8195-pcie",
> +				     "mediatek,mt8192-pcie";
> +			device_type = "pci";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			reg = <0 0x112f8000 0 0x4000>;
> +			reg-names = "pcie-mac";
> +			interrupts = <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>;
> +			bus-range = <0x00 0xff>;
> +			ranges = <0x81000000 0 0x24000000
> +				  0x0 0x24000000 0 0x200000>,
> +				 <0x82000000 0 0x24200000
> +				  0x0 0x24200000 0 0x3e00000>;
> +
> +			iommu-map = <0 &iommu_infra IOMMU_PORT_INFRA_PCIE1 0x2>;
> +			iommu-map-mask = <0x0>;
> +
> +			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P1>,
> +				 <&clk26m>,
> +				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
> +				 <&clk26m>,
> +				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
> +				 /* Designer has connect pcie1 with peri_mem_p0 clock */
> +				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
> +			clock-names = "pl_250m", "tl_26m", "tl_96m",
> +				      "tl_32k", "peri_26m", "peri_mem";
> +			assigned-clocks = <&topckgen CLK_TOP_TL_P1>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4_D4>;
> +
> +			phys = <&u3port1 PHY_TYPE_PCIE>;
> +			phy-names = "pcie-phy";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
> +
> +			resets = <&infracfg_ao MT8195_INFRA_RST2_PCIE_P1_SWRST>;
> +			reset-names = "mac";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
> +					<0 0 0 2 &pcie_intc1 1>,
> +					<0 0 0 3 &pcie_intc1 2>,
> +					<0 0 0 4 &pcie_intc1 3>;
> +			status = "disabled";
> +
> +			pcie_intc1: interrupt-controller {
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
>   		nor_flash: spi@1132c000 {
>   			compatible = "mediatek,mt8195-nor",
>   				     "mediatek,mt8173-nor";
> @@ -1241,6 +1346,34 @@
>   				reg = <0x189 0x2>;
>   				bits = <7 5>;
>   			};
> +			pciephy_rx_ln1: pciephy-rx-ln1@190,1 {
> +				reg = <0x190 0x1>;
> +				bits = <0 4>;
> +			};
> +			pciephy_tx_ln1_nmos: pciephy-tx-ln1-nmos@190,2 {
> +				reg = <0x190 0x1>;
> +				bits = <4 4>;
> +			};
> +			pciephy_tx_ln1_pmos: pciephy-tx-ln1-pmos@191,1 {
> +				reg = <0x191 0x1>;
> +				bits = <0 4>;
> +			};
> +			pciephy_rx_ln0: pciephy-rx-ln0@191,2 {
> +				reg = <0x191 0x1>;
> +				bits = <4 4>;
> +			};
> +			pciephy_tx_ln0_nmos: pciephy-tx-ln0-nmos@192,1 {
> +				reg = <0x192 0x1>;
> +				bits = <0 4>;
> +			};
> +			pciephy_tx_ln0_pmos: pciephy-tx-ln0-pmos@192,2 {
> +				reg = <0x192 0x1>;
> +				bits = <4 4>;
> +			};
> +			pciephy_glb_intr: pciephy-glb-intr@193 {
> +				reg = <0x193 0x1>;
> +				bits = <0 4>;
> +			};
>   		};
>   
>   		u3phy2: t-phy@11c40000 {
> @@ -1461,6 +1594,23 @@
>   			};
>   		};
>   
> +		pciephy: phy@11e80000 {
> +			compatible = "mediatek,mt8195-pcie-phy";
> +			reg = <0 0x11e80000 0 0x10000>;
> +			reg-names = "sif";
> +			nvmem-cells = <&pciephy_glb_intr>, <&pciephy_tx_ln0_pmos>,
> +				      <&pciephy_tx_ln0_nmos>, <&pciephy_rx_ln0>,
> +				      <&pciephy_tx_ln1_pmos>, <&pciephy_tx_ln1_nmos>,
> +				      <&pciephy_rx_ln1>;
> +			nvmem-cell-names = "glb_intr", "tx_ln0_pmos",
> +					   "tx_ln0_nmos", "rx_ln0",
> +					   "tx_ln1_pmos", "tx_ln1_nmos",
> +					   "rx_ln1";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_PHY>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		ufsphy: ufs-phy@11fa0000 {
>   			compatible = "mediatek,mt8195-ufsphy", "mediatek,mt8183-ufsphy";
>   			reg = <0 0x11fa0000 0 0xc000>;

