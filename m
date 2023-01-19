Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D943BC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khuF9D5aRrU+RqS5yxEYYs8dKhh0RK9DJlZz4Fdm+kU=; b=QVEp7a069GrHcGyIFOmSDF2W6+
	I5wsd+Urlm5z+NSiSrJ39cKj9KM1GhjvR1EzQJ3ALemLYTxwVBfR2vezzgOeh21Nz7AnJvUEhUWAa
	RlrmXuheiV9+nhBUuNGRh2ZyKcHvGmfZkouPubs2JK/ao/HPyFRrJPFVO8/UD7ADRr9SQ02rPjoX4
	Akm/EE4z5Fh45cqrK8AoRxJfUL/QFJLuOiZCTxWEZXtLV0Qs/yZEbehpyCbDb9zoF9RLWTqUesfl0
	ywVFShDASK5Y7ZQEx7kouTaYhxJtMYO0BaVV1rtXQ87y11VnlNkTCFpcXXtUb9qGTVBgZ6ftDzYEG
	b6OfSDLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUmq-00538a-Md; Thu, 19 Jan 2023 13:17:00 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUe8-004zhF-OR; Thu, 19 Jan 2023 13:08:03 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4F8C518D8;
	Thu, 19 Jan 2023 14:07:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1674133678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=khuF9D5aRrU+RqS5yxEYYs8dKhh0RK9DJlZz4Fdm+kU=;
	b=ELaQzDQS/Rb8IAB9R0Pt+rIRCMsEkAtSuwUypOhzEYItq8wf5369kWuR3b1vmg/r7hqSXq
	jrzs/i2jaDREjQI+27CQpIrMmgERRMP8mPnjtB6gnkma/7Q8z3r586D0X0yj6MYPVI/guN
	dFxfFIVmDq1JyKHS5rTkjoUM8S9Y02KS5A+K3BVFI4xYCNXoQc/wiaKvsrLJNM+HzmAbts
	Mrtgx/u7YFnMyB42Y2ZmYxQGn02c8oJX8s5BSx+kCkmpVdWHA5Rxoi6xj8IiTwzWdUeb2Y
	KjSAmnVlGA8Wtmk1B2LBtx1KeQ6RimYPHHgIUwGqCrBCT2PNkj+o9vj9RbjntQ==
From: Michael Walle <michael@walle.cc>
To: Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wells Lu <wellslutw@gmail.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Tobias Waldekranz <tobias@waldekranz.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH RESEND net-next 1/4] net: phy: Remove fallback to old C45 method
Date: Thu, 19 Jan 2023 14:06:57 +0100
Message-Id: <20230119130700.440601-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119130700.440601-1-michael@walle.cc>
References: <20230119130700.440601-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_050801_037326_DA570EB9 
X-CRM114-Status: GOOD (  10.85  )
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

From: Andrew Lunn <andrew@lunn.ch>

Now that all MDIO bus drivers which support C45 implement the c45
specific ops, remove the fallback to the old method.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/phy/mdio_bus.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 132dd1f905f4..f5e319549f67 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -844,11 +844,6 @@ int __mdiobus_modify_changed(struct mii_bus *bus, int addr, u32 regnum,
 }
 EXPORT_SYMBOL_GPL(__mdiobus_modify_changed);
 
-static u32 mdiobus_c45_addr(int devad, u16 regnum)
-{
-	return MII_ADDR_C45 | devad << MII_DEVADDR_C45_SHIFT | regnum;
-}
-
 /**
  * __mdiobus_c45_read - Unlocked version of the mdiobus_c45_read function
  * @bus: the mii_bus struct
@@ -869,7 +864,7 @@ int __mdiobus_c45_read(struct mii_bus *bus, int addr, int devad, u32 regnum)
 	if (bus->read_c45)
 		retval = bus->read_c45(bus, addr, devad, regnum);
 	else
-		retval = bus->read(bus, addr, mdiobus_c45_addr(devad, regnum));
+		retval = -EOPNOTSUPP;
 
 	trace_mdio_access(bus, 1, addr, regnum, retval, retval);
 	mdiobus_stats_acct(&bus->stats[addr], true, retval);
@@ -900,8 +895,7 @@ int __mdiobus_c45_write(struct mii_bus *bus, int addr, int devad, u32 regnum,
 	if (bus->write_c45)
 		err = bus->write_c45(bus, addr, devad, regnum, val);
 	else
-		err = bus->write(bus, addr, mdiobus_c45_addr(devad, regnum),
-				 val);
+		err = -EOPNOTSUPP;
 
 	trace_mdio_access(bus, 0, addr, regnum, val, err);
 	mdiobus_stats_acct(&bus->stats[addr], false, err);
-- 
2.30.2


