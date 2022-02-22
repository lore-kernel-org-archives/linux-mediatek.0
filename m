Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9378AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 20:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngzeqZ7DNtY1ki9wSv1J844pxPb0bjlVOVcdZCf2pag=; b=1bxb5uvgXIEl8J
	R9EkEu07xS6gAnEwHd53MMtRHv6tdFj0xXPIqiIb7fyxUyU09b9T0sXO2Es/Twq6xHBr8D3KLWoIe
	/5NxhFcp0nKcCQ7Py8t9SAu3WsL7YLgY7ZVZTxBAVyDuMtdxIlrKq+sKGY27RafqEziwNU7XpekHn
	XmFmyO/LgICFkOsWuJri1GxneckcDE1/bKRbfZducuMKwIrU9GlstYUJ2JWw8yrSgkQ6/Rg98Qv70
	o8bP99OO+CiMl8iUOrtNsCbIiEKjsf3CFx97adPK7TyJgA5JmGeMQW3iks4ZPdcfEs3PbTahZLKac
	rAaqLboWWhCZUNqS0iyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMbsZ-00BXvn-FF; Tue, 22 Feb 2022 20:35:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMbsL-00BXqU-FL; Tue, 22 Feb 2022 20:35:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 18B751F433BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645562108;
 bh=KWkBmtNLJcWwrlrj1/Uv+K+VhcT3/3TdLTKZ/vKm7V0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bjE6sjU4fM0pK3Dltr1i5dH7svCLm1ihqBsFld1i98ORStZ/3rNLITIL3xwqDQRVZ
 jzjcwvtiKZzZIM/o3+LbhTUXqsMVS+TTcCSnHUXLNTWQ/Y2RvFgOTTbx3jA1OhJV1W
 1FDG+P0rGS0p0cNnfXzbidp7sB7qNg3x6XPYLYmsYcyo8aoMdPP6ezf5NYddXU7/Ef
 a1P6DrGAyFaYm6q7tAyS4wwRv2n55GEnP3dzi2aMwU8fjY7fLnZrLDnXbI1+34zAD9
 wjKkJgb5pfbmV/vdadDRdOkR4yL46OroqRCwRQ4WUQ8FcSlzT2afAdYpkgUBMD6IN7
 iW1hXmEM0ZsSQ==
Date: Tue, 22 Feb 2022 15:35:03 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 08/23] arm64: dts: mt8192: Add audio-related nodes
Message-ID: <20220222203503.ni4qsgv75pdzaz2c@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-9-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-9-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_123509_800784_15BAF92C 
X-CRM114-Status: GOOD (  15.49  )
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

