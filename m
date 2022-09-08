Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC21ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 01:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxm4Q2hjq51exmAQAAZplPtyEj8SEXfXis2YBGKt1cc=; b=DXxRAjiRzK7C6HHLdIXxWoVpJU
	DUWtR+ZFukrQj2Lm89pkpx1C6PXEp2y+rT5Pk1EGXLfmvhth4dQICUUG4Pglb3t+5IlWeMDyGDaBI
	Lw7vYFsjNW8yvCcwMst60gDbVBopzyb84vtYE0vI2krEoIZo59D8UMXc4B+XH89CDdwemGvFCCPeV
	Lhl54faVoBuWea/xg1Ne7tgqw1MJOU1aDk5csmBee2DE1LgC5Ae5euy+HQlIOb+nlJYoCWvLJZxJ6
	sGElOkxWNjmMc6dfRuoiS/EuX2SOk/xu5rfZ0ENBGW1sInHG84bt1s1MbPYoj2DB074tzU5mhAFKr
	STd1rd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW6ng-00ETCH-3W; Thu, 08 Sep 2022 01:57:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW6nd-00ETAp-2N; Thu, 08 Sep 2022 01:57:51 +0000
X-UUID: aaed807704354aa19b5fd8227ca927a4-20220907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Jxm4Q2hjq51exmAQAAZplPtyEj8SEXfXis2YBGKt1cc=;
	b=cT8deU1OrEnLsdPHGk6Gwo9e0L2itARCNUwgnMnf80crObpD2K2MYnpNZUjQughHsrHSeWJwl/AG5eC5+/cIMrUT5HSqOc6JYpHLuJRLPudwZv76zKSufRVljfq+Fp51u4Hs29k3VhNyNii5oac13iacBqCcr72AVTus4dknm7M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:77016815-d3b6-46ff-b0b0-9e880ada6a6d,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:da089221-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: aaed807704354aa19b5fd8227ca927a4-20220907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 293078089; Wed, 07 Sep 2022 18:57:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 09:27:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Sep 2022 09:27:00 +0800
Message-ID: <696a84dbd54a5c591b78a6c7e043aedb2db85d9b.camel@mediatek.com>
Subject: Re: [PATCH v2 7/7] phy: phy-mtk-tphy: fix the phy type setting issue
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>, Eddie Hung
	<eddie.hung@mediatek.com>
Date: Thu, 8 Sep 2022 09:27:00 +0800
In-Reply-To: <9a7abae0-e31e-6beb-74ce-96462d847a88@collabora.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
	 <20220829080830.5378-7-chunfeng.yun@mediatek.com>
	 <9a7abae0-e31e-6beb-74ce-96462d847a88@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_185749_407027_C782AF13 
X-CRM114-Status: GOOD (  20.06  )
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

On Wed, 2022-08-31 at 10:31 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/08/22 10:08, Chunfeng Yun ha scritto:
> > The PHY type is not set if the index is non zero, prepare type
> > value according to the index, like as mask value.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> I agree with this change and I'd be happy to give you my R-b tag, but
> this
> commit clearly needs to be backported, so you need a Fixes tag, or a
> Cc to stable.
A good point, will add it in next version, thanks a lot

> 
> Thanks,
> Angelo
> 
> > ---
> > v2: no changes
> > ---
> >   drivers/phy/mediatek/phy-mtk-tphy.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
> > b/drivers/phy/mediatek/phy-mtk-tphy.c
> > index e0f227a0d3cc..cc10298bc70d 100644
> > --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> > +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> > @@ -915,7 +915,7 @@ static int phy_type_syscon_get(struct
> > mtk_phy_instance *instance,
> >   static int phy_type_set(struct mtk_phy_instance *instance)
> >   {
> >   	int type;
> > -	u32 mask;
> > +	u32 offset;
> >   
> >   	if (!instance->type_sw)
> >   		return 0;
> > @@ -938,8 +938,9 @@ static int phy_type_set(struct mtk_phy_instance
> > *instance)
> >   		return 0;
> >   	}
> >   
> > -	mask = RG_PHY_SW_TYPE << (instance->type_sw_index *
> > BITS_PER_BYTE);
> > -	regmap_update_bits(instance->type_sw, instance->type_sw_reg,
> > mask, type);
> > +	offset = instance->type_sw_index * BITS_PER_BYTE;
> > +	regmap_update_bits(instance->type_sw, instance->type_sw_reg,
> > +			   RG_PHY_SW_TYPE << offset, type << offset);
> >   
> >   	return 0;
> >   }
> > 
> 
> 


