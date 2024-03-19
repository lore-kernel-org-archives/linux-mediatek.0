Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4A7C54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 11:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZqToxMOSNljykLODSicskLF/tbjx6+nx9rh3Nead4s=; b=GMcC86IgggCH68vQ9FwRRool+Z
	TfhOOmBTKv9lvwg6m9XCMbRhNBRcBe9lqbcMlSLu0jlxZ9NbEsy0bTRv5O45oXt37cG6F1k17X/od
	avzX+INkARf8GPCOtYekPYIAJzN9FQxngCOtKAGJZ3aLKotOmFSZLUCI0OTicwovjm5RCNk7w2vil
	7oZ/55Nt/bZ0shLc6Jr47GnxGahUnkNXQFy9sNFLdy+uix+tkysgBbw4AughhetgjPDV0GQ8rX5QH
	tvUVgICnTp51Ve491IShoNSs72f8AGJfLZpTTF9SAPZVn7nJPH3vCLU/xTbSD0KYjFzFKXyTPymlp
	4ry8bBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXyg-0000000CWqC-2g99;
	Tue, 19 Mar 2024 11:49:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXye-0000000CWp2-0Zg0
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Mar 2024 11:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710848994;
	bh=XjwqH/orhjkZ0M+hpo2MkrPi3tiRJAGJANekrAToRFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hdjF+s76ZX6f82fXCMhywdS8f110HtGt1F3897ZRNTR7MnmZ4cagGI8KkjsPdtAKw
	 I8SKyoqHCcni81f3nxHK/uzeHyaJUfkHIvgUa+55kLJ7A/SygzjvtGZD379g/IormO
	 4OROGPL9qCBwueXMrWVCckjbtJHDWhBt+wFofBjhaAFJv0yHzykO+uMNXzaX2LRJx/
	 QVwha6X7FjO0x/7YliLPi1v/lb/GDAzvXjbX2HcHLtWQsV1t/pSdj7ya3dk1MJje62
	 3OMj/deS47o3lrwcjOQH8MZw9QS6uh9nAq25HZWAdL7+/tbuQXFOkvngTb+Pra4QNa
	 Jw61YfrVUOk+A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 33F69378203E;
	Tue, 19 Mar 2024 11:49:54 +0000 (UTC)
Message-ID: <34e75ebd-b01c-430a-a051-47489492c189@collabora.com>
Date: Tue, 19 Mar 2024 12:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] arm64: dts: mediatek: mt8186: add default
 thermal zones
Content-Language: en-US
To: Nicolas Pitre <nico@fluxnic.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240318212428.3843952-1-nico@fluxnic.net>
 <20240318212428.3843952-9-nico@fluxnic.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240318212428.3843952-9-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_044956_349496_AE7DF2DE 
X-CRM114-Status: GOOD (  12.72  )
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

Il 18/03/24 22:22, Nicolas Pitre ha scritto:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Inspired by the vendor kernel but adapted to the upstream thermal
> driver version.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 236 +++++++++++++++++++++++
>   1 file changed, 236 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 7b7a517a41..9865926459 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -13,6 +13,8 @@
>   #include <dt-bindings/power/mt8186-power.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/reset/mt8186-resets.h>
> +#include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
>   
>   / {
>   	compatible = "mediatek,mt8186";
> @@ -2115,4 +2117,238 @@ larb19: smi@1c10f000 {
>   			power-domains = <&spm MT8186_POWER_DOMAIN_IPE>;
>   		};
>   	};
> +
> +	thermal_zones: thermal-zones {
> +		cluster0-thermal {

Please use the names that are expected by the SVS driver.

Regards,
Angelo


