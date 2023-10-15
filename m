Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF91ECDB47E
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Oct 2023 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kihsLIRXdU51mIU8JNsgyKwh8AfnKL+o7Q2FQ9eHaoE=; b=4V/a5ittbn1yg+Ix9+LP68qMrS
	nQ/ykPwWLnuNoay+NvdDoOyGjDrus37ru9PTn20nua+YU4hgcixCqkFZhBlacyihFk0Mo65+CzgB5
	WXol8cEBnUDFsbKEBwhG7tu8WcuXeMZEArizFi9JdFFCpc8lKagCUsSXks/v+XLXWy05kQxr293oB
	XSEncGlbRercAQb4jXPA848ES0VprhPD5/l2SCT4FH3s9doZmTmw+XAiJZ1Dd4plVaLNyuY/iLTQb
	9KbSyIMv8rz6p1fp2LIlJ1xWArPavv5Cxxvbpelnm1NY14dkakRe63COqKhalzZM6oM0w1F+p5rxc
	JgWIWyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qs0P0-007BAw-1o;
	Sun, 15 Oct 2023 12:39:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qs0Ox-007BAM-2D
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Oct 2023 12:39:25 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB896327;
	Sun, 15 Oct 2023 14:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697373551;
	bh=dzjnCjwfcqMfcNNHqBSajU7MAd1Z/q6f1+jISiGq4wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWTA4B8ogveTLdw4KUrBd92ZacGUfzAzx2gzJrDfDJ/16yA/g2TGCCHhyvM2P68qH
	 h3Qg+CWBdsF8xgm9KIiiVa5VvB59fB98tyuRRSlSus/PJLOGaPy//rLMiMPgfRkIBJ
	 RWqATi8lPV9zVrOGPW76Wwg/zk0sURwIQGQhPcLY=
Date: Sun, 15 Oct 2023 15:39:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231015123923.GB23177@pendragon.ideasonboard.com>
References: <20231012193737.7251-1-laurent.pinchart@ideasonboard.com>
 <20231012193737.7251-2-laurent.pinchart@ideasonboard.com>
 <aaa41ff2-d2e3-4c25-9654-065a02275619@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaa41ff2-d2e3-4c25-9654-065a02275619@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_053923_893732_A526AB01 
X-CRM114-Status: GOOD (  18.33  )
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

Hi Krzysztof,

On Thu, Oct 12, 2023 at 09:57:38PM +0200, Krzysztof Kozlowski wrote:
> On 12/10/2023 21:37, Laurent Pinchart wrote:
> 
> Thanks for the changes

You're welcome. Sorry again for missing some of your review comments on
v1.

> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            description:
> > +              This property is for lane reordering between the THP7312 and the
> > +              SoC. The sensor supports either two-lane, or four-lane operation.
> > +              If this property is omitted four-lane operation is assumed. For
> > +              two-lane operation the property must be set to <1 2>.
> > +            minItems: 2
> > +            maxItems: 4
> > +            items:
> > +              maximum: 4
> > +
> > +  sensors:
> > +    type: object
> > +    description: List of connected sensors
> 
> I don't understand why do you list sensors here. From the binding
> description I understood these are external sensors, which usually sit
> on I2C bus.

Good question :-)

The sensors connected to the THP7312 input are controlled over I2C by
the THP7312 itself. The host operating system doesn't have access to
that I2C bus. The sensors are listed here because their power supplies
need to be controlled by the host operating system.

> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^sensor@[01]":
> > +        type: object
> > +        description:
> > +          Sensors connected to the first and second input, with one node per
> > +          sensor.
> > +
> > +        properties:
> > +          thine,model:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description:
> > +              Model of the connected sensors. Must be a valid compatible string.
> 
> Then why this isn't compatible?

We picked a vendor-specific property to avoid implying that the sensor
nodes will result in devices being created by the host operating system.
I don't mind using "compatible" instead, but as far as I understand, a
compatible string implies that corresponding device DT bindings should
exist, and that won't be the case here necessarily.

> > +
> > +          reg:
> > +            maxItems: 1
> > +            description: THP7312 input port number
> > +
> > +          data-lanes:
> > +            $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> > +            items:
> > +              maxItems: 4
> > +            description:
> > +              This property is for lane reordering between the THP7312 and the imaging
> > +              sensor that it is connected to.
> > +
> > +        patternProperties:
> > +          ".*-supply":
> > +            description: Power supplies for the sensor
> > +
> > +        required:
> > +          - reg
> > +          - data-lanes
> > +
> > +        additionalProperties: false
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - clocks
> > +  - vddcore-supply
> > +  - vhtermrx-supply
> > +  - vddtx-supply
> > +  - vddhost-supply
> > +  - vddcmos-supply
> > +  - vddgpio-0-supply
> > +  - vddgpio-1-supply
> > +  - sensors
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera@61 {
> > +            compatible = "thine,thp7312";
> > +            reg = <0x61>;
> > +
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&cam1_pins_default>;
> > +
> > +            reset-gpios = <&pio 119 GPIO_ACTIVE_LOW>;
> > +            clocks = <&camera61_clk>;
> > +
> > +            vddcore-supply = <&vsys_v4p2>;
> > +            vhtermrx-supply = <&vsys_v4p2>;
> > +            vddtx-supply = <&vsys_v4p2>;
> > +            vddhost-supply = <&vsys_v4p2>;
> > +            vddcmos-supply = <&vsys_v4p2>;
> > +            vddgpio-0-supply = <&vsys_v4p2>;
> > +            vddgpio-1-supply = <&vsys_v4p2>;
> > +
> > +            orientation = <0>;
> > +            rotation = <0>;
> > +
> > +            sensors {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                sensor@0 {
> > +                    thine,model = "sony,imx258";
> > +                    reg = <0>;
> > +
> > +                    data-lanes = <4 1 3 2>;
> > +
> > +                    dovdd-supply = <&vsys_v4p2>;
> > +                    avdd-supply = <&vsys_v4p2>;
> > +                    dvdd-supply = <&vsys_v4p2>;
> > +                };
> > +            };
> > +
> > +            port {
> > +                thp7312_2_endpoint: endpoint {
> > +                    remote-endpoint = <&mipi_thp7312_2>;
> > +                    data-lanes = <4 2 1 3>;
> > +                };
> > +            };
> > +    	  };
> > +    };

-- 
Regards,

Laurent Pinchart

