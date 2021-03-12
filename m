Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4439C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 16:14:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D4A64FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 16:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D4A64FFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kTGXuwCWL+euJuXUy1L9OUW0JYTy+BbdgaIakDc4xAI=; b=DyeneQRLnG2dGjGE0ebEg8ETz
	ZX0FKmYR33jI1DD37R5cnN2/Lux+s/VpKq3H6iFNpfyFAQ0XTGiOXuy60tLYHBhvl947GXn/N1fpJ
	Wb4HQeabBWY1ig3c0DCFA+c3K31sSo5DIRHLmpU6uC16xZZbsQebqdm0xgW6xMQZnr4Q+uq0S0r+o
	BsWW/lTMEs+Sbn5Jqs6p+gzRt8hQmFbRThK094EVT9WOKD7VbqaHxvxo8DAZcs6J20CjX4hHpHmjo
	Yl3EfZ6wB1dyeqYAHWQ297NLzHEITwVh/3irVx4MMjshL77B3yFTLsN0YllbjpdY/kDouOWYmnLgJ
	DdJG4sh4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKkQO-00Buwi-Ut; Fri, 12 Mar 2021 16:14:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKkQ7-00BuuH-FC; Fri, 12 Mar 2021 16:13:53 +0000
X-UUID: 78d3ec19997a4f84b2731db085c560de-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1LBHk//yF6M689b0JWd+UTBmJ4vzqla62Z5lKdhbUsM=; 
 b=XpOnnl5fe36HKHdmlI84Vsug8CtBCad8xXMkYjosvglgjEXqRcac+VZTajYybMJtehy9sUI97MKIxPCY3AHAEPso4QDRpVremCnH/W6WBM2TUY3d//VydyPPU8xK2Z3dPr+jWHPZI5jwlPcvE2zBk8Die4Trh/r+cTH99PCfNG4=;
X-UUID: 78d3ec19997a4f84b2731db085c560de-20210312
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 290283045; Fri, 12 Mar 2021 08:13:42 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 08:13:40 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 00:13:39 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Mar 2021 00:13:39 +0800
Message-ID: <1615565619.27101.2.camel@mtksdaap41>
Subject: Re: [PATCH RESEND v5 5/8] mfd: Add support for the MediaTek MT6359
 PMIC
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Fei Shao <fshao@chromium.org>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Yuchen Huang <yuchen.huang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sat, 13 Mar 2021 00:13:39 +0800
In-Reply-To: <20210301102011.GI641347@dell>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20210301102011.GI641347@dell>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_161349_112909_19CFB3C2 
X-CRM114-Status: GOOD (  32.28  )
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

Hi,

