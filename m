Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECCAC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRsDugZQHZ3cAp8Uo4BX8m8iIIGYim123jYJVHkkzNM=; b=fW8IzsPfokoQ6IRcewQaD+OulS
	WFIXgi84UKEV0U43z1saoxjF/lc6G9yZ8xm8bg3BucA2OYPN6vBe3T+etA19d2C6YLU++wa7q0obW
	UVD4wr5Hyl+fHUOn0tSl8oUzkE8P8Nq4BrXPswIGUlgq1sDpmkczJksNmzL204Tpcb90rLyaF3t0K
	IynqoZ3b4h9Zrx+fS0bpsC3ybjwjQiIQGaovt2yyxFBSPgo3okeP1gHaURQStaBAETyC/M1tyBqUj
	HKoI0TydSAVAI2KeyRKFkVYv8bzNNh/7PdjR9oQNTiOF2y1Qai06JbCH5MPCNaKN642c3+nEZ72ej
	RRvLQg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrbE-000Ohw-SN; Wed, 23 Nov 2022 15:23:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxral-000OdT-1E; Wed, 23 Nov 2022 15:23:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id t1so13294154wmi.4;
        Wed, 23 Nov 2022 07:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRsDugZQHZ3cAp8Uo4BX8m8iIIGYim123jYJVHkkzNM=;
        b=JTS32H5Rl1FRQ5qQGs7q0aes2NHFbc/tVU1PRG9uzTWCLptD9c3MBLc2IqYddt3s+j
         9Of0wCplecvcC/ZN1lmfkazZqsy11weqsJhVk4QzwDldCoYxshlc7rC+qRSCf9Y/SqWB
         v/saVhfl+UuoPYhBVsTcqPPB1s6kP/enS0YerURQUZMzmRXmcAtyZYWjr5bPNnE9wIDH
         VW49UWoCb5VTT2rNTAVnEMk9qRuYv594NWL0wRMEci2KxO0FRzeZNCtNLbScBe0Xo0p7
         8H7kU9A+dvHezIaVrs3sjWhaXVIIBafgl/QMvsjn7GYdWVgzQ/Pi5mVzH95DYjng5LzN
         Pwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRsDugZQHZ3cAp8Uo4BX8m8iIIGYim123jYJVHkkzNM=;
        b=wbnK7gIm4uyb5jpdD07UQpSTuWrrJQnOW/zsTJyPLX83jRQ7iWxbqW5Y7WfLHoarv/
         9R8cprxXgjkOpTuR3M9sa6pWjydS/dc/WRvijPs/FBAa7IRHhnhCc7cFGxYTdFvf6MwZ
         sZIyOMGaF7hp3c/KW9Ic52NBkVArQddUsNW3BakDgfhXX4Qmaconp6kwOQtBkNQoBTTC
         rBH5EQ3lqCTUB640xtylVaDw/JuUaDqUXGkG4byeU5DGWU6fQHAtbZ+Vqu/3xmdZzVee
         ajKmxX+ay6h8PREbRKnarBF+CWgP7oPE1RreRXmQ3PJNJ1HSYvYsmkc/MovBPoWT15tA
         PotA==
X-Gm-Message-State: ANoB5pntv1EJP8Wgwj8iSrGfs9CiH3j6YPi1+vEMrbyyz9CeODb7mcwm
	RuL+Lt/U9xlD+64CTbzw7TS0S9VWAuM=
X-Google-Smtp-Source: AA0mqf4GOX3D3H86tdcDE4TkSHPMY+S13P3j1Dp/lKoItpeUJRYos1PzrSOxOWOfWevsQEXVOhunCg==
X-Received: by 2002:a05:600c:2309:b0:3c6:f252:f072 with SMTP id 9-20020a05600c230900b003c6f252f072mr7118083wmo.145.1669216991388;
        Wed, 23 Nov 2022 07:23:11 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c18-20020adffb12000000b002365730eae8sm16654203wrr.55.2022.11.23.07.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:23:10 -0800 (PST)
