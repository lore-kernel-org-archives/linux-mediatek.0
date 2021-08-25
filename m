Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E263DC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 08:43:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A652F61222
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 08:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A652F61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhIl1zYxUi4lWHtmIHoH69eTBbH0X39b1AlRDvGCOsM=; b=dE4KQJNDQb8sl+
	g7h29j9fx3nw2xq0kgOAx68TbAFKHkUCKUi6UM23T7cnKSSWV/U+nEVlkoMzIJRPu7q5KB1bMZ4+G
	+Y+tjPmvGs2W2fVRYtuf4xGPS76/7QX8ogA/1o2qcw7ZjvOyhI/fm56apL2w4K3a/YYGxk/i6z8/+
	zAoafxioOZRk+XHOVufz/xpVMJne18oxPy92qeZkTopdWoh2q9CHmBhaML/RU4Y0x5QfnZucvAIjq
	0FAUKt8SaY9bm31ycVF93KZSCBx+8wLtigEHCQk3E4zCZx9awu4iRX4eS8OH75mrMDV2JOmwTOqVj
	HK5USel2Ry2w6OoKAFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIoVQ-005yZN-HH; Wed, 25 Aug 2021 08:43:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIoVL-005yXd-Ak; Wed, 25 Aug 2021 08:43:31 +0000
X-UUID: 1219d28a0e9743d19b61dc4f20be63fe-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sTZz7ZKn8O09yh6tsqaYsnMZlQTmk/rfPalD4e6KLvg=; 
 b=CGKArSyQx9CkZgQTNbTLT/BIK0lRUYW27t4RtrOm6IDtY0dkDInNWiI+HpExGHEjNAYQujBxMh/Eh5AibCCqWTWqcWM5fDuXnGv/u5LDODsXP/UIp67O3JAMVneTPYuYucKnHEW/Zkicfj19AFk0l6MH8goGYDrqTkAwfK3mRCQ=;
X-UUID: 1219d28a0e9743d19b61dc4f20be63fe-20210825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 584357593; Wed, 25 Aug 2021 01:43:24 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 01:43:22 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 25 Aug 2021 16:43:21 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 16:43:19 +0800
Message-ID: <1629880999.12893.17.camel@mhfsdcap03>
Subject: Re: [PATCH v7 7/7] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
From: houlong wei <houlong.wei@mediatek.com>
To: Eizan Miyamoto <eizan@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Yong Wu
 =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, CK Hu
 =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, Yongqiang Niu
 =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?= <yongqiang.niu@mediatek.com>,
 Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=
 <Andrew-CT.Chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Wed, 25 Aug 2021 16:43:19 +0800
In-Reply-To: <20210825163247.v7.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
References: <20210825063323.3607738-1-eizan@chromium.org>
 <20210825163247.v7.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_014327_421840_F6407DAF 
X-CRM114-Status: GOOD (  41.48  )
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

Hi Eizan,

Thanks for you patch. I have inline comment below.

Regards,
Houlong

