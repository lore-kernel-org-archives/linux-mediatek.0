Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22F9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 23:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TRJcRR333rwL5PCfo8eZYRyTNn3aczY+GklZvIg5sSY=; b=ZUJmAnwIycqVIc
	6KRw3WO4KTzWru2nRux4db0RNfoOQzjLlC9Q7bDP9wsBrgQpX6Qc8CQnZImniYTcOyMg4CAK54mYt
	tHQoEfHTCvXZhwRX1HUUv7lkPNnir/FHKXFw1vNILXc5319hYMcv26BMdG/nyfl2gPmMYOdkhHU0L
	hr0X+e8dum4hYBsCkeaVsDVHpfTSuO8phn6N8fDBpOyV55bDnQHgBVyObRE6hpSs1L4GORsAtH3pR
	cIBCcwybzSt+KYai5pfm41ylDkKmCHM4bpRepi1kyh0vri5rCMb0uH7H/ExZS7ggWabTnq0od6rV5
	QPJ6RRIa0AW2iV+dRD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJJ7-00HDzM-WA; Tue, 27 Dec 2022 23:24:30 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJ2g-00H6Po-8T; Tue, 27 Dec 2022 23:07:33 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7D1BB4E;
	Wed, 28 Dec 2022 00:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672182444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TRJcRR333rwL5PCfo8eZYRyTNn3aczY+GklZvIg5sSY=;
	b=vJobZ7uDgnBqcNJVTD+NPckdxu2oXipLrsPAfDHIbxJVB7iXrJ+CCWCM2NW4C8aSNqcrze
	F8wDuIHwX3neVjiVJNlstpEHQKiE8URJHm/R55y7XiUwSEWFAgqRFGbXiwF9Pc88e5spVy
	Dq4tXerL6Ow30zNemsGELDLpeCwlrzTyRFzmBHz/RJA6erZC8YsOXeoXslP65xPEcKgxSQ
	PqwetYkhuKiDfzBhImFPYs4hkccDs2X3vxrv4NiUyh/vtFp69bvyn72JJ2ib9HH9oAIqMh
	LNR+6019sVyujch6Kn+bs3fEJKJJhp+aPSQNj++BQOBQbEtXiq+WsgKW7TqS8g==
From: Michael Walle <michael@walle.cc>
Subject: [PATCH RFC net-next v2 00/12] net: mdio: Start separating C22 and C45
Date: Wed, 28 Dec 2022 00:07:17 +0100
Message-Id: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKV6q2MC/x2NQQrCMBBFr1Jm7UAzpi24FTyAW3ExjVObhbHMh
 FIovbuJy/c+j7+DiUYxuDQ7qKzR4jcVoFMDYeb0FoyvwkAtkSMacO2RUIPD4Ds0WUQ5lwa78zT0
 5H3L7KDUI5vgqJzCXPsPWxatw6Iyxe1/+YD77VpdkoxJtgzP4/gBxbsN8ZMAAAA=
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_150730_648404_9D05D422 
X-CRM114-Status: GOOD (  14.50  )
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

I've picked this older series from Andrew up and rebased it onto
v6.2-rc1.

This patch set starts the separation of C22 and C45 MDIO bus
transactions at the API level to the MDIO Bus drivers. C45 read and
write ops are added to the MDIO bus driver structure, and the MDIO
core will try to use these ops if requested to perform a C45
transfer. If not available a fallback to the older API is made, to
allow backwards compatibility until all drivers are converted.

A few drivers are then converted to this new API.

Link to v1: https://lore.kernel.org/netdev/20220508153049.427227-1-andrew@lunn.ch/

To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Wei Fang <wei.fang@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
To: Clark Wang <xiaoning.wang@nxp.com>
To: NXP Linux Team <linux-imx@nxp.com>
To: Sean Wang <sean.wang@mediatek.com>
To: Landen Chao <Landen.Chao@mediatek.com>
To: DENG Qingfang <dqfext@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>

---
Andrew Lunn (12):
      net: mdio: Add dedicated C45 API to MDIO bus drivers
      net: pcs: pcs-xpcs: Use C45 MDIO API
      net: mdio: mdiobus_register: update validation test
      net: mdio: C22 is now optional, EOPNOTSUPP if not provided
      net: mdio: Move mdiobus_c45_addr() next to users
      net: mdio: mdio-bitbang: Separate C22 and C45 transactions
      net: mdio: mvmdio: Convert XSMI bus to new API
      net: ethernet: freescale: xgmac: Separate C22 and C45 transactions for xgmac
      net: ethernet: freescale: fec: Separate C22 and C45 transactions for xgmac
      net: mdio: add mdiobus_c45_read/write_nested helpers
      net: dsa: Separate C22 and C45 MDIO bus transaction methods
      net: dsa: mv88e6xxx: Separate C22 and C45 transactions

 drivers/net/dsa/mt7530.c                    |  87 ++++-----
 drivers/net/dsa/mt7530.h                    |  15 +-
 drivers/net/dsa/mv88e6xxx/chip.c            | 175 +++++++++++++-----
 drivers/net/dsa/mv88e6xxx/chip.h            |   7 +
 drivers/net/dsa/mv88e6xxx/global2.c         |  66 ++++---
 drivers/net/dsa/mv88e6xxx/global2.h         |  18 +-
 drivers/net/dsa/mv88e6xxx/phy.c             |  32 ++++
 drivers/net/dsa/mv88e6xxx/phy.h             |   4 +
 drivers/net/dsa/mv88e6xxx/serdes.c          |   8 +-
 drivers/net/ethernet/freescale/fec_main.c   | 153 +++++++++++-----
 drivers/net/ethernet/freescale/xgmac_mdio.c | 150 +++++++++++----
 drivers/net/ethernet/marvell/mvmdio.c       |  24 +--
 drivers/net/ethernet/renesas/sh_eth.c       |  37 +++-
 drivers/net/mdio/mdio-bitbang.c             |  77 +++++---
 drivers/net/pcs/pcs-xpcs.c                  |   4 +-
 drivers/net/phy/mdio_bus.c                  | 273 +++++++++++++++++++++++++++-
 include/linux/mdio-bitbang.h                |   6 +-
 include/linux/mdio.h                        |  48 ++---
 include/linux/phy.h                         |   5 +
 include/net/dsa.h                           |   2 +-
 20 files changed, 891 insertions(+), 300 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20221227-v6-2-rc1-c45-seperation-53f762440aa1

Best regards,
-- 
Michael Walle <michael@walle.cc>

