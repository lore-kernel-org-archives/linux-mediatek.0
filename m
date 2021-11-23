Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BB8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCtp61U2/kM53m2CwXbScCTRO3jgrGk2lAqqFQaWEQ4=; b=yq3i3OTSTXypc2
	z67zACWRwq4os0ffGhPFWgtSqif4Q7/60GlhsODcTPeUDaWt/+VPHsNOAHGXGMAEWp/F7521qZDQT
	ubSyCeMsjbaDnBLqNF4jT/qzRWkUF/ZhbhIG6LvW25OvLRDLTrN0meyNXIuLv56Iu66qjYkm1KvT0
	WSF6Sz/J3qq+namB7W504BzXNkDtUA/fLJ/3nAsvjphRouSEdNoT8TPniy8IrAHK9HeiZFOr+YX0w
	qRO6EPNrKs2N3qEZGDpXkJp19idIxlgWH/CzfOCdhIPw2GpMBE5Ig+6UGXMXuZq8lZ5XkeyVwu040
	GAfpBFjS5nf1dXrJqfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpRza-001TrB-LP; Tue, 23 Nov 2021 09:21:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpRzI-001TmS-2B; Tue, 23 Nov 2021 09:21:19 +0000
X-UUID: d0c878c9ef074778b69441dfff6ed928-20211123
X-UUID: d0c878c9ef074778b69441dfff6ed928-20211123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 545816321; Tue, 23 Nov 2021 02:21:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Nov 2021 01:19:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Nov 2021 17:19:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Nov 2021 17:19:50 +0800
Message-ID: <a0fb88620c8d9edb07ba37a4693719bd38317a61.camel@mediatek.com>
Subject: Re: [PATCH v8 7/7] media: platform: mtk-mdp3: add Mediatek MDP3 driver
From: moudy ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, Rob Landley
 <rob@landley.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <acourbot@chromium.org>, <pihsun@chromium.org>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <srv_heupstream@mediatek.com>, <hsinyi@google.com>
Date: Tue, 23 Nov 2021 17:19:49 +0800
In-Reply-To: <df3ca43b-ea02-36f7-2d37-7240a1ba4f96@collabora.com>
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
 <20211015123832.17914-8-moudy.ho@mediatek.com>
 <df3ca43b-ea02-36f7-2d37-7240a1ba4f96@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_012116_124498_C6FB540F 
X-CRM114-Status: GOOD (  36.41  )
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

On Mon, 2021-10-18 at 15:49 +0200, AngeloGioacchino Del Regno wrote:
> > This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> > It provides the following functions:
> >    color transform, format conversion, resize, crop, rotate, flip
> >    and additional image quality enhancement.
> > 
> > The MDP3 driver is mainly used for Google Chromebook products to
> > import the new architecture to set the HW settings as shown below:
> >    User -> V4L2 framework
> >      -> MDP3 driver -> SCP (setting calculations)
> >        -> MDP3 driver -> CMDQ (GCE driver) -> HW
> > 
> > Each modules' related operation control is sited in mtk-mdp3-comp.c
> > Each modules' register table is defined in file with "mdp_reg_"
> > prefix
> > GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> > V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> > Probe, power, suspend/resume, system level functions are defined in
> > mtk-mdp3-core.c
> > 
> > Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> > Depend on:
> >     [1] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-9-acourbot@chromium.org/__;!!CTRNKA9wMg0ARbw!xFX7LsYeTavOapGwdM6Viy-_5Rlf-aa1FkMbMZQc6tol5Veeq1ZkQkld3FTXMc7x$
> >  
> >     [2] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-10-acourbot@chromium.org/__;!!CTRNKA9wMg0ARbw!xFX7LsYeTavOapGwdM6Viy-_5Rlf-aa1FkMbMZQc6tol5Veeq1ZkQkld3Fxm1BEE$
> >  
> > ---
> >   drivers/media/platform/Kconfig                |   19 +
> >   drivers/media/platform/Makefile               |    2 +
> >   drivers/media/platform/mtk-mdp3/Makefile      |    6 +
> >   .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
> >   drivers/media/platform/mtk-mdp3/mdp_reg_isp.h |   27 +
> >   .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
> >   drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
> >   .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
> >   .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
> >   drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  280 ++++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  514 +++++++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   46 +
> >   .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1307
> > +++++++++++++++++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  147 ++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  340 +++++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   76 +
> >   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  789 ++++++++++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   49 +
> >   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  737 ++++++++++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  313 ++++
> >   .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   78 +
> >   22 files changed, 5328 insertions(+)
> >   create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
> >   create mode 100644 drivers/media/platform/mtk-
> > mdp3/mdp_reg_ccorr.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-
> > cmdq.c
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-
> > cmdq.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-
> > comp.c
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-
> > comp.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-
> > core.c
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-
> > core.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-
> > regs.c
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-
> > regs.h
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
> >   create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h

