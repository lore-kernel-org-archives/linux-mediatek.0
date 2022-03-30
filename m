Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CFDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 10:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0D2vjAaya6Kkkv79Dwga6Xpjpi4XhphInh6NbjUp0OU=; b=es48UEWyQP8dyq
	tYf99Tt7EW/2Wf7FXeNXY/aLVViTDk8+le/V3ddOermpcc2llqO28n6HMW/xu45EomxU4e9e+1UC4
	qvsPGPhvXAUndgz4l7CVeCkTIsXnvfFt00AV4XyVWuu3VneDnOBtbA8Hxhal/pG1agtATvdvkqCfY
	VqoZ5zSJ/tvkv+SeMvgI9MnwuraziQnZIGcgFng1F5LQLbeagCrqCkPK1BoLmTKLkkUQjj+PoSIs8
	pSJUenqbSRDSdcmbBZZfs5RAOz65f3EY+DzJpIsWc1QGzYNOtdKYwJeK3So1uTs799CtgKtrwzlMP
	tQEgU9A0/JAen4PElEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZVBw-00F7Xf-N3; Wed, 30 Mar 2022 10:04:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZVBu-00F7WA-2W; Wed, 30 Mar 2022 10:04:39 +0000
X-UUID: 8103b1e9c4d44358a7993de2a7f5b5fe-20220330
X-UUID: 8103b1e9c4d44358a7993de2a7f5b5fe-20220330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 56042614; Wed, 30 Mar 2022 03:04:31 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 03:04:29 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 18:04:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 18:04:27 +0800
Message-ID: <97bc1358813a2449d6e62653eb7af9906dfb190e.camel@mediatek.com>
Subject: Re: [PATCH v16 4/8] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 30 Mar 2022 18:04:27 +0800
In-Reply-To: <b9ed8c1511ea26c070dd3fb61f4370e5f858058c.camel@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-5-jason-jh.lin@mediatek.com>
 <a068f2c9b2111f3a7a20da19073ef5fdb7f4a91f.camel@mediatek.com>
 <b9ed8c1511ea26c070dd3fb61f4370e5f858058c.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_030438_365249_6000CF32 
X-CRM114-Status: GOOD (  28.89  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

Thanks for the review.

On Mon, 2022-03-28 at 13:39 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-03-28 at 13:03 +0800, Jason-JH Lin wrote:
> > Hi CK,
> > 
> > Thanks for the reviews.
> > 
> > On Mon, 2022-03-07 at 11:28 +0800, jason-jh.lin wrote:
> > > Add mt8195 vdosys0 clock driver name and routing table to
> > > the driver data of mtk-mmsys.
> > > 
> > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > Acked-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > > Impelmentation patch of vdosys1 can be refered to [1]
> > > 
> > > [1] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
> > > ---
> > >  drivers/soc/mediatek/mt8195-mmsys.h    | 130
> > > +++++++++++++++++++++++++
> > >  drivers/soc/mediatek/mtk-mmsys.c       |  11 +++
> > >  include/linux/soc/mediatek/mtk-mmsys.h |   9 ++
> > >  3 files changed, 150 insertions(+)
> > >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > > 
> > > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > > b/drivers/soc/mediatek/mt8195-mmsys.h
> > > new file mode 100644
> > > index 000000000000..24a3afe23bc8
> > > --- /dev/null
> > > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > > @@ -0,0 +1,130 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +
> > > +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> > > +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> > > +
> > > +#define MT8195_VDO0_OVL_MOUT_EN					
> > > 0xf14
> > > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			
> > > BIT(0)
> > > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			
> > > BIT(1)
> > >  
> > > Useless, so remove.
> > > 
> > > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			
> > > BIT(2)
> > > Ditto.Useless, so remove.
> > > Regards,
> > > CK
> > 
> > Although these definitions are not used, they represent the
> > functionality provided by this register.
> > 
> > I think we can show that we have these capabilities by defining
> > them.
> > 
> > Can we keep these definitions?
> 
> It's better that we know how to use it. Even though the symbol name
> show some information, but I would like to add it to
> mmsys_mt8195_routing_table[].
> 
> Regards,
> CK
> 

OK, I think I just remove the useless define.
Thanks.

Regards,
Jason-JH.Lin
> > 
> > Regards,
> > Jason-JH.Lin
> > 
> > > +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			
> > > BIT(4)
> > > +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			
> > > BIT(5)
> > > +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			
> > > BIT(6)
> > 
> > 
> > [snip]
> > 
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
