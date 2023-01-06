Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8E7C4708D
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 12:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71hsueaCtDriWXLU0P+tcfQEdhmXBsvOLwBjhBD5MkE=; b=D5qiD1AoczqqLP0nm8XdF3L859
	7wTKn6XGP1Ee+Un2h7lweiKrTBfAK5SEV9rSzpHVqybSURIno83UaauwVeAjwBW1JPOtC7Q0+Lh9U
	XXyCTy8aCvgvAKfeoQ2Js/I15IL2DB/JoxqU6tQ7RIsDfZ1/qEmtn3C5yH8PHiwXpT86wgvwtD14g
	tGxHEOrc820UaGCzJ1w81x8hMYFo0HdpTQ86FLk85Wz2C6wRBlUIp2zjAmZrPBqKBw8h/jjv7cU5s
	YHFAGgDQ5pZ1H6bCHDZokzf8gujixNawlbsABMx1MJUYxoEym12UvGMZyvtlM3rp2nogdP/0QT8j7
	hmPJmxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmGa-008EJF-1W; Fri, 06 Jan 2023 12:56:12 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmGW-008EFx-NT
	for linux-mediatek@lists.infradead.org; Fri, 06 Jan 2023 12:56:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id z16so1204068wrw.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jan 2023 04:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71hsueaCtDriWXLU0P+tcfQEdhmXBsvOLwBjhBD5MkE=;
        b=oeeYySaGlzQDEeYSaWZ0tli1QpWe2ABrviCD3ReNiAV8+h9c31KzRU1yk0YK3Z61vd
         yDqhVC/IqUmwyCQjA40+zv9o9kUwc2yleEvrhR//l8v6RvU4TtcliDmuXKcoHhODeHVl
         AeUovhw1LgEwiU0V3PzaGY4ckMIyU0pj1sP9DtCobbv5qbAnSuJDiT6a1aNn3ntNxegl
         /NVsiVVJUMw6wrB1P+/W33xaMxKJ7B6drSqBp53gFPAXtIyI4jZ71cZQE1OQMVbWNr4E
         +M/GN5TCFdzQLLR4l0qh/1AJgNPdu7GwpMN62yk67ZA5A88IHBuAow0a85JM80BlAfbZ
         +brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71hsueaCtDriWXLU0P+tcfQEdhmXBsvOLwBjhBD5MkE=;
        b=l2gzQG0WyH+Ecy1pgUAFoOdwzNix4ZZUeJY8O7tgGXuP4AenGS3b69M/S2cTo/Ld3W
         1/rbxwW3uqCIc+4UInKnMV6W72DjE7KbR7D2mR5X43cYQ3joj9po0Q0sBo32ot6x4gr8
         Y+by0bCXngTcq2iBgYnQ4NYXyIAk84/jKIgAcxGNLDW3Bg5FSwK/yZ+ertldtqB8N26C
         Q+dPm6s98CAHZXVUPOsKZE8xwY2s6oQdeUoJ1Dz5oRhfZO6KrOehr2OYIH9A3IOPY/AV
         8feRHVALLaPz4aOngoGPYJcpMT3oL3pzmuYBxibdvDvf3/QlkRAae+YmwoU0FwQ6Hcti
         r3+w==
X-Gm-Message-State: AFqh2kpEyJrsTJ+LvpJdT9huqK/lPbDwOfC95hFxy2Ai3ZX0+qyiJHMI
	D7Ls5Q91N+xcvIoYkbARZR8gPQ==
X-Google-Smtp-Source: AMrXdXslT7j+y1PheS8q/LGsk/fnqEhqbDslcbnFk4CGjJm9BxRAeCPpXvm0+8DOCa6EoLRPKNIgzA==
X-Received: by 2002:adf:e8c1:0:b0:242:782c:f397 with SMTP id k1-20020adfe8c1000000b00242782cf397mr34527161wrn.25.1673009766841;
        Fri, 06 Jan 2023 04:56:06 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020adfe44e000000b0028663fc8f4csm1110160wrm.30.2023.01.06.04.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:56:06 -0800 (PST)
