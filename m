Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E97C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 16:20:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CA92528A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 16:20:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F5hoJKA7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3CA92528A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+0+BvbpySBIEvdwE90gPXDBSvER013dKsPtqIb0OSvI=; b=F5hoJKA7y8e+lWD7fYYTE3okw
	hFZyqCGh/65Z5zguA/Oa9H0z89UnbWZBn0lYL2PNPthbLW2qmJBVJk4cju5OfL5IcFqP5xpLg/ze0
	+h0D6JeWyg5tw6gCMRHSEZmXxXrhJJtmce2u6/1U16icUlEfLim2t/saZeUn/cXjcLcMsOkDejlhm
	EgMbxWxIgfhlb7zsMT582dAMqYVKdQU7xsSy+Smo3CdYQLvqsFIwSWn4YpfsnBNN/UuMvQKQcwZGK
	MSt47CJIKldAsG9S/3XOcyenbtkfHwk9V9ik2OXFzNBQpyjINhcxjGtKcuNt1wtiyrzqFyv1Ndu1A
	ArJoZUJhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSN1u-0002ba-Nv; Tue, 13 Oct 2020 16:20:02 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSN1h-0002W1-4n; Tue, 13 Oct 2020 16:19:53 +0000
IronPort-SDR: W5cVx7Vo6rFaNFKKPyt54acfIfwVLKerGIALM25CDDfF7Nz7SDCX+ZR/N38KtUOQyCAoG+FiNP
 y5y0cESXTkxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166002514"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="166002514"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 09:19:45 -0700
IronPort-SDR: T8CrZoL7o9D/gVxeRdZ1w+UB9VXZEPeyTugyDTUgyUio4vkkogw9VjeNzSt23mVkk3v+HfkVb3
 YLFk4KOX3RHg==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="318350702"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 09:19:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 12D87205E8; Tue, 13 Oct 2020 19:19:39 +0300 (EEST)
Date: Tue, 13 Oct 2020 19:19:39 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201013161938.GE13341@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013130503.2412-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_121949_379306_6E2C137A 
X-CRM114-Status: GOOD (  26.95  )
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
 devicetree@vger.kernel.org, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> relevant MAINTAINERS entries.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..fb98964
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,162 @@
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
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      External clock for the sensor.
> +    items:
> +      - const: eclk
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hz.
> +
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as Digital I/O voltage supply.
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as Analog voltage supply.
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as Digital core voltage supply.
> +
> +  powerdown-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      PD_PAD pin. This pin is used to place the OV02A10 into standby mode
> +      or shutdown mode. As the line needs to be high for the powerdown mode
> +      to be active, it should be marked GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      RST_PD pin. If specified, it will be asserted during driver probe.
> +      As the line needs to be low for the reset to be active, it should be
> +      marked GPIO_ACTIVE_LOW.
> +    maxItems: 1
> +
> +  rotation:
> +    description:
> +      Definition of the sensor's placement.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    # Sensor Mounted Upright
> +          - 180  # Sensor Mounted Upside Down
> +        default: 0
> +
> +  ovti,mipi-clock-voltage:
> +    description:
> +      An array of 2-tuples items, and each item consists of link frequency and
> +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> +      dependent upon link speed, indicating MIPI transmission speed select that
> +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> +      the clock driver capability.
> +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +    minItems: 2
> +    default: [390000, 4]

Why do you have the link frequency here as well?

In principle this does belong to the endpoint as link frequencies are
specific to that, but I don't mind; there's just a single port anyway.

> +
> +  # See ../video-interfaces.txt for details
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Output port node, single endpoint describing the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          link-frequencies: true
> +          remote-endpoint: true
> +
> +        required:
> +          - link-frequencies
> +          - remote-endpoint
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
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov02a10: camera-sensor@3d {
> +            compatible = "ovti,ov02a10";
> +            reg = <0x3d>;
> +
> +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
> +
> +            clocks = <&ov02a10_clk>;
> +            clock-names = "eclk";
> +            clock-frequency = <24000000>;
> +
> +            rotation = <180>;
> +            ovti,mipi-clock-voltage = <390000 4>;
> +
> +            dovdd-supply = <&ov02a10_dovdd>;
> +            avdd-supply = <&ov02a10_avdd>;
> +            dvdd-supply = <&ov02a10_dvdd>;
> +
> +            port {
> +                wcam_out: endpoint {
> +                    link-frequencies = /bits/ 64 <390000000>;
> +                    remote-endpoint = <&mipi_in_wcam>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deaafb6..48aa7a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12718,6 +12718,13 @@ M:	Harald Welte <laforge@gnumonks.org>
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

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
