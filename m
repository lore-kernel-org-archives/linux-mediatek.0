Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE8BC0502A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 04:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdLX2cQSyS2w0LK3V/gap2eMhetpaT8GDl7EAbKntjU=; b=uTeczRbwy9SheXlpUrBp2a6lU6
	DJ1w5NCWBxYdFgJT2GuDdaR1MvtFEkLm1xI8NUGGFvEzgYDZLWmiGIXxQtgJP3vjEWN/YwJpOCXBa
	WCcD1hB7w1EddjA/erc8q/ChHYGBgXtTMxgDNR4ym0bP0HUxF6lPzEJu7OclR5c+OxIJN9ObZLudh
	agY4Mo9gz1Jxv/i2CqzS7lbVUPwkOLbeaYO70zVX9Wc+mdl34PRJHcke4BC90otkN4wuNGFFT5Wgl
	vAQZvNlmSWO/x+BWJZ9JsovPwCaYku6XPbTuQhMtRy+Np2X3D2MU6i9qdcnMJ+dl5472sdu+vboSL
	uan/SR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTF8A-003fiv-IL; Wed, 31 Aug 2022 04:15:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTF86-003fi7-Bl; Wed, 31 Aug 2022 04:15:07 +0000
X-UUID: c1f6efff163b4bb6a1909eff0438f145-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=HdLX2cQSyS2w0LK3V/gap2eMhetpaT8GDl7EAbKntjU=;
	b=rS4RLeDKr1jo3gRGYNWCy6XcijPp5+dHKWs1L3rgL1oPgblEnE0I5q2sqaMANJ/4KGqICj9ozWsXf06JiscyABHMPGtGcOlVNOVRY46g7uuDoOXdXQjiisqAPS4LGOe42EEYvaPUps26PFizFqSRLncJH5OUzEWzqyYEO6PqXBM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:eda9fddf-6c23-4778-a990-cb6ef936d277,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:265aa220-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c1f6efff163b4bb6a1909eff0438f145-20220830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1291004141; Tue, 30 Aug 2022 21:14:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 11:14:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Aug 2022 11:14:20 +0800
Message-ID: <d30353e4dbb785c3ce31ef54b791bfe3d23df904.camel@mediatek.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: mediatek,tphy: add property to
 set pre-emphasis
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>, Eddie Hung
	<eddie.hung@mediatek.com>
Date: Wed, 31 Aug 2022 11:14:19 +0800
In-Reply-To: <d1f49935-b465-7495-d345-f35bf4dea9f9@linaro.org>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
	 <20220829080830.5378-2-chunfeng.yun@mediatek.com>
	 <d1f49935-b465-7495-d345-f35bf4dea9f9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_211506_555878_69B05FB7 
X-CRM114-Status: GOOD (  21.86  )
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

On Tue, 2022-08-30 at 20:38 +0300, Krzysztof Kozlowski wrote:
> On 29/08/2022 11:08, Chunfeng Yun wrote:
> > Add a property to set usb2 phy's pre-emphasis, which used to widen
> > eye
> > opening and boost eye swing.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: Add more description suggested by Krzysztof
> > ---
> >  .../devicetree/bindings/phy/mediatek,tphy.yaml         | 10
> > ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > index 848edfb1f677..e0754fb44451 100644
> > --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > @@ -219,6 +219,16 @@ patternProperties:
> >          minimum: 1
> >          maximum: 15
> >  
> > +      mediatek,pre-emphasis:
> > +        description:
> > +          The level of pre-emphasis which used to widen the eye
> > opening and
> > +          boost eye swing, the unit step is about 4.16% increment;
> > e.g. the
> > +          level 1 means amplitude increases about 4.16%, the level
> > 2 is about
> > +          8.3% etc. (U2 phy)
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> 
> As I proposed - use instead common units. 
As explained before, no units for these value.

> Since only three values are
> allowed - make it an enum. 
Ok,

> These bindings are expected to be
> usable/applicable on several devices, so units, not register values
> which can change between devices, are the proper and reliable way to
> describe a feature.
I prefer to use exact level values, but not the inexact values with
units (e.g. -percent, -microvolt).

Thanks a lot

> 
> 
> Best regards,
> Krzysztof


