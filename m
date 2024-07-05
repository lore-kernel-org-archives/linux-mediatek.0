Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCB8C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 07:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCVjbUVohH3p2wf5gVftnpB2o8+RU21ET/afoPI30m8=; b=OIVvl1kjPLJl0smhbKIae79pnO
	ZNkXWSXAcZsaFzcr9ygy+fzQw/YlpWVmH0EHF4lTrk85jPjWA0Wjbl4r6czsoA8ktoouH65AdIRVk
	D2nSieX6l0LQQcLsyc64tKVJTqIlmQLwl7grN92veerIRBmSkv6sqoAQc5r8KwB454xntzt8G05S3
	1KeCHzMlBg6TBiZxgKpWnsPSZkCyjYIsgr8sv3hOm3wo5lJGf0yk/sRwMFXAqkD1wl7C1tE7ENqnL
	ZblDcGuPhG4bfLrYkRo6IGGzkrP7QYE2eTVSZMBTFxLezdyQBHdQkkw+3O2SgQ857j3Tdufg5Y8tO
	w1yGfIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPdiv-0000000FC0z-07p5;
	Fri, 05 Jul 2024 07:51:17 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPdiq-0000000FByr-3nlL
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 07:51:15 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a77baa87743so149134466b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720165871; x=1720770671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCVjbUVohH3p2wf5gVftnpB2o8+RU21ET/afoPI30m8=;
        b=Uil6AGPE7Pm8JsHE9lswRRyvMyO8LbXbjSQ92ex/fXb1w4GveJI+QZktbdLKgGXENp
         v4vC1W3WtJ9c4rN7l48H6UJOolFrUdZ50c7sAXSR/UOUVml5EA+STiyiXAMtTW8GTIw2
         ROobzC75eo7a/GB8WRmq/7Fb6o3pc9DQ1CiVZkpBYszdxP4Q+65YmYR8T79bcOEGhHC3
         lwQE1Qpt9qsrm5h+G8oH9QO49E3e+QeYH7RwDFekhmgPaKXbYA9oY38As04gOVgGUL88
         X+ibYizF0c0j5CeG78Vs/l3+kMhHVOk0ApHKFffO3ChcYO38HMxx2jr8gPVsbRc7HJsA
         fjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165871; x=1720770671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCVjbUVohH3p2wf5gVftnpB2o8+RU21ET/afoPI30m8=;
        b=KpQQSGAYWyWmzGt5HXXejGuR47otTEJ0ghraMp1M0Zw/g9Gqrz7SqQnGPAlByksw1d
         l7UWO++P5PmiXO+xFuWMQX1U92uqyJqeGyRrUTrfPRcxsAMigkdSPrJj2jxtONmwgiFB
         vdp8ktg660wtol1APmAxL/kwFhm92jjwzQWYNErHj0YVTwXFzF/cj1ETX23WxayvriPI
         iU+y3yX9SEILR9KO0apyCCPi8VIDMQAq4WZAzhqfDyBVj3G6EM3Q6lXK63SFs0apFtaB
         LbM0BHtp8N1FH2V4En4y09dSraffZsye2bOfnR7UI/y1bKH5a8hIc3aNngDvnQPM8aRj
         zZAA==
X-Forwarded-Encrypted: i=1; AJvYcCVz4lmfjVggwjSbOY+wvRyOiyEqKul3pOkEzMOCj/UF1heXmhFakctqx2uAx8i9Hqogt9JswANkIVPKTQiOx1UNO8rMgkFJmbr4Jt3G4kVqVCZI
X-Gm-Message-State: AOJu0YyJMJAD9E1xAPi80H9esPmotqwn2Z92xHlhOrWfRsO8Moy/0LC7
	g3KwueUkYv7LyXfvcIg2P5pWLtAa1+/FPjpJam+kHjEyAqclFiRlSogwLjzAXlk3hOK9GQOa5c/
	ICGlWjptn/ScAN6nMs14GrB6veV+FSICcUYdhfQ==
X-Google-Smtp-Source: AGHT+IGiaxqLW45+/BQEWvALCzSarefavKbKnT7hrlfo4M8H4kt8dKuBoLog/WCakFxhFLqIDWrDmp7QDFKEUN7e2xw=
X-Received: by 2002:a17:906:40d0:b0:a70:c02f:8a7e with SMTP id
 a640c23a62f3a-a77ba70c75dmr276948066b.54.1720165870596; Fri, 05 Jul 2024
 00:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-1-bfccccc5ec21@baylibre.com> <20240704-catcall-stubbly-9258b056e42e@spud>
