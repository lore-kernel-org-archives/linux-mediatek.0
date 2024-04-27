Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7583CC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Apr 2024 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uiDFpjTlxl7khzCdumcoTY5vdEl5ROv8JST08SnVwA8=; b=sbPakqdRqrONqq5idgKNK+bKEU
	wKD2kOgCGidoFT8kQkB7qGs+BZrec3EWUS7ZuMECbxKv/B8HCcqFTHHNpV6v3MkzFV0IxijPNUfFN
	koPFLD5BxR0qsAM0Qk5+o7+MhLzPlyaH8gHsUU0ZAIzWgmKDcxoBrGTWw9+bfc5StHzn24nIUGY7s
	e5w2hd+ygC2EI+F9TK6PvpKvWxrAKNRKwbiZ8PRbuKQkeI6LMRuRsLPM787S0wWlAw/zytBlmcZB7
	O4PrqHivLl6xCtKU9y/8elp4fpGBBhU5fmSTxIXi9GU2uKNqw9s003Suv5YKQqHqt7ajyWywvast8
	wZMeEisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0gBg-0000000FR0k-1ux3;
	Sat, 27 Apr 2024 11:25:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0gBc-0000000FQyq-1pJK;
	Sat, 27 Apr 2024 11:25:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95196CE129F;
	Sat, 27 Apr 2024 11:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB941C113CE;
	Sat, 27 Apr 2024 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714217140;
	bh=mTWwU46l7ts0rLk94ziiyqQWkCiH5M84Cw14kTJlkHQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nNgFlxNQKbEEYwn7siUSyUFtWsuUFnKXgVnZumKWsR9jlyXZOvWxv+O3QmwybfN86
	 wUFH79cBOEwTpC3eeRHVBveHaFWX2vHtleW5M4jqzA48l7xDjSgzIopRVnYcDLuMwl
	 85Fw2cQ3F+dZbup4KTBKg2V4vqR7C8ImPysTSogp94FBwOCXeffSX9SDCvA/VhlQZW
	 ehl2L2+EFybStbc3Dd1Fj/eTPynDKMaLMaP6MSmGvNRFkHNZoV8frfYrTsZBCOScmy
	 FezswZq6askDMrxJupR4V8oLM8SqHqWsenKvy9suLNkf1r3k9p1hw3i74M/Y9Dlmly
	 spnUu9Q9UrKEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9466FC4345F;
	Sat, 27 Apr 2024 11:25:40 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Sat, 27 Apr 2024 14:24:42 +0300
Subject: [PATCH net-next] net: dsa: mt7530: do not set MT7530_P5_DIS when
 PHY muxing is being used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240427-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v1-1-793cdf9d7707@arinc9.com>
X-B4-Tracking: v=1; b=H4sIAHngLGYC/x3NQQ6CMBBG4auQWfsnFWkavIpxgXYKk8iUtFUxh
 LtbXb7N9zbKnIQznZuNEr8kS9Qax0ND92nQkSG+NrWm7UzXOoSYoFyU14K5OHsy8BEaC7zk4fZ
 gLDEVi/fEimX6YH6uoiNcCDZ40/fWO6r6kjjI+j9fqIL4iXTd9y/zSRLdkwAAAA==
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714217117; l=1747;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=VasDaHgnHDdOqWDdjqgzeJKJ1I8lWhlpo+kDcDotXgI=;
 b=/c0zUKnpKv7yif6iCmwhpJFhCS5YvTpA9cc1RESiRDOk46zS5DwLrpcI1CAT0JWV8N7QaGoBO
 v5mzrNL+eSQDg2l2KC18hVg911AX5J52ZSHtNadCU93H5Xn9sM2FVZt
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_042544_877242_28487E7F 
X-CRM114-Status: GOOD (  13.25  )
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

When the PHY muxing feature is in use, port 5 won't be defined in the
device tree. Because of this, the type member of the dsa_port structure for
this port will be assigned DSA_PORT_TYPE_UNUSED. The dsa_port_setup()
function calls ds->ops->port_disable() when the port type is
DSA_PORT_TYPE_UNUSED.

The MT7530_P5_DIS bit is unset when PHY muxing is being used.
mt7530_port_disable() which is assigned to ds->ops->port_disable() is
called afterwards. Currently, mt7530_port_disable() sets MT7530_P5_DIS
which breaks network connectivity when PHY muxing is being used.

Therefore, do not set MT7530_P5_DIS when PHY muxing is being used.

Fixes: 377174c5760c ("net: dsa: mt7530: move MT753X_MTRAP operations for MT7530")
Reported-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Hello.

I've sent this to net-next as the patch it fixes is on the current
development cycle.
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b9f904a98f0..07b6da3ae97c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1220,7 +1220,7 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
 	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
 		return;
 
-	if (port == 5)
+	if (port == 5 && priv->p5_mode == GMAC5)
 		mt7530_set(priv, MT753X_MTRAP, MT7530_P5_DIS);
 	else if (port == 6)
 		mt7530_set(priv, MT753X_MTRAP, MT7530_P6_DIS);

---
base-commit: 5c4c0edca68a5841a8d53ccd49596fe199c8334c
change-id: 20240427-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-7ff5fd0995d7

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



