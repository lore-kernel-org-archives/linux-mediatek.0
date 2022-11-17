Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AFBC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lgeyqq4V2xeaVGb3HNx7wFZLtkDW7im+x1haPklssOU=; b=zCUGPOjpQVfLPR6l2JQQAJvQJR
	6B2BY1wQVFBHcnRejZAid1jHvCzD+8lS/uRaBD5L4hmfRxOiRhzxMBB2Z1nRFPsTqVKykUjZRnqMB
	TZ7CH4ONQSRD8YyQDdsRGRT3/v4Tda7DOZ3cgXMH7qmiSl7oGjY0ul4N/R2zVQ6SiMaqUlEYtLRBy
	HgpDc5cDMvxFj8t6x0ty5w9zew11xMuN9m5iJQ2z8nqyxdkxAghhgOt5G7i2dEXN5u3frgOTZ74+k
	YIdqEKK1mai37Dkv/UTeX6ZqL2jl4bASoW0ggck4j7IoiXaKRSKY1fmDRSewSYo/M1rSov4phywXk
	r4DaxdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhCp-00FZaf-3h; Thu, 17 Nov 2022 15:53:35 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhCm-00FZYb-9Y; Thu, 17 Nov 2022 15:53:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id w14so4558375wru.8;
        Thu, 17 Nov 2022 07:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lgeyqq4V2xeaVGb3HNx7wFZLtkDW7im+x1haPklssOU=;
        b=COleCBgGfskJyMtBdjyzQ5TJAu6BVoUip0XI2qaMKzeWYtVroAKQ7km0EsnQBtSdJe
         rXeZtFpTu/oQFowU9hS4+AndKvwRgXo0qxQg4wPHtIDeYqqSef9QFiD/TptIXzFA6pqJ
         vv64a5vwXLnQFE0oHMQIAWF3AdszFQ4+muH7lSj4np6Yzg8LmDQ1Q81+tYsN0/dLJcl2
         rqYr52FAiIV2j0cMqXXuZY5GOumjiVvX/xAWE058y/vXy3BScU8moxvB1j51Nwj7Phup
         LgcHAwGleOm+NlYwuM1Q9AlsivIjX6Tamr45Bpa/sIX2bXXy9S14d1emCeXPGXQ4eSsj
         KBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lgeyqq4V2xeaVGb3HNx7wFZLtkDW7im+x1haPklssOU=;
        b=bEFDDpfW4x171r6OuW2AQn5IavHLbdvE6HyaN1pAxr3X7DH+xzol5oVpT8PULdj6yj
         631Mbmrei5APSe16EPoJiS9X+yE92ps7z+K+PEPE3Avvyk3A9oWY5s/MSRlY5LuwhL79
         8YX44smnsR43T6EEDzKvOiZrw+UwVQzSjk9JPILxvNd3ea6wiAfx+fHCMDwAsQynsOPn
         9UvAKgn9Hu6ASprZXEDfPNTDw4J/VPLbtgKcoxOqUySeU1p8VUSHcvajwHoLn51zn0tI
         Fpqd0GMRaBml3wNw9oE7cbOeS8jIQd9NcenjTihSGe5dIKLnM7a+JmlLjRWSx5QbfzLq
         ijaA==
X-Gm-Message-State: ANoB5pkN4UWLe4gFjBzkDfiapRO6m34Q8CIPluqoMbXNXqbDY1o97Zty
	V6BN1yGRevVpgTn9gmpzS3I=
X-Google-Smtp-Source: AA0mqf6CSXvB7fJEGy8sU3KquiMYDpizvrXZNaALs1X9u0ExYmw9K8LKvME/eHVIFW4lj8rV1Xqoiw==
X-Received: by 2002:adf:f601:0:b0:236:55a7:348f with SMTP id t1-20020adff601000000b0023655a7348fmr1913435wrp.331.1668700408256;
        Thu, 17 Nov 2022 07:53:28 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003c21ba7d7d6sm1571445wmr.44.2022.11.17.07.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 07:53:26 -0800 (PST)
Message-ID: <fd2a6390-9395-6fd2-04bc-8d9d55c2efdd@gmail.com>
Date: Thu, 17 Nov 2022 16:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7986: Add SoC compatible
Content-Language: en-US
To: matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, frank-w@public-files.de
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
References: <20221114121653.14739-1-matthias.bgg@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221114121653.14739-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_075332_388152_B02135A2 
X-CRM114-Status: GOOD (  16.28  )
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



On 14/11/2022 13:16, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Missing SoC compatible in the board file causes dt bindings check.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 

Applied!

> ---
> Changes since v1:
> - Move SoC compatible to first line of the block
> - Add SoC compatible to mt7986b
> 
> 
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 1 +
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7986b.dtsi    | 3 +++
>   4 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index afe37b702eef9..0e3b603159477 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -9,7 +9,7 @@
>   
>   / {
>   	model = "MediaTek MT7986a RFB";
> -	compatible = "mediatek,mt7986a-rfb";
> +	compatible = "mediatek,mt7986a-rfb", "mediatek,mt7986a";
>   
>   	aliases {
>   		serial0 = &uart0;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 72e0d9722e07a..3c52ec3f99a31 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/reset/mt7986-resets.h>
>   
>   / {
> +	compatible = "mediatek,mt7986a";
>   	interrupt-parent = <&gic>;
>   	#address-cells = <2>;
>   	#size-cells = <2>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index 3443013b5971e..d03e66a84c5d4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -9,7 +9,7 @@
>   
>   / {
>   	model = "MediaTek MT7986b RFB";
> -	compatible = "mediatek,mt7986b-rfb";
> +	compatible = "mediatek,mt7986b-rfb", "mediatek,mt7986b";
>   
>   	aliases {
>   		serial0 = &uart0;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> index 23923b9f8944b..db5189664c29b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> @@ -5,6 +5,9 @@
>    */
>   
>   #include "mt7986a.dtsi"
> +/ {
> +	compatible = "mediatek,mt7986b";
> +};
>   
>   &pio {
>   	compatible = "mediatek,mt7986b-pinctrl";

