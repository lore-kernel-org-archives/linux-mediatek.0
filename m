Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F6FECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxIEq9m0EQYk/vbVXTdB3Pf3Pp9w9XGKNGxCVCe5fs8=; b=A87ABuu9Sy4MILNooScjW8kEU+
	9VFXGklyjYUeAN9KpsDMWvpFHRnNlxvF1SdG+OYl+i0VYvN7/VSLFTJiheZLuSdrwCILfGa3GBejo
	+1V/hrIB2BhMGFQBe11z5OroKkx24W2vExtYUXpvk2N082239aOBDzsQbUkD527zpA8govKlFI4G7
	J//qAYg7WeyMUFHTu4nwbpb3Sw4B3ylXgdxDf8ZWvU7JKeEqxN4rE/yMJF/grQQVXLflwavP+7GOY
	e8oIKcZM77XodkFyvyaW9G7xfskJLdqR+QebJtbNy/3mvjZF5sr/dAMMIa+TLoEmqMd/ehbrpS+KT
	v0IuIiNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk1l-003Tc9-RQ; Thu, 15 Sep 2022 08:15:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk0c-003Rgg-Id; Thu, 15 Sep 2022 08:14:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE9486601F69;
	Thu, 15 Sep 2022 09:14:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663229645;
	bh=TxnD5zdRaSawjyj06ttIobSn1RRh53WxSYuyvrmydSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ADVfk27Obu/lWkuopA9jemmYwEPHRiqP2dtPjEFDvDtkB6GLzNZLXq+yTaeWhuhne
	 CuWTQDIf0Hdrwdc5J+VB+G61cuqJ0BPhE4qjRV3slXiTh7a2c5Wi+K6F6gXMEVaUFt
	 /EngCP/1QRTKerg360I9Vu8ZdEsBJIX7yGb+LZnujcrsVSZJ3ChnF5ErdoZkMCjyqZ
	 Te4UYVz6GCHi2NR1CdvVSqjofzwL1IjTJNAOZsIuiTJXrv6HbuhsHJHhtAfapJM1Xy
	 zPbZPeQcK9cy/ogGZggH9+i1uKx6HGrbuytvoWpuRJatkqCrx8x8gBGH9XyMfPGGX7
	 IuAL4bmIaGrHw==
Message-ID: <81d9d1fd-2ac6-7500-111d-b073f19c1d8b@collabora.com>
Date: Thu, 15 Sep 2022 10:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/4] arm64: dts: mt8195: Add dptx nodes
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
 <20220915075849.1920-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075849.1920-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_011406_771704_E2D00309 
X-CRM114-Status: GOOD (  13.49  )
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

Il 15/09/22 09:58, Bo-Chen Chen ha scritto:
> Add edptx and dptx nodes for MT8195.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 93e6a106a9b8..6f3f9bf3dc54 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1241,6 +1241,9 @@
>   				reg = <0x189 0x2>;
>   				bits = <7 5>;
>   			};
> +			dp_calibration: dp-data@1ac {
> +				reg = <0x1ac 0x10>;
> +			};
>   		};
>   
>   		u3phy2: t-phy@11c40000 {
> @@ -2178,5 +2181,27 @@
>   			clock-names = "engine", "pixel", "pll";
>   			status = "disabled";
>   		};
> +
> +		edp_tx: edp-tx@1c500000 {
> +			status = "disabled";
> +			compatible = "mediatek,mt8195-edp-tx";
> +			reg = <0 0x1c500000 0 0x8000>;
> +			nvmem-cells = <&dp_calibration>;
> +			nvmem-cell-names = "dp_calibration_data";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
> +			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
> +			max-linkrate-mhz = <8100>;
> +		};
> +
> +		dp_tx: dp-tx@1c600000 {
> +			compatible = "mediatek,mt8195-dp-tx";
> +			reg = <0 0x1c600000 0 0x8000>;
> +			nvmem-cells = <&dp_calibration>;
> +			nvmem-cell-names = "dp_calibration_data";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
> +			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +			max-linkrate-mhz = <8100>;

max-linkrate-mhz should go before status.

> +		};
>   	};
>   };


