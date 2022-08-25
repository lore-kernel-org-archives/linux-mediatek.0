Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8338EC00448
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 03:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOBOjdM80auaLFqiLz2HryuF9Bx4PCj92SDetnBUxZU=; b=jsGAlF7AytS1/BIXL8+6u4i54n
	tb4CsxRJRRUvEnAxoUj5cWfX1z1D1mVuIt/Apym2+vnUL3PPA5CK5uDZtpMOz9qRs2g1JQCXtk3Hq
	CkdGLPpZgEApfvRlp5Ha/8aEIKCNUTpxSVnCIQnWhq9AoL2ujsRLgUFmn7+XEFR10h0V0Geh08UPJ
	TnMiFzDxVmKrzh5Eo6Zx9W+UTG4blatIW6v3mlNHeVNWr0njmWLwfeRIgCTQmdZrFwyc00ndASHhf
	O5QYh09x97CgwPPCJ16iBxbTxnVrOeUEVUEaqvdWiZbTL7vaeE3Yr/4zEqQ59eZhKhOZyAu36fuit
	P/w1anKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR3fI-005TDq-3N; Thu, 25 Aug 2022 03:36:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR3f4-005SVy-DE; Thu, 25 Aug 2022 03:36:08 +0000
X-UUID: 0ceda5d2e42341adb6eb293c20e401e8-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=QOBOjdM80auaLFqiLz2HryuF9Bx4PCj92SDetnBUxZU=;
	b=NL0GZK25BIh/BLmYn9YAeKLrlUh9zPFgcivkjareyNF+fG6IUvs6suYpuJxB7POmS6J0kXWOWsU/8RSiPVQfezxPZ7aOnN4EvsyC2w+Rpx7uZDn9eFn2pDDsGes8efvjQGKKSv+sJQQEZVhkN4ecpztvq688BQQf3YriOab8w3Q=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0a53e28b-673d-494b-b5be-145586b6615e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:49
X-CID-INFO: VERSION:1.1.10,REQID:0a53e28b-673d-494b-b5be-145586b6615e,OB:0,LOB
	:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_
	HamU,ACTION:release,TS:49
X-CID-META: VersionHash:84eae18,CLOUDID:5fa30920-1c20-48a5-82a0-25f9c331906d,C
	OID:e4a10fb6b56b,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 0ceda5d2e42341adb6eb293c20e401e8-20220824
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1377512702; Wed, 24 Aug 2022 20:36:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 25 Aug 2022 11:35:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 25 Aug 2022 11:35:22 +0800
Message-ID: <e9cf051675a9fad161a2e49116397690c28cb6f1.camel@mediatek.com>
Subject: Re: [PATCH v28 4/4] media: platform: mtk-mdp3: add MediaTek MDP3
 driver
From: moudy ho <moudy.ho@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, daoyuan
 huang <daoyuan.huang@mediatek.com>
Date: Thu, 25 Aug 2022 11:35:22 +0800
In-Reply-To: <3ccf3023-9b1c-2ae6-dd70-6f318eec22e2@xs4all.nl>
References: <20220823023803.27850-1-moudy.ho@mediatek.com>
	 <20220823023803.27850-5-moudy.ho@mediatek.com>
	 <3ccf3023-9b1c-2ae6-dd70-6f318eec22e2@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_203606_473352_29A74357 
