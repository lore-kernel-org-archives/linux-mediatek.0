Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF8DEE3F3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 01:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zXsjXXg4yAxPy7RTYj+3TPJv5GOPPfAy0rQXae3yUw=; b=LQ5jR3kJvhsSgO/xGenZcgUvAq
	ovQhGNoJGotQJEwY2hIAEZEn8CE+ATB7GtdxkSsT+p5h2RFBg2dEEd6XvVQigTi4fEiNWnDWi+RyR
	wK74+TREntBfL//8bJVZA84tvFGpBtyWZSu1nw2mkP/ZbCwvGUi77SSGxkAi9cbdCodkuqSXKYwK+
	rnMfbG8iaYHG51IjvxUVcJrkHIpJTk2dOAqaaa0njjwtDLC4NLc8rKM5QAWPCPkCki6qDnr5q+ZkS
	rh8WexP3EgqWa6197x3FBgaiNqlWf0k/Kp7+WIS7IgkqwIyX9lJx2uu7orAG4aQM3XK8x48e68/t0
	8CiO+UmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgEa0-004Nxh-2Z;
	Wed, 13 Sep 2023 01:22:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgEZw-004NwV-32;
	Wed, 13 Sep 2023 01:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6zXsjXXg4yAxPy7RTYj+3TPJv5GOPPfAy0rQXae3yUw=; b=RK94NkYKrPO8rFX0Ykdbce0JCi
	Sc3JDva8axrlw4H6CDU2Lrz/PVJCqC5kgEFFtz4QBUZTgOnP12qTIlxbel5EJK5ggAwi/X9hr3Z62
	lWRhMeAFQhAf3c9gUZJC/PcFmTRrXKjiacyiUtqJQixe13gn9l2o8bIyIOhz2wjnDd7M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgEZL-006Gpu-HU; Wed, 13 Sep 2023 03:21:27 +0200
Date: Wed, 13 Sep 2023 03:21:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <c7eddf45-c259-47de-ac59-2569c09ed5f7@lunn.ch>
References: <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <617c51cf-2c09-4865-ac60-96599db597e7@lunn.ch>
 <563ac27a-22f2-463e-b5c1-9df721842976@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <563ac27a-22f2-463e-b5c1-9df721842976@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_182204_981179_5658A781 
X-CRM114-Status: GOOD (  16.16  )
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

> > The marvell switch can have up to 2 MDIO busses. If i remember
> > correctly, there is also one switch which has one MDIO bus per port.
> 
> I'm writing the json-schema for Marvell switches. I've checked a few
> devicetree source files on Linus's Linux tree, I only see two buses used at
> the most.

Sorry, i was ambiguous. Its not a Marvell switch which can have one
MDIO bus per port. I don't remember which switch it is, and it might
be a pure switchdev switch, not a DSA switch.

> The internal bus and another bus with
> marvell,mv88e6xxx-mdio-external. I've never seen a devicetree with
> marvell,mv88e6250 though. Could the switch that has one MDIO bus per port
> be this one? Also, is every bus of this switch a
> marvell,mv88e6xxx-mdio-external bus or, one internal bus and the remaining
> are marvell mv88e6xxx-mdio-external buses?

Only the 6390 family has two busses. It has an internal MDIO bus with
the same register API as all the other switches. However, unlike the
other families, it is not exposed on pins. And the 6390 has a second
MDIO bus using a slight variant of the registers, which is connected
to the outside world via pins. This second bus then has a compatible
to separate it from the normal MDIO bus.

	Andrew

