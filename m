Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BFAC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZR/pKJYJf3lo5Bgm5VExqDACFtbqNxQ8/shvtLJMlg=; b=mkx6P3zJLGRJEc76ieBEGXtPYb
	4VOZAfAr0XnYnCd/nm+rWJjwZ8xYIb+npS8xeOEOzi3VEMb5X7g9vevS4ekueRJ0QLfPLaEfxPOll
	kojkybX/mWHDAERoLoeNwXA26YVCgKK9R9pCELggbLrJsRBI8EWJXsGgkF9f7I7IGIc9Xe0L6urjI
	muMY5+ILLEx6zDd//nLd9dl81adcK2/+H1ndBpzgdqymVyROthulu36TjR3RQXDGReBPgGuartkQa
	jDZnfy0cdDSeIcL5KKVdsF2SwSvfq+95bh96OjrRMVxd2yZZ/ZgPslCCX/3/tIkNdCKR/GIvARIy/
	ebbJ3t3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvd24-00000003B4g-244K;
	Sat, 13 Apr 2024 13:03:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvd1q-00000003Ayy-1Pbq;
	Sat, 13 Apr 2024 13:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A687BCE39A1;
	Sat, 13 Apr 2024 13:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3EB9C2BBFC;
	Sat, 13 Apr 2024 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713013361;
	bh=1hfFJpbVy+jRqc4NBcjfKebyqWZeLEI6ADFhHCGKzT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CCQPqIA06KHZZ/+XG8gQbIoK5NvuyjL91mRzOaJYMlENGMi4mzkudX8VdVSe/EAep
	 Q5aUgzhl3cl1L3gowy5Hw3YE35ElF+LyYQ+r3Zld2CofPeD4Lr5TvL1b5LARxXcQnD
	 HmAKjbHSYTFOzQxax7D2mniLZoS9fW7vPWoCIY7bFbXcVLol3W1uHc5Uu9I3+p+tHQ
	 isds+FcGceR080wyqyyBb4UhGgpU3N008ZJ1pBcWAFUcUt+T9SOApBMJhLR+2gsHyO
	 bq1UZHae8A4WP/sY9MKbN8yqda2ZHOQtatWVH4IIjrX0Yc689WKyqPBc+NmWtlrm5K
	 Z2Q9+ZRE7BiFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0BBC04FFF;
	Sat, 13 Apr 2024 13:02:41 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Sat, 13 Apr 2024 16:01:40 +0300
Subject: [PATCH net 2/2] net: dsa: mt7530: fix port mirroring for MT7988
 SoC switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-2-476deff8cc06@arinc9.com>
References: <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-0-476deff8cc06@arinc9.com>
In-Reply-To: <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-0-476deff8cc06@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Holger Stadali <hs@giax.de>, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com, 
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713013352; l=1595;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=J5sBZDEYQ2MZhOw2PxMAD+gQryIOB3G0EIw5h33fGKY=;
 b=1ey++0YizyHi3vcP2NlwKUdn8ZXxyN89dYXm/TAlv6xdycNAjjkoeViF08Xq34iWLaB/yBlgs
 7aq3qAX1yCuA5RcztQ1SxOoidtaDCWL3nktMXq4ac2BoLg8BcYRTy5I
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_060246_772166_E0C61173 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

The "MT7988A Wi-Fi 7 Generation Router Platform: Datasheet (Open Version)
v0.1" document shows bits 16 to 18 as the MIRROR_PORT field of the CPU
forward control register. Currently, the MT7530 DSA subdriver configures
bits 0 to 2 of the CPU forward control register which breaks the port
mirroring feature for the MT7988 SoC switch.

Fix this by using the MT7531_MIRROR_PORT_GET() and MT7531_MIRROR_PORT_SET()
macros which utilise the correct bits.

Fixes: 110c18bfed41 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b84e1845fa02..8090390edaf9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1883,14 +1883,16 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 
 static int mt753x_mirror_port_get(unsigned int id, u32 val)
 {
-	return (id == ID_MT7531) ? MT7531_MIRROR_PORT_GET(val) :
-				   MIRROR_PORT(val);
+	return (id == ID_MT7531 || id == ID_MT7988) ?
+		       MT7531_MIRROR_PORT_GET(val) :
+		       MIRROR_PORT(val);
 }
 
 static int mt753x_mirror_port_set(unsigned int id, u32 val)
 {
-	return (id == ID_MT7531) ? MT7531_MIRROR_PORT_SET(val) :
-				   MIRROR_PORT(val);
+	return (id == ID_MT7531 || id == ID_MT7988) ?
+		       MT7531_MIRROR_PORT_SET(val) :
+		       MIRROR_PORT(val);
 }
 
 static int mt753x_port_mirror_add(struct dsa_switch *ds, int port,

-- 
2.40.1



