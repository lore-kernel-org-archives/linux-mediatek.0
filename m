Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097F5C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 03:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G5NEhko4JXxYmLxhzCwpLP2OhNuJ/Xt7AkxACKjpuGE=; b=Krl8RDq7KmZr9dSVVoauys8D7V
	BDpACOyR1uI72HCXRSKZEcsGYVXrPgYjPZIC339S3Tj2qScUF6Yf5/nSaVoJnDDc1eCacLQ5fAajm
	RwYkcYrfiNYb8h7UUc5V/BNYG7CAsJpL8ixQf9yOsLQKCxOr0+XfLiMDfJR7LOsUR9vNyDW41XU03
	hX2+39Bp28JZ8MoAQ/YU+TZyyIInn+5tdEx5Zo1NaPoR2cg1Y57e0ysKUGwmuQUkbAI/Mnt21kDEK
	mp1wblnRxCnxsl61Vk655vgnCrxRw14WgMBNwzt6iSjD6Kff/y9st0OSAvJ5jsJ3yjRGgBRxAdxhb
	mbPKZcbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5fEK-0063UQ-MR; Thu, 15 Dec 2022 03:48:20 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5fE9-0063PY-Sz; Thu, 15 Dec 2022 03:48:11 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1p5fE5-0003wP-G6; Thu, 15 Dec 2022 04:48:05 +0100
Date: Thu, 15 Dec 2022 03:47:59 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH net v3] net: dsa: mt7530: remove redundant assignment
Message-ID: <Y5qY7x6la5TxZxzX@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_194809_961117_EAA76F27 
X-CRM114-Status: UNSURE (   9.33  )
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

Fixes: e19de30d2080 ("net: dsa: mt7530: add support for in-band link status")
Reported-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v2: correct commit title 'reduntant' -> 'redundant'
Changes since v1: Use 12 chars for fixes tag, fix Russell's contact

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

base-commit: 7e68dd7d07a28faa2e6574dd6b9dbd90cdeaae91
-- 
2.39.0


