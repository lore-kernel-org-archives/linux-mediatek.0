Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEE3C54E4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 13:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097D7208DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 13:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uLqwy2P4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EYLxPAOH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097D7208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOJQjybQVxtpj6Or4IozmgESd3bEnpcBklFKJ6GU4i0=; b=uLqwy2P4T2VAxS
	vdq/I/cq3PyJ8j1DivyzPzOpyCvYJ6gmDU/H7APVAaZO2CgvMu3ZT8Fq8jPrjPJHxg7APDLzduLuy
	hVQb7Zv2gEW8PoSZ8/AnKk4HTdogxsxMtLsWXjjyYzXVL8lQB6x6o5hdwzkJjN637tZz663Axd8El
	YfpGNlYkuuOReZ2A3YizrPkU3jnBtkvemI3nlgk7MZl2x1VI3wLL++yfynfp6bbnjp7jG755zeN4w
	3jFzgeaCKpbhaBQwod+5zqkgXzRkb9uhcSfVk9ZKRFlCXHRgA5db0vHqPXPuZmIBT0SNdL2dLDDhj
	ighz3iprdX18zPUVDQUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWg8A-0005Ky-Ns; Thu, 07 May 2020 13:00:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWg87-0005J5-5I; Thu, 07 May 2020 13:00:01 +0000
X-UUID: 671dd17b2cce405c8341798b433de815-20200507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VI19oD7mDKtgqQv1VHd5bxqMfBTo0kcii3ZpM7XK99o=; 
 b=EYLxPAOHx7Vr2+QyYRD0RZyJjdCH1uUP8u3CSwYyyxOXcCbiDwi2QlQqqbn8HGTv9nSaUk/rW9aDPL44m2QwPNFX3t7Lnz6VoK7b9vtbYFIoeLx6W/g7k+vPiWBi3vehXGWf3yWPCMdMmtTcm/+WAMYPQQnXuNhjKTHxZPanjVM=;
X-UUID: 671dd17b2cce405c8341798b433de815-20200507
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 923902101; Thu, 07 May 2020 04:59:59 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 May 2020 05:59:52 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 7 May 2020 20:59:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 May 2020 20:59:50 +0800
Message-ID: <1588856325.8804.179.camel@mhfsdcap03>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 7 May 2020 20:58:45 +0800
In-Reply-To: <20200506112136.GV9190@paasikivi.fi.intel.com>
References: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
 <20200430080924.1140-2-dongchun.zhu@mediatek.com>
 <20200505070451.GS9190@paasikivi.fi.intel.com>
 <1588688238.8804.150.camel@mhfsdcap03>
 <20200506112136.GV9190@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3CF84EBD27476F1CCCB4396207FAE2684506AFD090C14A78C4C964DC5FFE44B62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_055959_212017_B3E67F59 
X-CRM114-Status: GOOD (  28.04  )
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

On Wed, 2020-05-06 at 14:21 +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> On Tue, May 05, 2020 at 10:17:18PM +0800, Dongchun Zhu wrote:
> > Hi Sakari,
> > 
> > Thanks for the review.
> > 
> > On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> > > Hi Dongchun,
> > > 
> > > On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > > 
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> > > >  MAINTAINERS                                        |   7 +
> > > >  2 files changed, 155 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > new file mode 100644
> > > > index 0000000..2be4bd2
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > @@ -0,0 +1,148 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +# Copyright (c) 2020 MediaTek Inc.
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > +
> > > > +description: |-
> > > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > > +  sensor output is available via CSI-2 serial data output.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: ovti,ov02a10
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: top mux camtg clock
> > > > +      - description: devider clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: eclk
> > > > +      - const: freq_mux
> > > > +
> > > > +  clock-frequency:
> > > > +    description:
> > > > +      Frequency of the eclk clock in Hertz.
> > > > +
> > > > +  dovdd-supply:
> > > > +    description:
> > > > +      Definition of the regulator used as interface power supply.
> > > > +
> > > > +  avdd-supply:
> > > > +    description:
> > > > +      Definition of the regulator used as analog power supply.
> > > > +
> > > > +  dvdd-supply:
> > > > +    description:
> > > > +      Definition of the regulator used as digital power supply.
> > > > +
> > > > +  powerdown-gpios:
> > > > +    description:
> > > > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > > > +
> > > > +  reset-gpios:
> > > > +    description:
> > > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > > +
> > > > +  rotation:
> > > > +    description:
> > > > +      Definition of the sensor's placement, valid values are 0 and 180.
> > > > +    allOf:
> > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > +      - enum:
> > > > +          - 0    # Sensor Mounted Upright
> > > > +          - 180  # Sensor Mounted Upside Down
> > > > +
> > > > +  ovti,mipi-tx-speed:
> > > > +    description:
> > > > +      Indication of MIPI transmission speed select.
> > > 
> > > What exactly does this signify? And how do you come up with the number?
> > > 
> > 
> > Apologies for not addressing this number clear.
> > 
> > From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
> > the default val: 0x03.
> > The description of this RW register is as below:
> > Bit[2:0]: MIPI transmission speed select.
> > 
> > Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
> > This would be fixed in next release.
> > 
> > In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
> > that value if there is no setting for this private property in DT.
> > The caller in driver would be updated like this in next release.
> > if (ov02a10->mipi_clock_tx_speed)
> > 	ret = i2c_smbus_write_byte_data(...,...);
> 
> How did you pick the value in the example? And why do you believe it is
> specific to a platform, and not e.g. a sensor mode?
> 

