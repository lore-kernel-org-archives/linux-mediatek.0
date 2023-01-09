Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AC9C61DB3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 15:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RDMkazwnleO/fGtNxWpy8pqhwNMPSCM9ZW84mCDuiE=; b=pdzFDZf0mg61Fz6CPQjC/lBaCP
	XXu49LGQAgiSQOE2XLraea/YhK2X8pMMa2M9o6a0yZHc6lVBCnEXsq/xn5UCUgl+2/2tKWu3hOxrG
	uEefqIwuXX3tiCLzf0U/uKIfsCUja2ckk0CE1mpl3TlmfaGBD999Lm0rKMFPG4wmoZc5B12UHwBF0
	T8RHgq7JnjaTkMT30kRcZxuwYZ6WG8Xd0cWNHjAwkteOtgi34Xwa83LsDbgLugpZunnm+lzv+Kuuo
	mNLyxUH78H1JIGJnEXcH/NsEspKqxaOHjxsYGSxLd1Nar27Zvpbu7t8il/g5Hh0YYBg0AnzsSOMlD
	d4E9a1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEu96-002HBs-23; Mon, 09 Jan 2023 15:33:08 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEu70-002Fsk-HY; Mon, 09 Jan 2023 15:31:01 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C9F2F15CC;
	Mon,  9 Jan 2023 16:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673278254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RDMkazwnleO/fGtNxWpy8pqhwNMPSCM9ZW84mCDuiE=;
	b=qsEmH9XrJ/gPd9gPF8FJEUHIsI9UnJrp3l36osJeyr5oepbAa3ovWzx7gV/qU4HMWRci8U
	G1I9V6M8urFgukeuwTORqczyc6U9Ic/PTud2II3GFgmc5ThFpqtcKcCTRcb8dErgLn59tg
	WTXjhEWPmGx9QPab7pkiuizzC+FjF5ZuWh0E0RB4EObTB5cRsKzho6b2rUzrKXqPxOxVxI
	SdJrapc0y/QC5wAozScgIg7p46KjnnVdFjh0lm3vlM26VHD7Q8c8T4OSBk2dHzrTHo8aTF
	Xh6xjXJ0MtBzryAvymHpaw/ZHJwCrgAtzXhNeSxOXFcTQ2taolyLB7+mYZkwWA==
From: Michael Walle <michael@walle.cc>
Date: Mon, 09 Jan 2023 16:30:42 +0100
Subject: [PATCH net-next v3 02/11] net: pcs: pcs-xpcs: Use C45 MDIO API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v3-2-ade1deb438da@walle.cc>
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
X-CRM114-CacheID: sfid-20230109_073058_873322_7F218D4B 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

Convert the PCS-XPCS driver to make use of the C45 MDIO bus API for
modify_change().

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2:
 - [al] new patch
---
 drivers/net/pcs/pcs-xpcs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index f6a038a1d51e..bc428a816719 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -199,9 +199,7 @@ int xpcs_write(struct dw_xpcs *xpcs, int dev, u32 reg, u16 val)
 static int xpcs_modify_changed(struct dw_xpcs *xpcs, int dev, u32 reg,
 			       u16 mask, u16 set)
 {
-	u32 reg_addr = mdiobus_c45_addr(dev, reg);
-
-	return mdiodev_modify_changed(xpcs->mdiodev, reg_addr, mask, set);
+	return mdiodev_c45_modify_changed(xpcs->mdiodev, dev, reg, mask, set);
 }
 
 static int xpcs_read_vendor(struct dw_xpcs *xpcs, int dev, u32 reg)

-- 
2.30.2

