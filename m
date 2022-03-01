Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2FCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 08:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+e4ZZB6ifhl6sGGcLX5mltHmWlOl6dJN71DA/nNbGTk=; b=1x770s/mEtxP8Q
	dCNH6D8yCKpPy1UIq4w72hnvPDGMqJwYFmya9rgz7PaXxjt5Atg+1hYCAwH14+f4NKG6Tz4ojkGda
	gZTQPuI+TnZ3j0uWl95UOL1HcXRIAh3aaJ2AWRl3Cp9JXFwWD/AEOtq6FJWkd8elsx6eKjC5vBqCy
	54gO8/B3B831wwsEp1A1wbmcg/dfsTd+Vi6rbbRKEgdAPNcgxKImZMlutaK01KM5OJGlQNeRJZNwt
	R4KHrNUuiIeMT6qoRV4ES1s3hj2fzjuFHgNEbUpU3tYqVMbrlJMGr6aa4gQ6MiDe9sKi4WrHjBkHr
	iUQ7l81B1BZliPGg8m/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxxD-00FbW6-2y; Tue, 01 Mar 2022 08:33:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxww-00FbOn-Ut; Tue, 01 Mar 2022 08:33:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso899837wmr.1; 
 Tue, 01 Mar 2022 00:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LkrTcQQbt/9+kZrb/G+6KYClsmPdfv/aEHScRzi5ZAs=;
 b=mtj+dI+NVw8LeXLhTCnZeZgjE3M77ddOgX9ienReKqhu6eqXMGaGvl7kUgLxrH/imx
 zZL610ITo2FA7KruB9rkrHKT4/Lwpt/A3V3047Sb8rZzaecQu8EuVpKZycFqjIf+Ea4F
 1Ysqyx7vO9OwDlQTRcD+6O6gpHTx7Fw5Hw+exkYLnkC+IckNQZ9/lqdjjYftid5gPmse
 d7D0a0z9p529s7UIwJUtQlgVGEp3iWEeBgftNB1BSDhHTWNlWvSwbDKAGdVMajt29Ily
 0TwJaiR/lZw0rkHIIdH1NSpo+w34uoy7kF+7eM0po8sA+nNKCN9ARHCMjWC/Mjt8tVU9
 1rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LkrTcQQbt/9+kZrb/G+6KYClsmPdfv/aEHScRzi5ZAs=;
 b=wsezBUv5kNXDglHbVhaWEwoLxHAqNTm4KXkOzIfGG2DNHuQcN8n2QeY32GvoNBkRyO
 4aWP4Wl4gZA9bkaHq5DboKWsOAgZVh+pxolyZ8urtnyaHNrJOR0vDftqoONlO4J3fOW7
 eIwzv0d8fjT2OHAJi+MQmpCA9O/yZ7R+fMJTRdQBpetn5z4q7+9hWW+LAW1MiP8lN8TK
 crzHlcte/gH6a4XWIlSabd+rTNABnUHjsHfI6myaaCoTvQRUH00aGIm93rc08up8zVnb
 8RiQOtUxQYGXPKZj6kblVKo0A0opboiguPWDxEIV8vVkSlrtZABjL8zz5zHK33CEMs82
 OloQ==
X-Gm-Message-State: AOAM531VEAVkI7Xzc6BAZ/QDakNp77eLBzbQ+2YIP9r4mLg2uqr5BZbR
 dDfdUPH21hpR0GLjcj2bcsg=
X-Google-Smtp-Source: ABdhPJwgp8UucD4OAX8skQYsYngCTn4CiMKZRKK9OmCXn08gSTewF+CNCCfhF6TU4XyQpJj6ERIYSQ==
X-Received: by 2002:a05:600c:508:b0:380:fd39:2c42 with SMTP id
 i8-20020a05600c050800b00380fd392c42mr15993789wmc.178.1646123616070; 
 Tue, 01 Mar 2022 00:33:36 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adfc511000000b001edc0a8a8b6sm19256706wrf.0.2022.03.01.00.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:33:35 -0800 (PST)
Message-ID: <232259a8-1cce-002b-3f46-916425de1d69@gmail.com>
Date: Tue, 1 Mar 2022 09:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] arm64: dts: mediatek: add clock support for mt7986a
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220119123624.10043-1-sam.shih@mediatek.com>
 <20220119123624.10043-2-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220119123624.10043-2-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_003339_039633_A7CA4933 
X-CRM114-Status: GOOD (  15.57  )
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



