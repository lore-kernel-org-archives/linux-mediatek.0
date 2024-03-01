Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6080C54E41
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne7hOGU2S5DStLf3lgxkOQSl3E4nSb1cKjrcJ4FWwQ0=; b=GcOb3TiGGTOCYzbhAi3ZAk1fkm
	NBOuTaXH2flth452YRH142cePnR/POy/E4B2JW9IEzVnbkk2Kxb8Erfy981ceC3TuzvJeIYLj3lr9
	F0FoxSuZ78qSV7aa7ERIQYYH/f1OhTq4T1iy0MrKUYqgkMMFHISMVT6AZos+wwivQ8UV9mFCZlRnj
	AMRanTdlZpg6hSh4XjdSqNo9daS917rRYA7CxLF08CqV+3yhFBv9Ws8LHj4K8l6HrNubfqxuJ+9vm
	625J+2UxnSM9a+HRgYhCoN3Ws1Yrmv/E62xM6/8z8gMS6TefA26Fl1HfEyeNzEzlQeEtgcC0tOCQM
	GmJeGWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0Mg-0000000HPl8-3W78;
	Fri, 01 Mar 2024 10:43:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0M2-0000000HPCL-0WS0;
	Fri, 01 Mar 2024 10:43:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F361CE13B2;
	Fri,  1 Mar 2024 10:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19053C43142;
	Fri,  1 Mar 2024 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709289779;
	bh=bdj2sXbKKEcSVYU72hwdKppcUWhM0GPYmoe4dwmAPtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I8pnK0O6SunHZxJiOSjoPzu6eLrP/erBBlrYjVIt9YA+hIs1pPWabn56SSzh5DK8Q
	 W6yfvcM+9gWMXKH3rWOIXjrgPxzbcIS4LrnPdUZu9Y+Mt1Hfjq12APfcJAKIlz4RBk
	 akfIgkZBR/6ZW0KotndncFGPKuSCKA6YcX2km6VPMVu0CgYrA+hFxKxv0JpgvYq6Io
	 mwybjn1zxwhkAE1xw/hbpn87cmULjWhfqtxMEaBX3cJQhJmnneYUSASgMyOFqD0gJV
	 ig2I7GdDEuN8npR8zGWBITMZhseJlbZdtGG7RJGsAnTMqo1/M5qA3N3n47o211KcPC
	 t+/9UCEEgT15g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C52C54E41;
	Fri,  1 Mar 2024 10:42:59 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 01 Mar 2024 12:43:03 +0200
Subject: [PATCH net-next v3 7/9] net: dsa: mt7530: put initialising PCS
 devices code back to original order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240301-for-netnext-mt7530-improvements-3-v3-7-449f4f166454@arinc9.com>
References: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
In-Reply-To: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709289776; l=1570;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=/2CkKGukm0R4V69WhBvbbIMKcr0CwYye/LAy2VcbSV0=;
 b=jhj5rpVeLTk6pp6nZ74IqJOF62xtP/gZRjxzV6gmsJ/mCB/nP34kSs028tQQ0/2WrX6tvkMGJ
 ykUTxIRPKOhARn1bax3sYOsUZQsHfG6i6H4204OyFLMD8QH9wvCic4L
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront with auth_id=137
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_024302_648792_8334C2A5 
X-CRM114-Status: GOOD (  12.05  )
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

The commit fae463084032 ("net: dsa: mt753x: fix pcs conversion regression")
fixes regression caused by cpu_port_config manually calling phylink
operations. cpu_port_config was deemed useless and was removed. Therefore,
put initialising PCS devices code back to its original order.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e353c03dd1db..5c8ad41ce8cd 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2812,17 +2812,9 @@ static int
 mt753x_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
-	int i, ret;
-
-	/* Initialise the PCS devices */
-	for (i = 0; i < priv->ds->num_ports; i++) {
-		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
-		priv->pcs[i].pcs.neg_mode = true;
-		priv->pcs[i].priv = priv;
-		priv->pcs[i].port = i;
-	}
+	int ret = priv->info->sw_setup(ds);
+	int i;
 
-	ret = priv->info->sw_setup(ds);
 	if (ret)
 		return ret;
 
@@ -2834,6 +2826,14 @@ mt753x_setup(struct dsa_switch *ds)
 	if (ret && priv->irq)
 		mt7530_free_irq_common(priv);
 
+	/* Initialise the PCS devices */
+	for (i = 0; i < priv->ds->num_ports; i++) {
+		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
+		priv->pcs[i].pcs.neg_mode = true;
+		priv->pcs[i].priv = priv;
+		priv->pcs[i].port = i;
+	}
+
 	if (priv->create_sgmii) {
 		ret = priv->create_sgmii(priv);
 		if (ret && priv->irq)

-- 
2.40.1


