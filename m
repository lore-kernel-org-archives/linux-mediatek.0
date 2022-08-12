Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27726C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmeNNV8V89WhfRxVm+z5TsJlbCEiAwIvIFkzEhxhBI0=; b=Z9XKbYyHuz+eP+fMSbqXjLuZC/
	iEwshHIGG7fQBIdKF4mDO39DdzNMuMYz9lDmI4Iyfp1TGXNqD2NM6b4XcFTCbufLW3HYvtgBXzu+R
	b22ErDkzRfMT+OTllgq5TGkaiRyXB5ej/YvBmNikYhCQD932304u2LxPPFT3X49WNNGoq05WUV74n
	TOMHBiCQk8MXu4c31zdrllymowe46yS4FzQL5aATxMGk1n9D6Xewydh0Q7mWhjxQaiLHMM5wzlJKh
	kNFxlYg33phk/quEm30a6DL1gL3Rhlcw9XzA7H0qbAPOYM6bGl1lSUpZdP12Yx6wi0B86rKNVOAZ5
	JGybH7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUcj-007yRL-4C; Fri, 12 Aug 2022 13:22:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUcg-007yCx-Ir; Fri, 12 Aug 2022 13:22:47 +0000
X-UUID: ea10ac012abf4f52a0e5813ba94990c7-20220812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:4a2e7c91-11e3-4e76-a948-95aeb53881a2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:2135a6ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ea10ac012abf4f52a0e5813ba94990c7-20220812
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 417573622; Fri, 12 Aug 2022 06:22:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 12 Aug 2022 20:52:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Aug 2022 20:52:01 +0800
Message-ID: <4a49b619deb5453749a47874377cad6a36a9a054.camel@mediatek.com>
Subject: Re: [PATCH v3 1/1] regulator: dt-bindings: mediatek: add mt6366
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <sen.chu@mediatek.com>, <hui.liu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
	<sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 12 Aug 2022 20:52:01 +0800
In-Reply-To: <cbe761af-5011-83a2-0509-2b3c4fe0a79c@linaro.org>
References: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
	 <20220812092901.6429-2-zhiyong.tao@mediatek.com>
	 <cbe761af-5011-83a2-0509-2b3c4fe0a79c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_062246_653852_C9F3C47A 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2022-08-12 at 13:55 +0300, Krzysztof Kozlowski wrote:
> On 12/08/2022 12:29, Zhiyong Tao wrote:
> > Add mt6366 regulator document
> > 
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6366-regulator
> > +
> > +  regulators:
> > +    type: object
> > +    description: List of regulators and its properties
> > +
> > +    patternProperties:
> > +      "^buck-
> > v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> > +        type: object
> > +        $ref: regulator.yaml#
> 
> You miss unevaluatedProperties in most of the places.

Hi Krzysztof,
   Thanks for your suggestion,
   Do you mean that all places should have the unevaluatedProperties
Properties ?

Thanks

> 
> 
> Best regards,
> Krzysztof


