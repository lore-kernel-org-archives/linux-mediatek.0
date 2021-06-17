Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D67C49361
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 02:51:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 345D5611CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 02:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 345D5611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83L1phoL9GlaUp/finx0dGn4k8bwoWMIhNqbQu8R4UI=; b=DSBhseIFra5Xog
	O2yS9czCAPZz71YHB+htFFe+ffkgn6V/6xWY//oz0QePwaT6FMyfVs5JtIKA3ghsp7HpWPUL+9rPi
	prXtQ2iKjpUmwsw1mezUgeuAO4ymciRbK8QGLVxVhQkkKRwfQE2Xyuftfq2dIkfB+LESGENMe8ZhX
	4LBhUtFQmh8MH8pESpLUCCLYWLigX02i/M6AwMiv7mSSD3Nwu3UCS+Qe+7calLV5YkFy+tp1K4Dh/
	QhHO7Y4vBi5vrM9+UKdmynwA++JdRVBqp/8hfb0Hg8HR/kL1BNosgmSiEvRxzM6+0YYbfxErwpmiQ
	8lbP9dxnHQ5hb+SRvaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lti7K-008aCY-Pq; Thu, 17 Jun 2021 02:50:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lti7I-008aBO-9o; Thu, 17 Jun 2021 02:50:53 +0000
X-UUID: 6dd24877447c4044a1b93ecb48de4d3e-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GL54Q18YRC1dzNU9f8BXHQIPKEDryvVZQ6oeewdXKKI=; 
 b=ay7i3zVeMDYGDfZwnqHvZWxHZeaI+4vsTp/jvrbRBKHsWgR/Y1H6XK1kgUBNoD47vSwSOSucU34GFFEZMS4ckPdAyFKPGB1uDxLw0I9nDnoFrfNOZ1++09utwv6l08y0DC7h/F1Oo9wqcK08i/0B0iwRDrwcCq6q4y4D/P/7fMU=;
X-UUID: 6dd24877447c4044a1b93ecb48de4d3e-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 3034351; Wed, 16 Jun 2021 19:50:48 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 19:50:41 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs06n1.mediatek.inc
 (172.21.101.129) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Jun 2021 10:50:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Jun 2021 10:50:38 +0800
Message-ID: <1623898238.28667.15.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] dt-bindings: phy: mediatek: tphy: add support
 hardware version 3
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Date: Thu, 17 Jun 2021 10:50:38 +0800
In-Reply-To: <20210616232817.GA277610@robh.at.kernel.org>
References: <1622791880-20262-1-git-send-email-chunfeng.yun@mediatek.com>
 <20210616232817.GA277610@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_195052_423362_D0E18A3C 
X-CRM114-Status: GOOD (  28.06  )
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

On Wed, 2021-06-16 at 17:28 -0600, Rob Herring wrote:
> On Fri, Jun 04, 2021 at 03:31:18PM +0800, Chunfeng Yun wrote:
> > The PHYA architecture is updated, and doesn't support slew rate
> > calibration anymore on 7nm or advanced process, add a new version
> > number to support it.
> > Note: the FreqMeter bank is not used but reserved.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  .../devicetree/bindings/phy/mediatek,tphy.yaml     | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > index b8a7651a3d9a..939c09296b5f 100644
> > --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > @@ -15,7 +15,7 @@ description: |
> >    controllers on MediaTek SoCs, includes USB2.0, USB3.0, PCIe and SATA.
> >  
> >    Layout differences of banks between T-PHY V1 (mt8173/mt2701) and
> > -  T-PHY V2 (mt2712) when works on USB mode:
> > +  T-PHY V2 (mt2712) / V3 (mt8195) when works on USB mode:
> >    -----------------------------------
> >    Version 1:
> >    port        offset    bank
> > @@ -34,7 +34,7 @@ description: |
> >    u2 port2    0x1800    U2PHY_COM
> >                ...
> >  
> > -  Version 2:
> > +  Version 2/3:
> >    port        offset    bank
> >    u2 port0    0x0000    MISC
> >                0x0100    FMREG
> > @@ -59,7 +59,8 @@ description: |
> >  
> >    SPLLC shared by u3 ports and FMREG shared by u2 ports on V1 are put back
> >    into each port; a new bank MISC for u2 ports and CHIP for u3 ports are
> > -  added on V2.
> > +  added on V2; the FMREG bank for slew rate calibration is not used anymore
> > +  and reserved on V3;
> >  
> >  properties:
> >    $nodename:
> > @@ -79,8 +80,11 @@ properties:
> >                - mediatek,mt2712-tphy
> >                - mediatek,mt7629-tphy
> >                - mediatek,mt8183-tphy
> > -              - mediatek,mt8195-tphy
> >            - const: mediatek,generic-tphy-v2
> 
> This doesn't look like a good change.
> 
> What happens if a DT has the above. It didn't work or didn't support new 
> features?
It does not affect function, but will waste some time to calibrate slew
rate on mt8195.

>  Please clarify in the commit the implications of changing 
> this. Changing a DT to 'mediatek,generic-tphy-v3' will break existing OS 
> if it was looking for v2.
On mt8195, it's backward compatible with hw v2, the unused FMREG bank is
reversed, but noop when W/R registers.
> 
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8195-tphy
> > +          - const: mediatek,generic-tphy-v3
> >        - const: mediatek,mt2701-u3phy
> >          deprecated: true
> >        - const: mediatek,mt2712-u3phy
> > @@ -91,7 +95,7 @@ properties:
> >      description:
> >        Register shared by multiple ports, exclude port's private register.
> >        It is needed for T-PHY V1, such as mt2701 and mt8173, but not for
> > -      T-PHY V2, such as mt2712.
> > +      T-PHY V2/V3, such as mt2712.
> >      maxItems: 1
> >  
> >    "#address-cells":
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
