Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1507AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpmJk5DyCAt+oHuI5yM7oIUbPmdAriWLy7/wav/pesM=; b=aKHlkGIUIFoAuE
	G9EmyEonPeZbIYlcWArcEsGolcsmslqrN3ofNJHk6vaY6MiNjZ+k0A7lXtT5MfHMv9ko1SQuPrytz
	ZlowvNdAlMIC+q0DiWtgnmOKLLnAQs+kNABw9j0anCDnG0BifFBTY05KCcARgQLuiAo26+ZcdCUEQ
	hJEbr6ix0b5iVJG6RYjqYE2yfJoBLhiSAIWKUoYGwA46M9cCe+dsGtK5Hyg7Fy1gJ8C4N8aWjxzAg
	hSAw6kLJcz2IB00KF0SBebKXd8p1v77+233KSI3bJ/It4hDwJ6mwJtSOY/+wkpQwaO14mMTQA8Sof
	Vh8Uh57bZAYWQByy7RdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVD59-001mvb-25; Fri, 18 Mar 2022 13:55:55 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVD4w-001ms9-CW; Fri, 18 Mar 2022 13:55:43 +0000
Received: by mail-lj1-f177.google.com with SMTP id r22so11406369ljd.4;
 Fri, 18 Mar 2022 06:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JPyljYX/Lm0WxFrtDo4Ya+Z0IPgwAF5ReZlC89qk2PA=;
 b=KqmXVAKfYBqoXtz0m6ScYZ1uiQ7BQqbR9ZrYN/pef5Gi6AeImgj4f1PK0CrifQ4oUx
 tSGEjiTEQRcFhoAAvEAByIjaPdF4GjGB9g0RuXcnlUejrmRXXGuPZttWDstuFyds0nmX
 rwFbYunpDCLB18nOOYs2qPrfBm70apenHXJVsB0v0N4AvgFgTW4ddA/J+ezuY6xdLY8v
 WUUWTfcpi4KwDpfzpDXZOKUwHRGP9LA/V3wyTbr2fR7E0N8Dh71qQVILFT9VsK4DhlqE
 n7dROv7FjJb2C7lo06SKb4UAVuy6gsxsJUOyNC/ZRgPlTEWgRTamW9w2uw9qn6XeluuQ
 UO2A==
X-Gm-Message-State: AOAM530/C4HULAzKN7CuDpurGw+TNxsQQBmdahAoJpoHwb+y4ZnpwLox
 hwvn9Ar0L2Bub00g8WT3Zpc=
X-Google-Smtp-Source: ABdhPJz9Gvi65cv1y/rwkZysGWe0feU7Ip3bZS70sT8FvJc38u8WlaiKnsxV1FlBOwjNNYG9eHsg8w==
X-Received: by 2002:a05:651c:17a3:b0:245:f39e:f2d2 with SMTP id
 bn35-20020a05651c17a300b00245f39ef2d2mr6377885ljb.490.1647611731195; 
 Fri, 18 Mar 2022 06:55:31 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 d12-20020ac241cc000000b004437eab8187sm859089lfi.73.2022.03.18.06.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 06:55:30 -0700 (PDT)
Message-ID: <d48c0023-231c-4011-5548-4b260b3fe172@kernel.org>
Date: Fri, 18 Mar 2022 14:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-2-jianjun.wang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220318095417.2016-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_065542_437563_4DD50AEB 
X-CRM114-Status: GOOD (  14.99  )
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

On 18/03/2022 10:54, Jianjun Wang wrote:
> Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  .../bindings/phy/mediatek,pcie-phy.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> new file mode 100644
> index 000000000000..868bf976568b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek PCIe PHY
> +
> +maintainers:
> +  - Jianjun Wang <jianjun.wang@mediatek.com>
> +
> +description: |
> +  The PCIe PHY supports physical layer functionality for PCIe Gen3 port.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-pcie-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: sif
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  nvmem-cells:
> +    description:
> +      Phandles to nvmem cell that contains the efuse data, if unspecified,
> +      default value is used.

maxItems: 7

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
