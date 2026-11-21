Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7441606A320
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 23:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pgfXc6XW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g2eFaUs4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YFsCL2i1V6NyqpaP2q7D3KQnFi8V3ctySjIQMW+KeOM=; b=pgfXc6XW/mMHP6
	fx16QUoYz5tduHiaCwwbFLEvvDmglwRCJ+JnLlzlGUbuVRiZJsYhZZ9Eis2MW7u5NjIix3NDUgPj3
	ICA1mJXaM/VUxCYgJsRv+90MiONjCrCO9WcvnUZitUWz+Wn/SqUjH2sjNR+wyP9WcsCWbW4pxmSeK
	7FLbH7UgLGJGKmb2UF4BZkhlhz6MiQmDmHxk6fPZ53syarUfkGfBB1ylGubi24U2HSdUyNl7ZEBcL
	KdGgUZIwd5mUOYaNrsXIUFvwB18uqzsicfNbhmlH0/7CThAgBsREKw1Pq59pQkiPfAAkD04KgJOXI
	mkA17cakd+0e0KdaYKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuUs-00000000UDS-2mRd;
	Sat, 21 Nov 2026 23:27:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuTx-00000000Tlg-17rn;
	Sat, 21 Nov 2026 23:26:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2E6E61DFF;
	Sat, 21 Nov 2026 23:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992C81F0089F;
	Sat, 21 Nov 2026 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303616;
	bh=YFsCL2i1V6NyqpaP2q7D3KQnFi8V3ctySjIQMW+KeOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g2eFaUs4bdYjMV1wgATf2eobd8R8mA2xt3gbCTtYNYWLp/n29YUvLmG1fEiBnt2Qh
	 eZNYnTVHe5qQ/e8RyiP7ebE7f5VZh+4DPu8oJU1CPanyArLb4ow99LSm6qlQFN7gyj
	 l+/WmLMpL4RuYvRt0e+NF+SvWenoLuk/iJ/9hBU8dIf4ryRpH/Hjwv+V8IB2UXO+2b
	 2xh8Y11P4I/1VBEJSjNaMNqGMGxz2qoet7QdDQ/1qDJYdcxFlThq8Mumau4nrEOIsa
	 gVzNcbTKK/zSX8ffyz7yGBftoo3sM5o0mBzERa1qu4ASJlkFAKD+N1zGlx5mNxvapT
	 3LOxSYnUb2NTw==
From: Jakub Kicinski <kuba@kernel.org>
To: ansuelsmth@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	lorenzo@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	p.zabel@pengutronix.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	rmk+kernel@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH net-next v22 13/15] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Sat, 21 Nov 2026 15:26:54 -0800
Message-ID: <20261121232654.1365615-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-14-ansuelsmth@gmail.com>
References: <20261117123956.11981-14-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dt-bindings: net: pcs: Document support for Airoha Ethernet PCS

This adds a DT binding for the Airoha AN7581 PCS blocks on the Ethernet,
PON, PCIe and USB serdes ports. It follows the new PCS provider model,
where consumers reference the PCS through #pcs-cells.

> diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
> new file mode 100644
> index 0000000000000..9c1d116c1b016
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

[ ... ]

> +description:
> +  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
> +  the various Serdes port supporting different Media Independent Interface
> +  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

[Severity: Low]
This isn't a bug, but should 10BASE-R be 10GBASE-R here? The commit
message has the same typo:

  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

The driver later in the series sets PHY_INTERFACE_MODE_10GBASER in
airoha_pcs_probe().

[ ... ]

> +  airoha,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the SCU node required to configure
> +      the serdes line to the correct interface mode.

[Severity: Medium]
Is a bare SCU phandle the right interface for selecting the serdes mode?

The SCU already offers this as a generic PHY provider. In
clock/airoha,en7523-scu.yaml:

  '#phy-cells':
    description:
      The first cell indicates the serdes phy number, see [2] for the
      available serdes port.
    const: 1

In drivers/clk/clk-en7523.c, en7581_serdes_phy_set_mode() handles
PHY_MODE_ETHERNET. It writes the REG_NP_SCU_SSTR XSI0/XSI1 select bits
while holding priv->lock.

The PCS driver later in the series writes the same bits through this
phandle, using its own regmap, in airoha_pcs_setup_scu_pcie():

    regmap_update_bits(priv->scu, AIROHA_SCU_SSTR,
                       AIROHA_SCU_PCIE_XSI0_SEL,
                       xsi_sel);

