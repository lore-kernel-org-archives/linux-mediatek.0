Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D311CC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 07:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S721Xf5Ffl7Y32EairNUlPHN31lj2FzQiD72uJLPSN4=; b=tfnWk7AFPGaMcEul/6YmHOvD7v
	mN4z06pHzmwZG6V/umyZAqQkvJHj5j6BuYnWiJH/iPm/AoJx6meH7dPIhAA/Lcx/Log0pZc8sXPPk
	3fohuz9VjGGVvjvoFRc5vu+TP8oLu2rFEB+XbbcV97PzzeRWTXDF6ahJuFVttL0uLe9QUD7mW2Q+N
	tG0EVdA8MDFAhGyk2cmvTaBGoKQP2jMBmXxo3uQWP7+yF3ApLniZerwdYsWBUjFJxa+wsp7oFx9my
	64r9AztUY4WeE3k+Sbjq2ofEan9QnicVrGLmG6ASCET/fbPo64RM2k/1p0vwY0r3wCRvORhyzBRx+
	7Fp/fCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynwB-0000000COlw-1TGx;
	Mon, 22 Apr 2024 07:18:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryntq-0000000CNQc-1syM;
	Mon, 22 Apr 2024 07:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4E19CE0A5F;
	Mon, 22 Apr 2024 07:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B6DCC4AF5F;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770131;
	bh=PmeAMYPZ9FxzUW5GiKbK62DPOkBKTTIRFefQeWGqI48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WSsmTj7/BFmSBKk+MIr5vBMqLM1UJs9iG9nfg5KdPgaAa2IqPWSAnux4rmop2SUQx
	 mbI6gkOkb/OarXGqoMtYjvepAHj4k3N+a/thjJHgRK8FbJIlNf+9VBELFgZsrmmE0a
	 SAB4bOi/zk4h1LwjeVxKbU9SJSOznmvLT2u4CsGB025g9zQjohrp8M3oEZSvbpiu91
	 cPQ68d5B4ASkZvm7xIzxPQYBptkBX+7j3SZRP41KvJOIRSCIx6nhDDN65/mEm+iPuL
	 8Gn6y8T/03O3QXuNxxej15krNFX7lE2WmIn7wHonmQhLkjSFKSk51lYJo98p0Jwkya
	 TPbfDH1oERMCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501AFC07E8F;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Apr 2024 10:15:21 +0300
Subject: [PATCH net-next v2 14/15] net: dsa: mt7530: do not pass port
 variable to mt7531_rgmii_setup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240422-for-netnext-mt7530-improvements-4-v2-14-a75157ba76ad@arinc9.com>
References: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
In-Reply-To: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713770127; l=1111;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=Q1j4jaCBiZXdXWGCY6tFpliJwSXL75dq4VnMljuW2Zw=;
 b=4edWHZvzNJRTxMTUE0wiBeIEW7Iu4gYhfzaEG4rSVBrQN4GpNEFRAkN0qFdg0HmYp8vS7lSnt
 a/JDc1cAa1ODoctBTyvB6iFiv1Ld2Sv5i5/ytpRPb3P/IaNP9ia9DRL
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001539_065485_8563E389 
X-CRM114-Status: GOOD (  11.01  )
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

The mt7531_rgmii_setup() function does not use the port variable, do not
pass the variable to it.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 55954a165a15..1f6cd24de4b7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2785,7 +2785,7 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		mt7530_setup_port6(priv->ds, interface);
 }
 
-static void mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
+static void mt7531_rgmii_setup(struct mt7530_priv *priv,
 			       phy_interface_t interface,
 			       struct phy_device *phydev)
 {
@@ -2836,7 +2836,7 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	if (phy_interface_mode_is_rgmii(interface)) {
 		dp = dsa_to_port(ds, port);
 		phydev = dp->user->phydev;
-		mt7531_rgmii_setup(priv, port, interface, phydev);
+		mt7531_rgmii_setup(priv, interface, phydev);
 	}
 }
 

-- 
2.40.1



