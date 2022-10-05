Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F38AC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 01:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Zpx8ktdjjHpYduYxQiQRtdAtox4riwpxd3rRhS3FUY=; b=yWS0zxD4wZj0EVEAkPQiz8Qa94
	ofXv6J7fttlVq5ayO0kVIxlX7kwRFHyBRO8YUbFTwpgRygLbRX9O6X+VIRm44ztW+hBtidyCL2pnN
	0xHi2Pym0b6eIhOkfKwZoy94Qdon+0my7T1LLYi4ReMd4j3Qo+Zi/naLgS+zUwy7vJF/nK78l6o/8
	5UC61PDwmSEKTTYJNXGjD8Eyd9rAK2CZXRh+i5/yB3lQkxmO8cniWkTEqxPTtGVuASHSt9J5IJnVS
	JuBZ9yQuYZG2ttKEEA6UXjuTtzv3E0wiSIsLgWuu0FNaeJF2VWh1g3S3FNEBtygIkcMpxSqLlBK/V
	f0z3/xWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oftXK-00BvtT-Aa; Wed, 05 Oct 2022 01:49:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oftXF-00Bvqj-MZ; Wed, 05 Oct 2022 01:49:24 +0000
X-UUID: 6be8d8f8e79b4aaa9ae167d5f88c3b21-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1Zpx8ktdjjHpYduYxQiQRtdAtox4riwpxd3rRhS3FUY=;
	b=Wy+Q1I1HW6sRkoPE7ScEiePch1/GY8+fdwd5ntS49vnOFiNDKXo9WgB7VQhQKUn8sSL7s3JXDRsQOD0Ce3gmZnmpXLqXfa+7MQFEgcgJ/VyHT/1MFKs2Z9UqTTUZTnZuZ9MCP9I0PcVSd/6F9OnEsmpEVhTZw3gQjFpzwW+G+Os=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b46ac1fb-f797-41fc-8549-b7751064b89a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:89e73ffe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6be8d8f8e79b4aaa9ae167d5f88c3b21-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1275286131; Tue, 04 Oct 2022 18:49:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 5 Oct 2022 09:48:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 5 Oct 2022 09:48:37 +0800
Message-ID: <c7bcc52c1530de4b3e8d96b6adc3322e5755378c.camel@mediatek.com>
Subject: Re: [PATCH v1 4/6] soc: mediatek: mmsys: add config api for RSZ
 switching and DCM
From: moudy ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>
Date: Wed, 5 Oct 2022 09:48:37 +0800
In-Reply-To: <4471ec11-40f6-3d93-e6a7-c746a427e8ca@collabora.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
	 <20221004093319.5069-5-moudy.ho@mediatek.com>
	 <4471ec11-40f6-3d93-e6a7-c746a427e8ca@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_184921_905742_E519A714 
X-CRM114-Status: GOOD (  27.21  )
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

On Tue, 2022-10-04 at 14:17 +0200, AngeloGioacchino Del Regno wrote:
> Il 04/10/22 11:33, Moudy Ho ha scritto:
> > From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> > 
> > Due to MT8195 HW design, some RSZs have additional settings that
> > need to be configured in MMSYS.
> > 
> > Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> 
> Hello Moudy,
> 
> please remember that you have to add your Signed-off-by tag to all of
> the commits
> that you're sending, even if you're not the author, otherwise they
> are not
> acceptable.
> 

Hi Angelo,

Thanks for the reminder, I'll add the required tags and resend the
entire patch.

Regards,
Moudy
> > ---
> >   drivers/soc/mediatek/mt8195-mmsys.h    |  8 ++++++
> >   drivers/soc/mediatek/mtk-mmsys.c       | 40
> > ++++++++++++++++++++++++++
> >   include/linux/soc/mediatek/mtk-mmsys.h |  4 +++
> >   3 files changed, 52 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index abfe94a30248..e0cf13d09763 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -75,6 +75,14 @@
> >   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		
> > (2 << 16)
> >   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			
> > (3 << 16)
> >   
> > +/* VPPSYS1 */
> > +#define MT8195_SVPP1_HW_DCM_1ST_DIS0				
> > 0x150
> > +#define MT8195_SVPP1_HW_DCM_1ST_DIS1				
> > 0x160
> > +#define MT8195_SVPP1_HW_DCM_2ND_DIS0				
> > 0x1a0
> > +#define MT8195_SVPP1_HW_DCM_2ND_DIS1				
> > 0x1b0
> > +#define MT8195_SVPP2_BUF_BF_RSZ_SWITCH				
> > 0xf48
> > +#define MT8195_SVPP3_BUF_BF_RSZ_SWITCH				
> > 0xf74
> > +
> >   static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[]
> > = {
> >   	{
> >   		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index c4d15f99f853..c98cfcb7db38 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -261,6 +261,46 @@ void mtk_mmsys_ddp_dpi_fmt_config(struct
> > device *dev, u32 val)
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
> >   
> > +void mtk_mmsys_merge_config(struct device *dev, u32 id, bool
> > enable)
> 
> void mtk_mmsys_merge_config(struct device *dev, u32 svpp_id, bool
> enable)
> 
> or
> 
> void mtk_mmsys_vpp_merge_config(struct device *dev, u32 id, bool
> enable)
> 
> ...adding that "svpp" or "vpp" word makes the function easier to
> understand :-)
> 
> > +{
> > +	u32 reg;
> > +
> > +	switch (id) {
> > +	case 2:
> > +		reg = MT8195_SVPP2_BUF_BF_RSZ_SWITCH;
> > +		break;
> > +	case 3:
> > +		reg = MT8195_SVPP3_BUF_BF_RSZ_SWITCH;
> > +		break;
> > +	default:
> > +		dev_err(dev, "Invalid id %d\n", id);
> > +		return;
> > +	}
> > +
> > +	mtk_mmsys_update_bits(dev_get_drvdata(dev), reg, ~0, enable);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_merge_config);
> > +
> > +void mtk_mmsys_rsz_dcm_config(struct device *dev, bool enable)
> 
> ...would be the same here, but only about the function name, so I'd
> go with
> changing the name for both.
> 
> > +{
> > +	u32 val = 0;
> > +
> > +	if (enable)
> > +		val = BIT(25);
> 
> No magic bits please, add a definition for them
> 
> > +	mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > +			      MT8195_SVPP1_HW_DCM_1ST_DIS0, BIT(25),
> > val);
> > +	mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > +			      MT8195_SVPP1_HW_DCM_2ND_DIS0, BIT(25),
> > val);
> > +
> > +	if (enable)
> > +		val = (BIT(4) | BIT(5));
> 
> same here
> 
> > +	mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > +			      MT8195_SVPP1_HW_DCM_1ST_DIS1, (BIT(4) |
> > BIT(5)), val);
> > +	mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > +			      MT8195_SVPP1_HW_DCM_2ND_DIS1, (BIT(4) |
> > BIT(5)), val);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_rsz_dcm_config);
> > +
> >   static int mtk_mmsys_reset_update(struct reset_controller_dev
> > *rcdev, unsigned long id,
> >   				  bool assert)
> >   {
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index d2b02bb43768..2d5c7fe920b0 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -67,4 +67,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >   
> >   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
> >   
> > +void mtk_mmsys_merge_config(struct device *dev, u32 id, bool
> > enable);
> > +
> > +void mtk_mmsys_rsz_dcm_config(struct device *dev, bool enable);
> > +
> >   #endif /* __MTK_MMSYS_H */
> 
> 


