Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DB5C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ne6hA0mNJH5dp5zCfbNj8pPfn0E69pce6sOPzSeIcns=; b=amiWHXpufwYg9B
	fo3ECbn8bBvBsPtun1LxvDufOVIMJXYosPEctpHrFCgxOBY0zxOXYysypufqWg9aTi0JMy+WmlwbE
	80xrlF3z1aJtisrCOu/oXxP1eXp0n7ma7ijgY3MZLpQpeUIWj+sYvcaA7DalSe46ifWHQBxz/nQ71
	9pGJto+4tUumf5ehDPKn5wTDzXvf+nBxVJyIt1Mw29U9zoHY1I7+D69mDxCLSVUrM2heStXC3Wqe9
	ng3xT2M9Xpo0jX672x1CKM0rm64YT5jW8a8dMwkg2wpdO3VChGOhU0UMqy3SGu37R8mqlwZKsWl46
	7ICS/Q+hpvPPGmb/4B3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPo6-00ENcF-KL; Fri, 11 Nov 2022 08:54:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPo3-00ENaf-Pe; Fri, 11 Nov 2022 08:54:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id v1so5549324wrt.11;
        Fri, 11 Nov 2022 00:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ne6hA0mNJH5dp5zCfbNj8pPfn0E69pce6sOPzSeIcns=;
        b=f5bQZL4/zURSHQu0IeAH/yYin10bNCfSTROwNzvCLAnewE9QVKytfxJa7U/vT53KW/
         RStVrEfQYiizzAsrsd8LhDUWhKhpdS/QAxpdkD2fhyDxU5J9DvJL2wFl87H/e0B3Hyf0
         og60S9w87y8qwkYw7zZQ9DOScK2NXc8PrW6C8GvPM0H4FIKv5TLYB5rEm/Hve/SJBcgQ
         hbjiRAX/bSyS2Eiu6TDZZiSUoFAo9+vY77337/YzFrSoykG4kqO7tgRE3GPlzBj7E9DA
         pTomiEc2ErcW64g3AFBipKY5O2XT6lS9EzrKhUQV8+imMhA8oVxa8kp9uTJs7NLW2Gs1
         H2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne6hA0mNJH5dp5zCfbNj8pPfn0E69pce6sOPzSeIcns=;
        b=6eHENGryWN9H4ISXRrHWTQpwUmNLo0h7u/a4MgKbi2+yAWf2WQuYJ0GXMw2FsSnEd+
         qRr0endDS6xLaRXEdPFfTTutJ+Uv/8Nn6MKwx3L3v3uMEcKImiOxJUE9ev7rdh4U+xAp
         pZ5VY3peMz9u0ydqVYQT65zfts1nOU+589Rj6o2SPJWP1geAXVOVWOE8QFd5F2KNfH6w
         QxIbSSpuuyPRwWX7gDnMnI0eTp2ftIzofqdZEjoEZ4WwqoszJ87nfu7e+nELQqQOb72h
         mdzc8o9gbH7aQpgo0KoVjnXAQSDQYHdYXZIz95cJTF3aUiYII4hxN1PbUqD5CbHudyuW
         ml2A==
X-Gm-Message-State: ANoB5pnIUbCYJUr/oeApG6IAOuprJiCRWV7JXVDYySONkzC8i/HBWl5/
	EcEtl3uc6i7lNBTCSsxXuhk=
X-Google-Smtp-Source: AA0mqf6vReapZolaQq5WFMxn3HAc5gQBF5r+IMMtA/9Uc54iWN5ZN1QIz7bvKvB9aRyjkfMF9FTyWA==
X-Received: by 2002:a5d:5684:0:b0:22e:53c0:ead8 with SMTP id f4-20020a5d5684000000b0022e53c0ead8mr624736wrv.210.1668156874241;
        Fri, 11 Nov 2022 00:54:34 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t7-20020a1c7707000000b003cfa80443a0sm2188640wmi.35.2022.11.11.00.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:54:32 -0800 (PST)
Message-ID: <1eb8cbba-5e8a-df34-9c0c-4d5d24de4e18@gmail.com>
Date: Fri, 11 Nov 2022 09:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC v3 02/11] arm64: dts: mt7986: add spi related device nodes
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-3-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221106085034.12582-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_005435_888715_5A50E94C 
X-CRM114-Status: GOOD (  15.51  )
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
> This patch adds spi support for MT7986.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 35 ++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 28 ++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 35 ++++++++++++++++++++
>   3 files changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 6189436fe31d..58f7e6b169bf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -55,6 +55,20 @@ switch: switch@0 {
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
> @@ -101,6 +115,27 @@ conf {
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
> index 226648f48df2..6d881095d933 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -112,6 +112,34 @@ infracfg: infracfg@10001000 {
>   			#clock-cells = <1>;
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
>   		topckgen: topckgen@1001b000 {
>   			compatible = "mediatek,mt7986-topckgen", "syscon";
>   			reg = <0 0x1001B000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index 7459ddb6b6f0..7673aa3fa6ae 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -96,6 +96,20 @@ fixed-link {
>   };
>   
>   &pio {
> +	spi_flash_pins: spi-flash-pins {
> +		mux {
> +			function = "spi";
> +			groups = "spi0", "spi0_wp_hold";

Waiting on pinctrl binding:
https://patchwork.kernel.org/project/linux-mediatek/patch/20221106080114.7426-2-linux@fw-web.de/

Please resend once merged.

Regards,
Matthias

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
> @@ -128,6 +142,27 @@ conf {
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

