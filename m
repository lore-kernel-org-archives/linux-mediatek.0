Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E3AC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHLTjJ6wxs+iLodcQhn4MKi93ZsYt3lcEAMuJYmbUgU=; b=WvjyvvP3zPJNfsrjk96TRMta0W
	fFJRjQOvZTAH3mI8mtiC9vqepSYbr5ENVIl+o8T1Ao80CZ2n3vbJmiAqpCWkePm/x93fCwMn5gSCW
	axHqIukw4Lenh7Y3LVVhj64L1sMKafOT/z5C5gVrUh0wEGpbNSm2TM1F88mtUuTcM/BCl75NzCXe8
	oY85XeHHX22JjOqxxtz77zoP9El87FYTifzK8jSx+AC8tS8espOfCFOpS5lV9LcD/6gtz9mWm8QsP
	V027kClwxUym3+8Y12huHP7LUH0yXF5Ph4tWLp6ha/teJt49dyD0/p5ljSLhIsY3C+25XjXjsivob
	Ht5L4lvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynuy-0000000CO4N-015b;
	Mon, 22 Apr 2024 07:16:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryntm-0000000CNMx-3LqN;
	Mon, 22 Apr 2024 07:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DE3560CFA;
	Mon, 22 Apr 2024 07:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D728C4AF4D;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770131;
	bh=Oh54loCHRJVtFGJB4q2HCwiYLcs9oRYxgNGQDVhsNV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kCDdCw93JWvyM6ixr4pcLCLU7ZgunKeA6lAT5dtgUjcSGBJfPtP8Z+sxU53JllujR
	 4VPeb8RiYF2RlEVba9WWCUnOlheg3ZY3dZxiXszyZComjgKJVkNV+i2fpV5x73B8yS
	 L8RnNIzDrJkGKGP2YG5Lzfl9Ujt0dRtPZP7jdopYwOJdXrYbc3Wvru4LpDH9OZpPrG
	 YJjfWsgryeCPmLyOJI0Xjo2+x9RT/yC95qH5etmXJTkSWLCSd6eNGmP3OQdiZBJHGI
	 eH0k4KiPB3Lt+E0JjxgMvB9RNyoRmqckQC1K/Ea7wv2j8Lk9lHTu5kDpD5NviRJ/g6
	 zGUju2Hke4RdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3B4C10F15;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Apr 2024 10:15:18 +0300
Subject: [PATCH net-next v2 11/15] net: dsa: mt7530: refactor
 MT7530_PMEEECR_P()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240422-for-netnext-mt7530-improvements-4-v2-11-a75157ba76ad@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713770127; l=2734;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=5wCatVwUOJ5yoMFPAyKVGUVnt4uS95CCabQrn8tU2fM=;
 b=5beEIWBivPh4rRHz4OMOaEN1r7a0OYapK3UVyu+r6c5GA8zk2noPQhtTrOL4SI3QrfcqqoQRu
 dNQNCPIfgwBBDrcNAOsGEBie7nrvPUo7pjv+ZxdeaqvCFd0w4SvXK9R
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001535_076997_1FA4DD8F 
X-CRM114-Status: GOOD (  12.02  )
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

The MT7530_PMEEECR_P() register is on MT7530, MT7531, and the switch on the
MT7988 SoC. Rename the definition for them to MT753X_PMEEECR_P(). Use the
FIELD_PREP and FIELD_GET macros. Rename GET_LPI_THRESH() and
SET_LPI_THRESH() to LPI_THRESH_GET() and LPI_THRESH_SET().

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c |  8 ++++----
 drivers/net/dsa/mt7530.h | 13 +++++++------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 842c2573dfe4..5e69ff0a4b24 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3051,10 +3051,10 @@ static int mt753x_get_mac_eee(struct dsa_switch *ds, int port,
 			      struct ethtool_keee *e)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 eeecr = mt7530_read(priv, MT7530_PMEEECR_P(port));
+	u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
 
 	e->tx_lpi_enabled = !(eeecr & LPI_MODE_EN);
-	e->tx_lpi_timer = GET_LPI_THRESH(eeecr);
+	e->tx_lpi_timer = LPI_THRESH_GET(eeecr);
 
 	return 0;
 }
@@ -3068,11 +3068,11 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 	if (e->tx_lpi_timer > 0xFFF)
 		return -EINVAL;
 
-	set = SET_LPI_THRESH(e->tx_lpi_timer);
+	set = LPI_THRESH_SET(e->tx_lpi_timer);
 	if (!e->tx_lpi_enabled)
 		/* Force LPI Mode without a delay */
 		set |= LPI_MODE_EN;
-	mt7530_rmw(priv, MT7530_PMEEECR_P(port), mask, set);
+	mt7530_rmw(priv, MT753X_PMEEECR_P(port), mask, set);
 
 	return 0;
 }
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 1f3aeccc77be..6a6ef34b48c4 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -364,13 +364,14 @@ enum mt7530_vlan_port_acc_frm {
 					 PMCR_FORCE_SPEED_100 | \
 					 PMCR_FORCE_FDX | PMCR_FORCE_LNK)
 
-#define MT7530_PMEEECR_P(x)		(0x3004 + (x) * 0x100)
-#define  WAKEUP_TIME_1000(x)		(((x) & 0xFF) << 24)
-#define  WAKEUP_TIME_100(x)		(((x) & 0xFF) << 16)
+#define MT753X_PMEEECR_P(x)		(0x3004 + (x) * 0x100)
+#define  WAKEUP_TIME_1000_MASK		GENMASK(31, 24)
+#define  WAKEUP_TIME_1000(x)		FIELD_PREP(WAKEUP_TIME_1000_MASK, x)
+#define  WAKEUP_TIME_100_MASK		GENMASK(23, 16)
+#define  WAKEUP_TIME_100(x)		FIELD_PREP(WAKEUP_TIME_100_MASK, x)
 #define  LPI_THRESH_MASK		GENMASK(15, 4)
-#define  LPI_THRESH_SHT			4
-#define  SET_LPI_THRESH(x)		(((x) << LPI_THRESH_SHT) & LPI_THRESH_MASK)
-#define  GET_LPI_THRESH(x)		(((x) & LPI_THRESH_MASK) >> LPI_THRESH_SHT)
+#define  LPI_THRESH_GET(x)		FIELD_GET(LPI_THRESH_MASK, x)
+#define  LPI_THRESH_SET(x)		FIELD_PREP(LPI_THRESH_MASK, x)
 #define  LPI_MODE_EN			BIT(0)
 
 #define MT7530_PMSR_P(x)		(0x3008 + (x) * 0x100)

-- 
2.40.1



