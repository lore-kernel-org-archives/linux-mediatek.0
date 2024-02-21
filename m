Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1573BC48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBNt5mBouMup7TvH0VKGOarNbwSfPK+5cPhFazcNHCw=; b=AqFmaXOhIYPi//Pj+oCnyG4mGG
	aaAe9fP9OlrnXOqBprqM3AtoECOE2NA09QsAO+4Y0mMRNp+uKvzKDP6ZNiJnjPJROiot0DjHjs5ZU
	dM7u8tY96FpmCVJI5qq1Eg/JWM9m/uBbI9GZdZcRekUCREI2f2fhCOQnAATZWueHW0FHknLWj9lay
	wyRoRjfdjjSaeXGXQBS/EPyWMYOi/2o5AOCpkV/Uw3Z8VzZnh5tPr0pJ1g+ODn+vTfanoJpOmUlg1
	1vHp2OhvGB9ZWjz7Enx8B7sibnAc2D9KcyFLaGxY7F4eBQivzlA+RRzv9ltpqXB6Q4cvAXolfktKJ
	zkYcRK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnEe-00000001C7I-2GMw;
	Wed, 21 Feb 2024 14:06:08 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnEb-00000001C5K-0wWj
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Feb 2024 14:06:07 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-60853ad17f9so29113297b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 06:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708524363; x=1709129163; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bBNt5mBouMup7TvH0VKGOarNbwSfPK+5cPhFazcNHCw=;
        b=S8pfmniV3KAhY37hdz9EReCRbTFDSirogjK7OUfNmIpE9dIga4nIRGfOKdw67Z+AfH
         txDIWcqCjGkj+WVl9C358bSOXqiGIbFfswNX+04OsN1+9WuDzTTlslkfMk87lo6eSpUj
         elTEyEySp36QObR1HzXaf15vdGBlI1jC9mi9R/TrVuwkrsvJ5c7UqycxWTrmOL1rdGNM
         J/k6wjYus6hK9kxPY2vA44M4U0t4dy4iLzkxIAdfDqRCnTV8PCashWdUXHfzU7cqg6Ja
         bXpW/qx7SrGlSuROYmMlHOPK0AsaqbdaHsV/gRKWFdKGlxvBxIje11pt+tVkLpJA1xV2
         TZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708524363; x=1709129163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBNt5mBouMup7TvH0VKGOarNbwSfPK+5cPhFazcNHCw=;
        b=AtYB32IO2i7p2Mt8Cg7SuDnq0zmt6H+NU0IAP5XD53zjO90XMCIGUOejq8pzi4nk/z
         RfMZ6alWBvE0sORb2LeyQ7DVCsKksN6PnuNqbriWTb0QcM4Kd8f5Zicqv+3CvgYRN3W2
         n0101y/IC42n8njKNKo8OYzN9P8I5oWgutWj2Dq23730kgeQdWrXhvUdagts1g9erPVy
         OGG7XQWLnXWQFhp4dXAZR3+Hdjdda/1DqTF25jXXGZHOSbUyo/iZ2SuZSQQJuGr9+kR8
         PTUqpzqg8Tukn/Zg3R895K1ImXAVXn8qhy2QsD7TKpKfj0OPeAlB80E309rpE5WE1KHO
         8i7g==
X-Forwarded-Encrypted: i=1; AJvYcCUJEWEjWP/6r1x+VLlIDa7ah2pvGrTh2xtwNfZUBWlSzVrNT00XP0Vqxh3phBdJDM4IO8sgvOEwr6co+bhgNVpzwiMecfd3YQohUqnxTqqzcPMl
X-Gm-Message-State: AOJu0YxjVG/jMWs/B+NavE4R8dugT42F873Ri0GTz2VwrEdx7u0Xg6ff
	pDna+AsWEieIoAeWAhNBOfrckJZPEkMxTyHrtgM/amJrDxlITAM+hI9RRoNeb+WYYHXimpTOW/I
	bDoUEVqSVW4K8pZRYVZEd3SR3ft4G7/6xXIKcHQ==
