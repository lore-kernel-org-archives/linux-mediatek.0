Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D7FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8w3tdr9MDqXyK5xo7j4bgaQxYi5QaaTL8PIRz6IHaA=; b=we042DUu9VOoZC
	xdcTd2CXubLL0cw7eSCNkH4g36k8gKSAeMxNqtKhBUwWt2SPwhr3zukmFlHMpvJ96qqvV1MoHgScV
	GRk7K4Zr9NbGUOdWHqzCyzJkAiLJKQ1D8yiPTpj8aI59zCGUZxFg+KnfWx9M7xHeSi5ytI4bmjLaB
	VmgowLCBK+k7wqJoCCiqw4D3HaBlqYHdF3AuqQxW6bDSazNVzgqkXinp74eJ4uwOnvO+kL2bl3WZB
	44zkw9e1OsKHaZ3C8BFBtZBZR7pbed/RuF/JHeqhN/ji09YbSHLkt3zFG5N6zhyNcCg34XjkYHO/B
	s+VlObHGF9LW5QLbQFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcDx-000KL0-W2; Wed, 27 Apr 2022 07:36:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcDv-000KIN-I7; Wed, 27 Apr 2022 07:36:32 +0000
X-UUID: f02c032d9d034c2a82e8a4f563f15295-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:85baff67-2620-4ec5-a9f0-ab0f75a3ed4d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:8395a6c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f02c032d9d034c2a82e8a4f563f15295-20220427
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1813356202; Wed, 27 Apr 2022 00:36:23 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 00:36:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 15:36:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 15:36:14 +0800
Message-ID: <44cd905bf5e2481568ce62543c4a5bb4500cdf98.camel@mediatek.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: Add compatible for Mediatek
 MT8186
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <hsinyi@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>
Date: Wed, 27 Apr 2022 15:36:14 +0800
In-Reply-To: <20220426230017.20640-1-miles.chen@mediatek.com>
References: <20220426125046.17311-2-allen-kh.cheng@mediatek.com>
 <20220426230017.20640-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_003631_655096_F5ED3378 
X-CRM114-Status: GOOD (  15.28  )
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

Hi Miles,

On Wed, 2022-04-27 at 07:00 +0800, Miles Chen wrote:
> Hi Allen,
> 
> > This commit adds dt-binding documentation for the Mediatek MT8186
> 
> s/Mediatek/MediaTek/
> 
> 
> thanks,
> Miles
> 

Thanks for your reminder.

Will correct this in next version.

Thanks,
Allen

> > reference board.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > index 4a2bd9759c47..5a29b7b381ef 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -131,6 +131,10 @@ properties:
> >            - enum:
> >                - mediatek,mt8183-evb
> >            - const: mediatek,mt8183
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8186-evb
> > +          - const: mediatek,mt8186
> >        - items:
> >            - enum:
> >                - mediatek,mt8192-evb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
