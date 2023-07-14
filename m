Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A007BEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KPCmfSZJJk1fn8yM9S62V6Eybb9c/BJs6GiVlhq2wRg=; b=A255lpA9wszsqIoezzoWpqLUG0
	YoVIzK638Vr9A+FrA4uHdcx32wW/Z5fYVnWyrkD3ibcw9qyjtfG9wWBKXqEz/bZB2yejz7YuZolGo
	EkApP7cFE+qdufaWe+uNnA3YRL5EKgc2Qs585CgA/5HRAJfQ7LZvJAwe9mXRoA01bnC1OSL9Xkhr2
	QD2cGir6cocEJOrfOPzfgb9HdLgNfRpxx0N2AAnm8O1dV/JcqIRdwKmvPuv3IXquH92TM94eMi79w
	GhjRFdi5kHetrwzZfOieyRO+MCzcXA5XZ5kHsnVy3Ra877qCl1CKdjqYCDgvjKT4q5p51rzvb37nP
	pT5byZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEq9-005dk3-0Z;
	Fri, 14 Jul 2023 09:11:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEq5-005djE-31;
	Fri, 14 Jul 2023 09:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KPCmfSZJJk1fn8yM9S62V6Eybb9c/BJs6GiVlhq2wRg=; b=eXaEPijFO6/KMJtLkSSI7tOdDU
	52N9Ke6yAv7MagBrBJ4ib/4yd+29agCwHM5JnhD/c5GijONqD9T3dtvWfaAAsj1pegN8leEB6GN1o
	HYlLJsv9MfM9yjM141EFwmkssbmEVnsQpft5J5Up7A4mW8cyNaI0Iz9Jd4GR+leIg2moV9MGVuwsD
	1stIIjMGYSY1FYlnG2bocCSE0mrKDEkGJoGbJEpvmOeFt93wR976nmc/Cxwgf6zkwx55XpxFAH/mb
	Yord0MG18jkq/KICcFU6K6q1lbvtuvOV8Yb32ZzKVN/VwXyL7GjTguNOFaQl2n9NqvKTw25eRbTz7
	2zTuku+A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39354)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qKEpt-0000NJ-0N;
	Fri, 14 Jul 2023 10:11:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qKEpn-00075h-FW; Fri, 14 Jul 2023 10:11:31 +0100
Date: Fri, 14 Jul 2023 10:11:31 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 0/3] Remove some unused phylink legacy
Message-ID: <ZLERQ2OBrv44Ppyc@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_021149_998545_FB978EBF 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Hi,

I believe we are now in a position where some of the legacy phylink code
can be removed!

I believe that all DSA drivers do not make use of any pre-March 2020
phylink behaviour - all drivers now seem to set legacy_pre_march2020 to
false, and the conditions that DSA sets it to true are no longer
satisifed by any driver.

Moreover, no one uses the .mac_an_restart() method, so this can also be
removed.

 drivers/net/dsa/b53/b53_common.c       |  6 -----
 drivers/net/dsa/lan9303-core.c         |  6 -----
 drivers/net/dsa/microchip/ksz_common.c |  2 --
 drivers/net/dsa/mt7530.c               |  6 -----
 drivers/net/dsa/mv88e6xxx/chip.c       |  4 ----
 drivers/net/dsa/ocelot/felix.c         |  6 -----
 drivers/net/dsa/qca/qca8k-8xxx.c       |  2 --
 drivers/net/dsa/sja1105/sja1105_main.c |  6 -----
 drivers/net/phy/phylink.c              | 22 ++++++++----------
 include/linux/phylink.h                | 12 ----------
 include/net/dsa.h                      |  3 ---
 net/dsa/port.c                         | 41 ----------------------------------
 12 files changed, 9 insertions(+), 107 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

