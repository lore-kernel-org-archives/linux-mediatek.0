Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A02C71136
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 03:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IBUO2uNKo6cW99tMDi2TTggtzV1GAG9jZeGG97PGh4M=; b=d5UDXnw29Vz48PynkrheCHwewQ
	Pl8WCPLq/FVL2wFZofuKCcDfXq1U72f/vzvbkCo8tOm3M8UTVQkwRCnDZY4sDxQ7IRXSQ86QGHKaV
	B0AABX7lXVkuXOOByV4OWUW9MGNae+6uKklUGWMUNmky4EGxhfIMlfFv7cG/T51rAfGAtrLfpw6ze
	hZ4+Ag1U/IT3qDuRUvskxOGIuawCGBw3MWfDurf6T5n8dVcFYLP7zAoDMXvGoIltc0+pnxcX6bH3n
	VchgEiDCfOO2OBxGaccRtGxSyjWJrY+/k8hZ6ugZNlosngDFAv9et0e0MJtaGvxST/0Rl2t9hkETU
	KF/Y9WXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWpqL-007aLy-2v;
	Fri, 18 Aug 2023 03:08:09 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWpqI-007aLE-0E;
	Fri, 18 Aug 2023 03:08:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qWpq5-00056L-0G;
	Fri, 18 Aug 2023 03:07:53 +0000
Date: Fri, 18 Aug 2023 04:07:46 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: pcs: lynxi: implement pcs_disable op
Message-ID: <f23d1a60d2c9d2fb72e32dcb0eaa5f7e867a3d68.1692327891.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_200806_127039_0BE445E7 
X-CRM114-Status: GOOD (  11.37  )
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

When switching from 10GBase-R/5GBase-R/USXGMII to one of the interface
modes provided by mtk-pcs-lynxi we need to make sure to always perform
a full configuration of the PHYA.

Implement pcs_disable op which resets the stored interface mode to
PHY_INTERFACE_MODE_NA to trigger a full reconfiguration once the LynxI
PCS driver had previously been deselected in favor of another PCS
driver such as the to-be-added driver for the USXGMII PCS found in
MT7988.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index b0f3ede945d96..8501dd365279b 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -233,11 +233,19 @@ static void mtk_pcs_lynxi_link_up(struct phylink_pcs *pcs,
 	}
 }
 
+static void mtk_pcs_lynxi_disable(struct phylink_pcs *pcs)
+{
+	struct mtk_pcs_lynxi *mpcs = pcs_to_mtk_pcs_lynxi(pcs);
+
+	mpcs->interface = PHY_INTERFACE_MODE_NA;
+}
+
 static const struct phylink_pcs_ops mtk_pcs_lynxi_ops = {
 	.pcs_get_state = mtk_pcs_lynxi_get_state,
 	.pcs_config = mtk_pcs_lynxi_config,
 	.pcs_an_restart = mtk_pcs_lynxi_restart_an,
 	.pcs_link_up = mtk_pcs_lynxi_link_up,
+	.pcs_disable = mtk_pcs_lynxi_disable,
 };
 
 struct phylink_pcs *mtk_pcs_lynxi_create(struct device *dev,
-- 
2.41.0

