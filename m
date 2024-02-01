Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD51AC48286
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 19:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=atIGHTVfjGOkVmUnwr9l/bwB1r5aYwj9dEEo3vE0owE=; b=PYEfyWeItfvgFVxI31oV46IlcL
	fChRkHMD/Ir8YtAvdhXrjhBgjnr+NSJNN4VpKR+Ui89FuikSoo51qnAFD5KPkQYRCoGUrHR/C8aty
	i7s9C3xPthBB3gIvNR2rbyEvmCq4b2yha6HcYkY3s3QWE4Uzul/IocSVirr/rXI7SHdVK2bzbjm9p
	ClUax/5rbUUqQqjAouM0H7fmO3vLYEkdukKVeti4pfIl06IIxwdekYoTlnRE/bm9nnA378KQT0yuE
	TMG8kmEyOp98aMKJdj2PspJl6O5ieVscSf4Hhk7wRkPgiuXITjz7a/4Te0yFKuy6AJOJJ7dUbtjbt
	1+yQSf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVcVx-0000000985q-3pyH;
	Thu, 01 Feb 2024 19:14:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVcVt-0000000982Z-3SmO;
	Thu, 01 Feb 2024 19:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE8D8CE1EDC;
	Thu,  1 Feb 2024 19:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E53B6C433C7;
	Thu,  1 Feb 2024 19:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706814855;
	bh=NiRsISIBHuXlqH2ieCf/59MXtemkSuQLhr5MeEKL1MM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=UcdmJCtH4icmMDR0zx363t+aQqj6MqKeESG9PgM/RNd5kQg3Y9+HMefYMcsIX1z7v
	 Mpy9vw7dFHhfQb8l74ea9zGWi4ub6jl7WprxwG49y0bKR+UMzLxfl1UnUvCsiRLUbZ
	 M0Ft5g+GoeCwYILUDiewQk6UmE9fGAwesMqDbkOSoIxuEA1zVwlyMaaatUke0qSi7B
	 aGhWFKgc7jIlyMf2a/WJl5M+0fSKNik05RN/InHpohK7SGAL6RzKcdOJ8q6W1RBk7v
	 b30GPDvNexAJkL/aFKiSp0zQ6wMkxq2RwbR6jVVokkFdFrvqZDMTGWtQZWkqICKln2
	 QzgDZPRkaF+AA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47B2C48286;
	Thu,  1 Feb 2024 19:14:14 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Thu, 01 Feb 2024 22:13:39 +0300
Subject: [PATCH net RFC] net: dsa: mt7530: fix link-local frames that
 ingress vlan filtering ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: =?utf-8?q?=3C20240201-b4-for-net-mt7530-fix-link-local-that-ingr?=
 =?utf-8?q?ess-vlan-filtering-ports-v1-1-881c1c96b27f=40arinc9=2Ecom=3E?=
X-B4-Tracking: v=1; b=H4sIAGLtu2UC/x2OwQrCMBBEf6Xs2YU0rZZ6FfwAr+IhrZt2MW5KE
 opQ+u+uHmcY3psNMiWmDOdqg0QrZ46ioT5UMM5OJkJ+agZrbGusqXFo0ceEQgXfpTs2Bj1/MLC
 8MMTRBSyzK8gyJcoZ1+BEB6GoRSZcYioZT86avqfO+6EBFS2JlPE/cQcF/7rb9QKPff8CPvmZ5
 KAAAAA=
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706814853; l=4710;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=NR6FY7NS0W62K6YxrLXCI4BoaQfwWXfiPLTrB7jLotg=;
 b=ZSkGlDm9e1ZDbRL/3YmDM+CZyyBLzpAEs9JwsHLJroDz/KwEuO0LCCVfSMq+upnSU+CQayyT2
 tHM69pm8otWCktsgmBzRcE1IWR0PI598xUAqZdCJTt75MWbGWe7RQTg
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_111418_235641_2910F017 
X-CRM114-Status: GOOD (  16.82  )
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
Cc: mithat.guner@xeront.com, =?utf-8?q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, linux-kernel@vger.kernel.org, =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

When a port is vlan filtering, the VLAN egress type of the CPU port is set
to stack mode. This is so that VLAN tags can be appended after hardware
special tag (called DSA tag in the context of Linux drivers). Because of
this, all frames egress the CPU port VLAN-tagged when vlan filtering is
enabled on a port.

This causes issues with link-local frames, specifically BPDUs, because the
software expects to receive them VLAN-untagged.

Set the egress VLAN tag to consistent for these frames so that they egress
the CPU port exactly as they ingress.

With this change, it can be observed that a bridge interface with stp_state
and vlan_filtering enabled will properly block ports now.

