Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A0BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 00:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLxG3W82DwcAVRbMlXg52JzOI4FrY24M/3gR6KexgLM=; b=TNwpPhaaycDZwC
	01D0rRW0JHI3X+fFg6I3CI28fK4CfPxEeZJqpGBqbZ+4hkKpT7kd5MU/4ie8cRVZDRmsIhNXtHX12
	z7fYDINjKFrTH0K1XVLytU/RLroR2fjIjdQfxhopoaQZWJ5ovUbObzEALqFqv8bwSi4cRnWB16Em1
	dYkaPj0ihjmLwaTvsmBBsewANYJzigytifLkIvUiipfR1eYomxzYTvdJOxbB/6VZxdzEbRA5dpAFW
	oOFQnraEKFPaeFQKkf7tOLhcW/+7LBovg/FY04BnFQUfy/j8lEtSUp2xkUyxPmeZRaWtuAZP4GMwX
	XwKc87m1qhvlSnmsvDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCt6r-00Dtph-Oe; Thu, 27 Jan 2022 00:57:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCt6Q-00Dtj5-MV; Thu, 27 Jan 2022 00:57:33 +0000
X-UUID: 62d7e3faf60740af979eb2e3a1250067-20220126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=znz5QKUMzOn1KULWu0CTsASTSM4l3KPtIQHtDKgDZgM=; 
 b=AgZ3CSZPBOBXAFeAs7EGTvjxOuLh/UwkQdGP1WSL/aPZnTsHXsTCFtXLloneAQcaaSB9/c5o7hD/ieTzSDiEX7Jo+qT1+ePS2FrKWbFTfgxMa/456LQ6yvU6E4TE449/jhMMjcZKZluI/BJsr8bsc7AH2QjxSRusoJfg2trqs/8=;
X-UUID: 62d7e3faf60740af979eb2e3a1250067-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2035555868; Wed, 26 Jan 2022 17:57:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 16:51:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 27 Jan 2022 08:51:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 08:51:50 +0800
Message-ID: <cabca14fc2cabc85c4a9bd9946d88066c5d8e2f2.camel@mediatek.com>
Subject: Re: [PATCH net-next v1 3/9] net: ethernet: mtk-star-emac: add
 support for MT8365 SoC
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
Date: Thu, 27 Jan 2022 08:51:50 +0800
In-Reply-To: <CAMRc=MefKOmdKbm5KT=zQLORwm7oYe1oUy_XW3heqAqFqbE5NQ@mail.gmail.com>
References: <20220120070226.1492-1-biao.huang@mediatek.com>
 <20220120070226.1492-4-biao.huang@mediatek.com>
 <CAMRc=MefKOmdKbm5KT=zQLORwm7oYe1oUy_XW3heqAqFqbE5NQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_165732_163210_AAC3CFE9 
X-CRM114-Status: GOOD (  32.70  )
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

