Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD788C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMcN9cuI8kd/EBAZ74WJbV4knfpudOgQHBZHEvjiUeg=; b=iASTognjt/CKPA
	aQyzHAqjpFrteSmJtFUYhE6UoMLjqOwirxtFSzkU3JRN39uo12W/lMIjJC8athxxTSwt7/8IMcQae
	AwF7r5YfMYPrzc+btdlgoeJ/O8E1ZOyt8ZILOfJ2b5CS7qdf/ULM7CJqcA0kNaV/Z7DxJGg4jtagX
	EoBPGibguDJZAAEZSb+J9noKiBQy933hDWHYlyrIm/dMr07Bk00VaHYENzTaf2aXRlAS4il9qxZWP
	CchkDhVrAQd5ieQ29RsSgtVlwLmajfctyf0POeyfy2oCYuuQmi9LwLjQeALe07xNw2OUiDfNkQWUa
	ksFD2tU8RmrD0KSpNbvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAdv-00GKfl-0r; Mon, 21 Nov 2022 17:31:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxASq-00GFPp-Q8; Mon, 21 Nov 2022 17:20:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id v7so8982170wmn.0;
        Mon, 21 Nov 2022 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMcN9cuI8kd/EBAZ74WJbV4knfpudOgQHBZHEvjiUeg=;
        b=CdG/Jsfw1WTtgaq07815E+5iiz2BxCttLVutSSsFDeJFpdjNTgCM7mczngh0Mw0gQz
         SnTnYE2NuBXGHWFYumksr7JptJia+L+A9Py3dN8WPTyvvc9GgnpNljN4pEl0euji5eE1
         eyC8cYmYM+bHAe88l8/ZMLMlpikoW4T6vKWbn1n/jk48V1E2Dw4Y61p9lNjkiZxY3k5Y
         eopvdLuyLCetDs8o1UMQQd1ayN+JEoDZr37YZm1qdCe1sGBeqsPyXWYDnouy4B1/K2IM
         NYCYuCeeYrJTx/Cp+fZ3+lAaZ4ij8zzFbQKPGliDB5otsq7HURxo8kzaKU+ve9GHoDCw
         2vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMcN9cuI8kd/EBAZ74WJbV4knfpudOgQHBZHEvjiUeg=;
        b=V6xE/IBuGxOoLuIPo1OUgiLKo+wQxI/I9jy0zm1mRmTnrFPqPtCekAb1lvtsi+ykG9
         V5CATvNly4NShJRUfrsMKetV1vLrmSPkyjddskpqLlZGvNNdPBpiWoOWbdE07L/wsTQJ
         VP76YDDrFgBgrpDPRbH5ls+T/+K0CPqvEuZio/m5/93djmijOngHi41pHcvrLxVci8yt
         YeD4Ub7eO7nePAH375eHwxSIi57QRJh1+bIEKTmdmK68UACEH1NXYgfz5ukK9DnE7X0F
         NaYfjDluSR5ihGtdaPRCaDqPLgUw9YnT55Ibisx86f1VwkOispENKhPCWS9aldwjz3qe
         vSUw==
X-Gm-Message-State: ANoB5pkQ6+0FGnCNcbMovc4uuY/lhp4fweekZPQpUcdpzKPf825PtG/Z
	MiL89lDWEEYfAKqREh4KorI=
X-Google-Smtp-Source: AA0mqf5NIforkcTyJS8N4lSRmBCwg/nq8MPBei0Dm1KYtcSUjGsnHEVqkWMPQgn0njhjv49oLeM4WQ==
X-Received: by 2002:a05:600c:4f93:b0:3cf:a616:ccc0 with SMTP id n19-20020a05600c4f9300b003cfa616ccc0mr17500223wmq.73.1669051208958;
        Mon, 21 Nov 2022 09:20:08 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c12-20020adffb4c000000b0022a3a887ceasm11736948wrs.49.2022.11.21.09.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:20:07 -0800 (PST)
