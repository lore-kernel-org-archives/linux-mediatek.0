Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F87CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Muv55VbS1lnb4nlPnTtTF/LPBA7Wvo9ol7ScMkOvl2U=; b=OFBsq9aC8PUjEqizA9cv92C04K
	Nxy0ZUBwWmoMH+KSA4sI+7FZ4veVJCaeMgDUY9Z4e1R9vXge6aY9Cng10pLr9PcLKHblrU/hest9y
	P8s/Y7GysBpyo10gEB6tOkgeI5dP6S0ag1xbg71UIQ6bEboKHn4pf97KGrhn650WVMpa1L6eZJD7F
	BU0OxpxFy4yWlTKB+rbGuYW0+uSoaL7hViACCdhfBv0apL4g1LP1pJFxGYOdnH8aAjN2KKDZXrTP8
	uMtjlAFG3unIwKa+sDJQVPL3/jPI9NZaRR6CAxNvH/UvPUnPL2H8jrXphQTTyI2Z7Z6uJ+5zUSu4/
	ROlj1kpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19xt-000O5O-6H; Fri, 02 Dec 2022 17:36:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19xq-000O4L-RQ
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 17:36:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBE7862357;
	Fri,  2 Dec 2022 17:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A982C433C1;
	Fri,  2 Dec 2022 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670002601;
	bh=z5uh3mVduXvQ/zp3qCGCz5kpqopsyvlxan0NUFQRRa0=;
	h=From:To:Cc:Subject:Date:From;
	b=U0X7JI7aU8zvtbQNpSMQAiuMd2dn9630cWISy8kwZVjYdQ6y5T/ymK85OmC0UNsR1
	 aZ9iHUVcoVfEv3w+zzmtz2HrhRZ+dEYZKS6xWw//IvK1HGR86QGjyByEhbVUfESYPe
	 pWxTBbPPSZxbnxmp82b3/z+If0W1/LQqZj+UzGJ+EacFlh/WLxvoj2NfEALBbdwuky
	 nlk2+05pLYhHXlVcH9gECSoQXyMPXre+1jj9cflDL4z4YQvyPnDghb94Cm14T6ukGe
	 KSgzV1AvXS0prLNQpYkJVeEV9m1AGSAJwESqzHdSiP+CCCZQ5mxh1dHK4Zf9W9vUnE
	 kDL90ltajjirg==
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
	lorenzo.bianconi@redhat.com
Subject: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock if mtk_wed_wo_init fails
Date: Fri,  2 Dec 2022 18:36:33 +0100
Message-Id: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_093642_999732_C8B0BD49 
X-CRM114-Status: GOOD (  13.63  )
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

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c     | 24 ++++++++++++++-------
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 10 ++++++---
 drivers/net/ethernet/mediatek/mtk_wed_wo.c  |  3 +++
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d041615b2bac..6352abd4157e 100644
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
@@ -612,6 +611,13 @@ mtk_wed_detach(struct mtk_wed_device *dev)
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
 
@@ -1490,8 +1496,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
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
index f9539e6233c9..b084009a32f9 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -176,6 +176,9 @@ int mtk_wed_mcu_send_msg(struct mtk_wed_wo *wo, int id, int cmd,
 	u16 seq;
 	int ret;
 
+	if (!wo)
+		return -ENODEV;
+
 	skb = mtk_wed_mcu_msg_alloc(data, len);
 	if (!skb)
 		return -ENOMEM;
@@ -202,13 +205,14 @@ int mtk_wed_mcu_send_msg(struct mtk_wed_wo *wo, int id, int cmd,
 int mtk_wed_mcu_msg_update(struct mtk_wed_device *dev, int id, void *data,
 			   int len)
 {
-	struct mtk_wed_wo *wo = dev->hw->wed_wo;
+	if (!dev->hw || !dev->hw->wed_wo)
+		return 0;
 
 	if (dev->hw->version == 1)
 		return 0;
 
-	return mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO, id, data, len,
-				    true);
+	return mtk_wed_mcu_send_msg(dev->hw->wed_wo, MTK_WED_MODULE_ID_WO, id,
+				    data, len, true);
 }
 
 static int
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
index a219da85f4db..92440d62e01c 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
@@ -464,6 +464,9 @@ mtk_wed_wo_hardware_init(struct mtk_wed_wo *wo)
 static void
 mtk_wed_wo_hw_deinit(struct mtk_wed_wo *wo)
 {
+	if (!wo)
+		return;
+
 	/* disable interrupts */
 	mtk_wed_wo_set_isr(wo, 0);
 
-- 
2.38.1


