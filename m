Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD3EC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 01:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZAdKNrLP/fWtn4zwWlSrvf7IKfltZjhJkRdzXE2ttI=; b=c35bSLpAEZhwa9Z1ESn8XBO/D6
	oltXhoeZYmzASSnog3dXgNCLqT0fBF4gAU9+BiPvgimHOzqT4zWyZJXXmgw8oPbgnlA5pMXTjkcNf
	qnWs+024xAWjzvx0+eCssKXh5xXwdKbj1FuUWl4IVvhcloXwiq9xaNRitIMwmm5q+6QcjpcbwZHLw
	30Z5xDHr7E3I7VpUzOs1/DrUNH3jot2/ep4c2l+ptTyqcB6UySqjlDdXlP/jaIC7TZRNrftawp1x/
	RSJ9tUTxfE0ExQNXkGCONqYQLSFDNWyJ595db3HGyMbhb9Ymp1ar/gbjcfFdSbslb8fWPc2adE7pK
	vBZdI6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj8qD-00DhT4-1i;
	Mon, 03 Apr 2023 01:18:37 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj8qA-00DhPC-0y;
	Mon, 03 Apr 2023 01:18:35 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pj8q8-0004jw-1f;
	Mon, 03 Apr 2023 03:18:32 +0200
Date: Mon, 3 Apr 2023 02:18:28 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>
Cc: Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH net-next v2 07/14] net: dsa: mt7530: move p5_intf_modes()
 function to mt7530.c
Message-ID: <f466e49e811b0f1dab3854dd36b9522cf7e8831a.1680483896.git.daniel@makrotopia.org>
References: <cover.1680483895.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680483895.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_181834_340485_D424C412 
X-CRM114-Status: GOOD (  12.55  )
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

In preparation of splitting mt7530.c into a driver for MDIO-connected
as well as MDIO-accessed built-in switches on one hand and MMIO-accessed
built-in switches move the p5_inft_modes() function from mt7530.h to
mt7530.c. The function is only needed there and will trigger a compiler
warning about a defined but unused function otherwise when including
mt7530.h in the to-be-introduced bus-specific drivers.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/mt7530.c | 18 ++++++++++++++++++
 drivers/net/dsa/mt7530.h | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9d49cbc8ddcb2..1215d5e4dd38a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -943,6 +943,24 @@ mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 	return 0;
 }
 
+static const char *p5_intf_modes(unsigned int p5_interface)
+{
+	switch (p5_interface) {
+	case P5_DISABLED:
+		return "DISABLED";
+	case P5_INTF_SEL_PHY_P0:
+		return "PHY P0";
+	case P5_INTF_SEL_PHY_P4:
+		return "PHY P4";
+	case P5_INTF_SEL_GMAC5:
+		return "GMAC5";
+	case P5_INTF_SEL_GMAC5_SGMII:
+		return "GMAC5_SGMII";
+	default:
+		return "unknown";
+	}
+}
+
 static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 39aaca50961bd..2a611173a7d08 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -682,24 +682,6 @@ enum p5_interface_select {
 	P5_INTF_SEL_GMAC5_SGMII,
 };
 
-static const char *p5_intf_modes(unsigned int p5_interface)
-{
-	switch (p5_interface) {
-	case P5_DISABLED:
-		return "DISABLED";
-	case P5_INTF_SEL_PHY_P0:
-		return "PHY P0";
-	case P5_INTF_SEL_PHY_P4:
-		return "PHY P4";
-	case P5_INTF_SEL_GMAC5:
-		return "GMAC5";
-	case P5_INTF_SEL_GMAC5_SGMII:
-		return "GMAC5_SGMII";
-	default:
-		return "unknown";
-	}
-}
-
 struct mt7530_priv;
 
 struct mt753x_pcs {
-- 
2.40.0


