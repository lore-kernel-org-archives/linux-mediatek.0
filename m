Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2100C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGv46D7gQHbV4r2vFEsGvofuAnLH9RGfLHYlLw3z8As=; b=4EnFn1hiuCOgIPFL3tKjHlOEwI
	9gfvZofnVIpez5BbjrE2lCIXgG6bqpE2OxP//6LQpY8AnMribvUxTQoMGAP2EoDiVRS1uJ9uKyIFs
	Ym0Zk5XeaQb0D5yRWoz9C4OHPAsrwHzcWqChdTXdGC0UcQBt5SVEAIvEES4zkYEOJZQisDxOaWNQe
	wwY33k2UlleQHw8WYUpcc6YZvZzU3ODTbZF0ZkUPdIz9hRv/njRZQtN58c63aJVVyNTJ62gn9RVd5
	wIMas0Mqlt+osRzdS3ME3VZG6EA3jWS9YabSLnOhX3fbWbqsDiHyhcZ6IaA09cUliU6VRK/bh2xkb
	kLNoM2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEu7c-002GDk-JR; Mon, 09 Jan 2023 15:31:36 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEu6z-002Fsu-LJ; Mon, 09 Jan 2023 15:30:59 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 956E51648;
	Mon,  9 Jan 2023 16:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673278254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PGv46D7gQHbV4r2vFEsGvofuAnLH9RGfLHYlLw3z8As=;
	b=PEgilRI8e8JgdbuJQlHSPKC7r/+jM46S7CttuPFSSJawqdOtgJyWhQdqSpjc8umRy7gM20
	kuLjsvumC9haW/kVQpCk5ytFhfPC5x3fT6OmUlYEhyHapN/wtI4W3pJBwjCVfwQMg3S4az
	O/R18+9lE3qitUNvrdOuZLWpBllChpF7m2J3BeDiweuvsbmNAgmCTu9wbs8SVq2QNAYKVp
	nHf7K7xdPsWLQilsfn67AhFXl1KDYorglkatvcyicKqJ0Imn40zokcPU4IhK9PPrxVtJOh
	lF3zavJWb/CV29dp/1kCYdmI/CDhu/licg2Tuv3oo5uwjcTIekVmJHwYljnppQ==
From: Michael Walle <michael@walle.cc>
Date: Mon, 09 Jan 2023 16:30:43 +0100
Subject:  [PATCH net-next v3 03/11] net: mdio: mdiobus_register: update validation test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v3-3-ade1deb438da@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <michael@walle.cc>, Vladimir Oltean <vladimir.oltean@nxp.com>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_073057_958850_85CBC954 
X-CRM114-Status: GOOD (  12.86  )
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

From: Andrew Lunn <andrew@lunn.ch>

Now that C45 uses its own read/write methods, the validation performed
when a bus is registers needs updating. All combinations of C22 and
C45 are supported, but both read and write methods must be provided,
read only busses are not supported etc.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
v2:
 - [al] be consistent with other checks
 - [mw] make the test a bit easier to read
v3:
 - [mw] use the original validation test style again but with double
   negation
---
 drivers/net/phy/mdio_bus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index bde195864c17..c992a9fd8b01 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -526,8 +526,15 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 	int i, err;
 	struct gpio_desc *gpiod;
 
-	if (NULL == bus || NULL == bus->name ||
-	    NULL == bus->read || NULL == bus->write)
+	if (!bus || !bus->name)
+		return -EINVAL;
+
+	/* An access method always needs both read and write operations */
+	if (!!bus->read != !!bus->write || !!bus->read_c45 != !!bus->write_c45)
+		return -EINVAL;
+
+	/* At least one method is mandatory */
+	if (!bus->read && !bus->read_c45)
 		return -EINVAL;
 
 	if (bus->parent && bus->parent->of_node)

-- 
2.30.2

