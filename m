Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CC2C25B08
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 02:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xK7311ANU00lS4znpHOZCY3yfTNv79MRZvxQaegyvUw=; b=hRzZGeD76GS4IyC3f+NsdI486W
	wfgf+syGx3RcQk9f947KckZaaLX6DFud94ljFpEBdLMCjSd0w/K8CFWsHbbomqqe7blsfTdxDm7DI
	lmPfFzg+dvjlEqLKqegj0TPOrj6BDHNuWHeqPEIWcIh+WDYi6KDJUy8q43FcBQjp1kUpm2oqf1Suo
	iSNTO8GJTD+pV68gEL0QMgtQ9Iid8wJI1eLb5hrR8CP8LeYVddmNd7eUQb+INRujOx0stomXXiAxb
	VqVwNnwDQUyZcaw3TVVaYg098WcIiVr1gJwP2YsAFVqXP6D+jiv8oD5Mrrl7llXs+6tvuZA2csfXc
	3YmJ5tmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOVcG-00C2Me-5k; Thu, 18 Aug 2022 02:50:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOVcC-00C270-UI; Thu, 18 Aug 2022 02:50:38 +0000
X-UUID: 6e26809c694a49d9bffd93650d5f7b92-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xK7311ANU00lS4znpHOZCY3yfTNv79MRZvxQaegyvUw=;
	b=NwhEtBIItolTdIq4Kv3herp1IfpqSpIU0ezM62GD7kl5SijpZCq4EShj/dR+BZFFIhvSp662xusfLKqaWoaAiCf9ix7oNQPWewEaLL4JLUjJTOMneHaUopou1JXQXIB3Jrl51P8UkZlzD0a4tLPZqZoFNiZqoYvt15JFWe9khwU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:aabc4d1e-776a-4f25-99db-fa9306403447,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:a6effd9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6e26809c694a49d9bffd93650d5f7b92-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <hui.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 887895802; Wed, 17 Aug 2022 19:50:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 18 Aug 2022 10:49:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 18 Aug 2022 10:49:43 +0800
Message-ID: <e1e9fef1d776c7051d708b7bf9f6e347a9107dd5.camel@mediatek.com>
Subject: Re: [PATCH v5 2/2] pinctrl: mediatek: add mt8188 driver
From: hui.liu <hui.liu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jianguo.zhang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 18 Aug 2022 10:49:43 +0800
In-Reply-To: <20220817195500.d6roam5gyghburjs@notapiano>
References: <20220801095215.10876-1-hui.liu@mediatek.com>
	 <20220801095215.10876-3-hui.liu@mediatek.com>
	 <20220817195500.d6roam5gyghburjs@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_195037_148606_49AB13FF 
X-CRM114-Status: GOOD (  18.23  )
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

Hi Nicolas,

Thanks for you suggestion. I will update them in v6.

BRs,
Hui.Liu

