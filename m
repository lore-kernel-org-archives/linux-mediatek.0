Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEDAECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RTSQNPPLI/qYLfJwsavfRsg22Jon9x2KTHWb9ohw8I=; b=E9c4lNDO/ZAocHVBRnRbNel0iV
	tRmqcuqBoMLduGXDTFQkmmuY0on8sSR4TO+2+QL8cE1lUtjJYjgiE25j5WNwC2tAk+4iNQ+JpOhnN
	D+2DePtrFQq5sp4Jli/+sil/UgQVklAPEo1rgLLAYBIDNi5+L8uSSQfgZ/Dp7KJ1EC3TtG2kLyMns
	nd0SLv3AFSftpKzeDn8x2nukPJGEJuKxNRTnxc/Eut/WrzNh1aY0HgVlrRXcjNxlbcZg5+GCEtDAA
	vHftCdDUmVAuETXfZglWYrpl6XmF0Z73+PnSPd4w+V6ZKVwz+dr8BfdHAloSVrgZj1l1DjYoRPqSa
	maSkjCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW6WW-00ENae-5t; Thu, 08 Sep 2022 01:40:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW6WS-00ENY7-Jw; Thu, 08 Sep 2022 01:40:05 +0000
X-UUID: ea58f5b749384a4388d4d8a91aa58bee-20220907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/RTSQNPPLI/qYLfJwsavfRsg22Jon9x2KTHWb9ohw8I=;
	b=GtdW4CffqRbxg5U7Nfv9mcBUHLxZJk3KmTayNak0uNe8nT1P7jBvlvQ0/cs+8/eTsZ9HVXs4pM0Om+wEfqvURzmXbaS055d9Gi1V7TltK92UO33VQYdLysHunu0hdtrKelaDmTKxIct+X43h3Li7ldBuCtLDUJxLcgFCld44iAc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3411d269-9cc3-44f5-8c63-0c0237d25aed,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:e6780857-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ea58f5b749384a4388d4d8a91aa58bee-20220907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1730347178; Wed, 07 Sep 2022 18:39:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 09:39:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 8 Sep 2022 09:39:22 +0800
Message-ID: <a4e5f9e360a3fc6d094bc719aa4523a4886cae93.camel@mediatek.com>
Subject: Re: [PATCH v2 3/7] phy: phy-mtk-tphy: add property to set
 pre-emphasis
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
Date: Thu, 8 Sep 2022 09:39:22 +0800
In-Reply-To: <219aef5a-af2a-6873-f682-cb6aef862425@collabora.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
	 <20220829080830.5378-3-chunfeng.yun@mediatek.com>
	 <219aef5a-af2a-6873-f682-cb6aef862425@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_184004_690770_8173979E 
X-CRM114-Status: GOOD (  22.34  )
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

On Wed, 2022-08-31 at 10:14 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/08/22 10:08, Chunfeng Yun ha scritto:
> > Add a property to set usb2 phy's pre-emphasis, it's disabled by
> > default
> > on some SoCs.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: no changes
> > ---
> >   drivers/phy/mediatek/phy-mtk-tphy.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
> > b/drivers/phy/mediatek/phy-mtk-tphy.c
> > index 8ee7682b8e93..986fde0f63a0 100644
> > --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> > +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> > @@ -72,6 +72,8 @@
> >   #define PA5_RG_U2_HS_100U_U3_EN	BIT(11)
> >   
> >   #define U3P_USBPHYACR6		0x018
> > +#define PA6_RG_U2_PRE_EMP		GENMASK(31, 30)
> > +#define PA6_RG_U2_PRE_EMP_VAL(x)	((0x3 & (x)) << 30)
> 
> Hello Chunfeng,
> 
> can you please clarify which SoC is this change referred to?
These bits are reserved before using 12nm process.

> 
> If I'm not missing anything, there may be a register layout conflict 
As I know these reserved bits are not used before, but now used to tune
pre-emphasis after supporting 12nm or 5nm process.

> between
> one version and the other for T-PHYs, for which, it may be a good
> idea to add
> a PHY version check before allowing to write settings that are
> supported only
> on a specific IP...
Do you know which SoC used bits, I can confirm it with our DE.

Thanks a lot

> 
> Regards,
> Angelo
> 