In-Reply-To: <20240704-catcall-stubbly-9258b056e42e@spud>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 5 Jul 2024 09:50:59 +0200
Message-ID: <CAEHHSvb6Y8g_KCmu0bK__EP2TyPhf8i-ctMNfOGdyMUUGoKQVw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: media: add mediatek ISP3.0 sensor interface
To: Conor Dooley <conor@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_005113_202838_ABC69381 
X-CRM114-Status: GOOD (  29.60  )
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

Le jeu. 4 juil. 2024 =C3=A0 18:27, Conor Dooley <conor@kernel.org> a =C3=A9=
crit :
>
> On Thu, Jul 04, 2024 at 03:36:40PM +0200, Julien Stephan wrote:
> > From: Louis Kuo <louis.kuo@mediatek.com>
> >
> > This adds the bindings, for the mediatek ISP3.0 SENINF module embedded =
in
> > some Mediatek SoC, such as the mt8365
> >
> > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> > Link: https://lore.kernel.org/r/20230807094940.329165-2-jstephan@baylib=
re.com
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>
> I'm really confused by the link tag here. At first glance this looked
> like you were sending out something that had been applied by Laurent,
> given the Link, Rb and SoB from him. Why does he have a SoB on this
> patch? What did Phi-Bang Nguyen do with this patch, and should they have
> a Co-developed-by tag?

Hi Conor,

I was not using b4 for the previous revisions of this series, so maybe
I messed something up here :(

About Phi-Bang, this series has been in our internal tree for a long
time, and Phi-Bang has his SoB on it, so I kept it.

About Laurent's tags, they were already on v4. But maybe it was an
error ? Should I remove them?

>
> > ---
> >  .../bindings/media/mediatek,mt8365-seninf.yaml     | 275 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 282 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-se=
ninf.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.=
yaml
> > new file mode 100644
> > index 000000000000..aeabea9f956a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.ya=
ml
> > @@ -0,0 +1,275 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2023 MediaTek, BayLibre
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Sensor Interface 3.0
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +  - Julien Stephan <jstephan@baylibre.com>
> > +  - Andy Hsieh <andy.hsieh@mediatek.com>
> > +
> > +description:
> > +  The ISP3.0 SENINF is the CSI-2 and parallel camera sensor interface =
found in
> > +  multiple MediaTek SoCs. It can support up to three physical CSI-2 in=
put ports,
> > +  configured in DPHY (2 or 4 data lanes) or CPHY depending on the SoC.
> > +  On the output side, SENINF can be connected either to CAMSV instance=
 or
> > +  to the internal ISP. CAMSV is used to bypass the internal ISP proces=
sing
> > +  in order to connect either an external ISP, or a sensor (RAW, YUV).
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8365-seninf
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Seninf camsys clock
> > +      - description: Seninf top mux clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: camsys
> > +      - const: top_mux
> > +
> > +  phys: true
> > +
> > +  phy-names: true
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI0 or CSI0A port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI1 port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI2 port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI0B port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 2
> > +
> > +      port@4:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for cam0
> > +
> > +      port@5:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for cam1
> > +
> > +      port@6:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv0
> > +
> > +      port@7:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv1
> > +
> > +      port@8:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv2
> > +
> > +      port@9:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv3
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +      - port@2
> > +      - port@3
> > +      - port@4
> > +      - port@5
> > +      - port@6
> > +      - port@7
> > +      - port@8
> > +      - port@9
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: mediatek,mt8365-seninf
>
> The binding supports only a single compatible, why is this complexity
> required? I don't see other devices being added in this series.

Right. The idea is that the number of PHYs depends on the SoC. In the
previous revision of the series,
the number of PHYs was not fixed, and Krzysztof asked me to fix it by
SoC. So I wanted to make it clear
that the number of PHYs depends on SoC but maybe I don't need that
complexity for that?

Is something like the following enough? And if complexity is added
later if some other SoC are added?
    phys:
      minItems: 2
      maxItems: 2
      description:
        phandle to the PHYs connected to CSI0/A, CSI1, CSI0B

    phy-names:
      description:
        list of PHYs names
      minItems: 2
      maxItems: 2
      items:
        type: string
        enum:
          - csi0
          - csi1
          - csi0b
      uniqueItems: true

Cheers
Julien

>
> Cheers,
> Conor.
>
> > +then:
> > +  properties:
> > +    phys:
> > +      minItems: 2
> > +      maxItems: 2
> > +      description:
> > +        phandle to the PHYs connected to CSI0/A, CSI1, CSI0B
> > +
> > +    phy-names:
> > +      description:
> > +        list of PHYs names
> > +      minItems: 2
> > +      maxItems: 2
> > +      items:
> > +        type: string
> > +        enum:
> > +          - csi0
> > +          - csi1
> > +          - csi0b
> > +      uniqueItems: true