We look into P1:0XA1, one register that defines MIPI transmission speed
select.
From the datasheet, we can get the possible values that could be set to
P1:0xA1.

Actually this register is an independent of sensor mode, it is just
included in sensor mode's register setting table.

In addition, this private DT Property is created to fix the MIPI test
failure. The register values are adjusted and verified from vendor to
make sensor signal meet MIPI specification.

> > 
> > > > +    allOf:
> > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > +      - enum: [ 3, 4 ]
> > > > +
> > > > +  # See ../video-interfaces.txt for details
> > > > +  port:
> > > > +    type: object
> > > > +    additionalProperties: false
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        type: object
> > > > +        additionalProperties: false
> > > > +
> > > > +        properties:
> > > > +          remote-endpoint: true
> > > > +          link-frequencies: true
> > > > +
> > > > +    required:
> > > > +      - endpoint
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - clock-frequency
> > > > +  - dovdd-supply
> > > > +  - avdd-supply
> > > > +  - dvdd-supply
> > > > +  - powerdown-gpios
> > > > +  - reset-gpios
> > > > +  - port
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/mt8183-clk.h>
> > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > +
> > > > +    i2c {
> > > > +        clock-frequency = <400000>;
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        ov02a10: camera-sensor@3d {
> > > > +            compatible = "ovti,ov02a10";
> > > > +            reg = <0x3d>;
> > > > +            pinctrl-names = "default";
> > > > +            pinctrl-0 = <&clk_24m_cam>;
> > > > +
> > > > +            clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
> > > > +                     <&topckgen CLK_TOP_UNIVP_192M_D8>;
> > > > +            clock-names = "eclk", "freq_mux";
> > > > +            clock-frequency = <24000000>;
> > > > +
> > > > +            rotation = <180>;
> > > > +            ovti,mipi-tx-speed = <3>;
> > > > +
> > > > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > > > +            avdd-supply = <&mt6358_vcama1_reg>;
> > > > +            dvdd-supply = <&mt6358_vcn18_reg>;
> > > > +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> > > > +            reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> > > > +
> > > > +            port {
> > > > +                wcam_out: endpoint {
> > > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > > +                    link-frequencies = /bits/ 64 <390000000>;
> > > > +                };
> > > > +            };
> > > > +        };
> > > > +    };
> > > > +
> > > > +...
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index e64e5db..63a2335 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -12389,6 +12389,13 @@ M:	Harald Welte <laforge@gnumonks.org>
> > > >  S:	Maintained
> > > >  F:	drivers/char/pcmcia/cm4040_cs.*
> > > >  
> > > > +OMNIVISION OV02A10 SENSOR DRIVER
> > > > +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > +L:	linux-media@vger.kernel.org
> > > > +S:	Maintained
> > > > +T:	git git://linuxtv.org/media_tree.git
> > > > +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > +
> > > >  OMNIVISION OV13858 SENSOR DRIVER
> > > >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> > > >  L:	linux-media@vger.kernel.org
> > > 
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
