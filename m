Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8100EC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Apr 2024 00:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3DZb3ywACNyNhOHs2fIbalH64ca3xWE5isDL8CtTsg=; b=TBB52d7JDH5t1ctoIiipBTbdIA
	xapqjztsbOaWd5xdA4ohqV3fM29MmhDIXmJvb8K65JACHxahrOAx5sVz3h3F8dOtlhd5vwYIB8aym
	E7K51TdDg2i8A1zP5wtjkmWhbcI5neXSU24OI0K3VhOhfN8f+7m+CYu6xqolzCQvgvLgJePNtARoh
	QITj4X87tBJBhFapeCTIP/rZLSm0yA/UJg9ePcMAjp06qXwygx/U3DXIINOcy4onetypCKGSseB00
	TTL/JMnRfUaJaitVSopCuBzBQQVotYUV8PHVhkviTlfl1QvlBW3xbK2NX2kCjg/94ynYHfOK5RFqB
	O59PJkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryKlR-00000009Rio-1bZQ;
	Sun, 21 Apr 2024 00:09:01 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryKlM-00000009Rhq-3OFH;
	Sun, 21 Apr 2024 00:08:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1ryKl5-0000000045H-02wC;
	Sun, 21 Apr 2024 00:08:39 +0000
Date: Sun, 21 Apr 2024 01:08:31 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: phy: mediatek-ge-soc: follow netdev LED trigger
 semantics
Message-ID: <4983a6b197ed999808c5690d01ec1ffb4f6407b7.1713656093.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_170857_071987_1E9F2592 
X-CRM114-Status: GOOD (  12.39  )
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

Only blink if the link is up on a LED which is programmed to also
indicate link-status.

Otherwise, if both LEDs are in use to indicate different speeds, the
resulting blinking being inverted on LEDs which aren't switched on at
a specific speed is quite counter-intuitive.

Also make sure that state left behind by reset or the bootloader is
recognized correctly including the half-duplex and full-duplex bits as
well as the (unsupported by Linux netdev trigger semantics) link-down
bit.

Fixes: c66937b0f8db ("net: phy: mediatek-ge-soc: support PHY LEDs")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/mediatek-ge-soc.c | 43 +++++++++++++++++++------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index 0f3a1538a8b8..f4f9412d0cd7 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -216,6 +216,9 @@
 #define   MTK_PHY_LED_ON_LINK1000		BIT(0)
 #define   MTK_PHY_LED_ON_LINK100		BIT(1)
 #define   MTK_PHY_LED_ON_LINK10			BIT(2)
+#define   MTK_PHY_LED_ON_LINK			(MTK_PHY_LED_ON_LINK10 |\
+						 MTK_PHY_LED_ON_LINK100 |\
+						 MTK_PHY_LED_ON_LINK1000)
 #define   MTK_PHY_LED_ON_LINKDOWN		BIT(3)
 #define   MTK_PHY_LED_ON_FDX			BIT(4) /* Full duplex */
 #define   MTK_PHY_LED_ON_HDX			BIT(5) /* Half duplex */
@@ -231,6 +234,12 @@
 #define   MTK_PHY_LED_BLINK_100RX		BIT(3)
 #define   MTK_PHY_LED_BLINK_10TX		BIT(4)
 #define   MTK_PHY_LED_BLINK_10RX		BIT(5)
+#define   MTK_PHY_LED_BLINK_RX			(MTK_PHY_LED_BLINK_10RX |\
+						 MTK_PHY_LED_BLINK_100RX |\
+						 MTK_PHY_LED_BLINK_1000RX)
+#define   MTK_PHY_LED_BLINK_TX			(MTK_PHY_LED_BLINK_10TX |\
+						 MTK_PHY_LED_BLINK_100TX |\
+						 MTK_PHY_LED_BLINK_1000TX)
 #define   MTK_PHY_LED_BLINK_COLLISION		BIT(6)
 #define   MTK_PHY_LED_BLINK_RX_CRC_ERR		BIT(7)
 #define   MTK_PHY_LED_BLINK_RX_IDLE_ERR		BIT(8)
@@ -1247,11 +1256,9 @@ static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
 	if (blink < 0)
 		return -EIO;
 
