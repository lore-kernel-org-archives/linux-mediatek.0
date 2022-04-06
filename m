Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BBAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQ77AzMGkc6fvR0MtKoHIOYhtB8MqQdPC8B7EiVdgEU=; b=Zg9w/rOBCQanXP
	dcPL1pC7MBt1VulMM3Av9POykKyFstic33DqiQNAFk0guQJcHZjGZ6RYnLcQv5dga2hmxm2kbemRB
	Og3JqVF8jnbcGgu0qqkVnRpr3+MZuj5EcctOkfogRs7lWep2sfI9kEA/P+bYDiGHwc6JdY6YTdS4V
	jn5q9b9xsChjOOpgW1F/Xe5EEQ6HcEYnyu/3ITcggs8CYaF/7qZhwbQJ0eK8+St2+sfwzlYur02tb
	2qQ4zMMNamdJFt+Ps9c96P5UIZV6ziGN9G7EmjH7NhebykF5dXOdZBfey5DRokCppL3nAGtrO33Dx
	yz3Yd9fyXbpwyNoWzZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6oc-006ZjD-Ii; Wed, 06 Apr 2022 14:39:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6kz-006XwI-La; Wed, 06 Apr 2022 14:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C+mT+I7C+rLOYe6LNKXzFxNP6ULNetQoJpOopRm5OHY=; b=UGYzJtZnwvhZFBrjhlySSsm0je
 XuHys9yELk2KWm3ynxiYjR8MrDurnKPPskcq6ZXS/MwN/SCsyT1L4qd+ISX/dV5xX4z3+XTfM1dWx
 t90RrSeNZuNwCYVAjK/8Zel1sQhjmKxg3K1WenxL/z992dsYaNm3SkkxZZzXFth4hTvGw0xQ5lMis
 pei/ePQzXLT4RCy6UmhE+qFA8ARmI2agTW1ZeOUhw/cZLvbwbpS9bpeOHDKMv4ZknCiTggIiFf9hF
 RaPCIMhDPE9gEJmi1m/pKO//Z2NUWAyaV66OB4gMx4LUPlDtUviwFIckIBlE/mAajKnD5LHzDo0ip
 1kY0g1Rw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60676 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6kt-0002vc-7Q; Wed, 06 Apr 2022 15:35:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6ks-004ik8-8j; Wed, 06 Apr 2022 15:35:30 +0100
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
Subject: [PATCH RFC net-next 07/12] net: mtk_eth_soc: provide
 mtk_sgmii_config()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6ks-004ik8-8j@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:30 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073537_787162_466ED608 
X-CRM114-Status: GOOD (  12.26  )
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

Provide mtk_sgmii_config() to wrap up the decisions about which SGMII
configuration will be called.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |  7 +------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  5 ++---
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 20 +++++++++++++++++---
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 7f29256b4b3c..a16f02ed921a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -385,12 +385,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		       0 : mac->id;
 
 		/* Setup SGMIISYS with the determined property */
-		if (state->interface != PHY_INTERFACE_MODE_SGMII)
-			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
-							 state->interface);
-		else if (phylink_autoneg_inband(mode))
-			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
-
+		err = mtk_sgmii_config(eth->sgmii, sid, mode, state->interface);
 		if (err)
 			goto init_err;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 93f150bb09dd..4be779109cff 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1004,9 +1004,8 @@ u32 mtk_r32(struct mtk_eth *eth, unsigned reg);
 
 int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *np,
 		   u32 ana_rgc3);
-int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id);
-int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-			       phy_interface_t interface);
+int mtk_sgmii_config(struct mtk_sgmii *ss, int id, unsigned int mode,
+		     phy_interface_t interface);
 void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex);
 void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index b656c8b3ca35..57925910cf80 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -34,7 +34,7 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
 }
 
 /* For SGMII interface mode */
-int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
+static int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
 {
 	unsigned int val;
 
@@ -63,8 +63,8 @@ int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
 /* For 1000BASE-X and 2500BASE-X interface modes, which operate at a
  * fixed speed.
  */
-int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-			       phy_interface_t interface)
+static int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
+				      phy_interface_t interface)
 {
 	unsigned int val;
 
@@ -96,6 +96,20 @@ int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 	return 0;
 }
 
+int mtk_sgmii_config(struct mtk_sgmii *ss, int id, unsigned int mode,
+		     phy_interface_t interface)
+{
+	int err = 0;
+
+	/* Setup SGMIISYS with the determined property */
+	if (interface != PHY_INTERFACE_MODE_SGMII)
+		err = mtk_sgmii_setup_mode_force(ss, id, interface);
+	else if (phylink_autoneg_inband(mode))
+		err = mtk_sgmii_setup_mode_an(ss, id);
+
+	return err;
+}
+
 /* For 1000BASE-X and 2500BASE-X interface modes */
 void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex)
 {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
