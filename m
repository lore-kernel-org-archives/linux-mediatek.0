Return-Path: <SRS0=IoHK=JP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6735FC433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:36:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71996052B
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D71996052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UIHdVm7+Scgcq9+6A9iw4MF+1wsEkmhb4PrlyusZUeM=; b=qeH3mz9LCY+PYsmKVMMqi5G0n
	qm4WjGfR+F9/AkI2ObS9/v42rW3MGbWQFdzccGQTMk6gtzN9BA/sZFmFjaHXdIPdC3pjXFfV416iP
	0nQ+wJWeis5qxfijeciuYL3tvkt3S/5j0xSB0fD6KkrTVZb6WpwqiCfOzGrA5O972FCpJ+iG4sQkF
	4EkhqCM7fbWYpa3EUAzxT8oDbTV30eTeYpikogoCP8IfPlL/COzEl2+iCqxiO6XZEuUZRNUzNyvPt
	TatTdsxN3NvVAusd9orn5job8zStBvHnlV6M4QfO7MAeAP54Hip3oJs/A5mgguCilgfRMUOu4Io4Q
	xXuWc5BCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYAPS-008K0W-9k; Sun, 18 Apr 2021 16:36:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAPQ-008Jzb-Du
 for linux-mediatek@desiato.infradead.org; Sun, 18 Apr 2021 16:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=EuToYxEe6LyBx7r1BpsdkC5V2e03CaQLpSbohloUZEc=; b=qoPKBaMHjtOuNyhLUFPxiDRYjo
 0awRpoSKTEjHvlbNHhg/Nl8UpdLCHkiaA71KExjXU54Vq9EmuCC/V0/WoOJ7qJ25YRAByKJli5Y56
 pegsWjV3xJLGK+lHKw0UcYvcZZLYRgraASIZnaWMchxDkKGSadsht3v43gjSxomU+z7YKzuIs1UVC
 hWnYyju2o1a7IvWtQrzIrUeKwS+DG0oTVID5keMtXAQOXJVIehrQdHORGBhADFpuF9iU/Ijujpd/B
 8MAAIAl20ABNLCvS4EVTZpyDXFD1Jr/tiinlPpLUNMyGytry/Khg+DDT7/WxbzEo5M/PDXu96no6T
 l/PnuF+g==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAPL-00AVq7-MY
 for linux-mediatek@lists.infradead.org; Sun, 18 Apr 2021 16:36:31 +0000
X-UUID: 2086f57b1c7b45a68d8f5c9c14c6d886-20210418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EuToYxEe6LyBx7r1BpsdkC5V2e03CaQLpSbohloUZEc=; 
 b=PpnITxXawI3APJmhqtjHZoUjsu+KzAPNIsAHcmvr/WkdTbp0MF+EbBymceVq8vimwPRvaciSvQcw6jRqOpGqcBpKHqc+mKGC8wX2hgQqAVWp/b2H+kmZnO5i/RtpCnJCAy3O6RkFHB692oHXRdQmvJtKjfuOFuoY6Ipwgl+g2Ho=;
X-UUID: 2086f57b1c7b45a68d8f5c9c14c6d886-20210418
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 150231626; Sun, 18 Apr 2021 09:36:25 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 18 Apr 2021 09:36:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 00:36:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 00:36:09 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 6/6] mt76: mt7921: enable deep sleep when the device suspends
Date: Mon, 19 Apr 2021 00:36:07 +0800
Message-ID: <1618763767-1292-7-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618763767-1292-1-git-send-email-sean.wang@mediatek.com>
References: <1618763767-1292-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_093627_761919_B122B133 
X-CRM114-Status: GOOD (  10.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Enable the deep sleep mode in suspend handler to reduce the power
consumption further.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 40e2086d075c..277960b680bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -189,6 +189,9 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 			return err;
 	}
 
+	if (!dev->pm.enable)
+		mt76_connac_mcu_set_deep_sleep(&dev->mt76, true);
+
 	napi_disable(&mdev->tx_napi);
 	mt76_worker_disable(&mdev->tx_worker);
 
@@ -227,6 +230,10 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 		napi_enable(&mdev->napi[i]);
 	}
 	napi_enable(&mdev->tx_napi);
+
+	if (!dev->pm.enable)
+		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
+
 	if (hif_suspend)
 		mt76_connac_mcu_set_hif_suspend(mdev, false);
 
@@ -249,6 +256,8 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 	if (err < 0)
 		return err;
 
+	mt7921_wpdma_reinit_cond(dev);
+
 	/* enable interrupt */
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 	mt7921_irq_enable(dev, MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
@@ -266,6 +275,9 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 	napi_enable(&mdev->tx_napi);
 	napi_schedule(&mdev->tx_napi);
 
+	if (!dev->pm.enable)
+		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
+
 	if (!test_bit(MT76_STATE_SUSPEND, &dev->mphy.state))
 		err = mt76_connac_mcu_set_hif_suspend(mdev, false);
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
