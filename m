Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AB7C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 06:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DG5vw/ziuqvimIbMEocUy0M4eBXI2/0uzMJbjcgw6E=; b=QaiUXngrARm+7zVpHOgb7LeUq8
	a2OZxdLYaU9Oi1BXIvky3AAJpVfRlQlJoM9/4RFeb4LH4LjlAv/JbTdKJg9QZ9D0YIILH4yByqhJX
	fHiXuO+VGsinCve88DinMUB0ucl8wntO5Zo6DAc9jfg/FEkFz9yGzqTlbY+qIJ0P4ebrjQKZ781er
	mbniEqWL5C3/aLScVlo8grUjQNNGmuv/kRZ5YXZXez2HCMhbUP1moghOWKaAUWL1aQYrqJTJ/8VdC
	Gt5zaN/f5DH5eFVdFsJ1qAN/owVUUYKcQ/iqgSgha1YfeZmllXTdR8SIDijCQGC3agDbmo77pJeXr
	EWf8WOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5dM-0000000Dlk2-2CXd;
	Mon, 29 Jun 2026 06:38:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5dL-0000000Dljw-2H0t
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 06:38:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11A896001D;
	Mon, 29 Jun 2026 06:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE731F000E9;
	Mon, 29 Jun 2026 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715096;
	bh=9DG5vw/ziuqvimIbMEocUy0M4eBXI2/0uzMJbjcgw6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=llYEogHQLmtCJcle00yDXQK2aP86/5ead2oMxDvDOoXOyHFCjQvKQWE4XMhq7f1Wh
	 MoYiscAmOCAxE2g6Xrd0eIN87Y6PqEAhVK8gApGDagpzFgh9GFzMtRzd5Q2LjPQd3S
	 NBtW3H0FfVKpohU2pUK+N17n0tztKpXkKMrZuX5W2O1k1aSkxrx2ZnOP5xamKFboQw
	 I/VgqQ9Cf5Z7V6bMmc7ywZKt70lDfZFqzBjonsXMoflcN03im/WkKN8Ay5ww8XdGaY
	 xxKFTlKq51bBh3tyKKNcB+3ulDI1/7DD5/GeejDJnSjDi8gWJFTQz5aZqlippfZi34
	 7sxhPIFEdXRUw==
Date: Mon, 29 Jun 2026 08:38:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 04/17] pinctrl: airoha: an7583: there is no mux to
 enable the second i2c bus
Message-ID: <20260629-prehistoric-unstoppable-galago-c519da@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-5-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-5-mikhail.kshevetskiy@iopsys.eu>
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

On Sun, Jun 28, 2026 at 05:37:20PM +0300, Mikhail Kshevetskiy wrote:
> In the AN7583 case there is no mux bit to enable the second i2c bus,
> so remove it.

But you do not remove second i2c bus, but the i2c bus.

> Also remove i2c pin function from device tree binding schema.

Why?

> 
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +---------
>  drivers/pinctrl/airoha/pinctrl-airoha.c                |  1 -
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> index f52802a3ad79..8d8ec6adb97d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -60,7 +60,7 @@ patternProperties:
>            function:
>              description:
>                A string containing the name of the function to mux to the group.
> -            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> +            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
>                     pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
>                     phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
>                     phy3_led1, phy4_led1]
> @@ -117,14 +117,6 @@ patternProperties:
>                      enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
>                             uart4, uart5]

Best regards,
Krzysztof


