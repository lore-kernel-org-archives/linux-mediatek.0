Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A651C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btvdQWJruzSQ4SG6KduVfz8ERNeLHefw3tus6NppLs4=; b=s3l2vJ7JpvZlY0kzCr/BKm89FV
	EitZb0DEfVNd0eLgs+UacVN49U8NLpiIN+/F7vDqkIr8N0vv+nLiYfAFKOwQxHtpbtpqHnVYF55qd
	kLvxxh0n4kYsssD67nldBaWHVhv0Gqc04Io51y5uhatVSDtieLzg4ehES2byHeWWCX5YYQEg/2GHm
	jfSqZgFYWcEK7uOl/ZfF2LytbsUF4fVlD3076DPjKYIkYln4wHuijNood8w8hHIEyq62wPtUVdZQG
	Hkgb4Goy2ipj9fOjmKNDgNZX2dbSyURkKup0Ktvwh2TP57aeQDcPRE5xK2q1Ey5hRlPplUXmKO8rm
	lpe56lWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1r8T-0039KE-PF; Thu, 16 Jun 2022 15:10:17 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1r8G-0039Fu-Gc; Thu, 16 Jun 2022 15:10:06 +0000
Received: by mail-il1-f177.google.com with SMTP id u2so1128965iln.2;
        Thu, 16 Jun 2022 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=btvdQWJruzSQ4SG6KduVfz8ERNeLHefw3tus6NppLs4=;
        b=BFm5QlisLcvz/E23NlR7YVD4PA4qpB10sWFMzKrKNhh51mPutSN/WEJDOJtgxgrU6Z
         UFnQb/l7iZ+91hr3shyykC4Z4X5zq4Xg74H8P17MJw2Ua5GlCX/iWf3nKwTF3b2FjUUV
         kXwbPGCUeGWQ7YB3FKQKKWOnpVNAQ2WbujV35k8z93Qs0aU9EX0YaaSEUyQHnoQX8wwr
         fyZNK/dzAROIlRg1S7+kluFdy5HlwcPBxh/mUV2C1jxwzByXq/5/IuZ76yp+bmkOj9+M
         Fp0UabEprBzjoIs6+aAJWcGeMlnuIm0QzBwrdaeLx838mMV0o25vCXJ+rgkIwQDhIwgr
         vbUA==
X-Gm-Message-State: AJIora/z+bbyDhkv0gZr7RNn1MxNdY3vyA8mIFAkcQLBVko5x3/Ht6Im
	0lLKoslq/lUtB1Knj7zxFw==
X-Google-Smtp-Source: AGRyM1shC8pxCNBIR87vQUT1+q/CqjpLhoPfpsVViRbDmismLWe5fFC8frTyEEMb9cOOdYAo2qu4jw==
X-Received: by 2002:a05:6e02:d4b:b0:2d3:b2a6:e94b with SMTP id h11-20020a056e020d4b00b002d3b2a6e94bmr2942283ilj.135.1655392202408;
        Thu, 16 Jun 2022 08:10:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z2-20020a923202000000b002d191911e59sm1094076ile.52.2022.06.16.08.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:10:02 -0700 (PDT)
Received: (nullmailer pid 3481830 invoked by uid 1000);
	Thu, 16 Jun 2022 15:10:00 -0000
Date: Thu, 16 Jun 2022 09:10:00 -0600
From: Rob Herring <robh@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Edward-JW Yang <edward-jw.yang@mediatek.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Message-ID: <20220616151000.GA3469769-robh@kernel.org>
References: <20220612135414.3003-1-johnson.wang@mediatek.com>
 <20220612135414.3003-2-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612135414.3003-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_081004_577916_D00401B1 
X-CRM114-Status: GOOD (  22.57  )
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

