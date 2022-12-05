Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ACAC47089
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lheHaECBHXNCx7ZU6E0hdOYMM9fTB5Y431PLG5eXhZU=; b=ZlfrWgh6t7z7K0ZSaVl79rDogv
	CTefl70cDb39G9DBtqhBqxPIc+yT/rFU3UyideB1XHmuVIBfJ2bycgMmABbdhu29aZauaR0K8K6m3
	bHsz5DdZD0WuBWS1SLSwMao8WSTJ9JZJdxtaHOTgbqxi0/U/JWc0zGuJJ8Lf3FhFiKgZHQ2vsCY0q
	mkNS9K/Y3Ytwivld7enmfKb1DC4hQaCUmR3TutSeWaQCOJ1QAUH79s2cj+vkigy439S4WGc+bZs+X
	0FRnA3w6b4DH9qaTyBE8FJmUCmxXJCQJMR8tQc+8TNc9I7qgb5DJq0bW37IVvZOOSGzwZ0oV45Xps
	y+uqx0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p29RI-001ZEf-Db; Mon, 05 Dec 2022 11:15:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p29RF-001ZE6-2n
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 11:15:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C713E60F8A;
	Mon,  5 Dec 2022 11:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE52C433C1;
	Mon,  5 Dec 2022 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670238907;
	bh=riHuklEKAwmEh3x95+Jgzycyd0+Q9KNqoZ6sYFQILDI=;
	h=From:To:Cc:Subject:Date:From;
	b=LeJsa7NFeKNIQ8uPAOszmfSI7d0Zg5FsZVjr06AvusaoWb0XXm9bgUB87r0xpq7tm
	 UuaLz1Gy8yEUUOCwDOlNYgsXVnNxgLeF6ptuAwfHKdEhz+nJXFTs6C4snShgI7oKEK
	 mZeRkR/QI4zs/tkODyBAbkKqi7PdNnBokuQ70xliKtOOIXN5u2cEgbKn5pse5vsa5T
	 I2qD4U6ZZFfDNOygWOaS4OiatLRLvzwIdviBA5YwWWK24PdAC1us9XYIDTRK5xCPfw
	 pXwfi09jgGwmqJSEBw+O2bFIEa4b1kkMi2u4XQkSg+VqP6e4F0Gihcn4A2LUl9De9O
	 O+9JM7LHV43TA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	leon@kernel.org,
	sujuan.chen@mediatek.com
Subject: [PATCH v2 net-next] net: ethernet: mtk_wed: fix possible deadlock if mtk_wed_wo_init fails
Date: Mon,  5 Dec 2022 12:14:41 +0100
Message-Id: <5a29aae6c4a26e807844210d4ddac7950ca5f63d.1670238731.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_031509_220778_8314BF44 
X-CRM114-Status: GOOD (  11.93  )
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

Introduce __mtk_wed_detach() in order to avoid a possible deadlock in
mtk_wed_attach routine if mtk_wed_wo_init fails.
Check wo pointer is properly allocated before running mtk_wed_wo_reset()
and mtk_wed_wo_deinit() in __mtk_wed_detach routine.
Honor mtk_wed_mcu_send_msg return value in mtk_wed_wo_reset().

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes since v1:
- move wo pointer checks in __mtk_wed_detach()
---
 drivers/net/ethernet/mediatek/mtk_wed.c     | 30 ++++++++++++++-------
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c |  3 +++
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d041615b2bac..2ce9fbb1c66d 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -174,9 +174,10 @@ mtk_wed_wo_reset(struct mtk_wed_device *dev)
 	mtk_wdma_tx_reset(dev);
 	mtk_wed_reset(dev, MTK_WED_RESET_WED);
 
-	mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO,
-			     MTK_WED_WO_CMD_CHANGE_STATE, &state,
-			     sizeof(state), false);
+	if (mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO,
+				 MTK_WED_WO_CMD_CHANGE_STATE, &state,
+				 sizeof(state), false))
+		return;
 
 	if (readx_poll_timeout(mtk_wed_wo_read_status, dev, val,
 			       val == MTK_WED_WOIF_DISABLE_DONE,
@@ -576,12 +577,10 @@ mtk_wed_deinit(struct mtk_wed_device *dev)
 }
 
 static void
-mtk_wed_detach(struct mtk_wed_device *dev)
+__mtk_wed_detach(struct mtk_wed_device *dev)
 {
 	struct mtk_wed_hw *hw = dev->hw;
 
-	mutex_lock(&hw_lock);
-
 	mtk_wed_deinit(dev);
 
 	mtk_wdma_rx_reset(dev);
@@ -590,9 +589,11 @@ mtk_wed_detach(struct mtk_wed_device *dev)
 	mtk_wed_free_tx_rings(dev);
 
 	if (mtk_wed_get_rx_capa(dev)) {
-		mtk_wed_wo_reset(dev);
+		if (hw->wed_wo)
+			mtk_wed_wo_reset(dev);
 		mtk_wed_free_rx_rings(dev);
-		mtk_wed_wo_deinit(hw);
+		if (hw->wed_wo)
+			mtk_wed_wo_deinit(hw);
 	}
 
 	if (dev->wlan.bus_type == MTK_WED_BUS_PCIE) {
@@ -612,6 +613,13 @@ mtk_wed_detach(struct mtk_wed_device *dev)
 	module_put(THIS_MODULE);
 
 	hw->wed_dev = NULL;
+}
+
+static void
+mtk_wed_detach(struct mtk_wed_device *dev)
+{
+	mutex_lock(&hw_lock);
+	__mtk_wed_detach(dev);
 	mutex_unlock(&hw_lock);
 }
 
@@ -1490,8 +1498,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
 		ret = mtk_wed_wo_init(hw);
 	}
 out:
-	if (ret)
-		mtk_wed_detach(dev);
+	if (ret) {
+		dev_err(dev->hw->dev, "failed to attach wed device\n");
+		__mtk_wed_detach(dev);
+	}
 unlock:
 	mutex_unlock(&hw_lock);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index f9539e6233c9..3dd02889d972 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -207,6 +207,9 @@ int mtk_wed_mcu_msg_update(struct mtk_wed_device *dev, int id, void *data,
 	if (dev->hw->version == 1)
 		return 0;
 
+	if (!wo)
+		return -ENODEV;
+
 	return mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO, id, data, len,
 				    true);
 }
-- 
2.38.1


