Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502AEC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+EbiXy8hAP8VoNeBUH8kmx6qnfyvhvIHdBBRAmU5R4=; b=k1jMwFLWENYvH8tHhcaPHhU28m
	1oZJWSerekPNlTz6VPnJafmZFoX88ZCQnMws73mxEgp3d6TExr8+ME/qAiu+4TW/fvwQgE9UBb3TG
	+wxaeKAfzc9tLxze/js2Yeg6a/dkf9P2lTp3SEVbPmQRO/zn31/czrmc51VO0zK6gwf3hLZGfXecS
	osYW6Dc4zbjCZ/hZfgShKzW9HhaVa3IQqY6cPPJw06NL5wza8lEuk4bx8YyXwyUBvDuPWnKvNpOUh
	CdWFVFLfrckD6E87FTTW7n6bOeLozFJ7T0BvCGDjg/C7Tubw26ruF7hOzGrifJRJnbPECJjJkh+JR
	zj+D9XTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbqB-000EeT-Ot; Thu, 03 Nov 2022 15:09:11 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbpw-000ETh-1v
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 15:08:58 +0000
Received: by mail-qk1-x72b.google.com with SMTP id v8so1283235qkg.12
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Nov 2022 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+EbiXy8hAP8VoNeBUH8kmx6qnfyvhvIHdBBRAmU5R4=;
        b=OG8EyXDCnL1LKRvTvPRHdeCYPRnOIPoCGKIqnexGpgNzpywiOvEGk0BzugzSpulEJ3
         PhCBbjQqAqTSsHPczIDxxMzZ5q7uXrdJDfl/3Fso/mvshPOdJ3dggTannDZGwRYfZ2Fg
         X+uTsfTkM8z/73k/3iENP+1GrX3o2njxob3LGbDwVzx+RytLTL+dlqtXbt466SuSwoFe
         npXXFxveRYWxdU6/dASR18z6MiJQwMUM0AGdu0oRrVd8g6jEnhoPbqgQNV98XuhLTEUf
         CjoTMwq/XHc7c1oaYp8qOJjTLUmJl0iNVqmZ35kwtbdJEibXt2dG64ix6ABBHM38bCcq
         8uoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+EbiXy8hAP8VoNeBUH8kmx6qnfyvhvIHdBBRAmU5R4=;
        b=BK6rZZe3PhDLRoAE9ZTwjtJJ5TX+eDhIg7+GNRY/kzsAfdq5v77QbCmkQW06EgntF1
         bZKKkdjcvbDaAjWf47ypb/IGx+mJhpnKvn+n8QE0bovHsYWvej05elJNe33SESIyz1E6
         KcL8U25COHM5CcIVHj160YYbX4+HqNQLoRNC0ac59VGMvwEfr4MrLq6abbGdI6a5BLab
         TWzUGnVOlIc0PTvJdII4IcsadfNTJXswXXQB7CVLIQOQdURWZaK1O7PZUmHW5HnfKnRB
         pbBHvDZvZqY2TnuU66kggyVbDdbMM10vHVWn2rCjQBsn+pRtHsY8Exn0yDyyU5AonCGg
         FufQ==
X-Gm-Message-State: ACrzQf2kU955+4aCnZphuRxEZkLSOKgdSXj9x/fAxTkLDvd9vwofcjAw
	w8FoN/cHRtMsldybZHiQRYNSFg==
X-Google-Smtp-Source: AMsMyM6H2OQKbEbvh+qBl09dMiE4Iho9/knHDmPJlnQFflAX3jWAvGOhMYn2dhpItHW/cdlf5kGSYg==
X-Received: by 2002:a37:a09:0:b0:6f9:9f68:5296 with SMTP id 9-20020a370a09000000b006f99f685296mr22239487qkk.83.1667488131730;
        Thu, 03 Nov 2022 08:08:51 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id u4-20020a37ab04000000b006f9e103260dsm881423qke.91.2022.11.03.08.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 08:08:50 -0700 (PDT)
Message-ID: <6d1bd86e-29f0-a3b2-700b-978d64990d56@linaro.org>
Date: Thu, 3 Nov 2022 11:08:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 net-next 2/8] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
 evelyn.tsai@mediatek.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org
References: <cover.1667466887.git.lorenzo@kernel.org>
 <2d92c3e282c6a788e54370604f966fc7a5b479bf.1667466887.git.lorenzo@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2d92c3e282c6a788e54370604f966fc7a5b479bf.1667466887.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_080856_184471_A3519A38 
