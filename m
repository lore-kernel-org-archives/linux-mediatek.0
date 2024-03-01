Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD99C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLRScSRbeiXkqoMwIrGrlGE4z/Gkx7qoZPO6bnKhtt4=; b=DZYrcgqymcen/k+e/egqnxcb0W
	txC10Ldgj5fIHnBH3e2+HcJv+Lw7THbOYR6+9wVZ2LyYZtAm1qOpzc9Lgll22yZ6sqedgEQXDElzp
	YGA29ecU+P6DHv/nDLDp7kDqnVh7eajdX6zBlzBGGs5GHACpg/UD60UI7trbclPytCxLEkFlyN0JD
	kmYCh41KZPHyIhNAZ+P7gEibd2w1xU2U1YcMtr/KXxG3LvTgG6rxb+KzyulXmn011rr7JkqeV85oC
	dVrel/gOlo/8wGNmmaZaaY2uSFUH4iVB3x+VZg5341XZ1cpkdVYZI3fn2Av2t2COWL4Z47BvXIH6a
	3VZ17Hcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0M7-0000000HPGz-3Iz7;
	Fri, 01 Mar 2024 10:43:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0M0-0000000HPB9-0EoU;
	Fri, 01 Mar 2024 10:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F22A60FED;
	Fri,  1 Mar 2024 10:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1AF6C433C7;
	Fri,  1 Mar 2024 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709289778;
	bh=r9/r4cAgofxq2YbjbbxXvYSIDlSWSINkDrq9AA9RzRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dI/2KUcd+fDTnT/+PqCQ8mdvjUgbLe0MVjTKrAyNZtblt93VTNTsX2QzNWKKvzPpP
	 tSxd8mZXVuAIWilRyZrYLCIgDVQL8z1i2q9RXscAUVKsnUyPg9H9PIeVnfc1AMActj
	 ryD8dfnIV802q2fQ703U0n4/0fmhVW+0m7Q+W6KbAnyYdZExhvQIW7AXvJtShUntez
	 Zo8Jbl5PJ2aXv1Wc0vtzSqFyg5If7MH3d20fh9Umz7hd1xOc4o0opz19y18zjuyLCO
	 +5R1HOc0b4F0IOcMD19aVReofAq5LMqo8LxUYAQ94B/id8kbfQm2YPhEEDRDaKJQVP
	 4R3K2bRcnhkzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DB0C5475B;
	Fri,  1 Mar 2024 10:42:58 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 01 Mar 2024 12:42:57 +0200
Subject: [PATCH net-next v3 1/9] net: dsa: mt7530: remove .mac_port_config
 for MT7988 and make it optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240301-for-netnext-mt7530-improvements-3-v3-1-449f4f166454@arinc9.com>
References: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
In-Reply-To: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709289776; l=2593;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=zsBRS25Kdr7LfGGSqrR3mLbX7RMd9/oxSXqAjEC3Jr8=;
 b=5r5D4AVXyAxUEdPgPCrz37wKin9bxfUjIN/dykb87Ikxk23j7k5+Qfzu+IrpQlCIy+HkPLNwp
 30Bvz+KpQ1cBm1DesQ/ZPQww9ihyGYAPYcI3kkJBYRBWxjY1Cu9xDRw
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront with auth_id=137
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_024300_250802_F0817E4C 
X-CRM114-Status: GOOD (  13.23  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

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
index 03d966fa67b2..94d4b2c87799 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2655,17 +2655,6 @@ static bool mt753x_is_mac_port(u32 port)
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
@@ -2706,6 +2695,9 @@ mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 {
 	struct mt7530_priv *priv = ds->priv;
 
+	if (!priv->info->mac_port_config)
+		return 0;
+
 	return priv->info->mac_port_config(ds, port, mode, state->interface);
 }
 
@@ -3169,7 +3161,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
 		.cpu_port_config = mt7988_cpu_port_config,
 		.mac_port_get_caps = mt7988_mac_port_get_caps,
-		.mac_port_config = mt7988_mac_config,
 	},
 };
 EXPORT_SYMBOL_GPL(mt753x_table);
@@ -3197,8 +3188,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
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


