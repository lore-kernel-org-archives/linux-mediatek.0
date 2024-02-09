Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E0C48297
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZBhL23ObAphvssukkFk8pTges/LhXZc3VVsdS0hk1A=; b=3zq2Rqxf1/m6W47rLytpPXJSGU
	M9l8jo+6GbwfjFzOTtrgT9aKQVTJ1EJO+dFxqySStZYVBPZSVQvkIjbK7x9YeSFB1PP21LPZKYMC8
	l3hrwY87EP+1bOYFTxRVMOkTU0X07mFRXe3F2EAa6hAEi+oYaBu0z7Pjq3WlvIwrmyQtuYA5F05HF
	jBed6yJ9O7e7FkHzdUWkf5KHH7olQu8PyK5OAdZ7vWM3J7M0dNVfG8zUMfcKddFPKnE18rWQVUOVE
	ACHtOzL9w9m6bz3K73JaP/kqoBQAWWxCJ/8QEtepRlCknbHxRhVB84yGuOiVSDpni6WXGpwrfx+/i
	FoZL7DZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYN87-0000000Ga13-2QX1;
	Fri, 09 Feb 2024 09:25:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYN82-0000000GZwc-4691;
	Fri, 09 Feb 2024 09:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707470699;
	bh=sKhHl6jhkzY2ubfjApNOMunSMfubTCqnhOeVufRe1LU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FK2SHU92+qUDn4rAMQZxyOYZ/CgLhp3w39srHrPMlum1nIdJz/pEIwyvQXewZ1SOl
	 yBboWGqWi/OD/ECNSP9cY2s9foHFHXEqiwqXu5Iyw6ywHMgnICiWRnNJ5GM8RqrFA+
	 ZxSLwpaE3G11qrJniCws0Jrn7kRTQo2gYyeooNsTgwWMvOsl+3JPXxpBXO14HWm9kq
	 A/As26nFbSuX4lWjo3fKouVsa2eFjzRKaelKTs3Aya9iHOBqa2kk1wJYV1yNPvFQEL
	 x3x7NxZXiVdsMcqKVnZR1IXDiy2sNq/5TMy7Yb90M09IFmECFxa/4tGQBp4+gOz5m1
	 vrO9GeFlFr8WQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CF09537811F4;
	Fri,  9 Feb 2024 09:24:58 +0000 (UTC)
Message-ID: <76d31dea-2fcf-46ce-8d73-2d84edab797a@collabora.com>
Date: Fri, 9 Feb 2024 10:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: media: convert Mediatek consumer IR to
 the json-schema
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240209085616.1062-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240209085616.1062-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_012503_203944_1CD72F52 
X-CRM114-Status: GOOD (  19.59  )
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

Il 09/02/24 09:56, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Made "bus" clock required on MT7623 as well
> 3. Added required #include-s and adjusted "reg" & clocks in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Extended "IR" in title
>      Made "bus" required at MT7623 needs it as well
>      Updated example
> 
> Thanks AngeloGioacchino!

You're welcome :-)

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
>   .../bindings/media/mediatek,mt7622-cir.yaml   | 55 +++++++++++++++++++
>   .../devicetree/bindings/media/mtk-cir.txt     | 28 ----------
>   2 files changed, 55 insertions(+), 28 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
> new file mode 100644
> index 000000000000..c01210e053f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Consumer Infrared Receiver on-SoC Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +allOf:
> +  - $ref: rc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7622-cir
> +      - mediatek,mt7623-cir
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: clk
> +      - const: bus
> +
> +required:
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2701-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ir@10013000 {
> +        compatible = "mediatek,mt7623-cir";
> +        reg = <0x10013000 0x1000>;
> +        interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&infracfg CLK_INFRA_IRRX>, <&topckgen CLK_TOP_AXI_SEL>;
> +        clock-names = "clk", "bus";
> +        linux,rc-map-name = "rc-rc6-mce";
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mtk-cir.txt b/Documentation/devicetree/bindings/media/mtk-cir.txt
> deleted file mode 100644
> index 5e18087ce11f..000000000000
> --- a/Documentation/devicetree/bindings/media/mtk-cir.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Device-Tree bindings for Mediatek consumer IR controller
> -found in Mediatek SoC family
> -
> -Required properties:
> -- compatible	    : Should be
> -			"mediatek,mt7623-cir": for MT7623 SoC
> -			"mediatek,mt7622-cir": for MT7622 SoC
> -- clocks	    : list of clock specifiers, corresponding to
> -		      entries in clock-names property;
> -- clock-names	    : should contain
> -			- "clk" entries: for MT7623 SoC
> -			- "clk", "bus" entries: for MT7622 SoC
> -- interrupts	    : should contain IR IRQ number;
> -- reg		    : should contain IO map address for IR.
> -
> -Optional properties:
> -- linux,rc-map-name : see rc.txt file in the same directory.
> -
> -Example:
> -
> -cir: cir@10013000 {
> -	compatible = "mediatek,mt7623-cir";
> -	reg = <0 0x10013000 0 0x1000>;
> -	interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> -	clocks = <&infracfg CLK_INFRA_IRRX>;
> -	clock-names = "clk";
> -	linux,rc-map-name = "rc-rc6-mce";
> -};


