Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEFCC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPhQTZxBab4ufG3A5RcvU+2T8JQbUsDstYw6d3ZLLiw=; b=Jfb+q7acTjW83l
	5KT4tONnYiyeersmU79V/ZgGRx7byVz0QT/c/tVrfdNW1c1etm1+hVa5YjWzHUaV9bHP/hxQ6dMR+
	OrqIuFMrBZVmdoC7B6gdf1OsCZ0nP3aAZWUGXB86dYuWr1XFXwWFM6IFlp7ICuKQBzvnA6qTfaDEo
	NIx7IfpZp9S9uk7IyIDDNgEqM/kZ8VkWyZXVD8num4vTueGIhVjOKVWNbk9F2pVT2a1GUbOEBFJdH
	Gqcvmij29wBDbm2uZHLNSnCkkPDrYD1grJcwT0+nI196DhQ0jY/ol+pjbrTKnZg1xr2rulFzKVAmL
	og9oUWs5jjy1bYv9/kPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Tj-006QC9-1f;
	Mon, 22 May 2023 12:17:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TF-006Pe8-0V;
	Mon, 22 May 2023 12:17:03 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96ff9c0a103so103192766b.0;
        Mon, 22 May 2023 05:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757818; x=1687349818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPhQTZxBab4ufG3A5RcvU+2T8JQbUsDstYw6d3ZLLiw=;
        b=Vh2gMaMcDU8jGTAJ64+I6w7OsRyuFmSt4rWAK1dxNrOoY9tIiRuU75044JIdRePTtO
         NuRK1ZHTVhCCWtrymhT+r6VRukrylRNlGD+PQH/caFXbgixM+lB0fDK2DQ6EZiXRhHPb
         UzdUqwE+r5aTFsVajGP/AgxFxVZ9BWteFm9DrJo2B1465B8RZL71FjHyxbeQ292Eyhow
         JGJb6P/0XbaNmrQ+1mniEKkOxIxeAxZy82IpErLbGpDJRqEytQjhiXEL3T2+ECEeDx8x
         mLxzeIBcMuZn3CxBkCMXqt+emUL24ACR+Gzcv8yabzwR+2HXUwFweAVdFSwE8Mwzj8jm
         /02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757818; x=1687349818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPhQTZxBab4ufG3A5RcvU+2T8JQbUsDstYw6d3ZLLiw=;
        b=flsXkqM3PLGbaSXfebkRdstNwPt5yjrP7DVBuuFiZkrxNk+i6ksstK9FKQ/refPadf
         An+SGe6ZyxCqPZIrdq9l3amrMTq9DBbWY+92d9jLr9FdBKWnV4fA7z12z53E6Px5ZNDs
         D3YWGYxT4IrVkUd3d7EBUZiZpW//dqnoBqf5dvdQ0KSZjmCKm+Dtjqiz4epA817SHTF2
         S9nFaXlWmdOFADd1Xp66TpkhvMkheNhutAFJWXOLRb5WySnFebECBxj+TEfHKsh7mq/o
         G9a9W84sTMc1DEek7KPFEA7ActYyBogaYzSikAB5DjWf+2H2nVk/+hyIjHa70VnT2Azv
         j66Q==
X-Gm-Message-State: AC+VfDyUC94AczFdi+FuDilCBKUhW1AYcpnw13HOdqQ8zfhs5zPrSafu
	niD02eqG6nSAoXNUVJqFga0=
X-Google-Smtp-Source: ACHHUZ61QvAvaJ6JXwAl5ZK+Z+iWCx3i0ErjlAje5iGoTtpti1TXdrNI1eenVMW0q+/1TTrQZTvoBQ==
X-Received: by 2002:a17:907:ea3:b0:96f:f451:187f with SMTP id ho35-20020a1709070ea300b0096ff451187fmr2155579ejc.7.1684757818084;
        Mon, 22 May 2023 05:16:58 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:57 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 24/30] net: dsa: mt7530: rename MT7530_MFC to MT753X_MFC
