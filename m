Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33995C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ytg6YWzzuESCZe08dQTqC5bIxAONvvEG+ZNZ22cbw4Q=; b=j5DQHHwokXMwzl
	qYj+8wiyVHAHs48BhsYU1xt4Ld1dX8c4mJl1CXfcJUpikUWSBP9Ccl35b8B393QmzrxxHHwUd9joI
	2+TwWiqGuo3bnF1jLzTFNIYFyP+zhhdOflONZTMbeJsQ0o5cd7vnnpE3xaJfgSzkx5PaS6mEhYWrU
	41KzT7Kq+spSQjOIIg1d0vJqA/lDC5nF9ycruehpfBbkxqXDNoYU5c0UcL43aEXJJ+F4q4rx1A063
	mTSJR17hMEQprmTDIX/iNhHt2RF7AjisL/HubWrztI26gZZcVtdEdgNSUZZGWcItCHJPqXar2xu3K
	dMFaYOBwOM4BITf7W8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIcT-007KjG-0R; Tue, 25 Jan 2022 10:00:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCITi-007HkG-Is
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 09:51:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id p12so61671984edq.9
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 01:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HlPvap3s7pdO0i3AvOfOgwK8HydV4tcDe28Yz+r5dr0=;
 b=czSb6VFvgku1bVsTdGbcRTR0h8h7GNK9U7KQbStWcKMBxUQIn8d5yU5gfXgnxAmfvr
 2OsmpbsMIKQIJzgXfb/MHunf7rUu/HGy0aTFyNATY4s5oSHnUwkn+ccspaA7B4xMMS1x
 ODBXUhk+iS4skIxEjJktEEBsCu1Mqmf1LYWH64SqZdlpNzh3svpwMTEynwMu1BHsJCQh
 s/nSaUKZT5NM+M527n8NWD/Z6I5Nc9AKrr4oIkAPNW16pRI9PW4+GrJAo9N+219PjRZh
 p3qKj2+9BdnsGQKJ/+Afhue35T2O3LgrmT+bzwkIXvYESr2x0PxpiBd3hO+zmXQ08DjV
 O1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HlPvap3s7pdO0i3AvOfOgwK8HydV4tcDe28Yz+r5dr0=;
 b=o2n3JInHIVtP/oYx96gjvFcOgavOmee4605M/JwyUNMK+r62Ezo1d6oh4HSkGyuYnM
 lAogeXruvy26eGGep+fCiC8J6iqyqPF06U1UlwWlWaFa2mL6AY7VNctilEdaXQirJ1HL
 Eh0EkAyB12Cj71pziPCF8SF7JcCfUI6IKhO4DVSA3iqvDXI19Ia+kzLaaKMWPunJCq8x
 2SEaOVfebW/EXB3bXi6tkBBOtvibVP1JLF/7EbnXK3QFjvKo/PrUeKZ/LbGRiqpORpvr
 2LDfQsEtpyly1hdhYdGj83sFaSPvdX68U5Gulz9O7CKc8XlQn+V9TYv5OnJUK+/r1l4e
 BcDg==
X-Gm-Message-State: AOAM531o+1Bfj33ONgNbVVLms5J/Y2FyPxwgvDM1Q7mf63Zi3cpWmvp/
 q2KR4qQ6LmqRU+bSDR+bfhPmM0VR5+DxnhcVcHLcMQ==
X-Google-Smtp-Source: ABdhPJwQzlX3EMzz8K17JeuAaI2l2wrQ2t9jeb+BkBrkVLHJV+P7nqMNLX4xKtjzYu9msSkcu7xBJKtfWdWFjHaLCAI=
X-Received: by 2002:a05:6402:1604:: with SMTP id
 f4mr19666005edv.352.1643104264783; 
 Tue, 25 Jan 2022 01:51:04 -0800 (PST)
MIME-Version: 1.0
References: <20220120070226.1492-1-biao.huang@mediatek.com>
 <20220120070226.1492-2-biao.huang@mediatek.com>
In-Reply-To: <20220120070226.1492-2-biao.huang@mediatek.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Jan 2022 10:50:54 +0100
Message-ID: <CAMRc=Mc+DqcQFGqxoYXYG-VCuaKkJusoVGSHb0G-MtYsiVCxVw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/9] net: ethernet: mtk-star-emac: store
 bit_clk_div in compat structure
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
 Fabien Parent <fparent@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev <netdev@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, srv_heupstream@mediatek.com, 
 Macpaul Lin <macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_015106_668948_645E1FB8 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, Jan 20, 2022 at 8:02 AM Biao Huang <biao.huang@mediatek.com> wrote:
>
> From: Fabien Parent <fparent@baylibre.com>
>
> Not all the SoC are using the same clock divider. Move the divider into
> a compat structure specific to the SoCs.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 23 +++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> index 1d5dd2015453..26f5020f2e9c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_mdio.h>
>  #include <linux/of_net.h>
>  #include <linux/platform_device.h>
> @@ -232,6 +233,10 @@ struct mtk_star_ring {
>         unsigned int tail;
>  };
>
> +struct mtk_star_compat {
> +       unsigned char bit_clk_div;
> +};
> +
>  struct mtk_star_priv {
>         struct net_device *ndev;
>
> @@ -257,6 +262,8 @@ struct mtk_star_priv {
>         int duplex;
>         int pause;
>
> +       const struct mtk_star_compat *compat_data;
> +
>         /* Protects against concurrent descriptor access. */
>         spinlock_t lock;
>
> @@ -899,7 +906,7 @@ static void mtk_star_init_config(struct mtk_star_priv *priv)
>         regmap_write(priv->regs, MTK_STAR_REG_SYS_CONF, val);
>         regmap_update_bits(priv->regs, MTK_STAR_REG_MAC_CLK_CONF,
>                            MTK_STAR_MSK_MAC_CLK_CONF,
> -                          MTK_STAR_BIT_CLK_DIV_10);
> +                          priv->compat_data->bit_clk_div);
>  }
>
>  static void mtk_star_set_mode_rmii(struct mtk_star_priv *priv)
> @@ -1461,6 +1468,7 @@ static int mtk_star_probe(struct platform_device *pdev)
>
>         priv = netdev_priv(ndev);
>         priv->ndev = ndev;
> +       priv->compat_data = of_device_get_match_data(&pdev->dev);
>         SET_NETDEV_DEV(ndev, dev);
>         platform_set_drvdata(pdev, ndev);
>
> @@ -1556,10 +1564,17 @@ static int mtk_star_probe(struct platform_device *pdev)
>         return devm_register_netdev(dev, ndev);
>  }
>
> +static struct mtk_star_compat mtk_star_mt8516_compat = {

static const ... ?

> +       .bit_clk_div = MTK_STAR_BIT_CLK_DIV_10,
> +};
> +
>  static const struct of_device_id mtk_star_of_match[] = {
> -       { .compatible = "mediatek,mt8516-eth", },
> -       { .compatible = "mediatek,mt8518-eth", },
> -       { .compatible = "mediatek,mt8175-eth", },
> +       { .compatible = "mediatek,mt8516-eth",
> +         .data = &mtk_star_mt8516_compat },
> +       { .compatible = "mediatek,mt8518-eth",
> +         .data = &mtk_star_mt8516_compat },
> +       { .compatible = "mediatek,mt8175-eth",
> +         .data = &mtk_star_mt8516_compat },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_star_of_match);
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
