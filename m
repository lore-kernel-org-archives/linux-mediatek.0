Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B95C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 05:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bd8t154sSz7FbTrreTjo3pdpmx7lEzHvuRzt3e39F9E=; b=kAhznOuHg18LAw
	SzHjl1LTfKn68bMd5kZjsixf7QmzIgCiOVRPG9HoNBgEts3ewu7hWYALqeFCmXORXHE5JBHZ851Q1
	4RsPFrqccpzvquimTegJBBuWr0Gmxv45c99HLZmJ9gFeRpA88LRTSfbc+lGYK87skvdD8MT7CkeXU
	PJk3UP2Y+maciKzP5rq6EhV9D78hWcIQSK5TFxciKoc8oqjUZ5W02tDeTqk6xJLUlIrLIUOzJvdTd
	ZOHRosF7XvWFN9hOlMqZpbP20hEF962T4oaH6WGF+nOiwWDC45ocDmCjUomN6gA87qLNYVNCT2uM9
	rSu9yuj2uswDYGTjSVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJUc-000Ppz-Sk; Fri, 28 Jan 2022 05:08:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJUZ-000PpD-Hn; Fri, 28 Jan 2022 05:08:12 +0000
X-UUID: 8d80672b1fb644e5bb35ee0f3020fe2b-20220127
X-UUID: 8d80672b1fb644e5bb35ee0f3020fe2b-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 750088929; Thu, 27 Jan 2022 22:08:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 21:08:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 28 Jan 2022 13:08:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 13:08:03 +0800
Message-ID: <846d50400a14129c5ff7f7acb2b23f9f4658d11f.camel@mediatek.com>
Subject: Re: [v1, 1/3] dt-bindings: display: mediatek: dsi: add
 documentation for MT8186 SoC
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <jitao.shi@mediatek.com>
Date: Fri, 28 Jan 2022 13:08:03 +0800
In-Reply-To: <1643283773-7081-2-git-send-email-xinlei.lee@mediatek.com>
References: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
 <1643283773-7081-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_210811_623624_D64F317F 
X-CRM114-Status: GOOD (  16.06  )
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

Hi, Xinlei:

On Thu, 2022-01-27 at 19:42 +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add binding documentation for the MT8186 SoC.

DPI has a yaml format document, so I would like DSI also has a yaml
format document.
Please send a patch to transfer DSI document to yaml, and then apply
this patch to yaml document.

Regards,
CK

> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index 36b0145..c82b8b2 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -7,7 +7,7 @@ channel output.
>  
>  Required properties:
>  - compatible: "mediatek,<chip>-dsi"
> -- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
> +- the supported chips are mt2701, mt7623, mt8167, mt8173, mt8183 and
> mt8186.
>  - reg: Physical base address and length of the controller's
> registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
