Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EC4C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 03:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F8F60F4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 03:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09F8F60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16WrsHfcXyCEPm/30MrgAogiIDnyG8pTnBwUPQF7G8E=; b=NsNi2OfvMQ+XvX
	0inLqtyPCnEgIO/1zuF6o8FSl+8qzWKp3/gWDLWOR1f+aucRO/Z88lywQHHspdD9VCe5mpqXcTzl/
	zkAnQufe3DkjzJfOzWhlQ8517JN7BMjiklmhAG2ujP77Xwj6ABneIo9MO238IXuDFkkLDvhb8oN0b
	PyumZLt+BOKtHB+NaZEXMJD8TismTApUN5jlohhqtpl52MKqbELcZdDz/vxeHJQZkVtQmEAn2wljD
	nasYdR0YfJsuBrZEhWWs/o1Dhl823qiBznQ1IBOEC9HzEaVYa5kgniSrdZh/rEZFX1xEMypu9xm4F
	Lb9LmJ4RU3gD5YdmYR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9JUg-006y1S-Lw; Fri, 30 Jul 2021 03:47:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9JUR-006xyW-UW; Fri, 30 Jul 2021 03:47:18 +0000
X-UUID: fde2cf24a27e40c38d1a3ebc43b3748d-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=owA7PPiopdtLEkqvUt/D8q1r48A650Ld17Go7g08JjE=; 
 b=dvqQbR796rMuN//HE7nRFXgIWuz+kbGpo53hPuCF/bF5FWJPur1XiqJcU+AaXfruAaEsT+XW8LjgCHTYkHdPgOj7W/q5yQqLE8VjzFVRUq3k1hYvbF++DCJtZmrbun+JqvuoRBGWdYZXOWjBKAjxhLKvIwyVP58rm3R7sVL4fvI=;
X-UUID: fde2cf24a27e40c38d1a3ebc43b3748d-20210729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1800691058; Thu, 29 Jul 2021 20:47:10 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 20:47:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 11:47:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 11:47:07 +0800
Message-ID: <655991e58c610ec56d6367029e1b780463b9a480.camel@mediatek.com>
Subject: Re: [PATCH v2 09/14] soc: mediatek: mmsys: Add reset controller
 support for MT8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
CC: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, devicetree
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Date: Fri, 30 Jul 2021 11:47:07 +0800
In-Reply-To: <CAFqH_51k9wGgAUmFCkx2M9Nbefzxw0rBLTmQwkXzEyOFVKwuJA@mail.gmail.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-10-nancy.lin@mediatek.com>
 <CAFqH_53bnNvjGjZ2S8oyAx2t0if-YpQyZcb9sRapG2q21X4fGw@mail.gmail.com>
 <692eeb1314da94e28ccc8722b94c7ce8cae6c880.camel@mediatek.com>
 <CAFqH_51k9wGgAUmFCkx2M9Nbefzxw0rBLTmQwkXzEyOFVKwuJA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_204716_081999_3035624B 
X-CRM114-Status: GOOD (  53.56  )
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

