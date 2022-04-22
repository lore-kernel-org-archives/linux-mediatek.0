Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548F2C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdMHRC8TuKp68M0xTCgVod0Nk19snp4RAiZh5X54LkE=; b=rFawJlHbkdOEwI
	Ch1GS7Qug67m8q9HUNwn1SKy2Gn4Qxu3Vxwapu0uCnidqxXsu2yEk8SVzzJ+KyrishKwYmGTtfTzu
	RRlRBdiSgItyE2nHw+kiGWVYXxsUeB9mizXudTOW2ijlliRVKOBK+mKUdlz8E5g06jRlIBvxLHHf4
	BO6/lLE5t2CyPPYaNMPiwVIhM3de5xxFXbqZiTL2RMFXPnRYE+bEY2py2Ex0KF0vWv0sYrTJu8ZFR
	/mWGAPRCQwsWqqPVW+d+Rk+bKysgfY2wus7DNztnJtCVGScb55neiBdjyzUBrg3N/IwlPaZ/hQ/ys
	LElcp5DJl22vf9LvRUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhuJc-000pk0-7q; Fri, 22 Apr 2022 14:31:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhuJP-000pgh-GG; Fri, 22 Apr 2022 14:31:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id e28so1120271wra.8;
 Fri, 22 Apr 2022 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Wsa45TwHgv/5LBoiLGS2P/m3UDPekxcm9zNGP4Y4EaI=;
 b=kNkr0OOXTip5cDtSJfm9ApUmYZx5mMbrWfqKDXwk1yoqkCE3Yg1IytnneHnmGIMzjR
 OB7WJPhiVA+wg8K9lKq2nOgOaWFXL1+WWAjoqQS17p7DY+iQQ/Z2/Lzcg5dPAzCrKo5p
 C4uwUEgUFKu2ur0PUX/jaCOCnslNclyyco+Ceo/kumK+AbhH+lyrry2X4k8INdaTjsP1
 IhTsdZbx+FFVolul+1ByKTy5e2ckq3AF+c075zYMa4puOtrCziMpdP6MrCA+LgNPJ8HY
 IOmb3hcIeA/cVvdB1zwiQdkgtrgoABVIfVcbBA+8zEePXE3OdAi4vNfQ6Wa2FQIUwzm6
 bUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wsa45TwHgv/5LBoiLGS2P/m3UDPekxcm9zNGP4Y4EaI=;
 b=Etnp89qLR65IgiBQxgiRFnvMyEePDTg00yoFdVLx6jM0NzfiAJMn5v3MshIkiczz/c
 th8lDN45I4y+UB05NuZA7YxYvYiKu2rQLIaztAwjvWnsSas0PEbfF+gH9yIUwzPvx1N4
 G/P8zTAaKKByyllHinZDENo+fgk2o2ntUWadh0MqpaMzfKRyWlgMswb5hg3qnxoxjpdC
 n1E2Ej78i5whA+1//5YC3ZgR8Toq+X84kOIWr4OZnQ6NT4d0AopvI7vxzxRfwh1G3DqH
 wqBfalR69N5Ks3OfABCc68+HjPhaWGSwGAzQMWKwp56GMty8Qk4kx5zuIEeYcpBiVbKz
 X4Lg==
X-Gm-Message-State: AOAM5331im5c84oIvANHmgBhdwjGOKG0HJi1vapV2prek1Tpzsbrnc7t
 bzQH7oCNh2wzrE0fEtGfft8=
X-Google-Smtp-Source: ABdhPJzILje0JAbbos2mBoruwCJrBpfJM6vLzXSPrVTORAKPI9iH2ZUfEp4ADwU9BRMO7rT0Bf3gMQ==
X-Received: by 2002:a5d:6702:0:b0:20a:ce25:6590 with SMTP id
 o2-20020a5d6702000000b0020ace256590mr971887wru.63.1650637865427; 
 Fri, 22 Apr 2022 07:31:05 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm6119741wmq.40.2022.04.22.07.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:31:04 -0700 (PDT)
Message-ID: <a5c3512c-771b-9d2f-0701-cadd4da6e85f@gmail.com>
Date: Fri, 22 Apr 2022 16:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/1] arm64: dts: mt8192: Add mmc device nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220407113703.26423-1-allen-kh.cheng@mediatek.com>
 <20220407113703.26423-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220407113703.26423-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_073107_586634_7BCA3597 
X-CRM114-Status: GOOD (  15.89  )
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



On 07/04/2022 13:37, Allen-KH Cheng wrote:
> In mt8192 SoC, mmc driver dose not use the MSDC module to control
> clock. It will read/write register to enable/disable clock. Also
> there is no other device of mt8192 using MSDC controller.
> 
> We add mmc nodes for mt8192 SoC and remove the clock-controller in
> dts for avoid a duplicate unit-address(11f60000) warning.
> 

Applied, thanks!

Matthias

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 +++++++++++++++++++++---
>   1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index a6da7b04b9d4..18a58239d6f1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -985,10 +985,36 @@
>   			#clock-cells = <1>;
>   		};
>   
> -		msdc: clock-controller@11f60000 {
> -			compatible = "mediatek,mt8192-msdc";
> -			reg = <0 0x11f60000 0 0x1000>;
> -			#clock-cells = <1>;
> +		mmc0: mmc@11f60000 {
> +			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11f60000 0 0x1000>, <0 0x11f50000 0 0x1000>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
> +				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
> +				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> +			clock-names = "source", "hclk", "source_cg", "sys_cg",
> +				      "pclk_cg", "axi_cg", "ahb_cg";
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@11f70000 {
> +			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11f70000 0 0x1000>, <0 0x11c70000 0 0x1000>;
> +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
> +				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
> +				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>,
> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> +			clock-names = "source", "hclk", "source_cg", "sys_cg",
> +				      "pclk_cg", "axi_cg", "ahb_cg";
> +			status = "disabled";
>   		};
>   
>   		mfgcfg: clock-controller@13fbf000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
