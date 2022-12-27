Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493F5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 23:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO0MXmSJzEk+1zx4vJ29wns0CosdyJgZJOJENWjajGc=; b=fv/BkXglJoIKeQmswRfr5lFyoF
	heDHqYcGgopKX/LqPfJkjWQh7pmNVTHyMOYVsHmEcCLezpWL0Nonl1rNouG78UhaZaugGaJQC8HqP
	4NFLKMxqJviKvCbPfmvmz2P3XlRZj81uSjgkixIOInpD666N/deFItYErLGBua7Kdg9DIUlSWAtSt
	lCkwsMTPyj2vQ2KsNv1PT96jzRHSpVZHeZJIdabnJXV+/BCQmxbGliJhZ4Pm8JgFAn5Sln2W9axuA
	3G0KfzCYOIBs8ycG1CFiNyJq3g3awpYnmWqLHmV/JjobgNJ7RS8z4RfCuRdLMtYoQk3t6kl70MikI
	3mhobfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJJk-00HEIp-NN; Tue, 27 Dec 2022 23:25:08 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJ2i-00H6U5-Ud; Tue, 27 Dec 2022 23:07:35 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6A0FF16DE;
	Wed, 28 Dec 2022 00:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672182447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RO0MXmSJzEk+1zx4vJ29wns0CosdyJgZJOJENWjajGc=;
	b=cYkMqjBQ7dPYmAfVqvYhpwUUd8PAVCQxNAv44EyS5NneWMCaFP2/jQxflBX576GAeO4jN3
	oJ8kQsj589dVFjReDTPEFUy3sTTiOw1rfwUtVWMCX2+Qvk7jVh+iO9WIAW/51LTE08QL7s
	hww9jRl3aRrSVrylqfVG0jYZsZNcNaEV/udoM3iGXcnZJ6NdAP1/RzvmOybXEl4Se6MlVG
	pugns2OvZhW2L2IpeYqDRMuNEU8iw4LqTDn8c3eqA7Pk38UsuUPFb9+M/UJq97k4lGnpT2
	KzwEYzMbJkQI8KW0EtoaLqHKJJKJSE2hhIf/SOjnC33OFAr98y5ofps8kuav5Q==
From: Michael Walle <michael@walle.cc>
Date: Wed, 28 Dec 2022 00:07:21 +0100
Subject: [PATCH RFC net-next v2 05/12] net: mdio: Move mdiobus_c45_addr() next
 to users
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v2-5-ddb37710e5a7@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
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
 Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_150733_292383_6B2B3244 
X-CRM114-Status: GOOD (  11.83  )
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

Now that mdiobus_c45_addr() is only used within the MDIO code during
fallback, move the function next to its only users. This function
should not be used any more in drivers, the c45 helpers should be used
in its place, so hiding it away will prevent any new users from being
added.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/phy/mdio_bus.c | 5 +++++
 include/linux/mdio.h       | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 20ba38a346fe..0b04ce3766c8 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -842,6 +842,11 @@ int __mdiobus_modify_changed(struct mii_bus *bus, int addr, u32 regnum,
 }
 EXPORT_SYMBOL_GPL(__mdiobus_modify_changed);
 
+static u32 mdiobus_c45_addr(int devad, u16 regnum)
+{
+	return MII_ADDR_C45 | devad << MII_DEVADDR_C45_SHIFT | regnum;
+}
+
 /**
  * __mdiobus_c45_read - Unlocked version of the mdiobus_c45_read function
  * @bus: the mii_bus struct
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 1e78c8410b21..97b49765e8b5 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -459,11 +459,6 @@ static inline int mdiodev_modify_changed(struct mdio_device *mdiodev,
 				      mask, set);
 }
 
-static inline u32 mdiobus_c45_addr(int devad, u16 regnum)
-{
-	return MII_ADDR_C45 | devad << MII_DEVADDR_C45_SHIFT | regnum;
-}
-
 static inline u16 mdiobus_c45_regad(u32 regnum)
 {
 	return FIELD_GET(MII_REGADDR_C45_MASK, regnum);

-- 
2.30.2

