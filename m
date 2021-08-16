Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C97C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 03:38:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 755A96187F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 03:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 755A96187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKRvqpHuiXSfnX8RHYh2MWjB0P3oRMFhg4w70uvm3xQ=; b=gAjkmtpZCln+Ds
	o+NPtB2eZho+Z6wRlPCZfbfJgWnJ9hJ0yLdYxi65HwPSM9dESDjDQn7w+MyoIZ8jAKXv2RFtiJW0p
	YIMIjNfJpbcgVnvdZN8orRTYXDz/aX18l5n/OBN8RJHf80C2LrsUUM61G2Yn0h9RHnJMlz8vfCc0P
	nqpuONUHAu14iRwBuun0qEcMWwLOy7yTogqHShjmLJnoTJhdW81maTrWdmBv5GJrxXUU3DgrAQOG8
	aT4dZbChfP98WMNq3ByuO1zRe4TVTxGYo2xz2AY8Jrt+JHFrrFUZraCWGBdeoXAeQBIMi/3mtw9FD
	8RyPNVK+YQUQxia5UlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFTSA-00G4EC-MG; Mon, 16 Aug 2021 03:38:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFTRv-00G4DF-Fv; Mon, 16 Aug 2021 03:38:11 +0000
X-UUID: eb8d45022efe444bb122a697c2e333a4-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BniR1vT/ITzPIV/dl+gZPyHdSRm/k7l4QdTEiMfemhc=; 
 b=SkPI7pEieNgoVoFTPoP4pzS+IepVJEfh0JBzqsPDEqeAyZs6HpTXzY2zB/HKFoBk319l1UjTwKLQxaRKpi75YCxHvhk0x5Fg+7BlR4cXjJkqOeq5HiRX5VTpoJB6Wo5spMkv65pZvbnj65oWuksrgCXdQfvr25UvUiq0HWDB0GA=;
X-UUID: eb8d45022efe444bb122a697c2e333a4-20210815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1984267039; Sun, 15 Aug 2021 20:38:02 -0700
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 20:38:00 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 11:37:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 11:37:46 +0800
Message-ID: <8ec92b60f97b7e6516a0ffd32328f428d233fa93.camel@mediatek.com>
Subject: Re: [PATCH v6 5/9] mtk-mdp: make mdp driver to be loadable by
 platform_device_register*()
From: houlong wei <houlong.wei@mediatek.com>
To: Eizan Miyamoto <eizan@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "wenst@chromium.org" <wenst@chromium.org>, Yong Wu
 =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Mon, 16 Aug 2021 11:37:47 +0800
In-Reply-To: <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B9AD6F64CBAAF17ECD8FEBE62D25A84C601BECC7CD52BDDFDAAAEEFE97A73EF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_203807_598239_7BE95395 
X-CRM114-Status: GOOD (  48.51  )
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

