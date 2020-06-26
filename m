Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD55FC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8000520B1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nw8u3wzH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjyPVDym"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8000520B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SLnukFP0E1ufBuQtcyzP32WpeszDM68T3D1atUsJk74=; b=Nw8u3wzHGOT7gjdDejex0N+ZY
	pG3GfB6vU/tzyb/wOESPslZh6c5WnpnWP2mI3FRX72AaomB7L8lXjDBFLcSdZmCSOf9QbdiE+m9yR
	FcJZID4dh2W9CG5xoz1QRzupJ8MiQzF1Qrm7/m+q6f7MVeckq+iUqX8yA4ZhKCdES/o5yuV53yj+2
	prwdriobl7TKKD5kYyeb8fyg7cBKIZNLgW/Tyac4wZ04bvlF1E6ykarNHSGyWfLrUs9pLVeDadJlq
	vBV6+dzto9JyeJMARtocro4gLbhpIvRSVsrw20XRpj0sEQiohs177zMh3KSLnm24XhCXXQHHCEy1p
	Hj6sG9dOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovrS-0002Nc-2w; Fri, 26 Jun 2020 21:26:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovrH-0002CV-Pl
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:26:04 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8A0E20B80;
 Fri, 26 Jun 2020 21:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206763;
 bh=9Q8lIrJ52Zp+iLoYJutgGc2fDNrAyLw63oX+jKzAApM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fjyPVDymuLomXby+4vgHWtZDhDvwbzBkNGNi2GOsZQTLL6gV6p7FO/Ij/oeoJphow
 BFX7Q/C7o7rfQZ4m8Ae8vQk32PIpH7byhIlM0gA9qjrSegDG/ZdYrLB05UaRQARm0t
 IEbsxy3aX/u6IAQ4masxoPc41lb8ABdB2h0WjpMY=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 17/17] mt76: mt7615: improve mt7615_driver_own reliability
Date: Fri, 26 Jun 2020 23:25:17 +0200
Message-Id: <1b218a4d518c34ea9b9a143ff40b8e5b8ede93ca.1593204577.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593204577.git.lorenzo@kernel.org>
References: <cover.1593204577.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt7615_driver_own can fail if it runs too close to mt7615_fw_own. In
order to improve mt7615_driver_own reliability, retry to get runtime-pm
ownership if mt7615_driver_own fails

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 27 ++++++++++++-------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 ++
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 293799263412..4f2d25230147 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1918,29 +1918,36 @@ int mt7615_driver_own(struct mt7615_dev *dev)
 {
 	struct mt76_phy *mphy = &dev->mt76.phy;
 	struct mt76_dev *mdev = &dev->mt76;
-	int err = 0;
-	u32 addr;
+	int i;
 
 	if (!test_and_clear_bit(MT76_STATE_PM, &mphy->state))
 		goto out;
 
 	mt7622_trigger_hif_int(dev, true);
 
-	addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
-	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_DRV_OWN);
+	for (i = 0; i < MT7615_DRV_OWN_RETRY_COUNT; i++) {
+		u32 addr;
 
-	addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
-	if (!mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000)) {
-		dev_err(mdev->dev, "Timeout for driver own\n");
-		set_bit(MT76_STATE_PM, &mphy->state);
-		err = -EIO;
+		addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
+		mt76_wr(dev, addr, MT_CFG_LPCR_HOST_DRV_OWN);
+
+		addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
+		if (mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 50))
+			break;
 	}
 
 	mt7622_trigger_hif_int(dev, false);
+
+	if (i == MT7615_DRV_OWN_RETRY_COUNT) {
+		dev_err(mdev->dev, "driver own failed\n");
+		set_bit(MT76_STATE_PM, &mphy->state);
+		return -EIO;
+	}
+
 out:
 	dev->pm.last_activity = jiffies;
 
-	return err;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mt7615_driver_own);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index d3360196c76a..a555679d8a4a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -33,6 +33,8 @@
 #define MT7615_RX_RING_SIZE		1024
 #define MT7615_RX_MCU_RING_SIZE		512
 
+#define MT7615_DRV_OWN_RETRY_COUNT	10
+
 #define MT7615_FIRMWARE_CR4		"mediatek/mt7615_cr4.bin"
 #define MT7615_FIRMWARE_N9		"mediatek/mt7615_n9.bin"
 #define MT7615_ROM_PATCH		"mediatek/mt7615_rom_patch.bin"
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
