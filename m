Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B768C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 15:05:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5702054F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 15:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2VDNY4b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UkPiQGkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5702054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwnIXu2YAjjrS/U51xyAsseQBNUEpogF+kOSh0KNbn4=; b=O2VDNY4b93jKcS
	PdA6B/Z+W285xcQika45HAPdGFPWJ5BtQJvgIta2dDtigG5F3gbPK2jLthc0352fi5NOgi9He2Tw0
	VqFhlV68CI/lCl8tmH9bPHrXMuRJXWB7uXAY5Mk3J20jjifPK2o/qYvWLtQVmy29uf2vbivfDV6ou
	ntbGVB0b2nzrW7qkwryuJUQiDoVb9Ep1B1UWDwMwwXUwgJTF0k5WkHbc4qeNbxYHox/F6ezS+GYe5
	V4SRmHik5uYKCPQ20NhPPnLynfSL0g9Sv6cvo94I5ZoHf9nm4AxDBtGhxC9RswNy2zTaw8kWHkNX6
	U6JNvUVPyQN6RyEktltw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifQ1x-00024z-Cs; Thu, 12 Dec 2019 15:05:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifQ1v-00024R-0E
 for linux-mediatek@lists.infradead.org; Thu, 12 Dec 2019 15:05:28 +0000
X-UUID: d3d524bbc88a4fd1b6e4a0e69e55e02c-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=84wpsP18Q2abVq3hW8fuZwnD/ApWQ30/AxRn97/G118=; 
 b=UkPiQGkS1kcFAqhGZxjzEALbMv4gp538c3RtIPLGNFC4DE5xWKS3uuKHLtV7RxD26mPPD5w4rHadQoqMqeoNSzBtEktr9awH5AzEYoEosmXRjTlVGtauooi48+BTvcwr8NL1C7l3QPAkpamTqdF+kLOELr4QVCVCcMnuCoV+iBk=;
X-UUID: d3d524bbc88a4fd1b6e4a0e69e55e02c-20191212
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 765864615; Thu, 12 Dec 2019 07:05:26 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 07:06:26 -0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 23:05:20 +0800
Message-ID: <1576163122.18168.2.camel@mtksdccf07>
Subject: Re: [PATCH net-next 2/6] net: dsa: mt7530: Extend device data ready
 for adding a new hardware
From: Landen Chao <landen.chao@mediatek.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Thu, 12 Dec 2019 23:05:22 +0800
In-Reply-To: <d77e3109-e022-3581-2ca8-02889c5ddbf4@gmail.com>
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <2d546d6bb15ff8b4b75af2220e20db4e634f4145.1575914275.git.landen.chao@mediatek.com>
 <d77e3109-e022-3581-2ca8-02889c5ddbf4@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_070527_051419_1724596B 
X-CRM114-Status: GOOD (  17.77  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource@vdorst.com" <opensource@vdorst.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-12-12 at 11:45 +0800, Florian Fainelli wrote:
> 
> On 12/10/2019 12:14 AM, Landen Chao wrote:
> > Add a structure holding required operations for each device such as device
> > initialization, PHY port read or write, a checker whether PHY interface is
> > supported on a certain port, MAC port setup for either bus pad or a
> > specific PHY interface.
> > 
> > The patch is done for ready adding a new hardware MT7531.
> > 
> > Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> [snip]
> 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index ed1ec10ec62b..9a648d1f5d09 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -425,7 +425,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
> >  }
> >  
> >  static int
> > -mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
> > +mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t mode)
> 
> Here you pass a phy_interface_t argument but not in mt7632_pad_clk_setup().
> 
> > +static int
> > +mt7530_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
> > +{
> > +	struct mt7530_priv *priv = ds->priv;
> > +
> > +	/* Setup TX circuit incluing relevant PAD and driving */
> > +	mt7530_pad_clk_setup(ds, state->interface);
> > +
> > +	if (priv->id == ID_MT7530) {
> > +		/* Setup RX circuit, relevant PAD and driving on the
> > +		 * host which must be placed after the setup on the
> > +		 * device side is all finished.
> > +		 */
> > +		mt7623_pad_clk_setup(ds);
> 
> Would not it make sense to pass it down here as well for consistency?
mt7623_pad_clk() contains the setting for PHY_INTERFACE_MODE_TRGMII. It
is really better to pass phy_interface_t for error handling.
> 
> [snip]
> 
> > @@ -1660,8 +1768,19 @@ mt7530_probe(struct mdio_device *mdiodev)
> >  	/* Get the hardware identifier from the devicetree node.
> >  	 * We will need it for some of the clock and regulator setup.
> >  	 */
> > -	priv->id = (unsigned int)(unsigned long)
> > -		of_device_get_match_data(&mdiodev->dev);
> > +	priv->info = of_device_get_match_data(&mdiodev->dev);
> > +	if (!priv->info)
> > +		return -EINVAL;
> > +
> > +	/* Sanity check if these required device operstaions are filled
> > +	 * properly.
> 
> Typo: operations.
Oops, sorry. I'll correct it.

Landen
> 
> Other than that, this looks okay to me.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
