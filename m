Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9110C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxPMqAY/aU5gIoSiUS92fYAscj+sSWgB4aaWVm2L8Lw=; b=RIy/zzgkRyQ7d5VqCwNJizDhhH
	5g0ZhLV6Ohoa7yKHIS8nrgMSoQekl9YLfLtSno0NcHjegeA27kjKqmRaSIpLz12wI3jqNQIKecdCa
	qPIsCmYZpqYhHT68LL/U17Dc+TzXA0R0zyTDbDJqvD3c1qACsGMjUSaTOe/ZaPA2VwzKTZh+xEtTh
	etk3dxDo5XOCe83nCMtHq827DEQENzTNjUpcO/FZ8tTwJokcIXPbRwti0DDWQp7MbwSZjVbadGcAi
	X8Jwmg3162V4zdNhX9wdFLvZFsA3UV6XePrIhy5osmhBXvM0w4HGCtXOySwH7nm4V5jP+8XmSueGm
	c0H/jDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zvp-0000000E5aL-1EEf;
	Mon, 20 May 2024 10:07:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zvl-0000000E5ZF-1RQu;
	Mon, 20 May 2024 10:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716199663;
	bh=Jl0VSMzpxw+uB3ZgHQznLYmi1oC4WCpBlOZgtEV3Z9w=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cwMtKEnPHOVhyE9B7bNRvji/07H+iAAD+TiOZlwX6sL9cz5I6jICgKOe1JFR+cWqc
	 Ol4wS21c02IOys3Zrclfhxahnq/z3fMWDM2y76akDefFU9D4U/V9dYaGG/5ovYA4Nr
	 kham+RZ162cGdNrUFLFOONayt7N/jD5K/dWdsgKHydCAiFSoth0zOP5LOYzng6qVrU
	 0XPZgPbmy7Bo3KF/R+a+NJfelYDbblq/hFayfB04NvVTHwmMRl0vy3qt2Mabrtgy66
	 W5//+FUGqFHmnNBSBLJmQn+LnTNEa+B6Fde8sA/bbzAwaHWgZ8mnPO1x6HWNOvv60s
	 dOXr/yjcTkqQQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EB54837809D1;
	Mon, 20 May 2024 10:07:42 +0000 (UTC)
Message-ID: <671a4b1e-3d95-438c-beae-d967e0ad1c77@collabora.com>
Date: Mon, 20 May 2024 12:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8173-elm: correct PMIC's
 syscon reg entry
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
 <20240518211159.142920-4-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240518211159.142920-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_030745_553881_F3D75F61 
X-CRM114-Status: GOOD (  13.59  )
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

Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
> The MT6297 PMIC has address/size cells == 1, thus its syscon child node
> has incorrect number of entries in "reg" property.  Fix dtbs_check
> warning:
> 
>    mt8173-elm.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

That node is unused and not needed at all, even...
Unless anyone has any strong opinion against, I suggest to simply remove it.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 6d962d437e02..0e2439860223 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -1138,7 +1138,7 @@ rtc: mt6397rtc {
>   		syscfg_pctl_pmic: syscon@c000 {
>   			compatible = "mediatek,mt6397-pctl-pmic-syscfg",
>   				     "syscon";
> -			reg = <0 0x0000c000 0 0x0108>;
> +			reg = <0x0000c000 0x0108>;
>   		};
>   	};
>   };


