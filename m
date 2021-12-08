Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D82C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 02:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4kXSY60QPuDvo1ydkcNggCGNMbW0kRF1w33c/017lU=; b=b7cIFucj5HGJrV
	SDUgQs7RkEKHWF1GJVNj047gd0MIuwa4xGs5NdVdLNFq6j6eIDa7k1svyBTrE7tt56JjK7KS9OXwE
	rdkkYDeQ/PN3/K/PaVz9OSjV+Mz4a6AOUnwZmkub5XnsnaRj/timV7VbhZF+ipHJpzh9rHQSjuhlF
	mavOXyPoYbR2DIPT88lyLR145lG+14e346W9DXbOKNlcZ6tlm/KeGP3g6aD3XNBvTHLqGDS5FrTn6
	ZG1FDLX/Zhn6E67YseIt5zRd1RPByZIWfZQdUneR0SWoMlrn57WXv4s/aPEUp71N0CJh+sPlR35xg
	M/CjzRrJHvH6Cd+t/KOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mumNa-00Aflx-3c; Wed, 08 Dec 2021 02:08:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mumNX-00AflP-9z; Wed, 08 Dec 2021 02:08:21 +0000
X-UUID: 02bc68f537f945ed9fc874af215177dc-20211207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DZaORBOtJY/yncuKK0ASrYmOnUqpv3wP5VjwQJkPl2o=; 
 b=b+UDQlVg4XGmaR/qFBZQ2UnrcsS4U9u3hEOst0+evmQLKEDBQc5+YTeybF9YdI2le6UgfGcwjLYs7HK33Fld6u8aYRUCOFNIFgZSmhdtnE7TPNSKvz15SVskae9YpUMy4K36oR8VctY7reduWByuNECn+GyfqSdZtz1YUxpIpus=;
X-UUID: 02bc68f537f945ed9fc874af215177dc-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 809155642; Tue, 07 Dec 2021 19:08:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 18:01:01 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 10:00:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 10:00:58 +0800
Message-ID: <00e62ae7e7764296023b34395e4d109139c10325.camel@mediatek.com>
Subject: Re: [PATCH v7 2/7] mtk-mdp: add driver to probe mdp components
From: Yong Wu <yong.wu@mediatek.com>
To: houlong wei <houlong.wei@mediatek.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Eizan Miyamoto <eizan@chromium.org>, "Hans
 Verkuil" <hverkuil@xs4all.nl>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "wenst@chromium.org"
 <wenst@chromium.org>, CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?=
 <ck.hu@mediatek.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Yongqiang Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?=
 <yongqiang.niu@mediatek.com>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media
 <linux-media@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Date: Wed, 8 Dec 2021 10:00:54 +0800
In-Reply-To: <fc309940c9e59f80397b90c8b11424fea344e1b5.camel@mediatek.com>
References: <20210825063323.3607738-1-eizan@chromium.org>
 <20210825163247.v7.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
 <CAAEAJfDNDXdJFfB-bHhFcqnnKZ0TY--d_wLGddKRymQOLQY4TQ@mail.gmail.com>
 <fc309940c9e59f80397b90c8b11424fea344e1b5.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_180819_390124_698E787C 
X-CRM114-Status: GOOD (  39.88  )
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
> , which add device link between the mtk-iommu consumer and the mtk-
> larb 
> devices. Without that series of patches, the mtk-mdp driver can work
> well so far.
> But with that series, it seems the device link only can be
> established
> for the device which is registered as a platform driver. That's why
> Eizan adds this series of patches to make all mdp components to be
> registered as platform drivers.

The mt8173 mdp has several devices:
   mediatek,mt8173-mdp-rdma, mediatek,mt8173-mdp  
   mediatek,mt8173-mdp-rsz
   mediatek,mt8173-mdp-wdma
   mediatek,mt8173-mdp-wrot

Except the first one, the last three devices are not the standard
platform devices. Thus, they should not be the iommu consumer devices.

Question 1: The last three device don't work actually in mt8173 chrome,
right? or they access continuous buffers?

Question 2: The IOMMU device-link patchset just replaces the pm runtime
interfaces. It don't improve the mdp flow, also should not introduce
regression. thus, my v8 don't rebase this mdp patches. Does the iommu
patchset introduce regression for mdp?

@Eizan, @houlong, Could you help confirm this?
Thanks.

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
[snip]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
