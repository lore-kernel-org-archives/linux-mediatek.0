Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8DEC5AC67
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 01:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EqjVhNT1qnAO8PMUu4jkHoOq42Hqz8Dv+e48J1/57G0=; b=hbHqx6sS7LkvgFi7BnZO+HBFmT
	5Xut1G9qxfcPnBZtYxD4rd8BkLxCCQdhrtVPZZN9YsiqtV0Cv4fl/9Ys/VqeC3popM5Mab1D9CK3E
	UWNpquhM1ImlMPgaUkHmMC1K/mDNfr6Z7TtedPF9EEGj3H1iEXPcx68LrEmJXnLCXN6ZUW59ng1cw
	BwSw9guCtjpxGZ1TlA1QRLf9ZtB3p+q6OifCIusHR4fbUSHbVS0m6aGQTQD2eA9zuQBm+z39DzkBR
	cJQhWUEtMX6DGFkMwcqc6XHBK9B4qBo3dujMkOHvXeK7Cha4m6LHZZXRKeo4oBi3UORRmNb4dBFm1
	0yCEWhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wssGX-00000009sAE-3sEk;
	Sun, 09 Aug 2026 01:23:53 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wssGV-00000009s9j-0PQQ
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 01:23:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1786238623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EqjVhNT1qnAO8PMUu4jkHoOq42Hqz8Dv+e48J1/57G0=;
	b=HDC7bJfrPQAwb+I5t5yDFu7FrXgAXSugEXQ+adp9X8zP4TH+OMXdbfUUQE2Re7vh/5Fvo2
	PGy5qhm6LuknIsE1Tps+ycq6CSdw/k9kx4DokQdoa7SlUAKRaKAzxe9S0EjkmkA5v3DQ/7
	27qbQIhEJ96TqOxMaZQF3kbEu0nopVzrp6PMRhPVoVl1Rp2nnNb7C+XHQiieVbK/Wqi/Ix
	JhKlQWW01zEMkRmqCCEFDOjqGOcWzdf2eaN2hT49B+ESlT1+ms7diDxoKQYMWqMBvaUO+h
	qmlzXhmKAC0SiUTN6P/J95DCAJiiUg8oELZWWURSL8pXnIXuJ0JUgCIpBbGkaw==
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	moosager <moosager90@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7921: check drv_pmctrl return in the PCIe reset path
Date: Sat,  8 Aug 2026 18:23:09 -0700
Message-ID: <20260809012309.43657-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_182351_558124_ECBE4220 
X-CRM114-Status: GOOD (  10.69  )
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

mt7921e_mac_reset() ignores what mt792xe_mcu_drv_pmctrl() returns. The
probe, suspend and resume paths all check it. The only other caller that
does not is mt7921e_unregister_device(), where the device is going away.

If the driver-own handshake does not complete, __mt792xe_mcu_drv_pmctrl()
gives up after MT792x_DRV_OWN_RETRY_COUNT and returns -EIO without
reinitialising WPDMA or clearing MT76_STATE_PM. The reset continues anyway,
writing interrupt enable registers, cycling NAPI, resetting WPDMA and
downloading firmware to a chip the driver does not own.

On an MT7922 with MT_CONN_ON_LPCTL held asserted, a triggered reset gave 8
ownership failures, each followed by an MCU timeout and a failed firmware
download:

  mt7921e 0000:04:00.0: driver own failed
  mt7921e 0000:04:00.0: Message 00000010 (seq 7) timeout
  mt7921e 0000:04:00.0: Failed to get patch semaphore

With the return checked, 26 ownership failures produced no firmware
download, and mt7921_mac_reset_work() got as far as logging "chip reset
failed", which it never did otherwise.

The call sits before any teardown, so returning early leaves NAPI and the
TX worker alone. This does not fix why the handshake fails.

Reported-by: moosager <moosager90@gmail.com>
Link: https://lore.kernel.org/linux-wireless/anG46qbvCqCHGF-f@fedora.fritz.box/
Fixes: dfc7743de1eb ("mt76: mt7921: refactor mcu.c to be bus independent")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index 0db7acb3a637..c4261f66f469 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -57,7 +57,9 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
 {
 	int i, err;
 
-	mt792xe_mcu_drv_pmctrl(dev);
+	err = mt792xe_mcu_drv_pmctrl(dev);
+	if (err)
+		return err;
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
-- 
2.54.0


