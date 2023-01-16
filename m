Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668D0C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5Spwn+5qRW864bp5C5OgGPVSnNBAMvY7J7oVAjQX4k=; b=jLeaWbfNXzUR4q7X44V8EEkaqO
	FFF/Z3hDEYvChs8+515bLc5ojZ/VnK5dhwk67lpZf3xIb3YHF5Oo/2KFLzceV5pfCxUmtfGOFWE+8
	rbn8SfUljHwHCqU+l9noaa+woO6ghaZQYAoQwNB93EgWp7cxUhYXZaToAel2fopu1cUR8i9CVjKSD
	RuIqVFvYMqSQFMOE+0Ypb0h4LNip0Rzm4K5RUrzirXldU0F0QWWWUQRYEwQa4pHjdwbOh0lAIA1On
	dBc3WUuPJSkGZ4/PNogCZBNhKpG12G8fBOYmdxuo49EfPnX/ZztItJr3ETz/EjRqNFGKD9hjLQK1C
	6MYmRdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHP5B-00ADyN-6Q; Mon, 16 Jan 2023 12:59:25 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHP1Z-00ACSt-JP; Mon, 16 Jan 2023 12:55:43 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 68D5516E8;
	Mon, 16 Jan 2023 13:55:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673873737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5Spwn+5qRW864bp5C5OgGPVSnNBAMvY7J7oVAjQX4k=;
	b=yEEVhq99moifusghajmavnVyJawstON1afqC5Ff04kQU5FcGh+uBKpXdm+vTexU/67q7MJ
	kNEKHriYbGV8HSHSiTGmNNbXJIDYPz2PCIJL0w513IT7/2JFtP4uLWM5tvmoRwMjo6zV79
	bm9Iy1ZK89C+HNt09RugGpVqIBI5yHMoAFsiR4x8JNl8M+XS3zLGLcIkh4Vs3U0x4RGofZ
	elYe1Bd8q3AOX/HETYv5xgbWsoQ/52E8XVlda3GogtajUnjVfaEEoPPhRNwXhVwOLZrg7f
	za0L4cmjFrEnvbiFWil9a5tSr1ZwDB2XxgTfW+xqEu+OPu/ZSp9YAp/vYTdSjQ==
From: Michael Walle <michael@walle.cc>
Date: Mon, 16 Jan 2023 13:55:16 +0100
Subject: [PATCH net-next 4/6] net: mdio: scan bus based on bus capabilities
 for C22 and C45
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230116-net-next-remove-probe-capabilities-v1-4-5aa29738a023@walle.cc>
References:  <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
In-Reply-To:  <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 Andrew Lunn <andrew@lunn.ch>, Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_045541_865737_1418DCAF 
X-CRM114-Status: GOOD (  11.45  )
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

Now that all MDIO bus drivers which set probe_capabilities to
MDIOBUS_C22_C45 have been converted to use the name API for C45
transactions, perform the scanning of the bus based on which methods
the bus provides.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/phy/mdio_bus.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index f173c91842e0..34790e601cb1 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -710,9 +710,7 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 			goto error_reset_gpiod;
 	}
 
-	if (bus->probe_capabilities == MDIOBUS_NO_CAP ||
-	    bus->probe_capabilities == MDIOBUS_C22 ||
-	    bus->probe_capabilities == MDIOBUS_C22_C45) {
+	if (bus->read) {
 		err = mdiobus_scan_bus_c22(bus);
 		if (err)
 			goto error;
@@ -720,9 +718,7 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 
 	prevent_c45_scan = mdiobus_prevent_c45_scan(bus);
 
-	if (!prevent_c45_scan &&
-	    (bus->probe_capabilities == MDIOBUS_C45 ||
-	     bus->probe_capabilities == MDIOBUS_C22_C45)) {
+	if (!prevent_c45_scan && bus->read_c45) {
 		err = mdiobus_scan_bus_c45(bus);
 		if (err)
 			goto error;

-- 
2.30.2

