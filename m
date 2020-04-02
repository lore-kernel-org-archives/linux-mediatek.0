Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C43C43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 02:50:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7DA20719
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 02:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BnQCKjUt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J61Fw/AV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B7DA20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4IvwiAwib4Mr5Kw8n82tkoWCE1fx+UU7qwXtAXxN1U=; b=BnQCKjUtyLu6f+
	TCMfd+pLkbeUZ5R9dFuX+Rw57eXLbJPLArgRmd0MQh09XVgI/RtLJsQuPjcTYl5xNxDdaO0eaU6RB
	uvWD05r9KfvnojPQQKH5yXqFkn3bwLiZOXvLWRKwknqrEPFISsC/QfJY00eeidq4sjBeyCaaQMj3M
	WPF3EozrWG6vnYyeA2UbSm43JRqYak0GC4EBsbihe++Nb99sYVjZw0wC+9wqDIXkXusM7Ych2lQbp
	96OVkn3n6J6Ueja08tZBb9da6UNM3aJyT0qWOxfpR4WK4eCgCm0zON3u1J7FPxEg3WqXp8UvRiUlc
	p6n7AVnBCsAH47TK6BoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJpw3-0000rk-L3; Thu, 02 Apr 2020 02:50:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJpvm-00006x-PG; Thu, 02 Apr 2020 02:50:13 +0000
X-UUID: 487fd15d47774cd0a5836d1f97aa3761-20200401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q5OcvTavleQ4cdKM7PmbLnQcICB4TAgz/7dlDG7XNLo=; 
 b=J61Fw/AV3xHB+rHftvgHnAyoQPbGW1HHBKWhsZ1C+kdF3IaIEOVtX/aPmVtycSxGE3YVD5Zubpx2QyQmtxmfHrzohR+LxgbU1KkhSS7itHwo3ifQYdRqVN53ZI89qOKlD8qt4D92fNfKR4AVZsOQyxgG2YWy2Vsdyu2WHhk2RxU=;
X-UUID: 487fd15d47774cd0a5836d1f97aa3761-20200401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1215556861; Wed, 01 Apr 2020 18:50:04 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Apr 2020 19:48:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Apr 2020 10:48:06 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Apr 2020 10:48:06 +0800
Message-ID: <1585795687.27527.13.camel@mtksdaap41>
Subject: Re: [PATCH V4 09/13] interconnect: mediatek: Add mt8183
 interconnect provider driver
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>
Date: Thu, 2 Apr 2020 10:48:07 +0800
In-Reply-To: <2007da85-6ab8-225b-0ac7-b38bc9a590d2@linaro.org>
References: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
 <1584092066-24425-10-git-send-email-henryc.chen@mediatek.com>
 <2007da85-6ab8-225b-0ac7-b38bc9a590d2@linaro.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_195010_860206_DB450679 
X-CRM114-Status: GOOD (  25.85  )
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
 Mike Turquette <mturquette@linaro.org>, srv_heupstream@mediatek.com,
 James Liao <jamesjj.liao@mediatek.com>, Viresh Kumar <vireshk@kernel.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Ryan Case <ryandcase@chromium.org>,
 Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Georgi,

