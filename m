Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89990C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+jlsGmM9oIdQd73mJBT7UUkzzaRZUdyqa5CHCtWYo8=; b=WjcAl6gGZ1jocR
	3y+Fn+I1IsLgm3HwBYdtZ2dshDFJo36J/AKBin70MTEC8s1Z6aqO644rEatHrn7TMbi5I+cMdOfD6
	dhCXP58yaW6zyRZZHXvlHZP3A8YO1Rd/3+nmExrZ81qnqV4BKYpNZZE3r4aY5lq6sSzkMt/S8UJk7
	tZ38dgl8VWHiN0wNXQJn9+4qzd3jvsLxpLe/YCC9oaa4qBjtonnd+9Le6hOAah3hmH03MWRXZXvXl
	+eeascoR23ieevHptCVERv7txm+wXlJ2qfNPqxItgWbiL7jjbbtDR+2PUbmQ3wOwv5Ulg9tJSuUju
	EWR+lHcftpRAcGJvicHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWMq-006cIL-O6; Tue, 07 Jun 2022 10:23:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWBQ-006XuV-If; Tue, 07 Jun 2022 10:11:34 +0000
X-UUID: 13600348889048bcb37336fa52057860-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:a8815f9d-386b-4d58-8c64-9196c2209d46,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:02d0797e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 13600348889048bcb37336fa52057860-20220607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 690370198; Tue, 07 Jun 2022 03:11:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 03:01:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 7 Jun 2022 18:01:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 18:01:41 +0800
Message-ID: <009614b49102d5f1e41aee156172ac5a89ea23b9.camel@mediatek.com>
Subject: Re: [PATCH v17 4/4] media: platform: mtk-mdp3: add Mediatek MDP3
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
Date: Tue, 7 Jun 2022 18:01:41 +0800
In-Reply-To: <0209f3123079f65027bff96d8214129d7bf8393c.camel@mediatek.com>
References: <20220531061338.19555-1-moudy.ho@mediatek.com>
	 <20220531061338.19555-5-moudy.ho@mediatek.com>
	 <0209f3123079f65027bff96d8214129d7bf8393c.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_031132_679311_79B2CB8C 
X-CRM114-Status: GOOD (  28.81  )
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

On Wed, 2022-06-01 at 10:25 +0800, CK Hu wrote:
> Hi, Moudy:
> 
> On Tue, 2022-05-31 at 14:13 +0800, Moudy Ho wrote:
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
> > +int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param
> > *param)
> > +{
> > +	struct mdp_cmdq_cmd cmd;
> > +	struct mdp_path *path = NULL;
> > +	struct mdp_cmdq_cb_param *cb_param = NULL;
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
> > +	cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
> > +	if (!cb_param) {
> > +		ret = -ENOMEM;
> > +		goto err_cmdq_data;
> > +	}
> > +
> > +	cmd.pkt = cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
> > +	if (IS_ERR(cmd.pkt)) {
> > +		ret = PTR_ERR(cmd.pkt);
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
> > +	cmd.event = &mdp->event[0];
> > +	ret = mdp_path_config(mdp, &cmd, path);
> > +	if (ret) {
> > +		dev_err(dev, "mdp_path_config error\n");
> > +		goto err_cmdq_data;
> > +	}
> > +	cmdq_pkt_finalize(cmd.pkt);
> > +
> > +	for (i = 0; i < param->config->num_components; i++)
> > +		memcpy(&comps[i], path->comps[i].comp,
> > +		       sizeof(struct mdp_comp));
> > +
> > +	cb_param->mdp = mdp;
> > +	cb_param->user_cmdq_cb = param->cmdq_cb;
> > +	cb_param->user_cb_data = param->cb_data;
> > +	cb_param->pkt = cmd.pkt;
> > +	cb_param->comps = comps;
> > +	cb_param->num_comps = param->config->num_components;
> > +	cb_param->mdp_ctx = param->mdp_ctx;
> > +
> > +	cmd.pkt->async_cb.data = (void *)cb_param;
> 
> async_cb is part of proprietary callback mechanism and I'm replacing
> the proprietary one with standard one. My final patch is [1] (not
> upstreamed yet) and 'data' would be removed. The way to get data
> related to pkt:
> 
> strutc mdp_data {
>     struct cmdq_pkt pkt;
>     /* Other data such as mdp, user_cmdq_cb, ... */
> }
> 
> The callback function would callback with pkt and you could use pkt
> to
> find struct mdp_data{}.
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq6&id=a35f642aa89f02b7307725cdaa3bfb348b26d093
> 
> Regards,
> CK
> 
> 
Hi CK,

Thanks for the review.
Based on the patch you mentioned, I will make corresponding 
adjustments and publish in the next version.

Regards,
Moudy
> > +	mdp->cmdq_clt->client.rx_callback = mdp_handle_cmdq_callback;
> > +
> > +	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> > +	for (i = 0; i < param->config->num_components; i++)
> > +		mdp_comp_clock_on(&mdp->pdev->dev, path-
> > > comps[i].comp);
> > 
> > +
> > +	dma_sync_single_for_device(mdp->cmdq_clt->chan->mbox->dev,
> > +				   cmd.pkt->pa_base, cmd.pkt-
> > > cmd_buf_size,
> > 
> > +				   DMA_TO_DEVICE);
> > +	ret = mbox_send_message(mdp->cmdq_clt->chan, cmd.pkt);
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
> > +	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
> > +			    cb_param->num_comps);
> > +err_cmdq_data:
> > +	kfree(path);
> > +	atomic_dec(&mdp->job_count);
> > +	wake_up(&mdp->callback_wq);
> > +	if (cmd.pkt)
> > +		cmdq_pkt_destroy(cmd.pkt);
> > +	kfree(comps);
> > +	kfree(cb_param);
> > +	return ret;
> > +}
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
