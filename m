Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBD1C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 17:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBD860F8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 17:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DBD860F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcKxU+3cC600gS0WNiuaCxnUAwp8fnkQvR0LFxF9JR0=; b=loShUGoq1hNYl/
	8bMIkm7Nhlxn/eEy7r8aobjvLmnnrS5Nh2soTjYFpxR/byZaPkGq1r2oqzHLJh7hUn0fmVBCmspJC
	T6KbU1MW+XwWPytNLkCoVbov+GUHGq41/75gJV6ow2FI+RSVPJnez0JVoPaMFCbvBMpACiiMr9DsK
	brwp7kgHx2dLK//7B0qwqqSvrd/sbdV51Jcj44AQXo3MN7jCUZse+J6y3msy9GZ63c2impD2DRw9/
	6uLBZ1hJmnBtbPfYf7Spb76qXL2xkJC3zWjlOhwdbywSN7bmxtDAqGa+kyDJTq+9ZRr9xks9RQ8RF
	NpYuhmsRG7dFWA4Ouo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKks9-000A9H-3J; Mon, 30 Aug 2021 17:15:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKks3-000A7O-Pd; Mon, 30 Aug 2021 17:14:59 +0000
X-UUID: ec22a16f181d4b23a08881a0a4d8f76e-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o3ZzAkBAEoLuL6O6uHI5aTvY6v4T4q0T9URohE9sqsM=; 
 b=l5e5fkSvlRrdokWtIgdJmGVcaC1XCpr6Y2P7Q/3G2lBFf4qUWcdy2UxobLlIlKnC1TKpxkpvWyF0jylewbUDu/r2fz1CJhaonJFpuS1OPOBFhnmJR1J7TKLHEhV+dzfrpKETikjXU/xKi8CMuYNGnSgInlii9zvD6Q54eZkdBQ4=;
X-UUID: ec22a16f181d4b23a08881a0a4d8f76e-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1168148174; Mon, 30 Aug 2021 10:14:50 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 10:14:48 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 31 Aug 2021 01:14:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 01:14:46 +0800
Message-ID: <1630343686.7403.44.camel@mhfsdcap03>
Subject: Re: [PATCH v7 7/7] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
From: houlong wei <houlong.wei@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC: Eizan Miyamoto <eizan@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=
 <Yong.Wu@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>, CK Hu
 =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>, Yongqiang
 Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?=
 <yongqiang.niu@mediatek.com>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Tue, 31 Aug 2021 01:14:46 +0800
In-Reply-To: <e9020b68-5d20-8e4f-4883-273fe4697d60@collabora.com>
References: <20210825063323.3607738-1-eizan@chromium.org>
 <20210825163247.v7.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <1629880999.12893.17.camel@mhfsdcap03>
 <0c9fa482-57dd-d4ef-c65b-01f137c57359@collabora.com>
 <1629904697.15752.11.camel@mhfsdcap03>
 <e9020b68-5d20-8e4f-4883-273fe4697d60@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_101455_873778_3A828302 
X-CRM114-Status: GOOD (  64.22  )
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

Hi Enric,

My answers are as follows.Thanks for deep thinking about mtk-mdp.

Regards,
Houlong

