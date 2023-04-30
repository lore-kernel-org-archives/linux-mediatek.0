Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF09EC77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2m9o5cAZcUL4YwF6LNqupdePboCY6WLH6EEUshsr3k=; b=cJ+fig4cZG1z0cwzK/XKZzgdNb
	/uXjMH4i8K6pkVAtxLKtH/txjlZ4gVOJ8gpNqEgk1lUGbwH9Uc3xgTNtuJunTbzNKQIlUydeo673h
	ORfvJGdnD92+F0/Izr8cqbaPtLFdMZElnbR/uGr1Icxw9iZ1reot8I/a4MJfOeUH7onSL5ZLG0qPY
	aNCbZ+rBg+CKFuA7JfYoUMcyjkaEKIHut7ehcLuzunHIKDtFyyOhGcxkAz5nHQi9uP72Mdj/mFlo5
	SSBs0GwgusXKoo3TqPDW1PU2TZ3ozSty26RWy/UxTZ/SF45QKqPSiKc0vbiv5S1qDQkFWtfqY9PB/
	pp3ZUyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptAh2-00ETB9-1o;
	Sun, 30 Apr 2023 17:18:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptAgy-00ET8I-25;
	Sun, 30 Apr 2023 17:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=W2m9o5cAZcUL4YwF6LNqupdePboCY6WLH6EEUshsr3k=; b=h/
	v1BqlSOSj4XcZqtRa6+SdSZW7KyYBo8pN4hWyOTz+aKTF/WiuNz2KryyZ+I7WmRK9FCVsahgmC/qx
	Gcgk+6q+8JKcX8VvNm23QRkNth3TIQea829DuinR4SMHPcZ/7/WlqUJTXcaPw8QepSNQOSHRJ0iJv
	qKBPQzX4m04tydo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ptAgT-00BYs6-15; Sun, 30 Apr 2023 19:18:01 +0200
Date: Sun, 30 Apr 2023 19:18:01 +0200
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
Message-ID: <04cc2904-6d61-416e-bfbe-c24d96fe261b@lunn.ch>
References: <20230430112834.11520-1-mail@david-bauer.net>
 <20230430112834.11520-2-mail@david-bauer.net>
 <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
 <396fad42-89d0-114d-c02e-ac483c1dd1ed@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <396fad42-89d0-114d-c02e-ac483c1dd1ed@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_101832_690571_93864225 
X-CRM114-Status: GOOD (  15.99  )
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

On Sun, Apr 30, 2023 at 07:17:10PM +0300, Arınç ÜNAL wrote:
> On 30.04.2023 15:34, Arınç ÜNAL wrote:
> > On 30.04.2023 14:28, David Bauer wrote:
> > > Document the ability to add nodes for the MDIO bus connecting the
> > > switch-internal PHYs.
> > 
> > This is quite interesting. Currently the PHY muxing feature for the
> > MT7530 switch looks for some fake ethernet-phy definitions on the
> > mdio-bus where the switch is also defined.
> > 
> > Looking at the binding here, there will be an mdio node under the switch
> > node. This could be useful to define the ethernet-phys for PHY muxing
> > here instead, so we don't waste the register addresses on the parent
> > mdio-bus for fake things. It looks like this should work right out of
> > the box. I will do some tests.
> 
> Once I start using the mdio node it forces me to define all the PHYs which
> were defined as ports.

Try setting ds->slave_mii_bus to the MDIO bus you register via
of_mdiobus_register().

	Andrew