On Mon, 2021-08-02 at 20:12 +0800, Eizan Miyamoto wrote:
> Rather than hanging the MDP master component driver off of the rdma0
> device, make it possible too create a "virtual" device by registering
> it with platform_device_register_*() to be probed by the mtk_mdp_core
> driver.
> 
> Broadly, three interdependent things are done by this change:
> - Make it is possible to search for MDP devices in the device tree
>   through the grandparent device's of_node.
> - v4l-related setup is moved into from the mtk_mdp_core driver to the
>   mtk_mdp_comp driver.
> - Presence of a mediatek,vpu property in an MDP component device node
>   is used to determine what device to use when dispatching DMA ops
> from
>   the relevant ioctl, and also do V4L2 initialization in this case.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> Changes in v6:
> - Don't propagate errors from clock_on/off as an afterthought.
> - Split apart modifying mdp driver to be loadable from mmsys from
>   actually loading it from mmsys into two changs to make review
> easier.
> - Update devicetree bindings to reflect no longer needing the
>   mediatek,vpu property in the mdp_rdma0 device node.
> - Some stylistic cleanups.
> 
> Changes in v5:
> - rebase and test on 5.13-next @ e2f74b13dbe6
> 
> Changes in v4:
> - rebase and test on 5.13
> - don't depend on 
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873
> 
> Changes in v3:
> - get mdp master from aliases instead of strcmp against of_node->name
> 
> Changes in v2:
> - rebased onto Linux 5.12
> - 100 char line length allowance was utilized in a few places
> - Removal of a redundant dev_err() print at the end of
>   mtk_mdp_comp_init()
> - Instead of printing errors and ignoring them, I've added a patch to
>   correctly propagate them.
> - Use of C style comments.
> - Three additional patches were added to eliminate dependency on the
>   mediatek,vpu property inside the mdp_rdma0 device node.
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 51 ++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++-----------
> --
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |  2 +
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  4 +-
>  4 files changed, 60 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 7b6c8a3f3455..85ef274841a3 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -155,8 +155,45 @@ static int mtk_mdp_comp_bind(struct device *dev,
> struct device *master, void *da
>  {
>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>  	struct mtk_mdp_dev *mdp = data;
> +	struct device_node *vpu_node;
>  
>  	mtk_mdp_register_component(mdp, comp);
> +
> +	/*
> +	 * If this component has a "mediatek-vpu" property, it is
> responsible for
> +	 * notifying the mdp master driver about it so it can be
> further initialized
> +	 * later.
> +	 */
> +	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> +	if (vpu_node) {
> +		int ret;
> +
> +		mdp->vpu_dev = of_find_device_by_node(vpu_node);
> +		if (WARN_ON(!mdp->vpu_dev)) {
> +			dev_err(dev, "vpu pdev failed\n");
> +			of_node_put(vpu_node);
> +		}

Maybe 'of_node_put(vpu_node)' should be called when 'mdp->vpu_dev' is
valid.


> +		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to register v4l2
> device\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = vb2_dma_contig_set_max_seg_size(dev,
> DMA_BIT_MASK(32));
> +		if (ret) {
> +			dev_err(dev, "Failed to set vb2 dma mag seg
> size\n");
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * presence of the "mediatek,vpu" property in a device
> node
> +		 * indicates that it is the primary MDP rdma device and
> MDP DMA
> +		 * ops should be handled by its DMA callbacks.
> +		 */
> +		mdp->rdma_dev = dev;
> +	}
> +
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> @@ -237,23 +274,9 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp,
> struct device *dev)
>  static int mtk_mdp_comp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *vpu_node;
>  	int status;
>  	struct mtk_mdp_comp *comp;
>  
> -	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -	if (vpu_node) {
> -		of_node_put(vpu_node);
> -		/*
> -		 * The device tree node with a mediatek,vpu property is
> deemed
> -		 * the MDP "master" device, we don't want to add a
> component
> -		 * for it in this function because the initialization
> for the
> -		 * master is done elsewhere.
> -		 */
> -		dev_info(dev, "vpu node found, not probing\n");
> -		return -ENODEV;
> -	}
> -
>  	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
>  	if (!comp)
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index a72a9ba41ea6..50eafcc9993d 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -159,6 +159,17 @@ static int mtk_mdp_master_bind(struct device
> *dev)
>  		goto err_component_bind_all;
>  	}
>  
> +	if (mdp->vpu_dev) {
> +		int ret = vpu_wdt_reg_handler(mdp->vpu_dev,
> mtk_mdp_reset_handler, mdp,
> +					  VPU_RST_MDP);
> +		if (ret) {
> +			dev_err(dev, "Failed to register reset
> handler\n");
> +			goto err_wdt_reg;
> +		}
> +	} else {
> +		dev_err(dev, "no vpu_dev found\n");
> +	}
> +
>  	status = mtk_mdp_register_m2m_device(mdp);
>  	if (status) {
>  		dev_err(dev, "Failed to register m2m device: %d\n",
> status);
> @@ -170,6 +181,8 @@ static int mtk_mdp_master_bind(struct device
> *dev)
>  	return 0;
>  
>  err_mtk_mdp_register_m2m_device:
> +
> +err_wdt_reg:
>  	component_unbind_all(dev, mdp);
>  
>  err_component_bind_all:
> @@ -228,8 +241,13 @@ static int mtk_mdp_probe(struct platform_device
> *pdev)
>  		of_node_put(node);
>  		parent = dev->of_node;
>  		dev_warn(dev, "device tree is out of date\n");
> -	} else {
> +	} else if (dev->of_node) {
>  		parent = dev->of_node->parent;
> +	} else if (dev->parent) {
> +		/* maybe we were created from a call to
> platform_device_register_data() */
> +		parent = dev->parent->parent->of_node;
> +	} else {
> +		return -ENODEV;
>  	}
>  
>  	/* Iterate over sibling MDP function blocks */
> @@ -262,16 +280,6 @@ static int mtk_mdp_probe(struct platform_device
> *pdev)
>  		}
>  	}
>  
> -	/*
> -	 * Create a component for myself so that clocks can be toggled
> in
> -	 * clock_on().
> -	 */
> -	ret = mtk_mdp_comp_init(&mdp->comp_self, dev);
> -	if (ret) {
> -		dev_err(dev, "Failed to initialize component\n");
> -		goto err_comp;
> -	}
> -
>  	mdp->job_wq =
> create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
>  	if (!mdp->job_wq) {
>  		dev_err(&pdev->dev, "unable to alloc job workqueue\n");
> @@ -287,29 +295,8 @@ static int mtk_mdp_probe(struct platform_device
> *pdev)
>  	}
>  	INIT_WORK(&mdp->wdt_work, mtk_mdp_wdt_worker);
>  
> -	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to register v4l2
> device\n");
> -		ret = -EINVAL;
> -		goto err_dev_register;
> -	}
> -
> -	mdp->vpu_dev = vpu_get_plat_device(pdev);
> -	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler,
> mdp,
> -				  VPU_RST_MDP);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to register reset
> handler\n");
> -		goto err_wdt_reg;
> -	}
> -
>  	platform_set_drvdata(pdev, mdp);
>  
> -	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev,
> DMA_BIT_MASK(32));
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg
> size\n");
> -		goto err_set_max_seg_size;
> -	}
> -
>  	ret = component_master_add_with_match(dev, &mtk_mdp_com_ops,
> match);
>  	if (ret) {
>  		dev_err(dev, "Component master add failed\n");
> @@ -321,22 +308,12 @@ static int mtk_mdp_probe(struct platform_device
> *pdev)
>  	return 0;
>  
>  err_component_master_add:
> -	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> -
> -err_set_max_seg_size:
> -
> -err_wdt_reg:
> -	v4l2_device_unregister(&mdp->v4l2_dev);
> -
> -err_dev_register:
>  	destroy_workqueue(mdp->wdt_wq);
>  
>  err_alloc_wdt_wq:
>  	destroy_workqueue(mdp->job_wq);
>  
>  err_alloc_job_wq:
> -
> -err_comp:
>  	dev_dbg(dev, "err %d\n", ret);
>  	return ret;
>  }
> @@ -404,7 +381,6 @@ static struct platform_driver mtk_mdp_driver = {
>  	.driver = {
>  		.name	= MTK_MDP_MODULE_NAME,
>  		.pm	= &mtk_mdp_pm_ops,
> -		.of_match_table = mtk_mdp_of_ids,
>  	}
>  };
>  
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> index 8a52539b15d4..9fcd8b8e7c25 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> @@ -133,6 +133,7 @@ struct mtk_mdp_variant {
>   * struct mtk_mdp_dev - abstraction for image processor entity
>   * @lock:	the mutex protecting this data structure
>   * @vpulock:	the mutex protecting the communication with VPU
> + * @rdma_dev:  device pointer to rdma device for MDP
>   * @pdev:	pointer to the image processor platform device
>   * @variant:	the IP variant information
>   * @id:		image processor device index
> (0..MTK_MDP_MAX_DEVS)
> @@ -151,6 +152,7 @@ struct mtk_mdp_variant {
>  struct mtk_mdp_dev {
>  	struct mutex			lock;
>  	struct mutex			vpulock;
> +	struct device			*rdma_dev;
>  	struct platform_device		*pdev;
>  	struct mtk_mdp_variant		*variant;
>  	u16				id;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> index f14779e7596e..9834d3bbe851 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> @@ -929,7 +929,7 @@ static int mtk_mdp_m2m_queue_init(void *priv,
> struct vb2_queue *src_vq,
>  	src_vq->mem_ops = &vb2_dma_contig_memops;
>  	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> -	src_vq->dev = &ctx->mdp_dev->pdev->dev;
> +	src_vq->dev = ctx->mdp_dev->rdma_dev;
>  	src_vq->lock = &ctx->mdp_dev->lock;
>  
>  	ret = vb2_queue_init(src_vq);
> @@ -944,7 +944,7 @@ static int mtk_mdp_m2m_queue_init(void *priv,
> struct vb2_queue *src_vq,
>  	dst_vq->mem_ops = &vb2_dma_contig_memops;
>  	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> -	dst_vq->dev = &ctx->mdp_dev->pdev->dev;
> +	dst_vq->dev = ctx->mdp_dev->rdma_dev;
>  	dst_vq->lock = &ctx->mdp_dev->lock;
>  
>  	return vb2_queue_init(dst_vq);
> -- 
> 2.32.0.554.ge1b32706d8-goog
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