-	if ((on & (MTK_PHY_LED_ON_LINK1000 | MTK_PHY_LED_ON_LINK100 |
-		   MTK_PHY_LED_ON_LINK10)) ||
-	    (blink & (MTK_PHY_LED_BLINK_1000RX | MTK_PHY_LED_BLINK_100RX |
-		      MTK_PHY_LED_BLINK_10RX | MTK_PHY_LED_BLINK_1000TX |
-		      MTK_PHY_LED_BLINK_100TX | MTK_PHY_LED_BLINK_10TX)))
+	if ((on & (MTK_PHY_LED_ON_LINK | MTK_PHY_LED_ON_FDX | MTK_PHY_LED_ON_HDX |
+		   MTK_PHY_LED_ON_LINKDOWN)) ||
+	    (blink & (MTK_PHY_LED_BLINK_RX | MTK_PHY_LED_BLINK_TX)))
 		set_bit(bit_netdev, &priv->led_state);
 	else
 		clear_bit(bit_netdev, &priv->led_state);
@@ -1269,7 +1276,7 @@ static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
 	if (!rules)
 		return 0;
 
-	if (on & (MTK_PHY_LED_ON_LINK1000 | MTK_PHY_LED_ON_LINK100 | MTK_PHY_LED_ON_LINK10))
+	if (on & MTK_PHY_LED_ON_LINK)
 		*rules |= BIT(TRIGGER_NETDEV_LINK);
 
 	if (on & MTK_PHY_LED_ON_LINK10)
@@ -1287,10 +1294,10 @@ static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
 	if (on & MTK_PHY_LED_ON_HDX)
 		*rules |= BIT(TRIGGER_NETDEV_HALF_DUPLEX);
 
-	if (blink & (MTK_PHY_LED_BLINK_1000RX | MTK_PHY_LED_BLINK_100RX | MTK_PHY_LED_BLINK_10RX))
+	if (blink & MTK_PHY_LED_BLINK_RX)
 		*rules |= BIT(TRIGGER_NETDEV_RX);
 
-	if (blink & (MTK_PHY_LED_BLINK_1000TX | MTK_PHY_LED_BLINK_100TX | MTK_PHY_LED_BLINK_10TX))
+	if (blink & MTK_PHY_LED_BLINK_TX)
 		*rules |= BIT(TRIGGER_NETDEV_TX);
 
 	return 0;
@@ -1323,15 +1330,19 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 		on |= MTK_PHY_LED_ON_LINK1000;
 
 	if (rules & BIT(TRIGGER_NETDEV_RX)) {
-		blink |= MTK_PHY_LED_BLINK_10RX  |
-			 MTK_PHY_LED_BLINK_100RX |
-			 MTK_PHY_LED_BLINK_1000RX;
+		blink |= (on & MTK_PHY_LED_ON_LINK) ?
+			  (((on & MTK_PHY_LED_ON_LINK10) ? MTK_PHY_LED_BLINK_10RX : 0) |
+			   ((on & MTK_PHY_LED_ON_LINK100) ? MTK_PHY_LED_BLINK_100RX : 0) |
+			   ((on & MTK_PHY_LED_ON_LINK1000) ? MTK_PHY_LED_BLINK_1000RX : 0)) :
+			  MTK_PHY_LED_BLINK_RX;
 	}
 
 	if (rules & BIT(TRIGGER_NETDEV_TX)) {
-		blink |= MTK_PHY_LED_BLINK_10TX  |
-			 MTK_PHY_LED_BLINK_100TX |
-			 MTK_PHY_LED_BLINK_1000TX;
+		blink |= (on & MTK_PHY_LED_ON_LINK) ?
+			  (((on & MTK_PHY_LED_ON_LINK10) ? MTK_PHY_LED_BLINK_10TX : 0) |
+			   ((on & MTK_PHY_LED_ON_LINK100) ? MTK_PHY_LED_BLINK_100TX : 0) |
+			   ((on & MTK_PHY_LED_ON_LINK1000) ? MTK_PHY_LED_BLINK_1000TX : 0)) :
+			  MTK_PHY_LED_BLINK_TX;
 	}
 
 	if (blink || on)
@@ -1344,9 +1355,7 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 				MTK_PHY_LED0_ON_CTRL,
 			     MTK_PHY_LED_ON_FDX     |
 			     MTK_PHY_LED_ON_HDX     |
-			     MTK_PHY_LED_ON_LINK10  |
-			     MTK_PHY_LED_ON_LINK100 |
-			     MTK_PHY_LED_ON_LINK1000,
+			     MTK_PHY_LED_ON_LINK,
 			     on);
 
 	if (ret)
-- 
2.44.0


