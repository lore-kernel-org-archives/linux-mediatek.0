Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CC1C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcR19n1jDxBUupnqYv6z29UpOBYVbpXsCvGX6v7zcG0=; b=HZchVK8BVzQZLnSv5lgrnZexWC
	P2CkbCO6jkl8PDXglzLGs4Sv8hdAwJl4mp9NjC83LYONF3Y5TUdun9DY92b/sIkOTVOGX5cFgGZP0
	mX8ZqPc2cOEt7Uw4DZoapTathp8D+uzQkCz9q8d2p8L+lLB1NNpSLRC2tKPszlEeW2pby6PwlnXqo
	BGNz+x4oaqyKw4MXzh70JlpUlAoOYy4YoxovgKCXH1b4rbC/220yTEj3IIOMceSXkMtbXj7ep9y4k
	cA7WCjDgV3Ruxyel6dj7ikdCzXr2FcfDO8uTHyPCTRsVuNON023rx3ucq1Yo9Oilo/a1Y8E+u9GTu
	VkUZaswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUoN-0053q9-T2; Thu, 19 Jan 2023 13:18:35 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUeA-004zjb-S1; Thu, 19 Jan 2023 13:08:05 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 95AB41A20;
	Thu, 19 Jan 2023 14:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1674133680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mcR19n1jDxBUupnqYv6z29UpOBYVbpXsCvGX6v7zcG0=;
	b=NDLWWYBkTVutRYnfjXhxKtQozJCPobbGKm41FWp+lv8xA3rDIuiWCWKrv9GVJp96TIMats
	YGVT1PCNvNvAIQpAdLGx1udVKsm/uaFfQrMU/5uVfVmvD3+ysuMEyqVFm3RHlurOjDsJ8g
	6DrjmliJLYEjoFZ/xuPUk1XOT5nPSnI6HQT5wYO2ZMgmp9YMp1xXc1ievjfY6aBoenlMG4
	RFIcC+hEwPLqaFh2rM6rWXHcUZrCon7GsHMb7GGg2DDO+m7QkAg64xnEED8KniBp6RUcoU
	Echz3WDK71FeMKCMeY2fhmEn9LtTglFMY14GzppjgyQVDldVqeq3X4v5Ln+Njg==
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
Subject: [PATCH RESEND net-next 4/4] net: mdio: Remove support for building C45 muxed addresses
Date: Thu, 19 Jan 2023 14:07:00 +0100
Message-Id: <20230119130700.440601-5-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119130700.440601-1-michael@walle.cc>
References: <20230119130700.440601-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_050803_102251_FD3DBCE7 
X-CRM114-Status: GOOD (  13.17  )
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

The old way of performing a C45 bus transfer created a special
register value and passed it to the MDIO bus driver, in the hope it
would see the MII_ADDR_C45 bit set, and perform a C45 transfer. Now
that there is a clear separation of C22 and C45, this scheme is no
longer used. Remove all the #defines and helpers, to prevent any code
being added which tries to use it.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 include/linux/mdio.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 220f3ca8702d..c0da30d63b1d 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -10,14 +10,6 @@
 #include <linux/bitfield.h>
 #include <linux/mod_devicetable.h>
 
-/* Or MII_ADDR_C45 into regnum for read/write on mii_bus to enable the 21 bit
- * IEEE 802.3ae clause 45 addressing mode used by 10GIGE phy chips.
- */
-#define MII_ADDR_C45		(1<<30)
-#define MII_DEVADDR_C45_SHIFT	16
-#define MII_DEVADDR_C45_MASK	GENMASK(20, 16)
-#define MII_REGADDR_C45_MASK	GENMASK(15, 0)
-
 struct gpio_desc;
 struct mii_bus;
 struct reset_control;
@@ -463,16 +455,6 @@ static inline int mdiodev_modify_changed(struct mdio_device *mdiodev,
 				      mask, set);
 }
 
-static inline u16 mdiobus_c45_regad(u32 regnum)
-{
-	return FIELD_GET(MII_REGADDR_C45_MASK, regnum);
-}
-
-static inline u16 mdiobus_c45_devad(u32 regnum)
-{
-	return FIELD_GET(MII_DEVADDR_C45_MASK, regnum);
-}
-
 static inline int mdiodev_c45_modify(struct mdio_device *mdiodev, int devad,
 				     u32 regnum, u16 mask, u16 set)
 {
-- 
2.30.2