On Wed, 2022-08-17 at 15:55 -0400, Nícolas F. R. A. Prado wrote:
> Hi Hui,
> 
> On Mon, Aug 01, 2022 at 05:52:15PM +0800, Hui Liu wrote:
> > From: "Hui.Liu" <hui.liu@mediatek.com>
> > 
> > Add pinctrl driver support for MediaTek SoC mt8188.
> > 
> > Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> > ---
> 
> [..]
> > --- /dev/null
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mt8188.c
> 
> [..]
> > +static const struct mtk_pin_field_calc mt8188_pin_mode_range[] = {
> > +	PIN_FIELD(0, 177, 0x0300, 0x10, 0, 4),
> > +};
> 
> Missing blank line after declaration.
> 
> > +static const struct mtk_pin_field_calc mt8188_pin_dir_range[] = {
> > +	PIN_FIELD(0, 177, 0x0000, 0x10, 0, 1),
> > +};
> 
> Ditto.
> 
> > +static const struct mtk_pin_field_calc mt8188_pin_di_range[] = {
> > +	PIN_FIELD(0, 177, 0x0200, 0x10, 0, 1),
> > +};
> 
> Ditto.
> 
> > +static const struct mtk_pin_field_calc mt8188_pin_do_range[] = {
> > +	PIN_FIELD(0, 177, 0x0100, 0x10, 0, 1),
> > +};
> 
> Ditto.
> 
> > +static const struct mtk_pin_field_calc mt8188_pin_smt_range[] = {
> 
> [..]
> > +static const struct mtk_pin_reg_calc
> > mt8188_reg_cals[PINCTRL_PIN_REG_MAX] = {
> > +	[PINCTRL_PIN_REG_MODE]	= MTK_RANGE(mt8188_pin_mode_range),
> > +	[PINCTRL_PIN_REG_DIR]	= MTK_RANGE(mt8188_pin_dir_range),
> > +	[PINCTRL_PIN_REG_DI]	= MTK_RANGE(mt8188_pin_di_range),
> > +	[PINCTRL_PIN_REG_DO]	= MTK_RANGE(mt8188_pin_do_range),
> > +	[PINCTRL_PIN_REG_SMT]	= MTK_RANGE(mt8188_pin_smt_range),
> > +	[PINCTRL_PIN_REG_IES]	= MTK_RANGE(mt8188_pin_ies_range),
> > +	[PINCTRL_PIN_REG_TDSEL]	=
> > MTK_RANGE(mt8188_pin_tdsel_range),
> > +	[PINCTRL_PIN_REG_RDSEL]	=
> > MTK_RANGE(mt8188_pin_rdsel_range),
> > +	[PINCTRL_PIN_REG_PUPD]	= MTK_RANGE(mt8188_pin_pupd_range),
> > +	[PINCTRL_PIN_REG_R0]	= MTK_RANGE(mt8188_pin_r0_range),
> > +	[PINCTRL_PIN_REG_R1]	= MTK_RANGE(mt8188_pin_r1_range),
> > +	[PINCTRL_PIN_REG_PU]	= MTK_RANGE(mt8188_pin_pu_range),
> > +	[PINCTRL_PIN_REG_PD]	= MTK_RANGE(mt8188_pin_pd_range),
> > +	[PINCTRL_PIN_REG_DRV]	= MTK_RANGE(mt8188_pin_drv_range),
> > +	[PINCTRL_PIN_REG_DRV_ADV]	=
> > MTK_RANGE(mt8188_pin_drv_adv_range),
> > +	[PINCTRL_PIN_REG_RSEL]	= MTK_RANGE(mt8188_pin_rsel_range),
> 
> Please use just space around the = instead of tabs. Like is done on
> mt8183,
> mt8186, mt8192 and mt8195.
> 
> > +};
> 
> [..]
> > +static const struct mtk_pin_soc mt8188_data = {
> > +	.reg_cal	= mt8188_reg_cals,
> > +	.pins	= mtk_pins_mt8188,
> > +	.npins	= ARRAY_SIZE(mtk_pins_mt8188),
> > +	.ngrps	= ARRAY_SIZE(mtk_pins_mt8188),
> > +	.eint_hw	= &mt8188_eint_hw,
> > +	.nfuncs	= 8,
> > +	.gpio_m	= 0,
> > +	.base_names	= mt8188_pinctrl_register_base_name,
> > +	.nbase_names	=
> > ARRAY_SIZE(mt8188_pinctrl_register_base_name),
> > +	.bias_set_combo	= mtk_pinconf_bias_set_combo,
> > +	.pull_type = mt8188_pull_type,
> > +	.pin_rsel = mt8188_pin_rsel_val_range,
> > +	.npin_rsel = ARRAY_SIZE(mt8188_pin_rsel_val_range),
> > +	.bias_get_combo	= mtk_pinconf_bias_get_combo,
> 
> Keep this one together with bias_set_combo.
> 
> > +	.drive_set	= mtk_pinconf_drive_set_rev1,
> > +	.drive_get	= mtk_pinconf_drive_get_rev1,
> > +	.adv_drive_set	= mtk_pinconf_adv_drive_set_raw,
> > +	.adv_drive_get	= mtk_pinconf_adv_drive_get_raw,
> 
> And also use spaces instead of tabs for all entries here.
> 
> With those changes,
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Thanks,
> Nícolas


