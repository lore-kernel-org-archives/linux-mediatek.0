Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BB8CD3447
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrFjo+tZ1gGYSl0VKH0dOJMvB0CR3MC+AWQeHbPFOtA=; b=GEsOyahsidctAVp0tGMMa0jUz3
	h2nide+jEmqITU4oGn2QDAFORrNOlnD6BcJ0i87zgmyy7N2xZEUrh6C6Hck0HFlOMV54sZw+WDhxO
	KpdqtXBOrzidCxsvvVXCllLjcqyyDFCq68P6RWmg1S3hA7FC68Ej1utsmBoDM3EKea/JM4hXfSKa4
	byt8Yqz5tADW/RFHDWXoiuVJJ87clI0a93ewp466Siy+lN5TzJaYitrMfueTeLAxIal+z2ADjnNEy
	bhNoXmz2hg44KEolMt8nSGTVbwydVJCTjQQgEeCm9nDS0CO8ioztRrNWc/zgGg6Tyg9HdYmkjo7Ir
	4VZ1XCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slVwy-00000000zUL-3uun;
	Tue, 03 Sep 2024 16:00:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slVgy-00000000vq6-0rHV;
	Tue, 03 Sep 2024 15:43:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-374bfc395a5so1860800f8f.0;
        Tue, 03 Sep 2024 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725378218; x=1725983018; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FrFjo+tZ1gGYSl0VKH0dOJMvB0CR3MC+AWQeHbPFOtA=;
        b=SGL5TMmG54nDuCeeKW1a+iD27tN8Sd5JPTh+8swJqYo8uBKLJFZJspVV3DgUJcR7W1
         E8mlK1oE19FSEEfAPePidemwgKBO5UL6Fh/uBg4dT3eiyL+RDCiHmLlAOmOkb1uTUeUj
         6FlKmj0pdmD38vPIOHYAPwzrUfTwYaseU7SGPNutidOwTiKSD3o5IPoIZ85mEzDmj+bj
         4BxOeEYPyXM+VVuk+zXD8EZ0J6/N/+7Joq23ZKIEzAeHEi98msnyadNQ1+nwnaKL3Uto
         X+XWusfvR4CeV4QVQZ7Br/HxSEiDbJlLOya3bntO+rAQLd+M/oDmRpY0S2Ia0H4Zyln2
         GzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378218; x=1725983018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrFjo+tZ1gGYSl0VKH0dOJMvB0CR3MC+AWQeHbPFOtA=;
        b=v2EhGRHLC2O/H3y0eKhAAFhJ3AnK9RYwlbDjoewwR7dWqKjOkej/bbEhho3DEkAxc5
         XsTaO6CjCnN4yEtvvtvBDOc+TAaKQNkpLnYhCE9la+uKL2cSJ+EbWXupnQRjQp8jeF36
         pDkqYapy5DXf6Io1PZjyvYHFaWOg0gyLIiVJ3A5KUY8T+otTxh5DxvKVLY6WQli4XIdg
         f852ngNyND8sK4dygiGV8eZPRN05WBbvdfQsFmnGQwncnasp4s3VUuPPhXrYskgcZgZ6
         MwrBHTRLYcqQkhS2MMyBeLtuYoawrEI5zTMVVysgvRInJY0odE+TwHlLfRM8IgE0/Sii
         lADg==
X-Forwarded-Encrypted: i=1; AJvYcCWtMBBxArAs2Hyz/LzmW8Sq9XgYgEXId4mjCQIT5CwggHyQEJb+WVh1FuDXNte2/Pr/0+uSO/FtMJROMghhmkOA@lists.infradead.org, AJvYcCWxLzDkdLdkEAZnESkdLb1VrC9P4+L7yJKi5aqD8q+/qu5rNVmMKl4rXeR6FSS1aZIKrVYie8R72G4Eb4xhEE0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/yElNeyowuLC1qxpLlFs/QxBOKtMTmB28REgUm0vNElREUFmi
	FwIO9m9obCVdHH2E1snK1Xd+UmgXdZP751bYHoLUQsnwdtSiI2GY
