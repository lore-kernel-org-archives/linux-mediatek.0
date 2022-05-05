Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C20C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lk/yZLqccSwxU4merZm009mCL/pannqRMxO4Dsfk+Ns=; b=ql1A15e2+0QLO7
	awG2m23A8iWOQa2qvI+WkTe23kH3zSvDF8k4n6NFbL7PHdXex5zCm+w345+7GesS4nioxZRkWnzP1
	Fu7I1x8RnMf/cUNb9VXmU3ER3mTxZp1agWeLrovqHGIBavhNcuiX5MyCePfscUQ/Jqbyn81P+jBiD
	01zP5wSb0AVn1TzPQukmxzPxma65wt8Hm4Ce0t0/fKe0oJPLAaW85caHWj/QyQFCbt2Trli8i3jOW
	47RWunRq+Raeitobgof/FPoiRT0IebfGKG0NGNGzrYtSQlpAukq+GitbJYZGVMtCzcIK6KP56rwSI
	YqcWT0yLinFOTkNrCKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmi6Z-000Brm-2t; Thu, 05 May 2022 20:29:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmi6O-000Bnm-Rb
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 20:29:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso4482563wmq.0
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Nhiu0fngZGCp2SeeUlWWgcjMH+09fel050MQuuk+CH0=;
 b=c1oSeU4BaXTY3ReYOr/uFAyO9izBH2dG1Qlnf+8Hr8Uw3vUsoKOHenuz7wpGz1G3lv
 ym40wpjP1R1uTQtgYd8gikEnTIRqUlXoWrvkAnzPHg8AGFpeocUHG2kgkwMQX9NL3etq
 +mxfkjnSDJDdW3HnR8hp/i6C1WPmJXk+LFZvFqsi3IRZIzWwmnN90bnnpRzXLIKPG6Zc
 eHtIJrBosNasWd3p+NDNF3vx4pBQ+ez3FTfArfU5wI/onzupOfKc35+xFiIfqWc6qqRh
 q7Ut2jUxdfhmab/DvgF8OIAbxIYnzwpEPb49AiYU/N0TsdomVI/zvfwD+IaQxuFI+dnI
 g5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nhiu0fngZGCp2SeeUlWWgcjMH+09fel050MQuuk+CH0=;
 b=Sd3VHXmqrPLrGdxwfIEDNthDb0aUgYy41wc/THwULp4wcq7sHEY5as1uedLmOJ1n23
 hIVbYRQAOVs5UbNuotEDOuFAhXhyB6IGLgvVf0gUH2lJdwPizW++qo6YBlilB/jiBoVR
 zvBHT/ySKvPtKxJ2RTPqo7VZNQlXfFSwnzIzWZQp51ldj+k2VqYX2l3QCHhW+cDZFRsY
 jAv6D3ewn84Xj/Iw1kH4sfU+wIbKpe7yPTY/2CE26NWwfX4fRpWCJntWF/ykNSx5YHGS
 /p4iLnuDH51HgBJE3eeeh+gDSqbhy4CjEhpP/n4vP/8e8ZqzZ5K5Fn3NEzKktDP7uq/q
 FWBQ==
X-Gm-Message-State: AOAM532anptRCLnuXsAkDawbUSpc0zIzm38oIn0Hqrz5+oWKNA1MjXJ5
 HwkSUTnRXyeaHpoMdLHx2Lda4Q==
X-Google-Smtp-Source: ABdhPJyTndqxOkEr/uFOGU4QF0R1aF80DfUbLWNbePR/UUOLh1w33usRsZPRT7oIn/7Jas5VFkmrmQ==
X-Received: by 2002:a7b:cd15:0:b0:394:497d:ad1c with SMTP id
 f21-20020a7bcd15000000b00394497dad1cmr35505wmj.182.1651782570542; 
 Thu, 05 May 2022 13:29:30 -0700 (PDT)
Received: from [192.168.0.222] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n13-20020a056000170d00b0020c5253d911sm2035574wrc.93.2022.05.05.13.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:29:30 -0700 (PDT)
Message-ID: <6d45f060-85e6-f3ff-ef00-6c68a2ada7a1@linaro.org>
Date: Thu, 5 May 2022 22:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC v2] dt-bindings: net: dsa: convert binding for mediatek
 switches
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20220505150008.126627-1-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220505150008.126627-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_132932_923129_F2862E79 
X-CRM114-Status: GOOD (  17.12  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 Greg Ungerer <gerg@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 05/05/2022 17:00, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Convert txt binding to yaml binding for Mediatek switches.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Thank you for your patch. There is something to discuss/improve.

> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  core-supply:
> +    description: |

Drop | everywhere where it is not needed (so in all places, AFAICT)

> +      Phandle to the regulator node necessary for the core power.
> +
> +  "#gpio-cells":
> +    description: |
> +      Must be 2 if gpio-controller is defined.

Skip description, it's obvious from the GPIO controller schema.

> +    const: 2
> +
> +  gpio-controller:
> +    type: boolean
> +    description: |
> +      if defined, MT7530's LED controller will run on GPIO mode.
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  interrupt-controller:
> +    type: boolean
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  io-supply:
> +    description: |
> +      Phandle to the regulator node necessary for the I/O power.
> +      See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> +      for details for the regulator setup on these boards.
> +
> +  mediatek,mcm:
> +    type: boolean
> +    description: |
> +      if defined, indicates that either MT7530 is the part on multi-chip
> +      module belong to MT7623A has or the remotely standalone chip as the
> +      function MT7623N reference board provided for.
> +
> +  reset-gpios:
> +    description: |
> +      Should be a gpio specifier for a reset line.

Skip description.

> +    maxItems: 1
> +
> +  reset-names:
> +    description: |
> +      Should be set to "mcm".

Skip description.

> +    const: mcm
> +
> +  resets:
> +    description: |
> +      Phandle pointing to the system reset controller with line index for
> +      the ethsys.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: "dsa.yaml#"
> +  - if:
> +      required:
> +        - mediatek,mcm
> +    then:
> +      required:
> +        - resets
> +        - reset-names
> +    else:
> +      required:
> +        - reset-gpios
> +
> +  - if:
> +      required:
> +        - interrupt-controller
> +    then:
> +      required:
> +        - interrupts
> +
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: mediatek,mt7530
> +    then:
> +      required:
> +        - core-supply
> +        - io-supply
> +
> +
> +patternProperties:

patternProperties go before allOf, just after regular properties.

> +  "^(ethernet-)?ports$":
> +    type: object

Also on this level:
    unevaluatedProperties: false

> +
> +    patternProperties:
> +      "^(ethernet-)?port@[0-9]+$":
> +        type: object
> +        description: Ethernet switch ports
> +
> +        properties:
> +          reg:
> +            description: |
> +              Port address described must be 6 for CPU port and from 0 to 5 for user ports.

This looks like not wrapped @80 character.

> +
> +        unevaluatedProperties: false
> +
> +        allOf:
> +          - $ref: dsa-port.yaml#
> +          - if:
> +              properties:
> +                label:
> +                  items:
> +                    - const: cpu
> +            then:
> +              required:
> +                - reg
> +                - phy-mode
> +
> +unevaluatedProperties: false




Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
