Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDC8C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jan 2022 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KO0LccZCcgx65aYZlKLz7MAYNKKqtm6AeaXmtYVubs8=; b=ZXVX+FTlD6S36o
	yq3TApV6Fba6otXLT/IyDKJCgvi/Dywke++YzrLw2jDU6yRo5R0EnBIYn0TvcQwrcgPVl26yYo24k
	aIJg1eCQ5IDxYQT8CLLzYPEMOnN2Pk+ylsnYLdpO4uH4Z6AdvBzYHifWY5lKx94/bV/2uG14ziTgS
	FS1lfq/TAHDzRGor3R8QSGh/FLRmUV9vT8WKR4xn6QA05ElUZZTwwfLYlqBRpRcXLO9EiUBaCwstE
	MFdZ1aDK8avA8jMFPyFI/bfKTC48UY0/FNQ5KqksB13stagWOFDX/9ozzqOBZaOzvXl7o7iK7XFqd
	bnjUEICLR40Xh6ceba/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n436g-007tTZ-Dn; Sun, 02 Jan 2022 15:49:14 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n436R-007tNC-8b; Sun, 02 Jan 2022 15:49:12 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n436P-00018X-32; Sun, 02 Jan 2022 16:48:57 +0100
Date: Sun, 2 Jan 2022 15:48:50 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Michael Lee <igvtee@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v10 2/3] net: mdio: add helpers to extract clause 45 regad
 and devad fields
Message-ID: <YdHJYuO0rYAoWAfD@makrotopia.org>
References: <YdCNZh5PsBwbfMtp@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdCNZh5PsBwbfMtp@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_074859_334989_F02964C9 
X-CRM114-Status: GOOD (  11.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Add a couple of helpers and definitions to extract the clause 45 regad
and devad fields from the regnum passed into MDIO drivers.

Tested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v10: correct order of SoB lines
v9: unchanged
v8: First inclusing upon comment on mailing list

 include/linux/mdio.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 9f3587a61e145..ecac96d52e010 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -7,6 +7,7 @@
 #define __LINUX_MDIO_H__
 
 #include <uapi/linux/mdio.h>
+#include <linux/bitfield.h>
 #include <linux/mod_devicetable.h>
 
 /* Or MII_ADDR_C45 into regnum for read/write on mii_bus to enable the 21 bit
@@ -14,6 +15,7 @@
  */
 #define MII_ADDR_C45		(1<<30)
 #define MII_DEVADDR_C45_SHIFT	16
+#define MII_DEVADDR_C45_MASK	GENMASK(20, 16)
 #define MII_REGADDR_C45_MASK	GENMASK(15, 0)
 
 struct gpio_desc;
@@ -381,6 +383,16 @@ static inline u32 mdiobus_c45_addr(int devad, u16 regnum)
 	return MII_ADDR_C45 | devad << MII_DEVADDR_C45_SHIFT | regnum;
 }
 
+static inline u16 mdiobus_c45_regad(u32 regnum)
+{
+	return FIELD_GET(MII_REGADDR_C45_MASK, regnum);
+}
+
+static inline u16 mdiobus_c45_devad(u32 regnum)
+{
+	return FIELD_GET(MII_DEVADDR_C45_MASK, regnum);
+}
+
 static inline int __mdiobus_c45_read(struct mii_bus *bus, int prtad, int devad,
 				     u16 regnum)
 {
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
