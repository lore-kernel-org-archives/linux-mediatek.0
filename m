Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FA6C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 07:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D65823104
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 07:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D65823104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N2gGPRQXeiSC90cNKImbNXRfB6cwIlN51zDPul9SIR8=; b=lerCKfX6MJ51kXmB8kQB3rO73
	i5s7IWcvKuleSY6m2aq/g83aZJBH4Owk/IfhpJkao+UZnX4OYu+saDgxZ8PFk92zyKHoLiHsxUV57
	E8k8rFsaGBEebYnQCzj1rSq0jUfdTfI/qtizv+tVlwH9DAYDFzRKmlEVLbIspH87fCIV6ip+E0rlP
	QPulrKVduOF6TyYjYGhQr2H948lFL9vDxQyFTL6pn1nclVmhXgNZW6b6v79/zV4MAu5IZpvL7xPPq
	CYFxweq+nJy/G12BqcnO3qo+j9T2MozwdBdXiAAjlbiE7dTk5f9rv2M47y0hhRIXlXkfgsFmEeHAy
	bgCm1jMbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx3HJ-0004nc-1d; Wed, 06 Jan 2021 07:30:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx3HD-0004m8-Ao; Wed, 06 Jan 2021 07:30:40 +0000
X-UUID: 23bfe3de866d4ae9bd23eebfdd30912b-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZtvyTeV6nYp/Nf3LzNM+kf9MIE+PbmFyyw+N6xtJFVU=; 
 b=YeG5euRPi+/i8lcHDeU0pNFnavNBWXzd1pzvD922maDLA5aB+4cnXozg8/c5TqK09R/kTAYzJHtCmZ8048y9weWfP8wp6HMj6QKHiNTkfkeJF9cyLb6g4vEvyW19HUUHEQ7aqkzE87eNQTZqieRX6fOlAWQdQopd/h1SGgsOlI4=;
X-UUID: 23bfe3de866d4ae9bd23eebfdd30912b-20210105
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1879201683; Tue, 05 Jan 2021 23:30:36 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 23:30:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 15:30:32 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Jan 2021 15:30:32 +0800
Message-ID: <1609918232.23066.5.camel@mtksdaap41>
Subject: Re: [PATCH V6 08/13] interconnect: mediatek: Add interconnect
 provider driver
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>
Date: Wed, 6 Jan 2021 15:30:32 +0800
In-Reply-To: <c8b951b0-6412-d905-99e1-6350283b57c1@linaro.org>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-9-git-send-email-henryc.chen@mediatek.com>
 <c8b951b0-6412-d905-99e1-6350283b57c1@linaro.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_023039_619350_B413DC96 
