Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79ABAC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 04:53:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B48A619E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 04:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B48A619E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Br+QOKlwesMQWPUmr1O9kvIRVoBnlylTidEuSj++1nw=; b=lnDVSZ1jNa0bMP
	ELSsx+WYZnV/d8Mgidts/RP7UX8IAodrMM5z50Ks5wprxLtC3uKbK2v4TzXy+YL7b7qee5u4ffXS8
	p67uKAkyZ5hmKE4Jn5X9VO1z9xsB5UOL3l4lztQGdbmHrZ0DSKv8rIyQbOcO1lk4OpKO0hFcL2/lC
	xiXveYnW4vahdWVIzpvZgbzpn2AV4hvyGzPu/wPqCwx7eTUzGCEOKyLL2jujj5+pfEw5ywxw1J9U+
	HCON/mnraFGf8T4x51BdMKVF1Sg97bitWQ4FI3V4pKmgVogCRTbwfCu+5ahHMwJDRHfpBf3+8acau
	RxHN+j2ZB5oN/Twe380g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFUcb-00G71V-B8; Mon, 16 Aug 2021 04:53:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFUcM-00G70G-66; Mon, 16 Aug 2021 04:53:02 +0000
X-UUID: fabd852555e343d59fa73e8f8606a827-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aPfveejJG/uf1hsSa7IBENHohu6hzoRJjQmF5egFfyE=; 
 b=uutZ4le4yj2eaYFuMwkRqb9VrZ5Lz3DZYxnLGWVVdj6l/p2Ai4/03K0jJ/jJ1W3TW2RDYJP+ySKv680dhLkgJKimRRneJXoNe1OtY5PmOAd6w9kI/PkUJgr/No12shA6j1WsIjXeH4qFeaEgl4gaUShveamd3IB1UqfyrLQ5EgI=;
X-UUID: fabd852555e343d59fa73e8f8606a827-20210815
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1657484671; Sun, 15 Aug 2021 21:52:54 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 21:52:52 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 12:52:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 12:52:45 +0800
Message-ID: <9f23beea197495d017a548ef483584714a3673f9.camel@mediatek.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
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
Date: Mon, 16 Aug 2021 12:52:46 +0800
In-Reply-To: <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 35E70F7DC1EA9E7AEE3404716D5151E4F049E8C73B3DAC8435CA59D5C6B44D412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_215258_287120_B09BF581 
X-CRM114-Status: GOOD (  48.16  )
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

