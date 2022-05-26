Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FE8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 06:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq1Oz9BTRd1KnOy2cXJWzrIFfXrHus3T2cNVCUU944k=; b=D3Lt/Ok1h9yvQU
	rg55Wqctf/DxdliOCe2RUqObTpXFA6IFcfQV71j+AdW3k63AD9XZSj4s9oI0mQa3hLW4LKENNPTbp
	vSRrdg7WY1UP6XYhXaqFN2ZlF+EEnIt8QGAu+K1GgIijJ0aypKIKsV7sjQPN2qTrMk7wEQ5iNDUEm
	zXWBzMdQzta3bud3IAYBQxsaqy6VXy2ArtWWIdVXVXD4tICsneC8cGnWt4Mzix8TzQN/mgPZS8NBJ
	crdOYUyzntk+TbXFxHENvrZX+brIuQSq1uDkYpgZVLritPUvqg8sQB4c/n5yp79v+3eZ+fIiVwpOn
	ugASPrGy/2DU/3x0luxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu6Zc-00DZye-14; Thu, 26 May 2022 06:02:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu6ZZ-00DZxI-PG; Thu, 26 May 2022 06:02:15 +0000
X-UUID: 8c60f175d3d6417cbae3970e14ed4914-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:887f8c80-4d1d-4da7-81b0-3a325c4060e3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:06f18947-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 8c60f175d3d6417cbae3970e14ed4914-20220525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1461197523; Wed, 25 May 2022 23:02:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 22:52:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 13:52:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 May 2022 13:52:00 +0800
Message-ID: <48e3f8a9db7b4fe429ed55440b8fa437f40b12ba.camel@mediatek.com>
Subject: Re: [PATCH v3 2/4] soc: mediatek: svs: add support for mt8186
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
	<roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Date: Thu, 26 May 2022 13:52:00 +0800
In-Reply-To: <0a1c4797-cfdf-1b45-62f0-18ecf78ed335@collabora.com>
References: <20220523084034.26802-1-jia-wei.chang@mediatek.com>
	 <20220523084034.26802-3-jia-wei.chang@mediatek.com>
	 <0a1c4797-cfdf-1b45-62f0-18ecf78ed335@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_230213_874624_CF0359B8 
X-CRM114-Status: GOOD (  19.35  )
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

On Mon, 2022-05-23 at 11:38 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 10:40, Tim Chang ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > MT8186 svs has a number of banks which used as optimization of opp
> > voltage table for corresponding dvfs drivers.
> > MT8186 svs big core uses 2-line high bank and low bank to optimize
> > the
> > voltage of opp table for higher and lower frequency respectively.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   drivers/soc/mediatek/mtk-svs.c | 351
> > ++++++++++++++++++++++++++++++++-
> >   1 file changed, 344 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-svs.c
> > b/drivers/soc/mediatek/mtk-svs.c
> > index 606a00a2e57d..656d0361ff7d 100644
> > --- a/drivers/soc/mediatek/mtk-svs.c
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> 
> ..snip..
> 
> > @@ -2245,6 +2569,16 @@ static const struct svs_platform_data
> > svs_mt8192_platform_data = {
> >   	.bank_max = ARRAY_SIZE(svs_mt8192_banks),
> >   };
> >   
> > +static const struct svs_platform_data svs_mt8186_platform_data = {
> > +	.name = "mt8186-svs",
> > +	.banks = svs_mt8186_banks,
> > +	.efuse_parsing = svs_mt8186_efuse_parsing,
> > +	.probe = svs_mt8186_platform_probe,
> > +	.irqflags = IRQF_TRIGGER_HIGH,
> 
> I know I gave you my R-b tag earlier, but I've just noticed that:
> please remove
> irqflags, as this kind of flags are specified in devicetree and it is
> not
> necessary to specify them here.
> 
> Thanks,
> Angelo

Hi Angelo,

Sure, I will remove it in the next version.
Thanks.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
