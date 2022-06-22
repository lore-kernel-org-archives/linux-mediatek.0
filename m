Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D68C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 02:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iurm+CECXSPHqS/alPOZiIR3pzc+9y8rVamV3Foqbig=; b=wP0/wmzL/m7OjWl1OxtCnSQdZ6
	2su91DjBoIAcr5p3RWhyErLpUzKDKJthKwVQqwlo2uwQB+VxUnr5rzFd3LL4qdyeRtW//JGIbpswP
	x5m7v/uOqiO0oM6zek8W6YcnBnF9MAMShSaZEFnjF9ZWnZV7Q50eiRxA4IH9Yu+IN/dNO+APN5nfQ
	IsfjSKwVh9g3IZ05teZfnzHWZNlCobkfOwuDtq16gXZayNJt9v+dokpXz/QEyl3geqM6EaZSkckfa
	MzPRDc/DX9zgrI4dpd1YbQCBuBZHF5opIgMYKUEZ6UVdnOzStQY8m/MXw4ZsZOpR7UcCwziA/BkGE
	O/m2+yaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3qDk-008BCz-1u; Wed, 22 Jun 2022 02:35:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3qDg-008BCS-RL; Wed, 22 Jun 2022 02:35:54 +0000
X-UUID: a69d96e4ec2746f18ace8ca6a64e02e4-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:2c05b7dd-4d71-47da-bcf9-f163b1190c41,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:b14ad71,CLOUDID:a4941e38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a69d96e4ec2746f18ace8ca6a64e02e4-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1147720501; Tue, 21 Jun 2022 19:35:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 19:32:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 10:32:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 10:32:14 +0800
Message-ID: <efd33799d1b7da447113c6edd6cf7409b05e3f3d.camel@mediatek.com>
Subject: Re: [PATCH v13 01/14] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 22 Jun 2022 10:32:14 +0800
In-Reply-To: <20220621113732.11595-2-rex-bc.chen@mediatek.com>
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
	 <20220621113732.11595-2-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_193552_920579_7BCA301A 
X-CRM114-Status: GOOD (  23.62  )
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

Hi, Bo-Chen:

On Tue, 2022-06-21 at 19:37 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature
> set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> In this patch, we also do these string replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.

I would like one patch do one thing. The patch title is "Add DP_INTF
compatible" so it would not imply refining the case of "MediaTek". So
separate this to an independent patch.

Regards,
CK

> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++---
> --
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> index 77ee1b923991..5bb23e97cf33 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> @@ -4,16 +4,16 @@
>  $id: 
> http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: mediatek DPI Controller Device Tree Bindings
> +title: MediaTek DPI and DP_INTF Controller
>  
>  maintainers:
>    - CK Hu <ck.hu@mediatek.com>
>    - Jitao shi <jitao.shi@mediatek.com>
>  
>  description: |
> -  The Mediatek DPI function block is a sink of the display subsystem
> and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> parallel
> -  output bus.
> +  The MediaTek DPI and DP_INTF function blocks are a sink of the
> display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422
> pixel data on a
> +  parallel output bus.
>  
>  properties:
>    compatible:
> @@ -24,6 +24,7 @@ properties:
>        - mediatek,mt8183-dpi
>        - mediatek,mt8186-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dp-intf
>  
>    reg:
>      maxItems: 1
> @@ -55,7 +56,7 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
>        Output port node. This port should be connected to the input
> port of an
> -      attached HDMI or LVDS encoder chip.
> +      attached HDMI, LVDS or DisplayPort encoder chip.
>  
>  required:
>    - compatible


