Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC8EC47257
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 16:15:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ECAC206A4
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 16:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fRRtOZOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ECAC206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZhE2gKTOlNYBFYLbLEEVMMyRtJMDprrEn4nyZMf/u8=; b=fRRtOZOhBuFljO
	yJPgXeNyZrmEn0mR+x1pVayPSvpWrq3qyRqboH30IzpE3UCjVdOu5tDQ2ZIhbRXGlBtXyjgyoamsY
	Q6mGRddHx3GeP/1elnCyvVj8t4AbplFPYtHrSQmUuP/dFzZOlY974CD3HFQ/SdWtlUMabbgy39PEd
	Hsx94A3Y258ONwWH+sfYa4rlOHx4dIQwtHB8zn6eyEsxdymd4RjY6R8N71kh+YSQ/yhnzQ97nUsAM
	Fn/v/DdRPdROekI7Q2WOj4YME9qqivSR36fdCFJpOE0TBLiEbQ90G7beibBTaCUTN0qfnw9RT/uJN
	GQqT8aKXCcAAlUfo1X2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW0ET-0006v9-OX; Tue, 05 May 2020 16:15:45 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW0ER-0006ub-MB; Tue, 05 May 2020 16:15:45 +0000
Received: by mail-ot1-f68.google.com with SMTP id j4so2098971otr.11;
 Tue, 05 May 2020 09:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XEvj77nHBsN+uNI4KjHLCnMExXS2b39djG7luQ71idA=;
 b=QU7bNj4vdMZFlgjYGQJds9ASAnmPWopQhaFwAQ8UyoE25/D+CqF15Y0ggMkcnZamym
 +EU1gB0tMqUUtFlcOiMOgIr4HFSQ3/t+xLfIQS3+BBrdtsHQBKrSyVRwd1vN/ringygK
 V1ResDTdpmMwoK1NBPEQQ5JmZKgFVpJJ+86gy93cn3VrTWXuG0rAhDC0nfYL37YrQf/o
 ZBnj76WCmMjgg4Lt4cnxES1fZM70mdwpwNB3w/dO8FPWHwpYvjeYODUJtg7uzQAaoYrW
 segb6c0/TcfsQqS7jhc6OAl3epIibnFoTIaMql+JHEDo8wHVLDMKLX+wg+K366x+CtHP
 k0Wg==
X-Gm-Message-State: AGi0PuaDeKtg2REU+UNPVnLZIa/IwL0Wl86NMiIb0hOsh8aQHoixsOmK
 7FSz6djLA5ljG08r3Gjsng==
X-Google-Smtp-Source: APiQypIzZsE5G0TST9sgZVdQuA9MiyonjA1j2wsRyFz5gUcht3eH084KLBcLReRd9VFScGHJOXNkRA==
X-Received: by 2002:a9d:2782:: with SMTP id c2mr3039080otb.106.1588695342208; 
 Tue, 05 May 2020 09:15:42 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e16sm709845otp.20.2020.05.05.09.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 09:15:41 -0700 (PDT)
Received: (nullmailer pid 27288 invoked by uid 1000);
 Tue, 05 May 2020 16:15:40 -0000
Date: Tue, 5 May 2020 11:15:40 -0500
From: Rob Herring <robh@kernel.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200505161540.GA22172@bogus>
References: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
 <20200430080924.1140-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430080924.1140-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_091543_724427_413C6AAA 
X-CRM114-Status: GOOD (  16.77  )
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
 linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for Omnivision OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..2be4bd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,148 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> +
> +description: |-
> +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> +  image sensor, which is the latest production derived from Omnivision's CMOS
> +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> +  sensor output is available via CSI-2 serial data output.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov02a10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: top mux camtg clock
> +      - description: devider clock
> +
> +  clock-names:
> +    items:
> +      - const: eclk
> +      - const: freq_mux
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hertz.
> +
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as interface power supply.
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as digital power supply.
> +
> +  powerdown-gpios:

maxItems: 1

> +    description:
> +      The phandle and specifier for the GPIO that controls sensor powerdown.

Can be dropped. Doesn't tell me anything specific to this device.

> +
> +  reset-gpios:

maxItems: 1

> +    description:
> +      The phandle and specifier for the GPIO that controls sensor reset.
> +
> +  rotation:
> +    description:
> +      Definition of the sensor's placement, valid values are 0 and 180.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    # Sensor Mounted Upright
> +          - 180  # Sensor Mounted Upside Down
> +
> +  ovti,mipi-tx-speed:
> +    description:
> +      Indication of MIPI transmission speed select.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum: [ 3, 4 ]
> +
> +  # See ../video-interfaces.txt for details
> +  port:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          remote-endpoint: true
> +          link-frequencies: true
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-frequency
> +  - dovdd-supply
> +  - avdd-supply
> +  - dvdd-supply
> +  - powerdown-gpios
> +  - reset-gpios
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        clock-frequency = <400000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov02a10: camera-sensor@3d {
> +            compatible = "ovti,ov02a10";
> +            reg = <0x3d>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&clk_24m_cam>;
> +
> +            clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
> +                     <&topckgen CLK_TOP_UNIVP_192M_D8>;
> +            clock-names = "eclk", "freq_mux";
> +            clock-frequency = <24000000>;
> +
> +            rotation = <180>;
> +            ovti,mipi-tx-speed = <3>;
> +
> +            dovdd-supply = <&mt6358_vcamio_reg>;
> +            avdd-supply = <&mt6358_vcama1_reg>;
> +            dvdd-supply = <&mt6358_vcn18_reg>;
> +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                wcam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_wcam>;
> +                    link-frequencies = /bits/ 64 <390000000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64e5db..63a2335 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12389,6 +12389,13 @@ M:	Harald Welte <laforge@gnumonks.org>
>  S:	Maintained
>  F:	drivers/char/pcmcia/cm4040_cs.*
>  
> +OMNIVISION OV02A10 SENSOR DRIVER
> +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> +
>  OMNIVISION OV13858 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.9.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