On Wed, 2020-04-01 at 17:55 +0300, Georgi Djakov wrote:
> Hi Henry,
> 
> Thanks for the patch!
> 
> On 3/13/20 11:34, Henry Chen wrote:
> > Introduce Mediatek MT8183 specific provider driver using the
> > interconnect framework.
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > ---
> >  drivers/interconnect/Kconfig            |   1 +
> >  drivers/interconnect/Makefile           |   1 +
> >  drivers/interconnect/mediatek/Kconfig   |  13 ++
> >  drivers/interconnect/mediatek/Makefile  |   3 +
> >  drivers/interconnect/mediatek/mtk-emi.c | 242 ++++++++++++++++++++++++++++++++
> >  5 files changed, 260 insertions(+)
> >  create mode 100644 drivers/interconnect/mediatek/Kconfig
> >  create mode 100644 drivers/interconnect/mediatek/Makefile
> >  create mode 100644 drivers/interconnect/mediatek/mtk-emi.c
> > 
> > diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
> > index bfa4ca3..dd9ecb6 100644
> > --- a/drivers/interconnect/Kconfig
> > +++ b/drivers/interconnect/Kconfig
> > @@ -12,5 +12,6 @@ menuconfig INTERCONNECT
> >  if INTERCONNECT
> >  
> >  source "drivers/interconnect/qcom/Kconfig"
> > +source "drivers/interconnect/mediatek/Kconfig"
> >  
> >  endif
> > diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
> > index 725029a..330a108 100644
> > --- a/drivers/interconnect/Makefile
> > +++ b/drivers/interconnect/Makefile
> > @@ -5,3 +5,4 @@ icc-core-objs				:= core.o
> >  
> >  obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
> >  obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
> > +obj-$(CONFIG_INTERCONNECT_MTK)		+= mediatek/
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
> > index 0000000..0a16992
> > --- /dev/null
> > +++ b/drivers/interconnect/mediatek/mtk-emi.c
> > @@ -0,0 +1,242 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> 
> Nit: Maybe 2020?
Yes, will change to 2020
> 
> > + *
> > + */
> > +
> > +#include <dt-bindings/interconnect/mtk,mt8183-emi.h>
> 
> Please move this below the all other linux/ headers
OK
> 
> > +#include <linux/device.h>
> > +#include <linux/interconnect-provider.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_platform.h>
> 
> Is this needed?
You're right, it not necessary and I will remove this.
> 
> > +#include <linux/platform_device.h>
> > +#include <soc/mediatek/mtk_dvfsrc.h>
> > +
> > +enum mtk_icc_name {
> > +	SLAVE_DDR_EMI,
> > +	MASTER_MCUSYS,
> > +	MASTER_GPUSYS,
> > +	MASTER_MMSYS,
> > +	MASTER_MM_VPU,
> > +	MASTER_MM_DISP,
> > +	MASTER_MM_VDEC,
> > +	MASTER_MM_VENC,
> > +	MASTER_MM_CAM,
> > +	MASTER_MM_IMG,
> > +	MASTER_MM_MDP,
> > +};
> > +
> > +#define MT8183_MAX_LINKS	1
> > +
> > +/**
> > + * struct mtk_icc_node - Mediatek specific interconnect nodes
> > + * @name: the node name used in debugfs
> > + * @ep: true if the node is an end point.
> > + * @id: a unique node identifier
> > + * @links: an array of nodes where we can go next while traversing
> > + * @num_links: the total number of @links
> > + * @buswidth: width of the interconnect between a node and the bus
> > + * @sum_avg: current sum aggregate value of all avg bw kBps requests
> > + * @max_peak: current max aggregate value of all peak bw kBps requests
> > + */
> > +struct mtk_icc_node {
> > +	unsigned char *name;
> > +	bool ep;
> > +	u16 id;
> > +	u16 links[MT8183_MAX_LINKS];
> > +	u16 num_links;
> > +	u16 buswidth;
> > +	u64 sum_avg;
> > +	u64 max_peak;
> > +};
> > +
> > +struct mtk_icc_desc {
> > +	struct mtk_icc_node **nodes;
> > +	size_t num_nodes;
> > +};
> > +
> > +#define DEFINE_MNODE(_name, _id, _buswidth, _ep, ...)	\
> > +		static struct mtk_icc_node _name = {			\
> > +		.name = #_name,						\
> > +		.id = _id,						\
> > +		.buswidth = _buswidth,					\
> > +		.ep = _ep,						\
> > +		.num_links = ARRAY_SIZE(((int[]){ __VA_ARGS__ })),	\
> > +}
> > +
> > +DEFINE_MNODE(ddr_emi, SLAVE_DDR_EMI, 1024, 1, 0);
> > +DEFINE_MNODE(mcusys, MASTER_MCUSYS, 256, 0, SLAVE_DDR_EMI);
> > +DEFINE_MNODE(gpu, MASTER_GPUSYS, 256, 0, SLAVE_DDR_EMI);
> > +DEFINE_MNODE(mmsys, MASTER_MMSYS, 256, 0, SLAVE_DDR_EMI);
> > +DEFINE_MNODE(mm_vpu, MASTER_MM_VPU, 128, 0, MASTER_MMSYS);
> > +DEFINE_MNODE(mm_disp, MASTER_MM_DISP, 128, 0, MASTER_MMSYS);
> > +DEFINE_MNODE(mm_vdec, MASTER_MM_VDEC, 128, 0, MASTER_MMSYS);
> > +DEFINE_MNODE(mm_venc, MASTER_MM_VENC, 128, 0, MASTER_MMSYS);
> > +DEFINE_MNODE(mm_cam, MASTER_MM_CAM, 128, 0, MASTER_MMSYS);
> > +DEFINE_MNODE(mm_img, MASTER_MM_IMG, 128, 0, MASTER_MMSYS);
> > +DEFINE_MNODE(mm_mdp, MASTER_MM_MDP, 128, 0, MASTER_MMSYS);
> > +
> > +static struct mtk_icc_node *mt8183_icc_nodes[] = {
> > +	[MT8183_SLAVE_DDR_EMI] = &ddr_emi,
> > +	[MT8183_MASTER_MCUSYS] = &mcusys,
> > +	[MT8183_MASTER_GPU] = &gpu,
> > +	[MT8183_MASTER_MMSYS] = &mmsys,
> > +	[MT8183_MASTER_MM_VPU] = &mm_vpu,
> > +	[MT8183_MASTER_MM_DISP] = &mm_disp,
> > +	[MT8183_MASTER_MM_VDEC] = &mm_vdec,
> > +	[MT8183_MASTER_MM_VENC] = &mm_venc,
> > +	[MT8183_MASTER_MM_CAM] = &mm_cam,
> > +	[MT8183_MASTER_MM_IMG] = &mm_img,
> > +	[MT8183_MASTER_MM_MDP] = &mm_mdp,
> > +};
> > +
> > +static struct mtk_icc_desc mt8183_icc = {
> 
> const?
ok
> 
> > +	.nodes = mt8183_icc_nodes,
> > +	.num_nodes = ARRAY_SIZE(mt8183_icc_nodes),
> > +};
> > +
> > +static int emi_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
> > +			     u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> > +{
> > +	struct mtk_icc_node *in;
> > +
> > +	in = node->data;
> > +
> > +	*agg_avg += avg_bw;
> > +	*agg_peak += peak_bw;
> > +
> > +	in->sum_avg = *agg_avg;
> > +	in->max_peak = *agg_peak;
> > +
> > +	return 0;
> > +}
> > +
> > +static int emi_icc_set(struct icc_node *src, struct icc_node *dst)
> > +{
> > +	int ret = 0;
> > +	struct mtk_icc_node *node;
> > +
> > +	node = dst->data;
> > +	if (node->ep) {
> > +		pr_debug("sum_avg (%llu), max_peak (%llu)\n",
> > +			 node->sum_avg, node->max_peak);
> > +		mtk_dvfsrc_send_request(src->provider->dev->parent,
> > +					MTK_DVFSRC_CMD_BW_REQUEST,
> > +					node->max_peak);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int emi_icc_remove(struct platform_device *pdev);
> > +static int emi_icc_probe(struct platform_device *pdev)
> > +{
> > +	int ret;
> > +	const struct mtk_icc_desc *desc;
> > +	struct icc_node *node;
> > +	struct icc_onecell_data *data;
> > +	struct icc_provider *provider;
> > +	struct mtk_icc_node **mnodes;
> > +	size_t num_nodes, i, j;
> > +
> > +	desc = of_device_get_match_data(&pdev->dev);
> > +	if (!desc)
> > +		return -EINVAL;
> > +
> > +	mnodes = desc->nodes;
> > +	num_nodes = desc->num_nodes;
> > +
> > +	provider = devm_kzalloc(&pdev->dev, sizeof(*provider), GFP_KERNEL);
> > +	if (!provider)
> > +		return -ENOMEM;
> > +
> > +	data = devm_kcalloc(&pdev->dev, num_nodes, sizeof(*node), GFP_KERNEL);
> 
> This should be:
> devm_kzalloc(&pdev->dev, struct_size(data, nodes, num_nodes), GFP_KERNEL);
thanks, will fix this.
> 
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	provider->dev = &pdev->dev;
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
> > +		dev_dbg(&pdev->dev, "registered node %s, num link: %d\n",
> > +			mnodes[i]->name, mnodes[i]->num_links);
> 
> Please remove this.
ok
> 
> > +
> > +		/* populate links */
> 
> Please remove the comment too.
ok
> 
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
> > +	emi_icc_remove(pdev);
> 
> This will not work because platform_set_drvdata() is called only when the
> probe function completes successfully. So platform_get_drvdata() in
> emi_icc_remove() will return NULL.
> 
> > +	return ret;
> > +}
> > +
> > +static int emi_icc_remove(struct platform_device *pdev)
> > +{
> > +	struct icc_provider *provider = platform_get_drvdata(pdev);
> > +	struct icc_node *n;
> > +
> > +	list_for_each_entry(n, &provider->nodes, node_list) {
> > +		icc_node_del(n);
> > +		icc_node_destroy(n->id);
> > +	}
> 
> You can use icc_nodes_remove() instead of the above.
Got it, thanks for advise.
> 
> Thanks,
> Georgi

Thanks for the review.

Henry
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
