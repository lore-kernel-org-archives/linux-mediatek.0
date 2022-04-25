Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BAAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dh3Eh5v55Fz1cKg9TtK3R7XUAjPB7leamC/IzKzXIwU=; b=znDJkztaElFNzQ
	tcC/oc8w/vWN5z2s9i/0AkGVJPPrIdIVAre8iwyNe3HL3NcZ6z/pp0S7JvnSt+RsP4dD7x8aMjMsd
	yyBK0UiXzrT7ak98nmMSlWNcRiHILMuIVLJwDvxKP132m3zl6zdXBcdh4HrSlUHQQG2XNpRbnw2nn
	PZ/EAyRsy62zXdGkR21/mdkwpDnKvFtpcSg9Hhw9YCGAHmBM3Nw7akZAZQ4KQZkYdJrKUMzCJECEQ
	HVBQ4EvDaovNh48F8n69wJ6QoG2TK2IjZi9LlnydLXrTk1tXdYikBUcOeQXQAPFL0LaoVLZFjJbqk
	zWLTMeKL9E1NKU3kO9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj1jM-00ARBD-EV; Mon, 25 Apr 2022 16:38:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj1jH-00AR8Z-QG
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 16:38:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id gh6so6674697ejb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aPIdQDIRukorX+rlQLQNCJb/WszJPQvBSKE5sVXWYN4=;
 b=fbR1JzPqmZKNvCsfnNWshb0XEU/ukODftW0ies9hNL6PaLwLu4qF6DSbJFL3KfOoif
 Xuv7AjWoQm7X8gY52UCSg/Dc2hQcIYqftnwf6qfsdYJHrFp4kgrUBO/xx+3b7iUxPiEU
 MbvHOXn/e8q93N+8JqYbmR9iXw2BvD5/TI/HzcWXctOtqMArFtAZW+E809iPd+pcdA0R
 MZJODrU/uYdLIemsLXFInMFypBw9vmGbFM0RSFrh4vPxijKwEA3dnwij/5hcWNJkqb54
 GgF2GHVypNJBSxpYcEuUaOmlsJ3G9vNJLydfet8lNsmsrG9DzQnjGPIcof5FmwJ0tI7g
 +12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aPIdQDIRukorX+rlQLQNCJb/WszJPQvBSKE5sVXWYN4=;
 b=GW/P0N26VQrQvS+gA30WwUZSpt/KJdehiCdXgiHCOyV/BWNtQVK7aq3Fudd3BbWKUu
 MYuUUSlUzIZgu+OlA+0vB9wMBySA+EomlkJKGAzfDdPfvg9K1QbYQvjDN/y2IP9PlV7e
 Pc7eCvuFdBu/VHQuNPjbgYUFcVoPQAMcP5KG+FGXLpJCme3Pjg5RfpU9Sa2fiOX+/c+v
 MPqIbZoMFjWwJFjzy7lJF9pEqALQKS2F7Gikom9d+FzL2/WfRITAl4uqFVgOuEnZ69b7
 4uSMNKxXlIKkMwNw4Pfiasny0RBoR4IkUim2k1py37RYrar59mnnAj3z24zDk2+Ttmh+
 4sVQ==
X-Gm-Message-State: AOAM530sGuBt1xGvpdte6Rn3foI2CbBF1i3K/Jg4CDobG7wzMUypCZ2z
 IqU7My3Al7cpxOBTfMW2r+bPMw==
X-Google-Smtp-Source: ABdhPJwCUzEyh0LHXM0mYXKMWIrNUTFSn/nyYquzFOMXcEhU44wwTvdEXPif6xQXhwXi5575pMD13A==
X-Received: by 2002:a17:907:6ea7:b0:6df:c5a2:89ca with SMTP id
 sh39-20020a1709076ea700b006dfc5a289camr16948170ejc.18.1650904706114; 
 Mon, 25 Apr 2022 09:38:26 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 kt24-20020a170906aad800b006f37988318esm2478155ejb.48.2022.04.25.09.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 09:38:25 -0700 (PDT)
Message-ID: <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
Date: Mon, 25 Apr 2022 18:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: mediatek: Convert mtk-efuse
 binding to YAML
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
References: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
 <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_093827_980256_C02D5CF0 
X-CRM114-Status: GOOD (  15.64  )
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

On 25/04/2022 10:48, Allen-KH Cheng wrote:
> Convert MediaTek eFuse devicetree binding to YAML.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/nvmem/mtk,efuse.yaml  | 70 +++++++++++++++++++

The vendor prefix is mediatek. Quoting my previous reply:

  Same comments as usual, so "vendor,device-name", e.g. "mediatek,efuse"
  if this is going to match all possible future MediaTek chips or
  "mediatek,mt7622-efuse"

so keep it mediatek,efuse.yaml.

>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ------------
>  2 files changed, 70 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> new file mode 100644
> index 000000000000..d056bc61dd5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/mtk,efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek eFuse device tree bindings

No changes here. Please read my comments from your v1, don't ignore them.

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
> +      - enum:
> +          - mediatek,mt8173-efuse
> +          - mediatek,efuse

Still no changes...

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

Still no changes.

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

Still no changes.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