On Mon, 2021-08-16 at 11:00 +0800, houlong wei wrote:
> On Mon, 2021-08-02 at 20:12 +0800, Eizan Miyamoto wrote:
> > ... Instead of depending on the presence of a mediatek,vpu property
> > in
> > the device node.
> > 
> > That property was originally added to link to the vpu node so that
> > the
> > mtk_mdp_core driver could pass the right device to
> > vpu_wdt_reg_handler(). However in a previous patch in this series,
> > the driver has been modified to search the device tree for that
> > node
> > instead.
> > 
> > That property was also used to indicate the primary MDP device, so
> > that
> > it can be passed to the V4L2 subsystem as well as register it to be
> > used when setting up queues in the open() callback for the
> > filesystem
> > device node that is created. In this case, assuming that the
> > primary
> > MDP device is the one with a specific alias seems useable because
> > the
> > alternative is to add a property to the device tree which doesn't
> > actually represent any facet of hardware (i.e., this being the
> > primary
> > MDP device is a software decision). In other words, this solution
> > is
> > equally as arbitrary, but at least it doesn't add a property to a
> > device node where said property is unrelated to the hardware
> > present.
> > 
> > Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> > ---
> > 
> > (no changes since v1)
> > 
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 56 +++++++++++++--
> > ----
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 36 ++++++++----
> >  2 files changed, 64 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > index 85ef274841a3..9527649de98e 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > @@ -151,29 +151,50 @@ void mtk_mdp_comp_clock_off(struct
> > mtk_mdp_comp
> > *comp)
> >  		mtk_smi_larb_put(comp->larb_dev);
> >  }
> >  
> > -static int mtk_mdp_comp_bind(struct device *dev, struct device
> > *master, void *data)
> > +/*
> > + * The MDP master device node is identified by the device tree
> > alias
> > + * "mdp-rdma0".
> > + */
> > +static bool is_mdp_master(struct device *dev)
> > +{
> > +	struct device_node *aliases, *mdp_rdma0_node;
> > +	const char *mdp_rdma0_path;
> > +
> > +	if (!dev->of_node)
> > +		return false;
> > +
> > +	aliases = of_find_node_by_path("/aliases");
> > +	if (!aliases) {
> > +		dev_err(dev, "no aliases found for mdp-rdma0");
> > +		return false;
> > +	}
> > +
> > +	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
> > +	if (!mdp_rdma0_path) {
> > +		dev_err(dev, "get mdp-rdma0 property of /aliases
> > failed");
> > +		return false;
> > +	}
> > +
> > +	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
> > +	if (!mdp_rdma0_node) {
> > +		dev_err(dev, "path resolution failed for %s",
> > mdp_rdma0_path);
> > +		return false;
> > +	}
> > +
> 
> Hi Eizan,
> 
> "mdp-rdma0" may be not the only one master device node. In fact,
> there
> are 2 "mdp-rdma" in mt8173. You can see "mdp_rdma1" via below link.
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=v5.13.11#n1016
> If we add "mediatek,mt8173-mdp" to "mdp_rdma1" like below, we will
> have
> one more V4L2 video devie node.
> 
> 		mdp_rdma1: rdma@14002000 {
> 			compatible = "mediatek,mt8173-mdp-rdma",
> 				     "mediatek,mt8173-mdp";
> 			...
> 		}
> 
> We should consider the case that there are more than one "MDP_RDMA"
> components. 
> 
> Regards,
> Houlong
> 
> > +	return dev->of_node == mdp_rdma0_node;
> > +}
> > +
> > +static int mtk_mdp_comp_bind(struct device *dev, struct device
> > *master,
> > +			void *data)
> >  {
> >  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
> >  	struct mtk_mdp_dev *mdp = data;
> > -	struct device_node *vpu_node;
> >  
> >  	mtk_mdp_register_component(mdp, comp);
> >  
> > -	/*
> > -	 * If this component has a "mediatek-vpu" property, it is
> > responsible for
> > -	 * notifying the mdp master driver about it so it can be
> > further initialized
> > -	 * later.
> > -	 */
> > -	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> > -	if (vpu_node) {
> > +	if (is_mdp_master(dev)) {
> >  		int ret;
> >  
> > -		mdp->vpu_dev = of_find_device_by_node(vpu_node);
> > -		if (WARN_ON(!mdp->vpu_dev)) {
> > -			dev_err(dev, "vpu pdev failed\n");
> > -			of_node_put(vpu_node);
> > -		}
> > -
> >  		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> >  		if (ret) {
> >  			dev_err(dev, "Failed to register v4l2
> > device\n");
> > @@ -187,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device
> > *dev,
> > struct device *master, void *da
> >  		}
> >  
> >  		/*
> > -		 * presence of the "mediatek,vpu" property in a device
> > node
> > -		 * indicates that it is the primary MDP rdma device and
> > MDP DMA
> > -		 * ops should be handled by its DMA callbacks.
> > +		 * MDP DMA ops will be handled by the DMA callbacks
> > associated with this
> > +		 * device;
> >  		 */
> >  		mdp->rdma_dev = dev;
> >  	}
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > index 50eafcc9993d..6a775463399c 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > @@ -150,8 +150,9 @@ static void release_of(struct device *dev, void
> > *data)
> >  
> >  static int mtk_mdp_master_bind(struct device *dev)
> >  {
> > -	int status;
> >  	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
> > +	struct device_node *vpu_node;
> > +	int status;
> >  
> >  	status = component_bind_all(dev, mdp);
> >  	if (status) {
> > @@ -159,15 +160,30 @@ static int mtk_mdp_master_bind(struct device
> > *dev)
> >  		goto err_component_bind_all;
> >  	}
> >  
> > -	if (mdp->vpu_dev) {
> > -		int ret = vpu_wdt_reg_handler(mdp->vpu_dev,
> > mtk_mdp_reset_handler, mdp,
> > -					  VPU_RST_MDP);
> > -		if (ret) {
> > -			dev_err(dev, "Failed to register reset
> > handler\n");
> > -			goto err_wdt_reg;
> > -		}
> > -	} else {
> > -		dev_err(dev, "no vpu_dev found\n");
> > +	if (mdp->rdma_dev == NULL) {
> > +		dev_err(dev, "Primary MDP device not found");
> > +		status = -ENODEV;
> > +		goto err_component_bind_all;
> > +	}
> > +
> > +	vpu_node = of_find_node_by_name(NULL, "vpu");
> > +	if (!vpu_node) {
> > +		dev_err(dev, "unable to find vpu node");
> > +		status = -ENODEV;
> > +		goto err_wdt_reg;
> > +	}

Hi Eizan,

Is your removing "mediatek,vpu" necessary for this series "Refactor MTK
MDP driver into core/components" ?

In some MediaTek projects (not upstream yet), the device-tree node name
"vpu" may be changed to something like "vpu0", "vpu1" or other name,
which depends on the implementation of "mtk-vpu" driver. We can specify
the different phandle to "mediatek,vpu" in .dtsi file. If we use
of_find_node_by_name() to get the vpu_node, we have to modify the name
string in different project.
If the answer of my previous questions is "No", I prefer to slow down
the modification of removing "mediatek,vpu".

Sorry for late reply.

Regards,
Houlong

> > +
> > +	mdp->vpu_dev = of_find_device_by_node(vpu_node);
> > +	if (!mdp->vpu_dev) {
> > +		dev_err(dev, "unable to find vpu device");
> > +		status = -ENODEV;
> > +		goto err_wdt_reg;
> > +	}
> > +
> > +	status = vpu_wdt_reg_handler(mdp->vpu_dev,
> > mtk_mdp_reset_handler, mdp, VPU_RST_MDP);
> > +	if (status) {
> > +		dev_err(dev, "Failed to register reset handler\n");
> > +		goto err_wdt_reg;
> >  	}
> >  
> >  	status = mtk_mdp_register_m2m_device(mdp);
> > -- 
> > 2.32.0.554.ge1b32706d8-goog
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
