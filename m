Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB57C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbT8pv5oKdoPZitbTIlUPNontDn9FvbYIf0kH7CY+Q8=; b=0WCR/aGKodhwvM
	rf8pcCDJJKcoaFzlkrVc2UaLFG3RflLSUUowgZbGKQ9kMEjWCWd0y6TBUZIoj26mTIJCpvxPki2Cg
	OGWz8nNGCB0GHuxolIG/sRIxvk0OVEVVEsu7KrZnDW4RLHEZNYqaS6L75ADfdcf0B36JCG7c3ZjNV
	m+aavhMUsCDCCJ87/R9wh0l4GYidzllzVCWK3V1tBnFhCZZOi170ta9zmI7iL81jnpxkYpEcRENHB
	XGHz05XGBKpmA/S6nJ/mFTEX72Bv36IYX5yDxzSnVMQzYfcsE72IazvVqrkKy/dKrQ+R3x1oIpvrz
	pUBhabBOUF05nbcTD72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVDpU-0022Di-35; Fri, 18 Mar 2022 14:43:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVDpR-0022CP-Fu; Fri, 18 Mar 2022 14:43:47 +0000
X-UUID: 56f9a83aff044f8ba85096621812e2d7-20220318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=O3e3M1yRDlozc7+I9BMMkn25onl9kTAf6j/9D6Ll/cM=; 
 b=PG0YDTiWSr9Uo/P6NetVpX3ZtSrRI+l9hdN5Ezu2RNmGZ+5KKGBYHdZtGFst3PojD0SqNmg5eTSppRAJR2fFFnWv0m4wvA+t1/fb9Idhif0TV0Q3XpSGh0zZSkoweP3dTSCkLb0wgiRTddSd0lm5nOmnLQrt9QN11hRrDzTNIDE=;
X-UUID: 56f9a83aff044f8ba85096621812e2d7-20220318
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1291822405; Fri, 18 Mar 2022 07:43:31 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 07:43:29 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Mar 2022 22:43:16 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 22:43:15 +0800
Message-ID: <27fecdcdeca7dac46f14b7a83ce49c0f8dc3e7e5.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, <randy.wu@mediatek.com>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Date: Fri, 18 Mar 2022 22:43:15 +0800
In-Reply-To: <e0adbb4d-aa87-49ea-d79f-11c5f4fc4bdd@collabora.com>
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-2-jianjun.wang@mediatek.com>
 <2e0989c3-7132-6091-5c9e-5dc8d9af22e8@collabora.com>
 <319cf016-55fb-dcd4-9157-ad795c8e68ff@kernel.org>
 <e0adbb4d-aa87-49ea-d79f-11c5f4fc4bdd@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_074345_575036_C97943BD 
X-CRM114-Status: GOOD (  30.46  )
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

On Fri, 2022-03-18 at 14:56 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/03/22 14:51, Krzysztof Kozlowski ha scritto:
> > On 18/03/2022 12:12, AngeloGioacchino Del Regno wrote:
> > > Il 18/03/22 10:54, Jianjun Wang ha scritto:
> > > > Add YAML schema documentation for PCIe PHY on MediaTek
> > > > chipsets.
> > > > 
> > > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > > > ---
> > > >    .../bindings/phy/mediatek,pcie-phy.yaml       | 75
> > > > +++++++++++++++++++
> > > >    1 file changed, 75 insertions(+)
> > > >    create mode 100644
> > > > Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> > > > b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> > > > new file mode 100644
> > > > index 000000000000..868bf976568b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-
> > > > phy.yaml
> > > > @@ -0,0 +1,75 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: MediaTek PCIe PHY
> > > > +
> > > > +maintainers:
> > > > +  - Jianjun Wang <jianjun.wang@mediatek.com>
> > > > +
> > > > +description: |
> > > > +  The PCIe PHY supports physical layer functionality for PCIe
> > > > Gen3 port.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: mediatek,mt8195-pcie-phy
> > > 
> > > Since I don't expect this driver to be only for MT8195, but to be
> > > extended to
> > > support some more future MediaTek SoCs and, depending on the
> > > number of differences
> > > in the possible future Gen4 PHYs, even different gen's, I propose
> > > to add a generic
> > > compatible as const.
> > > 
> > > So you'll have something like:
> > > 
> > > - enum:
> > >       - mediatek,mt8195-pcie-phy
> > > - const: mediatek,pcie-gen3-phy
> > 
> > I am not sure if this is a good idea. How sure are you that there
> > will
> > be no different PCIe Gen3 PHY not compatible with this one?
> > 
> > 
> 
> Thanks for pointing that out, I have underestimated this option.
> 
> Perhaps Jianjun may be more informed about whether my proposal is
> valid or not.

Many thanks for the suggestions.

Currently, we only have this PCIe Gen3 PHY, and I don't think we are
planning other PCIe Gen3 PHYs with different software interfaces, even
in the next generation, we want to make sure it has a similar interface
to this generation, so I prefer to add a generic ones to support more
SoCs that need this driver.

Thanks.

> 
> Cheers,
> Angelo
> 
> > Best regards,
> > Krzysztof
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
