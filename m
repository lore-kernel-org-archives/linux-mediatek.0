Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABFEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rbyDZkPuJMZk60D5BvlJxTnvh8OrBH6SYW3IdJ7nVU=; b=Ki2lg6ts6i37Z7
	se4F9qEO2lgDSjAlwFms/fq6pzX4JGVxBtVaDeDQdIgUdwjmqdmqBuTHbaII1i8vMuMkqZO8hAl9s
	sr/DCGANLqZLLhdvZa8WMMJmeJkQveTr8FPUQeeWmsv3UZBpeHpGPmqI1JrPDsSTcYHGQmxv/A9YW
	5hu/C3FtkvYLBqlKnLP3bPEMShOOT6NLqWAPBsLBuPvWFZWuKkoa7Vx8SRe8U9CAe4U4X3DD614Gu
	RqoXls26gd7J5Hw3EiyA18aojfRCGigmTiFWrl/Sv8jZqSGY82kD98Z8QgyXIegV4Xgcij6Ao9NNQ
	Vg11T+8wSpn6EJE/iF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6pI-006a5Q-Da; Wed, 06 Apr 2022 14:40:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6l6-006Xz2-Om; Wed, 06 Apr 2022 14:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XVocJGw0syYpnJfzHYQoJ7e5WCFSCvmwf3JsfDKxORE=; b=HStDEVrJMxvoW1fCf4q7HpZHJ4
 sXul8yTcVhcd1yZRJhycRpQp4tIZb4ClisuuCF11mGe+tfAIRr9pLuUBD6OndEfFtud/lCV9kBPmP
 VRMzssRr0O6oIdbIBGcYMryvH+bzWI5VK8/T94wF2UYpcCcFwilQ6wHEs+d+yjGXRLcULL1ChCwH4
 9W2M5NqeQ7Em0uEUf0kdUrqGeM6RHSXEhw5SAzVcbrZ77PzGe4Gra1TeMS03BDMN3GLHI1VNQUOR/
 XPPzr0wBFNQle1qPk7jqYDcqHPr8NwdoMmfnt/5Zy3fY9Thxu9z74ipFRrfkMm2iKn4Ka3kQmoDF/
 DdMFpa5g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60678 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6ky-0002vs-8g; Wed, 06 Apr 2022 15:35:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6kx-004ikJ-CY; Wed, 06 Apr 2022 15:35:35 +0100
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
Subject: [PATCH RFC net-next 08/12] net: mtk_eth_soc: add fixme comment for
 state->speed use
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6kx-004ikJ-CY@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:35 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073544_863545_E174C700 
X-CRM114-Status: GOOD (  14.13  )
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

Add a fixme comment for the last remaining incorrect usage of
state->speed in the mac_config() method, which is strangely in a code
path which is only run when the PHY interface mode changes.

This means if we are in RGMII mode, changes in state->speed will not
cause the INTF_MODE, TRGMII_RCK_CTRL and TRGMII_TCK_CTRL registers to
be set according to the speed, nor will the TRGPLL clock be set to the
correct value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index a16f02ed921a..b605a823dcd4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -324,6 +324,14 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 							      state->interface))
 					goto err_phy;
 			} else {
+				/* FIXME: this is incorrect. Not only does it
+				 * use state->speed (which is not guaranteed
+				 * to be correct) but it also makes use of it
+				 * in a code path that will only be reachable
+				 * when the PHY interface mode changes, not
+				 * when the speed changes. Consequently, RGMII
+				 * is probably broken.
+				 */
 				mtk_gmac0_rgmii_adjust(mac->hw,
 						       state->interface,
 						       state->speed);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
