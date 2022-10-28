Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEA3C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufhGul3EHDWt6vGqX7ebDIkN1/wWifIISfjdZ6no5xY=; b=jx/IiHNw8+iSXQ
	R+NB/fWbSnM2f7ZTx2mHEM64e++/ej12pwuM32k9d04JVOSRf2AoR8InA0hS0mF2TbqWEXp7SDk5C
	ZfCEcGrInkh/EzRTwkuAY5cR4TLmBqNpKyW3MU0/+OCh/B0/agkon9GSLHU9OaLzTK99Ez36yQ79U
	OG+YwG8i1M2BacxP79kW0RvdBuQcICYu4w4j5BCMIYp5w6VcK/r9IEvkl6tAHcDAebqLKYmDTokM5
	EVckuDIwYk0GDwenRoEczDYBwqP8C224CWnY0YlknYvxG/KASXszfWweROIIYZ6t8mkdwze35iGLh
	MA8GFdnDvKjlwnOBWEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLcr-00GJ6S-P5; Fri, 28 Oct 2022 09:26:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLcC-00GInT-OI; Fri, 28 Oct 2022 09:25:26 +0000
X-UUID: 786fd6cc515143168f0c992e02454b9c-20221028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ufhGul3EHDWt6vGqX7ebDIkN1/wWifIISfjdZ6no5xY=;
	b=grNzHjgJuxZmbVZ7R7lEWtBSoxPv1TzgR2jwaLNavK6X+cy4N5x2PgM0nvhI8GgjrugHH0NBorEUEKPyrvAlw8BMCxDVbQYKtVAc8uJdLXHu0TO7FnsrngEoOsn/UEViKrh3PFF5ndtXmcWnpIGsYyZ3Ex8agQW+CVPOcK8HcwY=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f273f604-922a-4c5b-b647-8ab307dbd32d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:49
X-CID-INFO: VERSION:1.1.12,REQID:f273f604-922a-4c5b-b647-8ab307dbd32d,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_HamU,ACTION
	:release,TS:49
X-CID-META: VersionHash:62cd327,CLOUDID:1112bfea-84ac-4628-a416-bc50d5503da6,B
	ulkID:221028172441ZCOWV2TN,BulkQuantity:1,Recheck:0,SF:38|28|16|19|48|102,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 786fd6cc515143168f0c992e02454b9c-20221028
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1117244053; Fri, 28 Oct 2022 02:25:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 28 Oct 2022 17:24:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 28 Oct 2022 17:24:37 +0800
Message-ID: <61c0b62af62ddd0e98378159db2b7d94022c9bf5.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: add SoC based
 clock config
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Frank Wunderlich <linux@fw-web.de>, <linux-mediatek@lists.infradead.org>
Date: Fri, 28 Oct 2022 17:24:36 +0800
In-Reply-To: <20221025072837.16591-2-linux@fw-web.de>
References: <20221025072837.16591-1-linux@fw-web.de>
	 <20221025072837.16591-2-linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_022524_864017_D27ED2F3 
X-CRM114-Status: GOOD (  18.95  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Frank,

After apply this patch, we found some dtbs_check error with the
following patch which adds the PCIe node for MT8195:

https://lore.kernel.org/linux-pci/20221020111925.30002-3-tinghan.shen@mediatek.com/

arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pcie@112f0000
: clock-names:        5: 'top_133m' was expected
    From schema: Documentation/devicetree/bindings/pci/mediatek-pcie-
gen3.yaml
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pcie@112f8000
: clock-names:        5: 'top_133m' was expected
    From schema: Documentation/devicetree/bindings/pci/mediatek-pcie-
gen3.yaml

Did you get the same error when adding the PCIe node for MT7986?

Thanks. 

On Tue, 2022-10-25 at 09:28 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> The PCIe driver covers different SOC which needing different clock
> configs. Define them based on compatible.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - fix typo in mediatek,mt8192-pcie
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 48 ++++++++++++++---
> --
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-
> gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-
> gen3.yaml
> index c00be39af64e..98d3f0f1cd76 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -43,9 +43,6 @@ description: |+
>    each set has its own address for MSI message, and supports 32 MSI
> vectors
>    to generate interrupt.
>  
> -allOf:
> -  - $ref: /schemas/pci/pci-bus.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -84,15 +81,7 @@ properties:
>      maxItems: 6
>  
>    clock-names:
> -    items:
> -      - const: pl_250m
> -      - const: tl_26m
> -      - const: tl_96m
> -      - const: tl_32k
> -      - const: peri_26m
> -      - enum:
> -          - top_133m        # for MT8192
> -          - peri_mem        # for MT8188/MT8195
> +    maxItems: 6
>  
>    assigned-clocks:
>      maxItems: 1
> @@ -138,6 +127,41 @@ required:
>    - '#interrupt-cells'
>    - interrupt-controller
>  
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8192-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: tl_96m
> +            - const: tl_32k
> +            - const: peri_26m
> +            - const: top_133m
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8188-pcie
> +              - mediatek,mt8195-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: tl_96m
> +            - const: tl_32k
> +            - const: peri_26m
> +            - const: peri_mem
> +
>  unevaluatedProperties: false
>  
>  examples:


