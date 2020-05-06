Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721CDC47256
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 19:25:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F9720CC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 19:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rYzbWwhU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F9720CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hXEvyOppoOvJtBFwSkyWdGdSa2z9OtMzx3avLp+2N0=; b=rYzbWwhUS5+cDm
	RqytwyoD0AMuQjbDtYUbaPZw7ZC86Yx6v7xzla55oNORSNNfmTmzkKZdb+w9LteqP4YZuh8grRiZY
	OQ53KDklTQDnqJxxntgbEEVRwaV3999u0iIztuN5crcGr3vhBi5jMXTPzGuL1xwa8NT8sSUSbRESb
	uODIFCH8/fI5p9PNZqTMaKwEHZUZt5CTkMj/rYVOmFIOec3d3wFCi/2PSP7qiJlfa+x4TTzg9z/q4
	E2DGmE3ELsGM5ANrHwBaJmJmHH2lPB0muhuFP1UnhRKESRXGwYAXQYe+TRhEzJsnFbWHxSsJ223Sx
	xVrBSTdxoWaLa6b34lcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWPf4-0002Ux-MX; Wed, 06 May 2020 19:24:54 +0000
Received: from smtprelay0212.hostedemail.com ([216.40.44.212]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWPes-0002L8-Ua; Wed, 06 May 2020 19:24:44 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id D560118221882;
 Wed,  6 May 2020 19:24:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: group10_aa59a2ed6d34
X-Filterd-Recvd-Size: 3211
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Wed,  6 May 2020 19:24:33 +0000 (UTC)
Message-ID: <fd17302d94f6e2242d041268989e94a04df159de.camel@perches.com>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
From: Joe Perches <joe@perches.com>
To: Leon Romanovsky <leon@leon.nu>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 06 May 2020 12:24:31 -0700
In-Reply-To: <CALq1K=Lu0hv9UCgxgrwCVoOe9L7A4sgBEM=RW2d9JkizHmdBPQ@mail.gmail.com>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
 <CALq1K=Lu0hv9UCgxgrwCVoOe9L7A4sgBEM=RW2d9JkizHmdBPQ@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_122443_107384_ED703035 
X-CRM114-Status: GOOD (  10.39  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-06 at 22:16 +0300, Leon Romanovsky wrote:
> On Tue, May 5, 2020 at 5:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > This adds the driver for the MediaTek Ethernet MAC used on the MT8* SoC
> > family. For now we only support full-duplex.
[]
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_mac.c b/drivers/net/ethernet/mediatek/mtk_eth_mac.c
[]
> > +struct mtk_mac_priv {
> > +       struct regmap *regs;
> > +       struct regmap *pericfg;
> > +
> > +       struct clk_bulk_data clks[MTK_MAC_NCLKS];
> > +
> > +       void *ring_base;
> > +       struct mtk_mac_ring_desc *descs_base;
> > +       dma_addr_t dma_addr;
> > +       struct mtk_mac_ring tx_ring;
> > +       struct mtk_mac_ring rx_ring;
> > +       struct work_struct tx_work;
> > +
> > +       struct mii_bus *mii;
> > +       struct napi_struct napi;
> > +
> > +       struct device_node *phy_node;
> > +       phy_interface_t phy_intf;
> > +       struct phy_device *phydev;
> > +       unsigned int link;
> > +       int speed;
> > +       int duplex;
> > +
> > +       /* Protects against concurrent descriptor access. */
> > +       spinlock_t lock;
> > +       unsigned long lock_flags;
> > +
> > +       struct rtnl_link_stats64 stats;
> > +};
> > +
> > +static struct net_device *mtk_mac_get_netdev(struct mtk_mac_priv *priv)
> > +{
> > +       char *ptr = (char *)priv;
> > +
> > +       return (struct net_device *)(ptr - ALIGN(sizeof(struct net_device),
> > +                                                NETDEV_ALIGN));
> > +}

This code looks ugly/fragile.
Why not store the struct net_device * in struct mtk_mac_priv ?



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
