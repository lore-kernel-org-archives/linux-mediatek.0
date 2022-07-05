Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1ADC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D7jfmHe4bt9PCua6BTFCgsjFghH+nyLn06Td3cD4oK0=; b=l9e6Y5RlgkKnN/jIkP+yoDhHoN
	SUi36y7NQwrl+0TGPjUYK6g9Wa5jG6RzY85P+kNcIbSn4s8QeIv6F8K1I44z6Qqj9W3a0MN16RSmR
	H7tOq41ZeDVBKPHpzASgOJsuBrDfbx3PGvuJAhvXNU1qHvVMKlMKW6H08ock8h3/9+M2n6k0xRGsh
	aLRk/ypySTPmPy3RPO++Wf+ScH/aPZs6Ijo90BEnt7uZXqz6ef/JYPeIa3X4o0ub158jqPNjw9PWz
	6sP179JLPL9TxX9oZLj72QXa9gkBRIWk2CwIIg4hq6kw5xKqfeSFkQxSHzMwKFFQQ315xLnHXNeEf
	KG4/A8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jSt-000n3z-9i; Tue, 05 Jul 2022 14:23:47 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jSg-000my9-9B; Tue, 05 Jul 2022 14:23:36 +0000
Received: from HP-EliteBook-840-G7.. (1-171-254-213.dynamic-ip.hinet.net [1.171.254.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 537E63F389;
	Tue,  5 Jul 2022 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1657031003;
	bh=D7jfmHe4bt9PCua6BTFCgsjFghH+nyLn06Td3cD4oK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=mgThJ7cNdLY5Y8uO22gtyzPoWHBPdbIyKVEe5tL57gyTtFkM3HLqaCUxBQcrm8SPf
	 5H8SkP/ymS7Uh39mcIvA3Twa7bvBPqbhLYkzyCww5+1yOxD15YrkWW2H2S/6kbt20i
	 7p4uOX3agWr+2BZAzlTC+2cYL2kJ7IbRp5n1Xo4bCvzPkDxfOByNJjjnImd1hH8q/r
	 LbhI7JZLZXSyCZhyCBgFhKYTPNyKEUi3Pw+fla2/PenURmdAqoVHD/S6HO4G8ifwGV
	 9mV6amqHocMSQPw6EJiH0VH2tQaR6fFbV6IGfDBOCgzUZwaslBqtw9342gKCjqcWx/
	 TQ6Ls9APibIWQ==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mt76: mt7921: Let PCI core handle power state and use pm_sleep_ptr()
Date: Tue,  5 Jul 2022 22:23:04 +0800
Message-Id: <20220705142305.50292-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_072334_762315_A4B91326 
X-CRM114-Status: GOOD (  12.87  )
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

PCI power state and wakeup are already handled by PCI core, so it's not
necessary to handle them in the driver.

Also switch to use pm_sleep_ptr() to remove #ifdef guard.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index b5fb22b8e0869..b73699f80533a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -359,9 +359,9 @@ static void mt7921_pci_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(pdev);
 }
 
-#ifdef CONFIG_PM
-static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int mt7921_pci_suspend(struct device *device)
 {
+	struct pci_dev *pdev = to_pci_dev(device);
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
 	struct mt76_connac_pm *pm = &dev->pm;
@@ -391,8 +391,6 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 		napi_disable(&mdev->napi[i]);
 	}
 
-	pci_enable_wake(pdev, pci_choose_state(pdev, state), true);
-
 	/* wait until dma is idle  */
 	mt76_poll(dev, MT_WFDMA0_GLO_CFG,
 		  MT_WFDMA0_GLO_CFG_TX_DMA_BUSY |
@@ -412,8 +410,6 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	if (err)
 		goto restore_napi;
 
-	pci_save_state(pdev);
-	err = pci_set_power_state(pdev, pci_choose_state(pdev, state));
 	if (err)
 		goto restore_napi;
 
@@ -436,19 +432,14 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return err;
 }
 
-static int mt7921_pci_resume(struct pci_dev *pdev)
+static int mt7921_pci_resume(struct device *device)
 {
+	struct pci_dev *pdev = to_pci_dev(device);
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
 	struct mt76_connac_pm *pm = &dev->pm;
 	int i, err;
 
-	err = pci_set_power_state(pdev, PCI_D0);
-	if (err)
-		return err;
-
-	pci_restore_state(pdev);
-
 	err = mt7921_mcu_drv_pmctrl(dev);
 	if (err < 0)
 		return err;
@@ -488,17 +479,15 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 
 	return err;
 }
-#endif /* CONFIG_PM */
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mt7921_pm_ops, mt7921_pci_suspend, mt7921_pci_resume);
 
 struct pci_driver mt7921_pci_driver = {
 	.name		= KBUILD_MODNAME,
 	.id_table	= mt7921_pci_device_table,
 	.probe		= mt7921_pci_probe,
 	.remove		= mt7921_pci_remove,
-#ifdef CONFIG_PM
-	.suspend	= mt7921_pci_suspend,
-	.resume		= mt7921_pci_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= pm_sleep_ptr(&mt7921_pm_ops),
 };
 
 module_pci_driver(mt7921_pci_driver);
-- 
2.36.1


