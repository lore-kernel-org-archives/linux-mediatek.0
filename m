Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2e5EJjx+VhJd3GTQ6hKkOZWp+SzoYcOpWWwEuhQ81Rc=; b=s6vzc6kZ5J88gM
	Rk3wwL+o1qK76amA2yREWAM9KQEECifq0UtIAGl/W/JuHQsqsfm5QUoYMsapvSmHjOmkpGD9ce1KZ
	16Z3Tpnm+TvhdL103F7gZQSnZ6zFjDlJnEifnYogmhxhrFM/YmLVFLbtndLEPh7yvHF1zNf4Ttbm1
	+jVoEDRzIs3LpZlwqghtw/0n/Yln/in0LE2KYu6gzCzLrrfCZkgzliIur8cFM+m6BWZdbLgXSPLj7
	2skIA8miOQxqxESAesz9qqXvD4qR29NbTzJcGD0yx/oz4OyNwNM73/tnxcpBpvXP3LpQpS/GmiAgr
	UZU7+XeB2/iX5KIdZ3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWsz-00Dz6y-SD; Mon, 14 Feb 2022 08:39:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWb0-00DrRJ-L8; Mon, 14 Feb 2022 08:20:32 +0000
X-UUID: 4ff26c297c0c414aa971983b328d3787-20220214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TyW11hI1QlMih50FqZY/kigYw1QDgTg54fv/na0bpSo=; 
 b=JInQnR5IF1k1j2LY0K9OBcvpm4I6qdFcYgXnb5KFaMJVGHazL6mbsca2nPrpUBSrag95j8QobEiTqjJx+UnqBqfSYIh7daILiqJVWWB3/sbgqY5yhtVpVF/hz4CJchX+/T6Suj7BcWqBtA3xKkHwUihg0pxuom/VM42MVqa1EMI=;
X-UUID: 4ff26c297c0c414aa971983b328d3787-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 490565267; Mon, 14 Feb 2022 01:20:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 00:17:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Feb 2022 16:17:29 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 16:17:27 +0800
Message-ID: <19bec780f6d27983e9b62afed8fff4c0f988946b.camel@mediatek.com>
Subject: Re: [v1, 1/3] dt-bindings: display: mediatek: dsi: add
 documentation for MT8186 SoC
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <jitao.shi@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 14 Feb 2022 16:17:35 +0800
In-Reply-To: <846d50400a14129c5ff7f7acb2b23f9f4658d11f.camel@mediatek.com>
References: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
 <1643283773-7081-2-git-send-email-xinlei.lee@mediatek.com>
 <846d50400a14129c5ff7f7acb2b23f9f4658d11f.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_002030_743264_47097596 
X-CRM114-Status: GOOD (  19.58  )
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

On Fri, 2022-01-28 at 13:08 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Thu, 2022-01-27 at 19:42 +0800, xinlei.lee@mediatek.com wrote:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > Add binding documentation for the MT8186 SoC.
> 
> DPI has a yaml format document, so I would like DSI also has a yaml
> format document.
> Please send a patch to transfer DSI document to yaml, and then apply
> this patch to yaml document.
> 
> Regards,
> CK
> 
Hi, CK:

I have prepared DSI document to yaml, and will sent it out in the next
edition.
Thanks for your suggestion.

Best Regards!
xinlei
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.tx
> > t
> > > 2 +-
> > 
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > index 36b0145..c82b8b2 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > @@ -7,7 +7,7 @@ channel output.
> >  
> >  Required properties:
> >  - compatible: "mediatek,<chip>-dsi"
> > -- the supported chips are mt2701, mt7623, mt8167, mt8173 and
> > mt8183.
> > +- the supported chips are mt2701, mt7623, mt8167, mt8173, mt8183
> > and
> > mt8186.
> >  - reg: Physical base address and length of the controller's
> > registers
> >  - interrupts: The interrupt signal from the function block.
> >  - clocks: device clocks
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
