Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA3BC3815B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 18:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407D82074F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 18:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="egzjmjGW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 407D82074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxHwp+wHUaXUsC997lPGpwvFWdWNBzjUZAROakNxTYw=; b=egzjmjGWNbsbvi
	BXnmj1Wcg9X+b0KJJZ6Ufag9SOl0+AG9uDpAHqyQjSPJK83kY6ZTqvaCCNtVhBCtHX94WJn2nc/KR
	yU3if7TzQzl8ag56ZtrU+dnPg7oxuyfg6OpihuZWSzK91GuoAQpjzbWgI8EtXbAyHrfWmXE5agvsY
	8T/TzSFYX7D5ZwZns1Thk9NjqImaigdOriOqt6f6DWyHl7bBPekF9QNt6KJqv5rg3TRlJKz1NAaLu
	mwSzrtOTF0cCEkaTkCw+UqIzuT1SMWyEeoZQ8taEp19F6FzdROsDpFW+L5fu7dceV8n6GQKN2gkos
	anT92dzRBWhdNlSV9OcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQbO3-0007AC-Rc; Mon, 20 Apr 2020 18:43:19 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQbNx-00077P-FL; Mon, 20 Apr 2020 18:43:18 +0000
Received: by mail-oi1-f195.google.com with SMTP id r66so9750658oie.5;
 Mon, 20 Apr 2020 11:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wr9z4VHkUYV0azpH3NGkoTt6PH+KjpNDUACdFjs/NiA=;
 b=tnBHrrUAvgVy9JIjBMTqTa7gpYh9hRWnlM8ffGSGRDWN7N5tqIgxPRF5xFq7UDuqIE
 38PejPKvo2xl2AsDYyXqujxpkzueczHDA0ieM2Bk93RzrhMOHFFXdr3+aDws91xpr0P5
 ARm2St9R3BQD6Ze2XIME3uwgbrHehuSk9l6wLEhb/BJHndrSv3p46eWGhYUo+FYxhoL7
 +fHSHR5wvSgIFaY1Uwn+QRrkcA14j13r8f0xU6P5+y4Sr3m7Sfd2qnQE/xEefgIj+PUA
 q1l3pq8VDGq6i1Qf1uZAZTPxPsXbqLz6YxZH2UVMwhakXIxdOAmHCJBtvigPC5TqkTar
 vcXg==
X-Gm-Message-State: AGi0Pub8gg3licaPqj66RjwGMPVd+Ke3hbov5sCmZPNOsh5tnku/NT3z
 pfWWqN+5zvIoaGZZJ7SjsQ==
X-Google-Smtp-Source: APiQypJe7MGfPouzuOmJSJnUYSad5CodTv75XXmNZndtyFF4Gy8XOt8HUimd4fV/Vgik2rKP29RQcg==
X-Received: by 2002:aca:cf4b:: with SMTP id f72mr580396oig.177.1587408191338; 
 Mon, 20 Apr 2020 11:43:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c24sm50813oov.48.2020.04.20.11.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 11:43:10 -0700 (PDT)
Received: (nullmailer pid 22017 invoked by uid 1000);
 Mon, 20 Apr 2020 18:43:09 -0000
Date: Mon, 20 Apr 2020 13:43:09 -0500
From: Rob Herring <robh@kernel.org>
To: Louis Kuo <louis.kuo@mediatek.com>
Subject: Re: [RFC PATCH V6 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20200420184309.GA14720@bogus>
References: <20200410071723.19720-1-louis.kuo@mediatek.com>
 <20200410071723.19720-3-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410071723.19720-3-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_114315_625807_4D7C754A 
X-CRM114-Status: GOOD (  17.19  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 laurent.pinchart+renesas@ideasonboard.com, christie.yu@mediatek.com,
 srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com, tfiga@chromium.org,
 keiichiw@chromium.org, jungo.lin@mediatek.com, sj.huang@mediatek.com,
 yuzhao@chromium.org, hans.verkuil@cisco.com, zwisler@chromium.org,
 frederic.chen@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10, 2020 at 03:17:22PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.

checkpatch.pl reports some trailing WS.

> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.yaml       | 219 ++++++++++++++++++
>  1 file changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> new file mode 100644
> index 000000000000..c9e5776a2bd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> @@ -0,0 +1,219 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-seninf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek seninf MIPI-CSI2 host driver

Bindings aren't drivers.

> +
> +maintainers:
> +  - Louis Kuo <louis.kuo@mediatek.com>
> +
> +description: |
> +  Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support
> +  a widely adopted, simple, high-speed protocol primarily intended for
> +  point-to-point image and video transmission between cameras and host devices.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8183-seninf
> +
> +  reg:
> +    minItems: 2
> +    items:
> +      - description: The Seninf main register region
> +      - description: The RX register region
> +
> +  reg-names:
> +    minItems: 2

Drop, implied.

> +    items:
> +      - const: base
> +      - const: rx
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Seninf camsys clock
> +      - description: Seninf top mux clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_cam_seninf
> +      - const: clk_top_mux_seninf

Drop 'clk_' as it is redundant.

> +
> +  # See ./video-interfaces.txt for details
> +  ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties: 
> +      port@0:
> +        type: object
> +        description: connection point for sensor at port 0
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              remote-endpoint: true
> +
> +      port@1:
> +        type: object
> +        description: connection point for sensor at port 1
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              remote-endpoint: true
> +
> +      port@4:
> +        type: object
> +        description: connection point for camsys
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            const: 4
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@4
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +
> +    parent0: parent@0 {

bus {

> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        seninf: seninf@1a040000 {
> +            compatible = "mediatek,mt8183-seninf";
> +            reg = <0 0x1a040000 0 0x8000>,
> +                  <0 0x11c80000 0 0x6000>;
> +            reg-names = "base", "rx";
> +            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +            clocks = <&camsys CLK_CAM_SENINF>,
> +                <&topckgen CLK_TOP_MUX_SENINF>;
> +            clock-names = "clk_cam_seninf", "clk_top_mux_seninf";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    mipi_in_bcam: endpoint {
> +                        data-lanes = <0 1 3 4>;
> +                        remote-endpoint = <&bcam_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    mipi_in_fcam: endpoint {
> +                        data-lanes = <1>;
> +                        remote-endpoint = <&fcam_out>;
> +                    };
> +                };
> +
> +                port@4 {
> +                    reg = <4>;
> +
> +                    seninf_camisp_endpoint: endpoint {
> +                        remote-endpoint = <&camisp_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        i2c2: i2c@11009000 {

This will give a warning on 5.7-rc. Add a reg property.

> +            clock-frequency = <400000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            wcam: camera@36 {
> +                compatible = "ovti,ov5695";
> +                reg = <0x36>;
> +
> +                port {
> +                    bcam_out: endpoint {
> +                        remote-endpoint = <&mipi_in_bcam>;
> +                        data-lanes = <0 1 3 4>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        i2c4: i2c@11008000 {
> +            clock-frequency = <400000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            
> +            ucam: camera@3c {
> +                compatible = "ovti,ov2685";
> +                reg = <0x3c>;
> +
> +                port {
> +                    fcam_out: endpoint {
> +                        remote-endpoint = <&mipi_in_fcam>;
> +                        data-lanes = <1>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> \ No newline at end of file

Fix.

> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
