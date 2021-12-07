Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3222DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 01:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGLs07juzJfUv0iuoVQSpPqZesmQCGIul0jYkCqpKes=; b=1/Uy34sVlHYoo2
	RzYlyrjWF7o/61DnTgdRgXEBWon95K8dJsNc5+m0FbREA/M5tRq6Rf8zDibsZElrorSbg8T0SuXY5
	zWTWXKM9s9KvWtqE/dV+4F4UgXsmw1y2nqfmSeleGhBfN/IrEgpkAiht0m8ZJFl78mLViem6r7ZvG
	EMrjZxVFndQ9swDYAEjRYxnv9Dm/F6f9Q1s6Hs/74MkgbTlSjhUgv9bMVDuIhtULulX6UqQGRKu44
	CwJW20Ew1GXFv3jeE9yDt2WMggleWlj2CV+KJ8a47rMxA6dhXwIoFPHuuXyZUdl/4E1etvH6Xpc0Y
	qfDdXwAiri9GnpVuZhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muPaX-006cRF-HX; Tue, 07 Dec 2021 01:48:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muPaU-006cQ4-5r; Tue, 07 Dec 2021 01:48:12 +0000
X-UUID: 02cd6a386af34804b40d5defdd6330fc-20211206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a+w0KP+ZqAlkYFHTZ/XSFagOIiGrcVHtihSDas+AcT4=; 
 b=j7qV0gIriJWgPSxvYACBe8xuOczSgbVqyG/FuluiK26Nirbkr6b06MvSYIOKdMVjGDjvTG7gZ3dbOk5KreLcGcxX9gsfSAeFJZRA76heLXi2Se9Ezi4BibkTbjBtxLpNGA15obNHQgh5SW8iHjZE+Ilt0b2DZf4Lw+JA/jgW5bc=;
X-UUID: 02cd6a386af34804b40d5defdd6330fc-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1844833977; Mon, 06 Dec 2021 18:48:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 17:38:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 7 Dec 2021 09:38:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Dec 2021 09:38:01 +0800
Message-ID: <183a86f912ba28930845847c0b19b4118e3db80a.camel@mediatek.com>
Subject: Re: [PATCH v4 1/7] net-next: stmmac: dwmac-mediatek: add platform
 level clocks management
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <dkirjanov@suse.de>
Date: Tue, 7 Dec 2021 09:38:00 +0800
In-Reply-To: <9dc0cbc3-8de0-f1ed-cfc9-852b7e69ab3c@collabora.com>
References: <20211203063418.14892-1-biao.huang@mediatek.com>
 <20211203063418.14892-2-biao.huang@mediatek.com>
 <9dc0cbc3-8de0-f1ed-cfc9-852b7e69ab3c@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_174810_407660_E3C13A19 
X-CRM114-Status: GOOD (  22.42  )
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

Dear Angelo,
	Thanks for your comments~

On Mon, 2021-12-06 at 16:14 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/12/21 07:34, Biao Huang ha scritto:
> > This patch implements clks_config callback for dwmac-mediatek
> > platform,
> > which could support platform level clocks management.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 24
> > ++++++++++++++-----
> >   1 file changed, 18 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > index 58c0feaa8131..157ff655c85e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > @@ -359,9 +359,6 @@ static int mediatek_dwmac_init(struct
> > platform_device *pdev, void *priv)
> >   		return ret;
> >   	}
> >   
> > -	pm_runtime_enable(&pdev->dev);
> > -	pm_runtime_get_sync(&pdev->dev);
> > -
> >   	return 0;
> >   }
> >   
> > @@ -370,11 +367,25 @@ static void mediatek_dwmac_exit(struct
> > platform_device *pdev, void *priv)
> >   	struct mediatek_dwmac_plat_data *plat = priv;
> >   
> >   	clk_bulk_disable_unprepare(plat->num_clks_to_config, plat-
> > >clks);
> > -
> > -	pm_runtime_put_sync(&pdev->dev);
> > -	pm_runtime_disable(&pdev->dev);
> >   }
> >   
> > +static int mediatek_dwmac_clks_config(void *priv, bool enabled)
> > +{
> > +	struct mediatek_dwmac_plat_data *plat = priv;
> > +	int ret = 0;
> > +
> > +	if (enabled) {
> > +		ret = clk_bulk_prepare_enable(plat->num_clks_to_config, 
> > plat->clks);
> > +		if (ret) {
> > +			dev_err(plat->dev, "failed to enable clks, err
> > = %d\n", ret);
> > +			return ret;
> > +		}
> > +	} else {
> > +		clk_bulk_disable_unprepare(plat->num_clks_to_config,
> > plat->clks);
> > +	}
> > +
> > +	return ret;
> > +}
> >   static int mediatek_dwmac_probe(struct platform_device *pdev)
> >   {
> >   	struct mediatek_dwmac_plat_data *priv_plat;
> > @@ -420,6 +431,7 @@ static int mediatek_dwmac_probe(struct
> > platform_device *pdev)
> >   	plat_dat->bsp_priv = priv_plat;
> >   	plat_dat->init = mediatek_dwmac_init;
> >   	plat_dat->exit = mediatek_dwmac_exit;
> > +	plat_dat->clks_config = mediatek_dwmac_clks_config;
> >   	mediatek_dwmac_init(pdev, priv_plat);
> >   
> >   	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> > 
> 
> Hello Biao,
> 
> you're removing all calls to pm_runtime_* functions, so there is no
> more reason
> to include linux/pm_runtime.h in this file: please also remove the
> inclusion.
> 
> Thanks!
Yes, I'll remove the inclusion in the next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
