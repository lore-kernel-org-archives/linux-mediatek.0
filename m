Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D38AC77B7C
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+r4sj5Wdu1YqQif08HC/Zm726AJ0OzaSQ6z+naTJaY=; b=MAZfmHBdiUk7miO3fx0cMqI1g1
	62xkgDi5QhBtHqPhjXjpqLyruB9CnDMHyBkJ2jZSZFX5URV9ERUutmFhykkClleNu6oUASx2BFq1m
	Fk6nbmzTl3A9NIM+iQKqXIhmSvl+xeblCVGNAzPTlj4Vo+T9p157ace8SWVFfMlpbFYoH+Iwh0Yj0
	6SzLw1hiDew6CricdcUaWJsmqIefer0vW+BI7Et2CeTkZ0jXOgrDsSGczJO5vJaN6Qxt8vn6seqhZ
	9BAQKOVlkUDZSEZYKabrOgjXWrEC2/m8qv5mqnFAvsrBAQU11m2U37CcPchT2JzHNcZmh4oR6OfQZ
	Bu/GJfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptC6o-00Eehl-0k;
	Sun, 30 Apr 2023 18:49:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptC6k-00EegF-3C;
	Sun, 30 Apr 2023 18:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1+r4sj5Wdu1YqQif08HC/Zm726AJ0OzaSQ6z+naTJaY=; b=expERG4bmIxY87IpV8nRXZhvdR
	vufaEvswXY9oMHSRXHPhPyXLQo+w9iAi01USwoZ9h9lZpnpHbnyReCRIvibzmh3tKDwjHxfsknAyc
	wb9UALy4ac1X4Xr36VP7JDI7TyFF6bNkNBRCL/mKFxTfLqQyzbuNZ83rEEfEimvV1/vY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ptC69-00BZ9O-7M; Sun, 30 Apr 2023 20:48:37 +0200
Date: Sun, 30 Apr 2023 20:48:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: David Bauer <mail@david-bauer.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: net: dsa: mediatek,mt7530: document
 MDIO-bus
Message-ID: <207753d6-cffd-4a23-be16-658d7c9ceb4a@lunn.ch>
References: <20230430112834.11520-1-mail@david-bauer.net>
 <20230430112834.11520-2-mail@david-bauer.net>
 <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
 <396fad42-89d0-114d-c02e-ac483c1dd1ed@arinc9.com>
 <04cc2904-6d61-416e-bfbe-c24d96fe261b@lunn.ch>
 <a6c6fe83-fbb5-f289-2210-6f1db6585636@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6c6fe83-fbb5-f289-2210-6f1db6585636@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_114915_032258_49B19501 
X-CRM114-Status: GOOD (  13.46  )
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

> > Try setting ds->slave_mii_bus to the MDIO bus you register via
> > of_mdiobus_register().
> 
> That seems to be the case already, under mt7530_setup_mdio():
> 
> 	bus = devm_mdiobus_alloc(dev);
> 	if (!bus)
> 		return -ENOMEM;
> 
> 	ds->slave_mii_bus = bus;
> 
> The bus is registered with devm_of_mdiobus_register(), if that matters. (My
> current knowledge about OF or OF helpers for MDIO is next to nothing.)
> 
> The same behaviour is there.

Maybe take a look at what is going on in dsa_slave_phy_setup() and
dsa_slave_phy_connect().

The way i understand it, is it first looks in DT to see if there is a
phy-handle, and if there is, it uses it. If not, it assumes there is a
1:1 mapping between port number and PHY address, and looks to see if a
PHY has been found on ds->slave_mii_bus at that address, and uses it.

So i don't think you need to list the PHY, the fallback should be
used.

	Andrew

