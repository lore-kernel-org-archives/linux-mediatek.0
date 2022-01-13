Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC78C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 06:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1+HVcU8UYDJIyhshsuylSZ6dMTL78PKsZk3eM+FFJk=; b=gMGblTLpkwXuTC
	ATTtf+W/jj4sWg46whIFbbLn5UvnGYfUS8PENzE+fib5fYfbbR6bPnFeLplaGUQaKdxCqX2j1hUiH
	poCHmF9Ph3yx9Lk05ZGsZX5RAJco+2kdPBbhBaAnLwZDZjSaQk6QATzeoa1lBXbiRH/9TOoB0iX0O
	1N143maOPdnL4FIGST8BxZd3Hm0K/5XC3i38n+DQqxIZXpobYVgEggCbvEZOXMomT0cPorpm/GWHg
	r79oV1M7OEi4/0ronoqfRMIBytqK/nr7oMZsOcJg1q/dD9KDrOEMg0Mf2EAFElNsfV60tvk+eQ/fo
	PtVqLrTMZhr3whlTNgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7tFo-004lym-I2; Thu, 13 Jan 2022 06:06:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7tFm-004lvu-67; Thu, 13 Jan 2022 06:06:31 +0000
X-UUID: d63d6242a4eb43158f6d3db2756e254e-20220112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2Sy4hTg/M9n1zs5XJPrRvs8QK/b/lz4vRiW0yqoizuU=; 
 b=jfDW376IuGxfaSnc1+JglzDrIMt93ru6NXG4uzwvdJdFzfX0aDafB9XX8Pzb7i79UgBbdmCZIfEcNkCQ1FsBbPxczwGOGG1u/wpZWJGslxRKKP9ZAiILfJEhZeFdu8ScqMfytKz+9QZIq+5+wMvDcNGvXijMN1MhCOECKjiw0tE=;
X-UUID: d63d6242a4eb43158f6d3db2756e254e-20220112
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 314976407; Wed, 12 Jan 2022 23:06:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 22:06:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 14:06:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 14:06:20 +0800
Message-ID: <1eb2bc6432aa5a1c0371542457a86764df77153b.camel@mediatek.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: memory: mtk-smi: Fix the larb
 clock/clock-names dtbs warning
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 13 Jan 2022 14:06:20 +0800
In-Reply-To: <b8b8fe77-2ea8-d05c-5fa2-d4cae01baba5@canonical.com>
References: <20220111063904.7583-1-yong.wu@mediatek.com>
 <20220111063904.7583-3-yong.wu@mediatek.com>
 <b8b8fe77-2ea8-d05c-5fa2-d4cae01baba5@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_220630_272736_581D83F5 
X-CRM114-Status: GOOD (  24.57  )
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

On Wed, 2022-01-12 at 11:18 +0100, Krzysztof Kozlowski wrote:
> On 11/01/2022 07:39, Yong Wu wrote:
> > Mute the warning from "make dtbs_check":
> > 
> > larb@14017000: clock-names: ['apb', 'smi'] is too short
> > 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> > burnet.dt.yaml
> > 	...
> > 
> > larb@16010000: clock-names: ['apb', 'smi'] is too short
> > 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> > burnet.dt.yaml
> > 
> > larb@17010000: clock-names: ['apb', 'smi'] is too short
> > 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> > burnet.dt.yaml
> > 
> > If a platform's larb supports gals, there will be some larbs have
> > one
> > more "gals" clock while the others still only need "apb"/"smi"
> > clocks,
> > then the minItems for clock and clock-names are 2.
> > 
> > Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to
> > DT schema")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../bindings/memory-controllers/mediatek,smi-larb.yaml      | 6
> > +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/memory-
> > controllers/mediatek,smi-larb.yaml
> > b/Documentation/devicetree/bindings/memory-
> > controllers/mediatek,smi-larb.yaml
> > index 80907e357892..884c0c74e5e4 100644
> > --- a/Documentation/devicetree/bindings/memory-
> > controllers/mediatek,smi-larb.yaml
> > +++ b/Documentation/devicetree/bindings/memory-
> > controllers/mediatek,smi-larb.yaml
> > @@ -80,10 +80,10 @@ allOf:
> >      then:
> >        properties:
> >          clock:
> 
> Separate patch:
> This should be clocks. The same in second if. Now it is simply not
> working...
> 
> > -          items:
> 
> Putting min/maxItems under items is wrong. The second if also needs
> the
> fixing. Please make it a separate patch before this one.

Oh. I will use a new patch for renaming "clock" to "clocks" and
removing the "items".

Thanks.

> 
> The schema was clearly not tested before...
> 
> 
> > -            minItems: 3
> > -            maxItems: 3
> > +          minItems: 2
> > +          maxItems: 3
> >          clock-names:
> > +          minItems: 2
> >            items:
> >              - const: apb
> >              - const: smi
> > 
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