One remaining limitation is that the ingress port must have a PVID assigned
to it for the frame to be trapped to the CPU port. A PVID is set by default
on vlan aware and vlan unaware ports. However, when the network interface
that pertains to the ingress port is attached to a vlan_filtering enabled
bridge, the user can remove the PVID assignment from it which would prevent
the link-local frames from being trapped to the CPU port.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
I couldn't figure out a way to bypass VLAN table lookup for link-local
frames to directly trap them to the CPU port. The CPU port is hardcoded for
MT7530. For MT7531 and the switch on the MT7988 SoC, it depends on the port
matrix to choose the CPU port to trap the frames to. Port matrix and VLAN
table seem to go hand in hand so I don't know if this would even be
possible.

If possible to implement, link-local frames must not be influenced by the
VLAN table. They must always be trapped to the CPU port, and trapped
untagged.

Arınç
---
 drivers/net/dsa/mt7530.c | 23 +++++++++++++++--------
 drivers/net/dsa/mt7530.h |  8 +++++++-
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3c1f657593a8..7ff1f8d7e4d6 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1001,16 +1001,23 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 static void
 mt753x_trap_frames(struct mt7530_priv *priv)
 {
-	/* Trap BPDUs to the CPU port(s) */
-	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
+	/* Trap 802.1X PAE frames and BPDUs to the CPU port(s) and egress them
+	 * exactly as they ingress.
+	 */
+	mt7530_rmw(priv, MT753X_BPC, MT753X_PAE_EG_TAG_MASK |
+		   MT753X_PAE_PORT_FW_MASK | MT753X_BPDU_EG_TAG_MASK |
+		   MT753X_BPDU_PORT_FW_MASK,
+		   MT753X_PAE_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
+		   MT753X_PAE_PORT_FW(MT753X_BPDU_CPU_ONLY) |
+		   MT753X_BPDU_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 		   MT753X_BPDU_CPU_ONLY);
 
-	/* Trap 802.1X PAE frames to the CPU port(s) */
-	mt7530_rmw(priv, MT753X_BPC, MT753X_PAE_PORT_FW_MASK,
-		   MT753X_PAE_PORT_FW(MT753X_BPDU_CPU_ONLY));
-
-	/* Trap LLDP frames with :0E MAC DA to the CPU port(s) */
-	mt7530_rmw(priv, MT753X_RGAC2, MT753X_R0E_PORT_FW_MASK,
+	/* Trap LLDP frames with :0E MAC DA to the CPU port(s) and egress them
+	 * exactly as they ingress.
+	 */
+	mt7530_rmw(priv, MT753X_RGAC2, MT753X_R0E_EG_TAG_MASK |
+		   MT753X_R0E_PORT_FW_MASK,
+		   MT753X_R0E_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 		   MT753X_R0E_PORT_FW(MT753X_BPDU_CPU_ONLY));
 }
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 17e42d30fff4..e4e8f2484c25 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -65,12 +65,18 @@ enum mt753x_id {
 
 /* Registers for BPDU and PAE frame control*/
 #define MT753X_BPC			0x24
-#define  MT753X_BPDU_PORT_FW_MASK	GENMASK(2, 0)
+#define  MT753X_PAE_EG_TAG_MASK		GENMASK(24, 22)
+#define  MT753X_PAE_EG_TAG(x)		FIELD_PREP(MT753X_PAE_EG_TAG_MASK, x)
 #define  MT753X_PAE_PORT_FW_MASK	GENMASK(18, 16)
 #define  MT753X_PAE_PORT_FW(x)		FIELD_PREP(MT753X_PAE_PORT_FW_MASK, x)
+#define  MT753X_BPDU_EG_TAG_MASK	GENMASK(8, 6)
+#define  MT753X_BPDU_EG_TAG(x)		FIELD_PREP(MT753X_BPDU_EG_TAG_MASK, x)
+#define  MT753X_BPDU_PORT_FW_MASK	GENMASK(2, 0)
 
 /* Register for :03 and :0E MAC DA frame control */
 #define MT753X_RGAC2			0x2c
+#define  MT753X_R0E_EG_TAG_MASK		GENMASK(24, 22)
+#define  MT753X_R0E_EG_TAG(x)		FIELD_PREP(MT753X_R0E_EG_TAG_MASK, x)
 #define  MT753X_R0E_PORT_FW_MASK	GENMASK(18, 16)
 #define  MT753X_R0E_PORT_FW(x)		FIELD_PREP(MT753X_R0E_PORT_FW_MASK, x)
 

---
base-commit: 4e192be1a225b7b1c4e315a44754312347628859
change-id: 20240201-b4-for-net-mt7530-fix-link-local-that-ingress-vlan-filtering-ports-6a2099e7ffb3

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