On Thu, 2021-08-26 at 00:54 +0800, Enric Balletbo i Serra wrote:
> Hi Houlong,
> 
> Thank you for your answer, some more questions below :-)
> 
> On 25/8/21 17:18, houlong wei wrote:
> > On Wed, 2021-08-25 at 17:07 +0800, Enric Balletbo i Serra wrote:
> >> Hi Houlong,
> >>
> >> Thank you for following up this patchset. I have some questions to try to
> >> understand better the hardware though.
> >>
> >> On 25/8/21 10:43, houlong wei wrote:
> >>> Hi Eizan,
> >>>
> >>> Thanks for you patch. I have inline comment below.
> >>>
> >>> Regards,
> >>> Houlong
> >>>
> >>> On Wed, 2021-08-25 at 14:33 +0800, Eizan Miyamoto wrote:
> >>>> ... Instead of depending on the presence of a mediatek,vpu property in
> >>>> the device node.
> >>>>
> >>>> That property was originally added to link to the vpu node so that the
> >>>> mtk_mdp_core driver could pass the right device to
> >>>> vpu_wdt_reg_handler(). However in a previous patch in this series,
> >>>> the driver has been modified to search the device tree for that node
> >>>> instead.
> >>>>
> >>>> That property was also used to indicate the primary MDP device, so that
> >>>> it can be passed to the V4L2 subsystem as well as register it to be
> >>>> used when setting up queues in the open() callback for the filesystem
> >>>> device node that is created. In this case, assuming that the primary
> >>>> MDP device is the one with a specific alias seems useable because the
> >>>> alternative is to add a property to the device tree which doesn't
> >>>> actually represent any facet of hardware (i.e., this being the primary
> >>>> MDP device is a software decision). In other words, this solution is
> >>>> equally as arbitrary, but at least it doesn't add a property to a
> >>>> device node where said property is unrelated to the hardware present.
> >>>>
> >>>> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> >>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>>> ---
> >>>>
> >>>> (no changes since v1)
> >>>>
> >>>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 56 +++++++++++++------
> >>>>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 36 ++++++++----
> >>>>  2 files changed, 64 insertions(+), 28 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> >>>> index 85ef274841a3..9527649de98e 100644
> >>>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> >>>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> >>>> @@ -151,29 +151,50 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
> >>>>  		mtk_smi_larb_put(comp->larb_dev);
> >>>>  }
> >>>>  
> >>>> -static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *data)
> >>>> +/*
> >>>> + * The MDP master device node is identified by the device tree alias
> >>>> + * "mdp-rdma0".
> >>>> + */
> >>>> +static bool is_mdp_master(struct device *dev)
> >>>> +{
> >>>> +	struct device_node *aliases, *mdp_rdma0_node;
> >>>> +	const char *mdp_rdma0_path;
> >>>> +
> >>>> +	if (!dev->of_node)
> >>>> +		return false;
> >>>> +
> >>>> +	aliases = of_find_node_by_path("/aliases");
> >>>> +	if (!aliases) {
> >>>> +		dev_err(dev, "no aliases found for mdp-rdma0");
> >>>> +		return false;
> >>>> +	}
> >>>> +
> >>>> +	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
> >>>> +	if (!mdp_rdma0_path) {
> >>>> +		dev_err(dev, "get mdp-rdma0 property of /aliases failed");
> >>>> +		return false;
> >>>> +	}
> >>>> +
> >>>> +	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
> >>>> +	if (!mdp_rdma0_node) {
> >>>> +		dev_err(dev, "path resolution failed for %s", mdp_rdma0_path);
> >>>> +		return false;
> >>>> +	}
> >>>> +
> >>>> +	return dev->of_node == mdp_rdma0_node;
> >>>
> >>>
> >>> About how to determine the master mdp driver, we also can
> >>> judge the component type. The component type can be gotten by calling
> >>> of_device_get_match_data(dev). If the component is MTK_MDP_RDMA, it is
> >>> the master driver. No matter it is mdp_rdma0 or mdp_rdma1.
> >>
> >>
> >> I'm confused, you mean that the component type, aka MTK_MDP_RDMA is only set for
> >> mtk_mdp_rdma0? isn't mtk_dmp_rdma1 also a MTK_MDP_RDMA type? Because looks weird
> >> to me that two rdma have diffent types.
> >>
> > Hi Enric,
> > 
> > I can understand your doubts. For mtk-mdp dirver, it is really difficult
> > to understand the relationship among the components. Because the MDP
> > hardware path is configured and connected in the VPU firmware.
> 
> So is fixed by the VPU firmware and can't be changed via, i.e writing some
> registers? Can't be platform data then?
> 
> If that's the case, can you draw the mdp hardware path for i.e MT8173? (so I
> have a better understanding)
> 

