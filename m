Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C640C001E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nM1ZFvnilyS/G7EEYijFjzJbjPNmckCw5XEVt7NtpBM=; b=d9MF2fHKYdHWkTRGUJ/vg2okox
	BomqvsFDapOm9EHoPkId9KdZ0WG7NJ9oYMwU63q+q3l3DwokqjYKDpW1d6J5sEY+EW15zbz/KuwvZ
	7zWRrPOFWZVezr74TjmXxAHiUHHPWAiVo0JNKUoutzCAR+lF/4Vsqu//MsSOkwM1lRoy0eeVJolQB
	YQhta73uuNN+eXavSa/fRuXWG3gfx3BDR71cG3Sv9lugG1PECCC430tq8PSKOchWbHeoeibZswX8J
	DqrkxswePpyRKe7+7xz3Om4kGfU+ArjPbb/oJ729MhizvoRI80i9nXGhtSpvT/tojtK44vAIivxAz
	tmhVYAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkkr-00D0Xe-2e;
	Sat, 12 Aug 2023 09:17:53 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkkp-00D0VP-00;
	Sat, 12 Aug 2023 09:17:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2644E1BF206;
	Sat, 12 Aug 2023 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691831869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nM1ZFvnilyS/G7EEYijFjzJbjPNmckCw5XEVt7NtpBM=;
	b=M4LDCttven4/mL4MjnPQuo743z5iornYXnvRxiUnGVZocjSnNA+CppF4S0xPXmg2sPM7x+
	ItaVc7rMbi2HOmaNuT+HKtnYvgr+5IBEYWDh3OVmx7E//mx5oTt7DiNeSjjO9ozovrI/wz
	9/GTRfOmKH7QxJTv4e4WfgFhl2DJIpHHZymY5sVN7R7F+/1uMao4IOeidWj482wAn89qJx
	t3taZ4B7D8UKkJc0UpFLT61rIFgi+t0/VNzZxFcoFZk9f5X27nzpEi+k8Pg4mNo0TCVI0H
	HZPVb9RNO7Ob51Ra1mK8fcIwU6GOoi4LeQJvpyt8NQrG0WQuXVP0hXGUlKaLrQ==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Bauer <mail@david-bauer.net>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/4] net: dsa: mt7530: register OF node for internal MDIO bus
Date: Sat, 12 Aug 2023 12:17:08 +0300
Message-Id: <20230812091708.34665-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812091708.34665-1-arinc.unal@arinc9.com>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_021751_181717_D066A007 
X-CRM114-Status: GOOD (  13.77  )
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

From: David Bauer <mail@david-bauer.net>

The MT753x switches provide a switch-internal MDIO bus for the embedded
PHYs.

Register a OF sub-node on the switch OF-node for this internal MDIO bus.
This allows to configure the embedded PHYs using device-tree.

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8fbda739c1b3..9bb805de397a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2152,10 +2152,13 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 {
 	struct dsa_switch *ds = priv->ds;
 	struct device *dev = priv->dev;
+	struct device_node *np, *mnp;
 	struct mii_bus *bus;
 	static int idx;
 	int ret;
 
+	np = priv->dev->of_node;
+
 	bus = devm_mdiobus_alloc(dev);
 	if (!bus)
 		return -ENOMEM;
@@ -2174,7 +2177,9 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	if (priv->irq)
 		mt7530_setup_mdio_irq(priv);
 
-	ret = devm_mdiobus_register(dev, bus);
+	mnp = of_get_child_by_name(np, "mdio");
+	ret = devm_of_mdiobus_register(dev, bus, mnp);
+	of_node_put(mnp);
 	if (ret) {
 		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
 		if (priv->irq)
-- 
2.39.2


