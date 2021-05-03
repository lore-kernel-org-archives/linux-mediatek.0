Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200A5C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 06:43:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BAD2611AD
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 06:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BAD2611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DqF3WysPA5iez5iDELrG7IuGeO0zBc2Rw8ho6dsI5As=; b=kMiq/+H7VwGeLD/rs9yrmO1Ht
	QarYDB9JpONVMXtMY3hOXrfCO723UMSDxPyrj9LjUx728R3wkdmKLHGC+SRrGOdOiNs9QADz8t+lN
	vW5yHvOrtNYFjTaT2if8afM2JfKKBN89h77AXDmK4/CmhWv25Du9NirLxpAzgbH6Dc6wzr9WbAb0T
	gxl3T9pb4MlJ3sz5G31+r0XjPmGG6QsQEK8iomGk+ARqzyt+18CwDd4zPoDyt4uZFza5cmEdp1eb/
	QmcAgaL2dkqc5WwmM5RvnRS6yHOSe0fGatPvK4UMCxr1H8yNVUvEmjNlzu7DQ4Io7oiN/WZ9I4rwA
	FEoZLcTVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldSI4-00DIvx-Ge; Mon, 03 May 2021 06:42:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldSHo-00DIu6-Kn
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 06:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=50tzV6/44j0eBTOhl81nHs1oy+v+DFkPFiSwkc1A+c4=; b=KD03LVeYF2Fq1k46C6wPygBIgk
 p6yvK1IHBYQnbI4YrpG1rG8wxkdX8RPZ86k8DYvNVoWY2TARcC0syK8NSPU5L3+MWUzsob31JngZI
 8Ikbwsbdh9cDNcrubyCYDB3flOaDFgrJKCBYP30SZybfjMS7UCmMieX00QDiSkeznx+mvbGXPymwX
 jGab/RBpYH2NWZNN8bUjRg4QwhXglCLkqgHCduN61TiyNLHy5LXPUVT2LgnPUi68r+taFoX3m5NzM
 LuRwONQZSWyzAo7zbvtXFyUPCehNn/OuJlDRlfXGiTEBE4EbqoLw5EquQNjQziIrg+4TDGsXxu4Is
 lQk5kyWA==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldSHk-002s7k-P0
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 06:42:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id x20so6553503lfu.6
 for <linux-mediatek@lists.infradead.org>; Sun, 02 May 2021 23:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=50tzV6/44j0eBTOhl81nHs1oy+v+DFkPFiSwkc1A+c4=;
 b=Kf3ua/xxB8cYfhFxw6ua20pX4hMRhXlR9yXJL9ptXTeBLrcrwYGtfF8lL3pDX6VMJc
 +hu8XDWixDQR3MZeaKnrBmWqgVKio3mWafX+/HCclzG9Xp01NxBG1bD/gBApfh/5k6C6
 hBCySaa2RPpcaXoW1OVHIH1ChEIq7f3JByeudTqcvPX91h9yVegweVeDowNk4RVRHCSJ
 FhmSsfRarFJg78VXARNRIDqIS7Jn/KZPnYMna6PYP2/JAuEM+ffAxdnHvTC4FZcjQrq5
 wsnWSaT6sq6yAaM6BzEABuymgI/I0NQAxNA26YM8PEkVx2L2Wb2b4kZoiBibRjWJpph8
 JupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=50tzV6/44j0eBTOhl81nHs1oy+v+DFkPFiSwkc1A+c4=;
 b=ZVX7wjfC9JU2MWMvderm8LEhf8moyZfuZtFmZ7Im6TQPsgR8yIJB9/JrpzwAhliJEv
 uwe5r5RFSgMkzvIU3riqevONrf8BSdKIxSo3x7nDQxh6ug3rbsL57RGMY6bMPhiNeBHy
 bWIpS4nqWY8zdPHUuM/8779bTpurfC29mCran0ouzS1Py7c0O+L4tQfRNm4NGghST3YO
 Q1mDT9QLcYV5pbFZxyKp/MWr55jZySVq3+khzuIjGG8fXVBH/fjWKcoKk+KPo6GeNkPP
 49f/UsIM5vEBA84FDUdvW+Y8hSiqdLI0a/T0nL+R2hAC4ORGcVhwXb/CjrPj90bEUYGa
 xUww==
X-Gm-Message-State: AOAM532uu5rweB9GQ0OwHgFm5fP6RgHKe2vV2tm9j7Keb41xvxnbn5PX
 BrtQrVj1vsra3MBJxRrFl/dSlH9GO0TSsfqSM9+/Vw==
