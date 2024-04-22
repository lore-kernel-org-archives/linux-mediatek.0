Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22C8C10F15
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 07:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FO8PI7ilTq8L72Zl0eVtmTR9U9LzaMvHSsFdOPwS49k=; b=xPrEp3yotcnMMu/Gm08gt9u84w
	A0l+zajUDJ17AP9Qs4SlW0s6WrZgyGyiMc5TqcdaXPHxMqkdf1m8NPVDaaoF7f1APvOLKGy+Ee3Xg
	F9v1TrMX6e2JKG3LUVqh0XphFILIurF/bf+d/B3Hay/Qj2htyXRni/xv0Po3aJzgv1/Th9CHRmPQx
	J5I+aovI+aOFZULUJXRKmA1pSrD/8LxRnKyarsHRIze0HjSYQ+2bTvRdU3a44u+MxrmjQNbPQThzZ
	kYdMepaD2gCxHkYdZO6Q7w8A4KbpSuvje8Ko8Ndv5RncQ5zi84y6Syv6i0uq6olUMlsbJaOTdKPpN
	avahCctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynva-0000000COPe-0y3F;
	Mon, 22 Apr 2024 07:17:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryntn-0000000CNMb-0l0U;
	Mon, 22 Apr 2024 07:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8C391CE0A3D;
	Mon, 22 Apr 2024 07:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0836C113CC;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770131;
	bh=A/6I8pJ7fmJZa2NSEfrteMXm9y4a13URFTnLtu4q6Cs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Jqa4gTOQpqUEeVwgzZHNta+79O3jU/ZaS9WHl16exrJwCVJ6pzA9ak3iIxXKS1McF
	 v5QHGA8+km+tOgvo68GFmt7owkXcEdkiK+/7vU7/seedEhRtUFMHnRgXe+PIvy915l
	 QoAsNWPZA2N+iTsBY/EWytzSgbQAC2Rj6m70ANJO3lSb+Baqtog8iVVCOMZSHUdXtK
	 lBYjUPSVn+NRsQleIboFkq3QdsV7c273ztdHX8CO5pgkMMSmQeW6z/0Q/x1dBDCmbK
	 1r7kNUWbJ7VGXU+4NTWBq9rqU5+Yp/hTKOk9sO46j3sgDBAGAz/fENZtGTz08LIshM
	 dZBgNhq8MNMog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D44C04FF6;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Apr 2024 10:15:15 +0300
Subject: [PATCH net-next v2 08/15] net: dsa: mt7530: return
 mt7530_setup_mdio & mt7531_setup_common on error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240422-for-netnext-mt7530-improvements-4-v2-8-a75157ba76ad@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713770127; l=1000;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=dhGaiF9+p4oldvBExDhNwz/DfR5nSajm98YgCgzXa+8=;
 b=lXh6eSrIbOP+xfkdRh30HoWuS5lsawXRQ2YNuwx1j7jFHq7jc5F18YX4FFRxNzE4PvpfHwONc
 abDithSkfs4DgzmXzHuE83I+yde2+7dDX+eZODZcmdij4kDASKiNUGX
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001535_651800_50FDA68F 
X-CRM114-Status: GOOD (  10.31  )
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

The mt7530_setup_mdio() and mt7531_setup_common() functions should be
checked for errors. Return if the functions return a non-zero value.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 83436723cb16..4e9aa78ca3d0 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2667,7 +2667,9 @@ mt7531_setup(struct dsa_switch *ds)
 					 0);
 	}
 
-	mt7531_setup_common(ds);
+	ret = mt7531_setup_common(ds);
+	if (ret)
+		return ret;
 
 	/* Setup VLAN ID 0 for VLAN-unaware bridges */
 	ret = mt7530_setup_vlan0(priv);
@@ -3020,6 +3022,8 @@ mt753x_setup(struct dsa_switch *ds)
 	ret = mt7530_setup_mdio(priv);
 	if (ret && priv->irq)
 		mt7530_free_irq_common(priv);
+	if (ret)
+		return ret;
 
 	/* Initialise the PCS devices */
 	for (i = 0; i < priv->ds->num_ports; i++) {

-- 
2.40.1



