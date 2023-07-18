Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91EDEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EK+VTwTdErg5iekBiaTeYX5r7dT6fD+apvm8qmzsbyc=; b=y/lAO8dTZOCLkYOWX6+CaqTpzx
	pZevLKfiacNvAX7SiJu3lQ7F1oAq8bro7bFjDkuGev2R2Kgbbwk7R1mEJyd/B6RHLziCDvb0OUDp1
	/VNRBTHMyer88fAgJZ2XnloP4GlgLilAA+sT0gvO843UT/k0MOA0ACguWxspGUBu+ubwYF+UR+aWT
	t8vfVauHWzUJ0yvJXT069n0ccrgfiJ7R6EP4SK8WFQeonqfwq44ccwwFpBv0Y8L2XhI8Mqj/yFLMT
	6o5i7Zy66m+4MfSJEZ6V2saWZzyaMQW4Pt6RzQXvm9XsB34UzdnEkCON2nEWmzNNMkTEX7TJSu4Rp
	oza2Z/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzRD-005AE1-2V;
	Wed, 19 Jul 2023 05:09:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzRC-005ADi-1G
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EK+VTwTdErg5iekBiaTeYX5r7dT6fD+apvm8qmzsbyc=; b=hm1vWxhHNy6OFOi66+FhGJ450c
	t/eC9kV9OD7jf3ikKX+wC+7iekVv65l1JS76K8jk6/fTWsHYv+v5qbjGZXkHH0H3nbzNnt0XRen+3
	UxcA82T/FeFnTslgTAMsfDbMUKlnJkvAloS9loeFpsjtni4NDiDDdtSxyu6eoc/j0BFjEn1egb/XB
	WGhbBlcXdC1KwlTubV0WWJaYo45R6TrM7BUQsa5zA97qGGYrCDmeswjOLO+4sOEWNUbhsr/k62KL4
	bBiJvs9RYHWopoVPd2gfxXTSjcxapmf2suDN1A7amGIk+21jDgqBmUS2d783uzusoV4skBwf+24Ng
	1eJ0Yz+A==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLj6t-00BTQw-2R
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 11:43:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-991c786369cso727649966b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689680532; x=1692272532;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EK+VTwTdErg5iekBiaTeYX5r7dT6fD+apvm8qmzsbyc=;
        b=voyAqL/BTsrNt3HDNRmbRDHgSrt/GORWFQdAFHOHVQqONTRIr+g5TQSVqxfLjF+Ozv
         9wGzzi6OWeLozlp2c0O1nwswzsNvFVR9NQFDRp1h5tVX82fFbpcGWLZcsUGIqjCeKdbC
         Cm6z/bmm+X4PNNdjUArZx4WfQfI3JwZ95uhn8lrv0yaFyJgk/nry1fZolo9ek9AHY3mU
         PGfVsElxK+0jBG9duHBBpzcn3YuTUxrNdRI/XUYIRON1jHqdIKIwR7Cj9eJcl1oP8IOy
         LWn39/AdwLPhObwPc6/n1KvCS4BUjstNsJ6dCPVRHa9fw3RuS+TwyH9Qb9LE3n46YiHh
         8h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689680532; x=1692272532;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EK+VTwTdErg5iekBiaTeYX5r7dT6fD+apvm8qmzsbyc=;
        b=fyKKWtRiTjYYRoAjwwfroILhEeL4HS08AiDF3bdu65YDq4jWRMyBsYOMwFy/orCWCU
         RYdu1z/dp3PTMQOWlAyeeC/rt14Nu/XU8xt+tEDaEdy70vgH5dL6cizqL32muIc/kUzh
         +vwPKU2GGhvV+MmXV3RkY0RukMjHcwgfSFnJ223mN0xHXhVYzgJbmhyrWAdiWtrzGh0c
         kg1FfjG2EJT9666NxjKednEL5A3KedmXFBgXiYw6PT/EBWKHbJDeTpbOiXEFR8fo2uxZ
         vthv0nnxwpt3XMJPAPDqkjhvL+xidyPYjxHo6UfJ5i2T4FayhP74Hs2N2Yo9g6PWyw0L
         1bBw==
X-Gm-Message-State: ABy/qLawScVCS8SxmAhRe9yv7L7MC+XzslIFMZrrhNGxUWFmF9QwYU+0
	J7zDs4Y/w0VJeE7UubEaDtNqHQ==
X-Google-Smtp-Source: APBJJlHEPY03BmEn7p4RayPmGdhzkVvZpcfhx9g9ys0BJCFXp8fGzQQDkatuBE5ckYJw5eR7d0RtzA==
X-Received: by 2002:a17:906:739e:b0:977:befe:d888 with SMTP id f30-20020a170906739e00b00977befed888mr14595037ejl.13.1689680530844;
        Tue, 18 Jul 2023 04:42:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l5-20020a1709065a8500b00992c92af6easm904900ejq.161.2023.07.18.04.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:42:10 -0700 (PDT)
Message-ID: <b974af38-af5d-5d09-0e18-791769c95522@linaro.org>
Date: Tue, 18 Jul 2023 13:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] dt-bindings: soc: mediatek: Add mtk-socinfo driver
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230718112143.14036-1-william-tw.lin@mediatek.com>
 <20230718112143.14036-3-william-tw.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718112143.14036-3-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_124320_026556_59F5EB4A 
X-CRM114-Status: GOOD (  17.27  )
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

On 18/07/2023 13:21, William-tw Lin wrote:
> dt-binding documentation for mtk-socinfo driver.
> mtk-socinfo driver provides SoC-related information.
> Such information includes manufacturer information, SoC name,
> SoC segment name, and SoC marketing name.
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---
>  .../bindings/soc/mediatek/mtk-socinfo.yaml    | 58 +++++++++++++++++++

Put it in appropriate place - hwinfo.

>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-socinfo.yaml

Wrong filename: missing vendor prefix, not matching compatibles.

> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-socinfo.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-socinfo.yaml
> new file mode 100644
> index 000000000000..4420430a9bca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-socinfo.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mtk-socinfo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SOC information
> +
> +maintainers:
> +  - William Lin <william-tw.lin@mediatek.com>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Kevin Hilman <khilman@kernel.org>
> +
> +description:
> +  The MTK socinfo driver can retrieve several

Driver? As in Linux driver? Drop. Describe hardware instead.

> +  SoC related information based on settings in eFuse.
> +  Such information include manufacturer information, SoC name,
> +  SoC segment name, and SoC marketing name.
> +
> +

Just one blank line.

> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8173-socinfo
> +      - mediatek,mt8183-socinfo
> +      - mediatek,mt8186-socinfo
> +      - mediatek,mt8188-socinfo
> +      - mediatek,mt8192-socinfo
> +      - mediatek,mt8195-socinfo
> +
> +

Ditto...


> +  nvmem-cells:
> +    description:
> +      Phandle to the eFuse data for SoC differentiation.
> +    items:
> +      - description: eFuse data that mtk-socinfo driver uses for SoC differentiation
> +
> +  nvmem-cell-names:
> +    minItems: 1
> +    items:
> +      - const: socinfo-data1
> +      - const: socinfo-data2

This does not match your cells.

> +
> +required:
> +  - compatible
> +  - nvmem-cells
> +  - nvmem-cell-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        mtk_socinfo: socinfo {

Broken indentation.

> +            compatible = "mediatek,mt8186-socinfo";
> +            nvmem-cells = <&socinfo_data1>;
> +            nvmem-cell-names = "socinfo-data1";

No other resources? So this is just DT description of driver? Does not
look like suitable for DT in the first place.



Best regards,
Krzysztof


