Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B09FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 07:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSDTs0F7G+twWloiuq1z5UQqh5E0/gV7UpOpV13A9IA=; b=VVW9yW0uDcwsAi
	59kGOWQM58jbbdk/BIy49NLqnz0EH3oEBlxmT7uDti70kzclqouawWKOU52SZRNFEZ08zVY3tQDuN
	KOEWvEYO/e3cPzNCqa1V0gVIlOmf5wdKj3bjbLec7BAl5A8Ixi4k7N+pOo4mcjEiMXbqW042qDCmU
	/Llc2HbiJu6QWoZw60V/w7UUOmSFp9P3iSVdb0LUu9sVNKsY2evSLOGuP46Xha1pN3+5weEE9EaDH
	KN6mb+aUe10Yr3a24vq7tX6JqzhzXzj216EJoic0XAKTL2YWXbXpyjEl0p2FioRuabUgVNVOMpfbS
	fqTt3uN85f+nnBwRBXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n50K1-00Dz6J-Ur; Wed, 05 Jan 2022 07:02:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n509a-00DuMB-P9; Wed, 05 Jan 2022 06:52:15 +0000
X-UUID: ca0c46a0aa3c456683ca8742d57e95b6-20220104
X-UUID: ca0c46a0aa3c456683ca8742d57e95b6-20220104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1060217623; Tue, 04 Jan 2022 23:52:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 22:52:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 14:52:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 Jan 2022 14:52:03 +0800
Message-ID: <7463ce81cbce0a2d2a04a63ca9975356d261e519.camel@mediatek.com>
Subject: Re: [RFC PATCH 0/2] drm/mediatek/hdmi : split legacy driver and add
 mt8195
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 5 Jan 2022 14:52:03 +0800
In-Reply-To: <CABnWg9ubi4Lr1jEh8TRGdLEDJE9raKSizhnEo08xf2vXYnA+aA@mail.gmail.com>
References: <20211108000847.14320-1-granquet@baylibre.com>
 <CABnWg9ubi4Lr1jEh8TRGdLEDJE9raKSizhnEo08xf2vXYnA+aA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_225210_917219_6B5CF116 
X-CRM114-Status: GOOD (  51.50  )
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

Hi, Guillaume:

On Thu, 2021-12-02 at 07:44 -0800, Guillaume Ranquet wrote:
> Hi Chun-Kuang,
> Quoting Guillaume Ranquet (2021-11-08 01:08:45)
> > 
> > Following the review of "[v1,4/4] drm/mediatek: add mt8195 hdmi TX
> > support" [1] , I've been asked to try to merge the "legacy
> > HDMI driver with the "new" mt8195 HDMI driver. Though the registers
> > and IPs are rather different, I've made an attempt at the
> > excercise on which I would like some comments before submitting a
> > new version of the patchset.
> > 
> > I've created a new mtk_hdmi_common.{c,h} which contains what I
> > could identify as common enough to be added in there.
> > I have not renamed the mtk_hdmi.{c,h} driver to something else yet.
> > I've then added mtk8195 hdmi driver on top of this work.
> > 
> > The code is still rather sketchy and I have some questions on best
> > practices for that kind of exercices?
> > In no particular order, here's a bunch of random questions:
> > 
> > 1 would you rather have:
> > - as presented here: a boolean with a bunch of if/else in the
> > common code to handle the discrepencies between the two drivers
> > - function pointers, with an "ops" structure set in the drvdata...
> > though the ops are a bit random and wouldn't really
> > make sense to be grouped together?

Both is OK, but I think if some difference is small, use if/else is
much simple. If the difference is large, use function pointers is
better.

> > 
> > 2 I'm not really happy with how the mt8195 driver and ddc are
> > sharing the same __iomem regs and not sure how to exactly
> > handle this now that both hdmi drivers are tied together... it was
> > hackish from the begining, but now I'm a bit out of
> > solutions to handle this peculiar "feature" of the mt8195 hdmi/ddc
> > driver. any hints would be appreciated.

Is the case the same as phy-mtk-dp with mtk display port driver? If
it's this case, mt8195 hdmi driver would use regmap_read/write() and
mt8173 hdmi would use readl/writel() and you could use if/else or
function pointer to distinguish both SoC. Or you worry about other
thing?

> > 
> > 3 Should the "legacy" and mt8195 drivers be under the same menu
> > entry?

Let's call "legacy" mt8173. If you really want config for mt8195 hdmi
driver, yes, it should be under the same menu. But also have a config
for mt8173 hdmi driver.

> > 
> > 4 I'm looking into the clock framework and I'm wondering if there
> > would be benefits to switch to the "bulk" interface? as
> > both driver seem to request them all once and for all? the code
> > might end up easier to read.

DRM framework has bulk of helper function, and it's not easy to read
the DRM framework. These helper functions are help to reduce the
duplicated code. I think the limitation of readability is: I could
understand the code. Based on the limitation, let's try to reduce
duplicated code.

> > 
> > 5 Would it be beneficial to further split the driver with audio on
> > one side and video on the other? from what I understood,
> > the main complaint was that the driver was too big to review...
> > that could help with that at least?

It's better that you could break this patch into smaller patches. But
be sure that each patch is workable. For example, if apply video patch
first, HDMI could work without audio.

> > 
> > 
> > Thx for your patience... any further comment is welcome.

I would review the RFC patch later.

Regards,
CK

> > 
> > Thx,
> > Guillaume.
> > 
> > [1] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210929094425.745-5-granquet@baylibre.com/__;!!CTRNKA9wMg0ARbw!0NxH5ig8YRgHlPWYZxLV17O_pVKkKxQK6Mimo0r89xiEmOyTWx-DUEliMqFScg$
> >  
> > 
> > --
> > Guillaume Ranquet (2):
> >   drm/mediatek: extract common functions from the mtk hdmi driver
> >   drm/mediatek: add mtk8195 hdmi display driver
> > 
> >  drivers/gpu/drm/mediatek/Kconfig              |   10 +
> >  drivers/gpu/drm/mediatek/Makefile             |    5 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  635 +-----
> >  drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  521 +++++
> >  drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |  258 +++
> >  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 1835
> > +++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |   26 +
> >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 +++++
> >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
> >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
> >  10 files changed, 3560 insertions(+), 609 deletions(-)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
> > 
> > --
> > 2.32.0
> > 
> 
> Since you have requested that I merge both drivers, could you give me
> your feedback on this RFC so
> that I know how to move forward? I'm planning on making a v2 soon
> based on this RFC (and hopefully its
> outcome).
> 
> Thx,
> Guillaume.
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!0NxH5ig8YRgHlPWYZxLV17O_pVKkKxQK6Mimo0r89xiEmOyTWx-DUEkrO9clHw$
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
