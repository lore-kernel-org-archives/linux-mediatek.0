Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA65CFA763
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNxTEVJEON3++TGJN3QzvUBxXhfqdid4wKMPXdvy6fA=; b=ZZw7SOR6PtG5/SL/hqM2JyK8Nd
	qo2ySfHbCHv+z1uOkf+qYTYORzvjJLqYctWgtoKZywKd7dHjaRmnmNlRBUKYxMAgn2pzJ9N+iSoeW
	teFy5ehl1s3iY7jFfmhwtQLqiVuIIfnPx25qzYWwk9A8yyx3tcB3S0awO4EvBFHtGRtlzMjIQKTFr
	93E1CqTCKy9ck60ODF20MwzQWUhmZiI7Mk8Kx06GldqTyPR6j7g2+OroHSFMgrnUNksrQSGLoiTG4
	bZAMNdB9tlJv2P5qCJWZsn0It8l0o9DfcqTWUQ8z9mFCNOmZcH1/7bzXh9yJQVPOU1en6D0CB8l8o
	qOAxjFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swfvM-0000000BxgK-1Mym;
	Fri, 04 Oct 2024 10:52:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swfV5-0000000Bq2w-0ioD;
	Fri, 04 Oct 2024 10:25:32 +0000
X-UUID: f815a68e823a11efba0aef63c0775dbf-20241004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dNxTEVJEON3++TGJN3QzvUBxXhfqdid4wKMPXdvy6fA=;
	b=l9gM5H6DkMfbzXG/wn++9WsZmTgai1/984KKKQh+NHD6jAqUzx6INfgqeF7ML8ir5eWfWC/Ikm0Fg/b5mJHafLq9b6ZEemgB+P8n5xVXrVH3Q3FfPADeJrcfKikWH2v4pNpLHSj62Wo9awwnGDHPAiPl85qTIcEkucCpBoHxKaY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f60a622f-28a6-489e-97c9-0e1bab6febc7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:2fa3be64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f815a68e823a11efba0aef63c0775dbf-20241004
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 625592581; Fri, 04 Oct 2024 03:25:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 18:25:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 4 Oct 2024 18:25:21 +0800
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
Subject: [PATCH net-next 2/9] net: phy: mediatek: Fix spelling errors and rearrange variables
Date: Fri, 4 Oct 2024 18:24:06 +0800
Message-ID: <20241004102413.5838-3-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.199700-8.000000
X-TMASE-MatchedRID: 5l8qS7cxYCU9d1nHWxkekOKXavbHY/C1Ct59Uh3p/NXY5zxTXVb0k/ha
	nb3HD5F6OfAiJ/eonC22JFdhGpav6wZuQ+SK0t7O6rBZUF8y6+gmOgC1/BTSzitjI02a+7m1J7o
	vlkPXpS2687AZgkxtNKMePb3Txp8kbPzHGwA0xPYQ9/tMNQ4aijwiJNMt63hmV9eB8vnmKe/20J
	EY1Cw2kSZE5D95I7+IgDLqnrRlXrZ8nn9tnqel2MprJP8FBOIaWrvxpH45PnBhC62IcrKetIxU2
	SX0VACQH0GEvMA4rrhzuQG2oIhwpg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.199700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8F757BBC0C540BA8EE50FFC4BA7E1FFB1493521FC59F6B936220EFA30C42D6392000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_032531_241309_AB88F2ED 
X-CRM114-Status: GOOD (  13.87  )
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

This patch fixes spelling errors which comes from mediatek-ge-soc.c and
rearrange variables with reverse Xmas tree order.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index f4f9412..0eb5395 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
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
@@ -1415,7 +1416,7 @@ static int mt7988_phy_probe_shared(struct phy_device *phydev)
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


