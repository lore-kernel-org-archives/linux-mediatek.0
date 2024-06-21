Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A786EC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASE2ff45mfI6yNO/aB24qN2kLFL28P2tFrAH7hx3tcw=; b=iWp5rOwHeDP8Qe53R8DhgCNIj7
	wkxKLJJAHxilsiCVD4PJlVpf3qa0FpgyugGAOQcNdmWsscAPIolwA/tYn6odUFaAJam2Oy6THim/R
	umdWxE6+VGRIJ4kvelMkICp4HZuyDCISzTdcGa15PakSoOOgrEvuepbbPjOSva3CvkLwRSnS64Vat
	VKbQAyWoht9VibhVjgChvZud5zuLo6BacuxNOQXEXdx0NfLdB73nT5J0tOvpw3IJ0wD24q7i80jff
	RCXbto9b4cl2vBYhUMS+1+IXJptQqlloh6P+c8ALWoGQsAoaFisy4+9giAEN5lFmcA5xWGCw+Vzdd
	DlQOuQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKddO-00000009Cgk-06nP;
	Fri, 21 Jun 2024 12:44:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKddG-00000009Ccz-1OlF;
	Fri, 21 Jun 2024 12:44:47 +0000
X-UUID: 06e870fe2fcc11ef9daba96ee3f3cc8c-20240621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ASE2ff45mfI6yNO/aB24qN2kLFL28P2tFrAH7hx3tcw=;
	b=GKuzOmtFHcRkK8rg4uPH66Y29y5isi6sjgKFdjDRdy3xnjHvwfgDB5JgkIw3pqaY3Gn60XDXMlpUuU9QMLKXSS2yQHHHqLOzR8+XjY2Q41dJ5+6JF89Hd+Arog7S7Lp/Hknhhdc9k/CEkEbZSGnH0loQNTvTNjDkrvMjUNfd3zo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:665ba48f-1f71-4778-9871-17a6445a7854,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:65dedf88-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 06e870fe2fcc11ef9daba96ee3f3cc8c-20240621
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 961594178; Fri, 21 Jun 2024 05:44:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jun 2024 05:24:37 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jun 2024 20:24:37 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v8 06/13] net: phy: mediatek: Hook LED helper functions in mtk-ge.c
Date: Fri, 21 Jun 2024 20:20:38 +0800
Message-ID: <20240621122045.30732-7-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_054446_403947_C0B64870 
X-CRM114-Status: GOOD (  16.44  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

We have mtk-phy-lib.c now so that we can use LED helper functions in
mtk-ge.c(mt7531 part). It also means that mt7531/mt7981/mt7988's
Giga ethernet phys share almost the same HW LED controller design.
Also, add probe function for mt7531 so that it can initialize LED state.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge.c | 105 ++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 9122899..c338bba 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -13,6 +13,10 @@
 #define MTK_PHY_PAGE_EXTENDED_2A30	0x2a30
 #define MTK_PHY_PAGE_EXTENDED_52B5	0x52b5
 
+struct mtk_gephy_priv {
+	unsigned long		led_state;
+};
+
 static void mtk_gephy_config_init(struct phy_device *phydev)
 {
 	/* Enable HW auto downshift */
@@ -57,6 +61,101 @@ static int mt7531_phy_config_init(struct phy_device *phydev)
 	return 0;
 }
 
+static int mt7531_phy_probe(struct phy_device *phydev)
+{
+	struct mtk_gephy_priv *priv;
+
+	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(struct mtk_gephy_priv),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	phydev->priv = priv;
+
+	mtk_phy_leds_state_init(phydev);
+
+	return 0;
+}
+
+static int mt753x_phy_led_blink_set(struct phy_device *phydev, u8 index,
+				    unsigned long *delay_on,
+				    unsigned long *delay_off)
+{
+	struct mtk_gephy_priv *priv = phydev->priv;
+	bool blinking = false;
+	int err = 0;
+
+	if (index > 1)
+		return -EINVAL;
+
+	if (delay_on && delay_off && (*delay_on > 0) && (*delay_off > 0)) {
+		blinking = true;
+		*delay_on = 50;
+		*delay_off = 50;
+	}
+
+	err = mtk_phy_hw_led_blink_set(phydev, index, &priv->led_state,
+				       blinking);
+	if (err)
+		return err;
+
+	return mtk_phy_hw_led_on_set(phydev, index, &priv->led_state,
+				     MTK_GPHY_LED_ON_MASK, false);
+}
+
+static int mt753x_phy_led_brightness_set(struct phy_device *phydev,
+					 u8 index, enum led_brightness value)
+{
+	struct mtk_gephy_priv *priv = phydev->priv;
+	int err;
+
+	err = mtk_phy_hw_led_blink_set(phydev, index, &priv->led_state, false);
+	if (err)
+		return err;
+
+	return mtk_phy_hw_led_on_set(phydev, index, &priv->led_state,
+				     MTK_GPHY_LED_ON_MASK, (value != LED_OFF));
+}
+
+static const unsigned long supported_triggers =
+	(BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+	 BIT(TRIGGER_NETDEV_LINK)        |
+	 BIT(TRIGGER_NETDEV_LINK_10)     |
+	 BIT(TRIGGER_NETDEV_LINK_100)    |
+	 BIT(TRIGGER_NETDEV_LINK_1000)   |
+	 BIT(TRIGGER_NETDEV_RX)          |
+	 BIT(TRIGGER_NETDEV_TX));
+
+static int mt753x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
+					  unsigned long rules)
+{
+	return mtk_phy_led_hw_is_supported(phydev, index, rules,
+					   supported_triggers);
+}
+
+static int mt753x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
+					 unsigned long *rules)
+{
+	struct mtk_gephy_priv *priv = phydev->priv;
+
+	return mtk_phy_led_hw_ctrl_get(phydev, index, rules, &priv->led_state,
+				       MTK_GPHY_LED_ON_SET,
+				       MTK_GPHY_LED_RX_BLINK_SET,
+				       MTK_GPHY_LED_TX_BLINK_SET);
+};
+
+static int mt753x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
+					 unsigned long rules)
+{
+	struct mtk_gephy_priv *priv = phydev->priv;
+
+	return mtk_phy_led_hw_ctrl_set(phydev, index, rules, &priv->led_state,
+				       MTK_GPHY_LED_ON_SET,
+				       MTK_GPHY_LED_RX_BLINK_SET,
+				       MTK_GPHY_LED_TX_BLINK_SET);
+};
+
 static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(0x03a29412),
@@ -75,6 +174,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(0x03a29441),
 		.name		= "MediaTek MT7531 PHY",
+		.probe		= mt7531_phy_probe,
 		.config_init	= mt7531_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.
@@ -85,6 +185,11 @@ static struct phy_driver mtk_gephy_driver[] = {
 		.resume		= genphy_resume,
 		.read_page	= mtk_phy_read_page,
 		.write_page	= mtk_phy_write_page,
+		.led_blink_set	= mt753x_phy_led_blink_set,
+		.led_brightness_set = mt753x_phy_led_brightness_set,
+		.led_hw_is_supported = mt753x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt753x_phy_led_hw_control_set,
+		.led_hw_control_get = mt753x_phy_led_hw_control_get,
 	},
 };
 
-- 
2.34.1


