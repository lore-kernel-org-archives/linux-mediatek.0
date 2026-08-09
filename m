Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A900C5AD55
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 20:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ifGUktyTBRpD2vqspRbC+RDO6MA0r+jWv/wAEOzB8s=; b=HDEZrleEBuvge2vYSy1/oymhHk
	LzfLTK8ofeJaZP46p7GgSz9VpxvScYgaNK6crejoyDJxfAm3EjZcU/+KcfxjvCsKOFcwYhWXWOxRS
	LZsR17yV+BfAP9kLblsUmNJdtygAvQlXMwigqp7xGWWYKJk/sfx/hqQqGTSCYIlSgAM+2EgAFZEOy
	Bw2KtlSc7e9ZYFYR3XquaUWUKD8KhObQJPWpRvEwiw9x5/JiE1/u/iJnecvnhsyGHknPvYCHFsQqB
	oPxMaVcAzgA7ZJ76So/GtFPC6pAaEX5j1tFDN/NLYFABsFzuLlTDaF++s7XdfRZwrrl4T6I0Tsf8r
	huLkzT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAZI-0000000AiEy-3yQa;
	Sun, 09 Aug 2026 20:56:28 +0000
Received: from mta1.migadu.com ([37.59.57.117] helo=out-181.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAZG-0000000AiEb-3R2S
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 20:56:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1786308981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ifGUktyTBRpD2vqspRbC+RDO6MA0r+jWv/wAEOzB8s=;
	b=pza10K9FqR59KucqwDxUWfOX7soPRO16abnN9R+Iob+HMko/P8pZrpJyf3EQVB7KruBdQX
	ovvhAlzmuEnJ73AZUgihsdf5RPT+kcMAJKlhZZuiGFpjUux/XP5BCUXUzePZQRyZfWb7Js
	YaWkucVRoo5BhGz3ilIaYBYQFuxtVdv0HAvoDHCUFiQyA/Ae0OXbYr4bBbq37DJi/OWqdQ
	QdpoGBCFHb/cSKVzZK+BA7OC5UZDQMKsNGYRjt6FmazfXI0vk4id6hpU/2m9FnLNI6aFvu
	RmPcxh4B/4K5ilpUUtXtG27GSKf+a5vkeyJmKDrD1OjJaTaqukus0YR3XwLpjQ==
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH wireless] wifi: mt76: mt7925: check drv_pmctrl return in the PCIe reset path
Date: Sun,  9 Aug 2026 13:55:59 -0700
Message-ID: <20260809205559.32116-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_135627_278287_7408BBB7 
X-CRM114-Status: GOOD (  13.20  )
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

mt7925e_mac_reset() ignores what mt792xe_mcu_drv_pmctrl() returns. It
checks both pmctrl calls it makes later in the same function, and probe,
suspend and resume check theirs. mt7925e_unregister_device() also discards
it, but there the device is going away and teardown has to continue
regardless.

When the driver-own handshake does not complete, __mt792xe_mcu_drv_pmctrl()
gives up after MT792x_DRV_OWN_RETRY_COUNT and returns -EIO without
reinitialising WPDMA or clearing MT76_STATE_PM. The reset continues anyway,
writing interrupt enable registers, cycling NAPI, resetting WPDMA and
calling mt7925_run_firmware() on a chip the driver does not own.

On an MT7925 with MT_CONN_ON_LPCTL held asserted, a triggered reset failed
the handshake 4 times. Each failure was followed within 85 ms by both
firmware stages loading:

  mt7925e 0000:0a:00.0: driver own failed
  mt7925e 0000:0a:00.0: HW/SW Version: 0x8a108a10, Build Time: [...]
  mt7925e 0000:0a:00.0: WM Firmware Version: ____000000, Build Time: [...]

With the return checked, 8 handshake failures were followed by no firmware
load. The one load in that run came after a handshake that succeeded.

Return the error instead. The call is the first statement in the function,
before MT76_RESET is set and before the TX worker and NAPI are disabled, so
bailing out there leaves them untouched. This does not fix why the
handshake fails.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 97683949a305..2ce9ad0350ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -73,7 +73,9 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	const struct mt792x_irq_map *irq_map = dev->irq_map;
 	int i, err;
 
-	mt792xe_mcu_drv_pmctrl(dev);
+	err = mt792xe_mcu_drv_pmctrl(dev);
+	if (err)
+		return err;
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
-- 
2.55.0