X-CRM114-Status: GOOD (  29.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 James Liao <jamesjj.liao@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Ryan Case <ryandcase@chromium.org>, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-04 at 20:36 +0200, Georgi Djakov wrote:
> On 12/24/20 08:08, Henry Chen wrote:
> > Introduce Mediatek MT6873/MT8183/MT8192 specific provider driver
> > using the interconnect framework.
> > 
> >               ICC provider         ICC Nodes
> >                                ----          ----
> >               ---------       |CPU |   |--- |VPU |
> >      -----   |         |-----  ----    |     ----
> >     |DRAM |--|DRAM     |       ----    |     ----
> >     |     |--|scheduler|----- |GPU |   |--- |DISP|
> >     |     |--|(EMI)    |       ----    |     ----
> >     |     |--|         |       -----   |     ----
> >      -----   |         |----- |MMSYS|--|--- |VDEC|
> >               ---------        -----   |     ----
> >                 /|\                    |     ----
> >                  |change DRAM freq     |--- |VENC|
> >               ----------               |     ----
> >              |  DVFSR   |              |
> >              |          |              |     ----
> >               ----------               |--- |IMG |
> >                                        |     ----
> >                                        |     ----
> >                                        |--- |CAM |
> >                                              ----
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > ---
> >   drivers/interconnect/Kconfig            |   1 +
> >   drivers/interconnect/Makefile           |   1 +
> >   drivers/interconnect/mediatek/Kconfig   |  13 ++
> >   drivers/interconnect/mediatek/Makefile  |   3 +
> >   drivers/interconnect/mediatek/mtk-emi.c | 330 ++++++++++++++++++++++++++++++++
> >   5 files changed, 348 insertions(+)
> >   create mode 100644 drivers/interconnect/mediatek/Kconfig
> >   create mode 100644 drivers/interconnect/mediatek/Makefile
> >   create mode 100644 drivers/interconnect/mediatek/mtk-emi.c
> > 
> > diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
> > index 5b7204e..e939f5a 100644
> > --- a/drivers/interconnect/Kconfig
> > +++ b/drivers/interconnect/Kconfig
> > @@ -13,5 +13,6 @@ if INTERCONNECT
> >   
> >   source "drivers/interconnect/imx/Kconfig"
> >   source "drivers/interconnect/qcom/Kconfig"
> > +source "drivers/interconnect/mediatek/Kconfig"
> 
> Sort alphabetically please.
Ok
> 
> >   
> >   endif
> > diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
> > index d203520..0643a24 100644
> > --- a/drivers/interconnect/Makefile
> > +++ b/drivers/interconnect/Makefile
> > @@ -6,3 +6,4 @@ icc-core-objs				:= core.o bulk.o
> >   obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
> >   obj-$(CONFIG_INTERCONNECT_IMX)		+= imx/
> >   obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
> > +obj-$(CONFIG_INTERCONNECT_MTK)		+= mediatek/
> 
> Ditto.
Ok
> 
> > diff --git a/drivers/interconnect/mediatek/Kconfig b/drivers/interconnect/mediatek/Kconfig
> > new file mode 100644
> > index 0000000..972d3bb
> > --- /dev/null
> > +++ b/drivers/interconnect/mediatek/Kconfig
> > @@ -0,0 +1,13 @@
> > +config INTERCONNECT_MTK
> > +	bool "Mediatek Network-on-Chip interconnect drivers"
> > +	depends on ARCH_MEDIATEK
> > +	help
> > +	  Support for Mediatek's Network-on-Chip interconnect hardware.
> > +
> > +config INTERCONNECT_MTK_EMI
> > +	tristate "Mediatek EMI interconnect driver"
> > +	depends on INTERCONNECT_MTK
> > +	depends on (MTK_DVFSRC && OF)
> 
> Would it be possible to enable COMPILE_TEST?
Do you means change to "depends on (MTK_DVFSRC && OF) || COMPILE_TEST" ?
> 
> > +	help
> > +	  This is a driver for the Mediatek Network-on-Chip on DVFSRC-based
> > +	  platforms.
> > diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
> > new file mode 100644
> > index 0000000..353842b
> > --- /dev/null
> > +++ b/drivers/interconnect/mediatek/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-$(CONFIG_INTERCONNECT_MTK_EMI) += mtk-emi.o
> > \ No newline at end of file
> > diff --git a/drivers/interconnect/mediatek/mtk-emi.c b/drivers/interconnect/mediatek/mtk-emi.c
> > new file mode 100644
> > index 0000000..9670077
> > --- /dev/null
> > +++ b/drivers/interconnect/mediatek/mtk-emi.c
> > @@ -0,0 +1,330 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> 
> Just a reminder that the year should be updated when you re-submit.
OK, thanks for reminding me.
> 
> > + *
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/interconnect-provider.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/soc/mediatek/mtk_dvfsrc.h>
> > +#include <dt-bindings/interconnect/mtk,mt8183-emi.h>
> > +#include <dt-bindings/interconnect/mtk,mt6873-emi.h>
> 
> Nit: Alphanumeric order please.
OK.
> 
> [..]
> > +static int emi_icc_remove(struct platform_device *pdev);
> > +static int emi_icc_probe(struct platform_device *pdev)
> > +{
> > +	const struct of_device_id *match;
> > +	const struct mtk_icc_desc *desc;
> > +	struct device *dev = &pdev->dev;
> > +	struct icc_node *node;
> > +	struct icc_onecell_data *data;
> > +	struct icc_provider *provider;
> > +	struct mtk_icc_node **mnodes;
> > +	size_t num_nodes, i, j;
> > +	int ret;
> > +
> > +	match = of_match_node(emi_icc_of_match, dev->parent->of_node);
> > +
> > +	if (!match) {
> > +		dev_err(dev, "invalid compatible string\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	desc = match->data;
> > +	mnodes = desc->nodes;
> > +	num_nodes = desc->num_nodes;
> > +
> > +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> > +	if (!provider)
> > +		return -ENOMEM;
> > +
> > +	data = devm_kzalloc(dev, struct_size(data, nodes, num_nodes),
> > +			    GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	provider->dev = pdev->dev.parent;
> > +	provider->set = emi_icc_set;
> > +	provider->aggregate = emi_icc_aggregate;
> > +	provider->xlate = of_icc_xlate_onecell;
> > +	INIT_LIST_HEAD(&provider->nodes);
> > +	provider->data = data;
> > +
> > +	ret = icc_provider_add(provider);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "error adding interconnect provider\n");
> > +		return ret;
> > +	}
> > +
> > +	for (i = 0; i < num_nodes; i++) {
> > +		node = icc_node_create(mnodes[i]->id);
> > +		if (IS_ERR(node)) {
> > +			ret = PTR_ERR(node);
> > +			goto err;
> > +		}
> > +
> > +		node->name = mnodes[i]->name;
> > +		node->data = mnodes[i];
> > +		icc_node_add(node, provider);
> > +
> > +		for (j = 0; j < mnodes[i]->num_links; j++)
> > +			icc_link_create(node, mnodes[i]->links[j]);
> > +
> > +		data->nodes[i] = node;
> > +	}
> > +	data->num_nodes = num_nodes;
> > +
> > +	platform_set_drvdata(pdev, provider);
> > +
> > +	return 0;
> > +err:
> > +	icc_nodes_remove(provider);
> 
> Also call icc_provider_del() to restore the original state on error.
OK.

Thanks,
Henry
> 
> Thanks,
> Georgi
> 
> > +	return ret;
> > +}
> > +
> > +static int emi_icc_remove(struct platform_device *pdev)
> > +{
> > +	struct icc_provider *provider = platform_get_drvdata(pdev);
> > +
> > +	icc_nodes_remove(provider);
> > +	return icc_provider_del(provider);
> > +}
> > +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
