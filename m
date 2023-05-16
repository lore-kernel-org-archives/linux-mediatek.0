Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3D7C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGVHVtrJ1UKArOxL4QLZMf28fxPQFEoR2CUGleXHsCE=; b=vn/xeC4uBYv/rRNskJHa69Alv3
	KY66iXVCTYh1eA3AcNI4CV8Cy5uMEkoSNPA6dBSfFw51ApYWQUSgbCCv7VRscU5CPS6+9qwLyFuI2
	yjKDV9LruxVX/HR7wx1rAYjzPeaX+GDth11rsWnDHrx4McuoOSpbtkF/Wy8oXk5Ke9a+z7JYOJ2h0
	aIQCd82Tb223eLh9fc2vN3KC7R+RM58EkmvDQIdXQyHxM+kOMTtkShfXpSTVxKdJdilVug4QVrz/c
	EYHUiPJ+vcL3qDifwMO3MxzpeOwC8qcWPz5fYQlJnFnmCU3aUyv7LxSxTNKap5BKHMl/ugXyeMyKG
	Ha52vaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pypis-004mX5-2K;
	Tue, 16 May 2023 08:07:54 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pypip-004mUj-2J
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 08:07:53 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-965e93f915aso2469363266b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684224469; x=1686816469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGVHVtrJ1UKArOxL4QLZMf28fxPQFEoR2CUGleXHsCE=;
        b=JYKeiv25q8zcMTfIUxyjYba4uvXfSoqkHDtJ77yG0ETwlKFEKJjqoelz9b636iC43q
         NwEMGuL3OUF3SzHNkliudf9CiKYc6qoMpeWTKyembWNoR5IqXIwHlNiQI/Awpc3OhoJO
         zCZW6yrcE+nJ9fRDAxpuiEHuKdTaSIFd2AV//rWLqyTKlckm1sCblj2Z1pSieKU3zPOD
         iGT+3eB1+IgAlVjDXoSKiSeBb4xpMSUtOX/nWUY6QNb6u/8/0/UHnmQKMnon8fKW2sRl
         f04iL/5jEudZbK48jxYkajqRY1IfgMD+bUg21v3KlV2XH4+TsSACN7BmBDahKz8ZRdW/
         hKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684224469; x=1686816469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGVHVtrJ1UKArOxL4QLZMf28fxPQFEoR2CUGleXHsCE=;
        b=htD4OydgZqLaw6XqgtnXtb2ZtJXNZHst8VLfFt6IwF4Ru65pWBvN5MOw6XZYe0eVYN
         WwZr3ApycIB+hTnwk/iIVGhSVg4x2fpARUM9WQUk1DMPyb6v3I6ywzTvLdyFRUASkLaY
         VZDUU9ov9Lm4vWUUlkX4jQvfIPd4NgdUdoBGL08B8fA7XG6O0TK/FjOFmJNP9TuMg7os
         SAUXAty1scdclFLHB9/HMOYbAn/x8WhqtFyr3cRTJzjMQJHkeRSBsps8LZBT4WEds9+0
         SSRNeYCzvW6xf0L0TDW2VIN5TMOHZOBnlUmrOHBFHMPKePIwBi9JtUlEgx0HeSwCDJ8Z
         LMLg==
X-Gm-Message-State: AC+VfDyGBVyEYb2K9P7essO/Q4rCfBIxyCkMb3KJyJjomSElTfImVYqW
	B0di1PsVDYPYrf5Z7Vi4TYRG/SG4m6cMo/m74jM=
X-Google-Smtp-Source: ACHHUZ4yMXV4Sz3Qo41nq8QUnvqctZ1ziGdHs/WBNjiVR1F3sVaDjIntrsJJsddU6GfMFbs1vxI0IQ==
X-Received: by 2002:a17:907:360d:b0:94a:7979:41f5 with SMTP id bk13-20020a170907360d00b0094a797941f5mr30753341ejc.71.1684224469553;
        Tue, 16 May 2023 01:07:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4d4a:9b97:62e:1439? ([2a02:810d:15c0:828:4d4a:9b97:62e:1439])
        by smtp.gmail.com with ESMTPSA id i8-20020a056402054800b0050bd59fd0efsm7767851edx.49.2023.05.16.01.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 01:07:49 -0700 (PDT)
Message-ID: <ab9aa30f-82d7-1d14-5561-e19ff10af0b0@linaro.org>
Date: Tue, 16 May 2023 10:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add mediatek mipi csi driver v
 0.5
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: robh@kernel.org, chunkuang.hu@kernel.org,
 linux-mediatek@lists.infradead.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-2-jstephan@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515090551.1251389-2-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_010751_758162_2A7C9CB1 
X-CRM114-Status: GOOD (  21.13  )
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

On 15/05/2023 11:05, Julien Stephan wrote:
> From: Florian Sylvestre <fsylvestre@baylibre.com>
> 
> This adds the bindings, for the MIPI CD-PHY module v 0.5 embedded in
> some Mediatek soc, such as the mt8365
> 
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>

What are the changes? IOW: changelog here or in cover letter.

Subject: you have some multiple spaces.

Subject: drop driver. Bindings are not for drivers.

> ---
>  .../phy/mediatek,phy-mipi-csi-0-5.yaml        | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml b/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
> new file mode 100644
> index 000000000000..5aa8c0b41cdf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-Only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,phy-mipi-csi-0-5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Sensor Interface MIPI CSI CD-PHY
> +
> +maintainers:
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description:
> +  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
> +  receivers. The number of PHYs depends on the SoC model.
> +  Depending on the soc model, each PHYs can support CDPHY or DPHY only
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,phy-mipi-csi-0-5

SoC based compatibles. 0-5 is odd.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  mediatek,is_cdphy:

No underscores in node names.

> +    description:
> +      Specify if the current phy support CDPHY configuration

Why this cannot be implied from compatible? Add specific compatibles.


> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      mipi_rx_csi0: mipi_rx_csi0@11c10000 {

No underscores in node names. How this is v2?

> +        compatible = "mediatek,phy-mipi-csi-0-5";
> +        reg = <0 0x11C10000 0 0x2000>;
> +        status = "okay";

Drop

> +        mediatek,is_cdphy;
> +        #phy-cells = <0>;
> +      };
> +
> +      mipi_rx_csi1: mipi-rx-csi1@11c12000 {
> +        compatible = "mediatek,phy-mipi-csi-0-5";
> +        reg = <0 0x11C12000 0 0x2000>;
> +        status = "disabled";

???


Best regards,
Krzysztof


