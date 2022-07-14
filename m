Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B358CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZbm5v8jczB3m3Zbghv7hORrbzz+8TA8A7EGSVhjSaQ=; b=Rj0isLpQsxnJ/gvrR/lOlZcy4C
	9ZpE9py8ulPC9nLNzwMc++ZOpuQxLe1/Ky2CWz9pM9Xe6CoR1v2X85v9AqhZvsiSBQ+PRWqD6n+uC
	teEb9d+QJcLC6r1279hi+x6vaHJAOkPqTvMdGTlM8yF/11HuZoHy+XBJOGeQubCa3qSrjpfpt+/A0
	xnuQ+pNcfrIlfPerexgZLhGb9TU4Rtt4qkuGfuduxNRf62R8lBtmuESYkKPvlQKxYGtElaVJHkxHq
	HQRQA1SafKH5IN5uJap1MTd1m+yTZotvueuMxutQv7JpuUlPVH7wOz/NR6nekJUFHMVv5GinjhWDd
	fVia8Wig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBz30-00Emxi-V2; Thu, 14 Jul 2022 13:38:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBz2x-00EmtZ-4L
	for linux-mediatek@lists.infradead.org; Thu, 14 Jul 2022 13:38:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bu1so2586211wrb.9
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Jul 2022 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gZbm5v8jczB3m3Zbghv7hORrbzz+8TA8A7EGSVhjSaQ=;
        b=QhSFR35ht5QEM5YZF2rpDWTzxDIE4nFn1yZhWPiMSFmnpD/aDrZwGNbmNuamkHO1XF
         1J4UOj7++gNdTSdZuPgzZvkbRoyZHLZhZb+N2JoI+nCcDQNaD/P8pQ75/GdD+ScQdwp0
         59oDsFg3whwkWU97Rsn5CqHobBGGRYbjWrEOyblVdLZNk34xQRMRGkLoLnzSInu0dPKM
         aZVXK/Fey7k6krYGdUv3TzlEFgETj7JSuoN7kMMtQTCiSSFwqaHVrKTyYziyVfG2EiGk
         5krBajsYVkRMa+oEMQTmJz40cEHzkpD5xdRKxpWJyH+LvNS6bhqZzJy1pKjOn59iCwTx
         9c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gZbm5v8jczB3m3Zbghv7hORrbzz+8TA8A7EGSVhjSaQ=;
        b=kzjsXi7kDtpN+nWIrt8uh+7aao3+CwOF8XXEYL/X4RSpfOzwJBtEqJx5K8rTVM/HOv
         wsi11aZH2y8STis7bIsipeIGrz5Vu75jCKK44GXmSc2GHQYLbvLielv3pew8Fs1vke88
         n5TnUIpTkHaXqkEnMSeDP57X1tD6azN7SX9Zj/E1P8EVrm1H/sXH/UsiUoMmDMpvA8uK
         zdZkaXhr1lkJslG7VnEWwa7ncJAMRmLbkQQuCTZCECenGC8xzGi6jJe9bxoutQY265tu
         BlmI/hgD95yOWogAkU7LIiGEhNKyhb8antw60xPxMFYOEQYzJEQPh3tntZHETvuMRWLR
         fX+A==
X-Gm-Message-State: AJIora8VmU3QF0drEov81GX3PKkqjd7yyQ0XFa7Dn3DU5OU+YNYYYf0P
	KYXs0DyrSX3iZ54GAgbj2gqtbw==
X-Google-Smtp-Source: AGRyM1uxSpQQUohZAVCvRDTDUH1kMNPkjZLHzaAqEsW41la3u7tmhLBotyjHD8UJYEkeF4RD+P0HJw==
X-Received: by 2002:a05:6000:81d:b0:21d:a495:6e3 with SMTP id bt29-20020a056000081d00b0021da49506e3mr8401904wrb.502.1657805903332;
        Thu, 14 Jul 2022 06:38:23 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b003a2ec73887fsm8793750wmq.1.2022.07.14.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 06:38:22 -0700 (PDT)
Date: Thu, 14 Jul 2022 14:38:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 03/19] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Message-ID: <YtAcTCUsy9I67L3V@google.com>
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220714122837.20094-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_063827_202632_70613436 
X-CRM114-Status: GOOD (  17.43  )
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

Subject line should be 'mfd', rather than 'power'.

On Thu, 14 Jul 2022, Tinghan Shen wrote:

> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. Add the bindings for it.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/mfd/mediatek,scpsys.yaml         | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> new file mode 100644
> index 000000000000..a8b9220f2f27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,scpsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Control Processor System
> +
> +maintainers:
> +  - MandyJH Liu <mandyjh.liu@mediatek.com>
> +
> +description:
> +  MediaTek System Control Processor System (SCPSYS) has several
> +  power management tasks. The tasks include MTCMOS power
> +  domain control, thermal measurement, DVFS, etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,scpsys
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-controller:
> +    $ref: /schemas/power/mediatek,power-controller.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    syscon@10006000 {
> +        compatible = "mediatek,scpsys", "syscon", "simple-mfd";

Not sure you need bindings for this.  Seems overkill.

I'll let the DT guys have the final say though.

> +        reg = <0x10006000 0x100>;
> +
> +        spm: power-controller {
> +            compatible = "mediatek,mt8195-power-controller";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            #power-domain-cells = <1>;
> +
> +            /* sample of power domain nodes */
> +            power-domain@MT8195_POWER_DOMAIN_PCIE_PHY {
> +                    reg = <MT8195_POWER_DOMAIN_PCIE_PHY>;
> +                    #power-domain-cells = <0>;
> +            };
> +
> +            power-domain@MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY {
> +                    reg = <MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
> +                    #power-domain-cells = <0>;
> +            };
> +        };
> +    };

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

