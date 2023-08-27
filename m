Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F8FC83F01
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Aug 2023 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5swq+wc3T3uSi3pWlsLzAnTmVTT62yCLyu8H03yu0BU=; b=IUDfV7ZBBTau5gfKRPyy+/zdDF
	PpIGESLClaqXspVF+HEg7IhOX0bYqX/b4ly9pf9MiECezRl3qW63B6IrupkPuKowxOJxL3yebYdua
	YdlohaRx6/hv+KPWOAxLTVIAx/RD9M+wp3cq3m+gRepOyKL0iI/6332IlEU69krZ/yoCHhXPn+pVE
	xUdNgmW57905nanIrtXLBhEHhAF6Q2kkcSJ6CDVZQ2b0X262JGwLwMiu2A9tL0UoW/igB6miQ7llK
	a/AT3dsKGhNZrV/hnipNlvyiYHSKzWpg5u/LI8+sFRCKTtle9kAIzKlgzNVISfHzHUMMDa5dOOgIO
	dD5jBBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaIKW-008EiO-1Y;
	Sun, 27 Aug 2023 16:09:36 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaIKT-008Eho-2H;
	Sun, 27 Aug 2023 16:09:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qaIK7-0006yH-1d;
	Sun, 27 Aug 2023 16:09:11 +0000
Date: Sun, 27 Aug 2023 17:09:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Simon Horman <horms@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next v2] net: ethernet: mtk_eth_soc: add paths
 and SerDes modes for MT7988
Message-ID: <ZOt1Hp7v1tKRNGgX@makrotopia.org>
References: <8b05b606aa37cd30445b8a6d73caef1b0d0cfbfa.1692908556.git.daniel@makrotopia.org>
 <20230827153523.GS3523530@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827153523.GS3523530@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_090933_742249_18F07239 
X-CRM114-Status: GOOD (  27.19  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Simon,

thank you for reviewing!

On Sun, Aug 27, 2023 at 05:35:23PM +0200, Simon Horman wrote:
> On Thu, Aug 24, 2023 at 09:24:48PM +0100, Daniel Golle wrote:
> > MT7988 comes with a built-in 2.5G PHY as well as SerDes lanes to
> > connect external PHYs or transceivers in USXGMII, 10GBase-R, 5GBase-R,
> > 2500Base-X, 1000Base-X and Cisco SGMII interface modes.
> > 
> > Implement support for configuring for the new paths to SerDes interfaces
> > and the internal 2.5G PHY.
> > 
> > Add USXGMII PCS driver for 10GBase-R, 5GBase-R and USXGMII mode, and
> > setup the new PHYA on MT7988 to access the also still existing old
> > LynxI PCS for 1000Base-X, 2500Base-X and Cisco SGMII PCS interface
> > modes.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Hi Daniel,
> 
> some minor feedback from my side.
> 
> ...
> 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_usxgmii.c b/drivers/net/ethernet/mediatek/mtk_usxgmii.c
> 
> ...
> 
> > +static int mtk_usxgmii_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
> > +				  phy_interface_t interface,
> > +				  const unsigned long *advertising,
> > +				  bool permit_pause_to_mac)
> > +{
> > +	struct mtk_usxgmii_pcs *mpcs = pcs_to_mtk_usxgmii_pcs(pcs);
> > +	struct mtk_eth *eth = mpcs->eth;
> > +	struct regmap *pextp = eth->regmap_pextp[mpcs->id];
> > +	unsigned int an_ctrl = 0, link_timer = 0, xfi_mode = 0, adapt_mode = 0;
> > +	bool mode_changed = false;
> > +
> > +	if (!pextp)
> > +		return -ENODEV;
> > +
> > +	if (interface == PHY_INTERFACE_MODE_USXGMII) {
> > +		an_ctrl = FIELD_PREP(USXGMII_AN_SYNC_CNT, 0x1FF) |
> > +			  (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) ?
> > +			  USXGMII_AN_ENABLE : 0;
> 
> clang-16 W=1 suggests using parentheses here:
> 
>  drivers/net/ethernet/mediatek/mtk_usxgmii.c:468:51: warning: operator '?:' has lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-parentheses]
>                            (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) ?
>                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>  drivers/net/ethernet/mediatek/mtk_usxgmii.c:468:51: note: place parentheses around the '|' expression to silence this warning
>                            (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) ?
>                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>  drivers/net/ethernet/mediatek/mtk_usxgmii.c:468:51: note: place parentheses around the '?:' expression to evaluate it first
>                            (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) ?
>                                                                         ^
>                            (

Yeah, I've seen that one coming up on patchwork as well, fixed it already in my
local tree.

> 
> > +		link_timer = FIELD_PREP(USXGMII_LINK_TIMER_IDLE_DETECT, 0x7B) |
> > +			     FIELD_PREP(USXGMII_LINK_TIMER_COMP_ACK_DETECT, 0x7B) |
> > +			     FIELD_PREP(USXGMII_LINK_TIMER_AN_RESTART, 0x7B);
> > +		xfi_mode = FIELD_PREP(USXGMII_XFI_RX_MODE, USXGMII_XFI_RX_MODE_10G) |
> > +			   FIELD_PREP(USXGMII_XFI_TX_MODE, USXGMII_XFI_TX_MODE_10G);
> 
> ...
> 
> > +int mtk_usxgmii_init(struct mtk_eth *eth)
> > +{
> > +	struct device_node *r = eth->dev->of_node;
> > +	struct device *dev = eth->dev;
> > +	struct device_node *np;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < MTK_MAX_DEVS; i++) {
> > +		np = of_parse_phandle(r, "mediatek,usxgmiisys", i);
> > +		if (!np)
> > +			break;
> > +
> > +		eth->usxgmii_pcs[i] = devm_kzalloc(dev, sizeof(*eth->usxgmii_pcs), GFP_KERNEL);
> 
> Smatch warns that only 8 bytes are allocated, whereas 64 are needed.
> I think one more defference of the parameter to sizeof().
> 
> e.g.:
> 
> 		eth->usxgmii_pcs[i] = devm_kzalloc(dev,
> 						   sizeof(*eth->usxgmii_pcs[i]),
> 						   GFP_KERNEL);

Good catch, thank you! I will fix it.


> 
> > +		if (!eth->usxgmii_pcs[i])
> > +			return -ENOMEM;
> > +
> > +		eth->usxgmii_pcs[i]->id = i;
> > +		eth->usxgmii_pcs[i]->eth = eth;
> > +		eth->usxgmii_pcs[i]->regmap = syscon_node_to_regmap(np);
> > +		if (IS_ERR(eth->usxgmii_pcs[i]->regmap))
> > +			return PTR_ERR(eth->usxgmii_pcs[i]->regmap);
> > +
> > +		eth->usxgmii_pcs[i]->pcs.ops = &mtk_usxgmii_pcs_ops;
> > +		eth->usxgmii_pcs[i]->pcs.poll = true;
> > +		eth->usxgmii_pcs[i]->pcs.neg_mode = true;
> > +		eth->usxgmii_pcs[i]->interface = PHY_INTERFACE_MODE_NA;
> > +		eth->usxgmii_pcs[i]->neg_mode = -1;
> > +
> > +		of_node_put(np);
> > +	}
> 
> ...
> 

