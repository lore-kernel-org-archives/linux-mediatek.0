Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDD4C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 15:40:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B3861285
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 15:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41B3861285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nka3ztVDduJO4D9DIFtZqFQZ7b/0/suki0ydE1DkaEo=; b=WOu7pstPHsMAKV
	0NSzIRePkjGvoeVHtGeitiGGMumZ9hXdL6EmImORPFCsXOxFfYnZhc2pVr47qaSJIGyZeltkVlpQj
	jYJj+4gapqEPr2+vbVGk6OJamPMbvq0jMo34foVaQVR0mpgBowIk4L1dTF4oULFMg5IQRr+8oNabJ
	X04gjHJlXjBwyspxlwI/G6nYfICUI0YGt+8q8L5X0UzKnYwBm5hHEksSeS0mWxQdh5LeV7S5wNYIM
	B+ZcznMX1Pc1qn8yhrP6z7JTcaBQGOGFT2aVCJxE8PY8iUZ0ZQqWHSQZcinkICsIkWgNKZ+joO+xI
	k1MKcgwqJvriMHEY4vvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdqR-009HmZ-SZ; Tue, 08 Jun 2021 15:40:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdq8-009Hf3-G6; Tue, 08 Jun 2021 15:40:33 +0000
X-UUID: 2f34bcb4c71f4ec98d441435f8cdd280-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=N0L0EGwb8ZrLfFv20gD261oj6N94iUqWXEiFoaoCi8c=; 
 b=jBFr3chTkjjHAbrM2T1HFr4DLcNpt776eHPdSdaT1uro2hwy/9ezWtovwFrDoi8KcoAXcx6gZ2HJt5nYYe2CK171aJZ4H+EQiObciAZmQVAM86tBbsHmztn6i0RpHHRKItlQVsF7llyGqWnt+ayC3QqKatu/YNMwtE4HR6GWBys=;
X-UUID: 2f34bcb4c71f4ec98d441435f8cdd280-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 494861554; Tue, 08 Jun 2021 08:40:26 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 08:40:24 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Jun 2021 23:40:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 23:40:18 +0800
Message-ID: <1623166818.7079.34.camel@mhfsdcap03>
Subject: Re: [PATCH v1 4/4] mtk-mdp: soc: mediatek: register mdp from mmsys
From: houlong wei <houlong.wei@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC: Eizan Miyamoto <eizan@google.com>, Eizan Miyamoto <eizan@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=
 <Yong.Wu@mediatek.com>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 <houlong.wei@mediatek.com>
Date: Tue, 8 Jun 2021 23:40:18 +0800
In-Reply-To: <63b4568d-55bc-e88e-be9d-9a2fecddeb3c@collabora.com>
References: <20210423055842.2490679-1-eizan@chromium.org>
 <20210423155824.v1.4.I558dcbaa17bf00243951a8ceb6d0e98758aacfa4@changeid>
 <ecf9ab25-779d-01c7-97e3-76aa09b69415@collabora.com>
 <CAOak1e82j+j_1pWACS5j5cZ2ZZhN+C-6kJYCg5q_bCarTPqHww@mail.gmail.com>
 <63b4568d-55bc-e88e-be9d-9a2fecddeb3c@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 23EA352DA0EB73750A9E79621AEA7300BD9784B1FD76F1F7142D6D0A4C00A5A22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_084030_010127_86355E9E 
X-CRM114-Status: GOOD (  54.11  )
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

