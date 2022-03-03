Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9862C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+vm8rxD+sWfIyeCdDrEiMj9WcKPl1TAicb6jS2mKE4=; b=woZI2AOa13kgAe
	5hSHXjiY+X0C3uhbzXxIiM/Yb0yvij2oMZoI3u3DH60iNbh2vHyAAMP9ESMs5EBboahS3wnDmMMw4
	y93W7kYtfYqhAO44d85EJvgeJ0Jv4pqvxYueBu6+2uHRP7/dMOs/yMAOovfb/QrEMDzBH1nEC+Yk1
	cetVHCDa7BKsjITvxdwd42Dku/CLrAZ0gFQYJH1qNxIGmsyGCp9TrTCC1nyuJ8pYoEdUletZ4TmLl
	ktEz5tNIqa9hdJ/dtPfkroWhhLEyMfsAb1LbkzY1WY5PrSnvLXk27KKb2s8NxjHTf/+pMbaEuvC/w
	n+DuHuwXuTLYMGOgR6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPi1L-005wG2-02; Thu, 03 Mar 2022 09:45:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPi17-005wD0-Qx; Thu, 03 Mar 2022 09:45:03 +0000
X-UUID: 14cb9dc78b7b467b9166524acad2206a-20220303
X-UUID: 14cb9dc78b7b467b9166524acad2206a-20220303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2099283855; Thu, 03 Mar 2022 02:44:58 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 01:44:57 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 17:44:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 17:44:49 +0800
Message-ID: <db8c94fc5a7401af2d8a2d8c4135f6e13d6eac08.camel@mediatek.com>
Subject: Re: [PATCH V5 3/6] dt-bindings: display: mediatek: revise enum to
 const
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jassisinghbrar@gmail.com>, <fparent@baylibre.com>,
 <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 3 Mar 2022 17:44:49 +0800
In-Reply-To: <Yh+3fPzns86LSIdi@robh.at.kernel.org>
References: <20220301080105.31323-1-rex-bc.chen@mediatek.com>
 <20220301080105.31323-4-rex-bc.chen@mediatek.com>
 <Yh+3fPzns86LSIdi@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_014501_925433_0223432A 
X-CRM114-Status: GOOD (  17.16  )
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

Hello Rob,

Thanks for your review.
I have sent v6 to fix this error.


https://lore.kernel.org/all/20220303065725.23384-3-rex-bc.chen@mediatek.com/

BRs,
Rex

On Wed, 2022-03-02 at 12:29 -0600, Rob Herring wrote:
> On Tue, Mar 01, 2022 at 04:01:02PM +0800, Rex-BC Chen wrote:
> > There won't be more than 1 fallback for these bindings, so we
> > modify
> > them to use const instead of enum.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 2
> > +-
> >  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 2
> > +-
> >  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 4
> > ++--
> >  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 2
> > +-
> >  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 2
> > +-
> >  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4
> > ++--
> >  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4
> > ++--
> >  7 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > index 191b56e16bee..bc1c70d089ba 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > @@ -31,7 +31,7 @@ properties:
> >                - mediatek,mt8183-disp-aal
> >                - mediatek,mt8192-disp-aal
> >                - mediatek,mt8195-disp-aal
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8173-disp-aal
> 
> Run 'make dt_binding_check'. This will fail.
> 
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > index 6894b6999412..fc40e2981eaa 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .yaml
> > @@ -28,7 +28,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8195-disp-ccorr
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8192-disp-ccorr
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > index bc83155b3b4c..22ed5d368cbe 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .yaml
> > @@ -32,14 +32,14 @@ properties:
> >            - enum:
> >                - mediatek,mt7623-disp-color
> >                - mediatek,mt2712-disp-color
> > -          - enum:
> > +          - const:
> >                - mediatek,mt2701-disp-color
> >        - items:
> >            - enum:
> >                - mediatek,mt8183-disp-color
> >                - mediatek,mt8192-disp-color
> >                - mediatek,mt8195-disp-color
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8173-disp-color
> >    reg:
> >      maxItems: 1
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > index 9d89297f5f1d..2a82792b2625 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.yaml
> > @@ -28,7 +28,7 @@ properties:
> >            - enum:
> >                - mediatek,mt8192-disp-dither
> >                - mediatek,mt8195-disp-dither
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8183-disp-dither
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > index 247baad147b3..45f88bdf07bb 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > @@ -29,7 +29,7 @@ properties:
> >            - enum:
> >                - mediatek,mt8192-disp-gamma
> >                - mediatek,mt8195-disp-gamma
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8183-disp-gamma
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > index e71f79bc2dee..88ba3f27b0e4 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > aml
> > @@ -33,12 +33,12 @@ properties:
> >            - enum:
> >                - mediatek,mt7623-disp-ovl
> >                - mediatek,mt2712-disp-ovl
> > -          - enum:
> > +          - const:
> >                - mediatek,mt2701-disp-ovl
> >        - items:
> >            - enum:
> >                - mediatek,mt8195-disp-ovl
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8183-disp-ovl
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > index 8ef821641672..56368c10d904 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > @@ -35,12 +35,12 @@ properties:
> >            - enum:
> >                - mediatek,mt7623-disp-rdma
> >                - mediatek,mt2712-disp-rdma
> > -          - enum:
> > +          - const:
> >                - mediatek,mt2701-disp-rdma
> >        - items:
> >            - enum:
> >                - mediatek,mt8192-disp-rdma
> > -          - enum:
> > +          - const:
> >                - mediatek,mt8183-disp-rdma
> >  
> >    reg:
> > -- 
> > 2.18.0
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-arm-kernel__;!!CTRNKA9wMg0ARbw!xcy2G7LgKWqMWhM9wMaommKbXGVMY6gc6B0zZRk4uP8AWS0KwLAg2O5buJuUVkOXiMa-$
> >  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
