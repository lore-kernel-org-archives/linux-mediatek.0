Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA370C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 01:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QY2ce3Mfse/S2goGTcFEA6KddWIrRwDQOPhSKyD6FWc=; b=rGJVpiO1AGoI6s
	ptIRZTFyhSmI8iEjKm9KElfHUmKzj42nczevp7sVH/KdmZd0657cAVc9fhlkQpO0Hg7UR7oEYKNjH
	jtTyVAfT0bz4nv6cTxgOA6WucZk0Vp4BIu2N2XobuCxusHtz5jRCHdlvTd1xEocl1puOfUnzX+amZ
	OWT+LUKu2Dw+49PegKoluAhJ6OxfSGBg9UcHFXGfj4L4fxZ9Epe93wSOnkggnocQtI3tqDOBh9x0G
	OfO5srgi9QkqmXtK2LPTvliFK5t7Td13ixxZTQX4EebxNV3imgxuestHV9TUxOKqibaHIOUxJDLJV
	+Z8gsY1F7d3EK7+0C3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJQN8-00CvA2-J7; Mon, 14 Feb 2022 01:41:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJQMu-00Cv7K-76; Mon, 14 Feb 2022 01:41:36 +0000
X-UUID: d211497cf3d548b98cedbffe60beb4bc-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Zcp1N9SwdvWFto/aWnnaBXW2HW5IySssZTQ53D+fbHQ=; 
 b=gb9Q1Y0uFX/+CO0tZ++rOQacrG+PxonmYTS1Z5NU66oMGApDwiL17EdryhsFT6XObMRC9EkJFdsUwldLAnJz4x7LJ9LJQXjwcx0fQ0xaKhPsHLp0nqfbofdEqgdakYqADbidieL5J7ouiCfgSxpvLVIGnDIbIlP75YlXMCpltNQ=;
X-UUID: d211497cf3d548b98cedbffe60beb4bc-20220213
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1511045706; Sun, 13 Feb 2022 18:41:26 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 17:41:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 09:41:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 09:41:21 +0800
Message-ID: <601d501fd2dc634120b771edb4b988b0670d8c1b.camel@mediatek.com>
Subject: Re: [PATCH 1/6] dt-bindings: spi: Add compatible for Mediatek IPM
 IP with single mode
From: Leilk Liu <leilk.liu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Mark Brown
 <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 14 Feb 2022 09:41:20 +0800
In-Reply-To: <c375e5bd-53b9-e657-7c0a-7e2f9179688b@canonical.com>
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
 <20220209111938.16137-2-leilk.liu@mediatek.com>
 <c375e5bd-53b9-e657-7c0a-7e2f9179688b@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_174133_670139_0FF15587 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri, 2022-02-11 at 12:44 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2022 12:19, Leilk Liu wrote:
> > This commit adds dt-binding documentation for
> > Mediatek SPI IPM IP with single mode.
> 
> Please do not use "This commit":
> 
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89
> 
> Wrap around 75-chars, just like our guidelines are saying.
> 
OK, I'll fix them,thanks

> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1
> > +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > index bfa44acb1bdd..0a2fc0404cb3 100644
> > --- a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > @@ -41,6 +41,7 @@ properties:
> >                - mediatek,mt8135-spi
> >                - mediatek,mt8173-spi
> >                - mediatek,mt8183-spi
> > +              - mediatek,ipm-spi-single
> >  
> >    reg:
> >      maxItems: 1
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
