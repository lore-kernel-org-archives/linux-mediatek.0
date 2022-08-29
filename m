Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF944ECAAA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 03:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMxL4qDPpxQ5G6XsiawgSYIMi9de2EXDfLP+YzVPj3Q=; b=g40PQyztlmP7IHKiLwtijOUDu2
	ahgUBYfIuQ22QCM2R6Xetnq753JlT1PpldD9Jxm9b+S0h0qFUDFGZ9JBvZydUXphdwE7f4Dhcfc6I
	xGUcYRbmp+U7e8ZUq3CNUy3V0kDy5zaHlNdf4RKfZ7P/uxE1iAgJK5pKv70H2IBBH6ysQqXuZe994
	iNKiMceFOeyJcchWIvnLJobEPJ1icGgHquGCfJBYc+F6q8Zz8mU+fezWE2H7+f9Y5pFxpDP4LxpHu
	ffTgysKo/ughUKEd1ezTb/t5RxQAZypNWC6Wkp6yLG9SpLao+sIg2HBmtFj9WTaeTwGHyh37JzC4x
	e7vBZbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSVI1-0043Fz-2y; Mon, 29 Aug 2022 03:18:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSVHw-0043Cm-S4; Mon, 29 Aug 2022 03:18:14 +0000
X-UUID: 517c31be9b69483cb4bac6093e026e99-20220828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pMxL4qDPpxQ5G6XsiawgSYIMi9de2EXDfLP+YzVPj3Q=;
	b=AJYf630YX9H+iJkopq1LZhD1UEA2TWo6ZTeeH2y+KtBzvFqV/KmJ1HRzfMXAYFSn5hY4K6cT+qKEB8RXRjKu9dEgbhI6G6rqB47+bnRG1uWbE/netN40BmswAJ2ZBy/sVMWVXWlwZ52RrWm+WRyIvsvBfazcgMiUd4GUARsd/zE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:11d9bcce-2c4d-4bbc-af31-5bc8ec44bf83,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:c4ccd555-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 517c31be9b69483cb4bac6093e026e99-20220828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 920261192; Sun, 28 Aug 2022 20:18:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 10:37:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Aug 2022 10:37:28 +0800
Message-ID: <114c357f8d7f049d21ede789a292a8e2d45f4c61.camel@mediatek.com>
Subject: Re: [PATCH 2/7] dt-bindings: phy: mediatek,tphy: add property to
 set pre-emphasis
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Date: Mon, 29 Aug 2022 10:37:28 +0800
In-Reply-To: <000babd8-5980-3d77-f156-324b3442cbe7@linaro.org>
References: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
	 <20220819091344.2274-2-chunfeng.yun@mediatek.com>
	 <438da392-f419-ad76-7e91-aa4aab36e12c@linaro.org>
	 <816ecf6287533137b750c8bde9de5830e4229c56.camel@mediatek.com>
	 <bee8abe5-0299-d05e-643c-4810aa33f978@linaro.org>
	 <1a16cce9fe164bafc06ae193310be71c6f645d75.camel@mediatek.com>
	 <000babd8-5980-3d77-f156-324b3442cbe7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_201812_986602_E830E7EB 
X-CRM114-Status: GOOD (  22.54  )
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

On Fri, 2022-08-26 at 09:36 +0300, Krzysztof Kozlowski wrote:
> On 26/08/2022 08:36, Chunfeng Yun wrote:
> > On Tue, 2022-08-23 at 13:24 +0300, Krzysztof Kozlowski wrote:
> > > On 22/08/2022 10:07, Chunfeng Yun wrote:
> > > > On Fri, 2022-08-19 at 15:15 +0300, Krzysztof Kozlowski wrote:
> > > > > On 19/08/2022 12:13, Chunfeng Yun wrote:
> > > > > > Add a property to set usb2 phy's pre-emphasis.
> > > > > > 
> > > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml |
> > > > > > 7
> > > > > > +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > > 
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > > > > b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > > > > index 848edfb1f677..aee2f3027371 100644
> > > > > > ---
> > > > > > a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > > > > +++
> > > > > > b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > > > > @@ -219,6 +219,13 @@ patternProperties:
> > > > > >          minimum: 1
> > > > > >          maximum: 15
> > > > > >  
> > > > > > +      mediatek,pre-emphasis:
> > > > > > +        description:
> > > > > > +          The selection of pre-emphasis (U2 phy)
> > > > > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +        minimum: 1
> > > > > > +        maximum: 3
> > > > > 
> > > > > Instead of hard-coding register values in bindings, you
> > > > > should
> > > > > rather
> > > > > describe here feature/effect. If it is in units, use unit
> > > > > suffixes.
> > > > > If
> > > > > it is some choice, usually string enum is appropriate.
> > > > 
> > > > How about changing description as bellow:
> > > > 
> > > > "The level of pre-emphasis, increases one level, boosts the
> > > > relative
> > > > amplitudes of signal's higher frequencies components about
> > > > 4.16%
> > > > (U2
> > > > phy)"
> > > > 
> > > 
> > > Still the question is what is the unit. 4.16%?
> > 
> > No unit, it's a level value, like an index of array.
> > 
> 
> So a value from register/device programming? 
Yes
> Rather a regular units
> should be used if that's possible. If not, this should be clearly
> described here, not some magical number which you encode into DTS...
Ok, I'll add more descriptions.

Thanks a lot

> 
> Best regards,
> Krzysztof


