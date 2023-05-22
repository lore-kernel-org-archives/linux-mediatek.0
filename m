Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBBDC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPQmGsbOPIy9wPstzIBKggjPnfoTVHg5cTQKcX+NZkA=; b=dMid6WToOiV92g
	lPHgXpbYQ99sWO5HtGDVuBJZ/1n2VBAamaPE5yqFKRTqMbOLWA5OLnb9Ov7ELaPgdxQnPyYwcOcdw
	+vr+ICL+dD4kmgxKuMMDgDp6/JHzTM88CKH723gq+qRrvY8aDzI7EPA/UHHI2sqjvfFG3Vqs8mGyG
	iV/2vRyWP0mZTvXsF2HgakySpDv889e/P6g6B0GvD2Zuzb0VsSKIM9xSA8N4fMyqTxIcClgXC/WoH
	FIjfl/G4XZXXwdGTOGqCzYizQijwGWAohgrKUDpsFoWs9KCtsLJ5n9TLjdWImKZE0/Godp+VLWbhi
	5QPNZySs4YPjFd/+Y1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Ts-006QKI-3A;
	Mon, 22 May 2023 12:17:40 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TJ-006PkJ-2O;
	Mon, 22 May 2023 12:17:07 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9700219be87so108416166b.1;
        Mon, 22 May 2023 05:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757824; x=1687349824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPQmGsbOPIy9wPstzIBKggjPnfoTVHg5cTQKcX+NZkA=;
        b=fx8uQ3GYpgRsHyL6dZtp9/EUw/x7/v2NuHFv1Fck7p8yRfR2+KxdHdS5+fR38zWink
         u+GlxOuK0KczPi5WbnTYbRL/djIGyQCkePQ89NngPwMQrudlDBnolgm5G1oHaaakwPxm
         LR18qpdlQquOZsYlAP13riLQOeBZ5xFNOeqsVdkV5FqPP5uW3kNAmGbgf65HJMSzIA3+
         tctwHZWLyvC375W34wStBbYMSPLAYfXt6os0VVaa/u4faCPf4UXTTxxExUGJacy1d33h
         /q/zSFPZ9UGNYK3EqCIi4jfsxexgNbYc4gvHZWE/t1kROWGvinFlre0rvJv31MtoOhLW
         zDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757824; x=1687349824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPQmGsbOPIy9wPstzIBKggjPnfoTVHg5cTQKcX+NZkA=;
        b=btfhETVD57JwqeBHPhkqeTLK68BFnjMSZzi2UYJMXq+lOCI9xJlkpbOI3xqPg5F3vD
         09FE9Hpsk+cMfOaLU6o73QeyyU+CY9taD2agH/8tWVrqGpYNHiQOojk8uPTnfcSp/e0F
         Ru9v4CZGysE1J6ho09xWLBzkARtJHRDd1I4WBC0v5GyNt1daUP3B9HJqbLAFvFnMgILH
         hN9fNR3uQVqs6AaXBloyes7lMko1xjdeOBuBeXiG2j88oEFVjyGUHleYcq5MXeaIJ30L
         n2ewX3BkOtuiT4jzpnLXMp2LaaljnDADtQDuS8lO+nO2/c/lluxhW5kt1wHmd+O3/ZNm
         zOHg==
X-Gm-Message-State: AC+VfDyrgHoXkZr73I+u/F2MjQEoVBmFjQUVArMqtPKxm4b/d3xPIRKx
	+SRqT8gAcgji/23A1eMAXnw=
X-Google-Smtp-Source: ACHHUZ6I1A9bM1EEvi1AGJ9bLFYnfQ5/p5HefY45mD7dPiufH15Hn+5UFV+U6lPAjEgw7X1qcuVXkg==
X-Received: by 2002:a17:907:8390:b0:953:37eb:7727 with SMTP id mv16-20020a170907839000b0095337eb7727mr7799238ejc.43.1684757824116;
        Mon, 22 May 2023 05:17:04 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:17:03 -0700 (PDT)
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
Subject: [PATCH net-next 26/30] net: dsa: mt7530: properly set MT7530_CPU_PORT
Date: Mon, 22 May 2023 15:15:28 +0300
Message-Id: <20230522121532.86610-27-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051705_902894_4C95706D 
X-CRM114-Status: GOOD (  24.15  )
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

The MT7530_CPU_PORT bits represent the CPU port to trap frames to for the
MT7530 switch. There are two issues with the current way of setting these
bits. ID_MT7530 which is for the standalone MT7530 switch is not included.
When multiple CPU ports are being used, the trapped frames won't be
received when the DSA conduit interface, which the frames are supposed to
be trapped to, is down because it's not affine to any user port. This
requires the DSA conduit interface to be manually set up for the trapped
frames to be received.

