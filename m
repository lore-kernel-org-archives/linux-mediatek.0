Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DC5C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:24:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C27C64E24
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C27C64E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y/Ua+J0y1X3jyTad+G7vSCMG37ROguBnDcu3qqE4AV8=; b=AuO+0E7Ffb1gtzKUsKi4qVnlb
	GSjKEc1U8kiJSzWs9x85lvuVczo8o8SRCdsCsPWoUQTisDtEj8PstwYdlJQ2+il8jYvnAah6CbUqs
	1cseQ78gw0b4Cc2+K9ZeR/gZiTosF5SzCr/0TPLOSrB/88Lv4Hk/NlVo4pEBEGTMv2gGTiph02Zh5
	x97aesDiiGoDXRjlYqgHf1h+BoH1vAPVeqlQLGk2ytbJtgAH8h5PLduz7EyHvkgIlVnKFwTzmXkyA
	le+7VKyn05cRjTMxYTjmTZG/LpGbSX6eQ4ec+OEJhITh7tEssvi85oZqSPB8HIEEUrB3gdlgqBmO/
	vBmaIulQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l69to-0003JE-Pi; Sun, 31 Jan 2021 10:24:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l69tm-0003Ii-Ji; Sun, 31 Jan 2021 10:24:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id y187so10658262wmd.3;
 Sun, 31 Jan 2021 02:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ru2rO2yhua9+/LiL9x6aOskXku+UM0Dk2x5D7eM0aho=;
 b=QY5W8LpiU3GmqEvw8ULAPBNY3Rkks478hId72TlT99mTaxuTis9f7GlqCuBNRyysnY
 9AQuQktXE8rofClF3uduebi2eb3IxiEBsVX6jiAKrmE9nmt7HG35IJDjLY1FN2ZQi3Uq
 AdAf+0RQ0BUTIAJ1/jzUyRxKXg6amOMEtJUnHLm/8qShzCibORhcp5wgvCt7vwgWE51K
 6SECAT3ZNXTWzpoUaBpJDjZzOd2gcpPY+1Gg6NNG/PaAzN+stNGVS7HB7sOUpF6xMSAU
 2RKdodUZ+FmszqPZkIJNPRMG8+qLFZkE7aWZ+PO40jRIKhHg22+nmIh591pW+AbqL8Rm
 iSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ru2rO2yhua9+/LiL9x6aOskXku+UM0Dk2x5D7eM0aho=;
 b=lsAL4sTPP6x+P/OAynR7oDu/nCVs+ZC29bs5G+L6GhRhmyY1QYe7Kogodlq7/XrQJ0
 8wz8xu475co5OzWtcyvM5dLBW9KcL5ZFuDyHkycqCYQslaXJzDfjRCtcKdF+ASJTSzwN
 vYmZaD+yhGgmGgL7fm51b32MmX2O5BzPh0X7Yw5fdFVPd5xD1swimKuB5KwwU/yeSRiW
 o9aySmUzLWL1hNzQeBJgZx1h4fVHC41B8srqh7lpClfwJfSynAVKxtO72iOfBZKUPDGh
 sTEbFY0525DO1NKFMd2dNjC1wKXJgudTg8uCEL72E0vUeObP7I6xrR0oY+7IeKwuYGf5
 E5hg==
X-Gm-Message-State: AOAM531dUOZGfGpNdJL6lRE+7bgso8hO1jxrZ1Dk8BSARqi+OIaXtMhm
 JBw0lqyUEIXtZemXqvmTozw=
X-Google-Smtp-Source: ABdhPJwj9QtL7ZtO8ulHa+YKzFUenC9NT3LZxlPFnC4njmGylmm+KEpJk4h4xPKyxhtYkS66PMDfuw==
X-Received: by 2002:a05:600c:258:: with SMTP id
 24mr10536856wmj.161.1612088645329; 
 Sun, 31 Jan 2021 02:24:05 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c5sm22763738wrn.77.2021.01.31.02.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 02:24:04 -0800 (PST)
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: mt8516: add support for APDMA
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
References: <20201209114736.70625-1-fparent@baylibre.com>
 <20201209114736.70625-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <80b768e1-9e46-88d7-a56b-c90a46bd3a10@gmail.com>
Date: Sun, 31 Jan 2021 11:24:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201209114736.70625-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_052406_714095_4790183A 
X-CRM114-Status: GOOD (  17.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/12/2020 12:47, Fabien Parent wrote:
> Add support the APDMA IP on MT8516. APDMA is a DMA controller
> for UARTs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 

Applied to v5.11-next/dts64

Thanks a lot!

> V3: remove unicode symbol that slips into patch summary
> V2: Add missing dma-names properties on uart nodes
> 
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index e6e4d9d60094..b80e95574bef 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -276,6 +276,27 @@ gic: interrupt-controller@10310000 {
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  		};
>  
> +		apdma: dma-controller@11000480 {
> +			compatible = "mediatek,mt8516-uart-dma",
> +				     "mediatek,mt6577-uart-dma";
> +			reg = <0 0x11000480 0 0x80>,
> +			      <0 0x11000500 0 0x80>,
> +			      <0 0x11000580 0 0x80>,
> +			      <0 0x11000600 0 0x80>,
> +			      <0 0x11000980 0 0x80>,
> +			      <0 0x11000a00 0 0x80>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_LOW>;
> +			dma-requests = <6>;
> +			clocks = <&topckgen CLK_TOP_APDMA>;
> +			clock-names = "apdma";
> +			#dma-cells = <1>;
> +		};
> +
>  		uart0: serial@11005000 {
>  			compatible = "mediatek,mt8516-uart",
>  				     "mediatek,mt6577-uart";
> @@ -284,6 +305,9 @@ uart0: serial@11005000 {
>  			clocks = <&topckgen CLK_TOP_UART0_SEL>,
>  				 <&topckgen CLK_TOP_UART0>;
>  			clock-names = "baud", "bus";
> +			dmas = <&apdma 0
> +				&apdma 1>;
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
>  
> @@ -295,6 +319,9 @@ uart1: serial@11006000 {
>  			clocks = <&topckgen CLK_TOP_UART1_SEL>,
>  				 <&topckgen CLK_TOP_UART1>;
>  			clock-names = "baud", "bus";
> +			dmas = <&apdma 2
> +				&apdma 3>;
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
>  
> @@ -306,6 +333,9 @@ uart2: serial@11007000 {
>  			clocks = <&topckgen CLK_TOP_UART2_SEL>,
>  				 <&topckgen CLK_TOP_UART2>;
>  			clock-names = "baud", "bus";
> +			dmas = <&apdma 4
> +				&apdma 5>;
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