I reviewed the mt8173 VPU firmware code and found it only use 1 MDP
path.Perhaps one MDP path could meet the project team's requirement when
the VPU firmware was implemented.
A MDP path is a data path which consists of several MDP hardware
engines, e.g. mdp_rdma1->mdp_rsz1->mdp_wrot1,
mdp_rdma2->mdp_rsz2->mdp_wrot2. Ideally,if there are multiple MDP paths,
the users(e.g. applications) can use them concurrently.

> 
> > For MT8173, the component type of mtk_mdp_rdma0 and mtk_mdp_rdma1 are
> > both MTK_MDP_RDMA. Even though the mtk-mdp driver's component list
> > contains both of them, only one corresponding hardware component takes
> > effect during the processing of a frame, the VPU decides it.
> > 
> 
> So IIUC the VPU firmware decides which rdma uses on every frame, right? From hw
> point of view, why one of them need to be master?
> 

For mt8173, the VPU firmware only use one rdma because another MDP path
is not implemented.If we implement multiple MDP paths in certain
project, each rdma can be master.


> > Regards,
> > Houlong
> >>
> >>> http://lists.infradead.org/pipermail/linux-mediatek/2021-August/028533.html
> >>>
> >>> IMO, judging it by component type is more flexible because it does not
> >>> limit to 'mdp_rdma0'.
> >>>
> >>
> >> Using an alias like Eizan did is also flexible, you only need to set mdp-rdma0
> >> to point the mdp_rdma1 node.
> >>
> >> What I am really interested to know is the differences between the platforms to
> >> understand if this is really a platform hardware property or a software
> >> configurable thing, so would help if you can give use the different use cases
> >> for different SoCs.
> >>
> >> For MT8173 which is the master device? is _always_ rdma0 or can also be rdma1?
> >>
> >> Or maybe what is not clear here is what exactly means be a master device?
> >>
> >> What about MT8183 and other SoCs?
> >>
> >> Thanks,
> >>   Enric
> >>
> > Hi Enric,
> > 
> > Before answer your questions, let's unify the concept of the master
> > device.If an MDP device-tree node can not only generate a /dev/video
> > device node, but also can generate a mtk component device node, then
> > this component device is the master device.
> 
> Sorry, what you mean with a mtk component device node?

My meaning is that the device-tree node can generate a platform device,
it is what the mtk_mdp_comp.c does.

> 
> > From the perspective of the device tree node, the compatible of a MDP
> > device tree node contains both "mediatek,mt8173-mdp-rdma" and
> > "mediatek,mt8173-mdp", then its corresponding mtk component device is
> > the master device.
> 
> So that's what's wrong, and Eizan patches get rid of this. In this case you
> can't use device-tree to specify such master device. Device-tree is only about
> hardware description, can't be used, in this case, as entry point to instantiate
> the mdp driver. Hence Eizan patches change this, and mdp is instantiated by the
> mmsys driver. Similar to what we do for the drm driver.
> 
> For the two hw rdma blocks the compatible should be just
> "mediatek,mt8173-mdp-rdma" in this case.
> 
> Thanks,
>   Enric

My consideration is how the driver supports it when there are multiple
MDP paths. Assume there are 2 MDP paths, as a V4L2 driver, mtk-mdp can
generates two device nodes, e.g. /dev/video0 supports one of MDP
path, /dev/video1 supports another MDP path.

