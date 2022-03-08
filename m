Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35632C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 01:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99izoDZGasr2e/GXWSiLtX1KNorG21DSFDm3gOP28eE=; b=O/J2q+xIh7JO6b
	OMcTkXu3P0+YsQXrseuhYtnUydoxOUcIDRlocPc8XYqs7fKUPDLGWJ3WaQV83uVhm5TUlk1NZisfA
	8/0jLeiR0QHU7GPVsXjPhQNrKP+Sj8MF7I52KsPvV0zQUIG1LDfj9alPjFD25r9exyh78uUr7SHO8
	vN9+oFYrtDxBQI+L44Od//dIVfx4PdLSBGhtpk5dU8AsayBQoO1huY7HYX+efW+tk7lOhLBvW+4TS
	uC2UEcPRJFnwwvVRmfAn2TODWGOaWpUm7GdC8k5wIkXZZ3tcF2WuJaIZSDgacopYibGaxOWhVtixC
	/oxAnSQdLGBQxQ55Q5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nROxr-002Mo4-Iz; Tue, 08 Mar 2022 01:48:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nROxf-002MlS-Pq; Tue, 08 Mar 2022 01:48:29 +0000
X-UUID: 78c30bf9306e4ae5b7e0bb6ddef08799-20220307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bnF+lbD1o97VEDXYqBFsjdpdo40rLl31ESLAGAXqQPI=; 
 b=GzL2yEkgH+aSGgx9OvPtaLXspAFC22T8xZ8A4eqLAtMbOmLa5Rn2QXSf8hAAeP0Yelc41ft3P1d/M+Bnwx6nSxlhqi5olf8tktXjMASB44seCsvGVcu51MulPKl9tmK396XHwFvHowEHcVscSRYatdHkAmOPxLPOw8s4Q47XrWk=;
X-UUID: 78c30bf9306e4ae5b7e0bb6ddef08799-20220307
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 790130939; Mon, 07 Mar 2022 18:48:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 17:48:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 09:48:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 09:48:17 +0800
Message-ID: <31d61f3b8d9ba206d25555dd48bdb4bf323edf6b.camel@mediatek.com>
Subject: Re: [PATCH V3 6/7] dt-bindings: spi: support spi-hclk
From: Leilk Liu <leilk.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 8 Mar 2022 09:48:17 +0800
In-Reply-To: <YiaYXwj0C8NeWjzz@robh.at.kernel.org>
References: <20220307065230.12655-1-leilk.liu@mediatek.com>
 <20220307065230.12655-7-leilk.liu@mediatek.com>
 <YiaYXwj0C8NeWjzz@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_174827_873056_89B783A2 
X-CRM114-Status: GOOD (  16.14  )
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

On Mon, 2022-03-07 at 17:42 -0600, Rob Herring wrote:
> On Mon, Mar 07, 2022 at 02:52:29PM +0800, Leilk Liu wrote:
> > this patch support spi-hclk.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml          | 4
> > ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > index a8a15a9a6c46..195793aa79b7 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > @@ -51,16 +51,20 @@ properties:
> >      maxItems: 1
> >  
> >    clocks:
> > +    minItems: 3
> >      items:
> >        - description: clock used for the parent clock
> >        - description: clock used for the muxes clock
> >        - description: clock used for the clock gate
> > +      - description: clock used for the AHB bus, this clock is
> > optional
> >  
> >    clock-names:
> > +    minItems: 3
> >      items:
> >        - const: parent-clk
> >        - const: sel-clk
> >        - const: spi-clk
> > +      - const: spi-hclk
> 
> 'spi' is redundant. Just 'hclk'.
> 
OK, I'll fix it,thanks

> >  
> >    mediatek,pad-select:
> >      $ref: /schemas/types.yaml#/definitions/uint32-array
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
