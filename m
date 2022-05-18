Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35765C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bl7S8u6vnuR7MVl/Mqjq9RjyuwzhgEMzlzVofy4H9w=; b=wO/gvVCpjPAzmz
	NNKXnxHGVnfznA1aM+7GXg5hd1gpR2ZmgS3WP5D7/3SV8+XWSLEGd5tZ4TvyfOyDixYoX0Na0+x45
	XQ0dg1GC8X3pTP5yZG1M79+EGWn9gCIOFf8UV4F2x3lrOuA+yEtkJcqzvdlvAj+PHLnbK9imAaVeL
	TOvcc+pru4IlY0kY4lHPsrQZPwq1wWRKI2oKONnpPJIfbpYWCWZdDkAtZ6ICPF/+IaPHp3WhictM3
	2qaWrs9caev7VoOwDQ5RvONAUY4gW+MKGBFMyAmQFmX7jJYwnWs6xMbFm32Ai38BqPunMzlupG8A2
	h44WsFgF2DCoRyBgjn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL4e-002cn6-Ei; Wed, 18 May 2022 14:54:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL4Q-002cfR-9i; Wed, 18 May 2022 14:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z69QQqNTWhks6DygVtXpgOVhx8EIwCdMq4wrt9xHhLA=; b=cTSHxzz9Xfd0eA4GtTrXms9kxh
 w5VC5H8JG9bO7lt9lhsRUWOdJ0P6KattN1o3/F7KG3zO9xJeg575syKfyjzwEGC/8zrtKiQWXaO9K
 o73uiQZoAvqnPE1CqoABWnpprNGjvGBmEK3iQsDDXXT6X5CkH6nP6CVBxWDXFH3QIiYG1WY+BOxUQ
 hR37E9Kju/K2k7LJINL1LAsrliCFanX5Hz/4R7kQbt4Ptx1DkxBa4bBZJnhYStyRuQ6kFfSOXX4AC
 HMbYREODPSoIChr0IRsBR4DYp9AvkqNvHIlrXlOMkH8HAnw+Q5DcRoj8XtKkVkplGVxX1G1LIABO0
 po7SqciA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38608 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nrL4K-0002Df-0E; Wed, 18 May 2022 15:54:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nrL4J-00AM4d-Qw; Wed, 18 May 2022 15:54:31 +0100
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Eric Dumazet <edumazet@google.com>
Subject: [PATCH net-next 01/12] net: mtk_eth_soc: remove unused mac->mode
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nrL4J-00AM4d-Qw@rmk-PC.armlinux.org.uk>
Date: Wed, 18 May 2022 15:54:31 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075438_389570_54ABC409 
X-CRM114-Status: GOOD (  10.22  )
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
index 31c5da5d6b72..b45469ad5ce7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2982,7 +2982,6 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	/* mac config is not set */
 	mac->interface = PHY_INTERFACE_MODE_NA;
-	mac->mode = MLO_AN_PHY;
 	mac->speed = SPEED_UNKNOWN;
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index b04977fa84f6..b292ee2d6575 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -999,7 +999,6 @@ struct mtk_eth {
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
