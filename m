Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4523FECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/lFULYC7Ke1BXi647CM88bU431QP21ewJEyzWrvSnM=; b=RHFcSbsD8nP1AnPdOqqt5bQdy7
	OvdYKcuwZ5MRwQiyobpUFPGN4buWWP08mlSlijmiMTSDkQEPL/ADScCjgiuJwemFISlybSXAmCfFZ
	MzYIJB4Z61Dy9C/0zh/iTDADW/TVxARbh1+QchkuffjmOLp1R9KD9yam9wzWBrOezJdSneFL4HTeh
	M7UFEtx/vB4i+WMJYgWBHAcjWjd8UTie6Kkra8q6fjayK6mE9ET5RkV6hMID6aANKYsjnb5D2CKrJ
	2XuzpMIBZhIYS9odYqo6CGwYeippdgvn/SM8ApslFDnpK0INHjrH0MrPN6N8moImQKY1qCIbTNBFc
	oheoAvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTlE6-00CWHY-WA; Thu, 01 Sep 2022 14:31:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTlDq-00CWC9-LV; Thu, 01 Sep 2022 14:31:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id u18so9955020wrq.10;
        Thu, 01 Sep 2022 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=T/lFULYC7Ke1BXi647CM88bU431QP21ewJEyzWrvSnM=;
        b=pA6sBzZZzHEeFvlcNG2Ev480dc0grCRm4fpEKUDjzJBJR3yioXatFWOp0k2t+hsrOj
         XSLbaevCk5Txr3pfKnlAUMTgqqizV3+IrA6jNLKyB6uOhJZGdBKkORmJlLQPvq65rBBa
         hvNkcCTyu/7sVmNGh9lkgTn1i1p4uJMsZ2KN4T9cf9NYj12veqSJCkLesgYkBg8mASes
         m/Dc/Qk0/KdXA+VK60qDwSdpOYRkEamqJh+ffOtRBG+d0HNl6dfhqgSL/lOco32OaeuY
         xsIBYjVPut6HLP0TUnSY34RJbnCOul2LORID2WdjkuPcZ2iYTqM8ESw2BfFR8ubyGkNL
         zCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=T/lFULYC7Ke1BXi647CM88bU431QP21ewJEyzWrvSnM=;
        b=FemnmskOSRxBMt77tgDtpeDfSXeSHTscSK3rheQAhnbNr56b9daGxW/CFn/VvvM4Ap
         L+OY8Id5qF58eoCcKX78qfAQyKfKsepmbRTH4etjgolUHVJb7anMLIcl4uNDjLwjF2QV
         VCApoIw+eGbMWVTwUDPI2cKdB3pW86pBAooQGWmsRKZhxRo6V116mHtsG4TMlqxWtnQZ
         e5WLgLB6a/+4H5qAsfUeNOh4caO+ybsw3qbjw9QuOyNjpCu7gXv6NFEfU8wt9prPMqdM
         cTaJ/bE39fhczioqPe8/jHulMLSSH07lOhZaA/T8Xai8aEY5M10zskFbV8tPGB4x52ed
         8wsQ==
X-Gm-Message-State: ACgBeo0OOkmjHKYdkLnY/XL3N0L4KG21wes9Ld8TnpHFEnWnZHaKytpB
	by2iD8YOaxyZJX1l6pTbo1QQJKMH9s0=
X-Google-Smtp-Source: AA6agR7f+KK2jItph90PXKwihYdt6FOBY3qQdM3Me1JOJcTgSGVJ1rQ0W2v00+QaPvjHdXZWIpFxoA==
X-Received: by 2002:a5d:5274:0:b0:226:d134:80aa with SMTP id l20-20020a5d5274000000b00226d13480aamr14529277wrc.59.1662042666771;
        Thu, 01 Sep 2022 07:31:06 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d4d88000000b002253d865715sm11813494wru.87.2022.09.01.07.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 07:31:05 -0700 (PDT)
Message-ID: <aac98d72-863d-eb7b-caab-73bb0fddeb83@gmail.com>
Date: Thu, 1 Sep 2022 16:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v5] arm64: dts: mt7986: add built-in Wi-Fi device nodes
Content-Language: en-US
To: Peter Chiu <chui-hao.chiu@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.Lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220901130552.26234-1-chui-hao.chiu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220901130552.26234-1-chui-hao.chiu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_073110_741401_2FD41BF5 
X-CRM114-Status: GOOD (  16.76  )
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



On 01/09/2022 15:05, Peter Chiu wrote:
> This enables built-in 802.11ax Wi-Fi support.
> 
> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> 

That won't work without the pinctrl yaml file updated. Please send both together 
so that we can review them.

Regards,
Matthias

> ---
> v2: add clocks and clock-names.
> v3: rename wmac to wifi and change underscores to dash in node names.
> v4: rebase to the latest codebase.
> v5: remove useless pins in wf_dbdc_pins node.
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 38 +++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 23 +++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 40 ++++++++++++++++++++
>   3 files changed, 101 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 882277a52b69..afe37b702eef 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -115,6 +115,13 @@
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
> @@ -129,4 +136,35 @@
>   			groups = "uart2";
>   		};
>   	};
> +
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
> +			       "WF0_TOP_CLK", "WF0_TOP_DATA";
> +			drive-strength = <4>;
> +		};
> +	};
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index e3a407d03551..890ded0efc51 100644
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
> @@ -70,6 +71,11 @@
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
> @@ -261,6 +267,23 @@
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
> index 0f49d5764ff3..3443013b5971 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -98,3 +98,43 @@
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
> +			       "WF0_TOP_CLK", "WF0_TOP_DATA";
> +			drive-strength = <4>;
> +		};
> +	};
> +};

