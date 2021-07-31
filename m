Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13051C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE91C61042
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE91C61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ImeXj1MnE6uOI20V5RP0FAhVsq2Zc70ylb1TF9CSD8=; b=Ylz3dqHW+8bmW8
	ojWbAPMDFJWtL+TpcScZ0KHVVu4+UWA1M9ywuOpSL+IdnaXZNGM2kGsj93/uqwPoABtjpuSbKqfaI
	Ja4eq7CQVxIXuVeOdkEdY2kSeNmfWbHwln9iLAau3zCFTuKxNK3DWvjEY2Pa2o4XIut1k7Wl/Dfvx
	6VCHyQLvvzsqEojybE1OU+Nm7larsk5AWMdYqVCmUPBInZUmHKo8DYsFXlami+BFeyFzZcp8Ubhnv
	lZQ3nmC2/xozLbaYok1sttCzk2UB65O+2YdF7Lb3cy0rIAHJCX5UNURLJjadmWjl4SEsjZDIzcVxO
	xuCuDyMgE22r4+MBi1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9uOB-00C8qx-Hp; Sat, 31 Jul 2021 19:11:15 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9uNk-00C8k7-D9; Sat, 31 Jul 2021 19:10:50 +0000
Received: by mail-io1-xd2c.google.com with SMTP id z7so14725142iog.13;
 Sat, 31 Jul 2021 12:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ui1ghQZU9vqYbDL9oxFMpsfCj76DKh6DmMSk3j4c9go=;
 b=IzK5BMUxlcOPzwpiXj6Vcp2PzUWremyKAw3fcP8wcsO3wf556DbEXTt0z47XaoObxq
 tfevze+8/7KTYt/KX4Bn9Nya9QlF8q3eFC6iJZbXyWCrgS3et79EiwKpnhuA1EHDSJtO
 A4vaZ/SEAEX96mMUGbXNLgjU9WztFw+RNGHkdi8Dlz1gUU3+2bYAH0eLaoC5t6Hnn6Kz
 bg1Szb5zPYW5ycrPJYPUDANFypACc0RSmZaZcRpPWA5ZfNjrSJtn83qAr3TQNjXBRJNZ
 uitpXGv2f2UiWyBZiMSibcprUjzPxXRY+W6HO2ViPQErHmFcMkADemaIf2GzRAMUhqiF
 FAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ui1ghQZU9vqYbDL9oxFMpsfCj76DKh6DmMSk3j4c9go=;
 b=Fe3//6aDS6LTW1X3Z+bspBRPo+0u2MVy1GcjvmFeSRO8bxsQg58BGFWxpEKhOy4PRL
 HQLnyPCCAXtK0bYvnoNG/RquBLWEgzTaA5AL+XhyIusNbkTFi0HV8gi1dZFpA7y5ENSp
 LnLMbOQQJUfpDHSRSgmZ39+2N0+tGxa6vkxiy9xyyyZruae/3JeCCKN/OMRQsgq0k+dO
 TCkJwfxL5co24h6+FlQVXMR6xAmLLsf4YovNqTR9Kx8vWyGfUrgfIM/3JnaAXc9UJy3m
 g8L2lM+xadwvYUqX3EshYOE5eYLAR9v27Ohvu4RgQSWu5ve+EGVwcL5CFfYsqSEYrlHW
 jFAA==
X-Gm-Message-State: AOAM5333aA3dyyW8sUYUONww3/a7Cs05H0Z8YBfCPiFuI2oYQDUEBAet
 iohtUdu00UFLYTME7TShr3Q=
X-Google-Smtp-Source: ABdhPJwjTvi0wFNqAypM9MQoRJ/pxsI9mf735iL6TchCbUIlzhj3iYmeL03B0+/EkPZK/qxDnX6sXQ==
X-Received: by 2002:a05:6602:59d:: with SMTP id
 v29mr3474332iox.132.1627758647553; 
 Sat, 31 Jul 2021 12:10:47 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g1sm2837991ilq.13.2021.07.31.12.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 12:10:47 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: [RFC net-next v2 2/4] net: dsa: mt7530: use independent VLAN learning
 on VLAN-unaware bridges
