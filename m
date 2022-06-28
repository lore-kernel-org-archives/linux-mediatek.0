Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 06:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X78eTb8Q2gabbv/xJ6loOKVtqKXMOdApAOEkgitbTZQ=; b=jVvpHh+knrjZ4dGOBulvJ3J2S6
	KrzQjrZwzIcYW1p6JdP0KQay/Lh0IXRBPd4LQx5gmfGTv/YgbaKd31Np2TGJST8evudPJGCBtaQ9l
	yLw4HJFiZeonL0XCx/17oLJrdRR1Xdf7pl39fKo84a7GphPKSBV9rzkVENcm1C9bCmYzq9GNqt9Ua
	5sc67yOdLwRgmIWf6a4xJfcO/j+0OEnx1yhycatZgDXLAfIPh+MYJ2VvAoqknNmM3APQTykedUn98
	X+xchSaoyCFDtLqJ3LD2xKIyw8C4LZKGEdh4Z8c6OOVhxk+EiHSUdJaqxFSsKeHQCYNQbJ1Hez6lt
	lqLsqjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64RZ-004boD-3D; Tue, 28 Jun 2022 06:11:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64Ft-004W20-IA; Tue, 28 Jun 2022 05:59:23 +0000
X-UUID: 4ffbbc6e770e4e03ae60f0cf63c9bcd4-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:51792cb6-d5bd-4329-bc29-7eb55967064b,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:87442a2,CLOUDID:d2b204d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4ffbbc6e770e4e03ae60f0cf63c9bcd4-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 748282303; Mon, 27 Jun 2022 22:59:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 13:54:24 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jun 2022 10:42:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 28 Jun 2022 10:42:54 +0800
Message-ID: <b025e0ffdedc46df69b08d39c1615d75c09f0774.camel@mediatek.com>
Subject: Re: [PATCH v14 01/15] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 28 Jun 2022 10:42:53 +0800
In-Reply-To: <5a5d11158dd45355e5e6c3b5decbe41495bd19ad.camel@mediatek.com>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
	 <20220624030946.14961-2-rex-bc.chen@mediatek.com>
	 <a2612c2628eefbbf909d4847b3d0067746813f33.camel@mediatek.com>
	 <5a5d11158dd45355e5e6c3b5decbe41495bd19ad.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225921_627244_FB3803D7 
X-CRM114-Status: GOOD (  28.09  )
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

On Mon, 2022-06-27 at 17:07 +0800, Rex-BC Chen wrote:
> On Mon, 2022-06-27 at 15:50 +0800, CK Hu wrote:
> > Hi, Bo-Chen:
> > 
> > On Fri, 2022-06-24 at 11:09 +0800, Bo-Chen Chen wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > DP_INTF is similar to DPI but does not have the exact same
> > > feature
> > > set
> > > or register layouts.
> > > 
> > > DP_INTF is the sink of the display pipeline that is connected to
> > > the
> > > DisplayPort controller and encoder unit. It takes the same clocks
> > > as
> > > DPI.
> > > 
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > [Bo-Chen: Modify reviewers' comments.]
> > 
> > Except this line,
> > 
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > 
> 
> Hello CK,
> 
> What do you mean?
> Do you mean I should drop this line?

Yes, drop this line. I think every patch is reviewed and modified, so
this line is redundant.

Regards,
CK

> 
> BRs,
> Bo-Chen
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11
> > > ++++++-
> > > --
> > > --
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .y
> > > am
> > > l
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .y
> > > am
> > > l
> > > index 77ee1b923991..8e526a4b134e 100644
> > > ---
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .y
> > > am
> > > l
> > > +++
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi
> > > .y
> > > am
> > > l
> > > @@ -4,16 +4,16 @@
> > >  $id: 
> > > http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >  
> > > -title: mediatek DPI Controller Device Tree Bindings
> > > +title: mediatek DPI and DP_INTF Controller
> > >  
> > >  maintainers:
> > >    - CK Hu <ck.hu@mediatek.com>
> > >    - Jitao shi <jitao.shi@mediatek.com>
> > >  
> > >  description: |
> > > -  The Mediatek DPI function block is a sink of the display
> > > subsystem
> > > and
> > > -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on
> > > a
> > > parallel
> > > -  output bus.
> > > +  The Mediatek DPI and DP_INTF function blocks are a sink of the
> > > display
> > > +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422
> > > pixel data on a
> > > +  parallel output bus.
> > >  
> > >  properties:
> > >    compatible:
> > > @@ -24,6 +24,7 @@ properties:
> > >        - mediatek,mt8183-dpi
> > >        - mediatek,mt8186-dpi
> > >        - mediatek,mt8192-dpi
> > > +      - mediatek,mt8195-dp-intf
> > >  
> > >    reg:
> > >      maxItems: 1
> > > @@ -55,7 +56,7 @@ properties:
> > >      $ref: /schemas/graph.yaml#/properties/port
> > >      description:
> > >        Output port node. This port should be connected to the
> > > input
> > > port of an
> > > -      attached HDMI or LVDS encoder chip.
> > > +      attached HDMI, LVDS or DisplayPort encoder chip.
> > >  
> > >  required:
> > >    - compatible
> > 
> > 
> 
> 


