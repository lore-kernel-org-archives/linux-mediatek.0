Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C2ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UZoFnb1F6rGUm5J3AoFq/8vqLtlUutVGAITwTyTP5w=; b=sl1XqTEmUy7333LvVrPAFQG9K4
	aV4EnU12k/z7M49lB5XcY/I0Zw69f3aalaoCQyKzJUNw313usKqzRgvHdjXE4agjWNeLk+cWUE0Sh
	hFJJm7ElslY2o83oU8LILmCdQSOMXANuad6hWN/1XNpmNtzOO/VbA2XiAZSaL5eLNXL9KJWrgXtFF
	8RwyDz6pllHCk/nd3sYPkpVilSGdB08hliUPSNeKeriPzItZ7Gl7JiAsqtGoBOQ0/JIXbeeJynDva
	TVpc/Q3ESZbhyBGY8QVRxRqQcQWDpYZKGjzXFIiJvu5uosBI4LHH24iXqa9q668nvpsdWHoHxvcDz
	fJm4Q9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwqc-00FJKm-79; Tue, 30 Aug 2022 08:43:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwqK-00FJHg-5o; Tue, 30 Aug 2022 08:43:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id m16so13177593wru.9;
        Tue, 30 Aug 2022 01:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=8UZoFnb1F6rGUm5J3AoFq/8vqLtlUutVGAITwTyTP5w=;
        b=LjdZ7UQZD9AXPP6mI330AGIIuUK6+dAXdB+7kY9swIp9aQW53SuFRWowoZ60K2Z3M4
         3Ykc7CagOfcgILwL52RC/Dg7mDiP7DCcsNdMYj2dWW6seuoVqMQlQFjAJhhvASldjoVi
         VAcD+3zEc6OFodnAfAnnU6ao9lqJ2n2vf0MSvssKOqJqg30n7d9yWX6PlFE3qjF1by+1
         MfApxAU/t0pFL9+P1ilr261u7LGZzt2C91WY4ZaGynk+qUCpkX0A+dc6ojRjyYCgGLQu
         fAh6hIrAo3FzmGKAvG8J6YUZKOP00kAp5+ataz/xXd1+AmT7I7oqNKF0mu6gux8ZR0fW
         HmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8UZoFnb1F6rGUm5J3AoFq/8vqLtlUutVGAITwTyTP5w=;
        b=HYd/GqoMlU+yfJUjTHhFwunQw0tqDvRp2CaSWK5zHVzq3QfGLSr70gDdL4HcKnurSL
         +ft4faFjicGArPgXf7HiSQTmuyhYffiavOP3WC0g79i3OwF9mvfyHWA9hC0xK/jrP2pb
         W7YrQ+PRy6IqPlwfLpZUWPx75F8RSxIAN0AgUcKY7NXEClivhSK+iNzxSePp3tO2z5Op
         ql3pcJqvpJ3tVToscHtQgFvA7JVqEOOprsDeVGx6n7HxrIIfzErDIAzR9iJBaNZWPXi2
         WYlNZC9FcPXNVVBQejYgQjZEWmwiWFGnGu0fRBhNBjHyVI/a+29aspztKj12Bd/pMz2I
         Mzwg==
X-Gm-Message-State: ACgBeo2eTD0U3LM0XycekwcXrclEL6EWDV1pCFOCQpsDvrHGBPGAkqlM
	yJtsHtP6jBzAB1yGCYVH7lk=
X-Google-Smtp-Source: AA6agR73cGjwkfal9mmojf4C5Lb+GTMEaXNZyxRN6X0PxORHItiCuU3D+z60IgfOzn5cEUDEsMpZBQ==
X-Received: by 2002:adf:e187:0:b0:220:6d97:b670 with SMTP id az7-20020adfe187000000b002206d97b670mr8098019wrb.63.1661849009752;
        Tue, 30 Aug 2022 01:43:29 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k1-20020adfe8c1000000b0021badf3cb26sm10991266wrn.63.2022.08.30.01.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 01:43:28 -0700 (PDT)
Message-ID: <b6524da2-34d6-cb7b-c8bf-19809e8932ed@gmail.com>
Date: Tue, 30 Aug 2022 10:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: Peter Chiu <chui-hao.chiu@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.Lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220630094909.8014-1-chui-hao.chiu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4] arm64: dts: mt7986: add built-in Wi-Fi device nodes
In-Reply-To: <20220630094909.8014-1-chui-hao.chiu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_014337_703586_786CC43A 
X-CRM114-Status: GOOD (  16.77  )
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



