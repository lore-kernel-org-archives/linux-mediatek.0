Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1357C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 04:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93L7Tto4BHuW05fanfJxBoHN29QejfumGnNE4034wR0=; b=KopJBUA1FZkw4Z
	IPtekhac82Enr0vTF7vrdM5YWl/FiWFmSHajBU6OQUUzM9BJ5/Q1ClzvaEug7nudn+MYNf5R58ioG
	RfRFIT7nSr07Ac+b0PXmttvjMWZJdCE8ZdLf/69ROtwJuBxINt9ohKRGoNpUaJUfuYJo7WqHKfSVX
	djCmut8qCgIyXCL2XEL8m/usTzyzKOr1bgaYA4p8MoRVfZMYHkw6Qcq/kcUMxa1DmWzw6kdKagjhh
	Ym2Cx0W9mntHkBOfNtLdzsPWcyu0tWoSdT6pfV4PgHCRrzymgJVUWKGwNfXiexZ1ct6AmM1f7LEqa
	3doqnPUHsf+y8pYLXaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngIbT-00FUVy-N6; Mon, 18 Apr 2022 04:03:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngIbR-00FUUf-04; Mon, 18 Apr 2022 04:03:06 +0000
X-UUID: e3a161d346c84f8bae882be5e27c37df-20220417
X-UUID: e3a161d346c84f8bae882be5e27c37df-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1847000392; Sun, 17 Apr 2022 21:02:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 20:52:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Apr 2022 11:52:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 11:52:48 +0800
Message-ID: <3bc291ef3b087ff1d45aa5a8eaf95b927c803dd6.camel@mediatek.com>
Subject: Re: [PATCH v19 03/10] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 18 Apr 2022 11:52:48 +0800
In-Reply-To: <3a905d21-26a7-654f-4ab7-7ad1fa1376c6@collabora.com>
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-4-jason-jh.lin@mediatek.com>
 <3a905d21-26a7-654f-4ab7-7ad1fa1376c6@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_210305_068887_C4AA9054 
X-CRM114-Status: GOOD (  27.60  )
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

Hi Angelo,

Thanks for the reviews.

On Fri, 2022-04-15 at 12:18 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/04/22 10:39, jason-jh.lin ha scritto:
> > 1. Add mt8195 mmsys compatible for 2 vdosys.
> > 2. Add io_start into each driver data of mt8195 vdosys.
> > 3. Add get match data function to identify mmsys by io_start.
> > 4. Add mt8195 routing table settings of vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> 
> Unless anyone wants this commit to be split in two, one for the match
> data
> and one for the mt8195 addition, it looks almost good to me, apart
> one small
> change that has to be done, check below:
> 
> 
> > --- >   drivers/soc/mediatek/mt8195-mmsys.h    | 370
> > +++++++++++++++++++++++++
> >   drivers/soc/mediatek/mtk-mmsys.c       | 152 +++++++++-
> >   drivers/soc/mediatek/mtk-mmsys.h       |   6 +
> >   include/linux/soc/mediatek/mtk-mmsys.h |  11 +
> >   4 files changed, 528 insertions(+), 11 deletions(-)
> >   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > 
> 
> ..snip..
> 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > b/drivers/soc/mediatek/mtk-mmsys.h
> > index 77f37f8c715b..21cf300ba864 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > @@ -87,12 +87,18 @@ struct mtk_mmsys_routes {
> >   };
> >   
> >   struct mtk_mmsys_driver_data {
> > +	const u32 io_start;
> 
> I agree with you that this iostart is in 32bits boundaries, and that
> this will
> practically never change... and I was in doubt whether this would be
> acceptable
> or not, because of saving some memory.
> 
> Even though I would really love to have the savings, in order to
> avoid having any
> "surprises" in the future (any future breakage for "reasons"), we
> shall comply
> with the kernel types, so, this has to be...
> 
> 	const resource_size_t io_start;
> 
> ...and this is the same for both this file and mtk_drm_drv.h, which
> you modify in
> patch 07/10.
> 
> After fixing that:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> Cheers,
> Angelo

OK, I'll fix them in the next version.
Thanks.

Regards,
Jason-JH.Lin
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
