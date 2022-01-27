Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 00:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VeQSpVDHQ/0GZhjKjSpmJVXCyRyZEtTpHCuHAvRmzcU=; b=AMo1dSPV58S7PX
	j7HguMmemr/pcRqlMXm6J9h0FdgKJYpSKuNi84cHomdYQJoc9sx4RkZny0uEVcZqq2y7Y5ltcw3Vl
	HvnSbXWm55JSNOvZ/1/ccuxKQF8cHTcuPpPcm5o1SnMDuJjUDDXtK3/NsC/VPswuctE4cz4qkB03S
	1J1xn65TGoCvgq2NyGsM4by78QIzCa7knqD0DQI1+WIzBGeO14KD8CpIuYAeuMfT0RpZk3xjkEbrd
	SXcAeDpmtBNIufSCcKnah/c6fHCdRZyHtdoCuvt2+3p9fT+mJVZ96k6S1XLr5lVkgslIQLNfO/eJ/
	Dy6uwWD0AqlK04Wt39nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCt6e-00Dtlf-Mf; Thu, 27 Jan 2022 00:57:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCt6Q-00Dtj2-Mg; Thu, 27 Jan 2022 00:57:33 +0000
X-UUID: 78bc57d0f4f94602b2116d9ff525e77f-20220126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=38hh0DJyLWNOb+2yGWltcYSNpwbS22MhLxlIpna88Ew=; 
 b=Wggw5uC+kOFTwuxeKGvF9YU+l505a5MIZY2uXFx3V06kRswxyHpNE9D2ztB0dI+Y2BSgLvkJJDVEVB6lyGqJHAbcmibnLJlHatLAHsROAonOS/LciwEHttnRtE/bzNzdk11AoTs2yr21hUaaAy0HSWnCtyBUJydiJYKVDbF3074=;
X-UUID: 78bc57d0f4f94602b2116d9ff525e77f-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2057890925; Wed, 26 Jan 2022 17:57:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 16:47:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 27 Jan 2022 08:47:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 08:47:22 +0800
Message-ID: <9793dc8c5c30db9342eb54c1b9c0a10b339d2860.camel@mediatek.com>
Subject: Re: [PATCH net-next v1 1/9] net: ethernet: mtk-star-emac: store
 bit_clk_div in compat structure
From: Biao Huang <biao.huang@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, Felix
 Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, Yinghua Pan
 <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>
Date: Thu, 27 Jan 2022 08:47:22 +0800
In-Reply-To: <CAMRc=Mc+DqcQFGqxoYXYG-VCuaKkJusoVGSHb0G-MtYsiVCxVw@mail.gmail.com>
References: <20220120070226.1492-1-biao.huang@mediatek.com>
 <20220120070226.1492-2-biao.huang@mediatek.com>
 <CAMRc=Mc+DqcQFGqxoYXYG-VCuaKkJusoVGSHb0G-MtYsiVCxVw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_165732_161519_DE7A3001 
X-CRM114-Status: GOOD (  23.02  )
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

Dear Bartosz,
	Thanks for your comments!

On Tue, 2022-01-25 at 10:50 +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 20, 2022 at 8:02 AM Biao Huang <biao.huang@mediatek.com>
> wrote:
> > 
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > Not all the SoC are using the same clock divider. Move the divider
> > into
> > a compat structure specific to the SoCs.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_star_emac.c | 23
> > +++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > index 1d5dd2015453..26f5020f2e9c 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/module.h>
> >  #include <linux/netdevice.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/of_mdio.h>
> >  #include <linux/of_net.h>
> >  #include <linux/platform_device.h>
> > @@ -232,6 +233,10 @@ struct mtk_star_ring {
> >         unsigned int tail;
> >  };
> > 
> > +struct mtk_star_compat {
> > +       unsigned char bit_clk_div;
> > +};
> > +
> >  struct mtk_star_priv {
> >         struct net_device *ndev;
> > 
> > @@ -257,6 +262,8 @@ struct mtk_star_priv {
> >         int duplex;
> >         int pause;
> > 
> > +       const struct mtk_star_compat *compat_data;
> > +
> >         /* Protects against concurrent descriptor access. */
> >         spinlock_t lock;
> > 
> > @@ -899,7 +906,7 @@ static void mtk_star_init_config(struct
> > mtk_star_priv *priv)
> >         regmap_write(priv->regs, MTK_STAR_REG_SYS_CONF, val);
> >         regmap_update_bits(priv->regs, MTK_STAR_REG_MAC_CLK_CONF,
> >                            MTK_STAR_MSK_MAC_CLK_CONF,
> > -                          MTK_STAR_BIT_CLK_DIV_10);
> > +                          priv->compat_data->bit_clk_div);
> >  }
> > 
> >  static void mtk_star_set_mode_rmii(struct mtk_star_priv *priv)
> > @@ -1461,6 +1468,7 @@ static int mtk_star_probe(struct
> > platform_device *pdev)
> > 
> >         priv = netdev_priv(ndev);
> >         priv->ndev = ndev;
> > +       priv->compat_data = of_device_get_match_data(&pdev->dev);
> >         SET_NETDEV_DEV(ndev, dev);
> >         platform_set_drvdata(pdev, ndev);
> > 
> > @@ -1556,10 +1564,17 @@ static int mtk_star_probe(struct
> > platform_device *pdev)
> >         return devm_register_netdev(dev, ndev);
> >  }
> > 
> > +static struct mtk_star_compat mtk_star_mt8516_compat = {
> 
> static const ... ?
Yes, will fix it in next send.
> 
> > +       .bit_clk_div = MTK_STAR_BIT_CLK_DIV_10,
> > +};
> > +
> >  static const struct of_device_id mtk_star_of_match[] = {
> > -       { .compatible = "mediatek,mt8516-eth", },
> > -       { .compatible = "mediatek,mt8518-eth", },
> > -       { .compatible = "mediatek,mt8175-eth", },
> > +       { .compatible = "mediatek,mt8516-eth",
> > +         .data = &mtk_star_mt8516_compat },
> > +       { .compatible = "mediatek,mt8518-eth",
> > +         .data = &mtk_star_mt8516_compat },
> > +       { .compatible = "mediatek,mt8175-eth",
> > +         .data = &mtk_star_mt8516_compat },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_star_of_match);
> > --
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
