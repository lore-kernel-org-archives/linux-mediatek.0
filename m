Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E5BC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FO8PI7ilTq8L72Zl0eVtmTR9U9LzaMvHSsFdOPwS49k=; b=NVI5k06t3ZzhtJ5eglVFjEobz0
	Ctyfd5Kk5xfzg0RFYaxccUv4Apj//mErjU3PCbxOya/Cw0Oa/9FRm3S21aqfpIyJsJszjoXrm/Z1y
	0Uioecu/OYHBU3vCS4h9l1OAAB1kOkfhwYjJeiTaozXDL7fJjZ87KW22xxmH9vLIUpBkSHiBNAguU
	3N9rdvrKZDBxB5edNtEPlQdlPw932gqGBEiriPqAGhcq738uMOw7vZPK57QPEkOW+GvhH+00/iilE
	BYETs2t3L3dUnrMxFAhIizFSg7CazZNR3gqmIIV0QVdVcqRyyDLj0Zhkg2ZKE+NfcATIkJ7CnCG32
	7HEFmn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlC9-00000005EZ8-1ocF;
	Fri, 19 Apr 2024 10:10:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlBc-00000005ECz-08j0;
	Fri, 19 Apr 2024 10:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D601261961;
	Fri, 19 Apr 2024 10:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8994C4AF0E;
	Fri, 19 Apr 2024 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521378;
	bh=A/6I8pJ7fmJZa2NSEfrteMXm9y4a13URFTnLtu4q6Cs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ObIKwWPt7llKjt5GGySWvobJqBQSRc+UkgqKI75jxI2LZgRgygtEaPXj7yRhybCvm
	 +WyLso0DvQE5L12dDBwq0y1Jq/MulFFsZ8Z7fMFM1jzrRVSxj+/fL27lEJcOQCBym2
	 ngxW4jPnzx675858qb2dfWs1dBlcWjqqev5uaTyQQMLBaBUx/sE3HMZiBSiSagXulo
	 318NM6JTHY+BtJTaPcYUZSpq+Ver0NctBna4FoAsr3sEqco1E88kedM76WcdEXudAi
	 7kn7j8KM1SKfAp9bIUttUGa9yukvS2m2Q9pTXiLemE8rHDWhuat10GyMvB5FeEuuGr
	 cqCeEY+cB/7vA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB626C4345F;
	Fri, 19 Apr 2024 10:09:37 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 19 Apr 2024 13:09:31 +0300
Subject: [PATCH net-next 08/13] net: dsa: mt7530: return mt7530_setup_mdio
 & mt7531_setup_common on error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240419-for-netnext-mt7530-improvements-4-v1-8-6d852ca79b1d@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713521374; l=1000;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=dhGaiF9+p4oldvBExDhNwz/DfR5nSajm98YgCgzXa+8=;
 b=2BxAch20eM2c8wvH4hsKCRmrCfJCbUYkFInLzGJsmliu0YwKZHxbIUtyCnjWf3L2zY6HGcE7O
 lOdPe2ZZRPVDm1XFB0M03gpIYRxE1oIfpmsEqmNnYWIpJzGSVIVGTGJ
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_030940_300003_5A84E6F6 
X-CRM114-Status: GOOD (  10.17  )
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



