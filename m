Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C28C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vX4ak2KErIjriVb2SwM3m8KEs1CKOKMU0hssskdQM3U=; b=rncvZxNNViq4Y+tFUlRgM3nSDj
	UhpFhjkyPVLQKjSMb4xx1tbDJYMQY0wKimChLsrqMb/Mk87j0/NLT2M0BsIo4e/lcjDI2L4LHeXD8
	m7VXu+Uio1XHsM8bFWvaE5X1MNMMYcs+lDKjnPae7Uascqs0QIZbozp+9qB2syMA6U1C3fBZqgzJj
	0OeCDXgSZiC2B2Q5OQGxvxSVWeE5I+fjPTK7OuG9Tp6PO79oFOLnanKOeXexy8w3a4H+xbXZbyNiX
	NDct4TALEqAsxHwCuop2gAiM7HVUxpT3BOLU0Vv1tsuPcVcY2v7R1o1VSsuurdLfTf0UpPCqD/zBO
	cEeWkc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rScRd-003EqQ-0J;
	Wed, 24 Jan 2024 12:33:29 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rScRZ-003Eos-0b;
	Wed, 24 Jan 2024 12:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706099599;
	bh=ZMh7iqIZgYI902YIRrVcFsxLdtDLtRhbiBT/Ncsnml8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WerqKHpc45Lp24f8eTua8oih5ZL9z1gcOG2ODNaWNOFzUfASve9em1n64H1F+l6x6
	 73dfgZQm3x9qGAW13N6liRMSxmQkXNVjs2noqqzXzT9MiRX0Y7nHyu55k+4VZlKtXe
	 YgUs9Opr0bfXzXHKMmSFMucgK4O2ivclSQBn8Gx/rATyYHAecgJUFZR0DSORUK754S
	 dzD0lyDypgDzvL1Xy0aVwiR6WzxTFIBHN0LXRDRsDKAzHNbPHLhGTR5P/QptSjF3av
	 INd2FDogojLmsndck7v9meID/NOA/6NgdWe+I3sMPiHhuN9vRVgVaCezEGlikaAaZ7
	 i1YXF4Pfz9lcQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CCBFE378207B;
	Wed, 24 Jan 2024 12:33:18 +0000 (UTC)
Message-ID: <62fca33c-eb1a-42ad-b7f7-31b14f0aa446@collabora.com>
Date: Wed, 24 Jan 2024 13:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: convert Mediatek consumer IR to the
 json-schema
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240124095230.25704-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240124095230.25704-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_043325_370775_6497F096 
X-CRM114-Status: GOOD (  16.42  )
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

Il 24/01/24 10:52, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Added required #include-s and adjusted "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   .../bindings/media/mediatek,mt7622-cir.yaml   | 81 +++++++++++++++++++
>   .../devicetree/bindings/media/mtk-cir.txt     | 28 -------
>   2 files changed, 81 insertions(+), 28 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
> new file mode 100644
> index 000000000000..a2d0eed33292
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek consumer IR on-SoC controller

title: MediaTek Consumer Infrared Receiver on-SoC Controller

> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
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
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: clk
> +      - const: bus

The driver says:

	ir->bus = devm_clk_get(dev, "bus");
	if (IS_ERR(ir->bus)) {
		/*
		 * For compatibility with older device trees try unnamed
		 * ir->bus uses the same clock as ir->clock.
		 */
		ir->bus = ir->clk;
	}

This makes me think that requiring *one* clock on MT7623 would be a mistake
and the devicetree should use clk, bus - CLK_INFRA_IRRX_PD, CLK_TOP_F10M_REF_SEL.

Seen that - I'm sure that setting maxItems: 1 on mediatek,mt7623-cir would as
well be a mistake.

> +
> +required:
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - $ref: rc.yaml#
> +  - if:

The solution would be to simply delete those if branches and, to keep compatibility
with the already present mt7623.dtsi file, keep min/max items to 1 and 2 (of course
in the case of clock-names, maxItems shall not be declared, as it's dictated by the
consts).

> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt7622-cir
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +
> +        clock-names:
> +          minItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt7623-cir
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          maxItems: 1
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2701-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ir@10013000 {

Please use a common generic name, as seen in gpio-ir-receiver.yaml and in
amlogic,meson6-ir.yaml:

ir-receiver@10013000 {

Cheers,
Angelo


