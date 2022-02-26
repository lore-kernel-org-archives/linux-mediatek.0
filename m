Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E29C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Feb 2022 03:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LeSLPGJMZhxHBBum9uCvrwhfzPGQvwdaiOJHoX8eTU=; b=SbLJzKvauQk3qk
	3MVWUoyX/F4fvmRHUUq/Ez6FANdIyyT2KlBVdJCCuDxqxJwlogBcwO0OV0BTT2UE0est2YPrdBF6P
	yiqYOwdI7xAXvwleenEEJJAdFUYfEKGBiooG3Dps3ma7GYOHwTv5AzcWfgMQBpuLpTsoYQYYpAMHe
	U0DSIsVAibyKCnU3xpLWXDzUi2XUsMts9LbuMmwzQK4wy8kQVnZR76LqSLPVDE87yQFPDjvSdzRuH
	tStlVnZ6F+RSIkczw7FXpkBDOqv5Zd7sPr9BfzTNGV4fPJTqdklk2Nw+XVcaVYfXyax/+GnduLzrG
	75CFmW0LXLjUxNnws05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNnY5-007PRj-4o; Sat, 26 Feb 2022 03:15:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNnXq-007PQF-Ru; Sat, 26 Feb 2022 03:14:57 +0000
X-UUID: a4b08fcbc85b4d5e918817a155bffdf7-20220225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hwbyN2+sp3x1fLffphiFDq4e5mBc2aS0r8i5PxGVsGg=; 
 b=QUpa/ATrForRWqDfC8EswfWctOgfVu4ep9HX0ZK4S+XNBVcnkYZ9o4SxFgMfEku9XKHthgVO3W6h1C74CUboON9vgkWjtO1UbyBsyr9xho6JLz+ORBY+Zb078udpl0nHAqKwansWLTfkExrh77NHcHbP1FVNxS6bOTRpTZxkJpI=;
X-UUID: a4b08fcbc85b4d5e918817a155bffdf7-20220225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 782647604; Fri, 25 Feb 2022 20:14:50 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 19:14:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 26 Feb 2022 11:14:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 26 Feb 2022 11:14:34 +0800
Message-ID: <f879ce25aab1d7e4a413455cb2a2454930cc9164.camel@mediatek.com>
Subject: Re: [PATCH V2 5/6] dt-bindings: spi: support spi-hclk
From: Leilk Liu <leilk.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Sat, 26 Feb 2022 11:14:34 +0800
In-Reply-To: <YhkoEJiLMs8jfUAm@robh.at.kernel.org>
References: <20220221040717.3729-1-leilk.liu@mediatek.com>
 <20220221040717.3729-6-leilk.liu@mediatek.com>
 <YhkoEJiLMs8jfUAm@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_191456_379898_10F97A59 
X-CRM114-Status: GOOD (  16.99  )
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

On Fri, 2022-02-25 at 13:03 -0600, Rob Herring wrote:
> On Mon, Feb 21, 2022 at 12:07:16PM +0800, Leilk Liu wrote:
> > this patch support spi-hclk.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 2
> > ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > index 241c0f5880d3..6920ced5451e 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > @@ -55,12 +55,14 @@ properties:
> >        - description: clock used for the parent clock
> >        - description: clock used for the muxes clock
> >        - description: clock used for the clock gate
> > +      - description: clock used for the AHB bus, this clock is
> > optional
> 
> Not optional unless you have minItems.
> 
OK, I'll add minItems,thanks for your comment.

> >  
> >    clock-names:
> 
>        minItems: 3
> 
Got it, thanks

> 
> >      items:
> >        - const: parent-clk
> >        - const: sel-clk
> >        - const: spi-clk
> > +      - const: spi-hclk
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
