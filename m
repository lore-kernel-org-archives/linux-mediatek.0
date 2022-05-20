Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B04C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 05:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVckoFzt+MIiE1MurZq6IUFUGb3Xy40QIIEqOTQqXAA=; b=HaWJGAnESKu0SY
	AtZQ5wLfOxGX+uEwjTvsMZz19rAmFNtDzlmEiG0oDuCNHTz64KXnWBlFAH3ZNf8GlSAwySLxUmm1R
	8jUjNBFk7SnJRqCDPcLyGq1+phxNBY1KzzW0+cxTON9G+/ECahpnVui6G8xJ5UaoIWXX/D92vSGAB
	Uh93+j0+unUdtUqdEyIx0efQP3EWPPcJ2fy+aAoh1vzOrzz/KnzLecX1NN3fcDyhulbztwPbQnmO+
	MN7Pc7a5oXIYG1c60iYqxTGiqn0PKSY+cysV8NA0zAeMydy2WZIHtZ0Yf+EIoCpqaGWx15/MR8PCz
	JwwcaeVNQ8RHYuLYH1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrux7-00AY7i-9S; Fri, 20 May 2022 05:13:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrux3-00AY6y-Ts; Fri, 20 May 2022 05:13:27 +0000
X-UUID: ccd34cf54ee044cc88dce04dbfca33aa-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:3331d03a-bb2f-4e82-b939-2ea5217502e5, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:6ad4f579-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: ccd34cf54ee044cc88dce04dbfca33aa-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1902823509; Thu, 19 May 2022 22:13:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 22:08:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 13:08:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 13:08:38 +0800
Message-ID: <095dd1c9d136e956ee2b53c90796bfc6a794d4e8.camel@mediatek.com>
Subject: Re: [PATCH v2 4/4] soc: mediatek: svs: add support for mt8195
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
 <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Date: Fri, 20 May 2022 13:08:38 +0800
In-Reply-To: <2f2b6002-d505-48f3-cf10-5680d3280024@collabora.com>
References: <20220519060924.13493-1-jia-wei.chang@mediatek.com>
 <20220519060924.13493-5-jia-wei.chang@mediatek.com>
 <2f2b6002-d505-48f3-cf10-5680d3280024@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_221326_003779_91DB7857 
X-CRM114-Status: GOOD (  33.07  )
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

