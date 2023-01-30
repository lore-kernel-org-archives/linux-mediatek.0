Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828DAC54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ejf7vqAQxFeMcRz+b+ludPXWyayqJapmdG5pn46nsk=; b=qEsY8rMCfEVcPZf5hGfCfMGPyT
	88ZZrs2WIrtijufKFB4M5CgKVKOX14iaST9EgVyXziIO86cSQe00qu1qkx0LGCUwEu1u4Ga7ghRhO
	vLiX/LoayFBAvyrd/xAO5fZK1rq9UoonnaIrYBZ0M9wA1wpPhYB4oHXvFPio3gskYk9N3wVDSgM6r
	5tAOPDCwYnOvXpQQMtqMU4DX6dkpQDikaRB1ESaweHL2PDIpggIvN+/EIPq4+iIG4KcEwNwMkM6p4
	86YzUmhIKHuMNXrweTAUEwHys3fxoEEsrbH/2dIAz7PTgqUY9MmTIEWVXTf3HTHHOc958n0p6DvMu
	RDLLoxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXfh-004Pop-0i; Mon, 30 Jan 2023 17:10:21 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXaJ-004Myl-03; Mon, 30 Jan 2023 17:04:48 +0000
Received: by mail-ot1-f47.google.com with SMTP id e21-20020a9d5615000000b006884e5dce99so4697533oti.5;
        Mon, 30 Jan 2023 09:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ejf7vqAQxFeMcRz+b+ludPXWyayqJapmdG5pn46nsk=;
        b=zxus2zVZo1tINZ7z9QCLn08xrE0dIJ4EiY2BMPoi6A8hDFna9fibU40SU/T/Ilj2ro
         6qTa8XmY+2PT9N7HBZqBE+aMQrApc8jlxbjxfBXNhL0JY2xR1FoDjy7fLNfJ3SGMliuI
         Dmowo9Fsc1MrHYVX9548IXTm/AwgVZE5TtvVU7HXTf9+/rJ8k0W2Snk/mz6mW3qF/xJn
         C9OfW3qg05x06xKBo0WzStAShmnzFRXX5mPRZ3LDte0GKDZzvO9kgw88qUYOCEfGnpS6
         JzZpJsR+KT9hOy5ZxYaYf07PGS4dXOwrnL7i5vkoMmMWflDMzmBxqxBgLp+iTbsCtNTb
         aRfw==
X-Gm-Message-State: AO0yUKVqoGN//qq+PhllaLoxJGGy2OCVVuyBzFw+yPykQpLDVXLEW9wA
	31vUKVyEVYtQqORPNrK/fA==
X-Google-Smtp-Source: AK7set8w8/Wu9DKjsKGEnq+lsfo72FtdhgNl/pG9CyvPUTTpOD8gzinQeTtCr6QRjCiwKv9eYztbDQ==
X-Received: by 2002:a9d:6847:0:b0:68b:bca5:8dfa with SMTP id c7-20020a9d6847000000b0068bbca58dfamr4730987oto.28.1675098283123;
        Mon, 30 Jan 2023 09:04:43 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id df17-20020a056830479100b006884c42a38asm4066933otb.41.2023.01.30.09.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 09:04:42 -0800 (PST)
Received: (nullmailer pid 2814224 invoked by uid 1000);
	Mon, 30 Jan 2023 17:04:41 -0000
Date: Mon, 30 Jan 2023 11:04:41 -0600
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomi Valkeinen <tomba@kernel.org>, 
	Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Guo Ren <guoren@kernel.org>, DRI Development List <dri-devel@lists.freedesktop.org>, 
	Devicetree List <devicetree@vger.kernel.org>, 
	Linux Kernel List <linux-kernel@vger.kernel.org>, 
	Linux RISC-V List <linux-riscv@lists.infradead.org>, 
	Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, 
	Linux Mediatek List <linux-mediatek@lists.infradead.org>, 
	Linux C-SKY Arch List <linux-csky@vger.kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
