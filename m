Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977CFC04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ/cISFaTxHBuugun+BlhWyNuMVbTAEdqW3bexgF/V4=; b=lCFY7c3YzSDjYFUL4jGmlUY9QE
	i23hd+Qg0Ufl1h9EwHPGBbicvxjgN+IeLRiw2VL1S9pFdwzOtkbsPobGQjErd+WCF2UEgclsTx356
	fqPR3IgV7pLQHwhgrtqvXChn+vY41rUzNAarjK0ZiY06wYNWD/9VdCJpXJQUtG1qDeDlzqFbKrHVc
	reon549PfbjU3QJ9TsxWAAhRNkK0Ml/TKfUJUT956Sl1fCMVdaCK/rTYnCxUl93goTM2idKyFhNJB
	m+IJEEqBo4zz02baBy9POVj/Sh1LW5PTufSxgCN/FBF4JqpWx2SR2QQTDQFgQZIOlVT3KXX/dQ9xe
	pg542tCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlCK-00000005Efe-0WyQ;
	Fri, 19 Apr 2024 10:10:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlBc-00000005ED6-1TPA;
	Fri, 19 Apr 2024 10:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2754D61962;
	Fri, 19 Apr 2024 10:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0022AC3277B;
	Fri, 19 Apr 2024 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521378;
	bh=QXo7TXAVxaylcHHjpRcvyG/89tEmiO1hQSF4FfXC2qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qgqqzKvWynmpgIFrMSIHpW8fVopOfTgvQwiqSYLktTckhPVtRVBIF58c4Vtpz8a/A
	 Rzi0bSMa30O9P2SHK1tUJOd/VG3o7PxkHGTXC8yqv4aMEBmZW7ru+NhW9vEPEINgZo
	 D9sppvQ+PKqrUFv9ebg1ffb218Hxs5RbG5AcHbDPkMcH8YaciTyb1VTwwa+ivDDuAP
	 IW3OIVIg08x7spOiuQO86rRFZ0Ckd4FNDrepOxt+u0SVPIZ4nZad+Ya3JZMqz7xmia
	 ql6HkAKCH45j8CHnOFsp4lanZ1RI3Y/PkZUHx7HM9iO2tVkygMyKNCoNKnyQ7pTadL
	 uId6WvYZBto2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3FCC04FF6;
	Fri, 19 Apr 2024 10:09:37 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 19 Apr 2024 13:09:32 +0300
Subject: [PATCH net-next 09/13] net: dsa: mt7530: define MAC speed
 capabilities per switch model
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240419-for-netnext-mt7530-improvements-4-v1-9-6d852ca79b1d@arinc9.com>
References: <20240419-for-netnext-mt7530-improvements-4-v1-0-6d852ca79b1d@arinc9.com>
In-Reply-To: <20240419-for-netnext-mt7530-improvements-4-v1-0-6d852ca79b1d@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713521374; l=2468;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=U7m+wRsPDOynbhqa9RKx+0GeC9h4YeQt1AWk+qLy0W4=;
 b=0crF93zDGKVTpjGQEtq8n4SQMOTbZYWpe6bvUZvJS7QU9rdMeKGTO+QmpVP7+g6kxdvfi9UMQ
 IdQM4xMj7CMDeXciei7AC2vbAv1xB6047R1MFchs+fdLBBzPBx8y/R5
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_030940_622878_B30701D3 
X-CRM114-Status: GOOD (  11.49  )
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

With the support of the MT7988 SoC switch, the MAC speed capabilities
defined on mt753x_phylink_get_caps() won't apply to all switch models
anymore. Move them to more appropriate locations instead of overwriting
config->mac_capabilities.

Remove the comment on mt753x_phylink_get_caps() as it's become invalid with
the support of MT7531 and MT7988 SoC switch.

Add break to case 6 of mt7988_mac_port_get_caps() to be explicit.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 4e9aa78ca3d0..8a141f849673 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2685,6 +2685,8 @@ mt7531_setup(struct dsa_switch *ds)
 static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
+	config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000FD;
+
 	switch (port) {
 	/* Ports which are connected to switch PHYs. There is no MII pinout. */
 	case 0 ... 4:
@@ -2716,6 +2718,8 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 {
 	struct mt7530_priv *priv = ds->priv;
 
+	config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000FD;
+
 	switch (port) {
 	/* Ports which are connected to switch PHYs. There is no MII pinout. */
 	case 0 ... 4:
@@ -2755,14 +2759,17 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 	case 0 ... 3:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
+
+		config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000FD;
 		break;
 
 	/* Port 6 is connected to SoC's XGMII MAC. There is no MII pinout. */
 	case 6:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
-		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-					   MAC_10000FD;
+
+		config->mac_capabilities |= MAC_10000FD;
+		break;
 	}
 }
 
@@ -2932,9 +2939,7 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	/* This switch only supports full-duplex at 1Gbps */
-	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-				   MAC_10 | MAC_100 | MAC_1000FD;
+	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
 	priv->info->mac_port_get_caps(ds, port, config);
 }

-- 
2.40.1