On Sun, Jun 12, 2022 at 09:54:13PM +0800, Johnson Wang wrote:
> This patch adds the new binding documentation for frequency hopping
> and spread spectrum clocking control on MT8186.
> 
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,fhctl.yaml | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> new file mode 100644
> index 000000000000..9cb04bed9e86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek frequency hopping and spread spectrum clocking control
> +
> +maintainers:
> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
> +
> +description: |
> +  Frequency hopping control (FHCTL) is a piece of hardware that control
> +  some PLLs to adopt "hopping" mechanism to adjust their frequency.
> +  Spread spectrum clocking (SSC) is another function provided by this hardware.
> +

Are all these settings per board? 

> +properties:
> +  compatible:
> +    const: mediatek,mt8186-fhctl
> +
> +  reg:
> +    maxItems: 2

Need to define what each entry is.

> +
> +patternProperties:
> +  "^map[0-9]$":
> +    type: object

       additionalProperties: false

> +    description:
> +      Represents a group of PLLs controlled by the same domain and method.
> +
> +    properties:
> +      domain:

Custom properties need a vendor prefix.

'domain' is a pretty generic term. 

> +        description: The position of this hardware block in the chip.
> +        $ref: /schemas/types.yaml#/definitions/string-array

You have to define possible values.

> +
> +      method:
> +        description: Determine which method to control this FHCTL hardware.
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +
> +    patternProperties:
> +      "^armpll_(ll|bl)|(cci|main|mm|tvd|m|adsp|mfg|nna|nna2|msdc)pll$":
> +        type: object

           additionalProperties: false

> +        description:
> +          A subnode represents one PLL clock. The properties it contains are
> +          used to determine whether this PLL enable frequency hopping mechanism           and spread spectrum clocking (SSC) control.
> +
> +        properties:
> +          fh-id:
> +            description: The index of the PLL clocks.

index is based on what?

> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          perms:
> +            description:
> +              This is a bit field used to manage the permission of frequency
> +              hopping function and spread spectrum clocking control.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          ssc-rate:
> +            description: The percentage of the spectrum spreading.

Use '-percent' suffix then.

> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 8
> +
> +        required:
> +          - fh-id
> +          - perms
> +
> +    required:
> +      - domain
> +      - method
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8186-clk.h>
> +    fhctl: fhctl@1000ce00 {
> +        compatible = "mediatek,mt8186-fhctl";
> +        reg = <0x1000ce00 0x200>,
> +              <0x1000c000 0xe00>;
> +        map0 {
> +            domain = "top";
> +            method = "fhctl-ap";
> +
> +            armpll_ll {
> +                fh-id = <0>;
> +                perms = <0x10>;
> +            };
> +
> +            armpll_bl {
> +                fh-id = <1>;
> +                perms = <0x10>;
> +            };
> +
> +            ccipll {
> +                fh-id = <2>;
> +                perms = <0x10>;
> +            };
> +
> +            mainpll {
> +                fh-id = <3>;
> +                perms = <0x1c>;
> +            };
> +
> +            mmpll {
> +                fh-id = <4>;
> +                perms = <0x1c>;
> +            };
> +
> +            tvdpll {
> +                fh-id = <5>;
> +                perms = <0x1c>;
> +            };
> +
> +            mpll {
> +                fh-id = <6>;
> +                perms = <0x10>;
> +            };
> +
> +            adsppll {
> +                fh-id = <7>;
> +                perms = <0x1c>;
> +            };
> +
> +            mfgpll {
> +                fh-id = <8>;
> +                perms = <0x1c>;
> +            };
> +
> +            nnapll {
> +                fh-id = <9>;
> +                perms = <0x1c>;
> +            };
> +
> +            nna2pll {
> +                fh-id = <10>;
> +                perms = <0x1c>;
> +            };
> +
> +            msdcpll {
> +                fh-id = <11>;
> +                perms = <0x1c>;
> +                ssc-rate = <3>;
> +            };
> +        };
> +    };
> -- 
> 2.18.0
> 
> 

