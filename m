Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7D7FA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVY0aNBi2uX3F3FjDOJpYswCa2rTCbs26GaqXubXw5k=; b=2Nda/AhABWechGTI5BoVnvByrk
	3UepvaL99rM4HtIuQZRZn32zhYkoKoacUNsh7952UczoLdSLTDqt5w9t99JRGxjRFAx0pUgVjVgoG
	8YmtS6umG5BuxzXGIX3gJx9sDgrxBpUi9OqxerDEnsvXn12whgdG2P1Q9YF4M3H6LYae0aAqv16wb
	G3Urfv6IivwwAinMwnsoWteqzB5oC+cTuMt/4OwABc42w3aPZwLY+jK+0aHu6rKRwyxERfktTLYFr
	DtGMNAnTyLQ1YXydRf472PCDZDh8qt90UPt3fUzJkTCC/qnBVJzPNwoZOz6dQZNHH+zmxTcEGdJGC
	2nVlK3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2lD-00DPdD-KB; Thu, 27 Oct 2022 13:17:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2ev-00DMu9-Ug; Thu, 27 Oct 2022 13:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yVY0aNBi2uX3F3FjDOJpYswCa2rTCbs26GaqXubXw5k=; b=O2wbEizpVC4vYrkOjkunyHRIyY
	gVCSSxLZZRy7pDzxeFdCgSJS1XIX6ORcMjjHoZx2NHKH2vpwMBuHe55CaD40Db87ukQyq6X1yuGfh
	xl24ntdAxW3caGcwc6h1lQ+KKl9EaU4LKamlkYvad2JqiArDM7/hQh/vHJvpNMtLBFowzDcpHN4ya
	WxdIlqiPbBkPae0iaG8bGdtfWuD9C5Ixltb+875O9ZaedoYaVGRuO78DetEBquInM3I/7XYe3DaCH
	ALVRjGHCL1JxSqSTcBz3CxsR3aKRIcjBvSd63w99nsPIw+cnGLxpzdxpsTZYmQc+y0zOPIZZVBN7l
	wezNlqpg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52994 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2er-0006yD-L0; Thu, 27 Oct 2022 14:10:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2eq-00HF7w-ST; Thu, 27 Oct 2022 14:10:52 +0100
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
Subject: [PATCH net-next 04/11] net: mtk_eth_soc: add pcs_get_state()
 implementation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2eq-00HF7w-ST@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:10:52 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061058_299796_D0A71EBA 
X-CRM114-Status: GOOD (  10.20  )
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

Add a pcs_get_state() implementation which uses the advertisements
to compute the resulting link modes, and BMSR contents to determine
negotiation and link status.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 7637ba16b44b..63785bd9a118 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -19,6 +19,20 @@ static struct mtk_pcs *pcs_to_mtk_pcs(struct phylink_pcs *pcs)
 	return container_of(pcs, struct mtk_pcs, pcs);
 }
 
+static void mtk_pcs_get_state(struct phylink_pcs *pcs,
+			      struct phylink_link_state *state)
+{
+	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
+	unsigned int bm, adv;
+
+	/* Read the BMSR and LPA */
+	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
+	regmap_read(mpcs->regmap, SGMSYS_PCS_ADVERTISE, &adv);
+
+	phylink_mii_c22_pcs_decode_state(state, FIELD_GET(SGMII_BMSR, bm),
+					 FIELD_GET(SGMII_LPA, adv));
+}
+
 /* For SGMII interface mode */
 static void mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 {
@@ -117,6 +131,7 @@ static void mtk_pcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
 }
 
 static const struct phylink_pcs_ops mtk_pcs_ops = {
+	.pcs_get_state = mtk_pcs_get_state,
 	.pcs_config = mtk_pcs_config,
 	.pcs_an_restart = mtk_pcs_restart_an,
 	.pcs_link_up = mtk_pcs_link_up,
-- 
2.30.2


