Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0CEECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 02:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndPvRAz0OsNARbIrZSVy1/GA0g4XNxb67xUe/x044fA=; b=mZyDPiT4xjfCKuxq1OCdgJE1Ef
	cuhpZNmzXLknxJq/T7Hni71/KSlsZSnU2A2mky/z/fcOVcgKiidpfzxanF/Y2MfEjUmeocI2Av53E
	4QIpM19TKbl0YnVLxdtLuM5R6yogOFFcsGHm02DxtxT112S8ydnD6vaoLLF9v9pXy08Yfsr69vTN8
	fEJlt031INN3DDfepnmlHy9W7Qd8DJZSrWbP4zd3k/zJlWNwSTvpQDE1rsOaWiGr2RbriwvhxXetf
	vxXGtgVNsbi/IxF9vsF8rDhMQ50ibFxP1rl0MkhvGZQVZS77vj/LVDyCGnTSOpP9iy/AFwKmZ3+pO
	RCfvgN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVOKu-001kVU-7I; Tue, 06 Sep 2022 02:29:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVOKq-001kUJ-Ks; Tue, 06 Sep 2022 02:29:10 +0000
X-UUID: 388176eb1d424614917cc947019a42cb-20220905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ndPvRAz0OsNARbIrZSVy1/GA0g4XNxb67xUe/x044fA=;
	b=C/pl7MHEV8TyU1oeQ+0D8VCZt8iwcWj56IFJ6Tdr0EoBLaxwGGAgkEYz609coV0kWD5AqSrIBlxVArziQ4CPvh+7fqT2GTgrZMMv2liQxeciPed3McRdkNsEti2QoGAdo9YqihQ8+kml1JMg2GZ+4eIDbelSTPZqehuWagVEyvo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d6f93533-ae55-417f-b71d-dfc3de644108,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:f99acad0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 388176eb1d424614917cc947019a42cb-20220905
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 770195441; Mon, 05 Sep 2022 19:29:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 10:28:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 10:28:28 +0800
Message-ID: <bc21af63b3babeec577a4b059f6e686f24be9001.camel@mediatek.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: mediatek: modify VDOSYS0 device
 tree Documentations for MT8188
From: Nathan Lu <nathan.lu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>, Moudy Ho <moudy.ho@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<wsd_upstream@mediatek.com>, <lancelot.wu@mediatek.com>
Date: Tue, 6 Sep 2022 10:28:28 +0800
In-Reply-To: <b0866ca8d749cd06f7b10b2f6eb44bf79d52dafb.camel@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
	 <20220822033213.15769-2-nathan.lu@mediatek.com>
	 <b0866ca8d749cd06f7b10b2f6eb44bf79d52dafb.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_192908_730462_FC472D01 
X-CRM114-Status: GOOD (  20.71  )
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

Hi CK,

Thanks for your review, and appreciate for all comments and sugestions.
I'll seperate mmsys/mutex/display to different patch and remove all
unnecessary modify at next version

