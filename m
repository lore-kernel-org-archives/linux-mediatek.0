Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09745C47073
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jan 2024 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwbOnKSd2CNVtq/rFasgcnH+4hEeCpjbjthcy/qXQwg=; b=KpxTCAycJepOP9ivveIXVXjhEV
	wkNfa7J0iiNNimjyl0VNP+lD8k+1xQ7CQck74+ppzM6fuM0QzJWJI0ywdJfg37Nz0YIxAv7QtXx9o
	/mFs0zD6DNxzAa1pha5sL3dKDtaY+mMuVcOpyQvSejlKiNcTc+TCzSANtJKaUpp8ZfAgmJ5Bhykww
	CRFaxMVBGqfsgyO+oRrErKYnQTDqgj8iSTKW6dwT0DQ3GdWtA8PFTRnP8p35uiAOuaQzaVH6mhTTh
	bGBd2176HxB1GW5y2Q/p2N6ARmnS73zz43qWODCO5C9/uNzAskcnNFp0cMeGeOfqqQMiT0RtbA+bn
	OmN44ylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKIz0-006MpY-26;
	Mon, 01 Jan 2024 14:09:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKIyw-006Mol-24;
	Mon, 01 Jan 2024 14:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704118167;
	bh=OZMmbVxNYTdn5G997u5ldg9//qwD2Jc/HwiTcRisc9k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JhCd8xBueIwwraiiSM1KXO3LAqwfjVvDTpi/URk5pfrGewSZOFyL+hhIs5tluFvOV
	 AMRK5Wi1YgtsaunA+tOzFhF5WZsM+hEPb8k6qcvqR9i21rSnwvXsoYajv4I/9wMSJn
	 /v1shqK7JVntFJuRb+ZI1o7ESNYFih1gWsmZDK1c3v8Xpds8O5SW8CkpBywT1x2ruW
	 jbrkmjYGpF9dPEjMhr/Ehmrl4s8LpX++/yFUq/G6D9/72PT5bZLDK8V9jppzjubZnY
	 ztdYr0XNQx2wBPMWmWexw+8DIiTXb5i5T06nm43OdClWrDLMirRPo6zF22MFo+OitU
	 F5lwbhkC3rcVw==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B1DB37802F2;
	Mon,  1 Jan 2024 14:09:26 +0000 (UTC)
Message-ID: <19c98266-0a8e-4e99-8766-cdf31a3a97b6@collabora.com>
Date: Mon, 1 Jan 2024 16:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231213150435.4134390-1-wenst@chromium.org>
 <20231213150435.4134390-7-wenst@chromium.org>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20231213150435.4134390-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_060930_845284_CE138911 
X-CRM114-Status: GOOD (  20.81  )
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

Hello Chen-Yu,

There is still some nonconformity with the bindings, please see below:

On 12/13/23 17:04, Chen-Yu Tsai wrote:
> Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> Krabby design.
> 
> Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> convertible device with touchscreen and stylus.
> 
> Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> device. It does not have a touchscreen or stylus.
> 
> The two devices both have two variants. The difference is a second
> source touchpad controller that shares the same address as the original,
> but is incompatible.
> 
> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes since v3:
> - Reorder some properties to conform better to the newly proposed DT
>   style guidelines
> - Drop unused labels
> - Rename bt-sco node name to bt-sco-codec
> - Drop i2s*-share properties from afe node
> - Drop aud_gpio_tdm_{on,off} pinctrl nodes
> - Replace interrupts with interrupts-extended in tpm node
> - Enable adsp device
> 
> Changes since v2:
> - Picked up Conor's ack
> - Rename touchpad to trackpad
> - Drop pinctrl properties from trackpad in tentacruel/tentacool second
>   source trackpad
> 
> Changes since v1:
> - Reorder SKU numbers in descending order.
> - Fixed pinconfig node names
> - Moved pinctrl-* properties after interrupts-*
> - Switched to interrupts-extended for external components
> - Marked ADSP as explicitly disabled, with a comment explaining that it
>   stalls the system
> - Renamed "touchpad" to "trackpad"
> - Dropped bogus "no-laneswap" property from it6505 node
> - Moved "realtek,jd-src" property to after all the regulator supplies
> - Switched to macros for MT6366 regulator "regulator-allowed-modes"
> - Renamed "vgpu" regulator name to allow coupling, with a comment
>   containing the name used in the design
> - Renamed "cr50" node name to "tpm"
> - Moved trackpad_pins reference up to i2c2; workaround for second source
>   component resource sharing.
> - Fix copyright year
> - Fixed touchscreen supply name
> ---

[snip]

> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	it6505dptx: dp-bridge@5c {
> +		compatible = "ite,it6505";

dp-bridge@5c: '#address-cells', '#size-cells', '#sound-dai-cells' do not match any
of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#

> +		reg = <0x5c>;
> +		interrupts-extended = <&pio 8 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&it6505_pins>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;

/soc/i2c@1100f000/dp-bridge@5c: unnecessary #address-cells/#size-cells without
"ranges" or child "reg" property

> +		#sound-dai-cells = <0>;
> +		ovdd-supply = <&mt6366_vsim2_reg>;
> +		pwr18-supply = <&pp1800_dpbrdg_dx>;
> +		reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				it6505_in: endpoint {
> +					link-frequencies = /bits/ 64 <150000000>;
> +					remote-endpoint = <&dpi_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +			};
> +		};
> +	};
> +};
> +

[snip]

> +&spi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi1_pins>;
> +	mediatek,pad-select = <0>;
> +	status = "okay";
> +
> +	cros_ec: ec@0 {
> +		compatible = "google,cros-ec-spi";
> +		reg = <0>;
> +		interrupts-extended = <&pio 13 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ec_ap_int>;
> +		spi-max-frequency = <1000000>;
> +
> +		i2c_tunnel: i2c-tunnel {
> +			compatible = "google,cros-ec-i2c-tunnel";
> +			google,remote-bus = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		typec {
> +			compatible = "google,cros-ec-typec";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			usb_c0: connector@0 {
> +				compatible = "usb-c-connector";
> +				reg = <0>;
> +				label = "left";
> +				power-role = "dual";
> +				data-role = "host";
> +				try-power-role = "source";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
typec:connector@0:ports: 'port@0' is a required property
> +					port@1 {
> +						reg = <1>;
> +
> +						typec_port0: endpoint { };
> +					};
> +				};
> +			};
> +
> +			usb_c1: connector@1 {
> +				compatible = "usb-c-connector";
> +				reg = <1>;
> +				label = "right";
> +				power-role = "dual";
> +				data-role = "host";
> +				try-power-role = "source";
> +
> +				ports {
connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@1 {
connector@0: ports: 'port@0' is a required property
> +						reg = <1>;
> +
> +						typec_port1: endpoint { };
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +

[snip]

> +
> +&usb_host1 {
> +	#address-cells = <2>;
> +	#size-cells = <2>;

 usb@11281000: usb@11280000:#address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml#
usb@11281000: usb@11280000:#size-cells:0:0: 0 was expected

> +	vbus-supply = <&usb_p1_vbus>;
> +	status = "okay";
> +};
> +
> +&watchdog {
> +	mediatek,reset-by-toprgu;
> +};
> +
> +#include <arm/cros-ec-keyboard.dtsi>
> +#include <arm/cros-ec-sbs.dtsi>


Eugen