Message-ID: <7902124b-fb5e-6eb4-1f57-f3fd49146e24@gmail.com>
Date: Mon, 21 Nov 2022 18:20:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 06/11] arm64: dts: mt7986: add spi related device nodes
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221118190126.100895-1-linux@fw-web.de>
 <20221118190126.100895-7-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221118190126.100895-7-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_092012_936124_3ADACA69 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Sam Shih <sam.shih@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/11/2022 20:01, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This patch adds spi support for MT7986.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 35 ++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 28 ++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 35 ++++++++++++++++++++
>   3 files changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 2f48cc3d3ddb..006878e3f2b2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -59,6 +59,20 @@ switch: switch@0 {
>   };
>   
>   &pio {
> +	spi_flash_pins: spi-flash-pins {
> +		mux {
> +			function = "spi";
> +			groups = "spi0", "spi0_wp_hold";
> +		};
> +	};
> +
> +	spic_pins: spic-pins {
> +		mux {
> +			function = "spi";
> +			groups = "spi1_2";
> +		};
> +	};
> +
>   	uart1_pins: uart1-pins {
>   		mux {
>   			function = "uart";
> @@ -105,6 +119,27 @@ conf {
>   	};
>   };
>   
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi_flash_pins>;
> +	cs-gpios = <0>, <0>;
> +	status = "okay";
> +	spi_nand: spi_nand@0 {
> +		compatible = "spi-nand";
> +		reg = <0>;
> +		spi-max-frequency = <10000000>;
> +		spi-tx-buswidth = <4>;
> +		spi-rx-buswidth = <4>;
> +	};
> +};
> +
> +&spi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spic_pins>;
> +	cs-gpios = <0>, <0>;
> +	status = "okay";
> +};
> +
>   &switch {
>   	ports {
>   		#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index afc01abfa99c..29da9b8ed753 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -253,6 +253,34 @@ i2c0: i2c@11008000 {
>   			status = "disabled";
>   		};
>   
> +		spi0: spi@1100a000 {
> +			compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x1100a000 0 0x100>;
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&topckgen CLK_TOP_MPLL_D2>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI0_CK>,
> +				 <&infracfg CLK_INFRA_SPI0_HCK_CK>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@1100b000 {
> +			compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x1100b000 0 0x100>;
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&topckgen CLK_TOP_MPLL_D2>,
> +				 <&topckgen CLK_TOP_SPIM_MST_SEL>,
> +				 <&infracfg CLK_INFRA_SPI1_CK>,
> +				 <&infracfg CLK_INFRA_SPI1_HCK_CK>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
> +			status = "disabled";
> +		};
> +
>   		ethsys: syscon@15000000 {
>   			 #address-cells = <1>;
>   			 #size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index 79c5c78f7a14..2c7f1d4fb352 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -100,6 +100,20 @@ fixed-link {
>   };
>   
>   &pio {
> +	spi_flash_pins: spi-flash-pins {
> +		mux {
> +			function = "spi";
> +			groups = "spi0", "spi0_wp_hold";
> +		};
> +	};
> +
> +	spic_pins: spic-pins {
> +		mux {
> +			function = "spi";
> +			groups = "spi1_2";
> +		};
> +	};
> +
>   	wf_2g_5g_pins: wf-2g-5g-pins {
>   		mux {
>   			function = "wifi";
> @@ -132,6 +146,27 @@ conf {
>   	};
>   };
>   
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi_flash_pins>;
> +	cs-gpios = <0>, <0>;
> +	status = "okay";
> +	spi_nand: spi_nand@0 {
> +		compatible = "spi-nand";
> +		reg = <0>;
> +		spi-max-frequency = <10000000>;
> +		spi-tx-buswidth = <4>;
> +		spi-rx-buswidth = <4>;
> +	};
> +};
> +
> +&spi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spic_pins>;
> +	cs-gpios = <0>, <0>;
> +	status = "okay";
> +};
> +
>   &uart0 {
>   	status = "okay";
>   };