X-CRM114-Status: GOOD (  20.56  )
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

On 03/11/2022 05:28, Lorenzo Bianconi wrote:
> Document the binding for the RX Wireless Ethernet Dispatch core on the
> MT7986 ethernet driver used to offload traffic received by WLAN NIC and
> forwarded to LAN/WAN one.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 62 ++++++++++++++++++-
>  .../arm/mediatek/mediatek,mt7986-wo-boot.yaml | 47 ++++++++++++++
>  .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml | 50 +++++++++++++++
>  .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  | 50 +++++++++++++++
>  4 files changed, 206 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> index 84fb0a146b6e..9e34c5d15cec 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

Split the cleanups from essential/functional changes.

>  
>  title: MediaTek Wireless Ethernet Dispatch Controller for MT7622
>  
> @@ -29,6 +29,50 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  memory-region:
> +    items:
> +      - description:
> +          Phandle for the node used to run firmware EMI region

Merge above two lines. Drop "phandle for the node used to run"

> +      - description:
> +          Phandle for the node used to run firmware ILM region
> +      - description:
> +          Phandle for the node used to run firmware CPU DATA region
> +
> +  memory-region-names:
> +    items:
> +      - const: wo-emi
> +      - const: wo-ilm
> +      - const: wo-data
> +
> +  mediatek,wo-ccif:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the mediatek wed-wo controller.

Drop "Phandle to". Same in other cases.

> +
> +  mediatek,wo-boot:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the mediatek wed-wo boot interface.
> +
> +  mediatek,wo-dlm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the mediatek wed-wo rx hw ring.

rx->RX?
hw->HW?

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt7622-wed
> +    then:
> +      properties:
> +        memory-region-names: false
> +        memory-region: false
> +        mediatek,wo-boot: false
> +        mediatek,wo-ccif: false
> +        mediatek,wo-dlm: false
> +
>  required:
>    - compatible
>    - reg
> @@ -44,8 +88,20 @@ examples:
>        #address-cells = <2>;
>        #size-cells = <2>;
>        wed0: wed@1020a000 {
> -        compatible = "mediatek,mt7622-wed","syscon";
> +        compatible = "mediatek,mt7622-wed", "syscon";
>          reg = <0 0x1020a000 0 0x1000>;
>          interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_LOW>;
>        };
> +
> +      wed1: wed@15010000 {

That's a separate example. - |
Drop wed1 label.

> +        compatible = "mediatek,mt7986-wed", "syscon";

And where is the compatible added?

> +        reg = <0 0x15010000 0 0x1000>;
> +        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        memory-region = <&wo_emi>, <&wo_data>, <&wo_ilm>;
> +        memory-region-names = "wo-emi", "wo-ilm", "wo-data";
> +        mediatek,wo-ccif = <&wo_ccif0>;
> +        mediatek,wo-boot = <&wo_boot>;
> +        mediatek,wo-dlm = <&wo_dlm0>;
> +      };
>      };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
> new file mode 100644
> index 000000000000..6c3c514c48ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml

arm is only for top-level stuff. Choose appropriate subsystem, soc as
last resort.

> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-boot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title:
> +  MediaTek Wireless Ethernet Dispatch WO boot controller interface for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek wo-boot provides a configuration interface for WED WO
> +  boot controller on MT7986 soc.

And what is "WED WO boot controller?

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt7986-wo-boot
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      wo_boot: syscon@15194000 {
> +        compatible = "mediatek,mt7986-wo-boot", "syscon";
> +        reg = <0 0x15194000 0 0x1000>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
> new file mode 100644
> index 000000000000..6357a206587a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-ccif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Wireless Ethernet Dispatch WO controller interface for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek wo-ccif provides a configuration interface for WED WO
> +  controller on MT7986 soc.

All previous comments apply.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt7986-wo-ccif
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      wo_ccif0: syscon@151a5000 {
> +        compatible = "mediatek,mt7986-wo-ccif", "syscon";
> +        reg = <0 0x151a5000 0 0x1000>;
> +        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> new file mode 100644
> index 000000000000..a499956d9e07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Wireless Ethernet Dispatch WO hw rx ring interface for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek wo-dlm provides a configuration interface for WED WO
> +  rx ring on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7986-wo-dlm
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      wo_dlm0: wo-dlm@151e8000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof


