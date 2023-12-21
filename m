Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3065FC35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Q5cOIVW2NXQCgE8m7MOSUxp7IMMRSApRmgjadLhzFs=; b=QhJ61eG/zCe7dzzLtYNGX26XaK
	ZYdJZHAMvSc5ktfsx2+EzxIAqBCsSDqXHa5QYPSfR/QjAHM63FHO6AKFkddIdA50vKwtuBkIYdsuk
	gjsjtQUG/6oCQQj59cNqQWi2HpGdgssI3PiTmbDv8sTdSXELcKvbG4CUfSakQahlOCpL0zXM6LUMJ
	a6u3y4VPHktscnNQgu10NF6SnIT9c7Rll8YTa+RHWv4RduVNhUBc5J4bjEx40SIxkl82m0PPezFFL
	69RgAmtNfK4pu+Nku/dRAFLEpcDWiT51eNP1hxMdDJWUNinMLql+KjT3I6HmeJ0qYp/44ChEQMKHG
	gxT1Divg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFLL-002Gwb-0b;
	Thu, 21 Dec 2023 09:27:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFLH-002GvS-2v;
	Thu, 21 Dec 2023 09:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8Q5cOIVW2NXQCgE8m7MOSUxp7IMMRSApRmgjadLhzFs=; b=HGG1wa2raGGp05ho8o8RKqOknz
	KILTqZixOLLzlW1a6Z03U2rsSkmIsk7JIuRgI+NqiPxoYcBVRpxgdeLiYbBbxyAt0MoyPCTeDj6WD
	QpTNzCi+vTCe8a4ZECCa54w7drc3WtfQ5+bzb8g+u5Wd8ssmwJrO+OiPSAZ6JbRIKrRo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rGFKu-003Uho-BE; Thu, 21 Dec 2023 10:27:24 +0100
Date: Thu, 21 Dec 2023 10:27:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: register OF node for internal
 MDIO bus
Message-ID: <8e248f59-007a-4c53-877f-6026f4a74d0b@lunn.ch>
References: <20231220173539.59071-1-arinc.unal@arinc9.com>
 <d78949f0-bb03-82ea-b40f-1bb92b41e200@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d78949f0-bb03-82ea-b40f-1bb92b41e200@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012747_939311_8C5B4D06 
X-CRM114-Status: GOOD (  10.69  )
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

> > @@ -2177,7 +2180,9 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
> >  	if (priv->irq)
> >  		mt7530_setup_mdio_irq(priv);
> >  
> > -	ret = devm_mdiobus_register(dev, bus);
> > +	mnp = of_get_child_by_name(np, "mdio");
> 
> If the node is not found, then the return value would be NULL.
> Though devm_of_mdiobus_register() and of_node_put() take care of NULL references,
> other drivers that use devm_of_mdiobus_register() mostly perform a early exit if the node is NULL.

Actually, many don't as well. of_mdiobus_register() falls back to
mdiobus_register() is np==NULL. That causes a scan of the bus to find
all the PHYs and you can then use phy_find_first() to access them.

So this code is O.K.

   Andrew