> > Since this concept comes from Eizan's patches, if my understanding is
> > different from yours, please let me know, thanks.
> > 
> > If there is only one master device, I fully agree with you. For MT8173,
> > both mdp_rdma0 and mdp_rdma1 can be master device at the same time.
> > But now only mdp_rdma0 takes this role, perhaps because one MDP hardware
> > path could meet the project's the requirement six years ago.
> > In some project, we have two or more MDP hardware paths, we can
> > configure all the mdp_rdma components as master devices, and there will
> > be several /dev/video device nodes. The user can control them
> > concurrently.
> > 
> > Regards,
> > Houlong
> > 
> >>
> >>>> +}
> >>>> +
> >>>> +static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> >>>> +			void *data)
> >>>>  {
> >>>>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
> >>>>  	struct mtk_mdp_dev *mdp = data;
> >>>> -	struct device_node *vpu_node;
> >>>>  
> >>>>  	mtk_mdp_register_component(mdp, comp);
> >>>>  
> >>>> -	/*
> >>>> -	 * If this component has a "mediatek-vpu" property, it is responsible for
> >>>> -	 * notifying the mdp master driver about it so it can be further initialized
> >>>> -	 * later.
> >>>> -	 */
> >>>> -	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> >>>> -	if (vpu_node) {
> >>>> +	if (is_mdp_master(dev)) {
> >>>>  		int ret;
> >>>>  
> >>>> -		mdp->vpu_dev = of_find_device_by_node(vpu_node);
> >>>> -		if (WARN_ON(!mdp->vpu_dev)) {
> >>>> -			dev_err(dev, "vpu pdev failed\n");
> >>>> -			of_node_put(vpu_node);
> >>>> -		}
> >>>> -
> >>>>  		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> >>>>  		if (ret) {
> >>>>  			dev_err(dev, "Failed to register v4l2 device\n");
> >>>> @@ -187,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *da
> >>>>  		}
> >>>>  
> >>>>  		/*
> >>>> -		 * presence of the "mediatek,vpu" property in a device node
> >>>> -		 * indicates that it is the primary MDP rdma device and MDP DMA
> >>>> -		 * ops should be handled by its DMA callbacks.
> >>>> +		 * MDP DMA ops will be handled by the DMA callbacks associated with this
> >>>> +		 * device;
> >>>>  		 */
> >>>>  		mdp->rdma_dev = dev;
> >>>>  	}
> >>>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> >>>> index 50eafcc9993d..6a775463399c 100644
> >>>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> >>>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> >>>> @@ -150,8 +150,9 @@ static void release_of(struct device *dev, void *data)
> >>>>  
> >>>>  static int mtk_mdp_master_bind(struct device *dev)
> >>>>  {
> >>>> -	int status;
> >>>>  	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
> >>>> +	struct device_node *vpu_node;
> >>>> +	int status;
> >>>>  
> >>>>  	status = component_bind_all(dev, mdp);
> >>>>  	if (status) {
> >>>> @@ -159,15 +160,30 @@ static int mtk_mdp_master_bind(struct device *dev)
> >>>>  		goto err_component_bind_all;
> >>>>  	}
> >>>>  
> >>>> -	if (mdp->vpu_dev) {
> >>>> -		int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> >>>> -					  VPU_RST_MDP);
> >>>> -		if (ret) {
> >>>> -			dev_err(dev, "Failed to register reset handler\n");
> >>>> -			goto err_wdt_reg;
> >>>> -		}
> >>>> -	} else {
> >>>> -		dev_err(dev, "no vpu_dev found\n");
> >>>> +	if (mdp->rdma_dev == NULL) {
> >>>> +		dev_err(dev, "Primary MDP device not found");
> >>>> +		status = -ENODEV;
> >>>> +		goto err_component_bind_all;
> >>>> +	}
> >>>> +
> >>>> +	vpu_node = of_find_node_by_name(NULL, "vpu");
> >>>> +	if (!vpu_node) {
> >>>> +		dev_err(dev, "unable to find vpu node");
> >>>> +		status = -ENODEV;
> >>>> +		goto err_wdt_reg;
> >>>> +	}
> >>>> +
> >>>> +	mdp->vpu_dev = of_find_device_by_node(vpu_node);
> >>>
> >>> The 'vpu_node' should be put by calling 'of_node_put(vpu_node)' when it
> >>> is not used.
> >>>
> >>>> +	if (!mdp->vpu_dev) {
> >>>> +		dev_err(dev, "unable to find vpu device");
> >>>> +		status = -ENODEV;
> >>>> +		goto err_wdt_reg;
> >>>> +	}
> >>>> +
> >>>> +	status = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp, VPU_RST_MDP);
> >>>> +	if (status) {
> >>>> +		dev_err(dev, "Failed to register reset handler\n");
> >>>> +		goto err_wdt_reg;
> >>>>  	}
> >>>>  
> >>>>  	status = mtk_mdp_register_m2m_device(mdp);
> >>>
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
