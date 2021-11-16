Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2030CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E34EB619E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E34EB619E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjD9D2iCDpp8Ro6HiLKQj6xBBnMqkcnm+myAJBr9/+0=; b=zRkqKH6QuDbNAe
	W0KPXguL8XHJQJjCXpdjEFBaAPFpRvDwA9S0x9Ec/fl0nJqEovejqhcNtdNIcJF5wgZRyQSoEXZyr
	x5EuQuj3WxCqMY9IyS4yL5VQ7l/HcRi1aZQy88QYAzKlB1Nrob+09oovyTu/sTR+bioiavNJIb8G1
	xOeJM8h/qlDP5cCFCyjIhF8B9uyaLjxSiC8/L2keTZzPK96gTre6zyjWrEtKteIDgCnra42e2NfGy
	tWjdIP616ql1wFcRslTtWQ39p4xpKEieg+fsmznojrbUgXl84NHt0T+LTR1/4Hf2Zpg7HzgI7i0TX
	RMVlky+kDxvfOFwU1Bxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvNw-0016Ex-QB; Tue, 16 Nov 2021 10:08:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvMf-0015cB-H0; Tue, 16 Nov 2021 10:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1UffHZf+PQn8gcJrkq9n0w/iIiec6NH9F4LRAB/vcKk=; b=joQnlDOCr3NRdzEfijqKIFferF
 KX+/szz/wmNbp/f1JiRKY0Bm+Bi3YEmoLezrYMZft5QIV/PV0YlnU9ji3+fjJ9yckhZztT3uuk/Pe
 PpAOGDe8tBENujcg7vKKtdOvN2SS2f3UqIscl6UO0Jek7QoXbz/JqU4wkffxU61pp8+vKLuelE5gC
 kifNjqjphLxKn0IYv5on1CQMqsQExau2noDU79PfiWlWXCT+JVRXbKD9aX8lrTtYBbF0iLbM8SNSF
 MY+6FrwpBOuey2uTVtbYR8iw/Z9xKQmnn4tbvPOvC6DmMtq70J9gJfGSYxa5icfMBygwk2Sub30x4
 K6Hat7eA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39842 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mmvMc-0000MF-7g; Tue, 16 Nov 2021 10:06:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mmvMb-0078bU-Oe; Tue, 16 Nov 2021 10:06:53 +0000
In-Reply-To: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
References: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 3/4] net: mtk_eth_soc: drop use of
 phylink_helper_basex_speed()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mmvMb-0078bU-Oe@rmk-PC.armlinux.org.uk>
Date: Tue, 16 Nov 2021 10:06:53 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_020657_758629_E8AB1640 
X-CRM114-Status: GOOD (  11.08  )
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

Now that we have a better method to select SFP interface modes, we
no longer need to use phylink_helper_basex_speed() in a driver's
validation function, and we can also get rid of our hack to indicate
both 1000base-X and 2500base-X if the comphy is present to make that
work. Remove this hack and use of phylink_helper_basex_speed().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 31872594c790..98f9a6ed9584 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -477,8 +477,9 @@ static void mtk_validate(struct phylink_config *config,
 		phylink_set(mask, 1000baseT_Full);
 		break;
 	case PHY_INTERFACE_MODE_1000BASEX:
-	case PHY_INTERFACE_MODE_2500BASEX:
 		phylink_set(mask, 1000baseX_Full);
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
 		phylink_set(mask, 2500baseX_Full);
 		break;
 	case PHY_INTERFACE_MODE_GMII:
@@ -508,11 +509,6 @@ static void mtk_validate(struct phylink_config *config,
 
 	linkmode_and(supported, supported, mask);
 	linkmode_and(state->advertising, state->advertising, mask);
-
-	/* We can only operate at 2500BaseX or 1000BaseX. If requested
-	 * to advertise both, only report advertising at 2500BaseX.
-	 */
-	phylink_helper_basex_speed(state);
 }
 
 static const struct phylink_mac_ops mtk_phylink_ops = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
