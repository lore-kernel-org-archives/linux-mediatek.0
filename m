Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D04C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59LIvGvTMxlGYNWjMrNSYXLxZkSiY7X+sprlXZQ1Q0s=; b=PfDzgVU6xt0q8L
	cMDn3tvm6+8yiyQYQ7KV5R9yQ6/L3aBjKXWDUtiHPMczdiL16sj13aimfnIhln94jBv/ikJRh61aJ
	WDKZgAoj40h0u4/EwCJeR9dQ26UcgW0EM4L1s8TeSbpgrHHfR/RZetHlpB+Q5tjsqC7KMD8nh4iHq
	kPO4jqyZP6sq+RHADsnt012Cj3IUVyxrUx3fG4yuL/JLRefSL8umKSgBnAB85Kfv76jlI55Hx8FAk
	2DP2EEBVI0+zO40t3SNh6K3JqjS57Km5kT9rF1kFGKO8yoEo+OQTDs7/GIBWuWDYZe0bwMctLKNZF
	7oJlhPLWlUxNUkp2gnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYoSr-008XgC-5C; Mon, 28 Mar 2022 12:27:17 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYoSe-008XdE-Oh; Mon, 28 Mar 2022 12:27:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id u16so20153060wru.4;
 Mon, 28 Mar 2022 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=YHmfb4C20ZoeF4fGdGnIMRNg2Ab4fGRbukJuULGv0VE=;
 b=Rn2VRIKKTMYH0yGjj6/JzkBq5XY4ktF6G/tZP1Vqjt6I0q0eAq5zdkcOPGTV9SAv2I
 ZuppgbjsbGpU6wLhW1u8/uBgrLU17DSTimYg/Ob86znS9Hy4ahBKHDajdGAXW3e0wREY
 E8GtjAOpl4zW9zQgcKdqHf6nsBqPe4bX5a+hPYnyoGrXzzcNLuSgXU9KECgx6viPKz4+
 s/CY4/qZ8rXUTk8JEPQMex4aKwruAlQi6DJUlkVKlDIlc7JN6WmSlHbL7b5ofvkbbZZv
 jbulstqHaloI0xLK2Yc1/xdKW6ucP9IOxmYs4S6OYPZBVEwYC7dshIo+B6tem7pnV5bQ
 NWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=YHmfb4C20ZoeF4fGdGnIMRNg2Ab4fGRbukJuULGv0VE=;
 b=YIiqf3BSFDUBnx9qRk0ZvW5SgWL+Fcqd/ffToyxoyLczQZrOaz+2SkwhOPtigpW5YQ
 aOJYX5yphSsnvfPNt3CDEHoKU3EM8Ju10Me5U2EUJoiMJxkGxcBTehbJGLoxTN8raNgf
 uu3tjyKE7oLACVX9DCBbN8vmocmF4atm6VMusjv1d3oEHHbH+h2lz1MMcBKnvEtWnGx7
 yc8OVD3ZjeGf/tUN/C2uPQFD+aVytjAoUVBsLLgxGMoLfMNYQRCsfcc8F+M/QO+KFiBq
 nZ2GBnlfMKwRSoqvAfS6lGb0KgfRA/NV0C5zVGWqkS6MWM29ESIkH/eS3oLgdN1ZaL2D
 4vDA==
X-Gm-Message-State: AOAM5304GmmnmPO8B39UW5mCdqF7B0ZaCQAADW0VH7Q1ycaRm+pb6lOM
 nkPRJfJMF7eHougSOqU84P4=
X-Google-Smtp-Source: ABdhPJyiHrWJXyMDhrMDjDB4l+tCjNQM71rNdhpB3Zd65zAJs+JwqjnbI8s1k+iMfKs1ojBAj+zBeA==
X-Received: by 2002:adf:f2c6:0:b0:203:f0ba:424c with SMTP id
 d6-20020adff2c6000000b00203f0ba424cmr22901124wrp.663.1648470422115; 
 Mon, 28 Mar 2022 05:27:02 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056000184400b0020584c40778sm12946276wri.103.2022.03.28.05.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 05:27:01 -0700 (PDT)
Message-ID: <cf16ed58-6e75-cd9f-38ab-540d62ff03b5@gmail.com>
Date: Mon, 28 Mar 2022 14:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Linus Walleij
 <linus.walleij@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com,
 Seiya Wang <seiya.wang@mediatek.com>
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <20220216113131.13145-4-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v11 3/3] arm64: dts: Add mediatek SoC mt8195 and
 evaluation board
In-Reply-To: <20220216113131.13145-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_052704_845415_CEFD6A9A 
X-CRM114-Status: GOOD (  25.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/02/2022 12:31, Tinghan Shen wrote:
> Add basic chip support for mediatek mt8195.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |    1 +
>   arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  161 +++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 1049 +++++++++++++++++++
>   3 files changed, 1211 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 8c1e18032f9f..5da29e7223e4 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -38,4 +38,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> new file mode 100644
> index 000000000000..51633d91d984
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> @@ -0,0 +1,161 @@
[...]
> +
> +&u2port0 {
> +	status = "okay";
> +};
> +
> +&u2port1 {
> +	status = "okay";
> +};
> +
> +&u3phy0 {
> +	status="okay";
> +};
> +
> +&u3phy1 {
> +	status="okay";
> +};
> +

So we enable phys for xhci but not the device. Are we missing anything to enable 
them on the EVB?

> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pin>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> new file mode 100644
> index 000000000000..a363e82f6988
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -0,0 +1,1049 @@
[...]
> +
> +	clk32k: oscillator-32k {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "clk32k";

I suppose the 32KHz oscillator is really present on the board also not used by 
any device (up to now?).

[...]
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
[...]
> +
> +		pwrap: pwrap@10024000 {
> +			compatible = "mediatek,mt8195-pwrap", "syscon";
> +			reg = <0 0x10024000 0 0x1000>;
> +			reg-names = "pwrap";
> +			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
> +				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
> +			clock-names = "spi", "wrap";

Binding mandates resets but not present here. It also mandates two register 
regions, but only one is given here.

> +			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
> +		};
> +
> +		scp_adsp: clock-controller@10720000 {
> +			compatible = "mediatek,mt8195-scp_adsp";
> +			reg = <0 0x10720000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +

[...]

> +
> +		mmc0: mmc@11230000 {
> +			compatible = "mediatek,mt8195-mmc",
> +				     "mediatek,mt8183-mmc";
> +			reg = <0 0x11230000 0 0x10000>,
> +			      <0 0x11f50000 0 0x1000>;

Seems to be an oversight when adding support for mt8183-mmc support to the 
driver. The binding description is missing the optional host top register base. 
Chaotian can you please help to fix this in the binding description.

> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC50_0>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>;
> +			clock-names = "source", "hclk", "source_cg";
> +			status = "disabled";
> +		};
> +
[...]
> +
> +		xhci3: usb@112b0000 {
> +			compatible = "mediatek,mt8195-xhci",
> +				     "mediatek,mtk-xhci";
> +			reg = <0 0x112b0000 0 0x1000>,
> +			      <0 0x112b3e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port3 PHY_TYPE_USB2>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
> +				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
> +			clock-names = "sys_ck", "ref_ck", "xhci_ck";
> +			/* This controller is connected with a BT device.
> +			 * Disable usb2 lpm to prevent konwn issues.
> +			 */
> +			usb2-lpm-disable;

My understanding is, that this depends on the board and not the SoC. Which means 
usb2-lpm-disable should go into any board that has a BT device connected to the 
xhci device (I don't see any active xhci node in mt8195-evb so far).

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
