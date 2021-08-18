Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87C2C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 04:46:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4E261056
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 04:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C4E261056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuwJaqe9PPl8AHJZx7ihQE809qWipjpm4Z0z7JBcOHQ=; b=EThcPuH3KzxNT+
	RYupz0dOlHnyT/xGtwTOxVdxHHN0sGppOcpyjlA6qj3aDCG0b0dYxx+qcQkAfSG34TsFJyfuLZa3D
	d0tvu23PLj9zmskTxYQPQfo6t3d/91HvC5tV4GVt/cdrfJibl5PlezIp0pLb1I5nTlg69kKxaLvwl
	ow+X4xCE4uTrO1m5tKcWdcNgSUxg4oQQMJ1cwCBnRhUMN7YD+M2FOxjE7kPJR6MXqg6QbpinbMHcK
	5O10D8bx/OQRGW5m5drq7DZ1J6RpfpB4FpKJeXEbaroYdTuJxLlCZAMcqsNdIAM1OteZM+k/e1can
	Vj3kcqiGfAcn5I5Xa4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGDSt-004AMv-VS; Wed, 18 Aug 2021 04:46:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGDSo-004ALX-D3; Wed, 18 Aug 2021 04:46:10 +0000
X-UUID: 1bd6bd5c41394580b78c60042a142afd-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gwefHctzxshOaf4fg4KkL1L7hvd5+4m+WWaOv+quqNM=; 
 b=ToLjk/B9DFglSQSn/31qLMqzxKNNBEb9k1VBIf+dg8k/sZFrIozvHsbctC2nh6VdkcCPSAdo1HjXN3RkziqLilC2CmjFCQOpiljm9LpNNpvaIaDgmR1C+l6IyHbeUvlEGFZVbOPoJfYJzKEPHuYAtfLIeCdQBUz6RUat8N8tHEY=;
X-UUID: 1bd6bd5c41394580b78c60042a142afd-20210817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2109714098; Tue, 17 Aug 2021 21:46:00 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 21:45:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 12:45:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 12:45:45 +0800
Message-ID: <1629261946.11678.5.camel@mtksdaap41>
Subject: Re: [RFC PATCH 1/5] dt-bindings: mediatek,dpi: Add mt8195 dpintf
From: CK Hu <ck.hu@mediatek.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 18 Aug 2021 12:45:46 +0800
In-Reply-To: <20210816192523.1739365-2-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-2-msp@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_214606_472442_DE1FC2DE 
X-CRM114-Status: GOOD (  19.73  )
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

Hi, Markus:

On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is similar to the actual dpi. They differ in some points
> regarding registers and what needs to be set but the function blocks
> itself are similar in design.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 48 ++++++++++++++++---
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index dd2896a40ff0..de4bdacd83ac 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,7 +4,7 @@
>  $id: https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml*__;Iw!!CTRNKA9wMg0ARbw!z5TyPvbq3ZLHjRPscOHigUMlikjhtJMFrEQqemcjQZa4NaXBE9tzMnDFMa1qYg$ 
>  $schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!z5TyPvbq3ZLHjRPscOHigUMlikjhtJMFrEQqemcjQZa4NaXBE9tzMnAjuBCxsg$ 
> 
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DP_INTF Controller Device Tree Bindings
>  
>  maintainers:
>    - CK Hu <ck.hu@mediatek.com>
> @@ -13,7 +13,8 @@ maintainers:
>  description: |
>    The Mediatek DPI function block is a sink of the display subsystem and
>    provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  output bus. The Mediatek DP_INTF is a similar function block that is
> +  connected to the (embedded) display port function block.
>  
>  properties:
>    compatible:
> @@ -23,6 +24,7 @@ properties:
>        - mediatek,mt8173-dpi
>        - mediatek,mt8183-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpintf

I've reviewed the modification in driver, it seems that dpintf is almost
the same as dpi. Why use the name "dpintf"? I could accept this name
only it's defined by hardware data sheet.

Regards,
CK

>  
>    reg:
>      maxItems: 1
> @@ -37,10 +39,11 @@ properties:
>        - description: DPI PLL
>  
>    clock-names:
> -    items:
> -      - const: pixel
> -      - const: engine
> -      - const: pll
> +    description:
> +      For dpi clocks pixel, engine and pll are required. For dpintf pixel, pll,
> +      pll_d2, pll_d4, pll_d8, pll_d16, hf_fmm, hf_fdp are required.
> +    minItems: 3
> +    maxItems: 8
>  
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -64,6 +67,39 @@ required:
>    - clock-names
>    - port
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-dpintf
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +          maxItems: 8
> +        clock-names:
> +          items:
> +            - const: pixel
> +            - const: pll
> +            - const: pll_d2
> +            - const: pll_d4
> +            - const: pll_d8
> +            - const: pll_d16
> +            - const: hf_fmm
> +            - const: hf_fdp
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: pixel
> +            - const: engine
> +            - const: pll
> +
>  additionalProperties: false
>  
>  examples:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
