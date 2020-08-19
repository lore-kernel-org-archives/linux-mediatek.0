Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC331C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 09:44:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA216206FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 09:44:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XG+4PdDU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YimcZxgG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA216206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=twPk1fq2+Gr4c4fQfWKmkX2gbcDyq6WKGYj2napTrzE=; b=XG+4PdDUFNC7bEuD4yKUM2xdm
	8lS/MMpD5iSFuAaT8UoNRkp7v6ynLjQdUIWW77cUBaIOrdx0m/93I8pIYMWWGfvj4v8QtD5X46pH0
	vdtShOwc/rFQuXoxqA/fdaWpfBvpgKtdk/M4MJZM78jAocnmwBiYd8o9O8psxjBwqru++oKBK01TJ
	7padwLIh9K8QIND80DZRXWGB6rW5AvAvvC6MioiD/XHoZKqpI5zJIQecMQMuN995rqY9Ej4Am9PWE
	9Vxuc65KDAe6pOswJCX18KXU4pEaRhsbgdIObzemU7SNnrpuQNvMIDGDEiMPKhaWgaVKGfHnpmmLH
	1UIY8D7vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Kds-0007v5-Kh; Wed, 19 Aug 2020 09:44:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Kdp-0007uE-K4
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 09:44:22 +0000
X-UUID: 287dd17b5061438c882be477af6d22b6-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kQXoKdKVpI5uaXNaEF7rubWxdg60fBjIip1atnVNx4w=; 
 b=YimcZxgGzFRVHMuCF/1++lAbAs6pvMpBzF+FP/5HaxoW8aRy22AvuDuJtdfkRtssyteU6W7g0oGHGy4cum6VcyXxyvq8TH49+SEocIl6Cc8ktX7mwNSz8exXyCCMzI9j16bcAtuvtEHfxQ2RWURmw/PefF6gWBvpaGwfdBg5XfQ=;
X-UUID: 287dd17b5061438c882be477af6d22b6-20200819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 110886726; Wed, 19 Aug 2020 01:44:10 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 02:44:08 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 17:44:06 +0800
Message-ID: <1597830248.31846.78.camel@mtksdccf07>
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: Add the support of
 MT7531 switch
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 19 Aug 2020 17:44:08 +0800
In-Reply-To: <20200818160901.GF2330298@lunn.ch>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
 <20200818160901.GF2330298@lunn.ch>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_054421_843664_E213E508 
X-CRM114-Status: GOOD (  25.01  )
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
 "dqfext@gmail.com" <dqfext@gmail.com>,
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

On Wed, 2020-08-19 at 00:09 +0800, Andrew Lunn wrote:
> On Tue, Aug 18, 2020 at 03:14:10PM +0800, Landen Chao wrote:
> > Add new support for MT7531:
> > 
> > MT7531 is the next generation of MT7530. It is also a 7-ports switch with
> > 5 giga embedded phys, 2 cpu ports, and the same MAC logic of MT7530. Cpu
> > port 6 only supports SGMII interface. Cpu port 5 supports either RGMII
> > or SGMII in different HW sku. Due to SGMII interface support, pll, and
> > pad setting are different from MT7530. This patch adds different initial
> > setting, and SGMII phylink handlers of MT7531.
> > 
> > MT7531 SGMII interface can be configured in following mode:
> > - 'SGMII AN mode' with in-band negotiation capability
> >     which is compatible with PHY_INTERFACE_MODE_SGMII.
> > - 'SGMII force mode' without in-bnad negotiation
> 
> band
Sorry, I'll fix it.
> 
> >     which is compatible with 10B/8B encoding of
> >     PHY_INTERFACE_MODE_1000BASEX with fixed full-duplex and fixed pause.
> > - 2.5 times faster clocked 'SGMII force mode' without in-bnad negotiation
> 
> band
Sorry, I'll fix it.
> 
> > +static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
> > +			      phy_interface_t interface)
> > +{
> > +	u32 val;
> > +
> > +	if (!mt7531_is_rgmii_port(priv, port)) {
> > +		dev_err(priv->dev, "RGMII mode is not available for port %d\n",
> > +			port);
> > +		return -EINVAL;
> > +	}
> > +
> > +	val = mt7530_read(priv, MT7531_CLKGEN_CTRL);
> > +	val |= GP_CLK_EN;
> > +	val &= ~GP_MODE_MASK;
> > +	val |= GP_MODE(MT7531_GP_MODE_RGMII);
> > +	val &= ~(TXCLK_NO_REVERSE | RXCLK_NO_DELAY);
> > +	switch (interface) {
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +		val |= TXCLK_NO_REVERSE;
> > +		val |= RXCLK_NO_DELAY;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		val |= TXCLK_NO_REVERSE;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		val |= RXCLK_NO_DELAY;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> 
> You need to be careful here. If the MAC is doing the RGMII delays, you
> need to ensure the PHY is not. What interface mode is passed to the
> PHY?
Hi Andrew,

mt7531 RGMII port is a MAC-only port, it can be connected to CPU MAC or
external phy. In bpi-r64 board, mt7531 RGMII is connected to CPU MAC, so
I tend to implement RGMII logic for use case of bpi-r64.

In general, according to phy.rst, RGMII delay should be done by phy, but
some MoCA product need RGMII delay in MAC. These two requirements
conflict. Is there any suggestion to solve the conflict?

If mt7531 RGMII implementation needs to satisfy either phy.rst or
special MoCA product, I would like to satisfy phy.rst and remove MAC
RGMII delay in v3. For special product needs MAC RGMII delay, this patch
can be used in its local codebase.

Landen
> 
> 	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
