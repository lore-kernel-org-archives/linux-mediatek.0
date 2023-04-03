Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EE4C77B62
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njOb8FD8MR7p9DAF345Hq+aO222nfpoaV4wgzEQORsE=; b=GN3fr+v4kbYutJhXpE3o3H7q92
	B6CJXSfIKfFBPaRi0M1qI21+rLbqbLxm5aB4VBx8R0Xyw1Nm9ZJSw58/c8LaU3wo5wRVsa22hU4Uk
	5Fp0ufCcf7dOcqQSfFvL8LoKc49Y/TDmKL529KSXXoWYhq/uInMvBLh551L18fnHtTORlcRPyDfzm
	ZzX72uTfVTmJXqZNQW5mq7LCshy0z+HDZSz9efT8YPpwDwCJsv4jXbQC3IF7U4tStH572ORpe76tf
	a7iJ0WUfzfeADT51Ss0iyoQ+B1grZKuZeYwvMlzwvAx6XM9l3283fd5DPzPbi7bS+9deOJo9mFMh1
	EFJjoTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGp9-00Ep0P-1W;
	Mon, 03 Apr 2023 09:50:03 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGp6-00EoxV-27
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 09:50:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id eh3so114807923edb.11
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680515399;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=njOb8FD8MR7p9DAF345Hq+aO222nfpoaV4wgzEQORsE=;
        b=WSssOdY3Y7QQMxZhOv5ODIMftu2oa1cARN3R7zrYwN6qDd6mcfPp0HUo/WyzzybZlN
         3qwP+204tyHqCd89ElO0Un0gBC2UIThCIsdF8Wh/CBy8virxgKXDJtFh1XborA+iWUVN
         N+k+CKu0zYPFcAkS+mnT2g9RVJMtq7eNyt79cJLa8P4RS1PxHLGb/b7N1pBhEeKbG1Qm
         LGpaI5X9aSyIR2xYFIwwx9XQ4Gj6fpkg2+cHarWPeBftyNzNpFft3vIc7cCjppZFNv/p
         3/6LW4Lb4OWiTvgVMYFxPbkeOohPQ5OSTAM32IKGLEYhEID6mAHSm4CilJTNYK3Svc6b
         RrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680515399;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njOb8FD8MR7p9DAF345Hq+aO222nfpoaV4wgzEQORsE=;
        b=mNEu3OmZfLXS/JKjXouu3KDo07k8/1uTTmf7hfDVaen+kTNKX58YKe+g1QZlIFnC9a
         uEJFW3m0OyfyKQHVmlKCXKnXi/6GmimL1vFSP0o9hBTX2v5YCpjDHEFES/PbijNmfqSF
         6n0gTJtc/7Um0h2CjKESpGOeBm9NvJAsucqJqNhgA5TYz7601eAAv2vuDrdMtlFXFneh
         pxjYfEnFqW7ZBr9F3tronHfj8AYgxXs7Acaav12SkII320lkUCqGZpl3M/L3Pq64MeOb
         53N14DkZoSobVQBgxDY8f41Uikqb/h8i1+1aj/+jl33XG2iaoGy1cDvwhCLnLvhFAKZp
         7TPA==
X-Gm-Message-State: AAQBX9e94Fihhj33Yy7g7mxJ964hPFo17L/Z5r+O705OyxCNdKpeO/gW
	9j/RqdLt+ERGIhIkkVcL2qlpbg==
X-Google-Smtp-Source: AKy350axDXzqltQsMGrbEq+s6HAPPXokx38cO/zKLAuZvJShm+5OuEGsdQduEWPjjJl9tW5ESCenGg==
X-Received: by 2002:a17:907:7f0d:b0:946:fa88:5901 with SMTP id qf13-20020a1709077f0d00b00946fa885901mr19111746ejc.63.1680515399082;
        Mon, 03 Apr 2023 02:49:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id hz15-20020a1709072cef00b0093ebc654f78sm4290447ejc.25.2023.04.03.02.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:49:58 -0700 (PDT)
Message-ID: <4837c3e0-60ed-601b-8512-30fda2176619@linaro.org>
Date: Mon, 3 Apr 2023 11:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: phy: add mtk-mipi-csi driver
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: Florian Sylvestre <fsylvestre@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-mediatek@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20230403071929.360911-1-jstephan@baylibre.com>
 <20230403071929.360911-2-jstephan@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403071929.360911-2-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_025000_708337_9C0076A7 
X-CRM114-Status: GOOD (  16.65  )
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

On 03/04/2023 09:19, Julien Stephan wrote:
> From: Florian Sylvestre <fsylvestre@baylibre.com>
> 

There is no commit msg.

> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/phy/mediatek,csi-phy.yaml        | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> new file mode 100644
> index 000000000000..c026e43f35fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml

Filename like compatible.

> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-Only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,csi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Sensor Interface MIPI CSI CD-PHY
> +
> +maintainers:
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description: |

Do not need '|'.

> +  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
> +  receivers. The number of PHYs depends on the SoC model.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-mipi-csi
> +
> +  reg:
> +    minItems: 1

maxItems instead
(from where did you get such example?)

> +
> +  '#phy-cells':
> +    const: 1
> +


Best regards,
Krzysztof


