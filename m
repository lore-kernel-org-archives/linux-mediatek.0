Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC83C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9XeVY1b2JoYppH+wQPs1ZmzdCqzcdCIp8LyPR9WU98=; b=KnCIOACLbggFY4
	lqXgmAR3EFY92rwzL5IjUrqiJzJA8sDVNoDR0UcbdvPfUXvCA5AFvaTTerJ9wxJshgM2hdOrRf6vt
	uGHHCf7hNs5d63P/sD5b7rZ3XMOPIMSZ0Qqyx5iPlkXQJ7upkQ/n8uGuVSB5n8aF+irfc1gBALBUE
	T7h/6NWXFhYX5acBUb4uPNzsKjjWmnk4RRXFqvyHGMx/Dl/+K6T8FTI4x671RUQu852VttkUvWyh4
	CgsrE/ujJcfIjonvrJO4yVvCy3UkTmx+E0gmOPThZMZ5+maW/dhNA9vChvJOJCbfDHiBALiWlG4ep
	C8LAY2Q19s+GXfaIEWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niv9P-008wf4-FT; Mon, 25 Apr 2022 09:36:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niv9B-008waO-A1
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 09:36:47 +0000
Received: by mail-ej1-x633.google.com with SMTP id g6so5617200ejw.1
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 02:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nuXvyXcfSlNNf+vXWbc6QlS7EMXyhZacegPBGO4WZEs=;
 b=LofUgeVi0Jw8/ef3AsJTGrYnJHHHe49mIAEj8U+4jh9GWrmr/JEr5K7s/JaE8pkdQc
 ldRehpBumgnOkWBH4HoP8RjF+mPFQpXTivbJnAz9/ZJwXzYxWLHVq4/zv+1TsqZDUCPe
 FUXh0c/rJ/FXHYflHmrvIQ28U9mNJBVGoaWw8ilrRcVg/tCBYOQygMV9WKM8aXhiU+CK
 ki881ebBGEDLu2hGbI4fbe0Y8HF2SSK6SELRQpD/zj9nyG52zCCdzhftcw10L9DzMVGL
 qwuMBdmqeraSZ/X6F2VltV8ys4qFqSzWMRZF303+fBMNDJ6deaBlyEr+q3xOMoJdlt5d
 Lacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nuXvyXcfSlNNf+vXWbc6QlS7EMXyhZacegPBGO4WZEs=;
 b=bIgYSMizzORywF5G45WD7Xn+wlvLpjAVIZwkNk1kmQH/7dkZAsbYrEgLQAeXpkExbI
 f5OgXlk9gHdyPPakbridWK4BmtT326IU40q5++yX4+cYfvE54PpVlm+KHu77LCp+O2cq
 vYJ1TB4gEGwAPs3zhUgeY4TmAf55pMGS4vlEtTRqBCVwDRKmfsDH+I9rhQkzpdZmQuT0
 8u/Bd/bnv1JEEc5/RzgaDqZyCCTv50r1IBxmVuIqm0i81pOYRJnvQgOfFr/BUy3gqhkb
 GfPcO0yVWFqQTKfkbT0Q9Gp6dZ65229HLvWo0ihavW4Z676AOkC1KrcheQUplIX/N7Fi
 xZig==
X-Gm-Message-State: AOAM533hRdKwsCBbT4CacrjAuQ2484jzaig4dZKzE5HO42LL5M8W11nU
 gJTdtsostiiwqRmbUNPtNkVGrQ==
X-Google-Smtp-Source: ABdhPJzwCPLJ4SHeT4lNCV0T5wY9lLZjkgpo2vprKwldO/cFdtJ3tXRPuO09NOtQsRvHlnNH7XK6AQ==
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id
 4-20020a170906310400b006ce6b85ecc9mr15154977ejx.339.1650879403173; 
 Mon, 25 Apr 2022 02:36:43 -0700 (PDT)
Received: from [192.168.0.241] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ak18-20020a170906889200b006f39a445b93sm694706ejc.141.2022.04.25.02.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 02:36:42 -0700 (PDT)
Message-ID: <b852a9d2-8d83-fa9f-52b3-32c9f2ca1e66@linaro.org>
Date: Mon, 25 Apr 2022 11:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: Convert binding to YAML
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220422123823.24577-1-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422123823.24577-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_023645_384744_1BA60C06 
X-CRM114-Status: GOOD (  25.02  )
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

On 22/04/2022 14:38, Allen-KH Cheng wrote:
> Convert Mediatek EFUSE devicetree binding to YAML.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ------------
>  .../devicetree/bindings/nvmem/mtk-efuse.yaml  | 69 +++++++++++++++++++

Same comments as usual, so "vendor,device-name", e.g. "mediatek,efuse"
if this is going to match all possible future MediaTek chips or
"mediatek,mt7622-efuse"


Folks in MediaTek: it would be useful if we did not have to repeat same
review to all of you for every patch. If you keep forcing the reviewers
to repeat the same and the same, eventually they become grumpier and
grumpier. :)

>  2 files changed, 69 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.yaml
> 
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
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.yaml b/Documentation/devicetree/bindings/nvmem/mtk-efuse.yaml
> new file mode 100644
> index 000000000000..307c05f69cb9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/mtk-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek eFuse device tree bindings

s/device tree bindings//

Folks in MediaTek: it would be useful if we did not have to repeat same
review to all of you for every patch.

> +
> +maintainers:
> +  - Lala Lin <lala.lin@mediatek.com>
> +  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,efuse

1. Please add a comment for which compatible this is valid. Such generic
compatibles should not be used standalone. The binding was accepted
(without DT review), so it's done, but let's not spread it over new DTS.

Actually I would prefer to deprecate it in second patch.

2. Same comments as usual - this is enum.
Folks in MediaTek: it would be useful if we did not have to repeat same
review to all of you for every patch.

> +      - const: mediatek,mt8173-efuse
> +      - items:
> +          - enum:
> +              - mediatek,mt7622-efuse
> +              - mediatek,mt7623-efuse
> +              - mediatek,mt8183-efuse
> +              - mediatek,mt8192-efuse
> +              - mediatek,mt8195-efuse
> +              - mediatek,mt8516-efuse
> +          - const: mediatek,efuse
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object

No need, it comes from nvmem.yaml.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Offset and size in bytes within the storage device.
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +

Unneeded blank line.

> +    efuse: efuse@10206000 {
> +            compatible = "mediatek,mt8173-efuse";
> +            reg = <0x10206000 0x1000>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            /* Data cells */
> +            thermal_calibration: calib@528 {
> +                reg = <0x528 0xc>;
> +            };
> +    };
> +...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
