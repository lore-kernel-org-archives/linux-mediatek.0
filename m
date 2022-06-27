Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05730C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bD3pwmRtnzPsNUYjbsL+oHqkQSCdYmFVAXA/IsFPiIw=; b=TbC9WG/ju7JpPFYnV9p6DprmHZ
	+wtSxHmimNtol2ospJctziX/B88p3CGUYr5dz1NpZ+/Hcyw6KsGjUATKphfPonriHWBgXGlah5Bto
	fsX9HiyOrW96btk8xaD36anQwQvDtKyatmZNXAGMVkFO/A7ZomXTSiCpncnOiw0vN4abOKyCKASUT
	wZmY7ndj+d389pchjBa47gWwki63dyUqXQlbB9BHkG5oh4Od1OkuMcZFIyhID4HWZgtSYQnk2wEDd
	8NJOiNt0KD0IxwN2fS8P2qjZmAY/A/+4pLzp3+rqrwVQDQrX+yTZ0SoU+Kyoc44YuW2mZVkLIU4Vl
	CSCnSbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kKb-00Gw3l-Bz; Mon, 27 Jun 2022 08:42:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kKY-00Gw0k-9Q; Mon, 27 Jun 2022 08:42:51 +0000
X-UUID: e99e6186e01d43d89655e5f2ed2b196c-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:40d05a40-e5b4-4aff-b0b9-9171ffd63528,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:2
X-CID-META: VersionHash:b14ad71,CLOUDID:e119232e-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e99e6186e01d43d89655e5f2ed2b196c-20220627
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 60446031; Mon, 27 Jun 2022 01:42:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 01:33:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 16:33:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 16:33:12 +0800
Message-ID: <0ee2463717a9458dfc13b3082beeb12cb56434b0.camel@mediatek.com>
Subject: Re: [PATCH v19 4/4] media: platform: mtk-mdp3: add Mediatek MDP3
 driver
From: moudy.ho <moudy.ho@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Mon, 27 Jun 2022 16:33:12 +0800
In-Reply-To: <61dfe9671e83970e806dfcea2af35eab2a83f273.camel@mediatek.com>
References: <20220624092359.11908-1-moudy.ho@mediatek.com>
	 <20220624092359.11908-5-moudy.ho@mediatek.com>
	 <61dfe9671e83970e806dfcea2af35eab2a83f273.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_014250_366992_0ACDC7A2 
X-CRM114-Status: GOOD (  24.44  )
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

On Mon, 2022-06-27 at 11:51 +0800, CK Hu wrote:
> Hi, Moudy:
> 
> On Fri, 2022-06-24 at 17:23 +0800, Moudy Ho wrote:
> > This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> > It provides the following functions:
> >   color transform, format conversion, resize, crop, rotate, flip
> >   and additional image quality enhancement.
> > 
> > The MDP3 driver is mainly used for Google Chromebook products to
> > import the new architecture to set the HW settings as shown below:
> >   User -> V4L2 framework
> >     -> MDP3 driver -> SCP (setting calculations)
> >       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> > 
> > Each modules' related operation control is sited in mtk-mdp3-comp.c
> > Each modules' register table is defined in file with "mdp_reg_"
> > prefix
> > GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> > V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> > Probe, power, suspend/resume, system level functions are defined in
> > mtk-mdp3-core.c
> > 
> 
> [snip]
> 
> > 
> > +
> > +int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param
> > *param)
> > +{
> > +	struct mdp_path *path = NULL;
> > +	struct mdp_cmdq_cmd *cmd = NULL;
> > +	struct mdp_comp *comps = NULL;
> > +	struct device *dev = &mdp->pdev->dev;
> > +	int i, ret;
> > +
> > +	atomic_inc(&mdp->job_count);
> > +	if (atomic_read(&mdp->suspended)) {
> > +		atomic_dec(&mdp->job_count);
> > +		return -ECANCELED;
> > +	}
> > +
> > +	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
> > +	if (!cmd) {
> > +		ret = -ENOMEM;
> > +		goto err_cmdq_data;
> > +	}
> > +
> > +	if (mdp_cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K)) {
> > +		ret = -ENOMEM;
> > +		goto err_cmdq_data;
> > +	}
> > +
> > +	comps = kcalloc(param->config->num_components, sizeof(*comps),
> > +			GFP_KERNEL);
> > +	if (!comps) {
> > +		ret = -ENOMEM;
> > +		goto err_cmdq_data;
> > +	}
> > +
> > +	path = kzalloc(sizeof(*path), GFP_KERNEL);
> > +	if (!path) {
> > +		ret = -ENOMEM;
> > +		goto err_cmdq_data;
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
> > +		dev_err(dev, "mdp_path_ctx_init error\n");
> > +		goto err_cmdq_data;
> > +	}
> > +
> > +	cmd->event = &mdp->event[0];
> > +	ret = mdp_path_config(mdp, cmd, path);
> > +	if (ret) {
> > +		dev_err(dev, "mdp_path_config error\n");
> > +		goto err_cmdq_data;
> > +	}
> > +	cmdq_pkt_finalize(&cmd->pkt);
> > +
> > +	for (i = 0; i < param->config->num_components; i++)
> > +		memcpy(&comps[i], path->comps[i].comp,
> > +		       sizeof(struct mdp_comp));
> > +
> > +	mdp->cmdq_clt->client.rx_callback = mdp_handle_cmdq_callback;
> > +	cmd->mdp = mdp;
> > +	cmd->user_cmdq_cb = param->cmdq_cb;
> > +	cmd->user_cb_data = param->cb_data;
> > +	cmd->comps = comps;
> > +	cmd->num_comps = param->config->num_components;
> > +	cmd->mdp_ctx = param->mdp_ctx;
> > +
> > +	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> > +	ret = mdp_comp_clocks_on(&mdp->pdev->dev, cmd->comps, cmd-
> > > num_comps);
> > 
> > +	if (ret) {
> > +		dev_err(dev, "comp %d failed to enable clock!\n", ret);
> > +		goto err_clock_off;
> > +	}
> > +
> > +	dma_sync_single_for_device(mdp->cmdq_clt->chan->mbox->dev,
> > +				   cmd->pkt.pa_base, cmd-
> > > pkt.cmd_buf_size,
> > 
> > +				   DMA_TO_DEVICE);
> > +	ret = mbox_send_message(mdp->cmdq_clt->chan, &cmd->pkt);
> > +	if (ret < 0) {
> > +		dev_err(dev, "mbox send message fail %d!\n", ret);
> > +		goto err_clock_off;
> > +	}
> > +	mbox_client_txdone(mdp->cmdq_clt->chan, 0);
> > +
> > +	kfree(path);
> > +	return 0;
> > +
> > +err_clock_off:
> > +	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> > +	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
> > +			    cmd->num_comps);
> > +err_cmdq_data:
> > +	kfree(path);
> > +	atomic_dec(&mdp->job_count);
> > +	wake_up(&mdp->callback_wq);
> > +	if (cmd->pkt.buf_size > 0)
> > +		mdp_cmdq_pkt_destroy(&cmd->pkt);
> > +	kfree(comps);
> > +	kfree(cmd);
> > +	return ret;
> > +}
> 
> EXPORT_SYMBOL(mdp_cmdq_send);
> 
> So other kernel module could call this function.
> 
> Regards,
> CK
> 

Hi CK,

Thanks for the suggestion, it will be modified in the next version.

Regards,
Moudy


