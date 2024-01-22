Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9E7C4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 05:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Or7jr7MDTZHeLQ5z6xGsqCsTdEGNowDo87w0GRodY70=; b=hn//yBKinQbKonOgYY7sYZraLa
	U7dVkzAU44rwQCQ8/yc9KxuQlMAGBZWDMjEZV5Mp/Rdmre+nQdL0gnavbkRDULZD00BlCzir/cTYQ
	V5cXkcvWSOBr7qHyB/UMn5JjqqoFUGinhVLhVj2arXkIU4k2br17vQjKmdIdNOvU+Ckwhu7nRUk8x
	AOiitEVSzEzNMXpli6KhOK1tvFVCPq0WYY8hHUarjauaYuCa+vORtKhlD41og0nYSIlR0MlBo8uMM
	fQo8HUbBXhyKFp4O/kmSIuE6gIJ4b2Nbxm0RYje9yXpTvw1JgMlQHSZArrea5z7TbOgDNAJgAF3tb
	7eDIoUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmyg-00AbbV-2E;
	Mon, 22 Jan 2024 05:36:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmyW-00AbXG-2y;
	Mon, 22 Jan 2024 05:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DAF81B80B05;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37309C433F1;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705901758;
	bh=BJnOeS65sq0ctJq5UOVZ2WxdttW9vz25dwKp4xbPBfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O58BuPXmDB3kntKMblO13Z8kSWaTk2SeOjB/cNBiY4q4ET0d+WajAYCGaxy1C24/X
	 5eYJzqKIPfpT7ejDHYEhAoHW1Fk7tUULodwryVm7hDVg4qA2T8+uWsUXM2ZBluV+/R
	 EVB4NoOsntfxjilrt9+HZpwjCUiq1uMVuayHfN4ItQJAhPtS0okpG7qDV2GVUE4mI2
	 IPYopn/kn3If9zQ2DfwloS9Zq16tESXx/ILtYjEM/0I9MHaHANp5Oler/HurMjbIaV
	 ef8dR+4gwhSmr74N1Qt7NKi9p97y1n5HnkUYgfKldryh38V4ZjZMA1mBR//rB0jnXj
	 1TGefU2/xruXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC98C47DD3;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Jan 2024 08:35:52 +0300
Subject: [PATCH net-next v3 1/7] net: dsa: mt7530: always trap frames to
 active CPU port on MT7530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240122-for-netnext-mt7530-improvements-1-v3-1-042401f2b279@arinc9.com>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
In-Reply-To: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705901755; l=4314;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=OahuM/i2rvjHeE74Gk7po9F6EBBznn5IwSvSniGSaV0=;
 b=Tdp4jqS5p+QOFq8gzefgBM65crsiy194Phw6aAQVLvMNPC2qLMjNXHRYGMeSIs66WwnOrc0YK
 KoKmm10jNroBRbt3dDStrqDwLZQ3izsAPTX+dvPz1aKJnhYJNVNrne+
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_213601_247186_D8AE46AA 
X-CRM114-Status: GOOD (  21.07  )
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

On the MT7530 switch, the CPU_PORT field indicates which CPU port to trap
frames to, regardless of the affinity of the inbound user port.

When multiple CPU ports are in use, if the DSA conduit interface is down,
trapped frames won't be passed to the conduit interface.

To make trapping frames work including this case, implement
ds->ops->conduit_state_change() on this subdriver and set the CPU_PORT
field to the numerically smallest CPU port whose conduit interface is up.
Introduce the active_cpu_ports field to store the information of the active
CPU ports. Correct the macros, CPU_PORT is bits 4 through 6 of the
register.

Add a comment to explain frame trapping for this switch.

Currently, the driver doesn't support the use of multiple CPU ports so this
is not necessarily a bug fix.

Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 35 +++++++++++++++++++++++++++++++----
 drivers/net/dsa/mt7530.h |  6 ++++--
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 391c4dbdff42..761c4804449a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1035,10 +1035,6 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_set(priv, MT7530_MFC, BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
 		   UNU_FFP(BIT(port)));
 
-	/* Set CPU port number */
-	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
-		mt7530_rmw(priv, MT7530_MFC, CPU_MASK, CPU_EN | CPU_PORT(port));
-
 	/* Add the CPU port to the CPU port bitmap for MT7531 and the switch on
 	 * the MT7988 SoC. Trapped frames will be forwarded to the CPU port that
 	 * is affine to the inbound user port.
@@ -3075,6 +3071,36 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static void
+mt753x_conduit_state_change(struct dsa_switch *ds,
+			    const struct net_device *conduit,
+			    bool operational)
+{
+	struct dsa_port *cpu_dp = conduit->dsa_ptr;
+	struct mt7530_priv *priv = ds->priv;
+	int val = 0;
+	u8 mask;
+
+	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
+	 * forwarded to the numerically smallest CPU port whose conduit
+	 * interface is up.
+	 */
+	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
+		return;
+
+	mask = BIT(cpu_dp->index);
+
+	if (operational)
+		priv->active_cpu_ports |= mask;
+	else
+		priv->active_cpu_ports &= ~mask;
+
+	if (priv->active_cpu_ports)
+		val = CPU_EN | CPU_PORT(__ffs(priv->active_cpu_ports));
+
+	mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, val);
+}
+
 static int mt7988_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
 {
 	return 0;
@@ -3130,6 +3156,7 @@ const struct dsa_switch_ops mt7530_switch_ops = {
 	.phylink_mac_link_up	= mt753x_phylink_mac_link_up,
 	.get_mac_eee		= mt753x_get_mac_eee,
 	.set_mac_eee		= mt753x_set_mac_eee,
+	.conduit_state_change	= mt753x_conduit_state_change,
 };
 EXPORT_SYMBOL_GPL(mt7530_switch_ops);
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 17e42d30fff4..ebfb3a7acfcd 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -41,8 +41,8 @@ enum mt753x_id {
 #define  UNU_FFP(x)			(((x) & 0xff) << 8)
 #define  UNU_FFP_MASK			UNU_FFP(~0)
 #define  CPU_EN				BIT(7)
-#define  CPU_PORT(x)			((x) << 4)
-#define  CPU_MASK			(0xf << 4)
+#define  CPU_PORT_MASK			GENMASK(6, 4)
+#define  CPU_PORT(x)			FIELD_PREP(CPU_PORT_MASK, x)
 #define  MIRROR_EN			BIT(3)
 #define  MIRROR_PORT(x)			((x) & 0x7)
 #define  MIRROR_MASK			0x7
@@ -760,6 +760,7 @@ struct mt753x_info {
  * @irq_domain:		IRQ domain of the switch irq_chip
  * @irq_enable:		IRQ enable bits, synced to SYS_INT_EN
  * @create_sgmii:	Pointer to function creating SGMII PCS instance(s)
+ * @active_cpu_ports:	Holding the active CPU ports
  */
 struct mt7530_priv {
 	struct device		*dev;
@@ -786,6 +787,7 @@ struct mt7530_priv {
 	struct irq_domain *irq_domain;
 	u32 irq_enable;
 	int (*create_sgmii)(struct mt7530_priv *priv, bool dual_sgmii);
+	u8 active_cpu_ports;
 };
 
 struct mt7530_hw_vlan_entry {

-- 
2.40.1