On Mon, 2021-03-01 at 10:20 +0000, Lee Jones wrote:
> On Fri, 29 Jan 2021, Hsin-Hsiung Wang wrote:
> 
> > This adds support for the MediaTek MT6359 PMIC. This is a
> > multifunction device with the following sub modules:
> > 
> > - Codec
> > - Interrupt
> > - Regulator
> > - RTC
> > 
> > It is interfaced to the host controller using SPI interface
> > by a proprietary hardware called PMIC wrapper or pwrap.
> > MT6359 MFD is a child device of the pwrap.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> > changes since v4:
> > - remove unused compatible name in the mt6359 mfd cells.
> > ---
> >  drivers/mfd/mt6358-irq.c             |  24 ++
> >  drivers/mfd/mt6397-core.c            |  26 ++
> >  include/linux/mfd/mt6359/core.h      | 133 +++++++
> >  include/linux/mfd/mt6359/registers.h | 529 +++++++++++++++++++++++++++
> >  include/linux/mfd/mt6397/core.h      |   1 +
> >  5 files changed, 713 insertions(+)
> >  create mode 100644 include/linux/mfd/mt6359/core.h
> >  create mode 100644 include/linux/mfd/mt6359/registers.h
> > 
> > diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> > index 4b094e5e51cc..83f3ffbdbb4c 100644
> > --- a/drivers/mfd/mt6358-irq.c
> > +++ b/drivers/mfd/mt6358-irq.c
> > @@ -5,6 +5,8 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/mfd/mt6358/core.h>
> >  #include <linux/mfd/mt6358/registers.h>
> > +#include <linux/mfd/mt6359/core.h>
> > +#include <linux/mfd/mt6359/registers.h>
> >  #include <linux/mfd/mt6397/core.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -26,6 +28,17 @@ static const struct irq_top_t mt6358_ints[] = {
> >  	MT6358_TOP_GEN(MISC),
> >  };
> >  
> > +static const struct irq_top_t mt6359_ints[] = {
> > +	MT6359_TOP_GEN(BUCK),
> > +	MT6359_TOP_GEN(LDO),
> > +	MT6359_TOP_GEN(PSC),
> > +	MT6359_TOP_GEN(SCK),
> > +	MT6359_TOP_GEN(BM),
> > +	MT6359_TOP_GEN(HK),
> > +	MT6359_TOP_GEN(AUD),
> > +	MT6359_TOP_GEN(MISC),
> > +};
> > +
> >  static struct pmic_irq_data mt6358_irqd = {
> >  	.num_top = ARRAY_SIZE(mt6358_ints),
> >  	.num_pmic_irqs = MT6358_IRQ_NR,
> > @@ -33,6 +46,13 @@ static struct pmic_irq_data mt6358_irqd = {
> >  	.pmic_ints = mt6358_ints,
> >  };
> >  
> > +static struct pmic_irq_data mt6359_irqd = {
> > +	.num_top = ARRAY_SIZE(mt6359_ints),
> > +	.num_pmic_irqs = MT6359_IRQ_NR,
> > +	.top_int_status_reg = MT6359_TOP_INT_STATUS0,
> > +	.pmic_ints = mt6359_ints,
> > +};
> > +
> >  static void pmic_irq_enable(struct irq_data *data)
> >  {
> >  	unsigned int hwirq = irqd_to_hwirq(data);
> > @@ -195,6 +215,10 @@ int mt6358_irq_init(struct mt6397_chip *chip)
> >  		chip->irq_data = &mt6358_irqd;
> >  		break;
> >  
> > +	case MT6359_CHIP_ID:
> > +		chip->irq_data = &mt6359_irqd;
> > +		break;
> > +
> >  	default:
> >  		dev_err(chip->dev, "unsupported chip: 0x%x\n", chip->chip_id);
> >  		return -ENODEV;
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index 7518d74c3b4c..617e4e4d5de0 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -13,9 +13,11 @@
> >  #include <linux/mfd/core.h>
> >  #include <linux/mfd/mt6323/core.h>
> >  #include <linux/mfd/mt6358/core.h>
> > +#include <linux/mfd/mt6359/core.h>
> >  #include <linux/mfd/mt6397/core.h>
> >  #include <linux/mfd/mt6323/registers.h>
> >  #include <linux/mfd/mt6358/registers.h>
> > +#include <linux/mfd/mt6359/registers.h>
> >  #include <linux/mfd/mt6397/registers.h>
> >  
> >  #define MT6323_RTC_BASE		0x8000
> > @@ -99,6 +101,19 @@ static const struct mfd_cell mt6358_devs[] = {
> >  	},
> >  };
> >  
> > +static const struct mfd_cell mt6359_devs[] = {
> > +	{
> > +		.name = "mt6359-regulator",
> > +	}, {
> > +		.name = "mt6359-rtc",
> > +		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
> > +		.resources = mt6358_rtc_resources,
> > +		.of_compatible = "mediatek,mt6358-rtc",
> > +	}, {
> > +		.name = "mt6359-sound",
> > +	},
> > +};
> 
> Nit: Please put the single-line entries on one line.
> 
> Like this:
> 
> 	{ .name = "mt6359-sound" },
> 

Thanks for the comment. I will update it in the next patch.

> >  static const struct mfd_cell mt6397_devs[] = {
> >  	{
> >  		.name = "mt6397-rtc",
> > @@ -149,6 +164,14 @@ static const struct chip_data mt6358_core = {
> >  	.irq_init = mt6358_irq_init,
> >  };
> >  
> > +static const struct chip_data mt6359_core = {
> > +	.cid_addr = MT6359_SWCID,
> > +	.cid_shift = 8,
> > +	.cells = mt6359_devs,
> > +	.cell_size = ARRAY_SIZE(mt6359_devs),
> > +	.irq_init = mt6358_irq_init,
> > +};
> > +
> >  static const struct chip_data mt6397_core = {
> >  	.cid_addr = MT6397_CID,
> >  	.cid_shift = 0,
> > @@ -218,6 +241,9 @@ static const struct of_device_id mt6397_of_match[] = {
> >  	}, {
> >  		.compatible = "mediatek,mt6358",
> >  		.data = &mt6358_core,
> > +	}, {
> > +		.compatible = "mediatek,mt6359",
> > +		.data = &mt6359_core,
> >  	}, {
> >  		.compatible = "mediatek,mt6397",
> >  		.data = &mt6397_core,
> > diff --git a/include/linux/mfd/mt6359/core.h b/include/linux/mfd/mt6359/core.h
> > new file mode 100644
> > index 000000000000..61872f1ecbe4
> > --- /dev/null
> > +++ b/include/linux/mfd/mt6359/core.h
> > @@ -0,0 +1,133 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> 
> This is out of date.
> 

Thanks for the comment. I will update it in the next patch.

> > + */
> > +
> > +#ifndef __MFD_MT6359_CORE_H__
> > +#define __MFD_MT6359_CORE_H__
> 
> [...]
> 
> > +#endif /* __MFD_MT6359_CORE_H__ */
> > diff --git a/include/linux/mfd/mt6359/registers.h b/include/linux/mfd/mt6359/registers.h
> > new file mode 100644
> > index 000000000000..4d72f0a7f2b0
> > --- /dev/null
> > +++ b/include/linux/mfd/mt6359/registers.h
> > @@ -0,0 +1,529 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> 
> This too.
> 

Thanks for the comment. I will update it in the next patch.

> > + */
> > +
> > +#ifndef __MFD_MT6359_REGISTERS_H__
> > +#define __MFD_MT6359_REGISTERS_H__
> 
> [...]
> 
> > +#endif /* __MFD_MT6359_REGISTERS_H__ */
> > diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
> > index 949268581b36..56f210eebc54 100644
> > --- a/include/linux/mfd/mt6397/core.h
> > +++ b/include/linux/mfd/mt6397/core.h
> > @@ -13,6 +13,7 @@
> >  enum chip_id {
> >  	MT6323_CHIP_ID = 0x23,
> >  	MT6358_CHIP_ID = 0x58,
> > +	MT6359_CHIP_ID = 0x59,
> >  	MT6391_CHIP_ID = 0x91,
> >  	MT6397_CHIP_ID = 0x97,
> >  };
> 
> Once you fixed those issues, feel free to add my:
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 

Thanks a lot.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