X-Google-Smtp-Source: ABdhPJzoZNti7FvYqwZimISC7OBoePXjcEaNts04BuXNL4OzmPCKmohafZodsfvgKD3HxvFhlmmpuncaC0qXN1E9HIE=
X-Received: by 2002:a05:6512:3d8f:: with SMTP id
 k15mr6611586lfv.227.1620024145521; 
 Sun, 02 May 2021 23:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210423055842.2490679-1-eizan@chromium.org>
 <20210423155824.v1.4.I558dcbaa17bf00243951a8ceb6d0e98758aacfa4@changeid>
 <ecf9ab25-779d-01c7-97e3-76aa09b69415@collabora.com>
In-Reply-To: <ecf9ab25-779d-01c7-97e3-76aa09b69415@collabora.com>
From: Eizan Miyamoto <eizan@google.com>
Date: Mon, 3 May 2021 16:42:14 +1000
Message-ID: <CAOak1e82j+j_1pWACS5j5cZ2ZZhN+C-6kJYCg5q_bCarTPqHww@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] mtk-mdp: soc: mediatek: register mdp from mmsys
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Eizan Miyamoto <eizan@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
 chunkuang.hu@kernel.org, yong.wu@mediatek.com, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_234228_864892_700DC3FB 
X-CRM114-Status: GOOD (  53.12  )
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

