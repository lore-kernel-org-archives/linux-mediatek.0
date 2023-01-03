Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80658C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eQuzBlsYHsLGCB8bOG5IW6L2kvDsW6xtprRoZMICuU=; b=45aU0R91qkxf7xCbuZVtoBOGc/
	Z0d/DDFJZI72+NsYv1RZLFFfP8txHG5TNWiba7o7QlAgieYJe4UgdTEMxQZ6ORay7t48qAGo0KM4o
	1Z3ezclRmszRCfF8QALPXReio26XXt3QRl2Vkk8ovER3Zk5Op026imUXjTql4fuFsSsbI1lj4UiCL
	4E8PXvngCA1DwPpEwzdS2fbVxoMzLH0ERC+G+ahacYGY6636dw4nW/T9dbjn3ZL4yh2lRvhO3SY8i
	u46ZS84t21kGscnslf/DQB1RDa9mr7h+GiW9eiovpn/lS0P8/lOjKdg1gsY6tVuLxzWlAPXtlP6qF
	M2dBSNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcoT-000E8s-J8; Tue, 03 Jan 2023 08:38:25 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCciY-000BiE-8Y
	for linux-mediatek@lists.infradead.org; Tue, 03 Jan 2023 08:32:21 +0000
Received: by mail-lj1-x22a.google.com with SMTP id f20so31114369lja.4
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Jan 2023 00:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+eQuzBlsYHsLGCB8bOG5IW6L2kvDsW6xtprRoZMICuU=;
        b=tmr45XwFeEugin61Rnftw28ni6bHN0sEbHxVWVWq+J4OVvg/AlM1rrw+gIQUqGnU1Z
         JYyJFmdeo0DMfQ02tNVOkFPo6OEy+GJ1H6pTCbS0FoBxFa/0JNxZf9ZTy6an06BSniiI
         gIaQ8ozWSRcvyf+qVmdoASAjj6KmIK3dFVM6KqQahH3uiX7WinVX53Cu0fcU099v/1R0
         oYbWkHacnBUD+fxQ2Q6AVDc9FRZoYQ8or2dTrRm6Q/9lBeT3DRuVMijPCpVpxOKfFj1C
         QoKk5Zg67+jTD8ahyRydOHtrOIAhE0PjYHj+RZfr+xmh9YYQ0QVqyIeD2AzBRnSJfQle
         DwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+eQuzBlsYHsLGCB8bOG5IW6L2kvDsW6xtprRoZMICuU=;
        b=Q21MepiFFr/Ls7XF2g9Fg509wAdh8a/7JK3UJrzs84WH6ONejG3GUUOgUsSBl0nOHi
         /qY79rCm1A3IXPTi3exitknmSSGGiIp4IK1JKkkst4I1Va1e5f+NOtTzPLNV2Jl1igKT
         e0tzLt9B2fWsI4n6IIEspKiFO0ldqXg+7iFKXNytnpKWn8fYNjI17oXCoCEecW4785LK
         Yyz0bfCWBrCXtLf7Lf/BuSj7IUIVjI+dzUGSnr50q24ramWDgkax+f/iDhp/1F5lFPSL
         z4U8ekLtqFY1TA/oDchgKWtCGf73RZlPS59eaf8K078tXbidnQNC+tN6AGiAYLrZ2lI9
         KB4g==
X-Gm-Message-State: AFqh2krBtUNy1BizoQmc8Lq68EYhgn+7zitVLyox2me0nDD3f5Xd+lzO
	1lCqAlWBj+lwkFI1mF4ICKRRDw==
X-Google-Smtp-Source: AMrXdXsA9XjC9cfI2AczZE2h0DMdZ39MbWCjrc47B4sm8jNdTVX0eh4KTY7ZYYepdPoUjflQRgjQtg==
X-Received: by 2002:a2e:bd0c:0:b0:27f:aa2b:61da with SMTP id n12-20020a2ebd0c000000b0027faa2b61damr10160611ljq.14.1672734736218;
        Tue, 03 Jan 2023 00:32:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c20-20020a2ebf14000000b0027fffd54dadsm42145ljr.73.2023.01.03.00.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 00:32:15 -0800 (PST)
Message-ID: <85837957-f6d2-4722-7693-98c6cf932096@linaro.org>
Date: Tue, 3 Jan 2023 09:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103064615.5311-4-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_003218_463749_CB209690 
X-CRM114-Status: GOOD (  21.74  )
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

On 03/01/2023 07:46, Aradhya Bhatia wrote:
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
>  .../display/panel/panel-dual-lvds.yaml        | 157 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> new file mode 100644
> index 000000000000..88a7aa2410be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> @@ -0,0 +1,157 @@
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
> +  - $ref: /schemas/display/lvds.yaml/#

Drop trailing /

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - lincolntech,lcd185-101ct
> +              - microtips,13-101hieb0hf0-s
> +          - const: panel-dual-lvds
> +      - const: panel-dual-lvds

You cannot have this compatible alone.

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
> +              properties:
> +                dual-lvds-odd-pixels: true

That's not correct clause. It has no effect.

> +              required:
> +                - dual-lvds-odd-pixels
> +        then:
> +          properties:
> +            port@1:
> +              properties:
> +                dual-lvds-even-pixels: true
> +                dual-lvds-odd-pixels: false

Why do you need this? Your oneOf before already solves it.

> +
> +      - if:
> +          properties:
> +            port@0:
> +              properties:
> +                dual-lvds-even-pixels: true
> +              required:
> +                - dual-lvds-even-pixels
> +        then:
> +          properties:
> +            port@1:
> +              properties:
> +                dual-lvds-odd-pixels: true
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
> +  - |+

Drop +

> +    panel-dual-lvds {

Just "panel". Node names should be generic.

> +      compatible = "microtips,13-101hieb0hf0-s", "panel-dual-lvds";
> +
> +      width-mm = <217>;
> +      height-mm = <136>;
> +

Best regards,
Krzysztof