(snip)

> > diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> > b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> > new file mode 100644
> > index 000000000000..110f8911638f
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> > @@ -0,0 +1,514 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > + */
> > +
> > +#include <linux/platform_device.h>
> > +#include "mtk-mdp3-cmdq.h"
> > +#include "mtk-mdp3-comp.h"
> > +#include "mtk-mdp3-core.h"
> > +#include "mtk-mdp3-m2m.h"
> > +
> > +static void mdp_auto_release_work(struct work_struct *work)
> > +{
> > +	struct mdp_cmdq_cb_param *cb_param;
> > +	struct mdp_dev *mdp;
> > +
> > +	cb_param = container_of(work, struct mdp_cmdq_cb_param,
> > +				auto_release_work);
> > +	mdp = cb_param->mdp;
> > +
> > +	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> > +	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
> > +			    cb_param->num_comps);
> > +
> > +	kfree(cb_param->comps);
> > +	kfree(cb_param);
> > +
> > +	atomic_dec(&mdp->job_count);
> > +	wake_up(&mdp->callback_wq);
> > +}
> > +
> > +static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
> > +{
> > +	struct mdp_cmdq_cb_param *cb_param;
> > +	struct mdp_dev *mdp;
> > +	struct device *dev;
> > +
> > +	if (!data.data) {
> > +		pr_info("%s:no callback data\n", __func__);
> 
> If this is not an error, then I'd say it should be a dev_dbg().
> 

Hi Angelo,

Thanks for reminding, and this is a CMDQ driver
callback and pass empty data error handling.
Before this check, the dev_err can't be used but pr_info instead, or do
you have other better ideas?

Thanks & Regards,
Moudy Ho

> > +		return;
+	}
+	cb_param = (struct
> > mdp_cmdq_cb_param *)data.data;
+	mdp = cb_param->mdp;
+	dev
> > = &mdp->pdev->dev;
+
+	if (cb_param->mdp_ctx)
+		mdp
> > _m2m_job_finish(cb_param->mdp_ctx);
+
+	if (cb_param-
> > >user_cmdq_cb) {
+		struct cmdq_cb_data user_cb_data;
+
+		
> > user_cb_data.sta = data.sta;
+		user_cb_data.data =
> > cb_param->user_cb_data;
+		cb_param-
> > >user_cmdq_cb(user_cb_data);
+	}
+
+	cmdq_pkt_destroy(cb_param-
> > >pkt);
+	INIT_WORK(&cb_param->auto_release_work,
> > mdp_auto_release_work);
+	if (!queue_work(mdp->clock_wq,
> > &cb_param->auto_release_work)) {
> > +		dev_err(dev, +"%s:queue_work fail!\n", __func__);
> > +	
> > +int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param
> > *param)
> > +{
> > +	struct mmsys_cmdq_cmd cmd;
> > +	struct mdp_path *path = NULL;
> > +	struct mdp_cmdq_cb_param *cb_param = NULL;
> > +	struct mdp_comp *comps = NULL;
> > +	struct device *dev = &mdp->pdev->dev;
> > +	int i, ret;
> > +
> > +	if (atomic_read(&mdp->suspended))
> > +		return -ECANCELED;
> > +
> > +	atomic_inc(&mdp->job_count);
> > +
> > +	cmd.pkt = cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
> > +	if (IS_ERR(cmd.pkt)) {
> > +		atomic_dec(&mdp->job_count);
> > +		wake_up(&mdp->callback_wq);
> > +		return PTR_ERR(cmd.pkt);
> > +	}
> > +	cmd.event = &mdp->event[0];
> > +
> > +	path = kzalloc(sizeof(*path), GFP_KERNEL);
> > +	if (!path) {
> > +		ret = -ENOMEM;
> > +		goto err_destroy_pkt;
> > +	}
> > +
> > +	path->mdp_dev = mdp;
> > +	path->config = param->config;
> > +	path->param = param->param;
> > +	for (i = 0; i < param->param->num_outputs; i++) {
> > +		path->bounds[i].left = 0;
> > +		path->bounds[i].top = 0;
> > +		path->bounds[i].width =
> > +			param->param->outputs[i].buffer.format.width;
> > +		path->bounds[i].height =
> > +			param->param->outputs[i].buffer.format.height;
> > +		path->composes[i] = param->composes[i] ?
> > +			param->composes[i] : &path->bounds[i];
> > +	}
> > +
> > +	ret = mdp_path_ctx_init(mdp, path);
> > +	if (ret) {
> > +		pr_info("%s mdp_path_ctx_init error\n", __func__);
> 
> Please, use dev_err here.
> 
> > +		goto err_destroy_pkt;
> > +	}
> > +
> > +	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> > +	for (i = 0; i < param->config->num_components; i++)
> > +		mdp_comp_clock_on(&mdp->pdev->dev, path-
> > >comps[i].comp);
> > +
> > +	ret = mdp_path_config(mdp, &cmd, path);
> > +	if (ret) {
> > +		pr_info("%s mdp_path_config error\n", __func__);
> 
> This is also dev_err.
> 
> > +		goto err_destroy_pkt;
> > +	}
> > +
> > +	cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
> > +	if (!cb_param) {
> > +		ret = -ENOMEM;
> > +		goto err_destroy_pkt;
> > +	}
> > +
> > +	comps = kcalloc(param->config->num_components, sizeof(*comps),
> > +			GFP_KERNEL);
> > +	if (!comps) {
> > +		ret = -ENOMEM;
> > +		goto err_destroy_pkt;
> > +	}
> > +
> > +	for (i = 0; i < param->config->num_components; i++)
> > +		memcpy(&comps[i], path->comps[i].comp,
> > +		       sizeof(struct mdp_comp));
> > +	cb_param->mdp = mdp;
> > +	cb_param->user_cmdq_cb = param->cmdq_cb;
> > +	cb_param->user_cb_data = param->cb_data;
> > +	cb_param->pkt = cmd.pkt;
> > +	cb_param->comps = comps;
> > +	cb_param->num_comps = param->config->num_components;
> > +	cb_param->mdp_ctx = param->mdp_ctx;
> > +
> > +	cmdq_pkt_finalize(cmd.pkt);
> > +	ret = cmdq_pkt_flush_async(cmd.pkt,
> > +				   mdp_handle_cmdq_callback,
> > +				   (void *)cb_param);
> > +	if (ret) {
> > +		dev_err(dev, "cmdq_pkt_flush_async fail!\n");
> > +		goto err_clock_off;
> > +	}
> > +	return 0;
> > +
> > +err_clock_off:
> > +	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> > +	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
> > +			    cb_param->num_comps);
> > +err_destroy_pkt:
> > +	cmdq_pkt_destroy(cmd.pkt);
> > +	atomic_dec(&mdp->job_count);
> > +	wake_up(&mdp->callback_wq);
> > +	kfree(comps);
> > +	kfree(cb_param);
> > +	kfree(path);
> > +
> > +	return ret;
> > +}
> > +
> > +int mdp_cmdq_sendtask(struct platform_device *pdev, struct
> > img_config *config,
> > +		      struct img_ipi_frameparam *param,
> > +		      struct v4l2_rect *compose,
> > +		      void (*cmdq_cb)(struct cmdq_cb_data data), void
> > *cb_data)
> > +{
> > +	struct mdp_dev *mdp = platform_get_drvdata(pdev);
> > +	struct mdp_cmdq_param task = {
> > +		.config = config,
> > +		.param = param,
> > +		.composes[0] = compose,
> > +		.cmdq_cb = cmdq_cb,
> > +		.cb_data = cb_data,
> > +	};
> > +
> > +	return mdp_cmdq_send(mdp, &task);
> +}

(snip)

> 
> Thanks,
> - Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