Date: Mon, 22 May 2023 15:15:26 +0300
Message-Id: <20230522121532.86610-25-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051701_246072_C3F1BD9D 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The MT7530_MFC register is on MT7530, MT7531, and the switch on the MT7988
SoC. Some bits are for MT7530 only. Call the shared ones MT753X, the
MT7530-specific ones MT7530.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 30 +++++++++++++++------------
 drivers/net/dsa/mt7530.h | 44 ++++++++++++++++++++--------------------
 2 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9a4d4413287a..58d8738d94d3 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -955,12 +955,13 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 		     PORT_SPEC_TAG);
 
 	/* Enable flooding on the CPU port */
-	mt7530_set(priv, MT7530_MFC, BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
-		   UNU_FFP(BIT(port)));
+	mt7530_set(priv, MT753X_MFC, MT753X_BC_FFP(BIT(port)) |
+		   MT753X_UNM_FFP(BIT(port)) | MT753X_UNU_FFP(BIT(port)));
 
 	/* Set CPU port number */
 	if (priv->id == ID_MT7621)
-		mt7530_rmw(priv, MT7530_MFC, CPU_MASK, CPU_EN | CPU_PORT(port));
+		mt7530_rmw(priv, MT753X_MFC, MT7530_CPU_MASK, MT7530_CPU_EN |
+			   MT7530_CPU_PORT(port));
 
 	/* CPU port gets connected to all user ports of
 	 * the switch.
@@ -1120,16 +1121,19 @@ mt7530_port_bridge_flags(struct dsa_switch *ds, int port,
 			   flags.val & BR_LEARNING ? 0 : SA_DIS);
 
 	if (flags.mask & BR_FLOOD)
-		mt7530_rmw(priv, MT7530_MFC, UNU_FFP(BIT(port)),
-			   flags.val & BR_FLOOD ? UNU_FFP(BIT(port)) : 0);
+		mt7530_rmw(priv, MT753X_MFC, MT753X_UNU_FFP(BIT(port)),
+			   flags.val & BR_FLOOD ?
+				MT753X_UNU_FFP(BIT(port)) : 0);
 
 	if (flags.mask & BR_MCAST_FLOOD)
-		mt7530_rmw(priv, MT7530_MFC, UNM_FFP(BIT(port)),
-			   flags.val & BR_MCAST_FLOOD ? UNM_FFP(BIT(port)) : 0);
+		mt7530_rmw(priv, MT753X_MFC, MT753X_UNM_FFP(BIT(port)),
+			   flags.val & BR_MCAST_FLOOD ?
+				MT753X_UNM_FFP(BIT(port)) : 0);
 
 	if (flags.mask & BR_BCAST_FLOOD)
-		mt7530_rmw(priv, MT7530_MFC, BC_FFP(BIT(port)),
-			   flags.val & BR_BCAST_FLOOD ? BC_FFP(BIT(port)) : 0);
+		mt7530_rmw(priv, MT753X_MFC, MT753X_BC_FFP(BIT(port)),
+			   flags.val & BR_BCAST_FLOOD ?
+				MT753X_BC_FFP(BIT(port)) : 0);
 
 	return 0;
 }
@@ -1667,13 +1671,13 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 static int mt753x_mirror_port_get(unsigned int id, u32 val)
 {
 	return (id == ID_MT7531) ? MT7531_MIRROR_PORT_GET(val) :
-				   MIRROR_PORT(val);
+				   MT7530_MIRROR_PORT(val);
 }
 
 static int mt753x_mirror_port_set(unsigned int id, u32 val)
 {
 	return (id == ID_MT7531) ? MT7531_MIRROR_PORT_SET(val) :
-				   MIRROR_PORT(val);
+				   MT7530_MIRROR_PORT(val);
 }
 
 static int mt753x_port_mirror_add(struct dsa_switch *ds, int port,
@@ -2327,8 +2331,8 @@ mt7531_setup_common(struct dsa_switch *ds)
 	mt7530_mib_reset(ds);
 
 	/* Disable flooding on all ports */
