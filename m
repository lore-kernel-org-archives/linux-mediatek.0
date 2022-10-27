Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCB3ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gG6m2d8lo79EoGbi0NkD0qjbcYFyQEmBCLfiNhjgflU=; b=xhOC4iwB5ckLQaEDGuYT1wyMu/
	AHzDajoJZ2utNbLFpbUuuU1FP6uoas5nrVlTbp0pIII1mtw7mG6b52CgnTXdgUXnvGXLXtI9wNIRt
	0xY8Ho+KXcrracEXJkXAY+Aq+Fsj0MmyhTN9U3i5v3ts+MetxZSIi/MIbgCtH4hXkUOOqB3Pu5IcL
	f8Zoyn0rm7XvFUFjcJwBPHpzQlpc0CXXPX8MnZeOvFCIdlio/b6ixamvX4u/BZvBCF0U0AWkRBQS2
	ZtkIOGxlpdK8t+OAs0v0sjwDgF4AUQJlFs9I/2ZZIDtVUfARcIAgEO3kP01SAYCL2q47i8SfDbAIa
	1qsk3Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2vW-00DW4w-0E; Thu, 27 Oct 2022 13:28:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2gh-00DMqm-VO; Thu, 27 Oct 2022 13:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gG6m2d8lo79EoGbi0NkD0qjbcYFyQEmBCLfiNhjgflU=; b=iwagDKSErGz7glCW7sMf0M2xkd
	FTUqaX9+lQMIumKbbKYARdPgro4Rh48bDwi4L22lb8vrsWErtgOTkHTQDaeGUAJaUZkZt5IyYUN53
	nR+R2Bz5cLK2tgduaktSIEBC4II5FLSGyW+quh4VnXDzRSrXD5cjN1VdKvQpszmypnj0rg5YiqZPv
	jOKCYAgb3fTfvuzEhLk+aHD9c4jptkcbTLyUeQ4r+jSket8Ra1I0xiB4BdUyfAfLh/7GHkVZGyost
	hlvryLVNK0/KShAsSMCcLx3dIDr5EawCl10b8UaDgXGjDQil9jatILM5FdXA/Uwhansiy6em8zWqn
	+tYhNlIw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57772 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2eh-0006xg-8m; Thu, 27 Oct 2022 14:10:43 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2eg-00HF7j-LN; Thu, 27 Oct 2022 14:10:42 +0100
In-Reply-To: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
References: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: Eric Dumazet <edumazet@google.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH net-next 02/11] net: mtk_eth_soc: add definitions for PCS
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2eg-00HF7j-LN@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:10:42 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061248_094297_60954257 
X-CRM114-Status: GOOD (  11.31  )
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

As a result of help from Frank Wunderlich to investigate and test, we
know a bit more about the PCS on the Mediatek platforms. Update the
definitions from this investigation.

This PCS appears similar, but not identical to the Lynx PCS.

Although not included in this patch, but for future reference, the PHY
ID registers at offset 4 read as 0x4d544950 'MTIP'.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index b52f3b0177ef..589f27ddc401 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -466,8 +466,10 @@
 #define ETHSYS_DMA_AG_MAP_PPE	BIT(2)
 
 /* SGMII subsystem config registers */
-/* Register to auto-negotiation restart */
+/* BMCR (low 16) BMSR (high 16) */
 #define SGMSYS_PCS_CONTROL_1	0x0
+#define SGMII_BMCR		GENMASK(15, 0)
+#define SGMII_BMSR		GENMASK(31, 16)
 #define SGMII_AN_RESTART	BIT(9)
 #define SGMII_ISOLATE		BIT(10)
 #define SGMII_AN_ENABLE		BIT(12)
@@ -477,13 +479,18 @@
 #define SGMII_PCS_FAULT		BIT(23)
 #define SGMII_AN_EXPANSION_CLR	BIT(30)
 
+#define SGMSYS_PCS_ADVERTISE	0x8
+#define SGMII_ADVERTISE		GENMASK(15, 0)
+#define SGMII_LPA		GENMASK(31, 16)
+
 /* Register to programmable link timer, the unit in 2 * 8ns */
 #define SGMSYS_PCS_LINK_TIMER	0x18
-#define SGMII_LINK_TIMER_DEFAULT	(0x186a0 & GENMASK(19, 0))
+#define SGMII_LINK_TIMER_MASK	GENMASK(19, 0)
+#define SGMII_LINK_TIMER_DEFAULT	(0x186a0 & SGMII_LINK_TIMER_MASK)
 
 /* Register to control remote fault */
 #define SGMSYS_SGMII_MODE		0x20
-#define SGMII_IF_MODE_BIT0		BIT(0)
+#define SGMII_IF_MODE_SGMII		BIT(0)
 #define SGMII_SPEED_DUPLEX_AN		BIT(1)
 #define SGMII_SPEED_MASK		GENMASK(3, 2)
 #define SGMII_SPEED_10			FIELD_PREP(SGMII_SPEED_MASK, 0)
-- 
2.30.2


