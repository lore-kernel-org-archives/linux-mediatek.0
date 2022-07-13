Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69469C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMC/8S6LiF+qzzd+fptFo0oW68RWQkcm1BdUkffx2BE=; b=HJKxTJQzyfcT8VsjkT6fBtUAfZ
	OvOB0+YMWJkKDJgXrX/0EUbYMe518TZgpAj6mukDbZHGl2Awv7k6xseP/mbYQkD4PqB47oZRpgVy+
	+m2eJFaLIdRDUUmdeyTsloDUT7+abZqhWEq6p3wTKZ8pdZ6Y8CBRtKwfv41Kp+M+e4n5NvKBpxRf7
	2yyVT5Quz0rbeaPwTnwNnY3KTUBPXAZHT5KVTlTxPPPYVYH/vGfE/iLY4iz9C9AMzFF7RcTptzZoC
	XNTWG3tEmBX7cP3k2HsII1q1kYn5MishtyaeLYcJcSQ3eOKLczZ1b1y3YkgZ/oObOB/JOtJpSivDk
	o/aAxTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdaV-004deV-9W; Wed, 13 Jul 2022 14:43:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdaK-004dSg-Jp; Wed, 13 Jul 2022 14:43:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC74FB81FEC;
	Wed, 13 Jul 2022 14:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF853C34114;
	Wed, 13 Jul 2022 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657723405;
	bh=OMC/8S6LiF+qzzd+fptFo0oW68RWQkcm1BdUkffx2BE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dEOavb3jOPgiLiP0dPxNj9Nnnp5eKx0WU9oEANNElWh2f1LJthjt+UzPLE80jWLFd
	 UjJj4vgFwP/49WeGfgFlZUW44Qbyrm6pOc9w12Yabn46070+I3eI1NAjUB+acaWJ4d
	 lSa92zMDWWCwYzzHdCmzGu6zj55gknpc9RX6u6c0tQ4VWA9B+ZL1wRDKQ8y2vG/Ero
	 QPVYHTFOi9AQHimUWXIA/BpyDM8MjPA87F9YFUablsGtCq5kUbiyUyUq60EpENR35s
	 fYVmhFfQ4WiiZjzIuU0kxtcRd1x6E21VDCqCwt2JE0p1bViNTyNfgIPw0Od+QVkL+C
	 Xhp+IWey6EImA==
Date: Wed, 13 Jul 2022 16:43:14 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, "Alvin __ipraga"
 <alsi@bang-olufsen.dk>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski
 <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next v2 2/6] software node: allow named software
 node to be created
Message-ID: <20220713164314.6c813e26@thinkpad>
In-Reply-To: <E1oBd1n-006UCq-JK@rmk-PC.armlinux.org.uk>
References: <Ys7RdzGgHbYiPyB1@shell.armlinux.org.uk>
	<E1oBd1n-006UCq-JK@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_074328_824310_EC4254C0 
X-CRM114-Status: GOOD (  10.58  )
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

On Wed, 13 Jul 2022 15:07:47 +0100
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>=20
> Allow a named software node to be created, which is needed for software
> nodes for a fixed-link specification for DSA.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

