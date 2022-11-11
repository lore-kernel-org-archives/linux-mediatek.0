Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4EEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWQHARWsZHyDNDW+VfA9jOmCKFS0p3M16fZSx03dRMA=; b=X12QIRZeJTrqXj
	DKQjCQPCnw6UsvAPbbSkxRlDhSTI2rlHTCJms1gN/2JxRWvzF7PqGPKatZdofsOkzBNP1HlfmVadh
	LYo0AoKD4fvFfyhLVWq0Hu49SgOVB4STEPVrk3a7Jq7+dsaAF52NJkEQk25nxpCqTq32YIO0mxL5M
	HAfQd4rErdbFSW73UGY20PwNCQrk6khYOMqAxubud6SVSawfeNT2bZoB2UOiSBDijTUWfYQUdAtOF
	S1qa0eDOJgYkQUUrlHESW5k7SVtgNuZDhj5XHVXifLtH9ucHju2qzOdhGhITWpICD7+6xl4oFeZRI
	CBJbtaieLa5bwd5whtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPm3-00EMVH-Ae; Fri, 11 Nov 2022 08:52:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPm0-00EMP9-33; Fri, 11 Nov 2022 08:52:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id a14so5581460wru.5;
        Fri, 11 Nov 2022 00:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fWQHARWsZHyDNDW+VfA9jOmCKFS0p3M16fZSx03dRMA=;
        b=BqUtZ5LXXvNy2b8GLKkNRJV6a08miUyHMRg5ZZPpqLycu/8A67XS+YSw4ggEv1eC1G
         sDOv7+MXfXo/++j8QgrTFK7aZMU/V6r1i0NEkZXdkpnRntdkbQrYPSSo1xE+WXVBdIO+
         EnatAj9wiBmQuItct6P8gha1iMdZf9w6EtymKDDGq3Dlm6iaRh77qe040npP1MBS/xu2
         Ggm7ulcrPUc6AZOVHHlWniuBTLhMq6C2jr3NA3Fq6Lo2huGVJ06iq8dTFvpfaDtbfO3g
         ZbtsLA7mT3U1g7UfLBu4jFveIsMSn2S7K6fpbtvxengIxfC95QBWgNP4jNaxBu9YsRJt
         HKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWQHARWsZHyDNDW+VfA9jOmCKFS0p3M16fZSx03dRMA=;
        b=sxUK0OZpd7Tl/+sJbBfFVm4RfOfYKtsCm0qfrFzogt1hrySRGu5ZSXDPUpTFEXsfBj
         l6N+b3/oeI0JGVsyY8DKtaA1bnA/INcbFClgSNBFFINdMHHDNRUFRu/xbliqsIt/zJBY
         rS+f0RJHcaGgLTZ9l/vj0tlmR5WzdMNm5FRznyIV7f4j5paId/R7PgnZetxuYOP/lWrC
         yRwMazgozxrTTjPLKnwKMGqgyE0tJ5JVUT4lLcNuaEqjQjUNrORMXbvoJHyey3nLWtM/
         9yBLXRrWSmJPOhgOcfL799PcTgERwcoYjRIph1/sLSY7vCbQqiiQYVLK7nINRwJrASlK
         lbKw==
X-Gm-Message-State: ANoB5pmnrrcbmVXTkAJgmhp52rZWdk27JLzcIENdcx9Ay9MzLGtNWn4k
	CrfKR0OEJbz4NxEflHzelC8FvYRR9hIGcQ==
X-Google-Smtp-Source: AA0mqf7UL/sD+Pg+L06Cb1Hhfjv2tyvAGJl07qQRzclryIVRD0Z6XiRZKuySofUi/zOontyGdWyaVQ==
X-Received: by 2002:adf:fecd:0:b0:236:6e2a:ac16 with SMTP id q13-20020adffecd000000b002366e2aac16mr614869wrs.287.1668156744330;
        Fri, 11 Nov 2022 00:52:24 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c3b8200b003b476cabf1csm2384819wms.26.2022.11.11.00.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:52:22 -0800 (PST)