Address these issues by implementing ds->ops->master_state_change() on this
subdriver and setting the MT7530_CPU_PORT bits there. Introduce the
active_cpu_ports field to store the information of active CPU ports.
Correct the macros, MT7530_CPU_PORT is bits 4 through 6 of the register.

Any frames set for trapping to CPU port will be trapped to the numerically
smallest CPU port which is affine to the DSA conduit interface that is set
up. To make the understatement obvious, the frames won't necessarily be
trapped to the CPU port the user port, which these frames are received
from, is affine to. This operation is only there to make sure the trapped
frames always reach the CPU.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Co-developed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 33 ++++++++++++++++++++++++++++-----
 drivers/net/dsa/mt7530.h |  6 ++++--
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 0b513e3628fe..cd16911fcb01 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -958,11 +958,6 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_set(priv, MT753X_MFC, MT753X_BC_FFP(BIT(port)) |
 		   MT753X_UNM_FFP(BIT(port)) | MT753X_UNU_FFP(BIT(port)));
 
-	/* Set CPU port number */
-	if (priv->id == ID_MT7621)
-		mt7530_rmw(priv, MT753X_MFC, MT7530_CPU_MASK, MT7530_CPU_EN |
-			   MT7530_CPU_PORT(port));
-
 	/* Add the CPU port to the CPU port bitmap for MT7531 and the switch on
 	 * the MT7988 SoC. Any frames set for trapping to CPU port will be
 	 * trapped to the CPU port the user port is affine to.
@@ -2947,6 +2942,33 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static void
+mt753x_master_state_change(struct dsa_switch *ds,
+			   const struct net_device *master,
+			   bool operational)
+{
+	struct mt7530_priv *priv = ds->priv;
+	struct dsa_port *cpu_dp = master->dsa_ptr;
+
+	/* Set the CPU port to trap frames to for MT7530. There can be only one
+	 * CPU port due to MT7530_CPU_PORT having only 3 bits. Any frames set
+	 * for trapping to CPU port will be trapped to the numerically smallest
+	 * CPU port which is affine to the DSA conduit interface that is set up.
+	 */
+	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
+		return;
+
+	if (operational)
+		priv->active_cpu_ports |= BIT(cpu_dp->index);
+	else
+		priv->active_cpu_ports &= ~BIT(cpu_dp->index);
+
+	if (priv->active_cpu_ports)
+		mt7530_rmw(priv, MT753X_MFC, MT7530_CPU_EN |
+			   MT7530_CPU_PORT_MASK, MT7530_CPU_EN |
+			   MT7530_CPU_PORT(__ffs(priv->active_cpu_ports)));
+}
+
 static int mt7988_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
@@ -2996,6 +3018,7 @@ const struct dsa_switch_ops mt7530_switch_ops = {
 	.phylink_mac_link_up	= mt753x_phylink_mac_link_up,
 	.get_mac_eee		= mt753x_get_mac_eee,
 	.set_mac_eee		= mt753x_set_mac_eee,
+	.master_state_change	= mt753x_master_state_change,
 };
 EXPORT_SYMBOL_GPL(mt7530_switch_ops);
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index fd2a2f726b8a..52e5d71a04d3 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -41,8 +41,8 @@ enum mt753x_id {
 #define  MT753X_UNU_FFP(x)		(((x) & 0xff) << 8)
 #define  MT753X_UNU_FFP_MASK		MT753X_UNU_FFP(~0)
 #define  MT7530_CPU_EN			BIT(7)
-#define  MT7530_CPU_PORT(x)		((x) << 4)
-#define  MT7530_CPU_MASK		(0xf << 4)
+#define  MT7530_CPU_PORT(x)		(((x) & 0x7) << 4)
+#define  MT7530_CPU_PORT_MASK		MT7530_CPU_PORT(~0)
 #define  MT7530_MIRROR_EN		BIT(3)
 #define  MT7530_MIRROR_PORT(x)		((x) & 0x7)
 #define  MT7530_MIRROR_MASK		0x7
@@ -753,6 +753,7 @@ struct mt753x_info {
  * @irq_domain:		IRQ domain of the switch irq_chip
  * @irq_enable:		IRQ enable bits, synced to SYS_INT_EN
  * @create_sgmii:	Pointer to function creating SGMII PCS instance(s)
+ * @active_cpu_ports:	Holding the active CPU ports
  */
 struct mt7530_priv {
 	struct device		*dev;
@@ -780,6 +781,7 @@ struct mt7530_priv {
 	struct irq_domain *irq_domain;
 	u32 irq_enable;
 	int (*create_sgmii)(struct mt7530_priv *priv);
+	unsigned long active_cpu_ports;
 };
 
 struct mt7530_hw_vlan_entry {
-- 
2.39.2


