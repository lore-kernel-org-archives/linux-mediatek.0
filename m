Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9BCC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 05:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VSF0Mx0dEWNOVDPPTv+bhummELAdeuHws5ENmO8dVz4=; b=WEKgWRqaY/++lR45HqhildZAyr
	5PfuonI7WObVKhbjOuXv0i4KHkbn424aHeXJQBkpH+R9m3C9Xx+0SEH7VRcYtoCq6cnVIBMYlbx1o
	F56SSnwqLqMVc96pjo72bO7RkfkSOZswB2FFzn85CtkROvCWYuCWewwTzcHiC9zJL7FVrjXxDjEpU
	qoCYWAHFZGZguZsFJ6fbb3CXJ9Dxvs4jGCFaFqIhXgx182r/pMeFnT9G4xyp73RszWmrTdvUcW3je
	9V4OV8wfskzkAZXLoLIZI4jNfXig0Az5aaq9M+qUbkPQLI1n1D9w88jYgIGEGuDRK8rfgY00jEF+T
	WyGxdwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1fci-000000056OZ-44GE;
	Tue, 30 Apr 2024 05:01:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1fce-000000056NR-47M3;
	Tue, 30 Apr 2024 05:01:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 06424CE0D6B;
	Tue, 30 Apr 2024 05:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A3AEC2BBFC;
	Tue, 30 Apr 2024 05:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714453299;
	bh=GGkybB3RbZ4yacytPZCe3ceKcaWca6ygWTw/PJtmpsk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LTwGL2cBtvmG8vpW/5yPEkA2A4EWbBIHkpxGRp6NhmQcwKx6T+Q4Gt/MKTUdGZ6pp
	 FHxkNOtF/KeqTZc814r9H7gtR+6rzRBCcQfWYl2TIdj+1edX/UrwUARQa8CQYwWK3V
	 jqfD9pCOCm+hptOHs6o0+j5FaW5TtN6QJTG/1GpftEfJkQYpsp/jEL28MY35u99DBK
	 yZErlS77MlNQEMScOR7McNtMj0pYnTvgrZLefdORzeWQhX6REODGKFL2xoSWjtg9jw
	 QeQUp07wKwtuwHpKI07IBsFwIsclZYD3/oXrjBSSZmvwHCCvAYT+PXRiH0moLzHERn
	 aa8XczXBSlBVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CA2C25B10;
	Tue, 30 Apr 2024 05:01:39 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Tue, 30 Apr 2024 08:01:33 +0300
Subject: [PATCH net-next v2] net: dsa: mt7530: detect PHY muxing when PHY
 is defined on switch MDIO bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240430-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v2-1-9104d886d0db@arinc9.com>
X-B4-Tracking: v=1; b=H4sIACx7MGYC/6WOSw6DMBBDr1LNulNBIHy66j0qFhAGmAUJSgIFI
 e7eNFeovLJsPfsER5bJwfN2gqWNHRsdjLjfQE2tHgm5Dx5EIvIkFzV2OQ7Goiavafc4+1JmCa6
 O0H3Yqwnnng12q4u1ZTpwXnfWI8qqEEWdlamSEgJ+sTTwHqffEHD440ETkomdN/aIn7Y05v/Pb
 ykGDWUp6yqjVMpXa1mr+qHMDM11XV8dryM7CwEAAA==
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714453297; l=1949;
 i=arinc.unal@arinc9.com; s=arinc9-PC; h=from:subject:message-id;
 bh=c3IRARdnxa6x5otHszH4xrnla2RxJAal1114ej/d2wE=;
 b=FL4WEHh4zYu1gBE7wbaN+X2OMCOIMJVsYBkXurHM0IC3CnI6XfpKE1V5QLUSXby75WZfvQ0se
 lrMQos/eOAaCNbkyxUkmwb3opbC915iywMECA0lv/g0IAo6snRYzMae
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=Bd1s2kQtNfZAWyeLHg39jaWBDqt8Ud1WJXLFh7gxl20=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-PC with
 auth_id=158
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_220145_404641_D3B3B13D 
X-CRM114-Status: GOOD (  13.61  )
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

Currently, the MT7530 DSA subdriver configures the MT7530 switch to provide
direct access to switch PHYs, meaning, the switch PHYs listen on the MDIO
bus the switch listens on. The PHY muxing feature makes use of this.

This is problematic as the PHY may be attached before the switch is
initialised, in which case, the PHY will fail to be attached.

Since commit 91374ba537bd ("net: dsa: mt7530: support OF-based registration
of switch MDIO bus"), we can describe the switch PHYs on the MDIO bus of
the switch on the device tree. Extend the check to detect PHY muxing when
the PHY is defined on the MDIO bus of the switch on the device tree.

When the PHY is described this way, the switch will be initialised first,
then the switch MDIO bus will be registered. Only after these steps, the
PHY will be attached.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Changes in v2:
- Address the terminology on the patch log.
- Link to v1: https://lore.kernel.org/r/20240429-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v1-1-1f775983e155@arinc9.com
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b9f904a98f0..6cf21c9d523b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2483,7 +2483,8 @@ mt7530_setup(struct dsa_switch *ds)
 			if (!phy_node)
 				continue;
 
-			if (phy_node->parent == priv->dev->of_node->parent) {
+			if (phy_node->parent == priv->dev->of_node->parent ||
+			    phy_node->parent->parent == priv->dev->of_node) {
 				ret = of_get_phy_mode(mac_np, &interface);
 				if (ret && ret != -ENODEV) {
 					of_node_put(mac_np);

---
base-commit: 5c4c0edca68a5841a8d53ccd49596fe199c8334c
change-id: 20240429-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-586269371c55

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



