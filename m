Return-Path: <SRS0=a7PR=N3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29455C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 16:39:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52CA60F14
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 16:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B52CA60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33EHhH+HkLAJYJQ+jOE/R7mHaVi+CP3zdrcd0wSfrgk=; b=v1eqhp2kUgEJKy
	LU6nnykqSU+gqElKyVkUYKbaslAaqAgV3wUGIH/oSZDK7lCZbz7B0kyw0WoE9hsfUSAQfzDElysrJ
	JaNTvihUCYnJGPkC+0y7hA8XuGPUAtnLGw/RYa3PtBN+JmKer0uKTGSbBI0FpVri8bv2K8+aYUEdY
	4HQD7QA7jwkQ68enOF3gLjxju8l5B22JedOTDJzVbx8W0qALAPBBxrplGWrQNT5+UCHMriQ5r2n3r
	fjAR/dud1Jg1042WHXt7Bj+EnxgrrXNsN3xs+mZt92sOQYZ2rJR+jp8PcEyfWa5cLqgVi+zMLZz6e
	ga+/nWDqlfDZFS6mxabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMvBD-00G6k4-UU; Sun, 05 Sep 2021 16:39:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMvBA-00G6jB-RC; Sun, 05 Sep 2021 16:39:38 +0000
X-UUID: 620810d604184953a19566a3355f669a-20210905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IYHM/TW5iLucDN1aj78GLAplFLu5DgDEPRT7Egaqg3A=; 
 b=hep3aRWZPwctP/Wcd5mL9NsoVlr7OdC8OhSErAh8uASP2Bu4fjo6GJwIAiiFhaG+IOCsMujxpOPRLUNhDlMK6YFrydIeLcm4PpNawfj66BOWtEz60oi1Bcts17JZPTrIeVM5aW/861TTnYsP7zZnjE6bm5IffyYgGr9pTevFt70=;
X-UUID: 620810d604184953a19566a3355f669a-20210905
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1769846646; Sun, 05 Sep 2021 09:39:29 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Sep 2021 09:39:27 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 6 Sep 2021 00:39:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Sep 2021 00:39:24 +0800
Message-ID: <801231146ab32f9e8aafafd05e9730a383b610e8.camel@mediatek.com>
Subject: Re: [PATCH v7 2/7] mtk-mdp: add driver to probe mdp components
From: houlong wei <houlong.wei@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Eizan Miyamoto
 <eizan@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Yong Wu
 =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, CK Hu
 =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Yongqiang Niu
 =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?= <yongqiang.niu@mediatek.com>,
 Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=
 <Andrew-CT.Chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media
 <linux-media@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Mon, 6 Sep 2021 00:39:26 +0800
In-Reply-To: <fc309940c9e59f80397b90c8b11424fea344e1b5.camel@mediatek.com>
References: <20210825063323.3607738-1-eizan@chromium.org>
 <20210825163247.v7.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
 <CAAEAJfDNDXdJFfB-bHhFcqnnKZ0TY--d_wLGddKRymQOLQY4TQ@mail.gmail.com>
 <fc309940c9e59f80397b90c8b11424fea344e1b5.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F9A8D31A1C3CFFD16F950366DDA0F36054B66FEBF3FB52A11BC2F7D75F8661A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_093936_914695_E1EA1332 
X-CRM114-Status: GOOD (  51.09  )
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

Sorry, I fix a link error below.

On Mon, 2021-09-06 at 00:23 +0800, houlong wei wrote:
> Hi Ezequiel,
> 
> Thank you for your attention to this series of patches. I answer
> partial of your questions below.
> Regards,
> Houlong
> 
> On Sat, 2021-09-04 at 20:34 +0800, Ezequiel Garcia wrote:
> > Hi Eizan,
> > 
> > Sorry for seeing this series so late.
> > 
> > On Wed, 25 Aug 2021 at 03:35, Eizan Miyamoto <eizan@chromium.org>
> > wrote:
> > > 
> > > Broadly, this patch (1) adds a driver for various MTK MDP
> > > components to
> > > go alongside the main MTK MDP driver, and (2) hooks them all
> > > together
> > > using the component framework.
> > > 
> > > (1) Up until now, the MTK MDP driver controls 8 devices in the
> > > device
> > > tree on its own. When running tests for the hardware video
> > > decoder,
> > > we
> > > found that the iommus and LARBs were not being properly
> > > configured.
> > 
> > Why were not being properly configured? What was the problem?
> > Why not fixing that instead?
> > 
> > Does this mean the driver is currently broken and unusable?
> 
> This series of patches are supplements to another series, please
> refer
> to  
> 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=515129c

