Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A00C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+02cjYPkEXxuikCpaE0bz19xTQKV8bE4O3rFYc2UyDg=; b=FQMeTEAZoSXGYc
	P1pjH3GzuceUfO+ACofxVuNfnil2OXcAesEBKcBzkXa02I75OrcpTj6BWp2D9+24EpOqzjXGif4oT
	lECG1xthXqeihIj7LGrrcIzNr7vqYKJWhIF8mWw0iE/N3KMTdwgqyu0OSFbwIUo1+T74zOTGB1d+K
	RC7fLZtNzJ3nbbhdTv6WHjmcZkClBwNLD1JHBWTHev5y60HFmbufLNjCUudql9qiscf2FaIDfcePj
	qVWvRPOIxgMKG0E0wF/3gQDr/uoD+le9Qcpm7jNgrHOkuWafeYsng/MuYSiPhItfTrwQQwZIu3eR5
	WEQPoWkDRIRm1Zu45yvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntRBJ-007V55-6N; Tue, 24 May 2022 09:50:25 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntRBG-007V3x-Dj
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 09:50:24 +0000
Received: by mail-lj1-x22e.google.com with SMTP id i23so20243326ljb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G5WlWLi6CTURLGag3t+5CNRf4lZCgCTJvDTMTbTzQ5s=;
 b=M5ncORw3o6tH0W6GJp/VpORJZBt9q4377NZcTfDcKeo1/AQf38SDgEJiTum+C02xgc
 r4QaJJ+obzajUh+DovgWFW42ZkroAxdOoffR7GZhttn1jnPQp3TV5ZWcpJfqYQrCFV6L
 57BRFW0TbWj5Oc5tZNBBqfpwr7W6AAgPIBI2pS8LZnAtnE+MEpd4xGPt6NXBEIR9McxM
 maGD+k8hr8IO056uwFRRKdMrsrk7dXrwIrpZQ0bokeNSqP+M3uMIsPiHmJ+FsyPUOiBL
 NibYJZfMinCiQEXphf+a1ecq+yd7bfS4GmXu5raI7xcXYVJliT7pFVK5U9jyEgqkBtOZ
 e7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G5WlWLi6CTURLGag3t+5CNRf4lZCgCTJvDTMTbTzQ5s=;
 b=Sr8lD7pa0Gb1JE1r+5miyxgsthlZEkkm+HBcl0kqkbSLIis0AOrySwxPHGVPvDVpbx
 g7U6IRxgXiMYtLKml/46V/aBfaETAFwdyCki7uacXq0puBOM50NtPTZo8SibwpuNleBL
 DMrUonEYTwLHJaYu9eZ9kZ9RXxseSjEfD49fiQgVAH7Q4G3U5wxXYQap2v8WURpVpeMu
 BzCmL8e4232QIo5bZfh7ruuJqqorxNSL7c31u9WWBoMN0zTPQiDJeIpD+qEU5gKFb+K/
 uV2CkQAFU79cknkzWN9IDSwhCMMGZTYiKVV8NU71VBi48ECyVzBQPY+IJ8rZ+jjsU3C7
 yy8g==
X-Gm-Message-State: AOAM533xzbhl7Tof5Zd5iL5kA+lmvbdK4mvFl8E8nxe9q6htrgwSRCCz
 fxXzcWGKYLZeOM/LXIDAvA4/bw==
X-Google-Smtp-Source: ABdhPJzADTR5ZRgZ2CtrdOGOpAvEuXwgcWWGhbFMTvfVxCiP3KAzV1YJN8j3H75tLbWtQ/a5Bfw4zg==
X-Received: by 2002:a2e:91d9:0:b0:253:d761:130 with SMTP id
 u25-20020a2e91d9000000b00253d7610130mr14134812ljg.7.1653385820828; 
 Tue, 24 May 2022 02:50:20 -0700 (PDT)
Received: from [172.20.68.48] ([91.221.145.6])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056512358a00b0047255d21152sm2441897lfr.129.2022.05.24.02.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 02:50:20 -0700 (PDT)
Message-ID: <a59707ea-0b58-0f3a-b39c-bc33d0625c8e@linaro.org>
Date: Tue, 24 May 2022 11:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] arm64: dts: mt7986: add built-in Wi-Fi device nodes
Content-Language: en-US
To: Peter Chiu <chui-hao.chiu@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.Lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220524032430.6261-1-chui-hao.chiu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220524032430.6261-1-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_025022_550328_AAC40160 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24/05/2022 05:24, Peter Chiu wrote:
> This enables built-in 802.11ax Wi-Fi support.
> 
> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
> v2: add clocks and clock-names
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 41 +++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 22 ++++++++++
>  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 43 ++++++++++++++++++++
>  3 files changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 24c155c71f0d..359e14f8e9f1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -57,6 +57,13 @@
>  	status = "okay";
>  };
>  
> +&wmac {
> +	status = "okay";
> +	pinctrl-names = "default", "dbdc";
> +	pinctrl-0 = <&wf_2g_5g_pins>;
> +	pinctrl-1 = <&wf_dbdc_pins>;
> +};
> +
>  &pio {
>  	pcie_pins: pcie-pins {
>  		mux {
> @@ -99,6 +106,40 @@
>  			groups = "jtag";
>  		};
>  	};
> +
> +	wf_2g_5g_pins: wf_2g_5g-pins {
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
> +	wf_dbdc_pins: wf_dbdc-pins {
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
>  };
>  
>  &spi0 {
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 9663a0779416..47d719fb66fb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/mt7986-clk.h>
>  #include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/reset/mt7986-resets.h>
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -80,6 +81,11 @@
>  			reg = <0 0x43000000 0 0x30000>;
>  			no-map;
>  		};
> +
> +		wmcpu_emi: wmcpu-reserved@4fc00000 {
> +			no-map;
> +			reg = <0 0x4fc00000 0 0x00100000>;
> +		};
>  	};
>  
>  	timer {
> @@ -381,6 +387,22 @@
>  			 #reset-cells = <1>;
>  		};
>  
> +		wmac: wmac@18000000 {

This is wifi, right? If so, then generic node name - wifi.

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
>  	};
>  
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index d4078feb4aad..f25312c9a289 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -97,3 +97,46 @@
>  &usb_phy {
>  	status = "okay";
>  };
> +
> +&wmac {
> +	status = "okay";
> +	pinctrl-names = "default", "dbdc";
> +	pinctrl-0 = <&wf_2g_5g_pins>;
> +	pinctrl-1 = <&wf_dbdc_pins>;
> +};
> +
> +&pio {
> +	wf_2g_5g_pins: wf_2g_5g-pins {

No underscores in node names, unless binding requires them... but it
should not as this is not allowed character.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