Message-ID: <d64477e1-eaa4-31c6-fde8-7ff399141572@gmail.com>
Date: Fri, 11 Nov 2022 09:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC v3 03/11] arm64: dts: mt7986: add usb related device nodes
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-4-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221106085034.12582-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_005228_170712_91710A92 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/11/2022 09:50, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This patch adds USB support for MT7986.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes compared to sams original version:
> - reorder xhci-clocks based on yaml binding
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 28 ++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 55 ++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 28 ++++++++++
>   3 files changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 58f7e6b169bf..de5d771e5251 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -23,6 +23,24 @@ memory@40000000 {
>   		device_type = "memory";
>   		reg = <0 0x40000000 0 0x40000000>;
>   	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>   };
>   
>   &eth {
> @@ -136,6 +154,12 @@ &spi1 {
>   	status = "okay";
>   };
>   
> +&ssusb {
> +	vusb33-supply = <&reg_3p3v>;
> +	vbus-supply = <&reg_5v>;
> +	status = "okay";
> +};
> +
>   &switch {
>   	ports {
>   		#address-cells = <1>;
> @@ -197,6 +221,10 @@ &uart2 {
>   	status = "okay";
>   };
>   
> +&usb_phy {
> +	status = "okay";
> +};
> +
>   &wifi {
>   	status = "okay";
>   	pinctrl-names = "default", "dbdc";
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 6d881095d933..58bbecfbab98 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -246,6 +246,61 @@ uart2: serial@11004000 {
>   			status = "disabled";
>   		};
>   
> +		ssusb: usb@11200000 {
> +			compatible = "mediatek,mt7986-xhci",

I wasn't able to find the compatible in linux-next.

> +				     "mediatek,mtk-xhci";
> +			reg = <0 0x11200000 0 0x2e00>,
> +			      <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_IUSB_SYS_CK>,
> +				 <&infracfg CLK_INFRA_IUSB_CK>,
> +				 <&infracfg CLK_INFRA_IUSB_133_CK>,
> +				 <&infracfg CLK_INFRA_IUSB_66M_CK>,
> +				 <&topckgen CLK_TOP_U2U3_XHCI_SEL>;
> +			clock-names = "sys_ck",
> +				      "ref_ck",
> +				      "mcu_ck",
> +				      "dma_ck",
> +				      "xhci_ck";
> +			phys = <&u2port0 PHY_TYPE_USB2>,
> +			       <&u3port0 PHY_TYPE_USB3>,
> +			       <&u2port1 PHY_TYPE_USB2>;
> +			status = "disabled";
> +		};
> +
> +		usb_phy: t-phy@11e10000 {
> +			compatible = "mediatek,mt7986-tphy",

Same here.

Regards,
Matthias

> +				     "mediatek,generic-tphy-v2";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			u2port0: usb-phy@11e10000 {
> +				reg = <0 0x11e10000 0 0x700>;
> +				clocks = <&topckgen CLK_TOP_DA_U2_REFSEL>,
> +					 <&topckgen CLK_TOP_DA_U2_CK_1P_SEL>;
> +				clock-names = "ref", "da_ref";
> +				#phy-cells = <1>;
> +			};
> +
> +			u3port0: usb-phy@11e10700 {
> +				reg = <0 0x11e10700 0 0x900>;
> +				clocks = <&topckgen CLK_TOP_USB3_PHY_SEL>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +
> +			u2port1: usb-phy@11e11000 {
> +				reg = <0 0x11e11000 0 0x700>;
> +				clocks = <&topckgen CLK_TOP_DA_U2_REFSEL>,
> +					 <&topckgen CLK_TOP_DA_U2_CK_1P_SEL>;
> +				clock-names = "ref", "da_ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
>   		ethsys: syscon@15000000 {
>   			 #address-cells = <1>;
>   			 #size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index 7673aa3fa6ae..cd1763fa7f19 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -23,6 +23,24 @@ memory@40000000 {
>   		device_type = "memory";
>   		reg = <0 0x40000000 0 0x40000000>;
>   	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>   };
>   
>   &eth {
> @@ -163,10 +181,20 @@ &spi1 {
>   	status = "okay";
>   };
>   
> +&ssusb {
> +	vusb33-supply = <&reg_3p3v>;
> +	vbus-supply = <&reg_5v>;
> +	status = "okay";
> +};
> +
>   &uart0 {
>   	status = "okay";
>   };
>   
> +&usb_phy {
> +	status = "okay";
> +};
> +
>   &wifi {
>   	status = "okay";
>   	pinctrl-names = "default", "dbdc";