On Tue, 2022-01-25 at 11:21 +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 20, 2022 at 8:02 AM Biao Huang <biao.huang@mediatek.com>
> wrote:
> > 
> > Add Ethernet driver support for MT8365 SoC.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_star_emac.c | 75
> > ++++++++++++++++---
> >  1 file changed, 64 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > index 7c2af775d601..403439782db9 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > @@ -151,6 +151,7 @@ static const char *const mtk_star_clk_names[] =
> > { "core", "reg", "trans" };
> >  #define MTK_STAR_REG_MAC_CLK_CONF              0x00ac
> >  #define MTK_STAR_MSK_MAC_CLK_CONF              GENMASK(7, 0)
> >  #define MTK_STAR_BIT_CLK_DIV_10                        0x0a
> > +#define MTK_STAR_BIT_CLK_DIV_50                        0x32
> > 
> >  /* Counter registers. */
> >  #define MTK_STAR_REG_C_RXOKPKT                 0x0100
> > @@ -183,9 +184,11 @@ static const char *const mtk_star_clk_names[]
> > = { "core", "reg", "trans" };
> >  #define MTK_STAR_REG_C_RX_TWIST                        0x0218
> > 
> >  /* Ethernet CFG Control */
> > -#define MTK_PERICFG_REG_NIC_CFG_CON            0x03c4
> > -#define MTK_PERICFG_MSK_NIC_CFG_CON_CFG_MII    GENMASK(3, 0)
> > -#define MTK_PERICFG_BIT_NIC_CFG_CON_RMII       BIT(0)
> > +#define MTK_PERICFG_REG_NIC_CFG0_CON           0x03c4
> > +#define MTK_PERICFG_REG_NIC_CFG1_CON           0x03c8
> > +#define MTK_PERICFG_REG_NIC_CFG_CON_V2         0x0c10
> > +#define MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF   GENMASK(3, 0)
> > +#define MTK_PERICFG_BIT_NIC_CFG_CON_RMII       1
> > 
> >  /* Represents the actual structure of descriptors used by the MAC.
> > We can
> >   * reuse the same structure for both TX and RX - the layout is the
> > same, only
> > @@ -234,6 +237,7 @@ struct mtk_star_ring {
> >  };
> > 
> >  struct mtk_star_compat {
> > +       int (*set_interface_mode)(struct net_device *ndev);
> >         unsigned char bit_clk_div;
> >  };
> > 
> > @@ -909,13 +913,6 @@ static void mtk_star_init_config(struct
> > mtk_star_priv *priv)
> >                            priv->compat_data->bit_clk_div);
> >  }
> > 
> > -static void mtk_star_set_mode_rmii(struct mtk_star_priv *priv)
> > -{
> > -       regmap_update_bits(priv->pericfg,
> > MTK_PERICFG_REG_NIC_CFG_CON,
> > -                          MTK_PERICFG_MSK_NIC_CFG_CON_CFG_MII,
> > -                          MTK_PERICFG_BIT_NIC_CFG_CON_RMII);
> > -}
> > -
> >  static int mtk_star_enable(struct net_device *ndev)
> >  {
> >         struct mtk_star_priv *priv = netdev_priv(ndev);
> > @@ -1531,7 +1528,13 @@ static int mtk_star_probe(struct
> > platform_device *pdev)
> >                 return -ENODEV;
> >         }
> > 
> > -       mtk_star_set_mode_rmii(priv);
> > +       if (priv->compat_data->set_interface_mode) {
> > +               ret = priv->compat_data->set_interface_mode(ndev);
> > +               if (ret) {
> > +                       dev_err(dev, "Failed to set phy interface,
> > err = %d\n", ret);
> > +                       return -EINVAL;
> > +               }
> > +       }
> 
> Shouldn't you still call mtk_star_set_mode_rmii(priv) if there's no
> callback?
mtk_star_set_mode_rmii is replaced by priv->compat_data-
>set_interface_mode,
all the interface settings are moved to set_interface_mode,
and we'll implement it for every IC.

so, mtk_star_set_mode_rmii is no longer used.
> 
> > 
> >         ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> >         if (ret) {
> > @@ -1564,10 +1567,58 @@ static int mtk_star_probe(struct
> > platform_device *pdev)
> >         return devm_register_netdev(dev, ndev);
> >  }
> > 
> > +static int mt8516_set_interface_mode(struct net_device *ndev)
> > +{
> > +       struct mtk_star_priv *priv = netdev_priv(ndev);
> > +       struct device *dev = mtk_star_get_dev(priv);
> > +       unsigned int intf_val = 0;
> 
> No need to initialize.
OK, will fix it in next send.
> 
> > +
> > +       switch (priv->phy_intf) {
> > +       case PHY_INTERFACE_MODE_RMII:
> > +               intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
> > +               break;
> > +       default:
> > +               dev_err(dev, "This interface not supported\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       regmap_update_bits(priv->pericfg,
> > MTK_PERICFG_REG_NIC_CFG0_CON,
> > +                          MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF,
> > +                          intf_val);
> > +       return 0;
> 
> You can directly return regmap_update_bits().
OK, will fix it in next send.
> 
> > +}
> > +
> > +static int mt8365_set_interface_mode(struct net_device *ndev)
> > +{
> > +       struct mtk_star_priv *priv = netdev_priv(ndev);
> > +       struct device *dev = mtk_star_get_dev(priv);
> > +       unsigned int intf_val = 0;
> > +
> > +       switch (priv->phy_intf) {
> > +       case PHY_INTERFACE_MODE_RMII:
> > +               intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
> > +               break;
> > +       default:
> > +               dev_err(dev, "This interface not supported\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       regmap_update_bits(priv->pericfg,
> > MTK_PERICFG_REG_NIC_CFG_CON_V2,
> > +                          MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF,
> > +                          intf_val);
> > +       return 0;
> > +}
> 
> Same as above.
OK, will fix it in next send.
> 
> > +
> >  static struct mtk_star_compat mtk_star_mt8516_compat = {
> > +       .set_interface_mode = mt8516_set_interface_mode,
> >         .bit_clk_div = MTK_STAR_BIT_CLK_DIV_10,
> >  };
> > 
> > +static struct mtk_star_compat mtk_star_mt8365_compat = {
> > +       .set_interface_mode = mt8365_set_interface_mode,
> > +       .bit_clk_div = MTK_STAR_BIT_CLK_DIV_50,
> > +};
> > +
> >  static const struct of_device_id mtk_star_of_match[] = {
> >         { .compatible = "mediatek,mt8516-eth",
> >           .data = &mtk_star_mt8516_compat },
> > @@ -1575,6 +1626,8 @@ static const struct of_device_id
> > mtk_star_of_match[] = {
> >           .data = &mtk_star_mt8516_compat },
> >         { .compatible = "mediatek,mt8175-eth",
> >           .data = &mtk_star_mt8516_compat },
> > +       { .compatible = "mediatek,mt8365-eth",
> > +         .data = &mtk_star_mt8365_compat },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_star_of_match);
> > --
> > 2.25.1
> > 
> 
> Bart
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
