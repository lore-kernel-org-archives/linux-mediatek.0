Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15C3C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:12:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6846198A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6846198A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z92OEsXIGLPxFkjkc95tyCerx8SR2VSBaFflLZu4Qvk=; b=Ouyf9D2x6xiX8RQy+jQy4in16
	HTmctWcgcKEmtz/xVxpwKdpIh2gkGhVkfegJIVCjhjD3Y1r1OlNAlIiKvbjByHgM99rmw9PxPE1wK
	yq/BspkRDpag5KzEUWZwlXCLkzBvzn+heBppn4vgIh3n6U9JVsw1Eol4YRAyw7Q8Gks99gOUigmfq
	nl85GatbSi3NkhA0aCRyw1LMfAUpvJxdrkD2wcnmwkzxHh/65OSfzvrg66Sg32VY97ay+MLfbXcJL
	BSjxQDTFGxkpLV+Lk+zEq9NjmKMOdp0I5hLoM76lJJqndz+Npm+rPH0NMJs9bT9cXyzhiBvGo6SKz
	rFWoUe5Wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR12v-001rBB-Dh; Mon, 29 Mar 2021 23:11:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQuA0-000kIf-9d; Mon, 29 Mar 2021 15:50:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id c8so13335572wrq.11;
 Mon, 29 Mar 2021 08:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vVulNAgkS7cIMGOyXspAyuoXQyG90qaflFWTYWzViY8=;
 b=us3HZyuNffumsXVeXyRuENc7s34ifchnF542A6lj2hS+NnszHKEcwB8Y+AUtrA/8Rm
 t/jA7hiAGrbtp/buv0has+6o9C2u24MMu26s6ZFDjJaSSWOGzyK7bnajq8Oj8QPbaLuc
 DWdEk8Cb5XtSCAqWsy7XbwxOj5wlI8IpPvfdvp7ysAfMvL2JR1cqXn4xG/LnLKayqnVY
 xjt14dtv0RR8gNmvsD0iM2a8LHlBSxtSIFVeeXSfZtfFltyCiW75R7Ls+dM8U/bzeykE
 wZVC4ACAUziojXxTWq1oS011PND6G/ZPTyCIy5OlHcGsswCp4llo2Tww2d4qHlc2hqL0
 1btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vVulNAgkS7cIMGOyXspAyuoXQyG90qaflFWTYWzViY8=;
 b=sr2CBlAN+/mJM3433ws83IPjIWzA/OSBZRN7cCHFfb4iVxMz+AS2fdk93R6chcNdiW
 1odN0KWzLp4lTfB2sOjmLlcawnAyCGjE+ZvIHI39gWCvjHppluRKhYmE5Jpt4XRduI0v
 1IQV+9nSUOzvHYOoImHiHMx9C2pnmL5CMrqehQgYuXzkmbHbfTQapyRvmCOTC3a38b58
 I2TLiXf8SCUIvYZ8JMhacIplVhZndJBX8pCzTJeraBaDlbtPxFeptUnMaaBb+ZoIHKbh
 qD5UAbkYaJLLi7kaTbq1caX5WL7PBSLLzED8kOscqcB/D3BKiye6KdcxLHkpr6mM8Yyx
 KyDw==
X-Gm-Message-State: AOAM532GQ5b9PuHrr44oCeZWl/QsTXCEmMwF6BnEuJu7cau6iS+9uMov
 KzAelWaIXwieudiiOZrzOIs=
X-Google-Smtp-Source: ABdhPJy0o4dA+W1psLIjVopkFnM6kqV/xT30PKw+7t3FhVq6F4Y6LEVnDswVcB7WIALHAoUL/sGvWQ==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr29467162wro.337.1617033034649; 
 Mon, 29 Mar 2021 08:50:34 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id f2sm31416341wrq.34.2021.03.29.08.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 08:50:34 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: add MT6779 spi master dts node
To: Mason Zhang <Mason.Zhang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 hanks.chen@mediateka.com, wsd_upstream@mediatek.com
References: <20210226105918.3057-1-Mason.Zhang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d3666864-cb46-755c-0d0d-d05ac9af0379@gmail.com>
Date: Mon, 29 Mar 2021 17:50:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210226105918.3057-1-Mason.Zhang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_165052_292912_990B1351 
X-CRM114-Status: GOOD (  17.93  )
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



On 26/02/2021 11:59, Mason Zhang wrote:
> this patch add spi master dts node for mt6779 SOC.
> 
> Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi | 96 ++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> index 370f309d32de..ca72eb09cff9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -219,6 +219,102 @@
>  			status = "disabled";
>  		};
>  
> +		spi0: spi0@1100a000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x1100a000 0 0x1000>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				<&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI0>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};

Please also update binding description accordingling and add as another patch. I
wasn't able to find a 2/2 neither. I foudn v1 2/2 which on a quick look seemed
the same as this patch.

Regards,
Matthias

> +
> +		spi1: spi1@11010000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
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
