Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C05CC4829A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 22:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bf+AzYuidmGAXrJ/KcZhj2m3QTVE8Zz7jwmn1XMMro=; b=EkaFsOIpr65OnZM/exqQ1jfqrm
	TFZPQWFcYMawIUYHYeMzCrG/u6XC1txxmuZRnTGomDCR5ntQ/1X4Dg9MEpKEA4RMIPabLCXsnLtIc
	G86HW/9Lw85rEfPlnmA797vz7hJMNScnyV6JYJv8sZb4tzKjRj7AMPFk9kuRpNo0x5taujHJksROt
	a6njnazMpkY6FZx9gPIp8upyfH0+FnEKdjZL9i3VISQ7jC58Tb6FxnILrzuy32nrO9P6ClVEThGRb
	94n+/LQOT/9Lts3NUR5/oU4qFGPAKZkaCk1YwOUmZMSboxJpoT7UgGCaCuj59dS7HvI/6HXlvbO5l
	jd5nFtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX78d-00000005NDo-2pD5;
	Mon, 05 Feb 2024 22:08:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX78R-00000005N4r-3UQk;
	Mon, 05 Feb 2024 22:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B99C612BE;
	Mon,  5 Feb 2024 22:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6B5CC43609;
	Mon,  5 Feb 2024 22:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707170894;
	bh=EDH94Q0fIzWZXO02/75AuI4ovyw/xgjFBUiWt170Fhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LEsEQtXmXB1A6U4bZMzmvadrKq8w8I2bDfxVryV2nJEUdT+rxNejTNE8ehVzFBa4y
	 qky5kFBH0SCeZh6bByi6bZcWwg4whZ3v5QKJKS7I0ry8WWhcFM6pNrQkwm9wz7ZUWp
	 6OZgL01ebQNdmB+lwuQTdVjyHf+I1Y6RsGzFFG9vD0xUZDytBsJ2nLn/nK3D/UoHkf
	 2VAycZpSpiuBwmkIyZNAI/iSRvRPwe3fUKWJ6I/R/SzGQjPgnS3Knic9XxGl8/MCEy
	 VInP06fpD/3rNFnxuUbegQ0L2N71AHTHhgyx+H0PWf/KRIrsgX+31yzNuWFOQFxHEQ
	 YFKeHtOLkqkHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9314FC4829B;
	Mon,  5 Feb 2024 22:08:14 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Tue, 06 Feb 2024 01:08:07 +0300
Subject: [PATCH net-next v5 6/7] net: dsa: mt7530: correct port
 capabilities of MT7988
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240206-for-netnext-mt7530-improvements-2-v5-6-d7d92a185cb1@arinc9.com>
References: <20240206-for-netnext-mt7530-improvements-2-v5-0-d7d92a185cb1@arinc9.com>
In-Reply-To: <20240206-for-netnext-mt7530-improvements-2-v5-0-d7d92a185cb1@arinc9.com>
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
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707170890; l=1134;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=C+eRNzRMDtIba7vQLCEXXq4gYtY07Q6DrrKE/vhW8K8=;
 b=CBzUdwGnzV81mMHvp0tw0tpnea8Sj3PKTF483XOFnrkC5R7NTJvLSwD4byug+hZNA3N0d6xk4
 0ucvCcO7jqEAfWZzPVkb8M5P/Z6rAMqaXyexPhwviw16UJPRsem5009
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_140816_032277_E11ED3EC 
X-CRM114-Status: GOOD (  12.75  )
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

On the switch on the MT7988 SoC, as shown in Block Diagram 8.1.1.3 on page
125 of "MT7988A Wi-Fi 7 Generation Router Platform: Datasheet (Open
Version) v0.1", there are only 4 PHYs. That's port 0 to 3. Set the case for
ports which connect to switch PHYs to '0 ... 3'.

Port 4 and 5 are not used at all in this design.

Link: https://wiki.banana-pi.org/Banana_Pi_BPI-R4#Documents [1]
Acked-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e1fdef5766fb..4ca7ba94788e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2577,7 +2577,7 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 
 	switch (port) {
 	/* Ports which are connected to switch PHYs. There is no MII pinout. */
-	case 0 ... 4:
+	case 0 ... 3:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;

-- 
2.40.1


