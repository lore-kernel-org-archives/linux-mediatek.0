Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C817C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FkHiRlKu4hC+BucxTEhuwBIk/82TSLOCt9b7bwBTMI=; b=AhDCEX9z5UT4sL
	gbEMz39UdhjqQhCTvb7MbE6q1odlHJez3nOlBgSOyspyrET+s4qFbBr4zbFaQ+TIsFsbjWtqjMgtg
	J+qoKrGEDBW3uU5a+xY+KZ+yGRE4MV+w5Fyf9gmYJWA2u+asKq6SYmUdKYbWbRMr7iBbQ6oy4DEnF
	HUN1m45bSHENS/9zU72BzPeX2vPAvXTrKVBtNerVkVH6NmzQGoKjSwWiLrsVHnTlnXdr0qeKvYRlq
	01uSh40hEkFGfthqydSKJs+bN1QxbjshRMwY0UdFCf+0HinfF3vZnmA0IV94yQrisPBGNqsnNjouq
	UL/CCbJ/s0peHXWzsAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0IL-005f6h-Ha; Thu, 28 Apr 2022 09:18:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0I6-005f31-GZ; Thu, 28 Apr 2022 09:18:29 +0000
X-UUID: b681e4fe54de4fc896cec0ed82d649ab-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e021ffd1-7236-4c64-a37f-20070219d402, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:7,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:7
X-CID-META: VersionHash:faefae9, CLOUDID:d07c072f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: b681e4fe54de4fc896cec0ed82d649ab-20220428
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 388337376; Thu, 28 Apr 2022 02:18:18 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 02:18:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 17:18:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 17:18:15 +0800
Message-ID: <0f18d4970c21fecb5f01db9dd08fd039de2688d1.camel@mediatek.com>
Subject: Re: [PATCH v14 3/3] media: platform: mtk-mdp3: add Mediatek MDP3
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 28 Apr 2022 17:18:15 +0800
In-Reply-To: <3e6bed63ed817381eb9d4d65d60c90172bef0440.camel@mediatek.com>
References: <20220427070514.10355-1-moudy.ho@mediatek.com>
 <20220427070514.10355-4-moudy.ho@mediatek.com>
 <3e6bed63ed817381eb9d4d65d60c90172bef0440.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_021826_598596_2061B711 
X-CRM114-Status: GOOD (  17.64  )
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

On Thu, 2022-04-28 at 12:59 +0800, CK Hu wrote:
> Hi, Moudy:
> 
> On Wed, 2022-04-27 at 15:05 +0800, Moudy Ho wrote:
> > 
> 
> [snip]
> 
> > +
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
> > +
> > +	if (atomic_read(&mdp->suspended)) {
> > +		atomic_dec(&mdp->job_count);
> > +		return -ECANCELED;
> > +	}
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
> > +		dev_err(dev, "mdp_path_ctx_init error\n");
> > +		goto err_destroy_pkt;
> > +	}
> > +
> > +	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> > +	for (i = 0; i < param->config->num_components; i++)
> > +		mdp_comp_clock_on(&mdp->pdev->dev, path-
> > > comps[i].comp);
> > 
> > +
> > +	ret = mdp_path_config(mdp, &cmd, path);
> > +	if (ret) {
> > +		dev_err(dev, "mdp_path_config error\n");
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
> 
> Matthias has applied patch [1], so I think you have better to base on
> patch [1] to send patch.
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.18-next/soc&id=5252c1c5a08e583ab1363f809002cd8a59272b35
> 
> Regards,
> CK
> 
Hi CK,

Thanks for the reminder, I'll rebase with the patch you mentioned.

Regards,
Moudy
> > +	if (ret) {
> > +		dev_err(dev, "cmdq_pkt_flush_async fail!\n");
> > +		goto err_clock_off;
> > +	}
> > +	kfree(path);
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
> > 
> 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
