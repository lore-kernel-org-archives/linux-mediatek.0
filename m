Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84DC25B0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 03:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxniUy+/X99gAlGwCbWLlenlcjZNB+qTT48tMczTJeM=; b=tIuSHbbE8xq0Emnens+Pmjzmhj
	abOF/AleKTsWhaB2ZCyNGBdDKb3xqoq9o3BpV9QyYakzsDlUhP4YEZ+RpZv0G9qM5CjftoG9iaGch
	sppivFhBS2hWnAJ6lm0RFNoJvcGI1CfjQgK2x2UM7OVX1ttfMO5xEpOcGLg8bx1DBF17skMww42CQ
	2l/10TyhurVuqE1270BHrdt55mUmAXU/L1m/1ROn0aQNmw1NAzf0uETR2yEImRiCDwuHhNolGYPBh
	IuAps+tG54zfrSmoFclSCXf8VO1a5lRej8onuBalTD17gRQutKnpwxW5njMMf24I8FVxJRRNIMG7+
	+Nm7jYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO9W9-009cS3-1Z; Wed, 17 Aug 2022 03:14:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO9Vv-009cAI-UJ; Wed, 17 Aug 2022 03:14:42 +0000
X-UUID: 6df1966f502b4afbb8dac37774a6c6ba-20220816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DxniUy+/X99gAlGwCbWLlenlcjZNB+qTT48tMczTJeM=;
	b=jSsti5YQoBF3UZa4UiISJl+jMVgBi1Nu/koitx69bT3MU9bD2KFMui9Z6TwxDxAcxhmXBf5j1eY0GLvl1sRRc0bKS8JzQV1UpAddojxyvr85cEDGjKpZOVEb9J9XhJpZwVCKaRVB0UJobEB3SAfb67KP4N1PZsecC2DrdxPgnvg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:4237388a-af95-4e6a-8f51-5fefddbb642d,OB:0,L
	OB:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:2,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:2
X-CID-META: VersionHash:84eae18,CLOUDID:55aae29c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6df1966f502b4afbb8dac37774a6c6ba-20220816
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1068880155; Tue, 16 Aug 2022 20:14:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 17 Aug 2022 11:13:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 17 Aug 2022 11:13:46 +0800
Message-ID: <e330820facd95af02e491bffd41aa9f468d8751e.camel@mediatek.com>
Subject: Re: [PATCH v4] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	<Rex-BC.Chen@mediatek.com>, <TingHan.Shen@mediatek.com>,
	<Liju-clr.Chen@mediatek.com>, <Jian.Yang@mediatek.com>
Date: Wed, 17 Aug 2022 11:13:46 +0800
In-Reply-To: <20220802120624.19258-1-jianjun.wang@mediatek.com>
References: <20220802120624.19258-1-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_201440_032633_A40EA44A 
X-CRM114-Status: GOOD (  20.84  )
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

Hi Maintainers,

Gentle ping for this patch, if there is anything I need to modify,
please kindly let me know.

Thanks.

On Tue, 2022-08-02 at 20:06 +0800, Jianjun Wang wrote:
> MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as
> MT8192.
> 
> Also add new clock name "peri_mem" since the MT8188 and MT8195 use
> clock
> "peri_mem" instead of "top_133m".
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
> Changes in v4:
> Remove "items" for "mediatek,mt8192-pcie" since it only have one
> item.
> 
> Changes in v3:
> Use enum property to add the new clock name.
> 
> Changes in v2:
> Merge two patches into one.
> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 13
> +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-
> gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-
> gen3.yaml
> index 0499b94627ae..c00be39af64e 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,7 +48,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8192-pcie
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-pcie
> +              - mediatek,mt8195-pcie
> +          - const: mediatek,mt8192-pcie
> +      - const: mediatek,mt8192-pcie
>  
>    reg:
>      maxItems: 1
> @@ -84,7 +90,9 @@ properties:
>        - const: tl_96m
>        - const: tl_32k
>        - const: peri_26m
> -      - const: top_133m
> +      - enum:
> +          - top_133m        # for MT8192
> +          - peri_mem        # for MT8188/MT8195
>  
>    assigned-clocks:
>      maxItems: 1
> @@ -126,6 +134,7 @@ required:
>    - interrupts
>    - ranges
>    - clocks
> +  - clock-names
>    - '#interrupt-cells'
>    - interrupt-controller
>  


