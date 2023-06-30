Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C80EB64D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xcro6lh1zv5j2U+liXdEyfLACiand4vz4NRvXzPPcM=; b=jfjfMMq1z3xE+R9pdOJq8gjHoP
	oeUSCo4QUy0Xk3dcxu/bzDSHVXPneR3/8rlvysFq69DUFW4K0jfgI1HI5gHyfgCW3obCqMA6L/b78
	kAj23w/TJ75MKTHFLpilv2jAn+muuLsjCoDb7642yfysZfB6nFtzbEsdBgW1dmhM2t9zuRPkcqrT2
	TqGLG5Jv96I3JbQw4/pJJOaTY0bGbe6gReVU8Rgc2qOJGpKhna56wYR/dadihzYX0go7k8eAp+0fb
	EvOCm1kwSywDiCKdiVOqj7DFze2pZnT2rIbixoaoeieGfWjrPopFsWzXdBdczBl8x/JapYiLmKrqK
	jagqfL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFFBC-003qzP-2A;
	Fri, 30 Jun 2023 14:32:58 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFFB8-003qyU-3C;
	Fri, 30 Jun 2023 14:32:56 +0000
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-783546553ddso81553139f.0;
        Fri, 30 Jun 2023 07:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688135572; x=1690727572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xcro6lh1zv5j2U+liXdEyfLACiand4vz4NRvXzPPcM=;
        b=WJFT80wVuvzvMWxGfLTq5cCTyzPfBhQmTzktgtG7Fde00zo0CcDZ5QpHARMz7rRwdZ
         ZSym9XkuEkGFVATMARPXl8mMCiXQtvt5ZC9ovDnvmAIKga8Js0TvFT5bUrkvBpcmmWJ5
         2c+t1ZNz6+d+YE3vHdB0MwQ4L92prLHOso8sgDXgkd1XFHYBoUy9koL0Lpbj/+Krg7PQ
         uigXfksxlGmc8MBKHkDm2VrtAjSALlpngnsi6qam75gF1k9FBc93+MxML2EswoqfZoXR
         7gkP2ou1F2Hrrs2Ice5fJoM4KFGldWAI7mr4svcr51fWKm8M27cOHhfJ12hqrX+e8SML
         cyaA==
X-Gm-Message-State: AC+VfDz7kf8MaUM4co+KqBAhcIYZS2AHNA1xqNpcC85JvYkWieSYc0Ob
	gKAVD6ncjV9uJSoja1sOaA==
X-Google-Smtp-Source: ACHHUZ4CO3N+D+JrbADad/wGz5LejFXrB56H9kCxA+ypCwGJ48L6wJJ4Gp0NV6WG4i6r00M9ecvKbQ==
X-Received: by 2002:a5e:8901:0:b0:783:6455:cc9c with SMTP id k1-20020a5e8901000000b007836455cc9cmr3261459ioj.3.1688135571670;
        Fri, 30 Jun 2023 07:32:51 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l7-20020a6b7007000000b0077e40979b41sm2159576ioc.45.2023.06.30.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 07:32:50 -0700 (PDT)
Received: (nullmailer pid 1430732 invoked by uid 1000);
	Fri, 30 Jun 2023 14:32:48 -0000
Date: Fri, 30 Jun 2023 08:32:48 -0600
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, devicetree@vger.kernel.org, Florian Sylvestre <fsylvestre@baylibre.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20230630143248.GA1425958-robh@kernel.org>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-2-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630100321.1951138-2-jstephan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_073255_048521_86644FEB 
X-CRM114-Status: GOOD (  21.36  )
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

On Fri, Jun 30, 2023 at 12:01:50PM +0200, Julien Stephan wrote:
> From: Louis Kuo <louis.kuo@mediatek.com>
> 
> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../media/mediatek,mt8365-seninf.yaml         | 295 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> new file mode 100644
> index 000000000000..1697e94853f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> @@ -0,0 +1,295 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek, BayLibre
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Sensor Interface 3.0
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description:
> +  The ISP3.0 SENINF is the CSI-2 and parallel camera sensor interface found in
> +  multiple MediaTek SoCs. It can support up to three physical CSI-2
> +  input ports, configured in DPHY (2 or 4 data lanes) or CPHY depending on the SoC.
> +  On the output side, SENINF can be connected either to CAMSV instance or
> +  to the internal ISP. CAMSV is used to transfer the sensor data (Raw, YUV)
> +  to DRAM directly, without internal ISP processing.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-seninf
> +
> +  reg:
> +    maxItems: 1
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
> +      - const: camsys
> +      - const: top_mux
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      phandle to the PHYs connected to CSI0/A, CSI1, CSI2 and CSI0B
> +
> +  phy-names:
> +    minItems: 1
> +    items:
> +      - const: csi0
> +      - const: csi1
> +      - const: csi2
> +      - const: csi0b
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI0 or CSI0A port
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI1 port
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI2 port
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI0B port
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 2
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

/schemas/graph.yaml#/properties/port

> +        unevaluatedProperties: false

Drop

> +        description: connection point for cam0
> +
> +        properties:

Drop all this. Don't need to define endpoint as 
/schemas/graph.yaml#/properties/port already does.

Same on other ports.

> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false


