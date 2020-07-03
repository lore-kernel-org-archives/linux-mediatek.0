Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECE8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3961206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwriRmvM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmupilGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3961206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=whzsds4P7jlEPdU85s7qJTIjXU/U+U2G1Uj6pWJDz8M=; b=OwriRmvMBLZiSEbJaRblY+QOe
	QjJAPI5LDN9tg/044g9OLIB9WFtjSvV4zOtHWvOGjoaW6MlgLPqcRSGR3JAha6PBTPu7O+BnUQryy
	H7WxqWX7k/uvXUUK214/2pUpsYTiKIzx+SR0UYS215rcLCTPBHpksQDmN455bFaQgx1/MKBw9fy18
	uOzKfCrtrRYmWyK5Akac6Dyicxg4QtpXyXR0om4AliV0YmMyv+uct6T4NzuUVoOofWTO2T0WPw1t2
	2UY0MnH8fbIHb8o1XwnFs8lCWjDZjB2OMV290FNM95e0I/LOFsQnKwQ33l3HMXn2uvbyhGhI6gkbk
	ijMBQQc5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsa-0006QH-Fl; Fri, 03 Jul 2020 08:17:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsQ-0006EN-0N
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:55 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5963206A1;
 Fri,  3 Jul 2020 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764213;
 bh=KwuO9aZzhJm7XQtvqwERFJChfX82NrCvsMHqDKJc4lc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tmupilGEsKf6c2pvIEXeX4QUauZqmXnSuLoYSeDpptUb+H5BPMdxPhjifEcUPdlxC
 YFH4woWdyZG78mn4LiJOQWRSMAwkFSpJno/XPKkLG9CEi5fgUoeMWWou/tcipfMZsj
 53B8Zmj0gINFcBt7/bOG2kbyec+q/zPAWj4qBBPg=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 18/22] mt76: mt7615: do not request {driver,
 fw}_own if already granted
Date: Fri,  3 Jul 2020 10:15:57 +0200
Message-Id: <80920f6b1509f6e13d4635cce381feddc0a1e2f5.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041654_207444_F773C94C 
X-CRM114-Status: GOOD (  10.76  )
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
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Check MT76_STATE_PM in mt7615_driver_own/mt7615_firmware_own
in order to not requested power ownership if it is already granted

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 21 ++++++++++---------
 .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 501726bfda24..0b305c62bbbd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -451,6 +451,7 @@ void mt7615_init_device(struct mt7615_dev *dev)
 	INIT_WORK(&dev->pm.wake_work, mt7615_pm_wake_work);
 	init_completion(&dev->pm.wake_cmpl);
 	spin_lock_init(&dev->pm.txq_lock);
+	set_bit(MT76_STATE_PM, &dev->mphy.state);
 	INIT_DELAYED_WORK(&dev->phy.mac_work, mt7615_mac_work);
 	INIT_DELAYED_WORK(&dev->phy.scan_work, mt7615_scan_work);
 	skb_queue_head_init(&dev->phy.scan_event_list);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index ee21f9b2403c..195710a5da2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1921,6 +1921,9 @@ int mt7615_driver_own(struct mt7615_dev *dev)
 	int err = 0;
 	u32 addr;
 
+	if (!test_and_clear_bit(MT76_STATE_PM, &mphy->state))
+		goto out;
+
 	mt7622_trigger_hif_int(dev, true);
 
 	addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
@@ -1928,15 +1931,13 @@ int mt7615_driver_own(struct mt7615_dev *dev)
 
 	addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
 	if (!mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000)) {
-		dev_err(dev->mt76.dev, "Timeout for driver own\n");
+		dev_err(mdev->dev, "Timeout for driver own\n");
+		set_bit(MT76_STATE_PM, &mphy->state);
 		err = -EIO;
-		goto out;
 	}
 
-	clear_bit(MT76_STATE_PM, &mphy->state);
-
-out:
 	mt7622_trigger_hif_int(dev, false);
+out:
 	dev->pm.last_activity = jiffies;
 
 	return err;
@@ -1949,22 +1950,22 @@ int mt7615_firmware_own(struct mt7615_dev *dev)
 	int err = 0;
 	u32 addr;
 
-	addr = is_mt7663(&dev->mt76) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
+	if (test_and_set_bit(MT76_STATE_PM, &mphy->state))
+		return 0;
+
 	mt7622_trigger_hif_int(dev, true);
 
+	addr = is_mt7663(&dev->mt76) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_FW_OWN);
 
 	if (is_mt7622(&dev->mt76) &&
 	    !mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN,
 			    MT_CFG_LPCR_HOST_FW_OWN, 300)) {
 		dev_err(dev->mt76.dev, "Timeout for firmware own\n");
+		clear_bit(MT76_STATE_PM, &mphy->state);
 		err = -EIO;
-		goto out;
 	}
 
-	set_bit(MT76_STATE_PM, &mphy->state);
-
-out:
 	mt7622_trigger_hif_int(dev, false);
 
 	return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
index cd709fd617db..54885ad97891 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
@@ -60,6 +60,8 @@ int mt7663u_mcu_init(struct mt7615_dev *dev)
 
 	dev->mt76.mcu_ops = &mt7663u_mcu_ops,
 
+	/* usb does not support runtime-pm */
+	clear_bit(MT76_STATE_PM, &dev->mphy.state);
 	mt76_set(dev, MT_UDMA_TX_QSEL, MT_FW_DL_EN);
 
 	if (test_and_clear_bit(MT76_STATE_POWER_OFF, &dev->mphy.state)) {
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
