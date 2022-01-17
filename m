Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuUh04ZvUsM0rB0vTok5+W+2pYlQ5APC/vc7+7FBCx4=; b=muHW4tpeezXLwi
	x3jtLIb2EnlZzYFNqkRcoEMUi83atdsefuB6UVpqR52tEOaUlfr8K+gnXPQTKIaIi+XFdcp79B80y
	RYSCFX/i5fBl2So6E3q20RnNiifhU/C1q3tBtLIJWfR324mdANaDwUnmAewtdm6THqDCzlf+S9JrZ
	S9k922ghTZkmFmVkSY9NPvadlwezBGO4K/O0mP5RgFB1WXFIphFIm/3wYePcsw8xWMz3ePwH7Idsc
	/XI13OJ3Sil27eiGplUu9G2t1/FOQsuNvTa/P2wRibOjx81MITM8c6x6d/UHOTeomPdYqU7T2T5gx
	JZZpT9aKy7Jzyn2lXHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9HbP-00DGEA-G5; Mon, 17 Jan 2022 02:18:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9HbK-00DGDX-HR
 for linux-mediatek@lists.infradead.org; Mon, 17 Jan 2022 02:18:33 +0000
X-UUID: f23ee1c0deed436ca4873ae1a37dd612-20220116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mcv14FXwpeuGqmFlD+a0NStalcTmRyIh7HIvXWtaWss=; 
 b=crwcPGk7oFuInIdUPUe7beUh4/Q2ZN4m1Se4HQ6oxikrP+5fv6d1mnsv9u4pOBmV+DgSedwThpceq92nw8a+NBxAIUlYW6ykEbw8LT6Q39emVBrUL+DPsIlubzZakfRYWQGQ1FVhbRstmsMKRiD5Pnp3L/1J1StB3FLk46tLFrQ=;
X-UUID: f23ee1c0deed436ca4873ae1a37dd612-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1513493068; Sun, 16 Jan 2022 19:18:26 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 18:08:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Jan 2022 10:08:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 10:08:22 +0800
Message-ID: <20787c8167f6ae96ce36e98692a5f729996d7d43.camel@mediatek.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: spi: add mt8186-nor compatible string
From: Guochun Mao <guochun.mao@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, Bin Zhang
 <bin.zhang@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>
Date: Mon, 17 Jan 2022 10:08:22 +0800
In-Reply-To: <CAL_JsqK+Mx4juudKmdpaSPyqxgATQZs9Bf052WWoOJQgb_3oJA@mail.gmail.com>
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
 <20220114062408.9077-2-guochun.mao@mediatek.com>
 <CAL_JsqK+Mx4juudKmdpaSPyqxgATQZs9Bf052WWoOJQgb_3oJA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_181831_996584_20481339 
X-CRM114-Status: GOOD (  20.33  )
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


Hi Rob,

Thanks for your comments.


On Fri, 2022-01-14 at 08:54 -0600, Rob Herring wrote:
> On Fri, Jan 14, 2022 at 12:24 AM <guochun.mao@mediatek.com> wrote:
> > 
> > From: Guochun Mao <guochun.mao@mediatek.com>
> 
> Use get_maintainers.pl and send to the right lists.
> 

I have already used get_maintainers.pl to get maintainers list.
It shows like this,

./scripts/get_maintainer.pl 00*

Mark Brown <broonie@kernel.org> (maintainer:SPI SUBSYSTEM)
Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC
support)
Bayi Cheng <bayi.cheng@mediatek.com> (in file)
Chuanhong Guo <gch981213@gmail.com> (in file)
linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
support)
linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
support)
linux-kernel@vger.kernel.org (open list)

If you think I need add more reviewers,
could you give me the names who I need to add to these mails?
thanks.

> > Add MT8186 spi-nor controller support.
> > MT8186 needs a new clock name, axi_s, for spi nor axi slave bus
> > clock.
> > 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> > Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
> > ---
> >  .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml         | 4
> > ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mtk-nor.yaml
> > index 4e4694e3d539..1a678751bcca 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
> > nor.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
> > nor.yaml
> > @@ -30,6 +30,7 @@ properties:
> >                - mediatek,mt7622-nor
> >                - mediatek,mt7623-nor
> >                - mediatek,mt7629-nor
> > +              - mediatek,mt8186-nor
> >                - mediatek,mt8192-nor
> >                - mediatek,mt8195-nor
> >            - enum:
> > @@ -49,6 +50,8 @@ properties:
> >        - description: clock used for controller
> >        - description: clock used for nor dma bus. this depends on
> > hardware
> >                       design, so this is optional.
> > +      - description: clock used for controller axi slave bus. this
> > depens
> > +                     on hardwre design, so this is optional.
> 
> typos.
> 

I'll fix it next version.

thanks.


> > 
> >    clock-names:
> >      minItems: 2
> > @@ -56,6 +59,7 @@ properties:
> >        - const: spi
> >        - const: sf
> >        - const: axi
> > +      - const: axi_s
> > 
> >  required:
> >    - compatible
> > --
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
