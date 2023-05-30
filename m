Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219AAC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YwBOyIAwwvZ64gL9V22jXrRy5sJ8PzqqRxU3JmV9gs=; b=Ksv9R9lZrx/G+yGqHIGyFwN/7Z
	obLAyQ1aln7/nC5i39e5E+8z8smA1ChE9fpjfLz42OTf0Y7FM8niJjMxxBNn9/QsYB58LLoVD0Awy
	Pt2JZwYx8E8L0k/db+9LGzIGDciaq3ktfAcahi8Xp/4og3FBFQUWDxUfd1h4FvYvcKRjx4+UPeBvH
	RC0SKOMIaafB/YOpk6WZ7X3CFNFW2zOHIUIRdr4ciInrWS1S3rLIOY3KBuCnVZeJCapdpzDjfZept
	o5IE9GxiaV/lHh8EFpWj5pMnNCIl7Q/2+vOfR2kwIq+76OtI0vn+1PJtVlGf7cjRA87jepDIBVjzf
	j7ppLtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tKb-00CdzF-2t;
	Tue, 30 May 2023 06:59:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tKY-00Cdxs-23;
	Tue, 30 May 2023 06:59:44 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E2DFF66058F8;
	Tue, 30 May 2023 07:59:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685429981;
	bh=LEEyS50uUZjJKNoFijv9Ne6IwUdkHPUoQgYBkOeP+Oo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fYUCe55szRdKFc+b170KtqwiMen1htHtk3aCD8aGXquRO59YyZVi/xHjj8Cd6K9Pa
	 32yuLQ49dHqKWYn6s7ZNRozZc4pU8JE5d/SYBeap1XAn7mb0Naau3ZL7tEkQ7NVCFZ
	 xPthGisDY0IAm/lq4eC8AiMfjmGwGJTcK1wmDwsp9z3n3hhfi3Ad3/nOuaTtMV46pw
	 4XhCcnWQjhgae7kAXWpbRp0F/ZLx/ubKmrLPKG6h7ZrR4Syi+a8+qg3as6NLemqsZK
	 dediYofmekeICFhUKz5+47wT2yEe9abuGhKamTLiLek/7H7ja2K54ludz3+iHSy8fv
	 T1wBrVp7B2ZiA==
Message-ID: <d50e3c7e-0900-7cb5-f6cc-ddc1f474ff33@collabora.com>
Date: Tue, 30 May 2023 08:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 4/5] arm64: dts: mediatek: mt8192: Add thermal nodes
 and thermal zones
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230529164605.3552619-1-bero@baylibre.com>
 <20230529164605.3552619-5-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230529164605.3552619-5-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_235942_806622_50186C1C 
X-CRM114-Status: GOOD (  14.67  )
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

Il 29/05/23 18:46, Bernhard Rosenkränzer ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add thermal nodes and thermal zones for the mt8192.
> The mt8192 SoC has several hotspots around the CPUs.
> Specify the targeted temperature threshold to apply the mitigation
> and define the associated cooling devices.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> [bero@baylibre.com: cosmetic changes]
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 454 +++++++++++++++++++++++
>   1 file changed, 454 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 5c30caf740265..330c5bb4ebc85 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -14,6 +14,8 @@
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mt8192-power.h>
>   #include <dt-bindings/reset/mt8192-resets.h>
> +#include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
>   
>   / {
>   	compatible = "mediatek,mt8192";
> @@ -71,6 +73,7 @@ cpu0: cpu@0 {
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
>   			capacity-dmips-mhz = <530>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu1: cpu@100 {
> @@ -88,6 +91,7 @@ cpu1: cpu@100 {
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
>   			capacity-dmips-mhz = <530>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu2: cpu@200 {
> @@ -105,6 +109,7 @@ cpu2: cpu@200 {
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
>   			capacity-dmips-mhz = <530>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu3: cpu@300 {
> @@ -122,6 +127,7 @@ cpu3: cpu@300 {
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
>   			capacity-dmips-mhz = <530>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu4: cpu@400 {
> @@ -139,6 +145,7 @@ cpu4: cpu@400 {
>   			d-cache-sets = <256>;
>   			next-level-cache = <&l2_1>;
>   			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu5: cpu@500 {
> @@ -156,6 +163,7 @@ cpu5: cpu@500 {
>   			d-cache-sets = <256>;
>   			next-level-cache = <&l2_1>;
>   			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu6: cpu@600 {
> @@ -173,6 +181,7 @@ cpu6: cpu@600 {
>   			d-cache-sets = <256>;
>   			next-level-cache = <&l2_1>;
>   			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu7: cpu@700 {
> @@ -190,6 +199,7 @@ cpu7: cpu@700 {
>   			d-cache-sets = <256>;
>   			next-level-cache = <&l2_1>;
>   			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu-map {
> @@ -771,6 +781,17 @@ spi0: spi@1100a000 {
>   			status = "disabled";
>   		};
>   
> +		lvts_ap: thermal-sensor@1100b000 {
> +			compatible = "mediatek,mt8192-lvts-ap";
> +			reg = <0 0x1100b000 0 0x1000>;

reg = <0 0x1100b000 0 0xc00>;

...as 0xc00 should be more than sufficient. This is important for later
when we'll get SVS support up (which is in the LVTS-AP iospace range).

Regards,
Angelo



