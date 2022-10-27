Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216BDFA3746
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCuI3VgccMocVgeiGzU7uyjEe2olId2dWYazu2mv73s=; b=iDLnQL1VxnB80ev5wb9+n6aJ5d
	nRbSa8ihq8Np/Ty6QztcrM3Gb+XYB0DutZU8MsoVrQ//dlzg8UaGJcgD3I/vPYG+m2uBCJOPyg9VX
	v84iM5MMrDY1K1zEeiCGrg6/Z81iL456MkWsRusWrqtGrcwOJLKX820enr+j3w4KKB1Uzg6Amsp2L
	JxlqebaUSSs883iK1GwN0r9ju7w5GR8pgb6uPrWKqop5FAbldQqao4OVT0PEixVTzwzv8cehZILGe
	VhgqLWd34Vs0IX1LArAakS7hqKfvePNQLispYqiIm1e5UgLE2U+g3oSNFmM4tTUWx68tQNRIJiLnS
	kMRxIoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2wf-00DWiw-1B; Thu, 27 Oct 2022 13:29:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2gn-00DMsc-1D; Thu, 27 Oct 2022 13:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hCuI3VgccMocVgeiGzU7uyjEe2olId2dWYazu2mv73s=; b=IYeXflN60pkCp7YIYT1OEoU3Qn
	SfA5sw26Cj+7gzMAkCoJfMgIwUschfjueSTfawVHSEhMDs8oCSnrusije+ouFuWwrFpEQb0nycQWB
	6CWtR5ckhX8DXITSDUkjvx2Nf3hL4ThUShoM5cyMkB/6qRZueKJFB0PQNydE423XanEURT0UiqudG
	A55aj1NVpCh6QFZQ9la1Dl+WRzAIp0sO9WgjXX7B4vHqBe4UmUMcqF5xV1AWIrBN8950l+PwVmcel
	oemZkqTvdypgKCQ3nVL3qFKt3hTaEbaXwr+CnumGStWcf14RJm32PxkhxVwxa/QAAolcnLy9RzYI4
	V9NnzRNw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57774 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2em-0006xx-CG; Thu, 27 Oct 2022 14:10:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2el-00HF7p-P3; Thu, 27 Oct 2022 14:10:47 +0100
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
Subject: [PATCH net-next 03/11] net: mtk_eth_soc: eliminate unnecessary error
 handling
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2el-00HF7p-P3@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:10:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061253_180066_20CC5DB6 
X-CRM114-Status: GOOD (  12.65  )
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

The functions called by the pcs_config() method always return zero, so
there is no point trying to handle an error from these functions. Make
these functions void, eliminate the "err" variable and simply return
zero from the pcs_config() function itself.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 736839c84130..7637ba16b44b 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -20,7 +20,7 @@ static struct mtk_pcs *pcs_to_mtk_pcs(struct phylink_pcs *pcs)
 }
 
 /* For SGMII interface mode */
-static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
+static void mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 {
 	unsigned int val;
 
@@ -39,16 +39,13 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 	regmap_read(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, &val);
 	val &= ~SGMII_PHYA_PWD;
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, val);
-
-	return 0;
-
 }
 
 /* For 1000BASE-X and 2500BASE-X interface modes, which operate at a
  * fixed speed.
  */
-static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
-				    phy_interface_t interface)
+static void mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
+				     phy_interface_t interface)
 {
 	unsigned int val;
 
@@ -73,8 +70,6 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 	regmap_read(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, &val);
 	val &= ~SGMII_PHYA_PWD;
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, val);
-
-	return 0;
 }
 
 static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
@@ -83,15 +78,14 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 			  bool permit_pause_to_mac)
 {
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
-	int err = 0;
 
 	/* Setup SGMIISYS with the determined property */
 	if (interface != PHY_INTERFACE_MODE_SGMII)
-		err = mtk_pcs_setup_mode_force(mpcs, interface);
+		mtk_pcs_setup_mode_force(mpcs, interface);
 	else if (phylink_autoneg_inband(mode))
-		err = mtk_pcs_setup_mode_an(mpcs);
+		mtk_pcs_setup_mode_an(mpcs);
 
-	return err;
+	return 0;
 }
 
 static void mtk_pcs_restart_an(struct phylink_pcs *pcs)
-- 
2.30.2