X-Google-Smtp-Source: AGHT+IFtKuJTUZtgaXPzWokqyjK7byQvdCebdVWZlVr9CLhhNoaOx7C6+7tzpmCqnew0Tap6TZWaWA==
X-Received: by 2002:a5d:53d2:0:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-374bd000df0mr6519110f8f.3.1725378217588;
        Tue, 03 Sep 2024 08:43:37 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-16-250-236.retail.telecomitalia.it. [87.16.250.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374ca42726fsm6416596f8f.9.2024.09.03.08.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:43:37 -0700 (PDT)
Message-ID: <66d72ea9.df0a0220.21f5f.029f@mx.google.com>
X-Google-Original-Message-ID: <ZtcWbARp9BITg7QJ@Ansuel-XPS.>
Date: Tue, 3 Sep 2024 16:00:12 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-2-98eebfb4da66@kernel.org>
 <20240903153353.GZ6858@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903153353.GZ6858@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_084340_290124_514643A0 
X-CRM114-Status: GOOD (  26.69  )
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

On Tue, Sep 03, 2024 at 04:33:53PM +0100, Lee Jones wrote:
> On Sat, 31 Aug 2024, Lorenzo Bianconi wrote:
> 
> > From: Christian Marangi <ansuelsmth@gmail.com>
> > 
> > Add support for Airoha EN7581 GPIO System Controller which provide a
> > register map for controlling the GPIO, pinctrl and PWM of the SoC.
> > 
> > Schema define cells for both gpio/interrupt controller and PWM.
> > Moreover it provides a dedicated pinctrl node for pins and config
> > definitions.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 433 +++++++++++++++++++++
> >  1 file changed, 433 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
> > new file mode 100644
> > index 000000000000..a9080c7f50f9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
> > @@ -0,0 +1,433 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/airoha,en7581-gpio-sysctl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha EN7581 GPIO System Controller
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +description:
> > +  Airoha EN7581 SoC GPIO system controller which provided a register map
> > +  for controlling the GPIO, pins and PWM of the SoC.
> 
> This whole thing is just about pins.
> 
> The MFD portion of this submission doesn't do anything.
>

Hi Lee,

thanks for the review. I think you missed the other series as it was
requested to use MFD implementation due to shared register map.

> Please rework this to omit the MFD driver.

I'm a bit confused by this you mean in the schema? Putting PWM property
in a pinctrl schema looks wrong to me :(

> 
> After just a glance, it looks like simple-mfd _might_ work.

Simple-mfd works if register map are well defined and you can have
something like
- parent define the whole register
- child can user reg property to register offset and subsection of the
  parent register

Here it's all mixed and scrambled and also it was requested to have a
very simple node that include both pwm and pinctrl property (cause that
is how the HW register block is designed and schema must reflect HW)

Hope you can understand these reasons.

> 
> > +properties:
> > +  compatible:
> > +    const: airoha,en7581-gpio-sysctl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +
> > +  pinctrl:
> > +    type: object
> > +
> > +    $ref: /schemas/pinctrl/pinctrl.yaml
> > +
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +
> > +        patternProperties:
> > +          '^.*mux.*$':
> > +            type: object
> > +
> > +            description:
> > +              pinmux configuration nodes.
> > +
> > +            $ref: /schemas/pinctrl/pinmux-node.yaml
> > +
> > +            properties:
> > +              function:
> > +                description:
> > +                  A string containing the name of the function to mux to the group.
> > +                enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> > +                       pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
> > +                       phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
> > +                       phy3_led1, phy4_led1]
> > +
> > +              groups:
> > +                description:
> > +                  An array of strings. Each string contains the name of a group.
> > +
> > +            required:
> > +              - function
> > +              - groups
> > +
> > +            allOf:
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: pon
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [pon]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: tod_1pps
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [pon_tod_1pps, gsw_tod_1pps]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: sipo
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [sipo, sipo_rclk]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: mdio
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [mdio]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: uart
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      items:
> > +                        enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts, uart4,
> > +                               uart5]
> > +                      maxItems: 2
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: i2c
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [i2c1]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: jtag
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [jtag_udi, jtag_dfd]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: pcm
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [pcm1, pcm2]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: spi
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      items:
> > +                        enum: [spi_quad, spi_cs1]
> > +                      maxItems: 2
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: pcm_spi
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      items:
> > +                        enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
> > +                               pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
> > +                               pcm_spi_cs4]
> > +                      maxItems: 7
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: i2c
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [i2s]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: emmc
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [emmc]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: pnand
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [pnand]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: pcie_reset
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [pcie_reset0, pcie_reset1, pcie_reset2]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: pwm
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> > +                             gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> > +                             gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> > +                             gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> > +                             gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> > +                             gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> > +                             gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: phy1_led0
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio33, gpio34, gpio35, gpio42]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: phy2_led0
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio33, gpio34, gpio35, gpio42]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: phy3_led0
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio33, gpio34, gpio35, gpio42]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: phy4_led0
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio33, gpio34, gpio35, gpio42]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: phy1_led1
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio43, gpio44, gpio45, gpio46]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: phy2_led1
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio43, gpio44, gpio45, gpio46]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: phy3_led1
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio43, gpio44, gpio45, gpio46]
> > +              - if:
> > +                  properties:
> > +                    function:
> > +                      const: phy4_led1
> > +                then:
> > +                  properties:
> > +                    groups:
> > +                      enum: [gpio43, gpio44, gpio45, gpio46]
> > +
> > +            additionalProperties: false
> > +
> > +          '^.*conf.*$':
> > +            type: object
> > +
> > +            description:
> > +              pinconf configuration nodes.
> > +
> > +            $ref: /schemas/pinctrl/pincfg-node.yaml
> > +
> > +            properties:
> > +              pins:
> > +                description:
> > +                  An array of strings. Each string contains the name of a pin.
> > +                items:
> > +                  enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
> > +                         spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
> > +                         gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
> > +                         gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> > +                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
> > +                         gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
> > +                         gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
> > +                         gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
> > +                         pcie_reset0, pcie_reset1, pcie_reset2]
> > +                minItems: 1
> > +                maxItems: 58
> > +
> > +              bias-disable: true
> > +
> > +              bias-pull-up: true
> > +
> > +              bias-pull-down: true
> > +
> > +              input-enable: true
> > +
> > +              output-enable: true
> > +
> > +              output-low: true
> > +
> > +              output-high: true
> > +
> > +              drive-open-drain: true
> > +
> > +              drive-strength:
> > +                description:
> > +                  Selects the drive strength for MIO pins, in mA.
> > +                enum: [2, 4, 6, 8]
> > +
> > +            required:
> > +              - pins
> > +
> > +            additionalProperties: false
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - "#pwm-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    mfd@1fbf0200 {
> > +        compatible = "airoha,en7581-gpio-sysctl";
> > +        reg = <0x1fbf0200 0xc0>;
> > +
> > +        interrupt-parent = <&gic>;
> > +        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +
> > +        #pwm-cells = <3>;
> > +
> > +        pinctrl {
> > +            pcie1-rst-pins {
> > +                conf {
> > +                    pins = "pcie_reset1";
> > +                    drive-open-drain = <1>;
> > +                };
> > +            };
> > +
> > +            pwm-pins {
> > +                mux {
> > +                    function = "pwm";
> > +                    groups = "gpio18";
> > +                };
> > +            };
> > +
> > +            spi-pins {
> > +                mux {
> > +                    function = "spi";
> > +                    groups = "spi_quad", "spi_cs1";
> > +                };
> > +            };
> > +
> > +            uart2-pins {
> > +                mux {
> > +                    function = "uart";
> > +                    groups = "uart2", "uart2_cts_rts";
> > +                };
> > +            };
> > +
> > +            uar5-pins {
> > +                mux {
> > +                    function = "uart";
> > +                    groups = "uart5";
> > +                };
> > +            };
> > +
> > +            mmc-pins {
> > +                mux {
> > +                    function = "emmc";
> > +                    groups = "emmc";
> > +                };
> > +            };
> > +
> > +            mdio-pins {
> > +                mux {
> > +                    function = "mdio";
> > +                    groups = "mdio";
> > +                };
> > +
> > +                conf {
> > +                    pins = "gpio2";
> > +                    output-enable;
> > +                };
> > +            };
> > +
> > +            gswp1-led0-pins {
> > +                mux {
> > +                    function = "phy1_led0";
> > +                    groups = "gpio33";
> > +                };
> > +            };
> > +
> > +            gswp2-led1-pins {
> > +                mux {
> > +                    function = "phy2_led1";
> > +                    groups = "gpio44";
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > 
> > -- 
> > 2.46.0
> > 
> 
> -- 
> Lee Jones [李琼斯]

-- 
	Ansuel