On Mon, 2022-08-22 at 13:36 +0800, CK Hu wrote:
> Hi, Nathan:
> 
> On Mon, 2022-08-22 at 11:32 +0800, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > modify VDOSYS0 device tree Documentations for MT8188.
> > 
> > Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> > ---
> >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml     | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml   | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,color.yaml   | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml  | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3
> > ++-
> >  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml     | 1
> > +
> >  .../bindings/display/mediatek/mediatek,postmask.yaml           | 1
> > +
> >  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml    |
> > 2 
> 
> Separate the display part to another patch for the maintainer it
> belong
> to.
> 
> > ++
> >  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml       | 1
> > +
> >  10 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 6ad023eec193..f26f61069181 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -30,6 +30,7 @@ properties:
> >                - mediatek,mt8173-mmsys
> >                - mediatek,mt8183-mmsys
> >                - mediatek,mt8186-mmsys
> > +              - mediatek,mt8188-mmsys
> >                - mediatek,mt8192-mmsys
> >                - mediatek,mt8195-mmsys
> >                - mediatek,mt8365-mmsys
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > am
> > l
> > index d4d585485e7b..92741486c24d 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > am
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > am
> > l
> > @@ -31,6 +31,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-aal
> > +              - mediatek,mt8188-disp-aal
> >                - mediatek,mt8192-disp-aal
> >                - mediatek,mt8195-disp-aal
> >            - const: mediatek,mt8183-disp-aal
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .y
> > aml
> > index 63fb02014a56..fe444beff558 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr
> > .y
> > aml
> > @@ -27,6 +27,7 @@ properties:
> >            - const: mediatek,mt8192-disp-ccorr
> >        - items:
> >            - enum:
> > +              - mediatek,mt8188-disp-ccorr
> >                - mediatek,mt8195-disp-ccorr
> >            - const: mediatek,mt8192-disp-ccorr
> >        - items:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .y
> > aml
> > index d2f89ee7996f..62306c88f485 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,color
> > .y
> > aml
> > @@ -37,6 +37,7 @@ properties:
> >            - enum:
> >                - mediatek,mt8183-disp-color
> >                - mediatek,mt8186-disp-color
> > +              - mediatek,mt8188-disp-color
> >                - mediatek,mt8192-disp-color
> >                - mediatek,mt8195-disp-color
> >            - const: mediatek,mt8173-disp-color
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.
> > yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.
> > yaml
> > index 8ad8187c02d1..5c7445c174e5 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.
> > yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dithe
> > r.
> > yaml
> > @@ -27,6 +27,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-dither
> > +              - mediatek,mt8188-disp-dither
> >                - mediatek,mt8192-disp-dither
> >                - mediatek,mt8195-disp-dither
> >            - const: mediatek,mt8183-disp-dither
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .y
> > aml
> > index a89ea0ea7542..3d6e20f6eb05 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .y
> > aml
> > @@ -12,7 +12,7 @@ maintainers:
> >  
> >  description: |
> >    Mediatek display gamma correction, namely GAMMA, provides a
> > nonlinear
> > -  operation used to adjust luminance in display system.
> > +  operation used to adjust luminance in?display system.
> 
> It's not necessary to modify this.
> 
> Regards,
> CK
> 
> >    GAMMA device node must be siblings to the central MMSYS_CONFIG
> > node.
> >    For a description of the MMSYS_CONFIG binding, see
> >    Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya
> > ml
> > @@ -28,6 +28,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-gamma
> > +              - mediatek,mt8188-disp-gamma
> >                - mediatek,mt8192-disp-gamma
> >                - mediatek,mt8195-disp-gamma
> >            - const: mediatek,mt8183-disp-gamma
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > am
> > l
> > index a2a27d0ca038..065e526f950e 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > am
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.y
> > am
> > l
> > @@ -36,6 +36,7 @@ properties:
> >            - const: mediatek,mt2701-disp-ovl
> >        - items:
> >            - enum:
> > +              - mediatek,mt8188-disp-ovl
> >                - mediatek,mt8195-disp-ovl
> >            - const: mediatek,mt8183-disp-ovl
> >        - items:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > as
> > k.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > as
> > k.yaml
> > index 654080bfbdfb..27de64495401 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > as
> > k.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,postm
> > as
> > k.yaml
> > @@ -26,6 +26,7 @@ properties:
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-postmask
> > +              - mediatek,mt8188-disp-postmask
> >            - const: mediatek,mt8192-disp-postmask
> >  
> >    reg:
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > ya
> > ml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > ya
> > ml
> > index 0882ae86e6c4..d0e6c0dd4dfb 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > ya
> > ml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > ya
> > ml
> > @@ -30,6 +30,8 @@ properties:
> >        - items:
> >            - const: mediatek,mt8183-disp-rdma
> >        - items:
> > +          - enum:
> > +              - mediatek,mt8188-disp-rdma
> >            - const: mediatek,mt8195-disp-rdma
> >        - items:
> >            - enum:
> > diff --git
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > index 627dcc3e8b32..a5212a2a4dcc 100644
> > ---
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yam
> > l
> > @@ -30,6 +30,7 @@ properties:
> >        - mediatek,mt8173-disp-mutex
> >        - mediatek,mt8183-disp-mutex
> >        - mediatek,mt8186-disp-mutex
> > +      - mediatek,mt8188-disp-mutex
> >        - mediatek,mt8192-disp-mutex
> >        - mediatek,mt8195-disp-mutex
> >  
> 
> 


