Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2EFC47422
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehY7MTwLJceulhBYYQjUSWYeXY0wgMcqskl/4hnkdS0=; b=FxxrniAYgsTCM1gxFtcTAaqXe/
	czdxDiZXnfvDJHOCCBNMXpCnNoMC36PzQueWfaYu2fbhi9d1yhP/HkdwXDzREH0j1S5B9QZuf6K27
	BhhZD3ecTZMQgqqjjrbINwc7qN2nBo0IWYAAc1xoXOWwPShn/4jlPUkQHY8mzMcyn2tNQpjo6Ayj7
	rK3FKfix83xUCb0zyiTJ3cTt0hKpVRoaOcfuq6zsAEIiXsBuqtithkM0OFxm3LWxf2yYnbuNoFo78
	HCvzqbWk0wrz4Up5HHiKdEOET3gZ7Bz1IARKXXdMU1uTiuQTbgO/299Dp7aKUXIACw7ONoPSSsKAL
	9n4mrx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3AT-00FGpS-1f;
	Wed, 17 Jan 2024 10:29:09 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3AM-00FGkw-22;
	Wed, 17 Jan 2024 10:29:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 804D54000D;
	Wed, 17 Jan 2024 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705487339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehY7MTwLJceulhBYYQjUSWYeXY0wgMcqskl/4hnkdS0=;
	b=GRL4GvMdUAHexlp4cQzFR/2dJ5u3H7CqQ8MdYH3FW78qc5G2tQwAIZ3+ZhbVPOyKJvaxUS
	1dvwq6OfKDKgmUOqbbKdqC5pzGo/sO5UcZJ0pzPQaFvYnt+UNGm1vNp0qCTF2wvWIjRG1j
	XC9zqm69mcl/gfIANIxxGaXH8mK+qhEj6bLgUcTJ5VhP5HfGsh+MWStONR+1ao+PgH/ahT
	7TNxXtDSs7tx3d+dRbc+S46hLoJkdBE79U/T6vG2C6rBClf8pQ6WikwcAZOscJuxuwPfhv
	PvbvrJGnwOj7SKLRrlxpySfzotYA080yQgTzB3xJQqF/EYDnzFo7/nDfXSAuuw==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 2/8] net: dsa: mt7530: set interrupt register only for MT7530
Date: Wed, 17 Jan 2024 13:28:32 +0300
Message-Id: <20240117102838.57445-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240117102838.57445-1-arinc.unal@arinc9.com>
References: <20240117102838.57445-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_022902_833935_5128A1FB 
X-CRM114-Status: GOOD (  11.42  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Setting this register related to interrupts is only needed for the MT7530
switch. Make an exclusive check to ensure this.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c55edbda32bd..d2e861361191 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2054,7 +2054,7 @@ mt7530_setup_irq(struct mt7530_priv *priv)
 	}
 
 	/* This register must be set for MT7530 to properly fire interrupts */
-	if (priv->id != ID_MT7531)
+	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
 		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
 
 	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,
-- 
2.40.1


