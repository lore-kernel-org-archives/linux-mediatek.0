Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE42C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 08:51:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2AE820723
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 08:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZ02gwJm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eU3f/RWo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2AE820723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KEEt5rX+6dLlKFwhC4rn50qzREU0PLRdWDmF7SSiC8=; b=jZ02gwJmYVj6S1
	roXICyB/wHnk3BB1bvZKWyDNmzyxKCBuVtJsoqfEQoMSzzxlVeQ9mVCQCBt75xRZc7fxtx8WrbSY0
	AqPvT4lAZc+RDAfCtkAXcGRS2LVUgtWLB5CsemrR/T4b12/JmD3nRwbW1d/ISHo1QtqmfukWNmwnk
	hyNdlG1yuO79cv0ZUEXzPMmNXSN9hdPbOYUmogsO4TG44vYY9tTWI2Q62d7SVJ90WevnILUStQVrs
	4iAdRg6zpZaB0emI7Gpuet+ImOeQZnccTJzErIQ9X1AukXTKINutBis4jJrAQ9p8sMOn/f0L5WRhW
	BPuXCNlJ0xF9ZI10f27A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdrmM-00079m-V0; Wed, 27 May 2020 08:51:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdrmJ-00078b-N1; Wed, 27 May 2020 08:51:13 +0000
X-UUID: 09a57e3aa8be45eb998480bb912e113d-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DiIMoPScyJ+50+VuuFYsWXLfNu4cJqcpxf3a1uqkMkU=; 
 b=eU3f/RWoPtgfwpRGeA1wMlQzowmLByuQGBg7n7V2abuZ0e5Virmd/QqCGOAJyDP2pO/EL8yqGgjHt+cZlW8N3BCLQPCiL1kJwuHpItgKxYlLNW1P7op3BgO9zbFO7bEGxiUG3dsaSyBZnLPiPpcZfKATq2k+djrwhNKtd9jFTUw=;
X-UUID: 09a57e3aa8be45eb998480bb912e113d-20200527
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1578637235; Wed, 27 May 2020 00:50:56 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 May 2020 01:51:04 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 May 2020 16:51:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 May 2020 16:50:59 +0800
Message-ID: <1590569355.8804.448.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 27 May 2020 16:49:15 +0800
In-Reply-To: <20200526182847.GA92449@bogus>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
 <20200526182847.GA92449@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FD690253A9D5A698FD78664998AEEA2DFF479A4CE4320FD38196C8F592345D0D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_015111_757138_3F4FDB60 
