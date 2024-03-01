Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471F0C54E41
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAT6j+peXF1gkbFazeEWy+KKBa3S8oFGztCQAserssk=; b=CnXlLhMkuMnh4QWC143mze3V8m
	2VroIXacztOymLcTC+hRHP90mfpcD74iEL6g/Ilm3xKoWv2zj+4gAck+Fv+5xqLKvS3vZi2URRYHF
	lKpeEx8bzwhqjtXO95zX3we6Ba5hrNSy9LshOXGT2ddrub3nSvh6+7uU96/QeX3dhjxRwUPZOJpb/
	7yTVoWFT2RyHAB7dS8miULQLq4hBEkeVG8rVG944B00Pv8rButuopsdHQlh7E4yy1VhhEF7hnSwj5
	OMgOEOUevkVGIitB2XMv5smQ74pgIZA19bdgZ7eRyU864kK6Ft7LCuanUexzIgq9G3epERxSCZZov
	8U44khAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0MC-0000000HPKq-2WTD;
	Fri, 01 Mar 2024 10:43:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0M1-0000000HPBp-2BNN;
	Fri, 01 Mar 2024 10:43:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A8821CE104D;
	Fri,  1 Mar 2024 10:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF0FEC43390;
	Fri,  1 Mar 2024 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709289778;
	bh=SU+tK2MlpgkdVnVhaHn0UQcoIzpj8l2UDGxN8QSA/B4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WpEW0BK0JGXMO1idR1AAt80adqw95t3pmM5o39e5bqpFB9gcAE5BGHO01sFPl+2Nr
	 OQfyup1xMyM/nN/2xw6r+ddrQqMaMstJvGMv5vHaNyHF/w3gIBx5N5jTAlC/1s7f/O
	 C1VfhxYlqq9xQH0rtOUuQ5EGherYq9515+u8EJ+Q9GPxtMIruS+AYIBX1AkXZcu6ea
	 cl1rAXSMsPDim5WHkFK4cLK/W28CDb6ASNoHmFfERNq4eebR1huk1IOX2LAwSDtZPG
	 dJiMgDRj2Tz/irDnawrM4vcDeXibEMAn5RrMvgwvRBRxFLl8ynxdT3idbmH2qeXWBw
	 8ralK9Wn2QNbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7037C54E55;
	Fri,  1 Mar 2024 10:42:58 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 01 Mar 2024 12:42:58 +0200
Subject: [PATCH net-next v3 2/9] net: dsa: mt7530: set interrupt register
 only for MT7530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240301-for-netnext-mt7530-improvements-3-v3-2-449f4f166454@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709289776; l=921;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=JV5lkSoAmKAO6vEQKKvFpHOlOFc0GQ6XMI05UOpapU0=;
 b=sDN29cEjzp83tM7un6A21yIeFo9LYgnjVC4Xk7q+Zp0J0suaNg8FyIx/eXQTAZUBFsTqh/YNe
 O2TMg3uZy9UDrLLFlOEDdkBqwyN4G4HFBOIdLa+sYPrKWohmmjWu2VF
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront with auth_id=137
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_024302_057449_0CC13A24 
X-CRM114-Status: GOOD (  10.68  )
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

Setting this register related to interrupts is only needed for the MT7530
switch. Make an exclusive check to ensure this.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 94d4b2c87799..5cfd303b773f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2055,7 +2055,7 @@ mt7530_setup_irq(struct mt7530_priv *priv)
 	}
 
 	/* This register must be set for MT7530 to properly fire interrupts */
-	if (priv->id != ID_MT7531)
+	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
 		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
 
 	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,

-- 
2.40.1


