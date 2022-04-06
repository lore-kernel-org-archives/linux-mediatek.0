Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB02C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6miidC5VA8HQXh9WKQTtch48KjCAyivdAeRQVYCEaJc=; b=XxNSa3Yca4qQb1
	5quKGq8irYkr1p3nloM1+rofydAf+IoSsJ2C5v0oZ9zCQ6VgTGGDiHPy6EcxzAfom50wbUClEEMhM
	6HsjpVy91iY2TDXZDA6xlXV2D4xAXbvtqZWG24L/YjsW6C63Y1IxtW/OscjX4vkXH4Lpk8Q5Vs2iw
	V1V+/kGfXDwn3RSJMlJ6LVW4jS+/4Do5JPGdywvPM+0FfOj5Wvlh46/nQtTyb3XfDXgzscqgP2GPP
	57cqTHoGkFrjsU36RK05jPHc0xGGBlHonAV15d6HTxB1Wxe3x7dvqGK0oR7giYfQaNrh+uPPbraWk
	Vx3f6D7ML9ZaZCHvcu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6l1-006XxB-NB; Wed, 06 Apr 2022 14:35:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6kW-006XgK-3B; Wed, 06 Apr 2022 14:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DUAo+mqYnAUG+mILjNagVGzTyTx2txWqKx2hHt8JQgQ=; b=DcrJHcfWXhL/+trcV52rNWOE0C
 /NWlUwoJQUt/2aeM3SmW2Da1KIlyDKHOdwmtupE9Hxioj+aVJFiS1/R+mH2NSTmA0nmyNfbm55yrO
 ZC8hhYUccRia7O0Xx0wVuo76lJbCwqa96zot/DYdaNB3A1HJGKaTSRelmdvciftbbj/ky7lPVR7fP
 JjL/kMn5dwKh/bekfVUg3zX6C4f+LfEj/yRiyOuHlEAUDMpk4WO3ED0SYLyzBojRMjKIG+0LO8RsA
 9rKmCNXOPTJ4gZQpbN0brtqh3TQN9x0UHB9kY7crAkQ5w4OtswbhvYoFU9oOpY7Uhiyi7r/oGiGyN
 /MMXtPHA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60662 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6kO-0002tt-Fs; Wed, 06 Apr 2022 15:35:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6kN-004ijV-JN; Wed, 06 Apr 2022 15:34:59 +0100
In-Reply-To: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
References: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 01/12] net: mtk_eth_soc: remove unused mac->mode
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6kN-004ijV-JN@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:34:59 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073508_161969_4C3FA509 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mac->mode is only ever written to in one location, and is thus
superflous. Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 -
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f02d07ec5ccb..e491d43f049a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2968,7 +2968,6 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	/* mac config is not set */
 	mac->interface = PHY_INTERFACE_MODE_NA;
-	mac->mode = MLO_AN_PHY;
 	mac->speed = SPEED_UNKNOWN;
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index c9d42be314b5..2b690f8a5391 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -989,7 +989,6 @@ struct mtk_eth {
 struct mtk_mac {
 	int				id;
 	phy_interface_t			interface;
-	unsigned int			mode;
 	int				speed;
 	struct device_node		*of_node;
 	struct phylink			*phylink;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
