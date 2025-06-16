Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034EC71136
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8f/+FnkJmV80G4mQhBXvToxseQ3gyhJ12ujdf6hNPk=; b=RV4ccUGsy5HTdz
	anbywbTBlkxf7oKFt53HUjURrxvxXSyx33ErGA4Y2fMQP9jCc1I28X+sBuQ8s8Nh9tGlbMfWJmY7P
	z0afsCT8amqCer7EuM2PsDwY5X9C4kNis27GZwVesMXSpMDNc8gvJCb9tw5qGbDoqJvaW4rZww6gz
	C4aBg0oECrO/kq91z9bwOrcd86l8FvUugBvN02nPktT71fqpqqV2COIhH6k6QRV4AKLbs9WU9RsZ+
	pB+3fKR5POfNicPxGW0E4Kkg49FPd8IVEFZB74o72Rn0UNBBQU37f4NvsL1TcAVe+wiSibAUjRoOr
	nEPUSydQHXEr8rUt1B8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5aH-00000003qbj-330b;
	Mon, 16 Jun 2025 08:52:53 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4se-00000003kDc-2cND;
	Mon, 16 Jun 2025 08:07:50 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id F19A93FC53;
	Mon, 16 Jun 2025 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750061267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8f/+FnkJmV80G4mQhBXvToxseQ3gyhJ12ujdf6hNPk=;
	b=YRVYaOMfzd+7prWkj42utAH6tzBV6u3ONURP+xaN3/DFVbAsj5qIV9Sl+/aAtzJk1+YF4E
	xpK902rB8xQYxVHDyB1XBmFs8LjkMCEB/pQq298HcNEU1ZERLkL4YWUXnYUIuXwApbios2
	d6HXxv8tNdhmIkUnEo5VCfYh7FNvngs=
Received: from frank-u24.. (fttx-pool-194.15.87.210.bambit.de [194.15.87.210])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id B7F19122704;
	Mon, 16 Jun 2025 08:07:46 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [net-next v4 3/3] net: ethernet: mtk_eth_soc: change code to skip first IRQ completely
Date: Mon, 16 Jun 2025 10:07:36 +0200
Message-ID: <20250616080738.117993-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616080738.117993-1-linux@fw-web.de>
References: <20250616080738.117993-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_010748_822932_823BFD70 
X-CRM114-Status: GOOD (  18.45  )
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
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

On SoCs without MTK_SHARED_INT capability (mt7621 + mt7628) the first
IRQ (eth->irq[0]) was read but never used. Do not read it and reduce
the IRQ-count to 2 because of skipped index 0.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v4:
- drop >2 condition as max is already 2 and drop the else continue
- update comment to explain which IRQs are taken in legacy way
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 20 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 3ecb399dcf81..f3fcbb00822c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3341,16 +3341,28 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
 {
 	int i;
 
+	/* future SoCs beginning with MT7988 should use named IRQs in dts */
 	eth->irq[MTK_ETH_IRQ_TX] = platform_get_irq_byname(pdev, "tx");
 	eth->irq[MTK_ETH_IRQ_RX] = platform_get_irq_byname(pdev, "rx");
 	if (eth->irq[MTK_ETH_IRQ_TX] >= 0 && eth->irq[MTK_ETH_IRQ_RX] >= 0)
 		return 0;
 
+	/* legacy way:
+	 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken from
+	 * devicetree and used for rx+tx.
+	 * On SoCs with non-shared IRQ the first was not used, second entry is
+	 * TX and third is RX.
+	 */
+
 	for (i = 0; i < MTK_ETH_IRQ_MAX; i++) {
-		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
-			eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
-		else
-			eth->irq[i] = platform_get_irq(pdev, i);
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
+			if (i == 0)
+				eth->irq[MTK_ETH_IRQ_SHARED] = platform_get_irq(pdev, i);
+			else
+				eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
+		} else {
+			eth->irq[i] = platform_get_irq(pdev, i + 1);
+		}
 
 		if (eth->irq[i] < 0) {
 			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 96b724dca0e2..9d91fe721ad0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -643,8 +643,8 @@
 #define MTK_MAC_FSM(x)		(0x1010C + ((x) * 0x100))
 
 #define MTK_ETH_IRQ_SHARED	0
-#define MTK_ETH_IRQ_TX		1
-#define MTK_ETH_IRQ_RX		2
+#define MTK_ETH_IRQ_TX		0
+#define MTK_ETH_IRQ_RX		1
 #define MTK_ETH_IRQ_MAX		(MTK_ETH_IRQ_RX + 1)
 
 struct mtk_rx_dma {
-- 
2.43.0


