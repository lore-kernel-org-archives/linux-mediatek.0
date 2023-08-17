Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896AAC2FC14
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SeryiRbYKJ2WZYtVkRUX0Kn5X9MRqiXewa99UPs1Pes=; b=4SnaTz2SvXRI3RKy82lecLNMZ5
	6s8pbCS8bM6J6yD8lc5UtnANS7+Jsv07bYWVKlbv1aWc5QJtnJqcvsugzQue5oFF/hUouDHN7MHDD
	TKe9KdEX2rkmpPtHOsPTlwMw9qqp3HHeBhSRSL0LFpnewNK8iY7T3DKaLPr06wO0p3YV1I4hoiYXE
	JIgvsYYi5IZtqhVv4SXfNY+SXBhda/RXwWkDvg1nv1KnenJZS8iEycf8WXaZ7Y/BjP/yTwuz83tyt
	mD2B4UA+7aQ5TP8RM11eSpPiN9SmyRQdAjGAfJ5quxYWVEIw6YIsdeAezVsbVxldUSIeTpPhz4fuG
	rRVkPLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbhI-006L9N-0v;
	Thu, 17 Aug 2023 12:01:52 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbhF-006L8D-0z;
	Thu, 17 Aug 2023 12:01:50 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qWbh3-0001ko-02;
	Thu, 17 Aug 2023 12:01:38 +0000
Date: Thu, 17 Aug 2023 13:01:11 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix NULL pointer on hw reset
Message-ID: <6863f378a2a077701c60cea6ae654212e919d624.1692273610.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_050149_339853_F206B44D 
X-CRM114-Status: GOOD (  12.86  )
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

When a hardware reset is triggered on devices not initializing WED the
calls to mtk_wed_fe_reset and mtk_wed_fe_reset_complete dereference a
pointer on uninitialized stack memory.
Initialize the hw_list will 0s and break out of both functions in case
a hw_list entry is 0.

Fixes: 08a764a7c51b ("net: ethernet: mtk_wed: add reset/reset_complete callbacks")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 00aeee0d5e45f..d14f5137379b9 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -41,7 +41,7 @@
 #define MTK_WED_RRO_QUE_CNT		8192
 #define MTK_WED_MIOD_ENTRY_CNT		128
 
-static struct mtk_wed_hw *hw_list[2];
+static struct mtk_wed_hw *hw_list[2] = {};
 static DEFINE_MUTEX(hw_lock);
 
 struct mtk_wed_flow_block_priv {
@@ -222,9 +222,13 @@ void mtk_wed_fe_reset(void)
 
 	for (i = 0; i < ARRAY_SIZE(hw_list); i++) {
 		struct mtk_wed_hw *hw = hw_list[i];
-		struct mtk_wed_device *dev = hw->wed_dev;
+		struct mtk_wed_device *dev;
 		int err;
 
+		if (!hw)
+			break;
+
+		dev = hw->wed_dev;
 		if (!dev || !dev->wlan.reset)
 			continue;
 
@@ -245,8 +249,12 @@ void mtk_wed_fe_reset_complete(void)
 
 	for (i = 0; i < ARRAY_SIZE(hw_list); i++) {
 		struct mtk_wed_hw *hw = hw_list[i];
-		struct mtk_wed_device *dev = hw->wed_dev;
+		struct mtk_wed_device *dev;
+
+		if (!hw)
+			break;
 
+		dev = hw->wed_dev;
 		if (!dev || !dev->wlan.reset_complete)
 			continue;
 
-- 
2.41.0


