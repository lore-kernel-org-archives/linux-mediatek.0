Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AACC7EE2C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 08:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxXFrKElRzHD3AhZ1Izn24LgyXIERCFwVs1IlBDcXRs=; b=4VgAQdh0mhs/xh8UdKCSX5t57i
	7iQtJiYNIY94gDVSbOg7CHQxRiYC67EJ3GixvGtQ+SzKy676wb+tUggmJqkdBkpL/Vm7uH0fRL21B
	Yxdz6kBTKbHXTnm+jWA3ngRd1Gy7eYkvrPDMVI7fvW4yMuTOKJj2yygrf24bEzLcwVE1D6ke3smbr
	RPZJcVLYD/uJ3Vxs/bNQvLM+pcHEwPsud2VFr+Lmnrlh0pWJAMbKF1Y/OJIQft4K9oVLA6iAvgGH1
	T4sstOulD6I0ja+E1YzoC2BHkQrrg7291gmW1Kzy3a0gga+tco02/rzWc6JPIX7T/e5zG/053Jsn3
	IasftQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q26f7-00G2w6-39;
	Thu, 25 May 2023 08:49:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26f4-00G2uo-2P;
	Thu, 25 May 2023 08:49:32 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7313C6601F25;
	Thu, 25 May 2023 09:49:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685004569;
	bh=EtbcIEsusRHFZTgu8Dex+fRPFWvkGsCdZCUXAljl5dA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R3Kqq201hrVo9BPurnMzA4ezjYaxoOObvi2g1URGN83ygYowisAzheTdUdqoN8r5n
	 TSPVNXvf2IqTDg6Ua32jPMj5mo3fBXv6Jzp00dpCYtRkUZIBFKRI6Z95fFDvcq9zyB
	 Qmf4i6a4nRyF4Lo8EjOvSFAi7xS9fItyrAASqEHumC9d+L+2iMqekjSs9WuiEvzVgr
	 kqPO/q7IWRwlb7SHqcUp/Q775FHR3XSGYEdGLrJGcoMiI0kG0mYN6GtVrQxhaJszeY
	 PEVm7f/e/4fGzFf7IIwz7zGZD1F44ZMszNcIUEl1DVmOHxBiPP4hdPjndP8BOQ7DIl
	 oElYLmw5vShYA==
Message-ID: <b80ceed1-0c5a-0875-dab0-309e2318d88e@collabora.com>
Date: Thu, 25 May 2023 10:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v8 07/10] arm64: dts: mediatek: add ethernet support for
 mt8365-evk
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
 <20230203-evk-board-support-v8-7-7019f3fd0adf@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v8-7-7019f3fd0adf@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_014930_918287_1697E950 
X-CRM114-Status: GOOD (  15.67  )
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

Il 25/05/23 10:33, Alexandre Mergnat ha scritto:
> - Enable "vibr" and "vsim2" regulators to power the ethernet chip.
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 48 +++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 1a5769c397c2..86524cbf4354 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -88,6 +88,29 @@ optee_reserved: optee@43200000 {
>   	};
>   };
>   
> +&ethernet {
> +	pinctrl-0 = <&ethernet_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&eth_phy>;
> +	phy-mode = "rmii";
> +	/*
> +	 * Ethernet and HDMI (DSI0) are sharing pins.
> +	 * Only one can be enabled at a time and require the physical switch
> +	 * SW2101 to be set on LAN position
> +	 * mt6357_vibr_reg and mt6357_vsim2_reg are needed to supply ethernet
> +	 */
> +	status = "disabled";

Ouh, that's sad :-(

...but you're left with no other choice, so I agree with providing at least
the full node in case anyone wants to actually enable it by flipping the
switch on the board, so you get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		eth_phy: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
>   &i2c0 {
>   	clock-frequency = <100000>;
>   	pinctrl-0 = <&i2c0_pins>;
> @@ -138,6 +161,31 @@ &mt6357_pmic {
>   };
>   
>   &pio {
> +	ethernet_pins: ethernet-pins {
> +		phy_reset_pins {
> +			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
> +		};
> +
> +		rmii_pins {
> +			pinmux = <MT8365_PIN_0_GPIO0__FUNC_EXT_TXD0>,
> +				 <MT8365_PIN_1_GPIO1__FUNC_EXT_TXD1>,
> +				 <MT8365_PIN_2_GPIO2__FUNC_EXT_TXD2>,
> +				 <MT8365_PIN_3_GPIO3__FUNC_EXT_TXD3>,
> +				 <MT8365_PIN_4_GPIO4__FUNC_EXT_TXC>,
> +				 <MT8365_PIN_5_GPIO5__FUNC_EXT_RXER>,
> +				 <MT8365_PIN_6_GPIO6__FUNC_EXT_RXC>,
> +				 <MT8365_PIN_7_GPIO7__FUNC_EXT_RXDV>,
> +				 <MT8365_PIN_8_GPIO8__FUNC_EXT_RXD0>,
> +				 <MT8365_PIN_9_GPIO9__FUNC_EXT_RXD1>,
> +				 <MT8365_PIN_10_GPIO10__FUNC_EXT_RXD2>,
> +				 <MT8365_PIN_11_GPIO11__FUNC_EXT_RXD3>,
> +				 <MT8365_PIN_12_GPIO12__FUNC_EXT_TXEN>,
> +				 <MT8365_PIN_13_GPIO13__FUNC_EXT_COL>,
> +				 <MT8365_PIN_14_GPIO14__FUNC_EXT_MDIO>,
> +				 <MT8365_PIN_15_GPIO15__FUNC_EXT_MDC>;
> +		};
> +	};
> +
>   	gpio_keys: gpio-keys-pins {
>   		pins {
>   			pinmux = <MT8365_PIN_24_KPCOL0__FUNC_KPCOL0>;
> 


