Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE81C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMg7icjeG89PrUOfRTyZk0yCyfktq3KwivNjgB8ujGA=; b=TfcoLrXHKFlOSeDhbCR2rLTxy1
	nT5GvMwbxaOXnUiw2kRSZU58i2cB4GzT/JLDyIayR1c6mFKo6AON118Kv0FN67qhdmBVnzeal30GJ
	CJMD4IB9j/AMWsSQhjaPTk6Mgb1Bu9qcdGUfTgnZ3MExhozcsYSHpE15Mg0dam2dhiY7q+A2yteP6
	WpE60iH4Tboekjx4hyWjdb+loQcBGF8ot9Da9N5m5YsTk6PF1bvM3pGTjjLNZ3/uP660ZKq1REgN1
	Pm3tLhwYdXe3DrktutJvnCit6GCAWLiSiD62SFpQDgifojdcU3UmiTBI/e1FH54SnqDT2mrrmbf6p
	gQBXvmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3d9H-00AdLJ-21;
	Mon, 29 May 2023 13:42:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3d9E-00AdKJ-0L;
	Mon, 29 May 2023 13:42:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30ae69ef78aso967406f8f.1;
        Mon, 29 May 2023 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685367773; x=1687959773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMg7icjeG89PrUOfRTyZk0yCyfktq3KwivNjgB8ujGA=;
        b=jz3UGmF4zV/9ZmH3OmhLmGLamQqD/jZ4tmokA/ET2IpieZgSY68L0+c1ietFsX4TU7
         6BSGEZT3NGRiZ+MieAT8hphWP9r0eX+UwKn+A7HRxoS7fj/D08/TqRl2aTKUbN+z0Fuh
         BI2tXbCqIKrUNKJWjn2YP4s+qlMVhimEP+zMosSsk45/FBFs0lLVwPZsZeQRSqXlZaHy
         9WlKGeT43JbCWOF/Orv0EWP5LuSob5rFTnfR5yHX77ec1qv6eORm2OLXTL81V+9Nd3jL
         CAPia/n8/Pw9NAKK00E/V3MRG+iEFCcyLsH3fW/y+xf9g0v8IYrtsdQ8Ws0OLjSsP5Cc
         fqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685367773; x=1687959773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMg7icjeG89PrUOfRTyZk0yCyfktq3KwivNjgB8ujGA=;
        b=Ubb+7jA3XcOHZiut/SS20MNaVekwreLCfdRo6j7g3prkpcx3bBK05Zbc32xegfnmfH
         54KH7HMUUjrYa4vSx0GX+HhuyUrbnuEwlxj85GkUaSZtN7olFK/5a/+4aeK4nRsFrtXu
         4itxfiXyWNMeHzHNZy23lEXJgmzbun3jPQJxUXLzGKT2GT9RscRhuFob8hqisWzcRgUc
         M59RTNLiuARak+8qkj28EqsuAQ2OpD4VYTIqeHmKjdxOVw4lTuzq93egRngctGS59ghW
         GiMINEqlJqGLSLGnQR5ToYf6rU2QKoQivrlxd7xTBtYBwV4Cg7mrx6aacQj8dUejzkic
         6Iag==
X-Gm-Message-State: AC+VfDwN3hPTHJ9UTkPd5WyXUz7Qtf+fHc4yOZYfTfFKsv2KdKilCaHW
	aFLrfFpbPVGLZB+FwuyLIaU=
X-Google-Smtp-Source: ACHHUZ5+STvADmKorwh7htg0ZWvj2+Br79ZOgigmjGtwFRYM3+R9pxPmtZn9DGFvsWZ/nDVJP5aIfg==
X-Received: by 2002:adf:da52:0:b0:309:7010:b869 with SMTP id r18-20020adfda52000000b003097010b869mr5917714wrl.8.1685367773521;
        Mon, 29 May 2023 06:42:53 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f8-20020a1c6a08000000b003f41bb52834sm18081032wmc.38.2023.05.29.06.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:42:52 -0700 (PDT)
Message-ID: <2ac28066-9798-79d7-5247-6af48ac95311@gmail.com>
Date: Mon, 29 May 2023 15:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 1/6] arm64: dts: mediatek: mt8186: Add MTU3 nodes
Content-Language: en-US, ca-ES, es-ES
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
 <20230324021258.15863-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230324021258.15863-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_064256_150146_4CEC0EBF 
X-CRM114-Status: GOOD (  14.31  )
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



On 24/03/2023 03:12, Allen-KH Cheng wrote:
> Add MTU3 nodes for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 68 ++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index a0d3e1f731bd..178421fd8380 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -981,6 +981,40 @@
>   			status = "disabled";
>   		};
>   
> +		ssusb0: usb@11201000 {
> +			compatible = "mediatek,mt8186-mtu3", "mediatek,mtu3";
> +			reg = <0 0x11201000 0 0x2dff>, <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			clocks = <&topckgen CLK_TOP_USB_TOP>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> +				 <&infracfg_ao CLK_INFRA_AO_ICUSB>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port0 PHY_TYPE_USB2>;
> +			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			usb_host0: usb@11200000 {
> +				compatible = "mediatek,mt8186-xhci", "mediatek,mtk-xhci";
> +				reg = <0 0x11200000 0 0x1000>;
> +				reg-names = "mac";
> +				clocks = <&topckgen CLK_TOP_USB_TOP>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> +					 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
> +				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
> +				interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
> +				mediatek,syscon-wakeup = <&pericfg 0x420 2>;
> +				wakeup-source;
> +				status = "disabled";
> +			};
> +		};
> +
>   		mmc0: mmc@11230000 {
>   			compatible = "mediatek,mt8186-mmc",
>   				     "mediatek,mt8183-mmc";
> @@ -1012,6 +1046,40 @@
>   			status = "disabled";
>   		};
>   
> +		ssusb1: usb@11281000 {
> +			compatible = "mediatek,mt8186-mtu3", "mediatek,mtu3";
> +			reg = <0 0x11281000 0 0x2dff>, <0 0x11283e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
> +				 <&clk26m>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
> +			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB_P1>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			usb_host1: usb@11280000 {
> +				compatible = "mediatek,mt8186-xhci", "mediatek,mtk-xhci";
> +				reg = <0 0x11280000 0 0x1000>;
> +				reg-names = "mac";
> +				clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
> +					 <&clk26m>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>;
> +				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck","xhci_ck";
> +				interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH 0>;
> +				mediatek,syscon-wakeup = <&pericfg 0x424 2>;
> +				wakeup-source;
> +				status = "disabled";
> +			};
> +		};
> +
>   		u3phy0: t-phy@11c80000 {
>   			compatible = "mediatek,mt8186-tphy",
>   				     "mediatek,generic-tphy-v2";