Message-ID: <20230130170441.GA2796575-robh@kernel.org>
References: <20230124101238.4542-1-a-bhatia1@ti.com>
 <20230124101238.4542-4-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124101238.4542-4-a-bhatia1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_090447_064331_48F415E9 
X-CRM114-Status: GOOD (  25.97  )
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

On Tue, Jan 24, 2023 at 03:42:37PM +0530, Aradhya Bhatia wrote:
> Dual-link LVDS interfaces have 2 links, with even pixels traveling on
> one link, and odd pixels on the other. These panels are also generic in
> nature, with no documented constraints, much like their single-link
> counterparts, "panel-lvds".
> 
> Add a new compatible, "panel-dual-lvds", and a dt-binding document for
> these panels.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../display/panel/panel-dual-lvds.yaml        | 149 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> new file mode 100644
> index 000000000000..e2ce1768e9a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dual-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Dual-Link LVDS Display Panel
> +
> +maintainers:
> +  - Aradhya Bhatia <a-bhatia1@ti.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |
> +  A dual-LVDS interface is a dual-link connection with the even pixels
> +  traveling on one link, and the odd pixels traveling on the other.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lincolntech,lcd185-101ct
> +          - microtips,mf-101hiebcaf0
> +      - const: panel-dual-lvds

Why do we need a new compatible? You have ports and properties to see if 
the panel is dual link.

We already have dual link LVDS supported in advantech,idk-2121wr.yaml 
which says is compatible with 'panel-lvds', so that decision has already 
been made. The hint was you added the compatible match to the driver 
with 0 other changes needed.

That schema is missing type definitions and constraints for 
dual-lvds-odd-pixels/dual-lvds-even-pixels so there does need to be some 
changes to add those.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The sink for first set of LVDS pixels.
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]
> +          - required: [dual-lvds-even-pixels]
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The sink for second set of LVDS pixels.
> +
> +        properties:
> +          dual-lvds-even-pixels:
> +            type: boolean
> +
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +
> +        oneOf:
> +          - required: [dual-lvds-even-pixels]
> +          - required: [dual-lvds-odd-pixels]
> +
> +    allOf:
> +      - if:
> +          properties:
> +            port@0:
> +              required:
> +                - dual-lvds-odd-pixels
> +        then:
> +          properties:
> +            port@1:
> +              properties:
> +                dual-lvds-odd-pixels: false
> +
> +      - if:
> +          properties:
> +            port@0:
> +              required:
> +                - dual-lvds-even-pixels
> +        then:
> +          properties:
> +            port@1:
> +              properties:
> +                dual-lvds-even-pixels: false
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  port: false
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - width-mm
> +  - height-mm
> +  - data-mapping
> +  - panel-timing
> +  - ports
> +
> +examples:
> +  - |
> +    panel {
> +      compatible = "microtips,mf-101hiebcaf0", "panel-dual-lvds";
> +
> +      width-mm = <217>;
> +      height-mm = <136>;
> +
> +      data-mapping = "vesa-24";
> +
> +      panel-timing {
> +        clock-frequency = <150275000>;
> +        hactive = <1920>;
> +        vactive = <1200>;
> +        hfront-porch = <32>;
> +        hsync-len = <52>;
> +        hback-porch = <24>;
> +        vfront-porch = <24>;
> +        vsync-len = <8>;
> +        vback-porch = <3>;
> +        de-active = <1>;
> +      };
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          dual-lvds-odd-pixels;
> +          lcd_in0: endpoint {
> +            remote-endpoint = <&oldi_out0>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          dual-lvds-even-pixels;
> +          lcd_in1: endpoint {
> +            remote-endpoint = <&oldi_out1>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5e18388b4579..6025bb024586 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6461,6 +6461,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  S:	Maintained
>  F:	drivers/gpu/drm/panel/panel-lvds.c
>  F:	Documentation/devicetree/bindings/display/lvds.yaml
> +F:	Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>  F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>  
>  DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
> -- 
> 2.39.0
> 

