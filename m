Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF06DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dZFR4IIMAbZdrGbpe16JSSwYgXLi8UyrLF/uXS9kjE=; b=Y6FX7xCpBlscDW
	BCIUbic7F8QN21yrn6LSvitoQsoMmy767ZaqGLoEBqF9Y4UGI2Oy4uR3x1hcdlF6AqnFs8s7AcsRp
	/WG6LscLj17xVMghFpqo9lL52ZWvmzn4qz6nNi0FF9BLWeWoWIEaZjDADlUcG8kdAkVtAqm8I0hFL
	fLN/Fp5xh/9qklYXAb4GFno0ETdFTdgsxUAr+dX330CUtXNLfDWXsXFpcxxyRGbKXKScxyNd2RyCp
	1Cjy+KxrOMVmCDBJRf0aEdUIr143CqwTNog7yt7ECoIVIpgvqkwLK0gMc30n7UPL0pQmlIZM934a8
	CSzwfoU35za4jCuNMF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxXiD-001wun-4g; Wed, 15 Dec 2021 17:05:05 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxXZo-001tYb-SU; Wed, 15 Dec 2021 16:56:26 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 v30-20020a4a315e000000b002c52d555875so6100529oog.12; 
 Wed, 15 Dec 2021 08:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jRx/8XO5m2lO+UXrFb8kcYT22KejDsnyUFbPI7+hOJM=;
 b=PgcU9R4QU062eaHHWJX2nf2h0B6BWcPPEuyfOJl1GbUli1P7C7morx9XMMs7BuOsBs
 TRknzCaxEpCrMFKQabco1PmclxZHgwYzLp9XpKk1Hrky6hnZeHPj8DUzj/W+uANqYgAI
 EGvC1OcmAhWW9lOQu7PuHEZbEhmJzQDQg2OKk5OrHewJXKqjpC10S6PhlrDwPpWWE10r
 qWLdkMaaKVBYILQNc0MUIHOhOdMxNDuXcM92FEQe1gewwfXHyy28hF5fgBtNAnpKqz6b
 QDYol90aVFRNEPcc/zlDVIo+0QNS58zOo3rq5Gp22wQixk61Iywgobwdh139n9cp3y9H
 cJeQ==
X-Gm-Message-State: AOAM532fZa/0z6svCIx1M4x9V3GcWu+9LqNZyt0cjDBhhpjYhjDEHjEu
 XXLs5/Gnz8QDonkTQEByGA==
X-Google-Smtp-Source: ABdhPJwAyYDPJPd/QuvgrvCEGorU09o3oX0vioSImGfUA+720rBTHRNfwyRDvv4oc8UFp20LVOHoNA==
X-Received: by 2002:a4a:d47:: with SMTP id 68mr7887808oob.92.1639587383787;
 Wed, 15 Dec 2021 08:56:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j10sm528301ooq.5.2021.12.15.08.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:56:23 -0800 (PST)
Received: (nullmailer pid 1466701 invoked by uid 1000);
 Wed, 15 Dec 2021 16:56:22 -0000
Date: Wed, 15 Dec 2021 10:56:22 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [next PATCH] dt-bindings: nvmem: convert mtk-efuse.txt to YAML
 schema
Message-ID: <YboeNrekGcGOZES8@robh.at.kernel.org>
References: <20211209024213.16612-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209024213.16612-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_085625_012207_C9E86E9D 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 09, 2021 at 10:42:13AM +0800, Chunfeng Yun wrote:
> Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../bindings/nvmem/mediatek,efuse.yaml        | 89 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ---------
>  2 files changed, 89 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> new file mode 100644
> index 000000000000..7332195e7f00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek efuse device tree bindings
> +
> +description: |
> +  MediaTek's efuse is used for storing calibration data, it can be accessed
> +  on ARM devices usiong I/O mapped memory.
> +
> +maintainers:
> +  - Andrew-CT Chen <andrew-ct.chen@mediatek.com>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  $nodename:
> +    pattern: "^efuse@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt7622-efuse
> +              - mediatek,mt7623-efuse
> +              - mediatek,mt8173-efuse
> +              - mediatek,mt8192-efuse
> +              - mediatek,mt8195-efuse
> +              - mediatek,mt8516-efuse
> +          - const: mediatek,efuse
> +      - const: mediatek,mt8173-efuse
> +        deprecated: true
> +
> +  reg:
> +    maxItems: 1
> +

All of: 

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      bits:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false

...this is covered by nvmem.yaml and can be dropped.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    efuse@10206000 {
> +        compatible = "mediatek,mt8173-efuse";
> +        reg = <0x10206000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        u2_intr_p0: usb2-intr-p0@188 {
> +            reg = <0x188 0x1>;
> +            bits = <0 5>;
> +        };
> +
> +        u2_intr_p1: usb2-intr-p1@188 {
> +            reg = <0x188 0x2>;
> +            bits = <5 5>;
> +        };
> +
> +        thermal_calibration: calib@528 {
> +            reg = <0x528 0xc>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> deleted file mode 100644
> index 39d529599444..000000000000
> --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -= Mediatek MTK-EFUSE device tree bindings =
> -
> -This binding is intended to represent MTK-EFUSE which is found in most Mediatek SOCs.
> -
> -Required properties:
> -- compatible: should be
> -	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
> -	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
> -	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> -	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
> -	      "mediatek,mt8195-efuse", "mediatek,efuse": for MT8195
> -	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
> -- reg: Should contain registers location and length
> -- bits: contain the bits range by offset and size
> -
> -= Data cells =
> -Are child nodes of MTK-EFUSE, bindings of which as described in
> -bindings/nvmem/nvmem.txt
> -
> -Example:
> -
> -	efuse: efuse@10206000 {
> -		compatible = "mediatek,mt8173-efuse";
> -		reg	   = <0 0x10206000 0 0x1000>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		/* Data cells */
> -		thermal_calibration: calib@528 {
> -			reg = <0x528 0xc>;
> -		};
> -	};
> -
> -= Data consumers =
> -Are device nodes which consume nvmem data cells.
> -
> -For example:
> -
> -	thermal {
> -		...
> -		nvmem-cells = <&thermal_calibration>;
> -		nvmem-cell-names = "calibration";
> -	};
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
