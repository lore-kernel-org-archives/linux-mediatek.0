Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D41AC61DD6
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2026 11:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vqI14HLIzxZhfuAXP+1goiBkOtG4fYO1VJ85pvQxO8=; b=M2Rloc0GUj8cme4WvVeC3Z79dH
	8kJtwSSOdAMXVfRqs24tt8gqxgrpXE9oKjNnBt+4+ecuapBGb5o2+nlDhNBIqmC9JGzdl7ksodHSe
	9p6Ey1cQZ/JQvNtVevOpKp1v5WoikiMfTMKenLekVcNFnS1CjbO8AVukCw2/Bdhdqh73PqpeJVxKZ
	2PITYek1J3IFF72sAHdssG6vIA1NPL4HQSmD5/WgQ2t2ZDxTs33gCLPoV4R8l7nVg4heuVVmxiEP5
	pPExqlnfQvJRIy/TVFALyvXbYOc8NiIBazAdjBjuDfJTyh1HqyMMhrFhUphuo/MCdC6/vcAsL9gYk
	SmKXE6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0HWj-00000006xn9-4AbG;
	Sat, 29 Aug 2026 11:47:13 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0HWg-00000006xmn-3BGQ
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Aug 2026 11:47:12 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso16158a91.1
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Aug 2026 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788004030; x=1788608830; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vqI14HLIzxZhfuAXP+1goiBkOtG4fYO1VJ85pvQxO8=;
        b=snzC2+YAshEFFhbWxSdUHK0eQ1WYPo292igIzPTyetRgSMIiqoAm/NVMIiIUgPNOUC
         U5D4mccYcTvNP4an8aBSLc7CFKnRQoRa9RGo7+z6PjkqaOYfroAaThLJtJ7aFIj0YtKl
         WWfSrbLQDHK3Sk3vbSX4ZWCQE1xRbHw3EPddcalV5e/sjmnb7+2Pu0rELoHuVK+SVOaA
         Wqcmiebhhi09vurU6bexHpag/uOE7WZ0B+270sbq6jI9d5t0S8MOIfSy/W/SqmSaXKyL
         6gIqPxNKOQMaz29Wkr2EzdQHuktY/yOv/KSTbXInIzFi9ajpwHhdVWKXp8qk2MUtPM/Y
         mAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788004030; x=1788608830;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vqI14HLIzxZhfuAXP+1goiBkOtG4fYO1VJ85pvQxO8=;
        b=PWuL1C/ttvuEfJIGL+8dAiWq8CabxiicnG9H7uAvlvANbYp3m+Me+Y71WEZaNgBeu5
         +a44nuil9YTnd/IgxDejFEdtznue3JvYmQ63HQBvl8V67oPcgzSAhT3EG3c3AZ7TLI/0
         H5UF40CcApgVylqSn+mx2z557CXVtYG4sSGvel8XMVkDvIhKdJ3aNsJmO9omAHpFm2ka
         0oC199PQiyr3ROEZ1wqynB3hgbCF+yhpkSH8cA55UCbxr+Ubv2HDuj+9lS2SI7W6HHUM
         Sci40N8aG7GKsQ3GZp9gvtECVWzB2pXx+zcpkqsWDSJNdKmGLaQqclCy2IFqeHcfIQR9
         nfhg==
X-Forwarded-Encrypted: i=1; AKwUvBxDgs7XtRcuPKWeGh8U3ukl/R8qoJrRIPBQnmMmoAhGjJSwQzuNyWF74IdUrKveGNF4QjAwggUJng/uuniHNg==@lists.infradead.org
X-Gm-Message-State: AFuF++mUOOHE6thYhJ2W/fYzFwVqfO2WCf48zotjfvlb8T1xcAMKJLCG
	MLhxXk/R3cQe4syd7HuyEqbsrn0uwLOEJGoKHtrNS4yeHDwR0kbiMY4/
