Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6667FC61DB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCV/soKd0vC4UfcJ2C13p0eqWOyka0Ke2GoaHDqUKuQ=; b=vHNO2xXkcJHsHvqDdZGPcNfDrr
	pIcQUe774vkxn7SLbGMJRGipbC64d+Bx/fOldA2d2B47kMxFS8fhgbCu0KTMSxuJF+a8Hre/wu5u+
	s77DX7cQ3cifHgzMJqtLfQijS5xJkCMxVk4goJu9mMrHaaQ57RTB4xIjkQicspHm1E4c3Qzu1qiWr
	32ghzKYmOfGikL6zWd8H9sq2+vnwTPtE6XAzPgHwl5N0ss1kJ5ZmGSoV6Cniqi7VRas1Sm6HycFvp
	ppm2hV7/SsiT0CL11Qo/jEYsM0Efi/MkieLrSvircsYZEWV65ora0Rwv4YA+BegAxjMMNN1DzmWd8
	Ts438c9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqZM-00000005FSQ-0F8K;
	Fri, 28 Aug 2026 07:00:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqZK-00000005FRo-1WXC
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 07:00:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02720402F9;
	Fri, 28 Aug 2026 07:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2DE1F000E9;
	Fri, 28 Aug 2026 07:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900402;
	bh=DCV/soKd0vC4UfcJ2C13p0eqWOyka0Ke2GoaHDqUKuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gnh/OCulUL6Y3OsVq70tRyEABuXlC6JyBU4IJKIYTSOBfZ4+/6Bw7WXuVzHK+5kJ9
	 03Fo2Di1VsmhoduwYEANkeHL5cWrnSRdAgdIYvdL2mF58MEB/q5IUZVFiRkZ41JsGr
	 sI3EwmZ1IfP/DvHgkLvTA0kw1htpNhDjSaMWk1JShxcz5Ar1wZFOhyow0nT1TXVe2l
	 6ERo7Djcf79D4tKnYExFkWm5mk4ugUonqSvW89QFZHD51BHVjhiodkIwKcJMANtxpD
	 16guQSlCYZKwa8HhCjaW0ScVuhRTDLGkEQhgF20qpmUnxkOend2YTjk3N43msi+UoB
	 aerprC3a/iqLw==
Date: Fri, 28 Aug 2026 08:59:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <20260828-adorable-bug-from-arcadia-fcad00@quoll>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
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

On Sun, Aug 09, 2026 at 12:04:59PM +0400, Ahmed Naseef wrote:
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> +  registers have a different layout.
> +
> +properties:
> +  compatible:
> +    const: econet,en7528-pinctrl
> +
> +  airoha,chip-scu:
> +    description: phandle to the chip SCU syscon
> +    $ref: /schemas/types.yaml#/definitions/phandle

If the entire address space is part of the SCU, then this device should
be part of the SCU, e.g. its subnode.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +allOf:

This goes to the end of the file, before the additionalProperties.

> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - airoha,chip-scu
> +  - interrupts
> +  - gpio-controller
> +  - gpio-ranges
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +patternProperties:
> +  '-pins$':
> +    type: object

"patternProperties" should follow "properties"

> +
> +    patternProperties:
> +      '^mux(-|$)':
> +        type: object
> +
> +        description:
> +          pinmux configuration nodes.
> +
> +        $ref: /schemas/pinctrl/pinmux-node.yaml
> +
> +        properties:
> +          function:
> +            description:
> +              A string containing the name of the function to mux to the group.
> +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]

Best regards,
Krzysztof


