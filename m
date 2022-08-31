Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F053ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 03:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6p4nBQpPDfAvJXIWYEc7Z9l/J547e22bjzK44gLW/A=; b=R6VWZhx8kfS6I3J6xk4mHCghdl
	duwlaalp9xQ61Xsemhg9XiYXAuXOlTHln++zNhf3UAmQCNSppZVuRin6IBiiCSQNi9Pw2ZfkXazKo
	tBIIh2inUryOiJ4jukJRQJZu1zq8Ga4AghDWdOzRHhEpxpwk9NgM1dNrfeOGeB7VA4IHfQMrPEdbS
	BgceYdf5K6bJ8CpeLiFPq+cbAlFGpAwBfZAeRJewZrnPkFK5/di5YvYNDwJv7iqT4n7ZuafDbJ60s
	kfrU+ZgMiU2C3OPPlcvuz15Q+U66dgSuJBJyyYC2+QrHBrV2ErFizgEGRMsh04zhDdh/lxQ0WURJh
	N8V+pkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTE5I-003P94-Tp; Wed, 31 Aug 2022 03:08:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTE55-003P2z-BA; Wed, 31 Aug 2022 03:07:56 +0000
X-UUID: 1384ea4da2af4d589342cf300a7b58bb-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=C6p4nBQpPDfAvJXIWYEc7Z9l/J547e22bjzK44gLW/A=;
	b=hgEXTbFThencqRiLBIi4TxGU897PbCNKdJiIMOtFMfQIn3IM6U3vIWw7POOe+Nxx7kmP9V5zqIAqZ/7EPnAzjNjw+eeFidTmGxDedciIGhcti6AgQGTpDO11tkWwFF5BKf/HmrvvVgiMSpoJxXxTtVBtutyE720nXt8An9J5bZA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:f28ba6cb-41c3-45b1-a4d8-503b317de36b,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:efa21656-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1384ea4da2af4d589342cf300a7b58bb-20220830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1672973796; Tue, 30 Aug 2022 20:07:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 10:27:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 31 Aug 2022 10:27:17 +0800
Message-ID: <9aed5d16174773b649460b34c586794019a61169.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: Add gamma compatible for
 mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 31 Aug 2022 10:27:17 +0800
In-Reply-To: <23d2764d-17da-5d26-29ed-0b1f5418d004@linaro.org>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
	 <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
	 <23d2764d-17da-5d26-29ed-0b1f5418d004@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_200755_395853_14EA5A2E 
X-CRM114-Status: GOOD (  23.06  )
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

On Tue, 2022-08-30 at 12:10 +0300, Krzysztof Kozlowski wrote:
> On 30/08/2022 09:39, zheng-yan.chen wrote:
> > mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
> > current 9bit-to-10bit gamma-LUT.
> > 
> > This patch thus add constant compatible for mt8195, which means
> > that
> > mt8195 should only use specified mt8195 gamma driver data.
> > 
> > Also, delete related compatible from enum, to ensure that
> > mt8195 will not accidentally get others' gamma driver data and thus
> > cause fatal error.
> > 
> > Fixes: a79257bae9bf ("dt-bindings: display: mediatek: add mt8195
> > SoC binding for vdosys0")
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3
> > ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > index a89ea0ea7542..fbd7b9664a78 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > @@ -25,11 +25,12 @@ properties:
> >            - const: mediatek,mt8173-disp-gamma
> >        - items:
> >            - const: mediatek,mt8183-disp-gamma
> > +      - items:
> > +          - const: mediatek,mt8195-disp-gamma
> 
> This is one item, so not a list. With all such cases this should be
> dedicated enum.
> 
> Best regards,
> Krzysztof
Hello Krzysztof, 
Thanks for the review,

I will fix it at the next version.

Best Regards,
Zheng-Yan Chen.


