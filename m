Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91D5C25B47
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D28lAzumuVUOJunPEMR3/M6+6t0AD3YzFGJb3Sc9Vxo=; b=3aCdSNmTEOSMkEn8ZANftTa4XZ
	lXwCuLi19szP6gYSf63AqEMgfoF4f4dl1CQuoZ4F62MEVSiWo2gXkCOd6Rv3MEMDhzv8HvshJkDHp
	r4GHOBiWzG2kc324KlXB4HJOMWm2DW+TCOL1qTPO/HuHfsC2Sx4EjXSUo4Et+5V4Qtb9yDzIYljj2
	xzGmU6mHeUloqyt02j1APaZH30pmzNvoDwjjguJ67evSgL5OZp+Wtp//l0yLVZ7squ+7SgNcd9c//
	QbR2JCKgKMFk+zOtW3/h5qbXwDmkMfaWSaDfbzmXUInVrDmk+nFNL4ayMs2IkNtZ8mATC7UEsk0fb
	Vv1YGNOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwLRh-00GL7u-2d;
	Fri, 27 Oct 2023 11:56:09 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwLRe-00GL6C-0H
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Oct 2023 11:56:08 +0000
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SH1Mb5zrzz49Q1r;
	Fri, 27 Oct 2023 14:55:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1698407757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D28lAzumuVUOJunPEMR3/M6+6t0AD3YzFGJb3Sc9Vxo=;
	b=brctDzJW21JeCXSbjarCwLWwSY8hLs2HBnXt2XInlO1abd2dym9CRATj0LJMUFlsRCRyyY
	T8TWooi4Nb+xakJIWkqUFaAqdTE55HbXnchFS87nAKytGBl7tsHLM4O9W03garoRW7CJLi
	eG8v4KRc2KNk8tqDwcmmKkhNUrtghb8JaGqAbqnH8yNHjSIM+rgMJocW8uWhb9iGMMuQab
	c91Q4H88Mgkd+Xvz5Yr+Xf2FcYXeKE9AHDs2H+2QpBX017Re6wIirXFNPYsFGooYRFFJAr
	Eb7BADc/XNIPcEMfKKnpJY/dMzrIoZ7Rnkb0lL+m8btJGZ6ZRqEroWxHFnb3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1698407757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D28lAzumuVUOJunPEMR3/M6+6t0AD3YzFGJb3Sc9Vxo=;
	b=jqF3nnqO7IDcg5b5YBEr3zNhPUSM0pmnCza8UyZyv2J2mbzvnq3UHZvbdRi7DgmdmzIagO
	Aw/E5i3j1bpce1aO63AhpExu1fUe77wLIlAk/oY9AcmdsjMSZenxLFMs/efA8n24eg60T3
	o5BfUoBX0DGfyPk67I0p1QLbzXeKW4fH5b/batvbj61vG3KvcLWBhSbV8JOGQhTivTifu8
	3kvbLA/XIfigNeiWW4uMqfw4PcjHEY/8vftvSEFeZw5pXFk/f8Kx6KThvZyayYla1iVfy/
	DLT2zwnMimbPL62+WcwlhUKVhbdnIE/1jQ/C8ZrwXBMgYk7MByL0+1W5BNlnAg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1698407757; a=rsa-sha256;
	cv=none;
	b=GAhog2GZED4+RzWYPeZH7kVKfj7+ZV/PagZwXxjAUJpTdha/vwy3xE0CY38Wcogr55c41F
	mFNswsrqBItPOvZks5aANA6fHY/1IbPFonoIlnDNKxE1TD3f2U8sgB+T1xYGVxBeTX6zim
	bI9kJe0+YXgBatEnIXgAlLizq3B81mL535x7WHCJ6n8shEzzBz1FNt57UYPBcEzq2Evcf9
	0bxYz6qaoGb+AW4E4CFMIdrEabycxAIse+I4viLA6d6vwH+ZAIR/UN43ON/TJQEryV7wLp
	mEy4ft63+1JRp6+QiCfPA/wD2YR6PL4u2eye3PC1WBpdgafH92u7Jz1iqK6p1g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AE5B5634C93;
	Fri, 27 Oct 2023 14:55:52 +0300 (EEST)
Date: Fri, 27 Oct 2023 11:55:52 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <ZTulSCwfyEF9exu9@valkosipuli.retiisi.eu>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017132103.9914-2-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_045606_305881_A502B7F8 
X-CRM114-Status: GOOD (  31.27  )
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

Hi Laurent,

Thank you for the patchset any my apologies for not reviewing it earlier.

