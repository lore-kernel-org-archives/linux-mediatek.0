Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EB7C61DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 17:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+OTxlGaSoeTcGnz71CmZviuhIa8naVJEy7RHcu28UE=; b=FF4uf/FL5tLYL5RlbnrX9UlSld
	085RSJKpDuvNFICSV/pf7d49iOVpM0YTg1C9pcEDSs1F0f/OWCkX4OcXIDgzvC6Zg6VjnE8qALPlS
	EU2uDY/NF/XnnPiZzrh2YSVrnDMbRkK/Ulp1QcgCgfctMgRu5kyq3L4wZAwcYpqV1ivQDTeAgacMm
	8X2bGQbyRl3Nn+WiLwQVNofwWh7+uoxQXhOlHl/b1kjU/nlHQ0gxznxbFXS75jLey1Sn0m+iibsdm
	qgMZoPCUU8FrDE0+9JUFOpQm206SfqgKlPs6eszvsEg/igx/tJOhbe3/3sYTO98NAXyV3yoI5Xnaa
	9MOabYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15wI-0000000ACzq-1s5Q;
	Mon, 31 Aug 2026 17:36:58 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15wG-0000000ACzE-0tqY
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 17:36:57 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3173408a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788197815; x=1788802615; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+OTxlGaSoeTcGnz71CmZviuhIa8naVJEy7RHcu28UE=;
        b=NFhZ4yzUik/Uu27SmGEzMj+5IzjvbLbwQhGXYabWAEdKjJfYRFUf69PADfCvY6ztny
         jBuiL6RUQacfDFn0fsH+4kiY3z6mQFKv4dclnOZ8QFimznTsq7Ynj3JNORTUF4y6VEIm
         L9hcOSd0/QNK9U9bZuamMEk9mhJVc/2BWVm3ZE3oBbf3ALfbOmSm90OdHjWolEZmTTWG
         tTSCuXqSxL8jEvm0tNl9eYOXfTWIVFsjZTLvRuG/vNZc6/ImP1nGWWEZMl8DcT30jz9e
         E/YBmpFESSur5qNYQYjYqF7rK6qpfMaeygNV80e6xnOhu9w1xqINwwNo2/npFZLKAB+r
         iw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197815; x=1788802615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+OTxlGaSoeTcGnz71CmZviuhIa8naVJEy7RHcu28UE=;
        b=Pxw8AK6qrnZLcGlfxXI9MuQ2HrA0IizBHIIjOtafpJvIV1p837rxM8zBEAaM8u4Uf/
         19QypGK2IAnYOf3Xk557LH03BMVOoLJ3lmC10eS6c0Ml5B+4N+87Jylg2BGTTcfbeo9W
         F6/JVn9IDUXPjd0GdYdafPsYFS9IzEiMYXr9hNCiqvDozIXEcNCX9pCCZHnotcZwZMOR
         WeRPonfkmjYxO8GVVgCzMgAYiPMKUIYmDBnvcQyvSanxYUNxkSnyvXyidKps63j9MNq2
         bw0Nrx4WizgtR+QVvMAfnpCGE2ZgCsya83+XptTkpKNDGrrGeYyLrFsu1lM0/++D5QvE
         VFdw==
X-Forwarded-Encrypted: i=1; AKwUvBzHjv2YWBeoxifzZ72Lr5nAsUYy22qjRLjjJf0RC4ftdGjevMY6vGGzNv/DEtMnC0+FVuLsEqmfzYMfZPsvcw==@lists.infradead.org
X-Gm-Message-State: AFuF++kLXKDo9zqUfShrBPhEQBaPYODIrRP4dX9oVqLe9UvFiYSvEKf7
	g7sdg1wpqImgGz8Tn5zom7A2ux+CRjUpsgG9hqK5FxpVNuaKOC8/nADt