X-CRM114-Status: GOOD (  23.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, louis.kuo@mediatek.com,
 srv_heupstream@mediatek.com, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, tfiga@chromium.org, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

Thanks for the review. Please see my replies below.

On Tue, 2020-05-26 at 12:28 -0600, Rob Herring wrote:
> On Sat, May 23, 2020 at 04:41:02PM +0800, Dongchun Zhu wrote:
> > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 179 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > new file mode 100644
> > index 0000000..56f31b5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > @@ -0,0 +1,172 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > +
> > +maintainers:
> > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +
> > +description: |-
> > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > +  sensor output is available via CSI-2 serial data output.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov02a10
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: top mux camtg clock
> > +      - description: divider clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: eclk
> > +      - const: freq_mux
> > +
> > +  clock-frequency:
> > +    description:
> > +      Frequency of the eclk clock in Hertz.
> > +

Rob, shall we use 'maxItems: 1' to constrain property: clock-frequency?
Or could we adopt 'clock-frequency: true' directly here?

> > +  dovdd-supply:
> > +    description:
> > +      Definition of the regulator used as Digital I/O voltage supply.
> > +

Shall we add 'maxItems: 1' here?

> > +  avdd-supply:
> > +    description:
> > +      Definition of the regulator used as Analog voltage supply.
> > +

Ditto.

> > +  dvdd-supply:
> > +    description:
> > +      Definition of the regulator used as Digital core voltage supply.
> > +

Ditto.

> > +  powerdown-gpios:
> > +    description:
> > +      Must be the device tree identifier of the GPIO connected to the
> > +      PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
> > +      or Shutdown mode. As the line is active low, it should be
> > +      marked GPIO_ACTIVE_LOW.
> 
> Need to define how many GPIOs ('maxItems: 1')
> 

It would be fixed like this in next release.
powerdown-gpios:
  maxItems: 1
  description:
    Must be the device tree identifier of the GPIO connected to the
    PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
    or Shutdown mode. As the line is active low, it should be
    marked GPIO_ACTIVE_LOW.

> > +
> > +  reset-gpios:
> > +    description:
> > +      Must be the device tree identifier of the GPIO connected to the
> > +      RST_PD pin. If specified, it will be asserted during driver probe.
> > +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.
> 
> Here too.
> 

Similar as 'powerdown-gpios'.
Fixed in next release.

> > +
> > +  rotation:
> > +    description:
> > +      Definition of the sensor's placement.
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum:
> > +          - 0    # Sensor Mounted Upright
> > +          - 180  # Sensor Mounted Upside Down
> > +        default: 0
> > +
> > +  ovti,mipi-tx-speed:
> > +    description:
> > +      Indication of MIPI transmission speed select, which is to control D-PHY
> > +      timing setting by adjusting MIPI clock voltage to improve the clock
> > +      driver capability.
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum:
> > +          - 0    #  20MHz -  30MHz
> > +          - 1    #  30MHz -  50MHz
> > +          - 2    #  50MHz -  75MHz
> > +          - 3    #  75MHz - 100MHz
> > +          - 4    # 100MHz - 130MHz
> > +        default: 3
> > +
> > +  # See ../video-interfaces.txt for details
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> 
> Should have a description of what data the port has.
> 

It would be updated as below in next release.
port:
  type: object
  additionalProperties: false
  description:
    Input port node, single endpoint describing the CSI-2 transmitter.

> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:

Actually I wonder whether we need to declare 'clock-lanes' here?

> > +          data-lanes:
> > +            maxItems: 1
> > +
> > +          link-frequencies: true
> > +          remote-endpoint: true
> > +
> > +        required:

Ditto.

> > +          - data-lanes
> > +          - link-frequencies
> > +          - remote-endpoint
> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - clock-frequency
> > +  - dovdd-supply
> > +  - avdd-supply
> > +  - dvdd-supply
> > +  - powerdown-gpios
> > +  - reset-gpios
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ov02a10: camera-sensor@3d {
> > +            compatible = "ovti,ov02a10";
> > +            reg = <0x3d>;
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&clk_24m_cam>;
> > +
> > +            clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
> > +                     <&topckgen CLK_TOP_UNIVP_192M_D8>;
> > +            clock-names = "eclk", "freq_mux";
> > +            clock-frequency = <24000000>;
> > +
> > +            rotation = <180>;
> > +            ovti,mipi-tx-speed = <4>;
> > +
> > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > +            avdd-supply = <&mt6358_vcama1_reg>;
> > +            dvdd-supply = <&mt6358_vcn18_reg>;
> > +
> > +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> > +            reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> > +
> > +            port {
> > +                wcam_out: endpoint {
> > +                    data-lanes = <1>;
> > +                    link-frequencies = /bits/ 64 <390000000>;
> > +                    remote-endpoint = <&mipi_in_wcam>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e64e5db..63a2335 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12389,6 +12389,13 @@ M:	Harald Welte <laforge@gnumonks.org>
> >  S:	Maintained
> >  F:	drivers/char/pcmcia/cm4040_cs.*
> >  
> > +OMNIVISION OV02A10 SENSOR DRIVER
> > +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://linuxtv.org/media_tree.git
> > +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > +
> >  OMNIVISION OV13858 SENSOR DRIVER
> >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> >  L:	linux-media@vger.kernel.org
> > -- 
> > 2.9.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