On 19/01/2022 13:36, Sam Shih wrote:
> Add clock controller nodes, include 40M clock source, topckgen,
> infracfg, apmixedsys and ethernet subsystem.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 68 +++++++++++++++++++++--
>   1 file changed, 63 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index b8da76b6ba47..694acf8f5b70 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -6,16 +6,18 @@
>   
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/mt7986-clk.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	system_clk: dummy40m {
> +	clk40m: oscillator@0 {
>   		compatible = "fixed-clock";
>   		clock-frequency = <40000000>;
>   		#clock-cells = <0>;
> +		clock-output-names = "clkxtal";
>   	};
>   
>   	cpus {
> @@ -98,6 +100,18 @@ gic: interrupt-controller@c000000 {
>   			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
> +		infracfg: infracfg@10001000 {
> +			compatible = "mediatek,mt7986-infracfg", "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		topckgen: topckgen@1001b000 {
> +			compatible = "mediatek,mt7986-topckgen", "syscon";
> +			reg = <0 0x1001B000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>   		watchdog: watchdog@1001c000 {
>   			compatible = "mediatek,mt7986-wdt",
>   				     "mediatek,mt6589-wdt";
> @@ -107,6 +121,12 @@ watchdog: watchdog@1001c000 {
>   			status = "disabled";
>   		};
>   
> +		apmixedsys: apmixedsys@1001e000 {
> +			compatible = "mediatek,mt7986-apmixedsys";
> +			reg = <0 0x1001E000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>   		pio: pinctrl@1001f000 {
>   			compatible = "mediatek,mt7986a-pinctrl";
>   			reg = <0 0x1001f000 0 0x1000>,
> @@ -128,11 +148,25 @@ pio: pinctrl@1001f000 {
>   			#interrupt-cells = <2>;
>   		};
>   
> +		sgmiisys0: syscon@10060000 {
> +			compatible = "mediatek,mt7986-sgmiisys_0",
> +				     "syscon";
> +			reg = <0 0x10060000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		sgmiisys1: syscon@10070000 {
> +			compatible = "mediatek,mt7986-sgmiisys_1",
> +				     "syscon";
> +			reg = <0 0x10070000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>   		trng: trng@1020f000 {
>   			compatible = "mediatek,mt7986-rng",
>   				     "mediatek,mt7623-rng";
>   			reg = <0 0x1020f000 0 0x100>;
> -			clocks = <&system_clk>;
> +			clocks = <&infracfg CLK_INFRA_TRNG_CK>;
>   			clock-names = "rng";
>   			status = "disabled";
>   		};
> @@ -142,7 +176,13 @@ uart0: serial@11002000 {
>   				     "mediatek,mt6577-uart";
>   			reg = <0 0x11002000 0 0x400>;
>   			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&system_clk>;
> +			clocks = <&infracfg CLK_INFRA_UART0_SEL>,
> +				 <&infracfg CLK_INFRA_UART0_CK>;
> +			clock-names = "baud", "bus";
> +			assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
> +					  <&infracfg CLK_INFRA_UART0_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
> +						 <&topckgen CLK_TOP_UART_SEL>;
>   			status = "disabled";
>   		};
>   
> @@ -151,7 +191,11 @@ uart1: serial@11003000 {
>   				     "mediatek,mt6577-uart";
>   			reg = <0 0x11003000 0 0x400>;
>   			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&system_clk>;
> +			clocks = <&infracfg CLK_INFRA_UART1_SEL>,
> +				 <&infracfg CLK_INFRA_UART1_CK>;
> +			clock-names = "baud", "bus";
> +			assigned-clocks = <&infracfg CLK_INFRA_UART1_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_F26M_SEL>;
>   			status = "disabled";
>   		};
>   
> @@ -160,10 +204,24 @@ uart2: serial@11004000 {
>   				     "mediatek,mt6577-uart";
>   			reg = <0 0x11004000 0 0x400>;
>   			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&system_clk>;
> +			clocks = <&infracfg CLK_INFRA_UART2_SEL>,
> +				 <&infracfg CLK_INFRA_UART2_CK>;
> +			clock-names = "baud", "bus";
> +			assigned-clocks = <&infracfg CLK_INFRA_UART2_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_F26M_SEL>;
>   			status = "disabled";
>   		};
>   
> +		ethsys: syscon@15000000 {
> +			 #address-cells = <1>;
> +			 #size-cells = <1>;
> +			 compatible = "mediatek,mt7986-ethsys",
> +				      "syscon";
> +			 reg = <0 0x15000000 0 0x1000>;
> +			 #clock-cells = <1>;
> +			 #reset-cells = <1>;
> +		};
> +
>   	};
>   
>   };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
