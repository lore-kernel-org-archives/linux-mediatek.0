Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E387ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DShOf4Gx+lzJmcnqegec2XN3Hsli13fi8jDcyucrTgE=; b=a21TTvGvJbknC2bpkK9Q7OUE50
	ZQvnUo4Q2JKdobmySpl5WBhFCQM1zf4n7v2w40PAH+8Gg5os9lb3U02BJaXvAwltfLcSRC1d+vB4m
	SwmlGhuBXSfPPSigq5UqJAvGukbcKxMo58mwM+vzm/VU0KqT99RuJMbs7QkgbQX0yVvb0B7gKkkLR
	Z5f+fNbyneByKoidmFZt/LnTDOsM3XxCAJVS6cSzQIVrwPYf3F6CDVoeEdf+Cmh+34rHh4LHN8UNG
	/k/Dq6s/jcjZGQ1s1cKfIY1nmNEyNh5AHfEbQ4/RnjRAqyChxq0YalEc7aPsD6110sDPJHYjlVHmf
	JfVRt7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTDm-001xm7-UY; Wed, 14 Sep 2022 14:18:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTD1-001wh7-BB; Wed, 14 Sep 2022 14:17:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id z12so7628947wrp.9;
        Wed, 14 Sep 2022 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DShOf4Gx+lzJmcnqegec2XN3Hsli13fi8jDcyucrTgE=;
        b=BqO62uCGa3bxc+fdhgYg7xWIqBrP8YKuUaBU24ihFbCa71d7IkF6AUQyknG3nP5YRw
         8iPw4S3PAbvadE64dJTV368Zq6PZsF/YkyjJDS/JVUIfhlI/R+qCWLZP+UI3vwZ/98Mv
         gSMR2iaVDrzxbUTH00W+hazjfeNJm441tIFWG7/OJ/NjL2JQuxgTTGjg+yfCzttBiiWd
         KQLjL3hoF7mUSKYsGYLWEvHPNg/zRNe4ql8mYUU9dgEiHOguppEdLm0Jbilnh0lomlB0
         p7K50/OMHm7TgjRQ8l+FuIj70f2LmWadJzqfCNzhFCxbPLqmeC3a1ncDpgZA6wgUuEbV
         DWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DShOf4Gx+lzJmcnqegec2XN3Hsli13fi8jDcyucrTgE=;
        b=Oqrcs9Nprpxqo8rhrVRD8lnqnyI4kF4DGCHoe3+0lFSygX2W0DHdS3EfgwqATaGxMx
         ZVYA3Q2u9N6PIpcTAJGzVx0aLr+u4hfXkq113tDKkYwGkxYd582GhrtlmzCAEOsnBIqq
         n6C39MD5H4DJnCOOjB3lFWLUc4Beo67l5bo5hiye42X7Pm+YZXw9a2zrjEPwjWeJX16A
         zrsx58WU8MND6V/3Kf0pcGbjUmtGz8ZhK2vc6jR65jLfVqF5bhYIjrvz/Ludx6ejAqCc
         i/AgJtnEDIzWyRtLagKVAl6DPfdFwSeLAawpTh6cGWbtv59fqgEoFF2asOJh/qjZLHaa
         ir9A==
X-Gm-Message-State: ACgBeo3LrPTY6M9bv4VtRnQgS6dQ6Gh85IGLC+vbd7BKGa1BzNgxslbt
	N4BHL/22Aomt/qZd/l6eaMs=
X-Google-Smtp-Source: AA6agR5bsN/EY+8ioTAB2c4TXxV2H+z0kc6hhyTlPa+UwwzLDQRS2VxaaTwqi5P1XQYMoelWoojU0g==
X-Received: by 2002:a5d:4745:0:b0:228:d9ec:6b5d with SMTP id o5-20020a5d4745000000b00228d9ec6b5dmr22015748wrs.257.1663165065317;
        Wed, 14 Sep 2022 07:17:45 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c6-20020a056000104600b002252ec781f7sm13554846wrx.8.2022.09.14.07.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 07:17:44 -0700 (PDT)
Message-ID: <725668a0-b138-a60c-4c99-7c81599034a2@gmail.com>
Date: Wed, 14 Sep 2022 16:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
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
X-CRM114-CacheID: sfid-20220914_071747_538209_128A21FB 
X-CRM114-Status: GOOD (  17.71  )
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

Now that the yaml file change was accpeted:

Applied to v6.0-next/dts64

Thanks!

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

