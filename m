Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084A8C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 06:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaQlERWudJzPzE0fsSYtZFQzem3bi5jaNZfZQfbIgBU=; b=KIsUbqALm7wb7r
	/7gpYdXRb8Hp02ZWC6dDxgkDfDi3Ip9mc7MKutqT+7vwmTbWUR6RXelME9QhneSYUdTi9BKwPDYNQ
	IOg1ZqEXJLhPh1dyMtW3kedbWvp/5NdsQzoxeO0D4FYXb9fqers0hkmQjYiO5eM314as6b6Lo2fXq
	CbIT+SySzOMHis0mPP56gFf9Qxwkv0gUb3jTevVy/RH3wykrcrx6yRry1do1fxCeDEq8pe4EcVDNz
	ARZF03+NvbHFL8VTYCugApGie9uniASlmsYL/o8/Cfb/udmkJct2CNmTRaMwV9BhfIykpyFu78W7T
	4o/QNsLLSsNgeqqQA3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neA5g-00BscV-S7; Tue, 12 Apr 2022 06:33:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neA5W-00BsWo-CZ; Tue, 12 Apr 2022 06:33:19 +0000
X-UUID: 560e3a0bc37942b9b49ef323370648d1-20220411
X-UUID: 560e3a0bc37942b9b49ef323370648d1-20220411
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1927428920; Mon, 11 Apr 2022 23:33:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 23:33:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 12 Apr 2022 14:33:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 14:33:02 +0800
Message-ID: <d08e121848788fee9898e1898ee756b10c99fa08.camel@mediatek.com>
Subject: Re: [RESEND v17 3/7] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: CK Hu <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: David Airlie <airlied@linux.ie>, <singo.chang@mediatek.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, <postmaster@vger.kernel.org>, "Fabien
 Parent" <fparent@baylibre.com>, John 'Warthog9' Hawley
 <warthog9@eaglescrag.net>, <linux-stm32@st-md-mailman.stormreply.com>,
 <roy-cw.yeh@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, <nancy.lin@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <moudy.ho@mediatek.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 12 Apr 2022 14:33:02 +0800
In-Reply-To: <a48df6bb-6be8-6cb9-51d0-9044e706e834@collabora.com>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-4-jason-jh.lin@mediatek.com>
 <67b3e42d6a094108f724ed9b8c73f5cd6b2ce219.camel@mediatek.com>
 <d8711b8e4d233240eda73db54a625e88b9b3970b.camel@mediatek.com>
 <1f1692b6d14280fed40e53f464145ed70b67135f.camel@mediatek.com>
 <a48df6bb-6be8-6cb9-51d0-9044e706e834@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_233318_459188_56CCE22F 
X-CRM114-Status: GOOD (  47.35  )
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

Hi, Angelo:

On Fri, 2022-04-08 at 10:49 +0200, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 03:28, CK Hu ha scritto:
> > Hi, Jason:
> > 
> > On Thu, 2022-04-07 at 14:27 +0800, Jason-JH Lin wrote:
> > > Hi CK,
> > > 
> > > Thanks for the reviews.
> > > 
> > > On Thu, 2022-04-07 at 13:45 +0800, CK Hu wrote:
> > > > Hi, Jason:
> > > > 
> > > > On Thu, 2022-04-07 at 11:04 +0800, jason-jh.lin wrote:
> > > > > 1. Add mt8195 mmsys compatible for vdosys0.
> > > > > 2. Add mt8195 routing table settings and fix build fail.
> > > > > 3. Add clock name, clock driver name and routing table into
> > > > > the
> > > > > driver data
> > > > >     of mt8195 vdosys0.
> > > > > 4. Add get match data by clock name function and clock
> > > > > platform
> > > > > labels
> > > > >     to identify which mmsys node is corresponding to vdosys0.
> > > > > 
> > > > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > > > ---
> > > > >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +-
> > > > >   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
> > > > >   drivers/soc/mediatek/mt8167-mmsys.h         |   2 +-
> > > > >   drivers/soc/mediatek/mt8183-mmsys.h         |   2 +-
> > > > >   drivers/soc/mediatek/mt8186-mmsys.h         |   4 +-
> > > > >   drivers/soc/mediatek/mt8192-mmsys.h         |   4 +-
> > > > >   drivers/soc/mediatek/mt8195-mmsys.h         | 370
> > > > > ++++++++++++++++++++
> > > > >   drivers/soc/mediatek/mt8365-mmsys.h         |   4 +-
> > > > >   drivers/soc/mediatek/mtk-mmsys.c            |  62 ++++
> > > > >   drivers/soc/mediatek/mtk-mmsys.h            |   1 +
> > > > >   drivers/soc/mediatek/mtk-mutex.c            |   8 +-
> > > > >   include/linux/soc/mediatek/mtk-mmsys.h      |  13 +-
> > > > >   12 files changed, 461 insertions(+), 17 deletions(-)
> > > > >   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > > > > 
> > > > 
> > > > [snip]
> > > > 
> > > > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > > > > b/drivers/soc/mediatek/mtk-mmsys.c
> > > > > index 4fc4c2c9ea20..b2fa239c5f5f 100644
> > > > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > > > @@ -4,6 +4,8 @@
> > > > >    * Author: James Liao <jamesjj.liao@mediatek.com>
> > > > >    */
> > > > >   
> 
> ..snip..
> 
> > > 
> > > I think there might be another chip that needs to get driver data
> > > by
> > > clk_name .
> > > So I use "clk-mt8195" in clk_driver to identify the corresponding
> > > platform whose clk_name of mmsys is also "cfg_vod0".
> > 
> > We usually don't care the future because the future may not happen.
> > If
> 
> Hello CK,
> 
> I'm sorry, but I really have to disagree here.
> Sure, the future may not happen, but from what I can see, MediaTek's
> commitment
> on upstreaming their SoCs is continuative and they care about the
> future.
> 
> Let's also not forget that these drivers are not on a downstream
> tree, where
> you don't care about the past or the future, but on upstream, where
> you:
> - Definitely care about the past
> - Should care about the future, if you want to avoid commit noise and
>    making big changes to your drivers everytime, which would slow
> down
>    your upstreaming due to reviewers having to put 3x efforts on each
>    iteration.
> 
> And let's also not forget that this being upstream means that these
> drivers
> may (or may not) be extended even by passionate community developers,
> for
> which, having such mechanisms there for other SoCs that MediaTek
> didn't try
> to upstream yet can only be good - and when these are engineered with
> a
> certain flexibility, while keeping the codebase solid, that can only
> be good.
> 
> Besides, if I've misunderstood your "don't care the future"
> statement,
> pretend that I've never replied.

OK, let's break this patch into two patches. The first is to support
mt8195 only with clock name identification. The second patch is to
identify SoC. In this series, we just need the first patch, so move the
second patch to the series of another SoC with multiple mmsys device.
Maybe another SoC with multiple mmsys device has new property which
could be used to identify SoC, so we have no information about what is
the better implementation of second patch. I do really care the future,
but I have no information about the future. Please public any hidden
information so we could have better decision.

Regards,
CK

> 
> 
> > it's sure that would happen, I think clk_driver is not a good
> > choice.
> > For now, the clk_driver name is different for each SoC, but it
> > could be
> > the same for each SoC because only one clock driver would be
> > compiled.
> > I think "compatible" would be different for each SoC.
> > 
> 
> ...but I agree on that one (and I gave my own review and suggestions
> on
> how to improve that situation).
> 
> Regards,
> Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
