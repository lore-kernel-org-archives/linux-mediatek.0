Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6847CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 03:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmDueObW2hBIM61Iqqb0zxbDQQWu2mZZ6JU2igc/02w=; b=IvzwxrBIU/gs90
	KYn7VNDOYlJkxUTwre2AMEXZV1KrUAL0XLWm0BumNFYHJyVXig38i76n2vqplebPPsNq2f2fEgeNN
	t7F+/7daXEfs+2CKvFE+ZlZfJeR/gOv6i68yJ5V9V8xyUsZ7CPrmke4PFkyo7qk1YSCt+KmIB++mh
	LVOunKte3IsIxuSsZ4ocVRdIXbBgXqrqDYeTlg9bbT55cRfoHM72BaN9BqCyes8kGk0MLrg9sWkgU
	M9Lv7gC1FtlcFKTNLK/WB1dQFdrpRIx/bJMujylla4poc/tNNh+HnyK2H8TlmPn6sU92o3l3LwJQL
	dcB1HuCdd8fELkJqNK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbwMF-003atu-Mv; Wed, 06 Apr 2022 03:29:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbwM4-003apq-OI; Wed, 06 Apr 2022 03:29:14 +0000
X-UUID: 44ea479347b548609cd910bf94e3490f-20220405
X-UUID: 44ea479347b548609cd910bf94e3490f-20220405
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1957836181; Tue, 05 Apr 2022 20:29:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 20:29:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 11:29:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 11:29:04 +0800
Message-ID: <751374a287a70831c09da51daef1ee286285359b.camel@mediatek.com>
Subject: Re: [PATCH v10 2/4] dt-bindings: display: mediatek: change to use
 enum for mutex
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <krzysztof.kozlowski@canonical.com>,
 <airlied@linux.ie>, <jassisinghbrar@gmail.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <yongqiang.niu@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fparent@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 6 Apr 2022 11:29:04 +0800
In-Reply-To: <20220406030009.2357-3-rex-bc.chen@mediatek.com>
References: <20220406030009.2357-1-rex-bc.chen@mediatek.com>
 <20220406030009.2357-3-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_202912_840051_948F117E 
X-CRM114-Status: GOOD (  10.93  )
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

Hi, Rex:

On Wed, 2022-04-06 at 11:00 +0800, Rex-BC Chen wrote:
> All single entry cases in mutex can be merged as a single enum.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mutex.yaml      | 24 +++++++--------
> ----
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> index 00e6a1041a9b..b470fbb1b40a 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> @@ -23,21 +23,15 @@ description: |
>  
>  properties:
>    compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-mutex
> -      - items:
> -          - const: mediatek,mt2712-disp-mutex
> -      - items:
> -          - const: mediatek,mt8167-disp-mutex
> -      - items:
> -          - const: mediatek,mt8173-disp-mutex
> -      - items:
> -          - const: mediatek,mt8183-disp-mutex
> -      - items:
> -          - const: mediatek,mt8192-disp-mutex
> -      - items:
> -          - const: mediatek,mt8195-disp-mutex
> +    enum:
> +      - mediatek,mt2701-disp-mutex
> +      - mediatek,mt2712-disp-mutex
> +      - mediatek,mt8167-disp-mutex
> +      - mediatek,mt8173-disp-mutex
> +      - mediatek,mt8183-disp-mutex
> +      - mediatek,mt8192-disp-mutex
> +      - mediatek,mt8195-disp-mutex
> +
>    reg:
>      maxItems: 1
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
