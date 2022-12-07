Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACD8C4708E
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFO9ciPyewmAg59SJ8PCgUib4XMA2k0O+Ejxa/dauXY=; b=Jj3KL2Ijms9cM+tnX9qEkYOFC4
	3jX2tGW9IQEyPu7u8fJOSVNRtUc4KIRIHEk+fLl309wR/0jZu9QPX5D378XFg2uZNdstAyKs51qBy
	H0kqif4Gn9qKvaPY49BoZLfNiCoJhQSnMemt/FhkRHDzNBmGasYnYMDskgDqyNzmWs7BJ5ZJEamN5
	mBKz6npdO5n3FmUS3tofsnb/eX5nCQf/qNJlAhIConLXtNJpZVnpl6nxO0rx8//hDdGBD+y3QHpgn
	LFkMn2ga7y+9VbG9KoboVWKs1mYUadzIWyXOzuW1yj+zctIshfuZ+hq3lAceWaatlFez1jdwCVOX3
	RSzQSXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2v3M-004SXc-GR; Wed, 07 Dec 2022 14:05:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2v3H-004SMC-8W
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 14:05:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6695616CB;
	Wed,  7 Dec 2022 14:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9474C433D6;
	Wed,  7 Dec 2022 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670421934;
	bh=GG5jENoOtjfN3+1Bxj75xWFl4pB98t0IjO9qNgxLUdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lC9RGV8CzR9tP8WeOQLkLN+OtIk5nBlx5BjRS3fkuPJG+6ghtZ0KNDDpUZwSr3Yc2
	 zABKA+xrkYbjRnETXL68H7dxeNbEq7zSF+iobRnJhorayC/wYtJirs3I74DdiUcqv4
	 7geJeDyeAhmpI8zikb8UGv075lyUgZtIB9hknb9S1u4YXmKv2hBq5km/q9/3bBOW+j
	 X5jhXkhPKD4oQpylZxs1SNgbbMO7Fv28dd2OBZJFj4BC+9iy1qNdQ3kXdbFXGTn8m5
	 SV4l3Euw6G1UL4kSLWi3OfqNTW8Z/rlBag+AxOKbMngUW4F2/4uEJDeKZeet4ZwvMT
	 1USXXRMiMZexQ==
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
Subject: [PATCH v3 net-next 1/2] net: ethernet: mtk_wed: fix some possible NULL pointer dereferences
Date: Wed,  7 Dec 2022 15:04:54 +0100
Message-Id: <44cba2491b6dd1a64d0e8099efbab836e6758490.1670421354.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670421354.git.lorenzo@kernel.org>
References: <cover.1670421354.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_060535_411524_D91E2B42 
X-CRM114-Status: GOOD (  12.30  )
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

Fix possible NULL pointer dereference in mtk_wed_detach routine checking
wo pointer is properly allocated before running mtk_wed_wo_reset() and
mtk_wed_wo_deinit().
Even if it is just a theoretical issue at the moment check wo pointer is
not NULL in mtk_wed_mcu_msg_update.
Moreover, honor mtk_wed_mcu_send_msg return value in mtk_wed_wo_reset()

Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c     | 13 ++++++++-----
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c |  3 +++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 06b6cc53fa02..4ef23eadd69e 100644
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
@@ -590,9 +591,11 @@ mtk_wed_detach(struct mtk_wed_device *dev)
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
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index f9539e6233c9..6bad0d262f28 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -207,6 +207,9 @@ int mtk_wed_mcu_msg_update(struct mtk_wed_device *dev, int id, void *data,
 	if (dev->hw->version == 1)
 		return 0;
 
+	if (WARN_ON(!wo))
+		return -ENODEV;
+
 	return mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO, id, data, len,
 				    true);
 }
-- 
2.38.1


