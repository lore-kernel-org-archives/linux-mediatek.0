Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95DEC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXWsCDJZbVRxP7xR4C+U6rZt5JnCuCWDrPBReQRj/tw=; b=daBq2EmofgCnqGsJ25J5+ploxW
	dAsc9Vzcy6n8o6Z/eQo47+7uFmaYcMjwJ1vo3lplXM0zJ+1xsMVL/ovJCb2ihgrMUBnwP34uOBivE
	knXZyHJT55tzZ12pLfBvl5QnbBZ60E4/XPhB6rh8HEd/wIz7xn1u3uNJS1ebEZ5RjGFIFsjyFSmqp
	g+U5SjUmllL/pacF6D8IG6UGGQ8iBEIqYk+kIHJ4QibgJiKZqdjLBSffXTu8uXKSmuz4v7nzznjZm
	Qg8NQloOtZmZ2UGL/SzRSd6h60NggcXlgGFjhcmetB92kR2z5SMIzBHkudLuO9uG9MRiKR+jMBpfC
	9BKEpf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9oP-00656Q-C2; Wed, 20 Jul 2022 13:32:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9nk-0064Vh-HY
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 13:31:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id h8so3426161wrw.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jXWsCDJZbVRxP7xR4C+U6rZt5JnCuCWDrPBReQRj/tw=;
        b=fnqIuK/upZAzWSdv8c4Xn98IfAXMtNBC8vAlR5vrMj/2du3XqOPwte1qjMrWLuHE0i
         LIep0Sv1eq7e349LCymGOYm4TUYeyyoDRHZRsmdkOAZeb9iaBgagQLzmDiHToHZAfxRM
         ihx0hQHCepa1CFN2KrYqjfkjfgJACbdUXcIN+5R0y+Lj61RFQK78ZqtbhybUgIgpuG2J
         q+P6QZS4cDKhCHBcdADaCSc47eHksNAsFQlFoJw1+5UU4S7r0y39wr3Pb3wbazLMlntE
         5V5mPFz7By2zGpfa7PTaOGWO23THWYxm8j3qEuzs9U0r//i84t+1A7L6lM7C0McnNL2C
         BdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jXWsCDJZbVRxP7xR4C+U6rZt5JnCuCWDrPBReQRj/tw=;
        b=RWaIe6qi3IHrW5zxonAVJ8F+lPnkEisxSej0vGYpG+1l7qDUT4+jlOvNAGGdxUYHEy
         cPI9HHlyaJXED7RhnDX7PbZMC9snFUdGLtgnvs0QwXPKk6pcWYHr1a0OwhS5sxITQxUG
         pVue5lkJcjcVyUiN5VbxsiIjoBk91nx6JF0/CrGMyOkMQcHtqkmOsRDaTJmOqE2ARRef
         d3lCZiGyaAqTMBYqOjiml2Gz1X9XSucdfykz98mFSn7s2zr3oX5toh+aeT6MzkkpwHBf
         y6mzFLL/r830nagsPzQHi4HRFjAzTC7DsvbQmnucCqqnEbmmIU3GLDQTJSmvd3xdixBl
         WIgQ==
X-Gm-Message-State: AJIora+fxA4OQ19/H68UB6KDglvxsabkLPtggKOF1I8HuZNAT72yDMG1
	t1FlmQRCKAQiR/QS3PSodp21hg==
X-Google-Smtp-Source: AGRyM1tyvKXKdPUtTzvOARCZKmziYzkJtcJwILxnHRLAiFVCrIOmOWmx0ChdTjh6M2BY6gcYj8q5AA==
X-Received: by 2002:a5d:4447:0:b0:21d:6b84:4678 with SMTP id x7-20020a5d4447000000b0021d6b844678mr28881929wrr.668.1658323902346;
        Wed, 20 Jul 2022 06:31:42 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b003a31fd05e0fsm9520548wms.2.2022.07.20.06.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:31:41 -0700 (PDT)
Date: Wed, 20 Jul 2022 14:31:39 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 06/21] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Message-ID: <YtgDu70Lpl/uPOkf@google.com>
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-7-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220720123023.13500-7-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_063144_710065_55DEDE81 
X-CRM114-Status: GOOD (  17.26  )
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

On Wed, 20 Jul 2022, Tinghan Shen wrote:

> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. Add the bindings for it.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Why have you ignored my review comments from v2?

> ---
>  .../bindings/mfd/mediatek,mt8195-scpsys.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> new file mode 100644
> index 000000000000..4117a6dbc19c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
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
> +      - enum:
> +          - mediatek,mt8167-scpsys
> +          - mediatek,mt8173-scpsys
> +          - mediatek,mt8183-scpsys
> +          - mediatek,mt8192-scpsys
> +          - mediatek,mt8195-scpsys
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^power-controller(@[0-9a-f]+)?$":
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
> +        compatible = "mediatek,mt8195-scpsys", "syscon", "simple-mfd";
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

