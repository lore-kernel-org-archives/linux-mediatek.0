Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C3EC7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCWlB98ZjrrVV4FLrz+myH0C2AtSbTflHoFyq21uLP8=; b=jTOUv7YGtpYHLEzqnD3EicdctD
	iMuGFkXvHjb9nY4SPUJemn+nomzApCo+JeXExZpCQO2xxovZYNiWNTapweGj+4A1D7FZo93moDBl1
	gEMjWHJqewe7k6sH/d2rEDsA4JD5jhGCgDyQhBXyp/O+sTQASJrHHeAySettc+UAYmLHRHF08bDYD
	+W3wDS7YFXY8Xc3hH76Uh9cpjiHWgF4vFTvSXMxWXD8XdYe+ZI5jLr3YW2/OCnCCH9jgd5KzuSEt5
	1/9Fu+M20g8FR/gSESzNH9gBRMML8GIX5D/fU2yc8GYfz+1jOPyNnzI6S/Jt9nFPUA2YbWY+6RgBO
	PD+bitMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsjd-007Bmj-1Z;
	Wed, 10 May 2023 22:56:37 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsjZ-007Blf-38;
	Wed, 10 May 2023 22:56:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwsjY-0004QI-1d;
	Wed, 10 May 2023 22:56:32 +0000
Date: Thu, 11 May 2023 00:54:36 +0200
From: Chukun Pan <amadeus@jmu.edu.cn>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net-next 2/8] net: phy: realtek: switch interface mode for
 RTL822x series
Message-ID: <537a12131132614ce9600ca9370dab823a262347.1683756691.git.daniel@makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_155634_007883_8A83FD14 
X-CRM114-Status: GOOD (  12.60  )
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

The RTL822x phy can work in Cisco SGMII and 2500BASE-X modes respectively.
Add interface automatic switching MAC-side interface mode for RTL822x
phy to match various wire speeds when using Clause-45 MDIO.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/realtek.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index a7dd5a075135..4a2c1ad02d48 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -684,6 +684,25 @@ static int rtl822x_config_aneg(struct phy_device *phydev)
 	return __genphy_config_aneg(phydev, ret);
 }
 
+static void rtl822x_update_interface(struct phy_device *phydev)
+{
+	/* Automatically switch SERDES interface between
+	 * SGMII and 2500-BaseX according to speed.
+	 */
+	switch (phydev->speed) {
+	case SPEED_2500:
+		phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
+		break;
+	case SPEED_1000:
+	case SPEED_100:
+	case SPEED_10:
+		phydev->interface = PHY_INTERFACE_MODE_SGMII;
+		break;
+	default:
+		break;
+	}
+}
+
 static int rtl822x_read_status(struct phy_device *phydev)
 {
 	int ret;
@@ -702,11 +721,14 @@ static int rtl822x_read_status(struct phy_device *phydev)
 			phydev->lp_advertising, lpadv & RTL_LPADV_2500FULL);
 	}
 
-	ret = genphy_read_status(phydev);
+	ret = rtlgen_read_status(phydev);
 	if (ret < 0)
 		return ret;
 
-	return rtlgen_get_speed(phydev);
+	if (phydev->is_c45 && phydev->link)
+		rtl822x_update_interface(phydev);
+
+	return 0;
 }
 
 static bool rtlgen_supports_2_5gbps(struct phy_device *phydev)
-- 
2.40.0