On Wed, 2021-07-28 at 12:31 +0200, Enric Balletbo Serra wrote:
> Hi Nancy,
> 
> Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dc., 28 de
> jul.
> 2021 a les 8:01:
> > 
> > Hi Enric,
> > 
> > Thanks for your review.
> > 
> > On Fri, 2021-07-23 at 12:57 +0200, Enric Balletbo Serra wrote:
> > > Hi Nancy,
> > > 
> > > Thank you for your patch.
> > > 
> > > Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de
> > > jul.
> > > 2021 a les 11:46:
> > > > 
> > > > Among other features the mmsys driver should implement a reset
> > > > controller to be able to reset different bits from their space.
> > > > 
> > > 
> > > I'm working on a series that does the same, it should be nice if
> > > we
> > > can coordinate [1]
> > > 
> > > [1]
> > > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=515355__;!!CTRNKA9wMg0ARbw!xP6Ko9hF-3KasGgr7-8Aby_tCwiU2M6gFBAngDLVcJjzooj-MEeTcNG8cf2e9wGb$
> > > 
> > > 
> > 
> > OK, I will add this series to my reference base in the next patch
> > revision.
> > 
> > > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > > ---
> > > >  drivers/soc/mediatek/mt8195-mmsys.h |  1 +
> > > >  drivers/soc/mediatek/mtk-mmsys.c    | 77
> > > > +++++++++++++++++++++++++++++
> > > >  drivers/soc/mediatek/mtk-mmsys.h    |  1 +
> > > >  3 files changed, 79 insertions(+)
> > > > 
> > > > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > > > b/drivers/soc/mediatek/mt8195-mmsys.h
> > > > index 4bdb2087250c..a7f6e275bfe5 100644
> > > > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > > > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > > > @@ -154,6 +154,7 @@
> > > >  #define
> > > > DISP_DP_INTF0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT     (1
> > > > << 0)
> > > >  #define
> > > > DISP_DP_INTF0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT       (2
> > > > << 0)
> > > > 
> > > > +#define MT8195_VDO1_SW0_RST_B           0x1d0
> > > >  #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD        0xe30
> > > >  #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD        0xe40
> > > >  #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD        0xe50
> > > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > > > b/drivers/soc/mediatek/mtk-mmsys.c
> > > > index d0f4a407f8f8..1ae04efeadab 100644
> > > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > > @@ -4,10 +4,12 @@
> > > >   * Author: James Liao <jamesjj.liao@mediatek.com>
> > > >   */
> > > > 
> > > > +#include <linux/delay.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/of_device.h>
> > > >  #include <linux/platform_device.h>
> > > > +#include <linux/reset-controller.h>
> > > >  #include <linux/soc/mediatek/mtk-mmsys.h>
> > > > 
> > > >  #include "mtk-mmsys.h"
> > > > @@ -15,6 +17,8 @@
> > > >  #include "mt8183-mmsys.h"
> > > >  #include "mt8195-mmsys.h"
> > > > 
> > > > +#define MMSYS_SW_RESET_PER_REG 32
> > > > +
> > > >  static const struct mtk_mmsys_driver_data
> > > > mt2701_mmsys_driver_data
> > > > = {
> > > >         .clk_driver = "clk-mt2701-mm",
> > > >         .routes = mmsys_default_routing_table,
> > > > @@ -65,12 +69,15 @@ static const struct mtk_mmsys_driver_data
> > > > mt8195_vdosys1_driver_data = {
> > > >         .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > > >         .config = mmsys_mt8195_config_table,
> > > >         .num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
> > > > +       .sw_reset_start = MT8195_VDO1_SW0_RST_B,
> > > 
> > > That change is interesting and I think I should also take it into
> > > consideration with my series.
> > > 
> > > >  };
> > > > 
> > > >  struct mtk_mmsys {
> > > >         void __iomem *regs;
> > > >         struct cmdq_client_reg cmdq_base;
> > > >         const struct mtk_mmsys_driver_data *data;
> > > > +       spinlock_t lock; /* protects mmsys_sw_rst_b reg */
> > > 
> > > Seems that mmsys_sw_rst_b reg has different names for different
> > > SoCs?
> > > I mean I know that for MT8173 and MT8183 the register is called
> > > mmsys_sw0_rst_b but looks like for MT8195 the name is
> > > vdo1_sw0_rst_b?
> > > So maybe we should update this comment to be more generic.
> > > 
> > 
> > Yes, the name of MT8195 vdosys1 sw reset is called
> > VDOSYS1_SW0_RST_B
> > and the name of vdosys0 sw reset is called GLOBAL0_SW0_RST_B. They
> > have
> > a different name. Maybe we can change the comment to "protects
> > mmsys sw
> > reset reg".
> > 
> > > > 
> > > > +       struct reset_controller_dev rcdev;
> > > >  };
> > > > 
> > > >  void mtk_mmsys_ddp_connect(struct device *dev,
> > > > @@ -148,6 +155,63 @@ void mtk_mmsys_ddp_config(struct device
> > > > *dev,
> > > > enum mtk_mmsys_config_type config,
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
> > > > 
> > > > +static int mtk_mmsys_reset_update(struct reset_controller_dev
> > > > *rcdev, unsigned long id,
> > > > +                                 bool assert)
> > > > +{
> > > > +       struct mtk_mmsys *mmsys = container_of(rcdev, struct
> > > > mtk_mmsys, rcdev);
> > > > +       unsigned long flags;
> > > > +       u32 reg;
> > > > +       int i;
> > > > +       u32 offset;
> > > > +
> > > > +       offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> > > > +       id = 1 << (id % MMSYS_SW_RESET_PER_REG);
> > > > +
> > > > +       spin_lock_irqsave(&mmsys->lock, flags);
> > > > +
> > > > +       reg = readl_relaxed(mmsys->regs + mmsys->data-
> > > > > sw_reset_start + offset);
> > > > 
> > > > +
> > > > +       if (assert)
> > > > +               reg &= ~BIT(id);
> > > > +       else
> > > > +               reg |= BIT(id);
> > > > +
> > > > +       writel_relaxed(reg, mmsys->regs + mmsys->data-
> > > > > sw_reset_start + offset);
> > > > 
> > > > +
> > > > +       spin_unlock_irqrestore(&mmsys->lock, flags);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int mtk_mmsys_reset_assert(struct reset_controller_dev
> > > > *rcdev, unsigned long id)
> > > > +{
> > > > +       return mtk_mmsys_reset_update(rcdev, id, true);
> > > > +}
> > > > +
> > > > +static int mtk_mmsys_reset_deassert(struct
> > > > reset_controller_dev
> > > > *rcdev, unsigned long id)
> > > > +{
> > > > +       return mtk_mmsys_reset_update(rcdev, id, false);
> > > > +}
> > > > +
> > > > +static int mtk_mmsys_reset(struct reset_controller_dev *rcdev,
> > > > unsigned long id)
> > > > +{
> > > > +       int ret;
> > > > +
> > > > +       ret = mtk_mmsys_reset_assert(rcdev, id);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       usleep_range(1000, 1100);
> > > > +
> > > 
> > > One question that I received in my series, and I couldn't answer
> > > because I don't have the datasheet, is if
> > > is this known to be enough for all IP cores that can be reset by
> > > this
> > > controller? Is this time specified in the datasheet?
> > 
> > It only takes few cycles for the reset. The 1000us is enough for
> > the
> > reset to take effect.
> > 
> 
> Saying enough looks to me that 1000us is a random number, is there
> any
> specific real number in the datasheet?
> 
> Note that I'm not against it, just want to make sure the number makes
> sense.
> 
No real number is specified in the datasheet. I checked with the
hardware designer, and the reset takes four cycles of mm IP cores.

For example: If the mm IP cores run at 200MHz,  it will take
20ns(4/200M) for the reset to take effect.

> 
> > > > +       return mtk_mmsys_reset_deassert(rcdev, id);
> > > > +}
> > > > +
> > > > +static const struct reset_control_ops mtk_mmsys_reset_ops = {
> > > > +       .assert = mtk_mmsys_reset_assert,
> > > > +       .deassert = mtk_mmsys_reset_deassert,
> > > > +       .reset = mtk_mmsys_reset,
> > > > +};
> > > > +
> > > >  static int mtk_mmsys_probe(struct platform_device *pdev)
> > > >  {
> > > >         struct device *dev = &pdev->dev;
> > > > @@ -174,6 +238,19 @@ static int mtk_mmsys_probe(struct
> > > > platform_device *pdev)
> > > >         if (ret)
> > > >                 dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> > > >  #endif
> > > > +
> > > > +       spin_lock_init(&mmsys->lock);
> > > > +
> > > > +       mmsys->rcdev.owner = THIS_MODULE;
> > > > +       mmsys->rcdev.nr_resets = 64;
> > > 
> > > Is the number of resets 64 for MT8195? I think is 32 for MT8173
> > > and
> > > MT8183. Can you confirm?
> > > 
> > > Thanks,
> > >   Enric
> > > 
> > 
> > The number of resets in MT8195 vdosys1 is 64 (43 resets are used,
> > 21
> > are not used).
> > 
> 
> Ok, thanks for the information.
> 
> > > > +       mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> > > > +       mmsys->rcdev.of_node = pdev->dev.of_node;
> > > > +       ret = devm_reset_controller_register(&pdev->dev,
> > > > &mmsys-
> > > > > rcdev);
> > > > 
> > > > +       if (ret) {
> > > > +               dev_err(&pdev->dev, "Couldn't register mmsys
> > > > reset
> > > > controller: %d\n", ret);
> > > > +               return ret;
> > > > +       }
> > > > +
> > > >         platform_set_drvdata(pdev, mmsys);
> > > > 
> > > >         clks = platform_device_register_data(&pdev->dev, mmsys-
> > > > > data->clk_driver,
> > > > 
> > > > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > > > b/drivers/soc/mediatek/mtk-mmsys.h
> > > > index 084b1f5f3c88..cc57c3895c51 100644
> > > > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > > > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > > > @@ -87,6 +87,7 @@ struct mtk_mmsys_driver_data {
> > > >         const unsigned int num_routes;
> > > >         const struct mtk_mmsys_config *config;
> > > >         const unsigned int num_configs;
> > > > +       u32 sw_reset_start;
> > > >  };
> > > > 
> > > >  /*
> > > > --
> > > > 2.18.0
> > > > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