X-Gm-Gg: AYBFou1HBGFfiIx7iQJD/q4o5B7iKdBWdaaTrqWtd8bC4pTXypsd+lZ4zjUjXuuKAh7
	S4Fkfw5WPjBy83vQRQ4Qku7HsqF/48Etm5K1V9G7BRDGAQdrVMSf2+LOoFivi6iFCYZgadrFgbJ
	CsEZTOOZtVoPC3MlEJBJIRsTBNVc8AQjVnKfLUcldr4BSEe/LiypdnIpYewzEV4FRR6uWd5Rc3P
	jit1O4/RuJEorC1rfEvvkIZ75M4irs4RwOHGftucm2kfnyVBgFla9khie64S8pHVWURl9pFi60O
	HE9158trIrqePUNhIKbNyPsEfZ8vO4jhzmH2dkRReUIK2A5HUo07jVIPSN5QjWxRgqGKPcE4UNf
	byp2C56TAEe4zqs4VKRWek5Knv/1mDdTmECgBOf9vN1TM4EITwzqxq44w6A9p08Yida8uXvirLQ
	EryQTq+gXqsSlGqnnWOnawvKMeghHz8V2mHms37SP6kNWM1wNqCd1G/ahvdPfAQ/Lhec+ulOUot
	Xaiu7DQ
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr24877699a91.6.1788004029521;
        Sat, 29 Aug 2026 04:47:09 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([157.51.208.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm16735823eec.0.2026.08.29.04.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:47:08 -0700 (PDT)
Date: Sat, 29 Aug 2026 15:47:00 +0400
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
Message-ID: <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828-chaos-recovery-c99d547ee1b6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_044710_810985_51F1C5D4 
X-CRM114-Status: GOOD (  24.96  )
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

On Fri, Aug 28, 2026 at 04:51:27PM +0100, Conor Dooley wrote:
> On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
> > Add the binding for the pin controller found on the EcoNet EN7528 MIPS
> > SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
> > pin configuration registers have a different layout, so it gets its own
> > compatible.
> > 
> > The CHIP SCU holding those registers is referenced by the airoha,chip-scu
> > phandle.
> > 
> > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > ---
> >  .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
> >  1 file changed, 190 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..3ce1a5309d09
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > @@ -0,0 +1,190 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: EcoNet EN7528 Pin Controller
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +description:
> > +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> > +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> > +  registers have a different layout.
> > +
> > +properties:
> > +  compatible:
> > +    const: econet,en7528-pinctrl
> > +
> > +  airoha,chip-scu:
> > +    description: phandle to the chip SCU syscon
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> > +
> > +    patternProperties:
> > +      '^mux(-|$)':
> > +        type: object
> > +
> > +        description:
> > +          pinmux configuration nodes.
> > +
> > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > +
> > +        properties:
> > +          function:
> > +            description:
> > +              A string containing the name of the function to mux to the group.
> > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
> > +
> > +          groups:
> > +            description:
> > +              An array of strings. Each string contains the name of a group.
> > +            items:
> > +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
> > +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
> > +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
> > +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
> > +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
> > +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
> > +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
> > +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
> > +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
> > +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> > +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> > +                     pcie_reset0, pcie_reset1]
> > +
> > +        required:
> > +          - function
> > +          - groups
> > +
> > +        additionalProperties: false
> > +
> > +      '^conf(-|$)':
> 
> Why is this needed? Why can you not tell from the group which pins the
> config applies to?

Not for all of them: i2c_sda, i2c_scl, uart_txd and uart_rxd are in no
group at all. The spi_cs0/clk/mosi/miso pads are only in pnand, which is
17 pins wide, so no group names them individually either.

Ahmed


> 
> Thanks,
> Conor.
> 
> > +        type: object
> > +
> > +        description:
> > +          pinconf configuration nodes.
> > +
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > +
> > +        properties:
> > +          pins:
> > +            description:
> > +              An array of strings. Each string contains the name of a pin.
> > +            items:
> > +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> > +                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> > +                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> > +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> > +                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> > +                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
> > +                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
> > +                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
> > +                     spi_mosi, spi_miso]
> > +            minItems: 1
> > +            maxItems: 50
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up: true
> > +
> > +          bias-pull-down: true
> > +
> > +          input-enable: true
> > +
> > +          output-enable: true
> > +
> > +          output-low: true
> > +
> > +          output-high: true
> > +
> > +          drive-strength:
> > +            description:
> > +              Selects the drive strength for the pin, in mA.
> > +            enum: [2, 4]
> > +
> > +        required:
> > +          - pins
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - airoha,chip-scu
> > +  - interrupts
> > +  - gpio-controller
> > +  - gpio-ranges
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    pinctrl {
> > +      compatible = "econet,en7528-pinctrl";
> > +
> > +      airoha,chip-scu = <&chip_scu>;
> > +
> > +      interrupt-parent = <&gic>;
> > +      interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +      gpio-controller;
> > +      #gpio-cells = <2>;
> > +
> > +      interrupt-controller;
> > +      #interrupt-cells = <2>;
> > +
> > +      gpio-ranges = <&pinctrl 0 0 42>;
> > +
> > +      uart2-pins {
> > +        mux {
> > +          function = "uart";
> > +          groups = "uart2";
> > +        };
> > +
> > +        conf {
> > +          pins = "gpio28", "gpio29";
> > +          bias-pull-up;
> > +        };
> > +      };
> > +
> > +      pwm-pins {
> > +        mux {
> > +          function = "pwm";
> > +          groups = "gpio30";
> > +        };
> > +      };
> > +    };
> > -- 
> > 2.34.1
> > 