Fix the link address: 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=523771

> , which add device link between the mtk-iommu consumer and the mtk-
> larb 
> devices. Without that series of patches, the mtk-mdp driver can work
> well so far.
> But with that series, it seems the device link only can be
> established
> for the device which is registered as a platform driver. That's why
> Eizan adds this series of patches to make all mdp components to be
> registered as platform drivers.
> 
> > 
> > > To
> > > configure them, a driver for each be added to mtk_mdp_comp so
> > > that
> > > mtk_iommu_add_device() can (eventually) be called from
> > > dma_configure()
> > > inside really_probe().
> > > 
> > > (2) The integration into the component framework allows us to
> > > defer
> > > the
> > > registration with the v4l2 subsystem until all the MDP-related
> > > devices
> > > have been probed, so that the relevant device node does not
> > > become
> > > available until initialization of all the components is complete.
> > > 
> > > Some notes about how the component framework has been integrated:
> > > 
> > > - The driver for the rdma0 component serves double duty as the
> > > "master"
> > >   (aggregate) driver as well as a component driver. This is a
> > > non-
> > > ideal
> > >   compromise until a better solution is developed. This device is
> > >   differentiated from the rest by checking for a "mediatek,vpu"
> > > property
> > >   in the device node.
> > > 
> > 
> > As I have stated in Yunfei, I am not convinced you need an async
> > framework
> > at all. It seems all these devices could have been linked together
> > in the device tree, and then have a master device to tie them.
> > 
> > I.e. something like
> > 
> > mdp {
> >   mdp_rdma0 {
> >   }
> >   mdp_rsz0 {
> >   }
> >   mdp_rsz1 {
> >   }
> > }
> > 
> 
> The commit message of the patch below explains that " If the mdp_*
> nodes are under an mdp sub-node, their corresponding platform device
> does not automatically get its iommu assigned properly."
> Please refer to 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=v5.14.1&id=8127881f741dbbf9a1da9e9bc59133820160b217
> 
> > All this async games seem like making the driver really obfuscated,
> > which will mean harder to debug and maintain.
> > I am not sure we want that burden.
> > 
> > Even if we are all fully convinced that you absolutely need
> > an async framework, then what's wrong with v4l2-async?
> > 
> > I would start by addressing what is wrong with the IOMMUs
> > in the current design.
> > 
> > Thanks,
> > Ezequiel
> > 
> > > - The list of mdp components remains hard-coded as
> > > mtk_mdp_comp_dt_ids[]
> > >   in mtk_mdp_core.c, and as mtk_mdp_comp_driver_dt_match[] in
> > >   mtk_mdp_comp.c. This unfortunate duplication of information is
> > >   addressed in a following patch in this series.
> > > 
> > > - The component driver calls component_add() for each device that
> > > is
> > >   probed.
> > > 
> > > - In mtk_mdp_probe (the "master" device), we scan the device tree
> > > for
> > >   any matching nodes against mtk_mdp_comp_dt_ids, and add
> > > component
> > >   matches for them. The match criteria is a matching device node
> > >   pointer.
> > > 
> > > - When the set of components devices that have been probed
> > > corresponds
> > >   with the list that is generated by the "master", the callback
> > > to
> > >   mtk_mdp_master_bind() is made, which then calls the component
> > > bind
> > >   functions.
> > > 
> > > - Inside mtk_mdp_master_bind(), once all the component bind
> > > functions
> > >   have been called, we can then register our device to the v4l2
> > >   subsystem.
> > > 
> > > - The call to pm_runtime_enable() in the master device is called
> > > after
> > >   all the components have been registered by their bind()
> > > functions
> > >   called by mtk_mtp_master_bind(). As a result, the list of
> > > components
> > >   will not change while power management callbacks
> > > mtk_mdp_suspend()/
> > >   resume() are accessing the list of components.
> > > 
> > > Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> > > Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com
> > > >
> > > Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> > > ---
> > > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
