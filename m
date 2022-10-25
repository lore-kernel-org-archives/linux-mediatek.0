Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C86FA373D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 01:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Gu0ND/jwgTDHnSCh5YQ1qm3jVdaf3TxXKNSqR5nggI=; b=tW3KCTdt5aZRoe
	uf+JMvcb53KS2gZo26AApsrnpfBeMPqp1e1pGE+zpf5/tczkrHG9MqTmv245IxY/Pz1pZnAkBAz+4
	jWZUzrsrDn6+k4Nz5iNn9iv7dUGQJBKnq+tuHp47uH59Z+hQCrM+emgRzc42CdxejglVcSlNIdGJH
	/uYxZkQ/2ZOHrCA60zCQ7MmSQxPXjg5QrhH066Rj9fXE5vuU0Mm2DynysudxC1E1prmglR3zoeWQu
	6GEbTCU+Pqe++71WkgcHRygvRmQ+/ZWgJ3W12zpS9XbpgSO5utctME9NrXYfXeUHMlWHeN2kUf7Z8
	bWHxAwQaJTJwcgYnyQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on8jx-003Xfe-7d; Tue, 25 Oct 2022 01:28:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on8jk-003Xcw-Q9; Tue, 25 Oct 2022 01:28:14 +0000
X-UUID: db51325fb4924ec2a5c1ee7aa4b251d5-20221024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6Gu0ND/jwgTDHnSCh5YQ1qm3jVdaf3TxXKNSqR5nggI=;
	b=Xo8v005oovr0OaDxPzDQ6sd8Pc042Z8bNtRsWhhxg4MOz67rVrOvahbshSLk27xS3jDlQQf/YJdSAZXxAdL+9/3W0ZYQZ1t66fUAovc097pquLrPwBegeFOUrX5Qxrqq+6Hej8L6f+wA0W87UWH/uH5gtAbrz0ovV6UyFtZRUes=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:e18119ca-7c29-4381-b16d-010878705d2a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:0c55f76c-89d3-4bfa-baad-dc632a24bca3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: db51325fb4924ec2a5c1ee7aa4b251d5-20221024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 113411026; Mon, 24 Oct 2022 18:28:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 25 Oct 2022 09:27:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 25 Oct 2022 09:27:28 +0800
Message-ID: <9759df8a6fbe30bfbd0df72793b751b7628006bc.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: PCI: mediatek-gen3: add SoC based
 clock config
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Frank Wunderlich <linux@fw-web.de>, <linux-mediatek@lists.infradead.org>
Date: Tue, 25 Oct 2022 09:27:27 +0800
In-Reply-To: <20221023170234.83621-2-linux@fw-web.de>
References: <20221023170234.83621-1-linux@fw-web.de>
	 <20221023170234.83621-2-linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_182812_886986_9F433AFC 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2022-10-23 at 19:02 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> The PCIe driver covers different SOC which needing different clock
> configs. Define them based on compatible.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 48 ++++++++++++++---
> --
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-
> gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-
> gen3.yaml
> index c00be39af64e..af0d2201746d 100644
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
> +            const: mediatek,mt8192-mmc

This should be "mediatek,mt8192-pcie".

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