Date: Sun,  1 Aug 2021 03:10:20 +0800
Message-Id: <20210731191023.1329446-3-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210731191023.1329446-1-dqfext@gmail.com>
References: <20210731191023.1329446-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_121048_505216_B7942CB9 
X-CRM114-Status: GOOD (  30.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Consider the following bridge configuration, where bond0 is not
offloaded:

         +-- br0 --+
        / /   |     \
       / /    |      \
      /  |    |     bond0
     /   |    |     /   \
   swp0 swp1 swp2 swp3 swp4
     .        .       .
     .        .       .
     A        B       C

Ideally, when the switch receives a packet from swp3 or swp4, it should
forward the packet to the CPU, according to the port matrix and unknown
unicast flood settings.

But packet loss will happen if the destination address is at one of the
offloaded ports (swp0~2). For example, when client C sends a packet to
A, the FDB lookup will indicate that it should be forwarded to swp0, but
the port matrix of swp3 and swp4 is configured to only allow the CPU to
be its destination, so it is dropped.

However, this issue does not happen if the bridge is VLAN-aware. That is
because VLAN-aware bridges use independent VLAN learning, i.e. use VID
for FDB lookup, on offloaded ports. As swp3 and swp4 are not offloaded,
shared VLAN learning with default filter ID of 0 is used instead. So the
lookup for A with filter ID 0 never hits and the packet can be forwarded
to the CPU.

In the current code, only two combinations were used to toggle user
ports' VLAN awareness: one is PCR.PORT_VLAN set to port matrix mode with
PVC.VLAN_ATTR set to transparent port, the other is PCR.PORT_VLAN set to
security mode with PVC.VLAN_ATTR set to user port.

It turns out that only PVC.VLAN_ATTR contributes to VLAN awareness, and
port matrix mode just skips the VLAN table lookup. The reference manual
is somehow misleading when describing PORT_VLAN modes. It states that
PORT_MEM (VLAN port member) is used for destination if the VLAN table
lookup hits, but actually **PORT_MEM & PORT_MATRIX** (bitwise AND of
VLAN port member and port matrix) is used instead, which means we can
have two or more separate VLAN-aware bridges with the same PVID and
traffic won't leak between them.

Therefore, to solve this, enable independent VLAN learning with PVID 0
on VLAN-unaware bridges, by setting their PCR.PORT_VLAN to fallback
mode, while leaving standalone ports in port matrix mode. The CPU port
is always set to fallback mode to serve those bridges.

During testing, it is found that FDB lookup with filter ID of 0 will
also hit entries with VID 0 even with independent VLAN learning. To
avoid that, install all VLANs with filter ID of 1.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 70 ++++++++++++++++++++++++++++------------
 drivers/net/dsa/mt7530.h |  4 ++-
 2 files changed, 53 insertions(+), 21 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7e7e0a35e351..3876e265f844 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1021,6 +1021,10 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_write(priv, MT7530_PCR_P(port),
 		     PCR_MATRIX(dsa_user_ports(priv->ds)));
 
+	/* Set to fallback mode for independent VLAN learning */
+	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+		   MT7530_PORT_FALLBACK_MODE);
+
 	return 0;
 }
 
@@ -1229,6 +1233,10 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			   PCR_MATRIX_MASK, PCR_MATRIX(port_bitmap));
 	priv->ports[port].pm |= PCR_MATRIX(port_bitmap);
 
+	/* Set to fallback mode for independent VLAN learning */
+	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+		   MT7530_PORT_FALLBACK_MODE);
+
 	mutex_unlock(&priv->reg_mutex);
 
 	return 0;
@@ -1241,16 +1249,21 @@ mt7530_port_set_vlan_unaware(struct dsa_switch *ds, int port)
 	bool all_user_ports_removed = true;
 	int i;
 
-	/* When a port is removed from the bridge, the port would be set up
-	 * back to the default as is at initial boot which is a VLAN-unaware
-	 * port.
+	/* This is called after .port_bridge_leave when leaving a VLAN-aware
+	 * bridge. Don't set standalone ports to fallback mode.
 	 */
-	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
-		   MT7530_PORT_MATRIX_MODE);
+	if (dsa_to_port(ds, port)->bridge_dev)
+		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+			   MT7530_PORT_FALLBACK_MODE);
+
 	mt7530_rmw(priv, MT7530_PVC_P(port), VLAN_ATTR_MASK | PVC_EG_TAG_MASK,
 		   VLAN_ATTR(MT7530_VLAN_TRANSPARENT) |
 		   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
 
+	/* Set PVID to 0 */
+	mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
+		   G0_PORT_VID_DEF);
+
 	for (i = 0; i < MT7530_NUM_PORTS; i++) {
 		if (dsa_is_user_port(ds, i) &&
 		    dsa_port_is_vlan_filtering(dsa_to_port(ds, i))) {
@@ -1276,15 +1289,14 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
 	struct mt7530_priv *priv = ds->priv;
 
 	/* Trapped into security mode allows packet forwarding through VLAN
-	 * table lookup. CPU port is set to fallback mode to let untagged
-	 * frames pass through.
+	 * table lookup.
 	 */
-	if (dsa_is_cpu_port(ds, port))
-		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
-			   MT7530_PORT_FALLBACK_MODE);
-	else
+	if (dsa_is_user_port(ds, port)) {
 		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
 			   MT7530_PORT_SECURITY_MODE);
+		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
+			   G0_PORT_VID(priv->ports[port].pvid));
+	}
 
 	/* Set the port as a user port which is to be able to recognize VID
 	 * from incoming packets before fetching entry within the VLAN table.
@@ -1329,6 +1341,13 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			   PCR_MATRIX(BIT(MT7530_CPU_PORT)));
 	priv->ports[port].pm = PCR_MATRIX(BIT(MT7530_CPU_PORT));
 
+	/* When a port is removed from the bridge, the port would be set up
+	 * back to the default as is at initial boot which is a VLAN-unaware
+	 * port.
+	 */
+	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+		   MT7530_PORT_MATRIX_MODE);
+
 	mutex_unlock(&priv->reg_mutex);
 }
 