X-CRM114-Status: GOOD (  32.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hans,

Thank you for your time and effort.
As a small reminder, Matthias also mentioned that he will help apply
patches 1 and 2.

Regards,
Moudy

On Wed, 2022-08-24 at 10:39 +0200, Hans Verkuil wrote:
> Hi Moudy,
> 
> On 23/08/2022 04:38, Moudy Ho wrote:
> > This patch adds driver for MediaTek's Media Data Path ver.3 (MDP3).
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
> > Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Tested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/media/platform/mediatek/Kconfig       |    1 +
> >  drivers/media/platform/mediatek/Makefile      |    1 +
> >  drivers/media/platform/mediatek/mdp3/Kconfig  |   20 +
> >  drivers/media/platform/mediatek/mdp3/Makefile |    6 +
> >  .../platform/mediatek/mdp3/mdp_reg_ccorr.h    |   19 +
> >  .../platform/mediatek/mdp3/mdp_reg_rdma.h     |   65 ++
> >  .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   39 +
> >  .../platform/mediatek/mdp3/mdp_reg_wdma.h     |   47 +
> >  .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   55 +
> >  .../platform/mediatek/mdp3/mtk-img-ipi.h      |  290 +++++
> >  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  466 ++++++++
> >  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   43 +
> >  .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 1033
> > +++++++++++++++++
> >  .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  186 +++
> >  .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  357 ++++++
> >  .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   94 ++
> >  .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  724 ++++++++++++
> >  .../platform/mediatek/mdp3/mtk-mdp3-m2m.h     |   48 +
> >  .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  735 ++++++++++++
> >  .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |  373 ++++++
> >  .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |  313 +++++
> >  .../platform/mediatek/mdp3/mtk-mdp3-vpu.h     |   78 ++
> >  22 files changed, 4993 insertions(+)
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/Kconfig
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/Makefile
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_ccorr.h
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_wdma.h
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-img-
> > ipi.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > cmdq.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > cmdq.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > comp.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > comp.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > core.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > core.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > m2m.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > m2m.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > regs.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > regs.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > vpu.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > vpu.h
> > 
> > diff --git a/drivers/media/platform/mediatek/Kconfig
> > b/drivers/media/platform/mediatek/Kconfig
> > index af47d9888552..84104e2cd024 100644
> > --- a/drivers/media/platform/mediatek/Kconfig
> > +++ b/drivers/media/platform/mediatek/Kconfig
> > @@ -6,3 +6,4 @@ source
> > "drivers/media/platform/mediatek/jpeg/Kconfig"
> >  source "drivers/media/platform/mediatek/mdp/Kconfig"
> >  source "drivers/media/platform/mediatek/vcodec/Kconfig"
> >  source "drivers/media/platform/mediatek/vpu/Kconfig"
> > +source "drivers/media/platform/mediatek/mdp3/Kconfig"
> > diff --git a/drivers/media/platform/mediatek/Makefile
> > b/drivers/media/platform/mediatek/Makefile
> > index d3850a13f128..38e6ba917fe5 100644
> > --- a/drivers/media/platform/mediatek/Makefile
> > +++ b/drivers/media/platform/mediatek/Makefile
> > @@ -3,3 +3,4 @@ obj-y += jpeg/
> >  obj-y += mdp/
> >  obj-y += vcodec/
> >  obj-y += vpu/
> > +obj-y += mdp3/
> > diff --git a/drivers/media/platform/mediatek/mdp3/Kconfig
> > b/drivers/media/platform/mediatek/mdp3/Kconfig
> > new file mode 100644
> > index 000000000000..af371c17c386
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/mdp3/Kconfig
> > @@ -0,0 +1,20 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config VIDEO_MEDIATEK_MDP3
> > +	tristate "MediaTek MDP v3 driver"
> > +	depends on MTK_IOMMU || COMPILE_TEST
> > +	depends on VIDEO_DEV
> > +	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	depends on HAS_DMA
> 
> A 'depends on REMOTEPROC' is missing here (see the 'kernel test
> robot' email
> you received), but I have added that myself.
> 
> It's now in my for-v6.1c branch. If I don't see any new 'kernel test
> robot'
> emails in the next few days, then I'll make a PR early next week.
> 
> Regards,
> 
> 	Hans
> 
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select V4L2_MEM2MEM_DEV
> > +	select MTK_MMSYS
> > +	select VIDEO_MEDIATEK_VPU
> > +	select MTK_CMDQ
> > +	select MTK_SCP
> > +	default n
> > +	help
> > +	    It is a v4l2 driver and present in MediaTek MT8183 SoC.
> > +	    The driver supports scaling and color space conversion.
> > +
> > +	    To compile this driver as a module, choose M here: the
> > +	    module will be called mtk-mdp3.