On Thu, 2022-05-19 at 10:34 +0200, AngeloGioacchino Del Regno wrote:
> Il 19/05/22 08:09, Tim Chang ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > To support svs on MT8195, add corresponding bank information,
> > platform
> > data, probe and parsing function.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Hello Jia-Wei,
> thanks for the patch!
> 
> However, there are a few things to improve...
> 
> > ---
> >   drivers/soc/mediatek/mtk-svs.c | 193
> > +++++++++++++++++++++++++++++++++
> >   1 file changed, 193 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-svs.c
> > b/drivers/soc/mediatek/mtk-svs.c
> > index 656d0361ff7d..919226faee6d 100644
> > --- a/drivers/soc/mediatek/mtk-svs.c
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> > @@ -1680,6 +1680,92 @@ static int svs_bank_resource_setup(struct
> > svs_platform *svsp)
> >   	return 0;
> >   }
> >   
> > +static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
> > +{
> > +	struct svs_bank *svsb;
> > +	struct nvmem_cell *cell;
> > +	u32 idx, i, ft_pgm, vmin, golden_temp;
> > +
> > +	for (i = 0; i < svsp->efuse_max; i++)
> > +		if (svsp->efuse[i])
> > +			dev_info(svsp->dev, "M_HW_RES%d: 0x%08x\n",
> > +				 i, svsp->efuse[i]);
> > +
> > +	if (!svsp->efuse[10]) {
> > +		dev_notice(svsp->dev, "svs_efuse[10] = 0x0?\n");
> > +		return false;
> > +	}
> > +
> > +	/* Svs efuse parsing */
> > +	ft_pgm = svsp->efuse[0] & GENMASK(7, 0);
> > +	vmin = (svsp->efuse[19] >> 4) & GENMASK(1, 0);
> > +
> > +	for (idx = 0; idx < svsp->bank_max; idx++) {
> > +		svsb = &svsp->banks[idx];
> > +
> > +		if (svsb->sw_id != SVSB_GPU)
> > +			return false;
> > +
> > +		if (vmin == 0x1)
> > +			svsb->vmin = 0x1e;
> > +
> > +		if (ft_pgm == 0)
> > +			svsb->volt_flags |= SVSB_INIT01_VOLT_IGNORE;
> > +
> > +		if (svsb->type == SVSB_LOW) {
> > +			svsb->mtdes = svsp->efuse[10] & GENMASK(7, 0);
> > +			svsb->bdes = (svsp->efuse[10] >> 16) &
> > GENMASK(7, 0);
> > +			svsb->mdes = (svsp->efuse[10] >> 24) &
> > GENMASK(7, 0);
> > +			svsb->dcbdet = (svsp->efuse[8]) & GENMASK(7,
> > 0);
> > +			svsb->dcmdet = (svsp->efuse[8] >> 8) &
> > GENMASK(7, 0);
> > +		} else if (svsb->type == SVSB_HIGH) {
> > +			svsb->mtdes = svsp->efuse[9] & GENMASK(7, 0);
> > +			svsb->bdes = (svsp->efuse[9] >> 16) &
> > GENMASK(7, 0);
> > +			svsb->mdes = (svsp->efuse[9] >> 24) &
> > GENMASK(7, 0);
> > +			svsb->dcbdet = (svsp->efuse[8]) & GENMASK(7,
> > 0);
> > +			svsb->dcmdet = (svsp->efuse[8] >> 8) &
> > GENMASK(7, 0);
> > +		}
> > +
> > +		svsb->vmax += svsb->dvt_fixed;
> > +	}
> > +
> > +	/* Thermal efuse parsing */
> > +	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
> > +	if (IS_ERR_OR_NULL(cell)) {
> > +		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
> > +			PTR_ERR(cell));
> > +		return false;
> > +	}
> > +
> > +	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
> > +	if (IS_ERR(svsp->tefuse)) {
> > +		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
> > +			PTR_ERR(svsp->tefuse));
> > +		nvmem_cell_put(cell);
> > +		return false;
> > +	}
> > +
> > +	svsp->tefuse_max /= sizeof(u32);
> > +	nvmem_cell_put(cell);
> > +
> > +	for (i = 0; i < svsp->tefuse_max; i++)
> > +		if (svsp->tefuse[i] != 0)
> > +			break;
> > +
> > +	if (i == svsp->tefuse_max)
> > +		golden_temp = 50; /* All thermal efuse data are 0 */
> > +	else
> > +		golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
> > +
> > +	for (idx = 0; idx < svsp->bank_max; idx++) {
> > +		svsb = &svsp->banks[idx];
> > +		svsb->mts = 500;
> > +		svsb->bts = (((500 * golden_temp + 250460) / 1000) -
> > 25) * 4;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >   static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
> >   {
> >   	struct svs_bank *svsb;
> > @@ -2141,6 +2227,39 @@ static struct device
> > *svs_add_device_link(struct svs_platform *svsp,
> >   	return dev;
> >   }
> >   
> > +static int svs_mt8195_platform_probe(struct svs_platform *svsp)
> 
> We can reuse svs_mt8192_platform_probe() for MT8195, as this is
> simply
> a duplicate of that.

Sure, I will remove svs_mt8195_platform_probe and reuse
svs_mt8192_platform_probe instead in the next version.

> 
> > +{
> > +	struct device *dev;
> > +	struct svs_bank *svsb;
> > +	u32 idx;
> > +
> > +	svsp->rst = devm_reset_control_get_optional(svsp->dev,
> > "svs_rst");
> > +	if (IS_ERR(svsp->rst))
> > +		return dev_err_probe(svsp->dev, PTR_ERR(svsp->rst),
> > +				     "cannot get svs reset control\n");
> > +
> > +	dev = svs_add_device_link(svsp, "lvts");
> > +	if (IS_ERR(dev))
> > +		return dev_err_probe(svsp->dev, PTR_ERR(dev),
> > +				     "failed to get lvts device\n");
> > +
> > +	for (idx = 0; idx < svsp->bank_max; idx++) {
> > +		svsb = &svsp->banks[idx];
> > +
> > +		if (svsb->type == SVSB_HIGH)
> > +			svsb->opp_dev = svs_add_device_link(svsp,
> > "mali");
> > +		else if (svsb->type == SVSB_LOW)
> > +			svsb->opp_dev = svs_get_subsys_device(svsp,
> > "mali");
> > +
> > +		if (IS_ERR(svsb->opp_dev))
> > +			return dev_err_probe(svsp->dev, PTR_ERR(svsb-
> > >opp_dev),
> > +					     "failed to get OPP device
> > for bank %d\n",
> > +					     idx);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static int svs_mt8192_platform_probe(struct svs_platform *svsp)
> >   {
> >   	struct device *dev;
> > @@ -2257,6 +2376,67 @@ static int svs_mt8183_platform_probe(struct
> > svs_platform *svsp)
> >   	return 0;
> >   }
> >   
> > +static struct svs_bank svs_mt8195_banks[] = {
> > +	{
> > +		.sw_id			= SVSB_GPU,
> > +		.type			= SVSB_LOW,
> > +		.set_freq_pct		= svs_set_bank_freq_pct_v3,
> > +		.get_volts		= svs_get_bank_volts_v3,
> > +		.tzone_name		= "gpu1",
> > +		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
> > +		.mode_support		= SVSB_MODE_INIT02,
> > +		.opp_count		= MAX_OPP_ENTRIES,
> > +		.freq_base		= 640000000,
> > +		.turn_freq_base		= 640000000,
> > +		.volt_step		= 6250,
> > +		.volt_base		= 400000,
> > +		.vmax			= 0x38,
> > +		.vmin			= 0x14,
> > +		.age_config		= 0x555555,
> > +		.dc_config		= 0x1,
> > +		.dvt_fixed		= 0x1,
> > +		.vco			= 0x18,
> > +		.chk_shift		= 0x87,
> > +		.core_sel		= 0x0fff0100,
> > +		.int_st			= BIT(0),
> > +		.ctl0			= 0x00540003,
> 
> 
> > +		.tzone_htemp		= 85000,
> > +		.tzone_htemp_voffset	= 0,
> > +		.tzone_ltemp		= 25000,
> > +		.tzone_ltemp_voffset	= 7,
> 
> tzone_{h,l}temp(_voffset) params are used only when (volt_flags &
> SVSB_MODE_MON).
> On this entry, there's no MON mode, so these four are useless: please
> remove.

Sure, I will remove them in the next version.

> 
> > +	},
> > +	{
> > +		.sw_id			= SVSB_GPU,
> > +		.type			= SVSB_HIGH,
> > +		.set_freq_pct		= svs_set_bank_freq_pct_v3,
> > +		.get_volts		= svs_get_bank_volts_v3,
> > +		.tzone_name		= "gpu1",
> > +		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT |
> > +					  SVSB_MON_VOLT_IGNORE,
> > +		.mode_support		= SVSB_MODE_INIT02 |
> > SVSB_MODE_MON,
> > +		.opp_count		= MAX_OPP_ENTRIES,
> > +		.freq_base		= 880000000,
> > +		.turn_freq_base		= 640000000,
> > +		.vboot			= 0x38,
> > +		.volt_step		= 6250,
> > +		.volt_base		= 400000,
> > +		.vmax			= 0x38,
> > +		.vmin			= 0x14,
> > +		.age_config		= 0x555555,
> > +		.dc_config		= 0x1,
> > +		.dvt_fixed		= 0x6,
> > +		.vco			= 0x18,
> > +		.chk_shift		= 0x87,
> > +		.core_sel		= 0x0fff0101,
> > +		.int_st			= BIT(1),
> > +		.ctl0			= 0x00540003,
> > +		.tzone_htemp		= 85000,
> > +		.tzone_htemp_voffset	= 0,
> > +		.tzone_ltemp		= 25000,
> > +		.tzone_ltemp_voffset	= 7,
> > +	},
> > +};
> > +
> >   static struct svs_bank svs_mt8192_banks[] = {
> >   	{
> >   		.sw_id			= SVSB_GPU,
> > @@ -2559,6 +2739,16 @@ static struct svs_bank svs_mt8183_banks[] =
> > {
> >   	},
> >   };
> >   
> > +static const struct svs_platform_data svs_mt8195_platform_data = {
> > +	.name = "mt8195-svs",
> > +	.banks = svs_mt8195_banks,
> > +	.efuse_parsing = svs_mt8195_efuse_parsing,
> > +	.probe = svs_mt8195_platform_probe,
> 
> 	.probe = svs_mt8192_platform_probe,

I will use mt8192's instead in the next version.
Thanks.

> 
> > +	.irqflags = IRQF_TRIGGER_HIGH,
> > +	.regs = svs_regs_v2,
> > +	.bank_max = ARRAY_SIZE(svs_mt8195_banks),
> > +};
> > +
> 
> Regards,
> Angelo
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