X-Google-Smtp-Source: AGHT+IHuXw4PJBIXZfuHh5gCNjMNTK/lLlsjTtlp+aEYUcD1kRLLumSXWcRF6pZKzf0+upCxVbz0lh9xD4Nk6MROwQg=
X-Received: by 2002:a81:9a50:0:b0:607:d9f7:e4fc with SMTP id
 r77-20020a819a50000000b00607d9f7e4fcmr13053315ywg.5.1708524363650; Wed, 21
 Feb 2024 06:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org> <20240221-spmi-multi-master-support-v5-1-3255ca413a0b@linaro.org>
In-Reply-To: <20240221-spmi-multi-master-support-v5-1-3255ca413a0b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 16:05:51 +0200
Message-ID: <CAA8EJposY0uf2S98VoOr5pOhJq9_i15mVSiEFP_r4jk+rPB0Ow@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: spmi: Add PMIC ARB v7 schema
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_060605_297708_56F5B369 
X-CRM114-Status: GOOD (  19.24  )
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

On Wed, 21 Feb 2024 at 14:52, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add dedicated schema for PMIC ARB v7 as it allows multiple
> buses by declaring them as child nodes. These child nodes
> will follow the generic spmi bus bindings.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../bindings/spmi/qcom,spmi-pmic-arb-v7.yaml       | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml
> new file mode 100644
> index 000000000000..8a93d2145aa5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb-v7.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI Controller v7 (PMIC Arbiter)
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +
> +description: |
> +  The SPMI PMIC Arbiter v7 is found on Snapdragon chipsets. It is an SPMI
> +  controller with wrapping arbitration logic to allow for multiple on-chip
> +  devices to control up to 2 SPMI separate buses.
> +
> +  The PMIC Arbiter can also act as an interrupt controller, providing interrupts
> +  to slave devices.
> +
> +properties:
> +  compatible:
> +    const: qcom,spmi-pmic-arb-v7
> +
> +  reg:
> +    items:
> +      - description: core registers
> +      - description: tx-channel per virtual slave regosters
> +      - description: rx-channel (called observer) per virtual slave registers
> +
> +  reg-names:
> +    items:
> +      - const: core
> +      - const: chnls
> +      - const: obsrvr
> +
> +  ranges: true
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  qcom,ee:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 5
> +    description: >
> +      indicates the active Execution Environment identifier
> +
> +  qcom,channel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 5
> +    description: >
> +      which of the PMIC Arb provided channels to use for accesses
> +
> +patternProperties:
> +  "spmi@[0-1]$":
> +    type: object
> +    $ref: /schemas/spmi/spmi.yaml
> +
> +required:
> +  - compatible
> +  - reg-names
> +  - qcom,ee
> +  - qcom,channel
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spmi: arbiter@c400000 {
> +      compatible = "qcom,spmi-pmic-arb-v7";
> +      reg = <0x0c400000 0x3000>,
> +            <0x0c500000 0x4000000>,
> +            <0x0c440000 0x80000>;
> +      reg-names = "core", "chnls", "obsrvr";
> +
> +      qcom,ee = <0>;
> +      qcom,channel = <0>;
> +
> +      #address-cells = <2>;
> +      #size-cells = <2>;

Shouldn't there be an empty 'ranges;' property?

> +
> +      spmi_bus0: spmi@0 {
> +        reg = <0 0x0c42d000 0 0x4000>,
> +              <0 0x0c4c0000 0 0x10000>;

Shouldn't the node address  (@0, @1) match the first address from reg property?

> +        reg-names = "cnfg", "intr";
> +
> +        interrupt-names = "periph_irq";
> +        interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <4>;
> +
> +        qcom,bus-id = <0>;

I thought the goal was to drop qcom,bus-id ?

> +
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +      };
> +
> +      spmi_bus1: spmi@1 {
> +        reg = <0 0x0c432000 0 0x4000>,
> +              <0 0x0c4d0000 0 0x10000>;
> +        reg-names = "cnfg", "intr";
> +
> +        interrupt-names = "periph_irq";
> +        interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <4>;
> +
> +        qcom,bus-id = <1>;
> +
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +      };
> +    };
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

