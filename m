Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD277C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fD3tdu36eXJrVP3G7fvB6oISJtOz6dY/mhFesBwAa8=; b=x/XJ5WAYnXqqQVJVR9iAcOPKab
	NGeQBRUv1U7L5bMCtAHivacgAYIjpkkuHYEhgQAX3bNp8HWcnRlQm1zBypfu+Edu1URuitgLZljvB
	IYAmQyDrSgdaIThGzi3+TJvEMgJ+CRSlVvUklgWayh7G4fyBxTwcEDywQY9GGCBVHJu8iEKjqSDvu
	gfjBUtPevejQbH40sg0nH4nXFIUgMBgbJh397MmOKRi0++MawQ+bNV+325mVoXOamyX4IbsZkGsou
	qdP7q/7JoM+4sYxHf00KGmZtRbz2UpRk24sMLxHefFxjE717GidDc7AHGExNGFG8nZjx+lFC4E7vw
	HSfE7/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QMR-000000009MV-0sVj;
	Tue, 21 May 2024 14:21:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QMH-000000009IT-0Em1;
	Tue, 21 May 2024 14:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716301251;
	bh=ob1GNOfz5cddtQfrGwpItXm/m+C87OwgfymK2tp/LRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o70/lrZQvTnRoU+FH0yy9rWF7cq1CtvKK2YvBBP31GynGjQQ5pdli6lR+lBq4VaTx
	 8pOxQeS8WJWJKiHxAsnd1zZj5sJz6xqPhMbSwsFOzDXMao+j2KvWNsCcRMmvruKTa3
	 m5w9+LC0ZtvLfgCYL3OpFoMNsO89HBwBLI/B7im2UhTlb86VXdQ1F6sNkzBDfC0nY3
	 f+t8xIemA3E2CygpctLfZPnuYBdKvgyG+74VJUIStK5YhG2VUpLMoUAozJFHhgEU8T
	 X0RcKWhsv5fXY/qDbVZ2pEAT6/mBDPEX17JngKgUrRluQge1eDZ0cYYu/JocKUwDTM
	 K4QGTCYnYnO/g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0C5103782137;
	Tue, 21 May 2024 14:20:50 +0000 (UTC)
Message-ID: <cdc6288f-c118-445f-8c06-b979e243d38c@collabora.com>
Date: Tue, 21 May 2024 16:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: mediatek: mt8186: add default thermal
 zones
To: Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com>
 <20240521-mtk-thermal-mt818x-dtsi-v4-2-b91ee678411c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240521-mtk-thermal-mt818x-dtsi-v4-2-b91ee678411c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_072053_526457_DA11785C 
X-CRM114-Status: GOOD (  15.07  )
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

Il 21/05/24 16:05, Julien Panis ha scritto:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Inspired by the vendor kernel but adapted to the upstream thermal
> driver version.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 290 +++++++++++++++++++++++++++++++
>   1 file changed, 290 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index caec83f5eece..ac49a33d1b54 100644
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
> @@ -2197,4 +2199,292 @@ larb19: smi@1c10f000 {
>   			power-domains = <&spm MT8186_POWER_DOMAIN_IPE>;
>   		};

..snip..

> +
> +		mfg-thermal {

This is the GPU zone. For this entire node, s/mfg/gpu/g

> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts MT8186_MFG>;
> +
> +			trips {
> +				mfg_alert0: trip-alert0 {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				mfg_alert1: trip-alert1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				mfg_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};

Regards,
Angelo