On Tue, Oct 17, 2023 at 04:21:01PM +0300, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> The THP7312 is an external ISP from THine. Add DT bindings for it.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Drop description of reg property
> - Improve thine,boot-mode property documentation
> - Making thine,boot-mode property optional
> - Don't use underscores in supplies names
> ---
>  .../bindings/media/i2c/thine,thp7312.yaml     | 226 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> new file mode 100644
> index 000000000000..0758d8d44826
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> @@ -0,0 +1,226 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 Ideas on Board
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/thine,thp7312.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: THine THP7312
> +
> +maintainers:
> +  - Paul Elder <paul.elder@@ideasonboard.com>
> +
> +description:
> +  The THP7312 is a standalone ISP controlled over i2c, and is capable of
> +  various image processing and correction functions, including 3A control. It
> +  can be connected to CMOS image sensors from various vendors, supporting both
> +  MIPI CSI-2 and parallel interfaces. It can also output on either MIPI CSI-2
> +  or parallel. The hardware is capable of transmitting and receiving MIPI
> +  interlaved data strams with data types or multiple virtual channel
> +  identifiers.
> +
> +allOf:
> +  - $ref: ../video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: thine,thp7312
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: CLKI clock input
> +
> +  thine,boot-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1
> +    default: 1
> +    description:
> +      Boot mode of the THP7312, reflecting the value of the BOOT[0] pin strap.
> +      0 is for the SPI/2-wire slave boot, 1 is for the SPI master boot (from
> +      external flash ROM).
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Reference to the GPIO connected to the RESET_N pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  vddcore-supply:
> +    description:
> +      1.2V supply for core, PLL, MIPI rx and MIPI tx.
> +
> +  vhtermrx-supply:
> +    description:
> +      Supply for input (RX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
> +
> +  vddtx-supply:
> +    description:
> +      Supply for output (TX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
> +
> +  vddhost-supply:
> +    description:
> +      Supply for host interface. 1.8V, 2.8V, or 3.3V.
> +
> +  vddcmos-supply:
> +    description:
> +      Supply for sensor interface. 1.8V, 2.8V, or 3.3V.
> +
> +  vddgpio-0-supply:
> +    description:
> +      Supply for GPIO_0. 1.8V, 2.8V, or 3.3V.
> +
> +  vddgpio-1-supply:
> +    description:
> +      Supply for GPIO_1. 1.8V, 2.8V, or 3.3V.
> +
> +  orientation: true
> +  rotation: true
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            description:
> +              This property is for lane reordering between the THP7312 and the
> +              SoC. The sensor supports either two-lane, or four-lane operation.
> +              If this property is omitted four-lane operation is assumed. For
> +              two-lane operation the property must be set to <1 2>.

How are link frequencies determined by the device?

The description above also says the parallel interface is supported. The
bindings do not reflect that however.

Same for the sensor node below.

Is the intention to add support for these later on? In that case you'll
need bus-type and default that to CSI-2 for DTs conforming to these
bindings.

> +            minItems: 2
> +            maxItems: 4
> +            items:
> +              maximum: 4
> +
> +  sensors:
> +    type: object
> +    description: List of connected sensors
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^sensor@[01]":
> +        type: object
> +        description:
> +          Sensors connected to the first and second input, with one node per
> +          sensor.
> +
> +        properties:
> +          thine,model:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            description:
> +              Model of the connected sensors. Must be a valid compatible string.
> +
> +          reg:
> +            maxItems: 1
> +            description: THP7312 input port number
> +
> +          data-lanes:
> +            $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> +            items:
> +              maxItems: 4
> +            description:
> +              This property is for lane reordering between the THP7312 and the imaging
> +              sensor that it is connected to.
> +
> +        patternProperties:
> +          ".*-supply":
> +            description: Power supplies for the sensor
> +
> +        required:
> +          - reg
> +          - data-lanes
> +
> +        additionalProperties: false
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - clocks
> +  - vddcore-supply
> +  - vhtermrx-supply
> +  - vddtx-supply
> +  - vddhost-supply
> +  - vddcmos-supply
> +  - vddgpio-0-supply
> +  - vddgpio-1-supply
> +  - sensors
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
> +        camera@61 {
> +            compatible = "thine,thp7312";
> +            reg = <0x61>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&cam1_pins_default>;
> +
> +            reset-gpios = <&pio 119 GPIO_ACTIVE_LOW>;
> +            clocks = <&camera61_clk>;
> +
> +            vddcore-supply = <&vsys_v4p2>;
> +            vhtermrx-supply = <&vsys_v4p2>;
> +            vddtx-supply = <&vsys_v4p2>;
> +            vddhost-supply = <&vsys_v4p2>;
> +            vddcmos-supply = <&vsys_v4p2>;
> +            vddgpio-0-supply = <&vsys_v4p2>;
> +            vddgpio-1-supply = <&vsys_v4p2>;
> +
> +            orientation = <0>;
> +            rotation = <0>;
> +
> +            sensors {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                sensor@0 {
> +                    thine,model = "sony,imx258";
> +                    reg = <0>;
> +
> +                    data-lanes = <4 1 3 2>;

Does the device support lane mapping?

> +
> +                    dovdd-supply = <&vsys_v4p2>;
> +                    avdd-supply = <&vsys_v4p2>;
> +                    dvdd-supply = <&vsys_v4p2>;
> +                };
> +            };
> +
> +            port {
> +                thp7312_2_endpoint: endpoint {
> +                    remote-endpoint = <&mipi_thp7312_2>;
> +                    data-lanes = <4 2 1 3>;
> +                };
> +            };
> +    	  };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b47e0b56859..7451367e6780 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21448,6 +21448,13 @@ S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
>  F:	drivers/platform/x86/think-lmi.?
>  
> +THP7312 ISP DRIVER
> +M:	Paul Elder <paul.elder@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> +
>  THUNDERBOLT DMA TRAFFIC TEST DRIVER
>  M:	Isaac Hazan <isaac.hazan@intel.com>
>  L:	linux-usb@vger.kernel.org

-- 
Regards,

Sakari Ailus

