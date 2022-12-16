Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358B3C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eQToE6HYEXSjmjEz9Jwn20G/19K2LtofqYs+NdFsXk=; b=2pp2dhRGoeJEfE14lM/qd1AyWV
	MU2A4sbGnBJyVpEX4tAIuE++kShnPSDmK8UFIFmVvjh8AumYLeXwMW1fcOBNRHpgucgwSJBUV0lNx
	+ZEFIkrZg0iaJkivdR2Dk7EY0igVyLAhaaIgjaWhNTeUAZzRHkhajDATs/KSybdKIOz+t7TQjv65m
	rg+Ag/alwvArti+wvilvupjHw5AD+AX7CV5vR4UhqOAWDTgMocqCVYVJZ9u7Ch0VSiyb40MSNCb2i
	POSTa5iGKg0Qv/hQ7kKsjmzbN8FcdwlTYtm4iBKpqIcfStdMI9he0Po6qb/xCRqcccF6AwpVFftZH
	6Fos9JMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68wA-00EVdQ-5a; Fri, 16 Dec 2022 11:31:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68uR-00EUlr-Km; Fri, 16 Dec 2022 11:29:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso1515090wmp.3;
        Fri, 16 Dec 2022 03:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9eQToE6HYEXSjmjEz9Jwn20G/19K2LtofqYs+NdFsXk=;
        b=j8y5udIPLX/hAWg2cytn1YqmlvAGn8vXbrhcMxBw37fgakqfohqex/9DKsXoT1b4R5
         IGCUiBv8a/klIotJyQrTN0bht7j1md8dsSAl5K8ZP2V1WSLf/btkrUitgo/l7DSoOOpj
         FDgkSAtJEB1IZUGkDoeqqeQIxdcdx819+CK3pc5eaxuEKSOAs3zgTY7uqeHmKa3ipS7q
         WpjVCFe51HPqPNsqzvXKBzPHsvRyClPJyHP1XUCIGddpFwPKzC15Rhnwow40oWVprXt6
         A8ULQJJbeM/9baXI1koH5mpVTs6GpUt5qGnXVbs/+3JzjGqKh5wUxQOha+xfCE1l+vMg
         5gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9eQToE6HYEXSjmjEz9Jwn20G/19K2LtofqYs+NdFsXk=;
        b=ig4hY4MeNo2km5ZqgCGasop/vL6Jv+lO2EV2gtuSZYrJh27vht4c1b5WA/XetOkVz0
         bjjhVjSIIZsx+//oBfy4OROL0cxiBJCL0xSRFvjr3dsLI0TyeZK2CJonboQ78+VYKQfc
         nQVUgwAqdq+TLw2dCmwUaalRUnjA3bO7vLC7TSQW6XdrTYnkoXqq1kzjQqnyeZxY9fta
         n5PJfCELftQy6xexTzddx2OtVy8kEAPuLt053p7Bm4DvCgTaEIe422aeQGnyS1aEfKS2
         MfcPN/gZJ/BE9RfkBGSA7+AMYyX2Bo1NtihcchZZ96zSnOywq0d7bzQLG7QJxsQBJjqF
         0xRg==
X-Gm-Message-State: ANoB5pk9iCknpbXHIvW6+mrQhHPNti3G/yRpbUw5QswzuvyiSHhzv3vL
	H9tKUAyXlACBwshexo9vR68=
X-Google-Smtp-Source: AA0mqf6DxqrvszFL9kf7adb8ttrB79MhtC5rbhg8MnyNBTwJSO6H1mtyRqK7RwTUw9hvEU2n4rmcKg==
X-Received: by 2002:a05:600c:5106:b0:3d1:c8e4:48d7 with SMTP id o6-20020a05600c510600b003d1c8e448d7mr34176670wms.40.1671190186151;
        Fri, 16 Dec 2022 03:29:46 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c4ecc00b003cf9bf5208esm10657902wmq.19.2022.12.16.03.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:29:45 -0800 (PST)
Message-ID: <d7432483-7244-1c6e-cff7-ac56a67705a7@gmail.com>
Date: Fri, 16 Dec 2022 12:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8195: Use P1 clocks for PCIe1
 controller
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tinghan.shen@mediatek.com, weiyi.lu@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221214131117.108008-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221214131117.108008-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_032947_750929_E5A8F313 
X-CRM114-Status: GOOD (  14.90  )
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



On 14/12/2022 14:11, AngeloGioacchino Del Regno wrote:
> Despite there being some flexibility regarding the P0/P1 connections,
> especially for TL and PERI, we must use P1 clocks on pcie1 otherwise
> we'll be dealing with unclocked access.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Seems my mail got lost somewhere:
Both patches applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 5d31536f4c48..e61944510b8e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1258,9 +1258,9 @@ pcie1: pcie@112f8000 {
>   
>   			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P1>,
>   				 <&clk26m>,
> -				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
> +				 <&infracfg_ao CLK_INFRA_AO_PCIE_P1_TL_96M>,
>   				 <&clk26m>,
> -				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
> +				 <&infracfg_ao CLK_INFRA_AO_PCIE_P1_PERI_26M>,
>   				 /* Designer has connect pcie1 with peri_mem_p0 clock */
>   				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
>   			clock-names = "pl_250m", "tl_26m", "tl_96m",

