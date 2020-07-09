Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF94BC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 17:04:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B1982078B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 17:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GL4DhIxh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B1982078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2KrNaRVb+wNGst4QV7YscpXClhM2MhbfIndX8GWlvAg=; b=GL4DhIxhr18PtQD3u1fQN3XRR
	ghoPfZx9RkjzDWYzbHnnrJf1+SDYTjPHSu9MnnO48bvnYJOfTLIBxDJxmDe1HVf2i1sJOvAVa5pBT
	Stp/6O3swxN5C4Pzd/HcvMur+OZMz2CnxR1uyPOC03cBulQL5zFWzghLU6BaYhMfjQiRdRSz/YgQM
	qsrFQt+Vxg/FHdYk+fx3Misa2Ti0zGkkVGmxWOsIcak6f6XbJxwY94km/7lbii5HkCpx8+ZZVpFsd
	wxtjqAWq9TKgbA8YQVyklGeb+1F0Yw+b1kBTwKsX1zabxHTLpMFL5ixa1yBPR0FPdZCHp/XN0H6Bp
	zFZ5iC5UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtZxr-0001o4-2C; Thu, 09 Jul 2020 17:04:03 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtZxn-0001mv-Sg; Thu, 09 Jul 2020 17:04:01 +0000
Received: by mail-il1-f194.google.com with SMTP id q3so2629501ilt.8;
 Thu, 09 Jul 2020 10:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pkrDLfGLudjLQj1h2RUgdB9tGJKsaJLadQNww1tytnA=;
 b=CR4xJSHv4dHteFHbjvEmUd8e0usxrpO3VqcxRD7CpOsXkvI2OoWtfZhfE/AxujmD1d
 nY2u9SuaNbmN6Xg32660/higEqSFI62hLRuRDWzvBmtMR/KzWJwxCNfw2BBRWJwWT2+y
 jUSu0WsMTIgvCy8YJmzsNVxVqkivZssVY5YgtHAInzSMgVA7EkzthNUQ5P0FkGrAxnrX
 f96bOs0d/K+E6Gqw3jaMkUaG46DYNNoLGaMg+06pGazuBiODvxyYNZgm7ber4qmF0+PN
 Zvf/2vQ9qXAW/zq8IXAn9Kn3aSp7tGqYzRbC/6o1YAnV6XRVShTlDm0CtlllaiNB/QeS
 zgAQ==
X-Gm-Message-State: AOAM530EmOMdm5P+hk8hMfPhTxt6xvhh2qMaacJISi9EXQavDafpm71Q
 lA4RgzC731sFrQu7GLW3Pxo1k9+WWA==
X-Google-Smtp-Source: ABdhPJxHycLVJ2nL1OWPoCsazDiCpUpx+FrNGz77p+igr770N6ywBBhW5XwbHwq/C1hofPtyA4Xj0g==
X-Received: by 2002:a92:5a56:: with SMTP id o83mr48108659ilb.71.1594314238900; 
 Thu, 09 Jul 2020 10:03:58 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id h84sm2540067iof.31.2020.07.09.10.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 10:03:58 -0700 (PDT)
Received: (nullmailer pid 522839 invoked by uid 1000);
 Thu, 09 Jul 2020 17:03:56 -0000
Date: Thu, 9 Jul 2020 11:03:56 -0600
From: Rob Herring <robh@kernel.org>
To: Louis Kuo <louis.kuo@mediatek.com>
Subject: Re: [RFC PATCH V7 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20200709170356.GB519166@bogus>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-3-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708104023.3225-3-louis.kuo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_130400_136411_183571B7 
X-CRM114-Status: GOOD (  17.45  )
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

On Wed, Jul 08, 2020 at 06:40:22PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.yaml       | 223 ++++++++++++++++++
>  1 file changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> new file mode 100644
> index 000000000000..917b393acc0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> @@ -0,0 +1,223 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)

Not the right choice:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-seninf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Sensor Interface (CSI) Device Tree Bindings
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
> +    minItems: 1
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
> +      - const: cam_seninf
> +      - const: top_mux_seninf
> +
> +  phys:
> +    items:
> +      - description: Seninf mipi dphy
> +
> +  phy-names:
> +    items:
> +      - const: seninf
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
> +    parent {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        seninf: seninf@1a040000 {
> +            compatible = "mediatek,mt8183-seninf";
> +            reg = <0 0x1a040000 0 0x8000>;
> +            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +            clocks = <&camsys CLK_CAM_SENINF>,
> +                <&topckgen CLK_TOP_MUX_SENINF>;
> +            clock-names = "cam_seninf", "top_mux_seninf";
> +            phys = <&mipi_dphy 0>;
> +            phy-names = "seninf";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mipi_in_bcam: endpoint {
> +                        data-lanes = <0 1 3 4>;
> +                        remote-endpoint = <&bcam_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mipi_in_fcam: endpoint {
> +                        data-lanes = <1>;
> +                        remote-endpoint = <&fcam_out>;
> +                    };
> +                };
> +
> +                port@4 {
> +                    reg = <4>;
> +                    seninf_camisp_endpoint: endpoint {
> +                        remote-endpoint = <&camisp_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        mipi_dphy: mipi_dphy@11c80000 {

phy@...

> +            compatible = "mediatek,mt8183-mipi_dphy";
> +            reg = <0 0x11C80000 0 0x6000>;
> +            #phy-cells = <1>;
> +        };
> +
> +        i2c2: i2c@11009000 {
> +            reg = <0 0x11009000 0 0x1000>;
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
> +            reg = <0 0x11008000 0 0x1000>;
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
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