Message-ID: <5b253182-c15e-7fdd-48e2-37fd64838644@gmail.com>
Date: Wed, 23 Nov 2022 16:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/5] arm64: dts: mt8186: Add power domains controller
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org
References: <20221123135531.23221-1-allen-kh.cheng@mediatek.com>
 <20221123135531.23221-3-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221123135531.23221-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_072315_108762_6AF40FDF 
X-CRM114-Status: GOOD (  16.37  )
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



On 23/11/2022 14:55, Allen-KH Cheng wrote:
> Add power domains controller for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied for the next merge window. (v6.2-tmp/dts64 which will transform into 
v6.2-next/dts64 once v6.2-rc1 is released)

Thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 188 +++++++++++++++++++++++
>   1 file changed, 188 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c326aeb33a10..2b03a342b8db 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -332,6 +332,194 @@
>   			#interrupt-cells = <2>;
>   		};
>   
> +		scpsys: syscon@10006000 {
> +			compatible = "mediatek,mt8186-scpsys", "syscon", "simple-mfd";
> +			reg = <0 0x10006000 0 0x1000>;
> +
> +			/* System Power Manager */
> +			spm: power-controller {
> +				compatible = "mediatek,mt8186-power-controller";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#power-domain-cells = <1>;
> +
> +				/* power domain of the SoC */
> +				mfg0: power-domain@MT8186_POWER_DOMAIN_MFG0 {
> +					reg = <MT8186_POWER_DOMAIN_MFG0>;
> +					clocks = <&topckgen CLK_TOP_MFG>;
> +					clock-names = "mfg00";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					#power-domain-cells = <1>;
> +
> +					power-domain@MT8186_POWER_DOMAIN_MFG1 {
> +						reg = <MT8186_POWER_DOMAIN_MFG1>;
> +						mediatek,infracfg = <&infracfg_ao>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8186_POWER_DOMAIN_MFG2 {
> +							reg = <MT8186_POWER_DOMAIN_MFG2>;
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8186_POWER_DOMAIN_MFG3 {
> +							reg = <MT8186_POWER_DOMAIN_MFG3>;
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +				};
> +
> +				power-domain@MT8186_POWER_DOMAIN_CSIRX_TOP {
> +					reg = <MT8186_POWER_DOMAIN_CSIRX_TOP>;
> +					clocks = <&topckgen CLK_TOP_SENINF>,
> +						 <&topckgen CLK_TOP_SENINF1>;
> +					clock-names = "csirx_top0", "csirx_top1";
> +					#power-domain-cells = <0>;
> +				};
> +
> +				power-domain@MT8186_POWER_DOMAIN_SSUSB {
> +					reg = <MT8186_POWER_DOMAIN_SSUSB>;
> +					#power-domain-cells = <0>;
> +				};
> +
> +				power-domain@MT8186_POWER_DOMAIN_SSUSB_P1 {
> +					reg = <MT8186_POWER_DOMAIN_SSUSB_P1>;
> +					#power-domain-cells = <0>;
> +				};
> +
> +				power-domain@MT8186_POWER_DOMAIN_ADSP_AO {
> +					reg = <MT8186_POWER_DOMAIN_ADSP_AO>;
> +					clocks = <&topckgen CLK_TOP_AUDIODSP>,
> +						 <&topckgen CLK_TOP_ADSP_BUS>;
> +					clock-names = "audioadsp", "adsp_bus";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					#power-domain-cells = <1>;
> +
> +					power-domain@MT8186_POWER_DOMAIN_ADSP_INFRA {
> +						reg = <MT8186_POWER_DOMAIN_ADSP_INFRA>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8186_POWER_DOMAIN_ADSP_TOP {
> +							reg = <MT8186_POWER_DOMAIN_ADSP_TOP>;
> +							mediatek,infracfg = <&infracfg_ao>;
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +				};
> +
> +				power-domain@MT8186_POWER_DOMAIN_CONN_ON {
> +					reg = <MT8186_POWER_DOMAIN_CONN_ON>;
> +					mediatek,infracfg = <&infracfg_ao>;
> +					#power-domain-cells = <0>;
> +				};
> +
> +				power-domain@MT8186_POWER_DOMAIN_DIS {
> +					reg = <MT8186_POWER_DOMAIN_DIS>;
> +					clocks = <&topckgen CLK_TOP_DISP>,
> +						 <&topckgen CLK_TOP_MDP>,
> +						 <&mmsys CLK_MM_SMI_INFRA>,
> +						 <&mmsys CLK_MM_SMI_COMMON>,
> +						 <&mmsys CLK_MM_SMI_GALS>,
> +						 <&mmsys CLK_MM_SMI_IOMMU>;
> +					clock-names = "disp", "mdp", "smi_infra", "smi_common",
> +						     "smi_gals", "smi_iommu";
> +					mediatek,infracfg = <&infracfg_ao>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					#power-domain-cells = <1>;
> +
> +					power-domain@MT8186_POWER_DOMAIN_VDEC {
> +						reg = <MT8186_POWER_DOMAIN_VDEC>;
> +						clocks = <&topckgen CLK_TOP_VDEC>,
> +							 <&vdecsys CLK_VDEC_LARB1_CKEN>;
> +						clock-names = "vdec0", "larb";
> +						mediatek,infracfg = <&infracfg_ao>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_CAM {
> +						reg = <MT8186_POWER_DOMAIN_CAM>;
> +						clocks = <&topckgen CLK_TOP_CAM>,
> +							 <&topckgen CLK_TOP_SENINF>,
> +							 <&topckgen CLK_TOP_SENINF1>,
> +							 <&topckgen CLK_TOP_SENINF2>,
> +							 <&topckgen CLK_TOP_SENINF3>,
> +							 <&topckgen CLK_TOP_CAMTM>,
> +							 <&camsys CLK_CAM2MM_GALS>;
> +						clock-names = "cam-top", "cam0", "cam1", "cam2",
> +							     "cam3", "cam-tm", "gals";
> +						mediatek,infracfg = <&infracfg_ao>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8186_POWER_DOMAIN_CAM_RAWB {
> +							reg = <MT8186_POWER_DOMAIN_CAM_RAWB>;
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8186_POWER_DOMAIN_CAM_RAWA {
> +							reg = <MT8186_POWER_DOMAIN_CAM_RAWA>;
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_IMG {
> +						reg = <MT8186_POWER_DOMAIN_IMG>;
> +						clocks = <&topckgen CLK_TOP_IMG1>,
> +							 <&imgsys1 CLK_IMG1_GALS_IMG1>;
> +						clock-names = "img-top", "gals";
> +						mediatek,infracfg = <&infracfg_ao>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8186_POWER_DOMAIN_IMG2 {
> +							reg = <MT8186_POWER_DOMAIN_IMG2>;
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_IPE {
> +						reg = <MT8186_POWER_DOMAIN_IPE>;
> +						clocks = <&topckgen CLK_TOP_IPE>,
> +							 <&ipesys CLK_IPE_LARB19>,
> +							 <&ipesys CLK_IPE_LARB20>,
> +							 <&ipesys CLK_IPE_SMI_SUBCOM>,
> +							 <&ipesys CLK_IPE_GALS_IPE>;
> +						clock-names = "ipe-top", "ipe-larb0", "ipe-larb1",
> +							      "ipe-smi", "ipe-gals";
> +						mediatek,infracfg = <&infracfg_ao>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_VENC {
> +						reg = <MT8186_POWER_DOMAIN_VENC>;
> +						clocks = <&topckgen CLK_TOP_VENC>,
> +							 <&vencsys CLK_VENC_CKE1_VENC>;
> +						clock-names = "venc0", "larb";
> +						mediatek,infracfg = <&infracfg_ao>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_WPE {
> +						reg = <MT8186_POWER_DOMAIN_WPE>;
> +						clocks = <&topckgen CLK_TOP_WPE>,
> +							 <&wpesys CLK_WPE_SMI_LARB8_CK_EN>,
> +							 <&wpesys CLK_WPE_SMI_LARB8_PCLK_EN>;
> +						clock-names = "wpe0", "larb-ck", "larb-pclk";
> +						mediatek,infracfg = <&infracfg_ao>;
> +						#power-domain-cells = <0>;
> +					};
> +				};
> +			};
> +		};
> +
>   		watchdog: watchdog@10007000 {
>   			compatible = "mediatek,mt8186-wdt",
>   				     "mediatek,mt6589-wdt";

