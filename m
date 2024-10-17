Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F08D2F7EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 04:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xk9gQgIOw8bIX1bgWb0fp2SygNjhJrI5pOG2gW4Mk1g=; b=bahcMGlOwb5c5tsmvmbt4GBdAN
	YWRe6WcmWoGbZmV9nWSfUEYNR2B8JZMb3vpE85f+oAi0oNLASkH745Hd5cumqjXRVmrvrEgTzMCKM
	RPjrcKPzbo2oe/m8lZlZUjbUKalb8jiHRiUhPxVBUIs+gTTPi/6ylWPEl3edhFv/y7wd5CHFtKGDy
	Ei1X0qECj8CZKDQocDTS225iWt1tu2VFlZ+WejhcXyXdoNGDyijxpGJz+Kn0xX/0ClIsTMiSUZl1i
	9zQw8ObOYEa+z9YsjVN4GDJxlIqDYQdZ8LFv2xEv3FgmdrHFv0VgVa2Dt9IlXA//NNyXmNGqdcipM
	JjBPO6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1IA4-0000000DitT-3Ccb;
	Thu, 17 Oct 2024 04:30:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H7M-0000000DeTy-0sco;
	Thu, 17 Oct 2024 03:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xk9gQgIOw8bIX1bgWb0fp2SygNjhJrI5pOG2gW4Mk1g=; b=AjpUheB9s2dbn1fvDEpV1MPjxA
	xMpkmNoIBn6p4X81Q7/i5Z/GS+rUpgzOcLjDgmvn+E3k4lcDUiUVeKMtgV5HEOPUAXZ2Hjudjr25s
	Q8EY78s7cXS4mvEdxt8TdcfOyxhHGhlwVJkPBXkOgDE0Xqq9jvF5NbfcPD49AMcYIKIZ7yLBUHu1E
	sBud3DniEn2ZIEvbmRIx181CejtQByHSrpafM4lYVH1Pa2DpUFjwFWroMrGRF9viiHLKZk4OUB2Rb
	TXTx6hCz/++wpGJvg4UFTu6DhJVsFncFEL2+NDTBKqTImAniGy8b25K9J99VO6eGEPWUqfyCOKx9f
	bwY2A5DA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H7E-000000072iW-0ZJC;
	Thu, 17 Oct 2024 03:24:02 +0000
X-UUID: 360a00ec8c3711ef9048ed6ed365623b-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Xk9gQgIOw8bIX1bgWb0fp2SygNjhJrI5pOG2gW4Mk1g=;
	b=b/8moZRDNR6NRcZ1jdYrNBshpeLhkWNz/9qTehKrLS8sSzkPxMl749rqb545cdkMN9tnwgs4A9bROl18Fv1A7yM1Vjq0ifjiGYTX4Swgp5lmsnJXIlYtNxg/b4rskqVH0Ovu2SuXBnavo/vaAILR7/9fcGXy6eCbTlEMhu7cxOo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:518d64ab-9feb-4d1c-b04f-d500e7c83594,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:477fea06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 360a00ec8c3711ef9048ed6ed365623b-20241016
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1733639049; Wed, 16 Oct 2024 20:23:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 11:23:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Oct 2024 11:23:40 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v2 1/3] net: phy: mediatek-ge-soc: Fix coding style
Date: Thu, 17 Oct 2024 11:22:11 +0800
Message-ID: <20241017032213.22256-2-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
References: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_042358_498506_A0A7E3D8 
X-CRM114-Status: GOOD (  14.83  )
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

This patch fixes spelling errors, re-arrange vars with
reverse Xmas tree and remove unnecessary parens in
mediatek-ge-soc.c.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek-ge-soc.c | 36 ++++++++++++++++---------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index f4f9412..e9c422f 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -408,16 +408,17 @@ static int tx_offset_cal_efuse(struct phy_device *phydev, u32 *buf)
 
 static int tx_amp_fill_result(struct phy_device *phydev, u16 *buf)
 {
-	int i;
-	int bias[16] = {};
-	const int vals_9461[16] = { 7, 1, 4, 7,
-				    7, 1, 4, 7,
-				    7, 1, 4, 7,
-				    7, 1, 4, 7 };
 	const int vals_9481[16] = { 10, 6, 6, 10,
 				    10, 6, 6, 10,
 				    10, 6, 6, 10,
 				    10, 6, 6, 10 };
+	const int vals_9461[16] = { 7, 1, 4, 7,
+				    7, 1, 4, 7,
+				    7, 1, 4, 7,
+				    7, 1, 4, 7 };
+	int bias[16] = {};
+	int i;
+
 	switch (phydev->drv->phy_id) {
 	case MTK_GPHY_ID_MT7981:
 		/* We add some calibration to efuse values
@@ -1069,10 +1070,10 @@ static int start_cal(struct phy_device *phydev, enum CAL_ITEM cal_item,
 
 static int mt798x_phy_calibration(struct phy_device *phydev)
 {
+	struct nvmem_cell *cell;
 	int ret = 0;
-	u32 *buf;
 	size_t len;
-	struct nvmem_cell *cell;
+	u32 *buf;
 
 	cell = nvmem_cell_get(&phydev->mdio.dev, "phy-cal-data");
 	if (IS_ERR(cell)) {
@@ -1210,14 +1211,15 @@ static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
 	return mt798x_phy_hw_led_on_set(phydev, index, (value != LED_OFF));
 }
 
-static const unsigned long supported_triggers = (BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
-						 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
-						 BIT(TRIGGER_NETDEV_LINK)        |
-						 BIT(TRIGGER_NETDEV_LINK_10)     |
-						 BIT(TRIGGER_NETDEV_LINK_100)    |
-						 BIT(TRIGGER_NETDEV_LINK_1000)   |
-						 BIT(TRIGGER_NETDEV_RX)          |
-						 BIT(TRIGGER_NETDEV_TX));
+static const unsigned long supported_triggers =
+	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+	BIT(TRIGGER_NETDEV_LINK)        |
+	BIT(TRIGGER_NETDEV_LINK_10)     |
+	BIT(TRIGGER_NETDEV_LINK_100)    |
+	BIT(TRIGGER_NETDEV_LINK_1000)   |
+	BIT(TRIGGER_NETDEV_RX)          |
+	BIT(TRIGGER_NETDEV_TX);
 
 static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 					  unsigned long rules)
@@ -1415,7 +1417,7 @@ static int mt7988_phy_probe_shared(struct phy_device *phydev)
 	 * LED_C and LED_D respectively. At the same time those pins are used to
 	 * bootstrap configuration of the reference clock source (LED_A),
 	 * DRAM DDRx16b x2/x1 (LED_B) and boot device (LED_C, LED_D).
-	 * In practise this is done using a LED and a resistor pulling the pin
+	 * In practice this is done using a LED and a resistor pulling the pin
 	 * either to GND or to VIO.
 	 * The detected value at boot time is accessible at run-time using the
 	 * TPBANK0 register located in the gpio base of the pinctrl, in order
-- 
2.45.2


