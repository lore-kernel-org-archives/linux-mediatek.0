Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8907C77B60
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgDRz6AtND+m4DB5W+DNaw4z/ta0YSzw7PR+WZ/DrKI=; b=NWbkCDFxgnhVp2u8Kl8ybPcBLO
	U9dfeX2BaNl9YrWLNkuV7gcW009AiizaaAIB7R1IaO6gJDXc6Emjxn3hVmxMBUGDi1a+92uFciDwb
	u6/dorGtZnVpuwIHpPLEnQo0GAvEuge6CxAhOH7TbVhZUGFP23rXXacYM1p1EH1l9RP2bgHsMLgIa
	dzSbjnuJSQ3ihFgOVgHjz78ddbpJtUsfTfIx1OTbSLuX+RIaIUhBmwc7tz8ix7z+PgKCNZElrPFzZ
	hLLAdR3xiEtykKiJeEaxQMkjmHPNcf1Wg6bA76DugXjre5mU2oAjF7SUgy1l0ZHbjKN1uHUnFJycX
	Uq1jYkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu7W-004EiO-0I;
	Thu, 30 Mar 2023 15:23:22 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phu7S-004Efj-16;
	Thu, 30 Mar 2023 15:23:19 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phu7Q-0006kH-1P;
	Thu, 30 Mar 2023 17:23:16 +0200
Date: Thu, 30 Mar 2023 16:23:13 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
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
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH net-next 12/15] net: dsa: mt7530: skip locking if MDIO bus
 isn't present
Message-ID: <10cf68a82095fc136c1bb1af3f48bb3fef21e71b.1680180959.git.daniel@makrotopia.org>
References: <cover.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_082318_382854_20B4AFC4 
X-CRM114-Status: GOOD (  11.79  )
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

As MT7530 and MT7531 internally use 32-bit wide registers, each access
to any register of the switch requires several operations on the MDIO
bus. Hence if there is congruent access, e.g. due to PCS or PHY
polling, this can mess up and interfere with another ongoing register
access sequence.

However, the MDIO bus mutex is only relevant for MDIO-connected
switches. Prepare switches which have there registers directly mapped
into the SoCs register space via MMIO which do not require such
locking. There we can simply use regmap's default locking mechanism.

Hence guard mutex operations to only be performed in case of MDIO
connected switches.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index ea8d8e669aacc..3a4682e71e746 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -145,13 +145,15 @@ core_write_mmd_indirect(struct mt7530_priv *priv, int prtad,
 static void
 mt7530_mutex_lock(struct mt7530_priv *priv)
 {
-	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+	if (priv->bus)
+		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
 }
 
 static void
 mt7530_mutex_unlock(struct mt7530_priv *priv)
 {
-	mutex_unlock(&priv->bus->mdio_lock);
+	if (priv->bus)
+		mutex_unlock(&priv->bus->mdio_lock);
 }
 
 static void
-- 
2.39.2


