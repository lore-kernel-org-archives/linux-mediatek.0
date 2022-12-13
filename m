Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276D2C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 04:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QjV0OzaXewluvRV60JQ8aCzEswAOLfGSwPlQZNEryk=; b=jAIw2kQM63rAyi5D0TufKp5Sj4
	ADVD7wdvSpiLCXK5Uu3h9ADLudDV+wJ4GcMlB86Yoj6IFRQrukYdfjHVMJd/SprVvqQR1cOp6lN3P
	74sez0L1qxMeFxwqx+eBqQVkE/yZDYXNDf3nt25SZd48McFoyEl+P9nVoCP97+hvJtV5gbZtrd98g
	KvoVpRA0KWHH/UkscFxcO4zcqC3We3BntDW7yya5imFHn9A8CxoEj20w39NcfNnSFeHf0UkS3dOoi
	t+7IXYJbCgauWVp8IhqOS9Auo0lS/WrrziSViSzADJ7UXmX5Ngr/s8bhGuraJ7S/Mn/H7jKzEr6wd
	Vhh0jGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4waT-00Atto-Lu; Tue, 13 Dec 2022 04:08:13 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4waJ-00AtU8-GB; Tue, 13 Dec 2022 04:08:04 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1p4wZz-0008NT-46; Tue, 13 Dec 2022 05:07:43 +0100
Date: Tue, 13 Dec 2022 04:07:35 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH net-next] net: dsa: mt7530: remove reduntant assignment
Message-ID: <Y5f6h8q7rlnk1jnD@makrotopia.org>
References: <Y5b/Tm4GwPGzd9sR@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5b/Tm4GwPGzd9sR@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_200803_567076_94C62478 
X-CRM114-Status: UNSURE (   9.85  )
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

Russell King correctly pointed out that the MAC_2500FD capability is
already added for port 5 (if not in RGMII mode) and port 6 (which only
supports SGMII) by mt7531_mac_port_get_caps. Remove the reduntant
setting of this capability flag which was added by a previous commit.

Fixes: e19de30d20 ("net: dsa: mt7530: add support for in-band link status")
Reported-by: Russell King <linux@armlinux.org.uk>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e74c6b406172..908fa89444c9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2919,9 +2919,6 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 				   MAC_10 | MAC_100 | MAC_1000FD;
 
-	if ((priv->id == ID_MT7531) && mt753x_is_mac_port(port))
-		config->mac_capabilities |= MAC_2500FD;
-
 	/* This driver does not make use of the speed, duplex, pause or the
 	 * advertisement in its mac_config, so it is safe to mark this driver
 	 * as non-legacy.
-- 
2.39.0


