Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2485FC48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 13:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C3061400
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 13:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C3061400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aYvG0nzcyBB91Y7hu1eXHi2UIm731ICuSK3fZDktEks=; b=G+bmuGB8LvRtPLSkeQDOT8/sP9
	38dd60jEl44B3+Xgh/voiphqbqFnoNaQ2L+hhcgtxZC/MQTIgUM59Gjywf66AGVlsOi9hec0IFPKa
	fpIpGF2uq0PPi+Hj3hcw2vmKo2yDNVsJuqDS3LgSJkybW1S+T5WTR+5h9LYVLlLQg4jOoy3xfsZJt
	A22V3rA72C1wrJx1hX0atTENHJkttXNdYPRv4PyRiY9XSHpULEKTGfDHzM6j3sbO72uptttFQ4WQn
	9JPGgW9ydTmdiHApxDfSM0LkwxEc/w+W9QbKAmwDCy0p2KhDmMcDjYKwGma068oMIVKGaE1no7aCz
	QAxTaR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrhgJ-005WQb-3P; Fri, 11 Jun 2021 13:58:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrhgF-005WNB-Fo; Fri, 11 Jun 2021 13:58:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id n7so71265wri.3;
 Fri, 11 Jun 2021 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=65HXSbNbmh2eB86Bo4Ktjk4oUhG8UnCDwk0uApNVoXo=;
 b=vQ2nhn4M1kRI+inZ01ZL0rg1eKcQohm+IhGgChNvONiLqe9p/tKgEzGc1yxiTXQYPD
 RI3zK+MkYajI8+V/tXf0j9MEJsgxQtTOVpPfiKEHD4SJTpaTwZ5EfK0X4YCl4Xf8Bdwu
 Kvt8GR9lQOk7Z2f1Lq+yoOM5LoGQi0ab41KdOSA0jBDf5WsGqh7D1lZXPSa5rY4+lI9r
 amQhgZvD9HOJCJ+XjZrGvtI8mjdVkVEsZ6MNmXumH2VhEK9irMXZ/PscnRp59DCADNQ+
 ugsrorfuA2Aysctc3iw2q/j/0+ZJrcwfwbEpMW90UcT/BpGy/SjWZp3bDiuD3+qUhPEl
 PpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=65HXSbNbmh2eB86Bo4Ktjk4oUhG8UnCDwk0uApNVoXo=;
 b=isCzhuXRmydjNhIf37oomssUdeCONvGztHd3hifrWINeeBoHVQdoHA3VvyVb/PGS6u
 oBjYoy4c7OmmLPxmfqRp07bEctovmaMT+E1Rtk6xaHphYOOBjBn9To8IdlBcYKYAIyBH
 8AW9TjTYYpdD11+Va31wdBHThAC7baGHYCXh9sKIoyaxS7PCKWYarmBeaDiMFF9TQ7xS
 TykIq/X2I5aXw6DeXPhKcweszGh6qgthCmoj1K7kvz/wpYBqSaDqI66XbYNOX+JpieWA
 zoiqpO45rTvmI/HCnJDJyasiJRHhDI57BSblxw01pFpGA3bPNf6jIGorCM4D2ux7ttjj
 GaqQ==
X-Gm-Message-State: AOAM531A5wkYEakmORV2ARAFi4rodWfmhpVAsWJ2xFpMb/JtPYLhMEDm
 UA+ouVYJvXD7NgUVhOalHLg=
X-Google-Smtp-Source: ABdhPJxZlr1sJExAQqIe+Ht9eFJb7CaHNbSMfSYh1iNUYux526F16gInmumcvtcfKoolHwU8y6GSoA==
X-Received: by 2002:adf:df09:: with SMTP id y9mr4379275wrl.108.1623419915200; 
 Fri, 11 Jun 2021 06:58:35 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id o11sm5779133wmq.1.2021.06.11.06.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 06:58:34 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] arm64: dts: mediatek: add MT6779 spi master dts
 node
To: Mason Zhang <Mason.Zhang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 hanks.chen@mediatek.com, wsd_upstream@mediatek.com
References: <20210409015651.11474-1-Mason.Zhang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <faafa83d-4831-2b70-78ec-0e9f3636b5c9@gmail.com>
Date: Fri, 11 Jun 2021 15:58:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210409015651.11474-1-Mason.Zhang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_065839_596768_00821488 
X-CRM114-Status: GOOD (  16.17  )
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



On 09/04/2021 03:56, Mason Zhang wrote:
> This patch add address-cells && size-cells in spi node based on patch v1.
> 

Can you please come up with a better commit message, otherwise patch looks good.

Regards,
Matthias

> Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi | 112 +++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> index 370f309d32de..c81e76865d1b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -219,6 +219,118 @@
>  			status = "disabled";
>  		};
>  
> +		spi0: spi0@1100a000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x1100a000 0 0x1000>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				<&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI0>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi1: spi1@11010000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11010000 0 0x1000>;
> +			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				<&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI1>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi2: spi2@11012000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11012000 0 0x1000>;
> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI2>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi3: spi3@11013000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11013000 0 0x1000>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_SPI3>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi4: spi4@11018000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11018000 0 0x1000>;
> +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_SPI4>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi5: spi5@11019000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11019000 0 0x1000>;
> +			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				<&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI5>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi6: spi6@1101d000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x1101d000 0 0x1000>;
> +			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_SPI6>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi7: spi7@1101e000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x1101e000 0 0x1000>;
> +			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_SPI7>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
>  		audio: clock-controller@11210000 {
>  			compatible = "mediatek,mt6779-audio", "syscon";
>  			reg = <0 0x11210000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