-	mt7530_clear(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK |
-		     UNU_FFP_MASK);
+	mt7530_clear(priv, MT753X_MFC, MT753X_BC_FFP_MASK | MT753X_UNM_FFP_MASK
+		     | MT753X_UNU_FFP_MASK);
 
 	for (i = 0; i < MT7530_NUM_PORTS; i++) {
 		/* Disable forwarding by default on all ports */
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 216081fb1c12..5ebb942b07ef 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -32,35 +32,35 @@ enum mt753x_id {
 #define SYSC_REG_RSTCTRL		0x34
 #define  RESET_MCM			BIT(2)
 
-/* Registers to mac forward control for unknown frames */
-#define MT7530_MFC			0x10
-#define  BC_FFP(x)			(((x) & 0xff) << 24)
-#define  BC_FFP_MASK			BC_FFP(~0)
-#define  UNM_FFP(x)			(((x) & 0xff) << 16)
-#define  UNM_FFP_MASK			UNM_FFP(~0)
-#define  UNU_FFP(x)			(((x) & 0xff) << 8)
-#define  UNU_FFP_MASK			UNU_FFP(~0)
-#define  CPU_EN				BIT(7)
-#define  CPU_PORT(x)			((x) << 4)
-#define  CPU_MASK			(0xf << 4)
-#define  MIRROR_EN			BIT(3)
-#define  MIRROR_PORT(x)			((x) & 0x7)
-#define  MIRROR_MASK			0x7
-
-/* Registers for CPU forward control */
+/* Register for MAC forward control */
+#define MT753X_MFC			0x10
+#define  MT753X_BC_FFP(x)		(((x) & 0xff) << 24)
+#define  MT753X_BC_FFP_MASK		MT753X_BC_FFP(~0)
+#define  MT753X_UNM_FFP(x)		(((x) & 0xff) << 16)
+#define  MT753X_UNM_FFP_MASK		MT753X_UNM_FFP(~0)
+#define  MT753X_UNU_FFP(x)		(((x) & 0xff) << 8)
+#define  MT753X_UNU_FFP_MASK		MT753X_UNU_FFP(~0)
+#define  MT7530_CPU_EN			BIT(7)
+#define  MT7530_CPU_PORT(x)		((x) << 4)
+#define  MT7530_CPU_MASK		(0xf << 4)
+#define  MT7530_MIRROR_EN		BIT(3)
+#define  MT7530_MIRROR_PORT(x)		((x) & 0x7)
+#define  MT7530_MIRROR_MASK		0x7
+
+/* Register for CPU forward control */
 #define MT7531_CFC			0x4
 #define  MT7531_MIRROR_EN		BIT(19)
-#define  MT7531_MIRROR_MASK		(MIRROR_MASK << 16)
-#define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & MIRROR_MASK)
-#define  MT7531_MIRROR_PORT_SET(x)	(((x) & MIRROR_MASK) << 16)
+#define  MT7531_MIRROR_MASK		(0x7 << 16)
+#define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & 0x7)
+#define  MT7531_MIRROR_PORT_SET(x)	(((x) & 0x7) << 16)
 #define  MT7531_CPU_PMAP_MASK		GENMASK(7, 0)
 
 #define MT753X_MIRROR_REG(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
-					 MT7531_CFC : MT7530_MFC)
+					 MT7531_CFC : MT753X_MFC)
 #define MT753X_MIRROR_EN(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
-					 MT7531_MIRROR_EN : MIRROR_EN)
+					 MT7531_MIRROR_EN : MT7530_MIRROR_EN)
 #define MT753X_MIRROR_MASK(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
-					 MT7531_MIRROR_MASK : MIRROR_MASK)
+					 MT7531_MIRROR_MASK : MT7530_MIRROR_MASK)
 
 /* Registers for BPDU and PAE frame control*/
 #define MT753X_BPC			0x24
-- 
2.39.2