Message-ID: <74ecff7a-bc75-0514-6aa2-b1401b8d43b8@linaro.org>
Date: Fri, 6 Jan 2023 13:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Miles Chen <miles.chen@mediatek.com>,
 linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105092809.14214-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_045608_808164_07FB830A 
X-CRM114-Status: GOOD (  22.75  )
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

On 05/01/2023 10:28, Macpaul Lin wrote:
> Introduce the split MT8195 laptop and iot USB configurations.
> The hardware specifications for LAPTOP devices is different from IOT
> devices. The major differences include some hardware constrains for
> dual-role switch for USB controllers in different configurations,
> especially for power management and other control flows as well.
> 
> Here are some hardware specifiction differences listed:
>   1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device mode).
>   2. IOT devices must support multiple gadget devices and host mode.
>   3. Dual-role switch is not fully supported. Only USB PORT0 support
>      dual-role switch.
>   4. Power management is designed in primary and secondary dominator.
>      For a dual-role port, the device controller is the primary controller
>      for power management; while the host controller is the secondary.
>      LAPTOP devices should remove device nodes for avoiding abnormal
>      behavior.
> 
> This modifcation is to add USB configurations "mt8195-laptop-usb.dtsi"
> for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.
> 
> To remove common USB configurations for mt8195.dtsi and switch includes
> dtsi these new files for the boards will come in next patch.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../boot/dts/mediatek/mt8195-iot-usb.dtsi     | 122 ++++++++++++++++++
>  .../boot/dts/mediatek/mt8195-laptop-usb.dtsi  | 102 +++++++++++++++
>  2 files changed, 224 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
> new file mode 100644
> index 000000000000..f9bd79542044
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + */
> +
> +#include "mt8195.dtsi"
> +
> +/ {
> +	soc {
> +		ssusb: ssusb@11200000 {

Node name: usb

> +			compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
> +			reg = <0 0x11201000 0 0x2dff>,
> +			      <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port0 PHY_TYPE_USB2>,
> +			       <&u3port0 PHY_TYPE_USB3>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
> +				 <&topckgen CLK_TOP_SSUSB_REF>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			xhci0: xhci@11200000 {
> +				compatible = "mediatek,mt8195-xhci",
> +					     "mediatek,mtk-xhci";
> +				reg = <0 0x11200000 0 0x1000>;
> +				reg-names = "mac";
> +				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
> +				assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
> +						  <&topckgen CLK_TOP_SSUSB_XHCI>;
> +				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +							 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +				clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>,
> +					 <&topckgen CLK_TOP_SSUSB_REF>,
> +					 <&apmixedsys CLK_APMIXED_USB1PLL>;
> +				clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck";
> +				status = "disabled";
> +			};
> +		};
> +
> +		xhci1: xhci1@11290000 {

Node names should be generic, so just "xhci"
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "mediatek,mt8195-xhci",
> +				     "mediatek,mtk-xhci";
> +			reg = <0 0x11290000 0 0x1000>,
> +			      <0 0x11293e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port1 PHY_TYPE_USB2>,
> +			       <&u3port1 PHY_TYPE_USB3>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
> +				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
> +				 <&apmixedsys CLK_APMIXED_USB1PLL>;
> +			clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck";
> +			status = "disabled";
> +		};
> +
> +		ssusb1: usb1@112a1000 {

usb

> +			compatible = "mediatek,mt8183-mtu3", "mediatek,mtu3";
> +			reg = <0 0x112a1000 0 0x2dff>,
> +				  <0 0x112a3e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port2 PHY_TYPE_USB2>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_2P>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
> +				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 4>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			xhci2: xhci2@112a0000 {

xhci

> +				compatible = "mediatek,mt8195-xhci","mediatek,mtk-xhci";
> +				reg = <0 0x112a0000 0 0x1000>;
> +				reg-names = "mac";
> +				interrupts-extended = <&gic GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&pio 220 IRQ_TYPE_EDGE_FALLING>;
> +				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>;
> +				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
> +				clock-names = "sys_ck";
> +				status = "disabled";
> +			};
> +		};
> +
> +		xhci3: xhci3@112b0000 {

xhci
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
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>,
> +				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
> +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
> +			wakeup-source;
> +			usb2-lpm-disable;
> +			status = "disabled";
> +		};


Best regards,
Krzysztof


