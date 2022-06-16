Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B6C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OmP/qbjqsIAWDsoHp2JiJBTRjZP2wEt5+CQb0fg0TU=; b=VXbwUKTkqoBN5lbeJkwYBwl6XT
	v9DFMzw9XmHaLREBJs4srbx2NTC/jOSCuASs9T5Z0noZv8a6FSXJNGSy1AhO7LpQPia+Ml/Kz6v6h
	Y5YaRc/+o6qmEFRoarimnZmXqNYJsKE66ZU62CgZ0fU9ixXM+Y3kXHqeW4XCSCvuc9+yw2W8sL/UR
	XNiMrAlAOgvyWCPSnEeLC6kXAsY3RRL7vhgbT56SnfgLwcL3rvVBOiEIDb5ELX1YFgHOS8Mzl+2Kl
	1FJDzbpROxfjpR3VThE/5TGQhg8cSfPH3qtQ5fzHb3k37MHQ8ZovHWrAREF92hFVicA4sV688fKvD
	Gcid4XHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kVR-001HV6-Ax; Thu, 16 Jun 2022 08:05:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kOg-001Eit-VO; Thu, 16 Jun 2022 07:58:36 +0000
X-UUID: 0f667a6cc5af4c64a525ec5090762c51-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:06c8906a-05c6-43f7-8879-329b9366ee49,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:b14ad71,CLOUDID:4c6b75f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0f667a6cc5af4c64a525ec5090762c51-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 72430805; Thu, 16 Jun 2022 00:58:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 00:58:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 16 Jun 2022 15:58:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 16 Jun 2022 15:58:25 +0800
Message-ID: <cf145ac2a053d6b84d70e24ae6c13dda37967fa4.camel@mediatek.com>
Subject: Re: [PATCH v11 01/12] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 16 Jun 2022 15:58:25 +0800
In-Reply-To: <197b586898cad244037cf404cdff2846f5c0e10a.camel@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
	 <20220613064841.10481-2-rex-bc.chen@mediatek.com>
	 <197b586898cad244037cf404cdff2846f5c0e10a.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_005835_070158_51EAE317 
X-CRM114-Status: GOOD (  26.88  )
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

On Tue, 2022-06-14 at 11:05 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-13 at 14:48 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > DP_INTF is similar to DPI but does not have the exact same feature
> > set
> > or register layouts.
> > 
> > DP_INTF is the sink of the display pipeline that is connected to
> > the
> > DisplayPort controller and encoder unit. It takes the same clocks
> > as
> > DPI.
> > 
> > In this patch, we also do these string replacement:
> > - s/mediatek/MediaTek/ in title.
> > - s/Mediatek/MediaTek/ in description.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-
> > --
> > --
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > index 77ee1b923991..ca1b48e78581 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > @@ -4,16 +4,16 @@
> >  $id: 
> > http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: mediatek DPI Controller Device Tree Bindings
> > +title: MediaTek DPI and DP_INTF Controller
> >  
> >  maintainers:
> >    - CK Hu <ck.hu@mediatek.com>
> >    - Jitao shi <jitao.shi@mediatek.com>
> >  
> >  description: |
> > -  The Mediatek DPI function block is a sink of the display
> > subsystem
> > and
> > -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> > parallel
> > -  output bus.
> > +  The MediaTek DPI and DP_INTF function blocks are a sink of the
> > display
> > +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422
> > pixel data on a
> > +  parallel output bus.
> >  
> >  properties:
> >    compatible:
> > @@ -24,6 +24,7 @@ properties:
> >        - mediatek,mt8183-dpi
> >        - mediatek,mt8186-dpi
> >        - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dp_intf
> >  
> >    reg:
> >      maxItems: 1
> > @@ -36,12 +37,14 @@ properties:
> >        - description: Pixel Clock
> >        - description: Engine Clock
> >        - description: DPI PLL
> > +      - description: Clock gate for PLL
> 
> Why DP_INTF has this additional clock? What is the new hardware block
> (compared with DPI) need this clock? Why this is different than DPI?
> 
> Regards,
> CK
> 

Hello CK,

as previous reply, I will remove this clock.

BRs,
Bo-Chen

> >  
> >    clock-names:
> >      items:
> >        - const: pixel
> >        - const: engine
> >        - const: pll
> > +      - const: pll_gate
> >  
> >    pinctrl-0: true
> >    pinctrl-1: true
> > @@ -55,7 +58,7 @@ properties:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      description:
> >        Output port node. This port should be connected to the input
> > port of an
> > -      attached HDMI or LVDS encoder chip.
> > +      attached HDMI, LVDS or DisplayPort encoder chip.
> >  
> >  required:
> >    - compatible
> 
> 