On Fri, Feb 18, 2022 at 05:16:18PM +0800, Allen-KH Cheng wrote:
> Add audio-related nodes in audsys for mt8192 SoC.
> Move audsys node in ascending order.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 135 ++++++++++++++++++++++-
>  1 file changed, 129 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 08c7c1c772f5..f93fe3779161 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -743,6 +743,135 @@
>  			#size-cells = <2>;
>  		};
>  
> +		audsys: syscon@11210000 {
> +			compatible = "mediatek,mt8192-audsys", "syscon";
> +			reg = <0 0x11210000 0 0x2000>;

You should mention in the commit message that the address range's length was
increased as well (from 0x1000 to 0x2000).

> +			#clock-cells = <1>;
> +
> +			afe: mt8192-afe-pcm {
> +				compatible = "mediatek,mt8192-audio";
> +				interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
> +				resets = <&watchdog 17>;
> +				reset-names = "audiosys";
> +				mediatek,apmixedsys = <&apmixedsys>;
> +				mediatek,infracfg = <&infracfg>;
> +				mediatek,topckgen = <&topckgen>;
> +				power-domains = <&spm MT8192_POWER_DOMAIN_AUDIO>;
> +				clocks = <&audsys CLK_AUD_AFE>,
> +					 <&audsys CLK_AUD_DAC>,
> +					 <&audsys CLK_AUD_DAC_PREDIS>,
> +					 <&audsys CLK_AUD_ADC>,
> +					 <&audsys CLK_AUD_ADDA6_ADC>,
> +					 <&audsys CLK_AUD_22M>,
> +					 <&audsys CLK_AUD_24M>,
> +					 <&audsys CLK_AUD_APLL_TUNER>,
> +					 <&audsys CLK_AUD_APLL2_TUNER>,
> +					 <&audsys CLK_AUD_TDM>,
> +					 <&audsys CLK_AUD_TML>,
> +					 <&audsys CLK_AUD_NLE>,
> +					 <&audsys CLK_AUD_DAC_HIRES>,
> +					 <&audsys CLK_AUD_ADC_HIRES>,
> +					 <&audsys CLK_AUD_ADC_HIRES_TML>,
> +					 <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
> +					 <&audsys CLK_AUD_3RD_DAC>,
> +					 <&audsys CLK_AUD_3RD_DAC_PREDIS>,
> +					 <&audsys CLK_AUD_3RD_DAC_TML>,
> +					 <&audsys CLK_AUD_3RD_DAC_HIRES>,
> +					 <&infracfg CLK_INFRA_AUDIO>,
> +					 <&infracfg CLK_INFRA_AUDIO_26M_B>,
> +					 <&topckgen CLK_TOP_AUDIO_SEL>,
> +					 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
> +					 <&topckgen CLK_TOP_MAINPLL_D4_D4>,
> +					 <&topckgen CLK_TOP_AUD_1_SEL>,
> +					 <&topckgen CLK_TOP_APLL1>,
> +					 <&topckgen CLK_TOP_AUD_2_SEL>,
> +					 <&topckgen CLK_TOP_APLL2>,
> +					 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
> +					 <&topckgen CLK_TOP_APLL1_D4>,
> +					 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
> +					 <&topckgen CLK_TOP_APLL2_D4>,
> +					 <&topckgen CLK_TOP_APLL_I2S0_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S1_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S2_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S3_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S4_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S5_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S6_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S7_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S8_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S9_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL12_DIV0>,
> +					 <&topckgen CLK_TOP_APLL12_DIV1>,
> +					 <&topckgen CLK_TOP_APLL12_DIV2>,
> +					 <&topckgen CLK_TOP_APLL12_DIV3>,
> +					 <&topckgen CLK_TOP_APLL12_DIV4>,
> +					 <&topckgen CLK_TOP_APLL12_DIVB>,
> +					 <&topckgen CLK_TOP_APLL12_DIV5>,
> +					 <&topckgen CLK_TOP_APLL12_DIV6>,
> +					 <&topckgen CLK_TOP_APLL12_DIV7>,
> +					 <&topckgen CLK_TOP_APLL12_DIV8>,
> +					 <&topckgen CLK_TOP_APLL12_DIV9>,
> +					 <&topckgen CLK_TOP_AUDIO_H_SEL>,
> +					 <&clk26m>;
> +				clock-names = "aud_afe_clk",
> +					      "aud_dac_clk",
> +					      "aud_dac_predis_clk",
> +					      "aud_adc_clk",
> +					      "aud_adda6_adc_clk",
> +					      "aud_apll22m_clk",
> +					      "aud_apll24m_clk",
> +					      "aud_apll1_tuner_clk",
> +					      "aud_apll2_tuner_clk",
> +					      "aud_tdm_clk",
> +					      "aud_tml_clk",
> +					      "aud_nle",
> +					      "aud_dac_hires_clk",
> +					      "aud_adc_hires_clk",
> +					      "aud_adc_hires_tml",
> +					      "aud_adda6_adc_hires_clk",
> +					      "aud_3rd_dac_clk",
> +					      "aud_3rd_dac_predis_clk",
> +					      "aud_3rd_dac_tml",
> +					      "aud_3rd_dac_hires_clk",
> +					      "aud_infra_clk",
> +					      "aud_infra_26m_clk",
> +					      "top_mux_audio",
> +					      "top_mux_audio_int",
> +					      "top_mainpll_d4_d4",
> +					      "top_mux_aud_1",
> +					      "top_apll1_ck",
> +					      "top_mux_aud_2",
> +					      "top_apll2_ck",
> +					      "top_mux_aud_eng1",
> +					      "top_apll1_d4",
> +					      "top_mux_aud_eng2",
> +					      "top_apll2_d4",
> +					      "top_i2s0_m_sel",
> +					      "top_i2s1_m_sel",
> +					      "top_i2s2_m_sel",
> +					      "top_i2s3_m_sel",
> +					      "top_i2s4_m_sel",
> +					      "top_i2s5_m_sel",
> +					      "top_i2s6_m_sel",
> +					      "top_i2s7_m_sel",
> +					      "top_i2s8_m_sel",
> +					      "top_i2s9_m_sel",
> +					      "top_apll12_div0",
> +					      "top_apll12_div1",
> +					      "top_apll12_div2",
> +					      "top_apll12_div3",
> +					      "top_apll12_div4",
> +					      "top_apll12_divb",
> +					      "top_apll12_div5",
> +					      "top_apll12_div6",
> +					      "top_apll12_div7",
> +					      "top_apll12_div8",
> +					      "top_apll12_div9",
> +					      "top_mux_audio_h",
> +					      "top_clk26m_clk";
> +			};
> +		};
> +
>  		nor_flash: spi@11234000 {
>  			compatible = "mediatek,mt8192-nor";
>  			reg = <0 0x11234000 0 0xe0>;
> @@ -758,12 +887,6 @@
>  			status = "disable";
>  		};
>  
> -		audsys: clock-controller@11210000 {
> -			compatible = "mediatek,mt8192-audsys", "syscon";
> -			reg = <0 0x11210000 0 0x1000>;
> -			#clock-cells = <1>;
> -		};
> -
>  		i2c3: i2c@11cb0000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11cb0000 0 0x1000>,
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
