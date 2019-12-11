Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E709C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 18:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63898206C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 18:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WW26eg9j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J+FMENgS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63898206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dqD81mTDFSySkJeCYO6m3PqbVthY2wwkUn9sNmccYY=; b=WW26eg9jVsNMIn
	3wkz/NvJaXd+0W5VpfEVwNXj1fN4yNCIJOrlIurn/LN5CFHpTh5YEyxE4LrTzu0MIGWTfW/l99A7V
	VIn34+u43HIx/X5KGFYu4pQu9FG1+4ecIvCs/XQ22wSdz23R5zEiHqnZ/F+kxFsx2olWpthfuyMr+
	nTE8ghvJpcpsiZSpb7JvTsltUsT6ZVxjupfk7dYn7Vsksz9gfYGWmuHnukGKXqU63tGLGqQVQWmtd
	nSJ7cnWwCoLdUe/rGyD2JKK7N8cLgSIaztxAITAtO8FFogIVzlNyK3+qBRuM8pABscyKUq4UXoe+4
	PJ71bRK18EmuB9bRVieQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if6Z0-00013z-9V; Wed, 11 Dec 2019 18:18:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if6Ys-00013O-Lu
 for linux-mediatek@lists.infradead.org; Wed, 11 Dec 2019 18:18:13 +0000
X-UUID: 8a9454761e3a48f7a30c184314f63498-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AJS94YiN8pfCT1+XiiAx5eqWRqmJb3Rr0RYdZSYfHVI=; 
 b=J+FMENgS0ZD05uAjEI2c6d+L5p5r9IKFk7gDKqvIXx/e7nRys27SIFGcLJQ6o1l9/ce/ZvJw+NyN9mJeMVKqyQ6ABYD5nAniP8eHRDk/nEE0iBYfgwaE2GCwRpuUS2vWtyBzTOyN4iUS59nPVdNyKUcjFXUVr+Fj9EiL+9+fgkc=;
X-UUID: 8a9454761e3a48f7a30c184314f63498-20191211
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1278536325; Wed, 11 Dec 2019 10:18:07 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 10:19:07 -0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 02:17:34 +0800
Message-ID: <1576088280.23763.73.camel@mtksdccf07>
Subject: Re: [PATCH net-next 4/6] net: dsa: mt7530: Add the support of
 MT7531 switch
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 12 Dec 2019 02:18:00 +0800
In-Reply-To: <20191210164438.GD27714@lunn.ch>
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
 <20191210164438.GD27714@lunn.ch>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_101810_722760_C96C6907 
X-CRM114-Status: GOOD (  12.34  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>,
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

On Wed, 2019-12-11 at 00:44 +0800, Andrew Lunn wrote:
> > +static int
> > +mt7531_ind_mmd_phy_read(struct mt7530_priv *priv, int port, int devad,
> > +			int regnum)
> > +{
> > +	struct mii_bus *bus = priv->bus;
> > +	struct mt7530_dummy_poll p;
> > +	u32 reg, val;
> > +	int ret;
> > +
> > +	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
> > +
> > +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> > +
> > +	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
> > +				 !(val & PHY_ACS_ST), 20, 100000);
> > +	if (ret < 0) {
> > +		dev_err(priv->dev, "poll timeout\n");
> > +		goto out;
> > +	}
> > +
> > +	reg = MDIO_CL45_ADDR | MDIO_PHY_ADDR(port) | MDIO_DEV_ADDR(devad) |
> > +	      regnum;
> 
> It might be better to call this mt7531_ind_c45_phy_read()
> 
> > +static int
> > +mt7531_ind_phy_read(struct dsa_switch *ds, int port, int regnum)
> > +{
> > +	struct mt7530_priv *priv = ds->priv;
> > +	struct mii_bus *bus = priv->bus;
> > +	struct mt7530_dummy_poll p;
> > +	int ret;
> > +	u32 val;
> > +
> > +	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
> > +
> > +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> > +
> > +	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
> > +				 !(val & PHY_ACS_ST), 20, 100000);
> > +	if (ret < 0) {
> > +		dev_err(priv->dev, "poll timeout\n");
> > +		goto out;
> > +	}
> > +
> > +	val = MDIO_CL22_READ | MDIO_PHY_ADDR(port) | MDIO_REG_ADDR(regnum);
> 
> This is then mt7531_ind_c22_phy_read().
> 
> And then you can add a wrapper around this to provide
> 
> mt7531_phy_read() which can do both C22 and C45.
I'll update the code base on above suggestion.
> 
> > +	[ID_MT7531] = {
> > +		.id = ID_MT7531,
> > +		.setup = mt7531_setup,
> > +		.phy_read = mt7531_ind_phy_read,
> 
> and use it here.
Do you also hint at using the same number of parameters for
mt7531_ind_c22_phy_read() and mt7531_ind_c45_phy_read()?

Landen
> 
>   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
