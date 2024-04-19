Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5E9C071FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gct20XLIuYHSt+9lbrp775EiPGhqYMH/bCsk7JRn7F8=; b=D3Ed7+aIWDq0T0dFy7ZLRWoNvr
	WiaSSOFTCcjCywq7R1fcw5H7TxHVNPwDT6YLyMCJIYS3zjPAjnhXyGS8r8cqpZ/m0U2LPTtHe3B3Q
	5zIfwM8bP+jKoFY69KzP8OuUM+Y7FWUrY6jpCnqn5liEs4tx9jDFVLlYgFFCSUe+E+aMTsxxHPySy
	t2OOIaikwSeI5Kp594xPIIuU8/rT1AwfEjIbWJNVNdCfm02U7/BgOtAf0AQiZ7MApYYf0IndzNONQ
	HSfTtGIXyNjuV5vwqSQaZp6lwpJ47rhOSeH7KGuW32SJpRopHULt+x3EFCE6CchEjeEG+WM2tgHHx
	zc0Hcv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlDV-00000005FT2-3g6u;
	Fri, 19 Apr 2024 10:11:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlBe-00000005EGB-1xfE;
	Fri, 19 Apr 2024 10:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6600B61958;
	Fri, 19 Apr 2024 10:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C2CCC4AF18;
	Fri, 19 Apr 2024 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521378;
	bh=zupCYmW/khoZsM2dTyo44r06AeRMOCSbdh6WzpcdHaQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b5sAkAz+MYlWVHjGyJhb7cjjMrIzPLWwdRocg9MBNvjMifN5c/oWFNcZ3YFa0pOHw
	 rhg0FS8695lhRsCbTyEFgBfwtyd83UnH5VkXlVethdkYK/JzqPqylBJaJVr4gHIcoU
	 VKDdVXLMJRji+B0iMICIO3yzKEoUyqm3YeitpHcUGrGd4NsWJMIaFefo+62vu1wkj4
	 WIpyRnxpzp+FrSBckUZSmpiFmQPIqKFBxsUcA//iM0tb3qJsq6UUHYwXxOR7kyL+5K
	 5gX4NiKRZ5yFHmUrATbcxtwXvq9ZaR+QZDmm5lNMv+/KvTEhBwptZTKSxeydAxj6z3
	 70CwM/JLB/jLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34513C4345F;
	Fri, 19 Apr 2024 10:09:38 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 19 Apr 2024 13:09:35 +0300
Subject: [PATCH net-next 12/13] net: dsa: mt7530: get rid of
 mac_port_validate member of mt753x_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240419-for-netnext-mt7530-improvements-4-v1-12-6d852ca79b1d@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713521374; l=1895;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=eQVxi9XpKVjFwy7G/fq5LbkX2JyuVqKa+YvcokozwTs=;
 b=lxKhAM4lxFCiiqoqRrJSVABwHhzwSUDPFhr7NyBQKSYKAJ/uj+TkzxfnF1NgqOky4nNKWj8lp
 OBrKUp3G5FsDnkupYnsKRep6NDcDGaDggv/efjBlf2CKrFDM975BVzK
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_030942_880770_9CF868CD 
X-CRM114-Status: GOOD (  13.38  )
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

The mac_port_validate member of the mt753x_info structure is not being
used, remove it. Improve the member description section in the process.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 6a6ef34b48c4..2ea4e24628c6 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -743,15 +743,14 @@ struct mt753x_pcs {
 
 /* struct mt753x_info -	This is the main data structure for holding the specific
  *			part for each supported device
+ * @id:			Holding the identifier to a switch model
+ * @pcs_ops:		Holding the pointer to the MAC PCS operations structure
  * @sw_setup:		Holding the handler to a device initialization
  * @phy_read_c22:	Holding the way reading PHY port using C22
  * @phy_write_c22:	Holding the way writing PHY port using C22
  * @phy_read_c45:	Holding the way reading PHY port using C45
  * @phy_write_c45:	Holding the way writing PHY port using C45
- * @phy_mode_supported:	Check if the PHY type is being supported on a certain
- *			port
- * @mac_port_validate:	Holding the way to set addition validate type for a
- *			certan MAC port
+ * @mac_port_get_caps:	Holding the handler that provides MAC capabilities
  * @mac_port_config:	Holding the way setting up the PHY attribute to a
  *			certain MAC port
  */
@@ -770,9 +769,6 @@ struct mt753x_info {
 			     int regnum, u16 val);
 	void (*mac_port_get_caps)(struct dsa_switch *ds, int port,
 				  struct phylink_config *config);
-	void (*mac_port_validate)(struct dsa_switch *ds, int port,
-				  phy_interface_t interface,
-				  unsigned long *supported);
 	void (*mac_port_config)(struct dsa_switch *ds, int port,
 				unsigned int mode,
 				phy_interface_t interface);

-- 
2.40.1