On Fri, Apr 30, 2021 at 1:46 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Eizan,
>
> Thank you for your patch.
>
> On 23/4/21 7:58, Eizan Miyamoto wrote:
> > Rather than hanging the MDP master component driver off of the rdma0
> > device, create a "virtual" device by the mmsys driver instead which is
> > probed by the mtk_mdp_core driver.
> >
> > Broadly, four interdependent things are done by this change:
> > - A virtual device that is probed by the mtk_mdp_core driver is
> >   instantiated by the mtk_mmsys driver.
> > - Presence of a mediatek,vpu property in a child node to the mmsys
> >   device node is used to determine what device to use when dispatching
> >   dma ops from the relevant ioctl.
> > - v4l-related setup is moved into from the mtk_mdp_core driver to the
> >   mtk_mdp_comp driver.
> >
> > Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> > ---
> >
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 47 +++++++++-----
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++-------------
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |  2 +
> >  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  4 +-
> >  drivers/soc/mediatek/mtk-mmsys.c              | 20 +++++-
> >  5 files changed, 75 insertions(+), 60 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > index d447bfaadef4..dc5231a1fcfd 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > @@ -106,8 +106,41 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> >  {
> >       struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
> >       struct mtk_mdp_dev *mdp = data;
> > +     struct device_node *vpu_node;
> >
> >       mtk_mdp_register_component(mdp, comp);
> > +
> > +     // If this component has a "mediatek-vpu" property, it is responsible for
> > +     // notifying the mdp master driver about it so it can be further initialized
> > +     // later.
>
> Please use c-style comments here.

Thank you for the reminder, I'll update these in the next version of
this patch series.

>
> > +     vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
>
> That's a bit confusing to me, please correct me if I am wrong, so, the
> mediatek,vpu property is used to tell the code that this component should be the
> 'vpu master', not to point a vpu node in the DT? I understood correctly?

Is what you mean by 'vpu master' is that it is the device whose driver
implements the wdt reset function? In that case, the mtk_mdp_core
driver is still the 'vpu master' because mtk_mdp_reset_handler
(contained in mtk_mdp_core) is passed to vpu_wdt_reg_handler(). The
presence of the property in any MDP component device node can do the
job of passing the vpu device (obtained from the node being pointed
to) back mtk_mdp_core's mtk_mdp_master_bind() function.

*However*, I'm using the presence of that property to indicate another
thing: this is the device that the mdp filesystem device node in /dev
should be registered against for v4l2. We will need to save this
device for later (in mdp->rdma_dev) to be used to find the DMA
callbacks when a call to mtk_mdp_m2m_queue_init is made from the file
open() callback (mtk_mdp_m2m_open) attached to the filesystem device
node.

Before this change, the mtk_mdp_core driver was serving triple duty as
the driver for the device that provided DMA op callbacks, the vpu
master, and the MDP component master. Now it is the vpu master and the
MDP component master, but not the driver for the device that provides
DMA op callbacks.

>
>
> > +     if (vpu_node) {
> > +             int ret;
> > +
> > +             mdp->vpu_dev = of_find_device_by_node(vpu_node);
> > +             if (WARN_ON(!mdp->vpu_dev)) {
> > +                     dev_err(dev, "vpu pdev failed\n");
> > +                     of_node_put(vpu_node);
> > +             }
> > +
> > +             ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> > +             if (ret) {
> > +                     dev_err(dev, "Failed to register v4l2 device\n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret = vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
> > +             if (ret) {
> > +                     dev_err(dev, "Failed to set vb2 dma mag seg size\n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             // presence of the "mediatek,vpu" property in a device node
> > +             // indicates that it is the primary MDP rdma device and MDP DMA
> > +             // ops should be handled by its DMA callbacks.
>
> Isn't rdma0 always the primary MDP device? or there are SoCs or configurations
> where this is different? At least I think it is for MT8173 and MT8183.

I suppose you're right, though now it seems to be called mdp_rdma0 in
the device tree?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?id=9ccce092fc64d19504fa54de4fd659e279cc92e7#n1004

Maybe somebody from MediaTek can confirm this?

>
> > +             mdp->rdma_dev = dev;
> > +     }
> > +
> >       pm_runtime_enable(dev);
> >
> >       return 0;
> > @@ -164,23 +197,9 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
> >  static int mtk_mdp_comp_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> > -     struct device_node *vpu_node;
> >       int status;
> >       struct mtk_mdp_comp *comp;
> >
> > -     vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> > -     if (vpu_node) {
> > -             of_node_put(vpu_node);
> > -             /*
> > -              * The device tree node with a mediatek,vpu property is deemed
> > -              * the MDP "master" device, we don't want to add a component
> > -              * for it in this function because the initialization for the
> > -              * master is done elsewhere.
> > -              */
> > -             dev_info(dev, "vpu node found, not probing\n");
> > -             return -ENODEV;
> > -     }
> > -
> >       comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> >       if (!comp)
> >               return -ENOMEM;
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > index 5e71496e2517..4d7aa4e26be6 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > @@ -121,6 +121,17 @@ static int mtk_mdp_master_bind(struct device *dev)
> >               goto err_component_bind_all;
> >       }
> >
> > +     if (mdp->vpu_dev) {
> > +             int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> > +                                       VPU_RST_MDP);
> > +             if (ret) {
> > +                     dev_err(dev, "Failed to register reset handler\n");
> > +                     goto err_wdt_reg;
> > +             }
> > +     } else {
> > +             dev_err(dev, "no vpu_dev found\n");
> > +     }
> > +
> >       status = mtk_mdp_register_m2m_device(mdp);
> >       if (status) {
> >               dev_err(dev, "Failed to register m2m device: %d\n", status);
> > @@ -133,6 +144,8 @@ static int mtk_mdp_master_bind(struct device *dev)
> >       return 0;
> >
> >  err_mtk_mdp_register_m2m_device:
> > +
> > +err_wdt_reg:
> >       component_unbind_all(dev, mdp);
> >
> >  err_component_bind_all:
> > @@ -191,8 +204,13 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >               of_node_put(node);
> >               parent = dev->of_node;
> >               dev_warn(dev, "device tree is out of date\n");
> > -     } else {
> > +     } else if (dev->of_node) {
> >               parent = dev->of_node->parent;
> > +     } else if (dev->parent) {
> > +             // maybe we were created from a call to platform_device_register_data()
> > +             parent = dev->parent->parent->of_node;
> > +     } else {
> > +             return -ENODEV;
> >       }
> >
> >       /* Iterate over sibling MDP function blocks */
> > @@ -225,16 +243,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > -     /*
> > -      * Create a component for myself so that clocks can be toggled in
> > -      * clock_on().
> > -      */
> > -     ret = mtk_mdp_comp_init(&mdp->comp_self, dev);
> > -     if (ret) {
> > -             dev_err(dev, "Failed to initialize component\n");
> > -             goto err_comp;
> > -     }
> > -
> >       mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
> >       if (!mdp->job_wq) {
> >               dev_err(&pdev->dev, "unable to alloc job workqueue\n");
> > @@ -250,29 +258,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >       }
> >       INIT_WORK(&mdp->wdt_work, mtk_mdp_wdt_worker);
> >
> > -     ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "Failed to register v4l2 device\n");
> > -             ret = -EINVAL;
> > -             goto err_dev_register;
> > -     }
> > -
> > -     mdp->vpu_dev = vpu_get_plat_device(pdev);
> > -     ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> > -                               VPU_RST_MDP);
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "Failed to register reset handler\n");
> > -             goto err_wdt_reg;
> > -     }
> > -
> >       platform_set_drvdata(pdev, mdp);
> >
> > -     ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> > -             goto err_set_max_seg_size;
> > -     }
> > -
> >       ret = component_master_add_with_match(dev, &mtk_mdp_com_ops, match);
> >       if (ret) {
> >               dev_err(dev, "Component master add failed\n");
> > @@ -284,22 +271,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >       return 0;
> >
> >  err_component_master_add:
> > -     vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> > -
> > -err_set_max_seg_size:
> > -
> > -err_wdt_reg:
> > -     v4l2_device_unregister(&mdp->v4l2_dev);
> > -
> > -err_dev_register:
> >       destroy_workqueue(mdp->wdt_wq);
> >
> >  err_alloc_wdt_wq:
> >       destroy_workqueue(mdp->job_wq);
> >
> >  err_alloc_job_wq:
> > -
> > -err_comp:
> >       dev_dbg(dev, "err %d\n", ret);
> >       return ret;
> >  }
> > @@ -371,7 +348,6 @@ static struct platform_driver mtk_mdp_driver = {
> >       .driver = {
> >               .name   = MTK_MDP_MODULE_NAME,
> >               .pm     = &mtk_mdp_pm_ops,
> > -             .of_match_table = mtk_mdp_of_ids,
> >       }
> >  };
> >
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> > index 230f531400ca..78c3c77cd226 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> > @@ -133,6 +133,7 @@ struct mtk_mdp_variant {
> >   * struct mtk_mdp_dev - abstraction for image processor entity
> >   * @lock:    the mutex protecting this data structure
> >   * @vpulock: the mutex protecting the communication with VPU
> > + * @rdma_dev:  device pointer to rdma device for MDP
> >   * @pdev:    pointer to the image processor platform device
> >   * @variant: the IP variant information
> >   * @id:              image processor device index (0..MTK_MDP_MAX_DEVS)
> > @@ -151,6 +152,7 @@ struct mtk_mdp_variant {
> >  struct mtk_mdp_dev {
> >       struct mutex                    lock;
> >       struct mutex                    vpulock;
> > +     struct device                   *rdma_dev;
> >       struct platform_device          *pdev;
> >       struct mtk_mdp_variant          *variant;
> >       u16                             id;
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> > index d351e5a44768..c80ad8299c5e 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> > @@ -932,7 +932,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> >       src_vq->mem_ops = &vb2_dma_contig_memops;
> >       src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> >       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > -     src_vq->dev = &ctx->mdp_dev->pdev->dev;
> > +     src_vq->dev = ctx->mdp_dev->rdma_dev;
> >       src_vq->lock = &ctx->mdp_dev->lock;
> >
> >       ret = vb2_queue_init(src_vq);
> > @@ -947,7 +947,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> >       dst_vq->mem_ops = &vb2_dma_contig_memops;
> >       dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> >       dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > -     dst_vq->dev = &ctx->mdp_dev->pdev->dev;
> > +     dst_vq->dev = ctx->mdp_dev->rdma_dev;
> >       dst_vq->lock = &ctx->mdp_dev->lock;
> >
> >       return vb2_queue_init(dst_vq);
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > index 18f93979e14a..6f9cf7725529 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -305,6 +305,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
> >       struct device *dev = &pdev->dev;
> >       struct platform_device *clks;
> >       struct platform_device *drm;
> > +     struct platform_device *mdp;
> >       void __iomem *config_regs;
> >       int ret;
> >
> > @@ -328,10 +329,27 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
> >                                           PLATFORM_DEVID_AUTO, NULL, 0);
> >       if (IS_ERR(drm)) {
> >               platform_device_unregister(clks);
> > -             return PTR_ERR(drm);
> > +             ret = PTR_ERR(drm);
> > +             goto err_drm;
> > +     }
> > +
> > +     mdp = platform_device_register_data(&pdev->dev, "mtk-mdp",
> > +                                         PLATFORM_DEVID_AUTO, NULL, 0);
> > +     if (IS_ERR(mdp)) {
> > +             ret = PTR_ERR(mdp);
> > +             dev_err(dev, "Failed to register mdp: %d\n", ret);
> > +             goto err_mdp;
> >       }
> >
> >       return 0;
> > +
> > +err_mdp:
> > +     platform_device_unregister(drm);
> > +
> > +err_drm:
> > +     platform_device_unregister(clks);
> > +
> > +     return ret;
> >  }
> >
> >  static const struct of_device_id of_match_mtk_mmsys[] = {
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
