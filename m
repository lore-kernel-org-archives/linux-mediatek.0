Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC04C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+G5nV4HgC1PrIzEBnz+tBm2Hyud4+lR+30lpfylogWI=; b=1RqmhM1WedqD9C8vPzxoczHkHi
	oOE/IjcIXkulbzDYThx3XVDs/Nq16wM448T5oXC3Sss6sbMZ9ggBDNybK4Yajqtz8ZVxFiGFzaKGl
	nL+lViXHePazjrRV28Tuaid34QYf6e8HfRi87jjIiMfSLSQapy05pk14hKtFdWodZo0FXYrL5FLmi
	PZilB3Ir996A3LHvsqoKRdKrffrosSJyTrdiUJ20rvNaN1nUkDumGi2NzDYqZOU9fBFkiJWyfzIlV
	bheUUX3BltVdJGh3fLcaUZ9ZrBGP3eL7FjzGEdqAmdFP5dia5pDaWgmbtiW/ekFQDxjJTiu2RRR7b
	l9ZfU0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2WP-0000000Fbdf-22qZ;
	Wed, 17 Apr 2024 10:28:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2WG-0000000FbYi-1xU6;
	Wed, 17 Apr 2024 10:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713349679;
	bh=2SVLOxF1LIFW8IU+UiQ7K2P1NHBlwj/W6OfBiv0gOr4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=aDwYNLm4GpaVas8y1JxE813xF5hvJPUXYik0xtOCY1BNDNqzE3iTahTaivSHQj7l6
	 MXbis/vxnwKNQGh0KQLKsagi3TjhE4JJ9Es1XfP3msHY0waB9Xuy6CjCNxaM/egkl2
	 2O0N2+cDm8wYhxh0jTEhFcPFOD2NmnK1tiw6T4jzfgBdSzNSE3bl8CDMz4noQxmtSt
	 nU1HN29DcvKuBkI6/TUXfx+a2EaeVJIBwGUGJyTePjst1qmBNmIA19w8TKUS48H6t3
	 yxdSdM8Tv4UYOMQm/3uDZfPxCIe9S76dl7wvEdk5i9FD3bhmCP0VAKASQVwbcYuqJ5
	 yb7qpzIBF+VcA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B20237820F9;
	Wed, 17 Apr 2024 10:27:57 +0000 (UTC)
Message-ID: <ee8d0a32-b4fb-4fc4-83b2-300f7453d95f@collabora.com>
Date: Wed, 17 Apr 2024 12:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 18/18] arm64: dts: mediatek: add display support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-18-33ce8864b227@baylibre.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-18-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_032800_967782_045893DE 
X-CRM114-Status: GOOD (  16.55  )
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

Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> MIPI DSI:
> - Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
> to power the pannel plugged to the DSI connector.
> - Setup the Display Parallel Interface.
>    - Add the startek kd070fhfid015 pannel support.
> 
> HDMI:
> - Add HDMI connector support.
> - Add the "ite,it66121" HDMI bridge support, driven by I2C1.
> - Setup the Display Parallel Interface.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 182 ++++++++++++++++++++++++++++
>   1 file changed, 182 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 50cbaefa1a99..4afdcbefc481 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -26,6 +26,18 @@ chosen {
>   		stdout-path = "serial0:921600n8";
>   	};
>   
> +	connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "d";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_connector_out>;
> +			};
> +		};
> +	};
> +
>   	firmware {
>   		optee {
>   			compatible = "linaro,optee-tz";
> @@ -86,6 +98,56 @@ optee_reserved: optee@43200000 {
>   			reg = <0 0x43200000 0 0x00c00000>;
>   		};
>   	};
> +
> +	vsys_lcm_reg: regulator-vsys-lcm {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "vsys_lcm";
> +	};
> +};
> +
> +&dpi0 {
> +	pinctrl-0 = <&dpi_default_pins>;
> +	pinctrl-1 = <&dpi_idle_pins>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +
> +	port {
> +		dpi_out: endpoint {
> +			remote-endpoint = <&it66121_in>;
> +		};
> +	};
> +};
> +
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "startek,kd070fhfid015";
> +		status = "okay";

status is always okay, unless it's disabled.

> +		reg = <0>;
> +		enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
> +		iovcc-supply = <&mt6357_vsim1_reg>;
> +		power-supply = <&vsys_lcm_reg>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +
> +	port {
> +		dsi_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
>   };
>   
>   &cpu0 {
> @@ -138,6 +200,50 @@ &i2c0 {
>   	status = "okay";
>   };
>   
> +&i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-div = <2>;
> +	clock-frequency = <100000>;
> +	pinctrl-0 = <&i2c1_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	it66121hdmitx: it66121hdmitx@4c {

Can we please get an actually readable name for this node?

Just a suggestion (you're free to rename however you want)

	it66121_hdmi: hdmi@4c {

> +		#sound-dai-cells = <0>;
> +		compatible = "ite,it66121";
> +		interrupt-parent = <&pio>;
> +		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&ite_pins>;
> +		pinctrl-names = "default";
> +		reg = <0x4c>;
> +		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
> +		vcn18-supply = <&mt6357_vsim2_reg>;
> +		vcn33-supply = <&mt6357_vibr_reg>;
> +		vrf12-supply = <&mt6357_vrf12_reg>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				it66121_in: endpoint {
> +					bus-width = <12>;
> +					remote-endpoint = <&dpi_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				hdmi_connector_out: endpoint {
> +					remote-endpoint = <&hdmi_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>   &mmc0 {
>   	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
>   	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> @@ -180,7 +286,55 @@ &mt6357_pmic {
>   	#interrupt-cells = <2>;
>   };
>   
> +&mt6357_vsim1_reg {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +};
> +
>   &pio {
> +	dpi_default_pins: dpi-default-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
> +				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
> +				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
> +				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
> +				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
> +				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
> +				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
> +				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
> +				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
> +				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
> +				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
> +				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
> +				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
> +				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
> +				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
> +				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
> +			drive-strength = <MTK_DRIVE_4mA>;

drive-strength = <4> is just fine....! :-)

> +		};
> +	};
> +
> +	dpi_idle_pins: dpi-idle-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
> +				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
> +				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
> +				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
> +				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
> +				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
> +				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
> +				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
> +				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
> +				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
> +				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
> +				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
> +				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
> +				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
> +				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
> +				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
> +		};
> +	};
> +
>   	ethernet_pins: ethernet-pins {
>   		phy_reset_pins {
>   			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
> @@ -222,6 +376,34 @@ pins {
>   		};
>   	};
>   
> +	i2c1_pins: i2c1-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
> +				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	ite_pins: ite-pins {
> +

extra blank line, please remove.

> +		irq_ite_pins {

Did you run dtbs_check?!? :-)

Cheers,
Angelo

> +			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		pwr_pins {
> +			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
> +				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
> +			output-high;
> +		};
> +
> +		rst_ite_pins {
> +			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
> +			output-high;
> +		};
> +	};
> +
>   	mmc0_default_pins: mmc0-default-pins {
>   		clk-pins {
>   			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
> 