On 30/06/2022 11:49, Peter Chiu wrote:
> This enables built-in 802.11ax Wi-Fi support.
> 
> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
> v2: add clocks and clock-names.
> v3: rename wmac to wifi and change underscores to dash in node names.
> v4: rebase to the latest codebase.
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 41 +++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 23 +++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 43 ++++++++++++++++++++
>   3 files changed, 107 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 882277a..28cd168 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -115,6 +115,13 @@ &uart2 {
>   	status = "okay";
>   };
>   
> +&wifi {
> +	status = "okay";
> +	pinctrl-names = "default", "dbdc";
> +	pinctrl-0 = <&wf_2g_5g_pins>;
> +	pinctrl-1 = <&wf_dbdc_pins>;
> +};
> +
>   &pio {
>   	uart1_pins: uart1-pins {
>   		mux {
> @@ -129,4 +136,38 @@ mux {
>   			groups = "uart2";
>   		};
>   	};
> +
> +	wf_2g_5g_pins: wf-2g-5g-pins {
> +		mux {
> +			function = "wifi";
> +			groups = "wf_2g", "wf_5g";

yaml says:
          - if:
               properties:
                 function:
                   const: wifi
             then:
               properties:
                 groups:
                   enum: [wf_2g, wf_5g, wf_dbdc]


Did you run the binding checker against this DTS?
Why can't we just merge wf_2g_5g_pins with wf_dbdc_pins?

Regards,
Matthias

> +		};
> +		conf {
> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
> +			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
> +			drive-strength = <4>;
> +		};
> +	};
> +
> +	wf_dbdc_pins: wf-dbdc-pins {
> +		mux {
> +			function = "wifi";
> +			groups = "wf_dbdc";
> +		};
> +		conf {
> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
> +			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
> +			drive-strength = <4>;
> +		};
> +	};
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index e3a407d..890ded0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/mt7986-clk.h>
> +#include <dt-bindings/reset/mt7986-resets.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -70,6 +71,11 @@ secmon_reserved: secmon@43000000 {
>   			reg = <0 0x43000000 0 0x30000>;
>   			no-map;
>   		};
> +
> +		wmcpu_emi: wmcpu-reserved@4fc00000 {
> +			no-map;
> +			reg = <0 0x4fc00000 0 0x00100000>;
> +		};
>   	};
>   
>   	timer {
> @@ -261,6 +267,23 @@ eth: ethernet@15100000 {
>   			#size-cells = <0>;
>   			status = "disabled";
>   		};
> +
> +		wifi: wifi@18000000 {
> +			compatible = "mediatek,mt7986-wmac";
> +			resets = <&watchdog MT7986_TOPRGU_CONSYS_SW_RST>;
> +			reset-names = "consys";
> +			clocks = <&topckgen CLK_TOP_CONN_MCUSYS_SEL>,
> +				 <&topckgen CLK_TOP_AP2CNN_HOST_SEL>;
> +			clock-names = "mcu", "ap2conn";
> +			reg = <0 0x18000000 0 0x1000000>,
> +			      <0 0x10003000 0 0x1000>,
> +			      <0 0x11d10000 0 0x1000>;
> +			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
> +			memory-region = <&wmcpu_emi>;
> +		};
>   	};
>   
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index 0f49d57..7f21b10 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -98,3 +98,46 @@ fixed-link {
>   		};
>   	};
>   };
> +
> +&wifi {
> +	status = "okay";
> +	pinctrl-names = "default", "dbdc";
> +	pinctrl-0 = <&wf_2g_5g_pins>;
> +	pinctrl-1 = <&wf_dbdc_pins>;
> +};
> +
> +&pio {
> +	wf_2g_5g_pins: wf-2g-5g-pins {
> +		mux {
> +			function = "wifi";
> +			groups = "wf_2g", "wf_5g";
> +		};
> +		conf {
> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
> +			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
> +			drive-strength = <4>;
> +		};
> +	};
> +
> +	wf_dbdc_pins: wf-dbdc-pins {
> +		mux {
> +			function = "wifi";
> +			groups = "wf_dbdc";
> +		};
> +		conf {
> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
> +			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
> +			drive-strength = <4>;
> +		};
> +	};
> +};