On Fri, 2021-05-14 at 18:14 +0800, Enric Balletbo i Serra wrote:
> Hi Eizan,
> 
> 
> On 3/5/21 8:42, Eizan Miyamoto wrote:
> > On Fri, Apr 30, 2021 at 1:46 AM Enric Balletbo i Serra
> > <enric.balletbo@collabora.com> wrote:
> >>
> >> Hi Eizan,
> >>
> >> Thank you for your patch.
> >>
> >> On 23/4/21 7:58, Eizan Miyamoto wrote:
> >>> Rather than hanging the MDP master component driver off of the rdma0
> >>> device, create a "virtual" device by the mmsys driver instead which is
> >>> probed by the mtk_mdp_core driver.
> >>>
> >>> Broadly, four interdependent things are done by this change:
> >>> - A virtual device that is probed by the mtk_mdp_core driver is
> >>>   instantiated by the mtk_mmsys driver.
> >>> - Presence of a mediatek,vpu property in a child node to the mmsys
> >>>   device node is used to determine what device to use when dispatching
> >>>   dma ops from the relevant ioctl.
> >>> - v4l-related setup is moved into from the mtk_mdp_core driver to the
> >>>   mtk_mdp_comp driver.
> >>>
> >>> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> >>> ---
> >>>
> >>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 47 +++++++++-----
> >>>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++-------------
> >>>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |  2 +
> >>>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  4 +-
> >>>  drivers/soc/mediatek/mtk-mmsys.c              | 20 +++++-
> >>>  5 files changed, 75 insertions(+), 60 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> >>> index d447bfaadef4..dc5231a1fcfd 100644
> >>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> >>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> >>> @@ -106,8 +106,41 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> >>>  {
> >>>       struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
> >>>       struct mtk_mdp_dev *mdp = data;
> >>> +     struct device_node *vpu_node;
> >>>
> >>>       mtk_mdp_register_component(mdp, comp);
> >>> +
> >>> +     // If this component has a "mediatek-vpu" property, it is responsible for
> >>> +     // notifying the mdp master driver about it so it can be further initialized
> >>> +     // later.
> >>
> >> Please use c-style comments here.
> > 
> > Thank you for the reminder, I'll update these in the next version of
> > this patch series.
> > 
> >>
> >>> +     vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> >>
> >> That's a bit confusing to me, please correct me if I am wrong, so, the
> >> mediatek,vpu property is used to tell the code that this component should be the
> >> 'vpu master', not to point a vpu node in the DT? I understood correctly?
> > 
> > Is what you mean by 'vpu master' is that it is the device whose driver
> > implements the wdt reset function? In that case, the mtk_mdp_core
> > driver is still the 'vpu master' because mtk_mdp_reset_handler
> > (contained in mtk_mdp_core) is passed to vpu_wdt_reg_handler(). The
> > presence of the property in any MDP component device node can do the
> > job of passing the vpu device (obtained from the node being pointed
> > to) back mtk_mdp_core's mtk_mdp_master_bind() function.
> > 
> > *However*, I'm using the presence of that property to indicate another
> > thing: this is the device that the mdp filesystem device node in /dev
> > should be registered against for v4l2. We will need to save this
> > device for later (in mdp->rdma_dev) to be used to find the DMA
> > callbacks when a call to mtk_mdp_m2m_queue_init is made from the file
> > open() callback (mtk_mdp_m2m_open) attached to the filesystem device
> > node.
> > 
> > Before this change, the mtk_mdp_core driver was serving triple duty as
> > the driver for the device that provided DMA op callbacks, the vpu
> > master, and the MDP component master. Now it is the vpu master and the
> > MDP component master, but not the driver for the device that provides
> > DMA op callbacks.
> > 
> >>
> >>
> >>> +     if (vpu_node) {
> >>> +             int ret;
> >>> +
> >>> +             mdp->vpu_dev = of_find_device_by_node(vpu_node);
> >>> +             if (WARN_ON(!mdp->vpu_dev)) {
> >>> +                     dev_err(dev, "vpu pdev failed\n");
> >>> +                     of_node_put(vpu_node);
> >>> +             }
> >>> +
> >>> +             ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> >>> +             if (ret) {
> >>> +                     dev_err(dev, "Failed to register v4l2 device\n");
> >>> +                     return -EINVAL;
> >>> +             }
> >>> +
> >>> +             ret = vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
> >>> +             if (ret) {
> >>> +                     dev_err(dev, "Failed to set vb2 dma mag seg size\n");
> >>> +                     return -EINVAL;
> >>> +             }
> >>> +
> >>> +             // presence of the "mediatek,vpu" property in a device node
> >>> +             // indicates that it is the primary MDP rdma device and MDP DMA
> >>> +             // ops should be handled by its DMA callbacks.
> >>
> >> Isn't rdma0 always the primary MDP device? or there are SoCs or configurations
> >> where this is different? At least I think it is for MT8173 and MT8183.
> > 
> > I suppose you're right, though now it seems to be called mdp_rdma0 in
> > the device tree?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?id=9ccce092fc64d19504fa54de4fd659e279cc92e7#n1004
> > 
> > Maybe somebody from MediaTek can confirm this?
> 
> That's the case on all the devices that are upstream, so maybe we can just
> assume that for now if nobody from MediaTek confirms. I am in the opinion that
> we should avoid use the mediatek,vpu property if is possible.
> 

Hi Enric,
You are right! Currently, for the upstream MDP driver, the mdp_rdma
device node always stands for the primary MDP device. In some projects,
there may be more than one mdp_rdma device nodes, so there may be more
than one MDP device.
In original code, the 'vpu_dev' is retrieved from the return value of
vpu_get_plat_device(). Maybe we don't have to implement the duplicated
code to parse it again.But the 'vpu_dev' is necessary for
vpu_wdt_reg_handler(), vpu_ipi_register() and vpi_ipi_send().

Regards,
Houlong

> > 
> >>
> >>> +             mdp->rdma_dev = dev;
> >>> +     }
> >>> +
> >>>       pm_runtime_enable(dev);
> >>>
> >>>       return 0;
> >>> @@ -164,23 +197,9 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
> >>>  static int mtk_mdp_comp_probe(struct platform_device *pdev)
> >>>  {
> >>>       struct device *dev = &pdev->dev;
> >>> -     struct device_node *vpu_node;
> >>>       int status;
> >>>       struct mtk_mdp_comp *comp;
> >>>
> >>> -     vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> >>> -     if (vpu_node) {
> >>> -             of_node_put(vpu_node);
> >>> -             /*
> >>> -              * The device tree node with a mediatek,vpu property is deemed
> >>> -              * the MDP "master" device, we don't want to add a component
> >>> -              * for it in this function because the initialization for the
> >>> -              * master is done elsewhere.
> >>> -              */
> >>> -             dev_info(dev, "vpu node found, not probing\n");
> >>> -             return -ENODEV;
> >>> -     }
> >>> -
> >>>       comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> >>>       if (!comp)
> >>>               return -ENOMEM;
> >>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> >>> index 5e71496e2517..4d7aa4e26be6 100644
> >>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> >>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> >>> @@ -121,6 +121,17 @@ static int mtk_mdp_master_bind(struct device *dev)
> >>>               goto err_component_bind_all;
> >>>       }
> >>>
> >>> +     if (mdp->vpu_dev) {
> >>> +             int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> >>> +                                       VPU_RST_MDP);
> >>> +             if (ret) {
> >>> +                     dev_err(dev, "Failed to register reset handler\n");
> >>> +                     goto err_wdt_reg;
> >>> +             }
> >>> +     } else {
> >>> +             dev_err(dev, "no vpu_dev found\n");
> >>> +     }
> >>> +
> >>>       status = mtk_mdp_register_m2m_device(mdp);
> >>>       if (status) {
> >>>               dev_err(dev, "Failed to register m2m device: %d\n", status);
> >>> @@ -133,6 +144,8 @@ static int mtk_mdp_master_bind(struct device *dev)
> >>>       return 0;
> >>>
> >>>  err_mtk_mdp_register_m2m_device:
> >>> +
> >>> +err_wdt_reg:
> >>>       component_unbind_all(dev, mdp);
> >>>
> >>>  err_component_bind_all:
> >>> @@ -191,8 +204,13 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >>>               of_node_put(node);
> >>>               parent = dev->of_node;
> >>>               dev_warn(dev, "device tree is out of date\n");
> >>> -     } else {
> >>> +     } else if (dev->of_node) {
> >>>               parent = dev->of_node->parent;
> >>> +     } else if (dev->parent) {
> >>> +             // maybe we were created from a call to platform_device_register_data()
> >>> +             parent = dev->parent->parent->of_node;
> >>> +     } else {
> >>> +             return -ENODEV;
> >>>       }
> >>>
> >>>       /* Iterate over sibling MDP function blocks */
> >>> @@ -225,16 +243,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >>>               }
> >>>       }
> >>>
> >>> -     /*
> >>> -      * Create a component for myself so that clocks can be toggled in
> >>> -      * clock_on().
> >>> -      */
> >>> -     ret = mtk_mdp_comp_init(&mdp->comp_self, dev);
> >>> -     if (ret) {
> >>> -             dev_err(dev, "Failed to initialize component\n");
> >>> -             goto err_comp;
> >>> -     }
> >>> -
> >>>       mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
> >>>       if (!mdp->job_wq) {
> >>>               dev_err(&pdev->dev, "unable to alloc job workqueue\n");
> >>> @@ -250,29 +258,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >>>       }
> >>>       INIT_WORK(&mdp->wdt_work, mtk_mdp_wdt_worker);
> >>>
> >>> -     ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> >>> -     if (ret) {
> >>> -             dev_err(&pdev->dev, "Failed to register v4l2 device\n");
> >>> -             ret = -EINVAL;
> >>> -             goto err_dev_register;
> >>> -     }
> >>> -
> >>> -     mdp->vpu_dev = vpu_get_plat_device(pdev);
> >>> -     ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> >>> -                               VPU_RST_MDP);
> >>> -     if (ret) {
> >>> -             dev_err(&pdev->dev, "Failed to register reset handler\n");
> >>> -             goto err_wdt_reg;
> >>> -     }
> >>> -
> >>>       platform_set_drvdata(pdev, mdp);
> >>>
> >>> -     ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> >>> -     if (ret) {
> >>> -             dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> >>> -             goto err_set_max_seg_size;
> >>> -     }
> >>> -
> >>>       ret = component_master_add_with_match(dev, &mtk_mdp_com_ops, match);
> >>>       if (ret) {
> >>>               dev_err(dev, "Component master add failed\n");
> >>> @@ -284,22 +271,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >>>       return 0;
> >>>
> >>>  err_component_master_add:
> >>> -     vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> >>> -
> >>> -err_set_max_seg_size:
> >>> -
> >>> -err_wdt_reg:
> >>> -     v4l2_device_unregister(&mdp->v4l2_dev);
> >>> -
> >>> -err_dev_register:
> >>>       destroy_workqueue(mdp->wdt_wq);
> >>>
> >>>  err_alloc_wdt_wq:
> >>>       destroy_workqueue(mdp->job_wq);
> >>>
> >>>  err_alloc_job_wq:
> >>> -
> >>> -err_comp:
> >>>       dev_dbg(dev, "err %d\n", ret);
> >>>       return ret;
> >>>  }
> >>> @@ -371,7 +348,6 @@ static struct platform_driver mtk_mdp_driver = {
> >>>       .driver = {
> >>>               .name   = MTK_MDP_MODULE_NAME,
> >>>               .pm     = &mtk_mdp_pm_ops,
> >>> -             .of_match_table = mtk_mdp_of_ids,
> >>>       }
> >>>  };
> >>>
> >>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> >>> index 230f531400ca..78c3c77cd226 100644
> >>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> >>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> >>> @@ -133,6 +133,7 @@ struct mtk_mdp_variant {
> >>>   * struct mtk_mdp_dev - abstraction for image processor entity
> >>>   * @lock:    the mutex protecting this data structure
> >>>   * @vpulock: the mutex protecting the communication with VPU
> >>> + * @rdma_dev:  device pointer to rdma device for MDP
> >>>   * @pdev:    pointer to the image processor platform device
> >>>   * @variant: the IP variant information
> >>>   * @id:              image processor device index (0..MTK_MDP_MAX_DEVS)
> >>> @@ -151,6 +152,7 @@ struct mtk_mdp_variant {
> >>>  struct mtk_mdp_dev {
> >>>       struct mutex                    lock;
> >>>       struct mutex                    vpulock;
> >>> +     struct device                   *rdma_dev;
> >>>       struct platform_device          *pdev;
> >>>       struct mtk_mdp_variant          *variant;
> >>>       u16                             id;
> >>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> >>> index d351e5a44768..c80ad8299c5e 100644
> >>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> >>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> >>> @@ -932,7 +932,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> >>>       src_vq->mem_ops = &vb2_dma_contig_memops;
> >>>       src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> >>>       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >>> -     src_vq->dev = &ctx->mdp_dev->pdev->dev;
> >>> +     src_vq->dev = ctx->mdp_dev->rdma_dev;
> >>>       src_vq->lock = &ctx->mdp_dev->lock;
> >>>
> >>>       ret = vb2_queue_init(src_vq);
> >>> @@ -947,7 +947,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> >>>       dst_vq->mem_ops = &vb2_dma_contig_memops;
> >>>       dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> >>>       dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >>> -     dst_vq->dev = &ctx->mdp_dev->pdev->dev;
> >>> +     dst_vq->dev = ctx->mdp_dev->rdma_dev;
> >>>       dst_vq->lock = &ctx->mdp_dev->lock;
> >>>
> >>>       return vb2_queue_init(dst_vq);
> >>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> >>> index 18f93979e14a..6f9cf7725529 100644
> >>> --- a/drivers/soc/mediatek/mtk-mmsys.c
> >>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> >>> @@ -305,6 +305,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
> >>>       struct device *dev = &pdev->dev;
> >>>       struct platform_device *clks;
> >>>       struct platform_device *drm;
> >>> +     struct platform_device *mdp;
> >>>       void __iomem *config_regs;
> >>>       int ret;
> >>>
> >>> @@ -328,10 +329,27 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
> >>>                                           PLATFORM_DEVID_AUTO, NULL, 0);
> >>>       if (IS_ERR(drm)) {
> >>>               platform_device_unregister(clks);
> >>> -             return PTR_ERR(drm);
> >>> +             ret = PTR_ERR(drm);
> >>> +             goto err_drm;
> >>> +     }
> >>> +
> >>> +     mdp = platform_device_register_data(&pdev->dev, "mtk-mdp",
> >>> +                                         PLATFORM_DEVID_AUTO, NULL, 0);
> >>> +     if (IS_ERR(mdp)) {
> >>> +             ret = PTR_ERR(mdp);
> >>> +             dev_err(dev, "Failed to register mdp: %d\n", ret);
> >>> +             goto err_mdp;
> >>>       }
> >>>
> >>>       return 0;
> >>> +
> >>> +err_mdp:
> >>> +     platform_device_unregister(drm);
> >>> +
> >>> +err_drm:
> >>> +     platform_device_unregister(clks);
> >>> +
> >>> +     return ret;
> >>>  }
> >>>
> >>>  static const struct of_device_id of_match_mtk_mmsys[] = {
> >>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
