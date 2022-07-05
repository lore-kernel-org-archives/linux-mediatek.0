Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D39BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ii1GKEupHCQsHzVoe60E3KJDsE5TLy1tVeZYgWrzrw=; b=3gqKmMvqwvAOFO67q7RsT+x/vt
	AM0e1VmZcjsLo+QAHbuubRuhgBomHZ/7O72U3tpctHqnsAeXN3CIuJckYo0Y1V/WEPiBDUMvLZVyF
	kc5qGMn6jvpdZhqw5eXNaTURYUEEZa4anTWzbq9q0BOHYdkA0g67gOeSdFWtRpXVEI5vZuWOazjHY
	AmYuwMmxwcJ1ZoyAu7aPqQIZk11KqMAgxf6J/PdpNrX4W6cbIlvMTaYWh1DULHTK6icCUT/autJb8
	e4YkYrwbGA+ueaiYx4U4Z4ZF9wulMy0zNDGBsuAQzmVdjsruM/8cWFasTLtEGozlrGXvQoaX+PZIV
	V+dijPgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ha1-0008ss-PC; Tue, 05 Jul 2022 12:23:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8hZq-0008qE-AS; Tue, 05 Jul 2022 12:22:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 638B5B817D3;
	Tue,  5 Jul 2022 12:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E74CC341C7;
	Tue,  5 Jul 2022 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657023765;
	bh=HQMgUfRITrutcQ2G6WgPzf7h1A6dhvFf5+Wy2kcjb8A=;
	h=Date:From:To:Cc:Subject:From;
	b=RB5E8D/+GlB5cKRKKVj3uE0HVlhviCpjziTh0C1RHMpsaTiQz8gKfghL5KYvxJFN8
	 M2AdsXgW8ldebeuIjB0KCsKxnyfGEQ6pT+oi9gHrxiMu12dRBoyuQGEw2foc/pplN6
	 zU87aK3Gt2ytb449K5hZycHS+++0u46wgiggv+nfTzrVvA9/vBoJuGl+fgvn0UCpn1
	 zq1O7A0x8Fubh2SITJ65anpcIGolky9KIr7mmcFLEjQkUUsDVg2yWWfCLk7CpS3i/n
	 g6Drf8o4QLqWjkD1x8g438IGMd/PuCAR5vKgbkyhACJ/nNE4AIkA9BgIDtCYllxnKi
	 dYIWoKVtAtRPQ==
Date: Tue, 5 Jul 2022 14:22:36 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, "Alvin __ipraga"
 <alsi@bang-olufsen.dk>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Hauke Mehrtens
 <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach
 <kurt@linutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Sean Wang
 <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Woojung
 Huh <woojung.huh@microchip.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: DSA: request for your help with your DSA driver
Message-ID: <20220705142236.1fab0033@thinkpad>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_052250_723451_52C081F2 
X-CRM114-Status: GOOD (  15.97  )
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

Hello guys,

this is a request for help/comments on the DSA drivers you have been
working on in Linux.

I am writing this e-mail because people don't seem to be responding to
RFC patches.

Basically Russell and I are trying to do some development on phylink +
DSA to move it forward, without breaking existing drivers:

- we want to make it so that phylink is always used for CPU and DSA
  ports (needed for conversion to phylink_pcs)

- to do that, phylink needs to know the interface type to which the
  port will be configure

- many drivers don't report that information now:
  - some use port's phy-mode property from device-tree
  - some leave it at default (HW initialized)
  - some choose the mode according to some information the driver
    computes
  - some try to find a mode that gives the maximum possible speed
    (mv88e6xxx, for example)

  for example take a look at mt7530 driver
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/dsa/mt7530.c?h=v5.19-rc5
    lines 2213-2250
       function mt7530_setup()
          reads phy-mode from device-tree if port 5 has a node,
          otherwise tries to determine the mode from gmac node
    line 2847
       function mt7531_cpu_port_config()
          decides PHY mode according to some prior settings

Russell wrote a RFC series
  https://lore.kernel.org/netdev/YsQIjC7UpcGWJovx@shell.armlinux.org.uk/T/
in which
- mv88e6xxx is patched to report the max speed mode to phylink
- for other drivers, if no default interface is reported, an interface
  will be inferred from the reported mac capabilities, such that it
  gives maximum possible speed

It is very probable that this will break your drivers, and so I ask you
to look at the RFC series, maybe test it, and give your comments or
additional patches that make it work.

Thank you.

Marek

