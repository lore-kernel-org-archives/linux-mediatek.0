Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1451AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/I3vn+IjTYCiEyc7F5yhidAkTBeUBu5MkRDqDXaZVks=; b=dAT8pHfsYp+3cj
	eC7n4pNWF+xWaiKabqSEGnyVmzKQwoLfNBfQA3sYxyGa9+T/fb9UMtoJ26qwUDJcCKunJ5u35trkt
	fKdncTJ+JK3ibexg3h5F7Tsafl4dLMMh0DZx3qzt8t+5Wyu0jzJ/Q/PqNjWOenNG01tfYCPNmp2P/
	hFmNVGehecaMhiGLdBGyKUGGIcRAn35Rci7SSAvMlyRBxDZEAtkscpoIT0b9aKmdHq8yz/KAOg+Ua
	STrHR1c3Nign17DcRWaM+Efxet1R9gZS7ta3Wje+qGBqwpZgMmC1aU0Ewi3Yt27DdHikuEViLKym6
	lnRULSYlDPEJ38fcMcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU5bq-008uOV-3d; Tue, 15 Mar 2022 11:45:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU5bd-008uLE-Pf; Tue, 15 Mar 2022 11:44:51 +0000
X-UUID: 4e03c3fdfd3e440f856160b1edcec18d-20220315
X-UUID: 4e03c3fdfd3e440f856160b1edcec18d-20220315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 851064772; Tue, 15 Mar 2022 04:44:44 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 04:44:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 19:44:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Mar 2022 19:44:41 +0800
Message-ID: <77ba20c7fbe42daf27696f784b46c3ad8a43ebc1.camel@mediatek.com>
Subject: Re: [PATCH V7 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jassisinghbrar@gmail.com>, <fparent@baylibre.com>,
 <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 15 Mar 2022 19:44:41 +0800
In-Reply-To: <095b4dad-ade6-c742-1993-e5dc89f5cb93@canonical.com>
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-2-rex-bc.chen@mediatek.com>
 <095b4dad-ade6-c742-1993-e5dc89f5cb93@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_044449_868457_DB48CC13 
X-CRM114-Status: GOOD (  13.63  )
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

On Tue, 2022-03-15 at 11:56 +0100, Krzysztof Kozlowski wrote:
> On 14/03/2022 10:00, Rex-BC Chen wrote:
> > Add aal binding for MT8183.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml      |
> > 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > index 61f0ed1e388f..6c8c83988a24 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > @@ -23,6 +23,8 @@ properties:
> >      oneOf:
> >        - items:
> >            - const: mediatek,mt8173-disp-aal
> > +      - items:
> > +          - const: mediatek,mt8183-disp-aal
> 
> Use enum in previous entry. This is weird setup to have items with
> one
> element and then duplicate it for another oneOf entry.
> 
> >        - items:
> >            - enum:
> >                - mediatek,mt2712-disp-aal
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Thanks for your review.
I will modify it in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
