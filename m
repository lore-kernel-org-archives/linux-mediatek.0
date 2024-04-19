Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05343C04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUMBzcGBEpchcJvvWVkliLA2E/rXgiuXkSp+lcXHBHE=; b=UbNMRfSxBL73x1MZShW1BbXz+c
	PiYTCzqEUZKL/RNOlektvKpDKDk+8RpW4JTEOaJnXQ4AmJu69gJZTcuuBihviSDJTE2WNW8kXPSEk
	+dRoEsyH9Wbz0Po9jYItM3WA/a9ObkGlSCW85DngpqbOkg/kk9jm1FaiBhV8NStpudB1DM6yQgs0N
	QEqedW0klQiL8GNdwb4kKEBOwlUv1g+ZAdXPoU8Htwu96/mi+doauY8GNhE+TH7Hr4p9zFTC+7ll2
	6a6K+swKq/XEiLpAImxeB4PAEvcb1ZavMnQTHoybrQHq5NrhWImp1fp6J0r3a1C+TFeTTtxBDTbob
	p0zodhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlCn-00000005EwZ-1PcS;
	Fri, 19 Apr 2024 10:10:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlBd-00000005EEp-1H81;
	Fri, 19 Apr 2024 10:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5321B61978;
	Fri, 19 Apr 2024 10:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E92EC4AF07;
	Fri, 19 Apr 2024 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521378;
	bh=ZNmSMiuq5wJcBo+EGlGmT/XTyYTDOnZPeAOljaVsq+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ahWAMSh/qjA1VIw8T6MFh+en9clMxEU4B3qAfiuR2mUjkKQfoMNKAeS4jvftgLEb5
	 qSSqgstFp5gDWye9zhwtttDwbRBbFFCZTuMKcUN0XT1BcODl1O4Ms//4qlxOoknNkC
	 YvF7aBqO6o8is/XYHxfDrrPn/rxFytIAZqoC34XtCwUFMjG4lIxdeGIEIDa15E9xY8
	 c8RF8sN9XDL6XPF6GKvqK84TD4Mz5LR7X2k+rXSFlW3nrvv2WB/VsnABFnK5MMKv/q
	 5p9fXZ2OPAziuJkCdUez0XshHVOOmb/8S+YTB+hlNC/CfQ6Pab8fXzMa3R3/Oathp9
	 LQQ+RssYPl26Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4644AC04FF6;
	Fri, 19 Apr 2024 10:09:38 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 19 Apr 2024 13:09:36 +0300
Subject: [PATCH net-next 13/13] net: dsa: mt7530: use priv->ds->num_ports
 instead of MT7530_NUM_PORTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240419-for-netnext-mt7530-improvements-4-v1-13-6d852ca79b1d@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713521374; l=1820;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=zwYuUUVIbXmvRXAn0iA1vobSjJIppJvvXAmZxGXeCM8=;
 b=fe6mJg0I8EYeeDH1SRaOoku+kWHl7bJSQMptDTwIIsKsJjM2Ye2E/BZe2PgrQWFS3Q+DLWrY6
 M/7B5bZqr4yBBq/kg9oZ6WE/NN10dRp5OB3IueAP5ByiUJ0dMCiYOS+
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_030941_638634_AC1137BB 
X-CRM114-Status: GOOD (  10.71  )
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

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5e69ff0a4b24..55954a165a15 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1411,7 +1411,7 @@ mt7530_port_set_vlan_unaware(struct dsa_switch *ds, int port)
 	mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
 		   G0_PORT_VID_DEF);
 
-	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+	for (i = 0; i < priv->ds->num_ports; i++) {
 		if (dsa_is_user_port(ds, i) &&
 		    dsa_port_is_vlan_filtering(dsa_to_port(ds, i))) {
 			all_user_ports_removed = false;
@@ -2428,7 +2428,7 @@ mt7530_setup(struct dsa_switch *ds)
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
-	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+	for (i = 0; i < priv->ds->num_ports; i++) {
 		/* Clear link settings and enable force mode to force link down
 		 * on all ports until they're enabled later.
 		 */
@@ -2539,7 +2539,7 @@ mt7531_setup_common(struct dsa_switch *ds)
 	mt7530_clear(priv, MT753X_MFC, BC_FFP_MASK | UNM_FFP_MASK |
 		     UNU_FFP_MASK);
 
-	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+	for (i = 0; i < priv->ds->num_ports; i++) {
 		/* Clear link settings and enable force mode to force link down
 		 * on all ports until they're enabled later.
 		 */
@@ -2626,7 +2626,7 @@ mt7531_setup(struct dsa_switch *ds)
 	priv->p5_sgmii = !!(val & PAD_DUAL_SGMII_EN);
 
 	/* Force link down on all ports before internal reset */
-	for (i = 0; i < MT7530_NUM_PORTS; i++)
+	for (i = 0; i < priv->ds->num_ports; i++)
 		mt7530_write(priv, MT753X_PMCR_P(i), MT7531_FORCE_MODE_LNK);
 
 	/* Reset the switch through internal reset */

-- 
2.40.1