X-Gm-Gg: AYBFou2ABX4R0VDstsefCFL+UHcgLwdGfVoq5vgKvYcIVAhO5tW8r5UmOayEhB3ssiH
	eAHBoZ/C6cLEPbn60tUXIcRDCd24kHg9GZssFrzypHzeq2w7cOaW3t8HHtFuOd8514ypVYZIRvh
	1fjDSRG4yvq5P/+mL6H3WGwCTaQ1gTzqIhHSkOQrV6mod0W9z3+iAyTkOhObqWookrfFfCYA9dH
	NA1U7Na2JEJqO3l1K3/8hggkXvKIHgcjk6k+lagGjWaOhSt1/DAavK1e1dNhsWx5hPo+IO3noE/
	KbnCqMD6g/RqrVkMAsFfcbJ90Ao92+MLuX7gRdG6O3S759iTSVzY3BDi0g+H63KmKfDXxQmNCJR
	Paz5pwJRZ/NdCjWVsMCSMfOeWLKZO4HRl6YsyYSc/UaQCOKBCs3cpMm/ei5+Q8sJ9BeaBxUHKwG
	35Yy+rxCYtQpaJpqFkfOv7yELTBBLKirocjd4kZXBMwGQYkS0JGqu/2MKP4V+39C6iKD2XFVjJf
	GlZfQ==
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr3439777a91.6.1788197814521;
        Mon, 31 Aug 2026 10:36:54 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.196.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a661a0ddsm4840917a91.3.2026.08.31.10.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:36:54 -0700 (PDT)
Date: Mon, 31 Aug 2026 21:36:47 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <apW7r6IdVx9Cmk4G@DESKTOP-TIT0J8O.localdomain>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
 <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
 <20260831-sibling-isolation-3849a5e4845f@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-sibling-isolation-3849a5e4845f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_103656_273670_9D523D96 
X-CRM114-Status: GOOD (  39.13  )
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

On Mon, Aug 31, 2026 at 05:57:59PM +0100, Conor Dooley wrote:
> On Sat, Aug 29, 2026 at 03:47:00PM +0400, Ahmed Naseef wrote:
> > On Fri, Aug 28, 2026 at 04:51:27PM +0100, Conor Dooley wrote:
> > > On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
> > > > Add the binding for the pin controller found on the EcoNet EN7528 MIPS
> > > > SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
> > > > pin configuration registers have a different layout, so it gets its own
> > > > compatible.
> > > > 
> > > > The CHIP SCU holding those registers is referenced by the airoha,chip-scu
> > > > phandle.
> > > > 
> > > > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > > > ---
> > > >  .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
> > > >  1 file changed, 190 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..3ce1a5309d09
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > @@ -0,0 +1,190 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: EcoNet EN7528 Pin Controller
> > > > +
> > > > +maintainers:
> > > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > > +
> > > > +description:
> > > > +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> > > > +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> > > > +  registers have a different layout.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: econet,en7528-pinctrl
> > > > +
> > > > +  airoha,chip-scu:
> > > > +    description: phandle to the chip SCU syscon
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  gpio-controller: true
> > > > +
> > > > +  '#gpio-cells':
> > > > +    const: 2
> > > > +
> > > > +  gpio-ranges:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  '#interrupt-cells':
> > > > +    const: 2
> > > > +
> > > > +patternProperties:
> > > > +  '-pins$':
> > > > +    type: object
> > > > +
> > > > +    patternProperties:
> > > > +      '^mux(-|$)':
> > > > +        type: object
> > > > +
> > > > +        description:
> > > > +          pinmux configuration nodes.
> > > > +
> > > > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > > > +
> > > > +        properties:
> > > > +          function:
> > > > +            description:
> > > > +              A string containing the name of the function to mux to the group.
> > > > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > > > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> > > > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
> > > > +
> > > > +          groups:
> > > > +            description:
> > > > +              An array of strings. Each string contains the name of a group.
> > > > +            items:
> > > > +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
> > > > +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
> > > > +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
> > > > +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
> > > > +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
> > > > +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
> > > > +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
> > > > +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
> > > > +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
> > > > +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> > > > +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> > > > +                     pcie_reset0, pcie_reset1]
> > > > +
> > > > +        required:
> > > > +          - function
> > > > +          - groups
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +      '^conf(-|$)':
> > > 
> > > Why is this needed? Why can you not tell from the group which pins the
> > > config applies to?
> > 
> > Not for all of them: i2c_sda, i2c_scl, uart_txd and uart_rxd are in no
> > group at all.
> 
> Why's that? Are they just fixed output pins?

