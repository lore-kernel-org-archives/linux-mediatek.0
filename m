Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB47C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNuvrGSIwTA5NXb6MRBDQvk5XI9567Ybm3Y4p+pxJr8=; b=UxgPSewVtK2yVODFesweesXu8+
	44DZi9Ms9XV308lxh+lT+YY1tUcjugj4UYCY1SGTEimm4OrbYhPzq5bBc07hilG5QW6OUq2KNzf9a
	5yULjJUYJjBZClW0iIU6O3hC+UfqEJxLgkan5fhbBAw0GnsRG6YXCDVDXA44IrL0IJcf2/ArSyyzQ
	7IVFnTHJxD1fGYyNE4xTzzvd+gsK7aq0aAkf9aXE5ojvAqmQWr2HXMzXLFTXcpiHx1FrSBc2XG/in
	8dG/4HLdTaL1eBIL1ucgzTfyojVtz56XG6/DAt3WINzPQYsfhDmwppVZUSOVjVWW0rXfpbYwwj92h
	rCtra+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZa3I-001UWk-M1; Tue, 07 Mar 2023 16:20:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZa2R-001U6I-Uq; Tue, 07 Mar 2023 16:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dNuvrGSIwTA5NXb6MRBDQvk5XI9567Ybm3Y4p+pxJr8=; b=abk7n52huIepcKyAXkjAnUx989
	IaRhFRd2yps55vUBvXSe44XBENZWVB4pSq4ZRVW4s5g1RGiY9TgQtVTQpN3pxXIFEROzcvBMzWVrm
	nXsrU5bFaAHyXVVCRT/U4RK8gg3WPGEFvfXi02fd7OVqN72RJD/887stiav6LdGTNENoD3qzpAb3K
	/BAm5m+TbqkYliv9Zp0/GDdAYJOisPwswc6IfnBJ600tAef6JHKhdRD/FzqxZVXE39qUB2eFXye9i
	VlvDSnvUhQd65Z+dCu+hTfn2JQaKA+KfZF/fFMoCo5m0CjKUwRZhNSsoVYQykd46sYPFuVbshClPB
	Rg0EbQLQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58696 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1pZa2L-0000nJ-FZ; Tue, 07 Mar 2023 16:19:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1pZa2K-00DFfR-Q8; Tue, 07 Mar 2023 16:19:36 +0000
In-Reply-To: <ZAdj9qUXcHUsK7Gt@shell.armlinux.org.uk>
References: <ZAdj9qUXcHUsK7Gt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>,
	 Felix Fietkau <nbd@nbd.name>,
	 John Crispin <john@phrozen.org>,
	 Mark Lee <Mark-MC.Lee@mediatek.com>,
	 Matthias Brugger <matthias.bgg@gmail.com>,
	 Sean Wang <sean.wang@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 3/4] net: mtk_eth_soc: remove unnecessary checks in
 mtk_mac_config()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1pZa2K-00DFfR-Q8@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Mar 2023 16:19:36 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_081944_050761_E7B310D4 
X-CRM114-Status: GOOD (  11.26  )
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

mtk_mac_config() checks that the interface mode is permitted for the
capabilities, but we already do these checks in mtk_add_mac() when
initialising phylink's supported_interfaces bitmap. Remove the
unnecessary tests.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 1b385dfe620f..f78810717f66 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -458,12 +458,6 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		/* Setup soc pin functions */
 		switch (state->interface) {
 		case PHY_INTERFACE_MODE_TRGMII:
-			if (mac->id)
-				goto err_phy;
-			if (!MTK_HAS_CAPS(mac->hw->soc->caps,
-					  MTK_GMAC1_TRGMII))
-				goto err_phy;
-			fallthrough;
 		case PHY_INTERFACE_MODE_RGMII_TXID:
 		case PHY_INTERFACE_MODE_RGMII_RXID:
 		case PHY_INTERFACE_MODE_RGMII_ID:
@@ -480,11 +474,9 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		case PHY_INTERFACE_MODE_1000BASEX:
 		case PHY_INTERFACE_MODE_2500BASEX:
 		case PHY_INTERFACE_MODE_SGMII:
-			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII)) {
-				err = mtk_gmac_sgmii_path_setup(eth, mac->id);
-				if (err)
-					goto init_err;
-			}
+			err = mtk_gmac_sgmii_path_setup(eth, mac->id);
+			if (err)
+				goto init_err;
 			break;
 		case PHY_INTERFACE_MODE_GMII:
 			if (MTK_HAS_CAPS(eth->soc->caps, MTK_GEPHY)) {
-- 
2.30.2


