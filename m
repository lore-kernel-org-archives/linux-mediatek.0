Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89741C3600D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAohky9CRH8pZfBIYnkEvHD7hXHjDHUITc3iumF+pu0=; b=c4F3EQj4BIf+2oBRw2VpfmeEmK
	5jk+scEF7op1yF+C3Mcvppo76pwwCdnFB4/lrIMwxCa/7YFdeNA49XQRFhY9ORcD4DKG0jrx35cgc
	YJpk7RjkLF57XBPey0Ybnx8TYvkRcrdF41Fx2L8AAZWjABN8cDga0ita6tXZawatUVMdQ8uTorDh1
	dC40V3xOFbeBj+LroquW73K7/D/8sg6KBx16MPXvFopk81+W1id+XJUtOdgsa449lpZ29s1NqHdSz
	l2UVqH7Vj/48wV4WeOqud72LRiu97QigqALhZ1Bzil8ac24KfkBSRHK1fDnrH0b35lvGwZ0rvTGua
	mnksvQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twk6L-00000003Z6Y-1lHP;
	Mon, 24 Mar 2025 15:52:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twk3G-00000003YMj-3FhL;
	Mon, 24 Mar 2025 15:49:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B57566158E;
	Mon, 24 Mar 2025 15:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D86C4CEDD;
	Mon, 24 Mar 2025 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742831360;
	bh=mTbzGdF585SBjs9qPph8XaC8lrk++6aRMnH/YTASE/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wxhn0Z9z3nh/2wuc6gVgU5ZwFdAmyHEABI9c/8nJRe+t6Dq7cGxBiYHE2vOpYwF7r
	 kRU5ydtcI91sDHKqlW/e6G6qPs9OwF8Cclr3X3CexKDR8Tv7ddkISF3S4aAKEs4GXL
	 f52tEdkI/RTCG1iQ9jcKj2ThSWq1sxi1qITtC0eDbbXOmdLqnEG18WXxJEoHaEaQMr
	 Aaz8RHgWJ3PvYJayX1I4CULlm5YHWjJ3aeb5GtJNMhhyknUdv5xVlYF67UN6nluWcQ
	 JNi5Dy/1JWSwgOK1gXUo/kEC/u9tmXqoaUxhqdZi5PokB5tDeg+yUfqJlHS8zCbHkX
	 j1WFmI+6TM55A==
Date: Mon, 24 Mar 2025 10:49:19 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>, Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 07/11] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20250324154919.GA101272-robh@kernel.org>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
 <20250320130054.4804-8-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320130054.4804-8-ansuelsmth@gmail.com>
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

On Thu, Mar 20, 2025 at 02:00:30PM +0100, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the USB port.
> 
> If the airoha,serdes-port property is not declared, it's assumed USB 3.0
> mode is not supported, as the Serdes mode can't be validated.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  .../dt-bindings/phy/airoha,an7581-usb-phy.h   | 11 +++
>  3 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
>  create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h
> 
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> new file mode 100644
> index 000000000000..39ceaded5d0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 SoC USB PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
> +
> +  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> +  mode currently configured on the system for the USB port.
> +
> +  If the airoha,serdes-port property is not declared, it's assumed USB 3.0
> +  mode is not supported, as the Serdes mode can't be validated.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +
> +  airoha,usb2-monitor-clk-sel:
> +    description: Describe what oscillator across the available 4
> +      should be selected for USB 2.0 Slew Rate calibration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +
> +  airoha,serdes-port:
> +    description: Describe what Serdes Port is attached to the USB 3.0 port.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]

Since you only have a single value here, does that mean only only one of 
the 2 ports/phys supports USB3?

> +
> +  airoha,scu:
> +    description: Phandle to the SCU node for USB 3.0 Serdes mode validation.
> +    $ref: /schemas/types.yaml#/definitions/phandle

A bit unusual, but you could use the phys binding here instead of these 
2 properties. The phy for the phy...

> +
> +  '#phy-cells':
> +    const: 1

Please add a description of what's in the cell.

> +
> +required:
> +  - compatible
> +  - reg
> +  - airoha,usb2-monitor-clk-sel
> +  - '#phy-cells'
> +
> +dependentRequired:
> +  airoha,serdes-port: [ 'airoha,scu' ]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/airoha,an7581-usb-phy.h>
> +    #include <dt-bindings/soc/airoha,scu-ssr.h>
> +
> +    phy@1fac0000 {
> +        compatible = "airoha,an7581-usb-phy";
> +        reg = <0x1fac0000 0x10000>;
> +
> +        airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL1>;
> +        airoha,scu = <&scu>;
> +        airoha,serdes-port = <AIROHA_SCU_SERDES_USB1>;
> +
> +        #phy-cells = <1>;
> +    };
> +
> +    phy@1fae0000 {
> +        compatible = "airoha,an7581-usb-phy";
> +        reg = <0x1fae0000 0x10000>;
> +
> +        airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL2>;
> +
> +        #phy-cells = <1>;
> +    };

Drop the 2nd example.

Rob