@@ -1511,7 +1530,7 @@ mt7530_hw_vlan_add(struct mt7530_priv *priv,
 	/* Validate the entry with independent learning, create egress tag per
 	 * VLAN and joining the port as one of the port members.
 	 */
-	val = IVL_MAC | VTAG_EN | PORT_MEM(new_members) | VLAN_VALID;
+	val = IVL_MAC | VTAG_EN | PORT_MEM(new_members) | FID(1) | VLAN_VALID;
 	mt7530_write(priv, MT7530_VAWD1, val);
 
 	/* Decide whether adding tag or not for those outgoing packets from the
@@ -1601,9 +1620,13 @@ mt7530_port_vlan_add(struct dsa_switch *ds, int port,
 	mt7530_hw_vlan_update(priv, vlan->vid, &new_entry, mt7530_hw_vlan_add);
 
 	if (pvid) {
-		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
-			   G0_PORT_VID(vlan->vid));
 		priv->ports[port].pvid = vlan->vid;
+
+		/* Only configure PVID if VLAN filtering is enabled */
+		if (dsa_port_is_vlan_filtering(dsa_to_port(ds, port)))
+			mt7530_rmw(priv, MT7530_PPBV1_P(port),
+				   G0_PORT_VID_MASK,
+				   G0_PORT_VID(vlan->vid));
 	}
 
 	mutex_unlock(&priv->reg_mutex);
@@ -1617,11 +1640,9 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 {
 	struct mt7530_hw_vlan_entry target_entry;
 	struct mt7530_priv *priv = ds->priv;
-	u16 pvid;
 
 	mutex_lock(&priv->reg_mutex);
 
-	pvid = priv->ports[port].pvid;
 	mt7530_hw_vlan_entry_init(&target_entry, port, 0);
 	mt7530_hw_vlan_update(priv, vlan->vid, &target_entry,
 			      mt7530_hw_vlan_del);
@@ -1629,11 +1650,12 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 	/* PVID is being restored to the default whenever the PVID port
 	 * is being removed from the VLAN.
 	 */
-	if (pvid == vlan->vid)
-		pvid = G0_PORT_VID_DEF;
+	if (priv->ports[port].pvid == vlan->vid) {
+		priv->ports[port].pvid = G0_PORT_VID_DEF;
+		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
+			   G0_PORT_VID_DEF);
+	}
 
-	mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK, pvid);
-	priv->ports[port].pvid = pvid;
 
 	mutex_unlock(&priv->reg_mutex);
 
@@ -2134,6 +2156,10 @@ mt7530_setup(struct dsa_switch *ds)
 				return ret;
 		} else {
 			mt7530_port_disable(ds, i);
+
+			/* Set default PVID to 0 on all user ports */
+			mt7530_rmw(priv, MT7530_PPBV1_P(i), G0_PORT_VID_MASK,
+				   G0_PORT_VID_DEF);
 		}
 		/* Enable consistent egress tag */
 		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
@@ -2301,6 +2327,10 @@ mt7531_setup(struct dsa_switch *ds)
 				return ret;
 		} else {
 			mt7530_port_disable(ds, i);
+
+			/* Set default PVID to 0 on all user ports */
+			mt7530_rmw(priv, MT7530_PPBV1_P(i), G0_PORT_VID_MASK,
+				   G0_PORT_VID_DEF);
 		}
 
 		/* Enable consistent egress tag */
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index b19b389ff10a..a308886fdebc 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -148,6 +148,8 @@ enum mt7530_vlan_cmd {
 #define  VTAG_EN			BIT(28)
 /* VLAN Member Control */
 #define  PORT_MEM(x)			(((x) & 0xff) << 16)
+/* Filter ID */
+#define  FID(x)				(((x) & 0x7) << 1)
 /* VLAN Entry Valid */
 #define  VLAN_VALID			BIT(0)
 #define  PORT_MEM_SHFT			16
@@ -247,7 +249,7 @@ enum mt7530_vlan_port_attr {
 #define MT7530_PPBV1_P(x)		(0x2014 + ((x) * 0x100))
 #define  G0_PORT_VID(x)			(((x) & 0xfff) << 0)
 #define  G0_PORT_VID_MASK		G0_PORT_VID(0xfff)
-#define  G0_PORT_VID_DEF		G0_PORT_VID(1)
+#define  G0_PORT_VID_DEF		G0_PORT_VID(0)
 
 /* Register for port MAC control register */
 #define MT7530_PMCR_P(x)		(0x3000 + ((x) * 0x100))
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
