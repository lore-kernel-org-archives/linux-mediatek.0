Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5700C47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EAFD20675
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G6rNGoUu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qn+orp4I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EAFD20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viIjX/kE44NHTsB79+3vA0e7TX14VfwctG1/cPuwV2U=; b=G6rNGoUuRkHJiE
	cu5Ccx/urNV+19R7aC2J5F1HO2I2WhQP41znpw9ZPrSc5ZLqKKb4MnESqMHIRm79MPA/tyjX6zjb+
	lp8/toGCa6PLG30GwV1YHaI0xHCHw59gz3kApLXPFg6UXRwy9BMPkEnaD/fTOUsqkDlWW1tW1gOdB
	x1ABN+e9XeoXSTVj75NtIhBBZIatHRYG1WoyO5ilxIetCZjx/F3FqFRf2h/Mg7R671V8yLUVayKo4
	T/ZR+FmHNuWRAnniq445FjJGWqzKVVb5G/ZNMB3fIdsazmK8IFEKjdE7I86siJ77rCbbp52DVU6KR
	2A3cAi05cdElQFyZtMvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVyP5-0000Xf-8x; Tue, 05 May 2020 14:18:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVyP2-0000WG-8j; Tue, 05 May 2020 14:18:34 +0000
X-UUID: d08b1254a5394a719b5f3e3f741a6489-20200505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ln7segckAaiZAgl5KaodMOtBPiq7uyrqeiRYfTd7390=; 
 b=qn+orp4IE+WGgZ3zaTvwWzfltDoVjEASb2YDxUFQJyMpBrFhMvHWyFLF2KlspoGxrZFpBC6x2ySJVBWVdnZbNeovMfO8k0Yn5Eufdny3Aj0GQpzevI2MbFQDqOpnvtIcUJhwXnQBhkFgSIvVrVsDK8zv1TIPIyhsKTFVzzy924A=;
X-UUID: d08b1254a5394a719b5f3e3f741a6489-20200505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1042931872; Tue, 05 May 2020 06:18:27 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 May 2020 07:18:23 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 May 2020 22:18:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 May 2020 22:18:18 +0800
Message-ID: <1588688238.8804.150.camel@mhfsdcap03>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 5 May 2020 22:17:18 +0800
In-Reply-To: <20200505070451.GS9190@paasikivi.fi.intel.com>
References: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
 <20200430080924.1140-2-dongchun.zhu@mediatek.com>
 <20200505070451.GS9190@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4EB007B2B39823776E591625AE24E153515C61B35CE8B89132CA6EE5D2B255FE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_071832_319852_8F30E7A4 
X-CRM114-Status: GOOD (  20.40  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, tfiga@chromium.org, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 louis.kuo@mediatek.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 matrix.zhu@aliyun.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari,

Thanks for the review.

On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 155 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > new file mode 100644
> > index 0000000..2be4bd2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > @@ -0,0 +1,148 @@
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
> > +      - description: devider clock
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
> > +  dovdd-supply:
> > +    description:
> > +      Definition of the regulator used as interface power supply.
> > +
> > +  avdd-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply.
> > +
> > +  dvdd-supply:
> > +    description:
> > +      Definition of the regulator used as digital power supply.
> > +
> > +  powerdown-gpios:
> > +    description:
> > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > +
> > +  reset-gpios:
> > +    description:
> > +      The phandle and specifier for the GPIO that controls sensor reset.
> > +
> > +  rotation:
> > +    description:
> > +      Definition of the sensor's placement, valid values are 0 and 180.
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum:
> > +          - 0    # Sensor Mounted Upright
> > +          - 180  # Sensor Mounted Upside Down
> > +
> > +  ovti,mipi-tx-speed:
> > +    description:
> > +      Indication of MIPI transmission speed select.
> 
> What exactly does this signify? And how do you come up with the number?
> 

Apologies for not addressing this number clear.

From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
the default val: 0x03.
The description of this RW register is as below:
Bit[2:0]: MIPI transmission speed select.

Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
This would be fixed in next release.

In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
that value if there is no setting for this private property in DT.
The caller in driver would be updated like this in next release.
if (ov02a10->mipi_clock_tx_speed)
	ret = i2c_smbus_write_byte_data(...,...);

> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum: [ 3, 4 ]
> > +
> > +  # See ../video-interfaces.txt for details
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          remote-endpoint: true
> > +          link-frequencies: true
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
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        clock-frequency = <400000>;
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
> > +            ovti,mipi-tx-speed = <3>;
> > +
> > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > +            avdd-supply = <&mt6358_vcama1_reg>;
> > +            dvdd-supply = <&mt6358_vcn18_reg>;
> > +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> > +            reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> > +
> > +            port {
> > +                wcam_out: endpoint {
> > +                    remote-endpoint = <&mipi_in_wcam>;
> > +                    link-frequencies = /bits/ 64 <390000000>;
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
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
