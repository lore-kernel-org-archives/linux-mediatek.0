Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5326C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 06:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRVxOG7qADUKLQIGqtNKRPIt1PNs/Vc8D7VzQwbaXQ4=; b=edafSsNVLLZJ7m
	qvS2SZjs1earo/SbBs7+X3DUfE3MJncym4deZVfWR2ZqmoLxpmcZHZWbTzXw+LY4v+u5nBSz2/qZM
	dHug1WZByk0Dg/39hn0IVydMRBWlVWaOs6XhccLnn2ETs/AfGnzW2ob7zo0ZE9+GTUiExsxmREZkC
	4lV1IKfK7zVLyQZAEquTIB23oCEm+UKTws332ekTcRHFbhpBg+ktkuoPl869jpkQux2mzVK8Alvyr
	008KsNj7undpmZleSYMJ62Ayn7oZjv2v4XslGOFoV6Dk06r60iUdWHywZcgluNLbNkj4BFN5qUoSm
	9N+F8Kr1tKXzUt8EW6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh4ET-007e9d-Oz; Wed, 20 Apr 2022 06:54:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4EE-007e4F-Qd
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 06:54:22 +0000
Received: by mail-ej1-x62c.google.com with SMTP id y10so1491494ejw.8
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 23:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0thAvQfL4y/ANwlWwuJlsB55+79afScMHrrhUTn5STY=;
 b=ZpJo+ji05C0QUslEtIPpytAUeOvFreIXawkB2VQn1SAEQRLgSN3GOebOP4TsjpeQTW
 M+LDQzcFDCoyAR3R3UR4O/p8ndnPtpWVP+19TMOTUqB5CAa7q6J+7xjwBM0KgvdBmmBH
 STNa3IYlrdBdys0w7cE80PHZNlQe7yrO43PKdO2x1E/AI3EOa5sBx3Pn40alRV/MaUTl
 HrR0CM2cEAqWMO4lCH2n/rbA4+YRJbbUeA0h/vXkCFwoCfh5ECO180N+UkqIAgDvsZcw
 oY841/L9Ge9KCb8u5xMeVa7KCvFZoltjePMGLjAx1imogc896+G2qDJ63aWOoTrvqz9x
 Mtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0thAvQfL4y/ANwlWwuJlsB55+79afScMHrrhUTn5STY=;
 b=738qEsnVNQVssZL0N+ZCkzy/iM06dfFu75up7CkWf+jlQAD7owwP4sS2LFlJvaLoV4
 q3x+FDS5flvXSiZj4A7ZBoxO2pdW+N6VztWIfZeS9toH8PBs6YjsWpgwj2brHAv9VoQk
 PEuzMWf7a5WlQaWR8H8zlhPlxzlJN5cFHZZA+4qFYRT0Nk6n2jnasb6R+4EIynnBAvLl
 XBMcpARyKuepNJwiL20Xbco67snURse15W4DD1BxLordlRa/ewbLavy3Qqu/4DFZMqc5
 2+uuWuGrbNimmMew/0UtEOg6CcepGUr4ZiosIbcP9c2Grnyr/qtWrx18To+C56tZ/AG2
 6xYA==
X-Gm-Message-State: AOAM5330+n6qAug2GWntQP9wagluebOen9J/T+07bBpohj4Sla+c5zlA
 fiZPFfNRESQ4WA26OeJdyJUUuw==
X-Google-Smtp-Source: ABdhPJyNAr3uY+e3ZdObdNbNNmPe1GJjQk0U89gMG9EQC9bKLlaLalCYhEXbk2BoYfE9K7czBt8ecA==
X-Received: by 2002:a17:907:1c0e:b0:6ef:f4b9:9a2c with SMTP id
 nc14-20020a1709071c0e00b006eff4b99a2cmr2925156ejc.309.1650437657219; 
 Tue, 19 Apr 2022 23:54:17 -0700 (PDT)
