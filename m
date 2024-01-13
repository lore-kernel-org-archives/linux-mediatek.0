Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04336C4706C
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jan 2024 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb/lI7hBqz+FVwkR+R0zS6IF7AIMf5rntcDsWJvVb3Q=; b=1vVF8J+pJ5k+9elcyEdLf3jC+W
	yr3dufT7IAz7CrH+vEmkn5BTSI60+E+pXe2MN915Od5CVfKRQcmEnSwjdeNHwWy1vffDTjy9px7FC
	P4Xc1WYAh/Y9dbfhUhX4hs5+e5zjcSKihOzLs28TXuohPKuLC/OtthtXuMLXCbw/L/ENidntiG19h
	/D//cNk14vm8hbMQVd+3uZj0lhXWM2+Kk5KxKeHFT6M844bAxKpuMTN7VxPJUrG2hNuebcIT5tRU4
	0+p5KzKMrB2uax99LwV43PIBZWpdqwJl3sCgPBUlAHrIsvkBgYhbMbAkS9x2c905yxShOxg2ihFL6
	ER5Vuysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rObDR-004tFO-36;
	Sat, 13 Jan 2024 10:26:13 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rObDI-004tCA-1f;
	Sat, 13 Jan 2024 10:26:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2387D60009;
	Sat, 13 Jan 2024 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705141563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qb/lI7hBqz+FVwkR+R0zS6IF7AIMf5rntcDsWJvVb3Q=;
	b=fswUsERhLcCzaPS6CiOPvNyYkOrnXVsAZS3BH1uQ6br/+SY3WwvAAtHsWiJt7PUXYOR5H+
	8WpdecIGPEpsfgQC38Fuwzib1JX0YPF0Pw1K+NS3YDLKSvhQYozRQX4aXEpCz0WfoHNtTE
	hXRMOF4439LVryAoFHc0lzvByiAHV/DmefCTbYcAxF2gZEAvuFfVHw595+oB1nqhynQByC
	cLppgGNrXaszjfhrtP6aInl3KZxp9mws2L6N7Vn1yBxZ5eyqTxxVW2Ny1ONGlLsjKu5Nod
	BVuJNQOrbXcwY1jkJyvLJXeYbpWWJ7yFEh1F7m8GwX6OTZXkSv1P8VLEVbOEpg==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 4/8] net: dsa: mt7530: move XTAL check to mt7530_setup()
Date: Sat, 13 Jan 2024 13:25:25 +0300
Message-Id: <20240113102529.80371-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240113102529.80371-1-arinc.unal@arinc9.com>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_022604_706484_3D019B5A 
X-CRM114-Status: GOOD (  12.35  )
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

The crystal frequency concerns the switch core. The frequency should be
checked when the switch is being set up so the driver can reject the
unsupported hardware earlier and without requiring port 6 to be used.

Move it to mt7530_setup(). Drop the unnecessary function printing.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/mt7530.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 823dc3ab15c8..d3e1e31ac8d0 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -422,13 +422,6 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 
 	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
 
-	if (xtal == HWTRAP_XTAL_20MHZ) {
-		dev_err(priv->dev,
-			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
-			__func__);
-		return -EINVAL;
-	}
-
 	switch (interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		trgint = 0;
@@ -2235,6 +2228,12 @@ mt7530_setup(struct dsa_switch *ds)
 		return -ENODEV;
 	}
 
+	if ((val & HWTRAP_XTAL_MASK) == HWTRAP_XTAL_20MHZ) {
+		dev_err(priv->dev,
+			"MT7530 with a 20MHz XTAL is not supported!\n");
+		return -EINVAL;
+	}
+
 	/* Reset the switch through internal reset */
 	mt7530_write(priv, MT7530_SYS_CTRL,
 		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
-- 
2.40.1


