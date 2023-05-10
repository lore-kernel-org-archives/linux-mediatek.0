Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389E4C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIiS0fWEVQ/Ll22Lnm0hVFBDGpomp5UcSojoTi9HQnU=; b=hnPVkCYAZz5W9fSsjT16kLUvp0
	0+KkLF+20NmmiJbxG7tTpDO4wOCk21v3vrjnmz2BOqiE/7tnPInQ/2EPY5RrDDDsJNPMThlNNBdZr
	PdpP5B2wl43/t+av0yeDWYljquZVw4eR+Scw0ehng7l/+wk69TyUbNS5z4EvzXgmLt5lBRU9PIdyW
	wywTWsNr+MT6TpN4LQ8yVFHqvYMlFBPP6lM5nfBGc3HWahtoIH/He/Ut8+l/Pycg6zIjQIiILG7+q
	3+A6CwhU2M4xBSOr9yKaUtrv/mQwNeC/bgli1E2rlKei9NgRf3KwjVyRv42oD50fRTaGlxIDPZTEG
	Ir/WEdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsnZ-007CYn-11;
	Wed, 10 May 2023 23:00:41 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsnX-007CYD-1Q;
	Wed, 10 May 2023 23:00:40 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwsnU-0004Uo-0h;
	Wed, 10 May 2023 23:00:36 +0000
Date: Thu, 11 May 2023 00:58:42 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net-next 5/8] net: phy: realtek: make sure paged read is
 protected by mutex
Message-ID: <d56ee0a8fce63beb3916caff3ebc38f8fc562c52.1683756691.git.daniel@makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_160039_482434_D139443A 
X-CRM114-Status: GOOD (  11.21  )
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

As we cannot rely on phy_read_paged function before the PHY is
identified, the paged read in rtlgen_supports_2_5gbps needs to be open
coded as it is being called by the match_phy_device function, ie. before
.read_page and .write_page have been populated.

Make sure it is also protected by the MDIO bus mutex and use
rtl821x_write_page instead of 3 individually locked MDIO bus operations.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/realtek.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index acadb6f0057b..e6a46c4d97b1 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -744,9 +744,11 @@ static bool rtlgen_supports_2_5gbps(struct phy_device *phydev)
 {
 	int val;
 
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0xa61);
-	val = phy_read(phydev, 0x13);
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0);
+	phy_lock_mdio_bus(phydev);
+	rtl821x_write_page(phydev, 0xa61);
+	val = __phy_read(phydev, 0x13);
+	rtl821x_write_page(phydev, 0);
+	phy_unlock_mdio_bus(phydev);
 
 	return val >= 0 && val & RTL_SUPPORTS_2500FULL;
 }
-- 
2.40.0