Fixed-function :  the dedicated I2C and UART pads. The only registers
they have are bias and drive strength, there is no mux and no GPIO
mode.

> 
> > The spi_cs0/clk/mosi/miso pads are only in pnand, which is
> > 17 pins wide, so no group names them individually either.
> 
> That's easily resolved by breaking up pnand though.
> 

Not as mux groups: pnand is a single register bit, so muxing a
sub-group would still switch all 17 pads while pinctrl only claims the
subset. As config aliases they would add nothing over pins.

> Devils advocate thing here might be to say that the dedicated
> configuration node should only be for the things that are fixed outputs,
> and the muxable ones should get their config from a combined
> pinmux/pincfg node. Personally I think that presents a nicer interface,
> where someone doesn't have to go figure out what pins are in the group
> they just assigned a function to to also set the config properties for
> it.

The driver would take that as-is (it uses the generic dt_node_to_map,
which accepts config properties next to function/groups). I kept the
split mux/conf shape to match the other four Airoha bindings on this
driver. If you prefer the combined form I would rather do it for the
whole family as a follow-up than have en7528 be the odd one out - but
can switch this one now if you want.

Ahmed

> 
> Cheers,
> Conor.
> 
> > > > +        type: object
> > > > +
> > > > +        description:
> > > > +          pinconf configuration nodes.
> > > > +
> > > > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > > > +
> > > > +        properties:
> > > > +          pins:
> > > > +            description:
> > > > +              An array of strings. Each string contains the name of a pin.
> > > > +            items:
> > > > +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> > > > +                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> > > > +                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> > > > +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> > > > +                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> > > > +                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
> > > > +                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
> > > > +                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
> > > > +                     spi_mosi, spi_miso]
> > > > +            minItems: 1
> > > > +            maxItems: 50
> > > > +
> > > > +          bias-disable: true
> > > > +
> > > > +          bias-pull-up: true
> > > > +
> > > > +          bias-pull-down: true
> > > > +
> > > > +          input-enable: true
> > > > +
> > > > +          output-enable: true
> > > > +
> > > > +          output-low: true
> > > > +
> > > > +          output-high: true
> > > > +
> > > > +          drive-strength:
> > > > +            description:
> > > > +              Selects the drive strength for the pin, in mA.
> > > > +            enum: [2, 4]
> > > > +
> > > > +        required:
> > > > +          - pins
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - airoha,chip-scu
> > > > +  - interrupts
> > > > +  - gpio-controller
> > > > +  - gpio-ranges
> > > > +  - "#gpio-cells"
> > > > +  - interrupt-controller
> > > > +  - "#interrupt-cells"
> > > > +
> > > > +allOf:
> > > > +  - $ref: pinctrl.yaml#
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +
> > > > +    pinctrl {
> > > > +      compatible = "econet,en7528-pinctrl";
> > > > +
> > > > +      airoha,chip-scu = <&chip_scu>;
> > > > +
> > > > +      interrupt-parent = <&gic>;
> > > > +      interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> > > > +
> > > > +      gpio-controller;
> > > > +      #gpio-cells = <2>;
> > > > +
> > > > +      interrupt-controller;
> > > > +      #interrupt-cells = <2>;
> > > > +
> > > > +      gpio-ranges = <&pinctrl 0 0 42>;
> > > > +
> > > > +      uart2-pins {
> > > > +        mux {
> > > > +          function = "uart";
> > > > +          groups = "uart2";
> > > > +        };
> > > > +
> > > > +        conf {
> > > > +          pins = "gpio28", "gpio29";
> > > > +          bias-pull-up;
> > > > +        };
> > > > +      };
> > > > +
> > > > +      pwm-pins {
> > > > +        mux {
> > > > +          function = "pwm";
> > > > +          groups = "gpio30";
> > > > +        };
> > > > +      };
> > > > +    };
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
> > 