On Wed, 2021-08-25 at 14:33 +0800, Eizan Miyamoto wrote:
> ... Instead of depending on the presence of a mediatek,vpu property in
> the device node.
> 
> That property was originally added to link to the vpu node so that the
> mtk_mdp_core driver could pass the right device to
> vpu_wdt_reg_handler(). However in a previous patch in this series,
> the driver has been modified to search the device tree for that node
> instead.
> 
> That property was also used to indicate the primary MDP device, so that
> it can be passed to the V4L2 subsystem as well as register it to be
> used when setting up queues in the open() callback for the filesystem
> device node that is created. In this case, assuming that the primary
> MDP device is the one with a specific alias seems useable because the
> alternative is to add a property to the device tree which doesn't
> actually represent any facet of hardware (i.e., this being the primary
> MDP device is a software decision). In other words, this solution is
> equally as arbitrary, but at least it doesn't add a property to a
> device node where said property is unrelated to the hardware present.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 56 +++++++++++++------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 36 ++++++++----
>  2 files changed, 64 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 85ef274841a3..9527649de98e 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -151,29 +151,50 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  		mtk_smi_larb_put(comp->larb_dev);
>  }
>  
> -static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *data)
> +/*
> + * The MDP master device node is identified by the device tree alias
> + * "mdp-rdma0".
> + */
> +static bool is_mdp_master(struct device *dev)
> +{
> +	struct device_node *aliases, *mdp_rdma0_node;
> +	const char *mdp_rdma0_path;
> +
> +	if (!dev->of_node)
> +		return false;
> +
> +	aliases = of_find_node_by_path("/aliases");
> +	if (!aliases) {
> +		dev_err(dev, "no aliases found for mdp-rdma0");
> +		return false;
> +	}
> +
> +	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
> +	if (!mdp_rdma0_path) {
> +		dev_err(dev, "get mdp-rdma0 property of /aliases failed");
> +		return false;
> +	}
> +
> +	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
> +	if (!mdp_rdma0_node) {
> +		dev_err(dev, "path resolution failed for %s", mdp_rdma0_path);
> +		return false;
> +	}
> +
> +	return dev->of_node == mdp_rdma0_node;


About how to determine the master mdp driver, we also can
judge the component type. The component type can be gotten by calling
of_device_get_match_data(dev). If the component is MTK_MDP_RDMA, it is
the master driver. No matter it is mdp_rdma0 or mdp_rdma1.
http://lists.infradead.org/pipermail/linux-mediatek/2021-August/028533.html

IMO, judging it by component type is more flexible because it does not
limit to 'mdp_rdma0'.

> +}
> +
> +static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> +			void *data)
>  {
>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>  	struct mtk_mdp_dev *mdp = data;
> -	struct device_node *vpu_node;
>  
>  	mtk_mdp_register_component(mdp, comp);
>  
> -	/*
> -	 * If this component has a "mediatek-vpu" property, it is responsible for
> -	 * notifying the mdp master driver about it so it can be further initialized
> -	 * later.
> -	 */
> -	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -	if (vpu_node) {
> +	if (is_mdp_master(dev)) {
>  		int ret;
>  
> -		mdp->vpu_dev = of_find_device_by_node(vpu_node);
> -		if (WARN_ON(!mdp->vpu_dev)) {
> -			dev_err(dev, "vpu pdev failed\n");
> -			of_node_put(vpu_node);
> -		}
> -
>  		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
>  		if (ret) {
>  			dev_err(dev, "Failed to register v4l2 device\n");
> @@ -187,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *da
>  		}
>  
>  		/*
> -		 * presence of the "mediatek,vpu" property in a device node
> -		 * indicates that it is the primary MDP rdma device and MDP DMA
> -		 * ops should be handled by its DMA callbacks.
> +		 * MDP DMA ops will be handled by the DMA callbacks associated with this
> +		 * device;
>  		 */
>  		mdp->rdma_dev = dev;
>  	}
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 50eafcc9993d..6a775463399c 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -150,8 +150,9 @@ static void release_of(struct device *dev, void *data)
>  
>  static int mtk_mdp_master_bind(struct device *dev)
>  {
> -	int status;
>  	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
> +	struct device_node *vpu_node;
> +	int status;
>  
>  	status = component_bind_all(dev, mdp);
>  	if (status) {
> @@ -159,15 +160,30 @@ static int mtk_mdp_master_bind(struct device *dev)
>  		goto err_component_bind_all;
>  	}
>  
> -	if (mdp->vpu_dev) {
> -		int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> -					  VPU_RST_MDP);
> -		if (ret) {
> -			dev_err(dev, "Failed to register reset handler\n");
> -			goto err_wdt_reg;
> -		}
> -	} else {
> -		dev_err(dev, "no vpu_dev found\n");
> +	if (mdp->rdma_dev == NULL) {
> +		dev_err(dev, "Primary MDP device not found");
> +		status = -ENODEV;
> +		goto err_component_bind_all;
> +	}
> +
> +	vpu_node = of_find_node_by_name(NULL, "vpu");
> +	if (!vpu_node) {
> +		dev_err(dev, "unable to find vpu node");
> +		status = -ENODEV;
> +		goto err_wdt_reg;
> +	}
> +
> +	mdp->vpu_dev = of_find_device_by_node(vpu_node);

The 'vpu_node' should be put by calling 'of_node_put(vpu_node)' when it
is not used.

> +	if (!mdp->vpu_dev) {
> +		dev_err(dev, "unable to find vpu device");
> +		status = -ENODEV;
> +		goto err_wdt_reg;
> +	}
> +
> +	status = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp, VPU_RST_MDP);
> +	if (status) {
> +		dev_err(dev, "Failed to register reset handler\n");
> +		goto err_wdt_reg;
>  	}
>  
>  	status = mtk_mdp_register_m2m_device(mdp);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
