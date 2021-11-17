Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:28:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1876127C
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A1876127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0bA2+F2uqik9YplybYmXdBkq9aN5ktW3ukqJNrxgqI=; b=Yp4NXnyY5OvhqL
	LSWYM75gmGRcmFfAEUH2hVUwXYbz/gnFn9NY5cs1q9Tc+hPfjaWeiYf0OGViMa9oNQF0yPHQHtmz8
	Y/BuKHdllJFGpgGvfsf3Hcg8fVs7Bu73ANdBds2GL8ju47lI2I/JABo83Eax+M2+uPK8kt20Ijir3
	ijZmC2BFMocDvgi3GQm433ker9LbbRH6JXS9BY2Ef+s3WMcchOgWjjzyxc8GclM2RE4O87dmUaCGO
	2DjQs7YTVXxF9qT7C1ZOtxB3kgREFMXx+fskpmC9bp1CH8w3NRs4nz4KpUz7O7ntBNJe/ux9n+MQ8
	bQIEerYRrvluReDVvCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnOjf-005qPd-Pm; Wed, 17 Nov 2021 17:28:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnOjS-005qNI-VC; Wed, 17 Nov 2021 17:28:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o29so2942910wms.2;
 Wed, 17 Nov 2021 09:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xCAjuM6xrMxdm2CIKZbX9BC7fNzMpEXwSr+NlcFIgXY=;
 b=PS5HmOY111lxaOKyFH5b7wLUoIO4BkbIWwJWMSbYG+9lI+D9XepvBN4yIdSO22FXET
 lcsowfM2saoih0R3aQm/0loM9yfqCRB6khY8d1iP9lDM+3tqtAiKsxr5EF4eZ8Xw5BjS
 b11+/u7HBi10leypAOTxiE6vWIvvE50tvUtpVw91XbWl93OuEwHJkuT7uY7oguiKgq2q
 7vcnwYWGJi37PiLNGUNcygYLgC7BvONlH0t+xu3cjjSQp683FUb+Xn5d5ids/6N2XLut
 nLE7I15VjcmNV0RpqMZruHqCwS5sRubsgKNkJo9P6ij91/sQT3u0NaVFDbiu5R8Hpe3q
 MMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xCAjuM6xrMxdm2CIKZbX9BC7fNzMpEXwSr+NlcFIgXY=;
 b=1FPWhkzwQ9FzAPDJXPL6OwE81R+n+EQCUt/kDi/dnjP/aNNCU+NFLTBjPEB95Fgv5I
 czwdlQgG/adeMFKnqxrbORM3AecbGolS9963+ChafV7YEFqAMFe1TFQal0L1pSZAK7ab
 49FxPCOO/M0y7OgZv40kny2sv+lMze5U2YByxn+bX8yNVY04WD+AWnSrdld/Sgi3rqUx
 WtX98awHN4tY/BrNXR+40kxDSoxqZMdX5xCMwePJ+6OzQNcH+K1wXetc9KmCX8kw2uxI
 KsMylRDJaZWq/pc7z+MIcUhGmb4dDP1P4C5xOs470fBWj+YOAgnSoaUOU3tIcB5kxRwE
 u6cA==
X-Gm-Message-State: AOAM532TobP8amxgglCejIGr/YUvAiKmebiBiWMNcqIwTENuH6aqnswZ
 0sUQfv9jBfLinnQwgjQFCOU=
X-Google-Smtp-Source: ABdhPJwl4Lr4z57Y0zAraZ6nqqnmdjjF1I7QV2xUuRwF5x+SjagSG9FFzeJcB7mHvGPWPSqjqhTPsA==
X-Received: by 2002:a05:600c:253:: with SMTP id
 19mr1528602wmj.179.1637170104238; 
 Wed, 17 Nov 2021 09:28:24 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id n8sm464457wrp.95.2021.11.17.09.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:28:23 -0800 (PST)
Message-ID: <4a2afd96-49c6-3ee8-bc00-42dbd87a71cb@gmail.com>
Date: Wed, 17 Nov 2021 18:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RESEND] arm64: dts: mediatek: mt8516: remove 2 invalid i2c
 clocks
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211110193520.488-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211110193520.488-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_092827_058390_E6A2C46B 
X-CRM114-Status: GOOD (  15.34  )
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



On 10/11/2021 20:35, Fabien Parent wrote:
> The two clocks "main-source" and "main-sel" are not present in the
> driver and not defined in the binding documentation. Remove them
> as they are not used and not described in the documentation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.16-next/dts64

thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi | 27 ++++++------------------
>   1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index bbe5a1419eff..d1b67c82d761 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -345,14 +345,9 @@ i2c0: i2c@11009000 {
>   			reg = <0 0x11009000 0 0x90>,
>   			      <0 0x11000180 0 0x80>;
>   			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_LOW>;
> -			clocks = <&topckgen CLK_TOP_AHB_INFRA_D2>,
> -				 <&infracfg CLK_IFR_I2C0_SEL>,
> -				 <&topckgen CLK_TOP_I2C0>,
> +			clocks = <&topckgen CLK_TOP_I2C0>,
>   				 <&topckgen CLK_TOP_APDMA>;
> -			clock-names = "main-source",
> -				      "main-sel",
> -				      "main",
> -				      "dma";
> +			clock-names = "main", "dma";
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			status = "disabled";
> @@ -364,14 +359,9 @@ i2c1: i2c@1100a000 {
>   			reg = <0 0x1100a000 0 0x90>,
>   			      <0 0x11000200 0 0x80>;
>   			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
> -			clocks = <&topckgen CLK_TOP_AHB_INFRA_D2>,
> -				 <&infracfg CLK_IFR_I2C1_SEL>,
> -				 <&topckgen CLK_TOP_I2C1>,
> +			clocks = <&topckgen CLK_TOP_I2C1>,
>   				 <&topckgen CLK_TOP_APDMA>;
> -			clock-names = "main-source",
> -				      "main-sel",
> -				      "main",
> -				      "dma";
> +			clock-names = "main", "dma";
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			status = "disabled";
> @@ -383,14 +373,9 @@ i2c2: i2c@1100b000 {
>   			reg = <0 0x1100b000 0 0x90>,
>   			      <0 0x11000280 0 0x80>;
>   			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>;
> -			clocks = <&topckgen CLK_TOP_AHB_INFRA_D2>,
> -				 <&infracfg CLK_IFR_I2C2_SEL>,
> -				 <&topckgen CLK_TOP_I2C2>,
> +			clocks = <&topckgen CLK_TOP_I2C2>,
>   				 <&topckgen CLK_TOP_APDMA>;
> -			clock-names = "main-source",
> -				      "main-sel",
> -				      "main",
> -				      "dma";
> +			clock-names = "main", "dma";
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			status = "disabled";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
