Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CDFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 02:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evmDwlv5Nzr/pOn8JFGI55PHq4ltYiOz9h+Y8d6Sz+A=; b=luVd4KkMatYj8p
	GdxCdcTw2WTKvC8ETz7pkt/7Y684x5R8Q1hx2e3voS5lLHRFFllhuQrrmn87B38+7a/5s7lR2wgS6
	5A12hgnGsM7MvxzIGW7KoS/2IHr7gWVX1BYeX0b9DqafgfjZBUK8/9c8ZfDTzbao9/JIHDgD5my5i
	8T7GcjfdEH/HCtkQ3R5lsjDY0/RXDNiTu+1YMAV4ooqH0nQcYxJPYg0nArm5opJznYNi+P7sg/aQT
	WfWmFJ+FJT9a1geT3yVzHMRAKm713l5l82kdydbBTc2YFZe18hl5eSsigEyub3z1F0hjZZ5KEsowm
	4bpnOAsb6kGfErSwrvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyP0W-0049vD-PO; Tue, 07 Jun 2022 02:31:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyP0K-0049sm-Jn; Tue, 07 Jun 2022 02:31:39 +0000
X-UUID: 54cb3b7da52043e6bd3c050bae6d899e-20220606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:d594bfc3-8e79-4ef8-81c7-c3a71898947a,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:2a19b09,CLOUDID:fecbdbe4-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 54cb3b7da52043e6bd3c050bae6d899e-20220606
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2045788746; Mon, 06 Jun 2022 19:31:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jun 2022 19:31:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 10:31:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jun 2022 10:31:21 +0800
Message-ID: <a86afcd38ce4243f86fddd1647129d64585e56d1.camel@mediatek.com>
Subject: Re: [PATCH v10 01/21] dt-bindings: mediatek,dpi: Add DPINTF
 compatible
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>, Jitao shi
	<jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>
Date: Tue, 7 Jun 2022 10:31:21 +0800
In-Reply-To: <c1dacdd0-f25e-a522-5d5f-1ef2fe297094@collabora.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-2-granquet@baylibre.com>
	 <c1dacdd0-f25e-a522-5d5f-1ef2fe297094@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_193136_719508_337F9D5B 
X-CRM114-Status: GOOD (  29.61  )
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

On Wed, 2022-05-25 at 13:55 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > DPINTF is similar to DPI but does not have the exact same feature
> > set
> > or register layouts.
> > 
> > DPINTF is the sink of the display pipeline that is connected to the
> > DisplayPort controller and encoder unit. It takes the same clocks
> > as
> > DPI.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >   .../bindings/display/mediatek/mediatek,dpi.yaml     | 13
> > ++++++++-----
> >   1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > index dd2896a40ff0..6d9f6c11806e 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > aml
> > @@ -4,16 +4,16 @@
> >   $id: 
> > http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> >   $schema: http://devicetree.org/meta-schemas/core.yaml#
> >   
> > -title: mediatek DPI Controller Device Tree Bindings
> > +title: mediatek DPI/DPINTF Controller
> >   
> >   maintainers:
> >     - CK Hu <ck.hu@mediatek.com>
> >     - Jitao shi <jitao.shi@mediatek.com>
> >   
> >   description: |
> > -  The Mediatek DPI function block is a sink of the display
> > subsystem and
> > -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> > parallel
> > -  output bus.
> > +  The Mediatek DPI and DPINTF function blocks are a sink of the
> > display
> > +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422
> > pixel data on a
> > +  parallel output bus.
> >   
> >   properties:
> >     compatible:
> > @@ -23,6 +23,7 @@ properties:
> >         - mediatek,mt8173-dpi
> >         - mediatek,mt8183-dpi
> >         - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dpintf
> >   
> >     reg:
> >       maxItems: 1
> > @@ -35,12 +36,14 @@ properties:
> >         - description: Pixel Clock
> >         - description: Engine Clock
> >         - description: DPI PLL
> > +      - description: Optional CK CG Clock
> >   
> >     clock-names:
> >       items:
> >         - const: pixel
> >         - const: engine
> >         - const: pll
> > +      - const: ck_cg
> 
> This is my understanding on how the DisplayPort Interface clocks work
> on 8195:
> 
> The "engine" clock is for the *VPP Engine's DisplayPort ip/block*,
> "pll" is for TVD PLL divider selection
> "pixel" is the gate for the pixel clock to the connected display.
> 
> "ck_cg" is useless, as that's the parent of "pixel" (and will always
> be)... for
> example, on mt8195... check clk/mediatek/clk-mt8195-vdo0.c - the
> CLK_VDO0_DP_INTF0_DP_INTF clock already has CLK_TOP_EDP as its
> parent, hence
> enabling the first will enable the latter.
> 
> That said... you can most probably avoid adding the ck_cg clock, as
> if you try
> to turn that off while it's in use by its children, you'll be only
> decrementing
> a refcount, but no "real action" will ever take place.
> 
> 
> Regards,
> Angelo

Hello Chunfeng and Angelo,

ck_cg is a clock gate, and I try to remove it from drivers but it's
failed to enable dp_intf.

the block diagram is:
1. 26M->CLK_APMIXED_TVDPLL1(pll)->CLK_TOP_EDP(pixel)-
>CLK_VDO0_DP_INTF0_DP_INTF(ck_cg)->dp_intf

2. VDOSYS clock->CLK_VDO0_DP_INTF0(engine)->dp_intf

"engine" and "ck_cg" are all clock gates which control the clock source
input to dp_intf.

Maybe we just need to rename it?
If so, what name do you think we should modify?

BRs,
Bo-Chen

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