Doesn't that leave two unsynchronized read-modify-write paths on the
same SCU register?

Probing looks like a problem too. airoha_pcs_probe() does:

    priv->scu = syscon_regmap_lookup_by_phandle(dev->of_node,
                                                "airoha,scu");

The scuclk node in the example has only the compatible
"airoha,en7581-scu". It isn't a "syscon", and nothing registers it with
of_syscon_register_regmap().

Won't the lookup return -EPROBE_DEFER on every attempt? If so, the
eth/pon/pcie PCS never probes when the DT follows the example.

The phandle also has no cells. That means the dual-lane pcie node can't
say which SCU serdes port each PCS instance drives.

Could the binding use something like this instead of airoha,scu plus
phys: false?

    phys = <&scuclk AIROHA_SCU_SERDES_PCIE1>,
           <&scuclk AIROHA_SCU_SERDES_PCIE2>;

The usb variant already uses phys.

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: airoha,an7581-pcs-pcie
> +
> +    then:
> +      properties:
> +        reg:

[ ... ]

> +        phys: false
> +
> +        "#pcs-cells":
> +          const: 1

[Severity: Medium]
With #pcs-cells set to 1, a MAC that uses one of the PCIe serdes PCS
instances has to write pcs-handle = <&pcs N>. Will the consumer schema
accept that?

ethernet-controller.yaml still has:

  pcs-handle:
    $ref: /schemas/types.yaml#/definitions/phandle-array
    items:
      maxItems: 1

That allows only the phandle in each entry. airoha,en7581-eth.yaml
references ethernet-controller.yaml# for its ethernet@N subnodes. A GMAC
node with pcs-handle = <&pcs_pcie 0> would then fail dtbs_check.

At runtime, fwnode_parse_pcsspec() in drivers/net/pcs/pcs.c parses the
"#pcs-cells" argument. airoha_pcs_xlate() rejects a PCIe specifier when
nargs != 1.

No patch in the series changes ethernet-controller.yaml. Its pcs-handle
description also still refers to a PCS PHY device on an MDIO bus.

[ ... ]

> +      required:
> +        - phys
> +
> +additionalProperties: false

[Severity: Medium]
Should resets and reset-names be documented here? The driver later in
the series requests them in airoha_pcs_probe():

    priv->rsts[0].id = "mac";
    priv->rsts[1].id = "phy";
    ret = devm_reset_control_bulk_get_optional_exclusive(dev,
                                    ARRAY_SIZE(priv->rsts),
                                    priv->rsts);

airoha_pcs_setup_scu() then asserts and deasserts these resets on every
interface setup.

The SCU reset controller has matching lines in
include/dt-bindings/reset/airoha,en7581-reset.h. Examples are
EN7581_XSI_PHY_RST, EN7581_XPON_PHY_RST and EN7581_XPON_MAC_RST.

Because of additionalProperties: false, a DT that provides these resets
fails validation. A DT that passes validation has no resets, so the reset
sequence in airoha_pcs_setup_scu() does nothing.

Wouldn't the PCS then stay in whatever state the bootloader or the
previous interface mode left it in?

[ ... ]

> +    pcs@1fa04000 {
> +      compatible = "airoha,an7581-pcs-pcie";
> +      reg = <0x1fa04000 0x1000>,

[ ... ]

> +            <0x1fa5a000 0x1000>,
> +            <0x1fa5b000 0x1000>,
> +            <0x1fa5c000 0x1000>;

[Severity: Medium]
Do these ranges overlap the existing PCIe PHY? In
arch/arm64/boot/dts/airoha/en7581.dtsi, the pciephy: phy@1fa5a000 node
is enabled and claims the same blocks:

    reg = <0x0 0x1fa5a000 0x0 0xfff>,
          <0x0 0x1fa5b000 0x0 0xfff>,
          <0x0 0x1fa5c000 0x0 0xfff>, ...
    reg-names = "csr-2l", "pma0", "pma1", ...

airoha_pcie_phy_probe() and airoha_pcs_init_named_regmap() both map these
ranges with devm_platform_ioremap_resource_byname(), which requests the
memory region.

Won't the driver that probes second fail with -EBUSY?

That would also rule out mixed setups, such as PCIe on one lane and
Ethernet on the other, because both need the shared csr-2l/pma blocks.

This variant also sets phys: false. The PCS therefore can't hand the
analog/PMA side to the PHY that owns it, the way the usb variant does.

