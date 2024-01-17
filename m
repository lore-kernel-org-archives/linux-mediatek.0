Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84B3C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXWUjNaGIZKQQKNV/kiV1uX5wrj6ERGvXpYFW45HGbY=; b=JzIrdReIki1oLVdtxopyeI5tha
	B1U9LBklQY0q2OQhrAD3FqELpMsCAH1LZ93KiIwIaiA7sek3LodUxOnpHkeCGys37laekSWlLu48D
	6G2lSpDT2qUaJm091RqzUG2TaovpUOplRIPr49UAlkcY8up+qhoQclQlT/aOmJfKll2touyn8MHTb
	d8nSc1JqHA5zFK8AnbFXCwrqg11R2BuZhdpxh6pkNrxAOJEKO3MAKwT7lADc3ojp3Ccsyv+WZpnfx
	aVtjAovxHzqPJfO7t+MaxX2i4SfmWqayM3nCWxW4Y3ZdhGKSFsIBJGKLt9+XqKYfjp0/mNTLkQg73
	DitLXdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3AO-00FGn7-2W;
	Wed, 17 Jan 2024 10:29:04 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3AG-00FGim-2a;
	Wed, 17 Jan 2024 10:28:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 076F040005;
	Wed, 17 Jan 2024 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705487335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wXWUjNaGIZKQQKNV/kiV1uX5wrj6ERGvXpYFW45HGbY=;
	b=F9hSMZOUoa/lpT93bxRiXpUAWBvzwQlyxN18I37tXN3aIEgQfj88tQntRdw05UNwDgK0vm
	s9EbDS67mTCM8PxFCPIC0WD+6azj4DzlfaqSG0Rba/8+Q86TmjdTXlQEQjOOVMKfI47Sbu
	ALaoHl8Wxuc96W8I47IdS4OEIxuPKo0NoMd8797MGHLOuXEqGQ7M29D2jcYE8eQrXUFyHo
	6F1SdrstN+4+Pct64bi+WpYJTo3D8tH+Uk2ZatYZsjeyOKGVa/YbUXyYOGt2KyqXUSddzf
	V4D2PGMs7ZCEK1NM4Fciiz6JmeUj+l1B9z6OxCzQOXndX2aRMpXaUin2MXrPHw==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 1/8] net: dsa: mt7530: remove .mac_port_config for MT7988 and make it optional
Date: Wed, 17 Jan 2024 13:28:31 +0300
Message-Id: <20240117102838.57445-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240117102838.57445-1-arinc.unal@arinc9.com>
References: <20240117102838.57445-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_022857_134027_0EC5FCC6 
X-CRM114-Status: GOOD (  13.89  )
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

For the switch on the MT7988 SoC, the mac_port_config member for ID_MT7988
in mt753x_table is not needed as the interfaces of all MACs are already
handled on mt7988_mac_port_get_caps().

Therefore, remove the mac_port_config member from ID_MT7988 in
mt753x_table. Before calling priv->info->mac_port_config(), if there's no
mac_port_config member in mt753x_table, exit mt753x_mac_config()
successfully.

Remove calling priv->info->mac_port_config() from the sanity check as the
sanity check requires a pointer to a mac_port_config function to be
non-NULL. This will fail for MT7988 as mac_port_config won't be a member of
its info table.

Co-developed-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8945493f9e50..c55edbda32bd 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2638,17 +2638,6 @@ static bool mt753x_is_mac_port(u32 port)
 	return (port == 5 || port == 6);
 }
 
-static int
-mt7988_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
-		  phy_interface_t interface)
-{
-	if (dsa_is_cpu_port(ds, port) &&
-	    interface == PHY_INTERFACE_MODE_INTERNAL)
-		return 0;
-
-	return -EINVAL;
-}
-
 static int
 mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
@@ -2689,6 +2678,9 @@ mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 {
 	struct mt7530_priv *priv = ds->priv;
 
+	if (!priv->info->mac_port_config)
+		return 0;
+
 	return priv->info->mac_port_config(ds, port, mode, state->interface);
 }
 
@@ -3153,7 +3145,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
 		.cpu_port_config = mt7988_cpu_port_config,
 		.mac_port_get_caps = mt7988_mac_port_get_caps,
-		.mac_port_config = mt7988_mac_config,
 	},
 };
 EXPORT_SYMBOL_GPL(mt753x_table);
@@ -3181,8 +3172,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	 * properly.
 	 */
 	if (!priv->info->sw_setup || !priv->info->phy_read_c22 ||
-	    !priv->info->phy_write_c22 || !priv->info->mac_port_get_caps ||
-	    !priv->info->mac_port_config)
+	    !priv->info->phy_write_c22 || !priv->info->mac_port_get_caps)
 		return -EINVAL;
 
 	priv->id = priv->info->id;
-- 
2.40.1


