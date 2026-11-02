Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36888606A332
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 22:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e+X2ZzRa;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=AiL0PcZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4lfvLxZU2+QNlhQ5TIQ/WB48GBF4osf/Z52ednXK17E=; b=e+X2ZzRajyRaWM
	3qPGWUwdYRDCnvxp9m4CGgnienrLXKBP7+Vhy4SO71M3NFH4uzIBzaEnMTRKCra1+TRJ54AxXdQcW
	rZJ+KvifMIgdeEEa1tC2qns8iJi/KJwzcCNAM/LRx+duWUS+c0OcG6BG85TFY2ejJQ1UkRWOWucfI
	+4krrQjvzHpAiLvwqBy3fDp1qE4nNscOZLYVunf3RiZmGaMzic987b0UQPVpfK+LdzBOK8/0gxMT3
	51fcBf/o93G3nTK739FF6z/vLwO7FmgAwiRR7CtT8FHwjv7tliGak6Dkeh2gRglvJV2Ka5SVfU6D7
	oE13DRq7SxViwWMDnIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0t3-00000000aUR-26mg;
	Mon, 02 Nov 2026 22:52:21 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0sw-00000000aTJ-0kYU
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 22:52:20 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pUTCvzdg+v4gmfitrml4BUgXdrrwNA7eRDpocfMXH+k=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793659927; v=1; x=1794264727;
 b=AiL0PcZcCt5LpvrEo90hbXS/TKY20LkKyIlTeeck6SyRpgx1hrwE1hLS4Gkl76Fw6aFOctyc
 qH3h/4VjvQ9hQSrc6MdDBKkHrGn2DdL8ETM8EL93d+NFj0PMgcFYHZ4iqG9Cb5bDGW2dIJPId4b
 RsXTjniZpXDCdh4aFvSGgtkeySfXN4KVG5TvDr9LWPDrwqGcf6zD+KMvEaTjLC21fjR1XX280i9
 +m8VW7hBEnqwgziQuaaNfAc8KgeE02GobIo4vDEaDh2H7w6SH19aFaztr8eTJ2wzcZPX87vyJsU
 GgkQUaZCdoa5/W9LvLwuqYqijAbliFc3b50oPbWIEhklQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d92317b42c0e722c;
	Mon, 02 Nov 2026 22:52:07 +0000
X-Mizu-Trace-ID: d92317b42c0e722c
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Xiong <xiong.huang@mediatek.com>,
	Charlie-cy Wu <charlie-cy.wu@mediatek.corp-partner.google.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Eason Lai <eason.lai@mediatek.com>,
	Matthew Wilcox <willy@infradead.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: mt76: mt7921e: fix unregister deadlock
Date: Mon,  2 Nov 2026 15:52:00 -0700
Message-ID: <20261102225200.16172-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <aujjJPq-Qth7UyMp@casper.infradead.org>
References: <aujjJPq-Qth7UyMp@casper.infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_145218_815024_B82B0CD1 
X-CRM114-Status: GOOD (  11.79  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Removing the driver can hang forever when the chip stops answering.

Removal disables NAPI and only then waits for the reset work, which a
failing chip keeps queuing. That reset disables NAPI again and never
returns.

Do what mt7925e does: mark the device removed once it is unregistered,
so no new reset is queued, and cancel the reset work before disabling
NAPI.

Fixes: 3d78c46423c6 ("wifi: mt76: mt7921e: stop chip reset worker in unregister hook")
Reported-by: Matthew Wilcox <willy@infradead.org>
Closes: https://lore.kernel.org/all/aujjJPq-Qth7UyMp@casper.infradead.org/
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Reproduced on an MT7922 by putting the chip in D3hot under the driver:
the same driver own and chip reset failures, then rmmod waiting in the
same stack while the reset work is stuck disabling NAPI.

  dead chip, rmmod                  result
  6.18.52, in-tree                  hangs
  mt76 03dd150dbd36                 returns
    with this patch                 returns
    75673ab3c0e4 reverted           hangs
    reverted, with this patch       returns, 3 of 3

Since 75673ab3c0e4 the reset stops early when driver own fails, so
current mt76 gets through a fully dead chip. That commit is not in
v7.3, and any reset that gets as far as NAPI still hangs.

This needs the removed check in the reset helper from 79941e85f4b3. A
normal rmmod and a debugfs chip reset work as before.

Matthew, thanks for the stack trace.

 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index f87c44f2a8b6..1ff219005d14 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -52,11 +52,12 @@ static void mt7921e_unregister_device(struct mt792x_dev *dev)
 
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
+	set_bit(MT76_REMOVED, &dev->mphy.state);
+	cancel_work_sync(&dev->reset_work);
 	mt76_for_each_q_rx(&dev->mt76, i)
 		napi_disable(&dev->mt76.napi[i]);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
-	cancel_work_sync(&dev->reset_work);
 
 	mt76_connac2_tx_token_put(&dev->mt76);
 	__mt792x_mcu_drv_pmctrl(dev);
@@ -460,7 +461,6 @@ static void mt7921_pci_remove(struct pci_dev *pdev)
 		device_init_wakeup(dev->mt76.dev, false);
 
 	mt7921e_unregister_device(dev);
-	set_bit(MT76_REMOVED, &mdev->phy.state);
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
 	mt76_free_device(&dev->mt76);
 	pci_free_irq_vectors(pdev);
-- 
2.56.0