Received: from [192.168.0.222] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 q2-20020a056402032200b00423d4516387sm6040085edw.75.2022.04.19.23.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 23:54:16 -0700 (PDT)
Message-ID: <bac59bb7-b214-1edb-e6b9-7885c8a99c3a@linaro.org>
Date: Wed, 20 Apr 2022 08:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dt-bindings: arm: mediatek: infracfg: Convert to DT
 schema
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>, Yassine Oudjana
 <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
 <20220419180938.19397-4-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419180938.19397-4-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_235419_005730_77818B98 
X-CRM114-Status: GOOD (  22.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 19/04/2022 20:09, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert infracfg bindings to DT schema format. Not all drivers
> currently implement resets, so #reset-cells is made a required
> property only for those that do. Using power-controller in the
> example node name makes #power-domain-cells required causing
> a dt_binding_check error. To solve this, the node is renamed to
> syscon@10001000.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
>  .../arm/mediatek/mediatek,infracfg.yaml       | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> deleted file mode 100644
> index f66bd720571d..000000000000
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Mediatek infracfg controller
> -============================
> -
> -The Mediatek infracfg controller provides various clocks and reset
> -outputs to the system.
> -
> -Required Properties:
> -
> -- compatible: Should be one of:
> -	- "mediatek,mt2701-infracfg", "syscon"
> -	- "mediatek,mt2712-infracfg", "syscon"
> -	- "mediatek,mt6765-infracfg", "syscon"
> -	- "mediatek,mt6779-infracfg_ao", "syscon"
> -	- "mediatek,mt6797-infracfg", "syscon"
> -	- "mediatek,mt7622-infracfg", "syscon"
> -	- "mediatek,mt7623-infracfg", "mediatek,mt2701-infracfg", "syscon"
> -	- "mediatek,mt7629-infracfg", "syscon"
> -	- "mediatek,mt7986-infracfg", "syscon"
> -	- "mediatek,mt8135-infracfg", "syscon"
> -	- "mediatek,mt8167-infracfg", "syscon"
> -	- "mediatek,mt8173-infracfg", "syscon"
> -	- "mediatek,mt8183-infracfg", "syscon"
> -	- "mediatek,mt8516-infracfg", "syscon"
> -- #clock-cells: Must be 1
> -- #reset-cells: Must be 1
> -
> -The infracfg controller uses the common clk binding from
> -Documentation/devicetree/bindings/clock/clock-bindings.txt
> -The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> -Also it uses the common reset controller binding from
> -Documentation/devicetree/bindings/reset/reset.txt.
> -The available reset outputs are defined in
> -dt-bindings/reset/mt*-resets.h
> -
> -Example:
> -
> -infracfg: power-controller@10001000 {
> -	compatible = "mediatek,mt8173-infracfg", "syscon";
> -	reg = <0 0x10001000 0 0x1000>;
> -	#clock-cells = <1>;
> -	#reset-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> new file mode 100644
> index 000000000000..4f43fe9f103e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Infrastructure System Configuration Controller
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  The Mediatek infracfg controller provides various clocks and reset outputs
> +  to the system.

Mention here the headers with clock and reset constants. The same for
patches 1 and 2.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-infracfg
> +              - mediatek,mt2712-infracfg
> +              - mediatek,mt6765-infracfg
> +              - mediatek,mt6779-infracfg_ao
> +              - mediatek,mt6797-infracfg
> +              - mediatek,mt7622-infracfg
> +              - mediatek,mt7629-infracfg
> +              - mediatek,mt7986-infracfg
> +              - mediatek,mt8135-infracfg
> +              - mediatek,mt8167-infracfg
> +              - mediatek,mt8173-infracfg
> +              - mediatek,mt8183-infracfg
> +              - mediatek,mt8516-infracfg
> +          - const: syscon
> +      - items:
> +          - const: mediatek,mt7623-infracfg
> +          - const: mediatek,mt2701-infracfg
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - mediatek,mt2701-infracfg
> +          - mediatek,mt2712-infracfg
> +          - mediatek,mt7622-infracfg
> +          - mediatek,mt7986-infracfg
> +          - mediatek,mt8135-infracfg
> +          - mediatek,mt8173-infracfg
> +          - mediatek,mt8183-infracfg
> +then:
> +  required:
> +    - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    infracfg: syscon@10001000 {

reset-controller or clock-controller instead, because syscon is for
blocks having only the syscon function.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
