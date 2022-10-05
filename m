Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3579FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 03:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l++tDTe/Ey7r7vz08SJ6/yWuulHXB7VnLylABIX69M8=; b=zt07bPKpmA8y5SaP0WtFPk9IBF
	gVQjCZ2CDJmLZbkaGnCdJkTS8v9gNfn0mr1T7VJYkX2QBmpaulsJWxT1kSqS6QZK9baAngta6+bxA
	XBrxbhVn++VdpqC1z4DTNP9Xuz59mODdRbRtwKqRYriKbsV35qZUgqQ8aK9DtPTy0wkoVM2Jt0wii
	khHIdshShwig8ZJ8aInu+RI8mhNwTp956PgScPrmQw3Edg/iyCWaTGPxwwGvMmShEdJ4JMt5YxvHX
	lTMutYGP/r1R+amoUbZHpE1NV4eS/mlnoEwU7E9CilaUtjxhNxsiK/9SsTpMoGp6ZVFyLpjRAuCb6
	ThuCihMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofvKK-00CGZa-Ox; Wed, 05 Oct 2022 03:44:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofvKF-00CGVs-S5; Wed, 05 Oct 2022 03:44:05 +0000
X-UUID: 7fd31210c4c1454fbf14275e9697ed69-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=l++tDTe/Ey7r7vz08SJ6/yWuulHXB7VnLylABIX69M8=;
	b=tpOq8FzrYVMCDQVMOG2p8b3EbfsvDxaWB4juJHgKw6Hf+LZsW39xVbsh2xn6pdDR1w3EThtc0Z+jXxXV7z1N/Kg9JhRRXx2RR1sxBJ/mFVi+So7eFj1KhwH+7HfIcytLcSxkypt5KvSDUqiMcG7oDbu1PQcuOrH75FBxizvxGCc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:4d87a0d2-4728-493f-beab-af377af6b038,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:a9698ab8-daef-48a8-8c50-40026d6a74c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7fd31210c4c1454fbf14275e9697ed69-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 654875152; Tue, 04 Oct 2022 20:43:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 5 Oct 2022 10:43:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 5 Oct 2022 10:43:21 +0800
Message-ID: <d48ca6634dbbbe8872253265fd3c2933e905990f.camel@mediatek.com>
Subject: Re: [PATCH v1 3/6] soc: mediatek: mmsys: add support for MT8195
 VPPSYS
From: moudy ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>
Date: Wed, 5 Oct 2022 10:43:21 +0800
In-Reply-To: <15791b10-fdeb-3776-d7f5-968cb0fa85dc@collabora.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
	 <20221004093319.5069-4-moudy.ho@mediatek.com>
	 <15791b10-fdeb-3776-d7f5-968cb0fa85dc@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_204403_978972_C2E8DBC4 
X-CRM114-Status: GOOD (  26.56  )
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

Hi Angelo,

On Tue, 2022-10-04 at 14:17 +0200, AngeloGioacchino Del Regno wrote:
> Il 04/10/22 11:33, Moudy Ho ha scritto:
> > From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> > 
> > Add MT8195 VPPSYS0 and VPPSYS1 driver data.
> > 
> > Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 20 +++++++++++++++++++-
> >   drivers/soc/mediatek/mtk-mmsys.h |  1 +
> >   2 files changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index d2c7a87aab87..c4d15f99f853 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -149,11 +149,25 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data = {
> >   	.clk_driver = "clk-mt8195-vdo1",
> >   };
> >   
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vppsys0_driver_data = {
> > +	.io_start = 0x14000000,
> > +	.clk_driver = "clk-mt8195-vpp0",
> > +	.is_copies = true,
> > +};
> > +
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vppsys1_driver_data = {
> > +	.io_start = 0x14f00000,
> > +	.clk_driver = "clk-mt8195-vpp1",
> > +	.is_copies = true,
> > +};
> > +
> >   static const struct mtk_mmsys_match_data mt8195_mmsys_match_data
> > = {
> > -	.num_drv_data = 2,
> > +	.num_drv_data = 4,
> 
> After a long discussion, it was chosen to not use the io_start way,
> but to change
> the devicetree compatible....
> 
> Check this series, and rebase on top of it:
> 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097__;!!CTRNKA9wMg0ARbw!3qjICTDNn82OJyHA0U_WAuEnMSy1mL31r14l72jY5rSrBaJN0_tDU_08BBZcEm6V$
>  
> 
> Cheers,
> Angelo
> 

Sorry for not noticing the change here, I'll rebase on it and fix
accordingly.

> >   	.drv_data = {
> >   		&mt8195_vdosys0_driver_data,
> >   		&mt8195_vdosys1_driver_data,
> > +		&mt8195_vppsys0_driver_data,
> > +		&mt8195_vppsys1_driver_data,
> >   	},
> >   };
> >   
> > @@ -360,6 +374,9 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   	if (IS_ERR(clks))
> >   		return PTR_ERR(clks);
> >   
> > +	if (mmsys->data->is_copies)
> 
> I don't get what "is_copies" means, sorry. I'm sure that there's a
> better name
> for this one.
> 

It's a flag to avoid probing the DRM driver multiple times.
Would it be more readable if the name was changed to "is_vppsys"?

> > +		goto out_probe_done;
> > +
> >   	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
> >   					    PLATFORM_DEVID_AUTO, NULL,
> > 0);
> >   	if (IS_ERR(drm)) {
> 
> Regards,
> Angelo
> 

Thanks and Regards,
Moudy


