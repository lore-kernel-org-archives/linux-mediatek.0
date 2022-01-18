Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DAFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 01:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9/gRVqvPWNL/YV8H5g4nGZlbOPguRQBgdMTknesnqs=; b=HLwcjjPhjH9wL+
	9gIt3+QIq1K/q32tZWOaylOB3j6bVmNXS/1wFYkrNt/UVMWERAV/BpV0KjynI/GAjQIfP892F0k5/
	5zjqk/ECkZ8yratogsQPiYU04hNZrajec3e/JHBOsOqveOQ9mEYXkYfRGPeKv0EytW/Lhh/h08Lwn
	Jbi64IBEB4mGFZfTIE479kUEgJbQMZeP8+pyya+F8Gx+6tToSztvW2oY+oXSHl4rk79ueQ8tB+jdg
	cdIpkv5Q0jkbMVl8G5URruORo8ARM3yE7sZhMV5ck9aEgClzB2VAlg3mqOYcligK5aLW90cEvksTG
	AvdRQ+UyyBHI3L1nJEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9dfB-00Gnd0-0o; Tue, 18 Jan 2022 01:51:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9df8-00GnbG-Aj; Tue, 18 Jan 2022 01:51:55 +0000
X-UUID: 56eb1baa0a3f408ca841123645423e6c-20220117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WVOKBGOO+4CiRfyb4tBJpayeJ36oTzEaZEJ3ckzhxRY=; 
 b=PkfX/gTetNx6hNAH6pt3O1246ti7UakmYcdyaJpEMWbgQ3bBi3RkGipyqUYhIfM2n05T7pO6pmDJ9hZsxRhqGYU8kEPiUHS0DcHj0GsEOAlZBYvFyk2axde7ys9XgdEpxerXm9Xqh40T4wHNN3L0BCu5pOQZ3YQOwSTDt6Yktdk=;
X-UUID: 56eb1baa0a3f408ca841123645423e6c-20220117
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 142188472; Mon, 17 Jan 2022 18:51:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 17:51:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 18 Jan 2022 09:51:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 09:51:45 +0800
Message-ID: <f9e3a862ecdb914a0efb52582989e975a742e918.camel@mediatek.com>
Subject: Re: [PATCH net-next v12 3/7] stmmac: dwmac-mediatek: re-arrange
 clock setting
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
Date: Tue, 18 Jan 2022 09:51:45 +0800
In-Reply-To: <2c62f337-5eb4-e525-7e3a-289435315c09@collabora.com>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-4-biao.huang@mediatek.com>
 <2c62f337-5eb4-e525-7e3a-289435315c09@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_175154_407393_0C987279 
X-CRM114-Status: GOOD (  18.85  )
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
	Thanks for your comments.
On Mon, 2022-01-17 at 11:38 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/01/22 08:07, Biao Huang ha scritto:
> > The rmii_internal clock is needed only when PHY
> > interface is RMII, and reference clock is from MAC.
> > 
> > Re-arrange the clock setting as following:
> > 1. the optional "rmii_internal" is controlled by devm_clk_get(),
> > 2. other clocks still be configured by devm_clk_bulk_get().
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 72 +++++++++++++-
> > -----
> >   1 file changed, 49 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > index 8747aa4403e8..2678d2deb26a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > @@ -49,14 +49,15 @@ struct mac_delay_struct {
> >   struct mediatek_dwmac_plat_data {
> >   	const struct mediatek_dwmac_variant *variant;
> >   	struct mac_delay_struct mac_delay;
> > +	struct clk *rmii_internal_clk;
> >   	struct clk_bulk_data *clks;
> > -	struct device_node *np;
> >   	struct regmap *peri_regmap;
> > +	struct device_node *np;
> >   	struct device *dev;
> >   	phy_interface_t phy_mode;
> > -	int num_clks_to_config;
> >   	bool rmii_clk_from_mac;
> >   	bool rmii_rxc;
> > +	int num_clks;
> 
> I don't see any need to get a num_clks here, at this point: since all
> functions
> reading this are getting passed a pointer to this entire structure,
> you can
> simply always access plat->variant->num_clks.
> 
> Please, drop the addition of num_clks in this struct.
> 
> Regards,
> Angelo
OK, will remove it in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
