Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2F3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 06:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ENHedEJXsr3sP7sADWx9/ZVACta6WtPdSOyTK1kfpM=; b=Q4k4+aHQPtOgS9
	8pNJez2ZMd4BrzGR7bgJskEL5xSXje2kbc1JkVxNRL7lX9bE+oi67qLa9EBTTVjn5MpnysJS6kksr
	t6QWhIVi8cBhsVQr403xG5+pM1pB1jDsS8QuBPfwtNegAALcu2UM9+9tuXwyHlIWcfSacj+UdARXs
	WIJtr29HDJZir5N3zHG850M6zY9Rvbuom4wGoSiOwDsCWi+Q3ZznioLfT97cDhUcIu/iAFoMt0kAl
	oZEV9fSCotqeoDfbSuzoJ5rkPCJQetHC8CkJHGoQWw3M/woifRZKYGK3chQ8GPsU0PNH8sf1X7wfW
	Rff4fRr9oJgy095EcH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwf98-007yTt-5r; Mon, 13 Dec 2021 06:49:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwf8t-007yPu-CG; Mon, 13 Dec 2021 06:49:02 +0000
X-UUID: 660770110d02483788aaaa27c8a014ec-20211212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QzfN+FlUlQnx8BtRAnoYm3/IBA3s2vzJNiXDt9dMjuc=; 
 b=ado7JXbk+FUwxEeCldWs/n01lJJyV9VYOwKZu1DXH5Y7n3YYmxmB+BARRhvVhRReprAYcA2qs1ndQPeJit/MRIEEOpuDv5/KDCr3FRZTvkMAgL1RRG5jnQBa86MNwcVc3ldfILxvfXiW5Mxi7C+0nz+feqK4MBWvuLT4mXRrO4U=;
X-UUID: 660770110d02483788aaaa27c8a014ec-20211212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 37690233; Sun, 12 Dec 2021 23:48:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Dec 2021 22:48:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 13 Dec 2021 14:48:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 14:48:49 +0800
Message-ID: <5d1ebe0089acd28032b74e3a180466f418580805.camel@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: memory: mediatek: Correct the minItems
 of clk for larbs
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Tomasz Figa <tfiga@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg Roedel
 <joro@8bytes.org>, <yi.kuo@mediatek.com>, <anan.sun@mediatek.com>, "Will
 Deacon" <will@kernel.org>, <devicetree@vger.kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 <anthony.huang@mediatek.com>, <lc.kan@mediatek.com>,
 <srv_heupstream@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <youlin.pei@mediatek.com>
Date: Mon, 13 Dec 2021 14:48:52 +0800
In-Reply-To: <1638574455.281202.1043012.nullmailer@robh.at.kernel.org>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-2-yong.wu@mediatek.com>
 <1638574455.281202.1043012.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_224859_454556_1C57E8C9 
X-CRM114-Status: GOOD (  21.25  )
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

On Fri, 2021-12-03 at 17:34 -0600, Rob Herring wrote:
> On Fri, 03 Dec 2021 14:40:24 +0800, Yong Wu wrote:
> > If a platform's larb support gals, there will be some larbs have a
> > one
> > more "gals" clock while the others still only need "apb"/"smi"
> > clocks.
> > then the minItems is 2 and the maxItems is 3.
> > 
> > Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to
> > DT schema")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../bindings/memory-controllers/mediatek,smi-larb.yaml          |
> > 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://patchwork.ozlabs.org/patch/1563127
> 
> 
> larb@14016000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml

I will fix this in next version. This property is not needed in mt8167.

> 
> larb@14017000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> burnet.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> fennel14.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku1.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku6.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> sku16.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku0.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku1.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dt.yaml

Some larbs only have two clocks(apb/smi) in mt8183. thus it is
reasonable for me. I won't fix this in next version.

Please tell me if I miss something.
Thanks.

> 
> larb@15001000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
> 
> larb@16010000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> burnet.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> fennel14.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku1.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku6.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> sku16.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku0.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku1.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dt.yaml
> 
> larb@16010000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
> 
> larb@17010000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> burnet.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> fennel14.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku1.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku6.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> sku16.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku0.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku1.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dt.yaml
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
