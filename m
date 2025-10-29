Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E766ECCF9EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/98Ix8l6p0TIYa34WRG+HlVU97A2QkbQFzljMHVe9g=; b=ZsoYdC0VqHaGjh9eDKzfsWF3Pq
	qjBYXroh+0Vy+v94zSRWvlho+tCqcQBcE3vyL6vZA37hFUzqEkWUv5hRMpyjTxR15T5M8YAf3ELx7
	7wHbYzovCIuHuP2jyTWbBRJtlQmZvTN3H1v3ylHUqz7XYuKYbJffiviGsiU1Excu84k/Nrp6dPd2r
	wrRggJL2s3UCr5dbaAQWGz8whmMDsOiaQ7/crV6KupZh0W0XlwZEt1QhTMkjtfI1kjmOtk7WjKdgn
	81eYLBkvay1dxdf2Wkzq8OhjfqW1jGj1woQHEeFhzAn0CHEz1XywFtnvV4afcbywztSrhRHcMUh+M
	H5S3s42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEB7i-00000002RX4-2Zhm;
	Wed, 29 Oct 2025 18:42:18 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEB7f-00000002RVi-1Qax
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Oct 2025 18:42:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BF2C974D25;
	Wed, 29 Oct 2025 19:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1761763331; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=e/98Ix8l6p0TIYa34WRG+HlVU97A2QkbQFzljMHVe9g=;
	b=NdHsamRoUHjC12mqONNno0tw6sQIljcaLqU5W+VdEejonhPxaO4KEwLGJCemJhDkkArU4i
	6VbQdwS3LGkOxhPyeFGoJuMIiLB3WXcG0w2G6UKbCZ4rpJBFOU//GmyjKzla0TwfGdoOMK
	mgBCHtpjSGMUJQu/38dWHwlnBsqWx6NYlq9QjXBjmGM8Xmjxtk0i1wk/hE6Jkw5aY4zHvS
	j1M+wFGV1orPFxTal9bo0EFAJEUHC7+6mNQPbJDBgWEOa8bWlgXfr28/ZHGJVC7llW5L1O
	R7mEcvLCP659GMr4j0ZieNNHhzTeOJoEwkUaMxD2/T1VHmMcSt7eQYSnsacjPg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	jonas.gorski@gmail.com
Cc: ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	daniel@makrotopia.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2] wifi: mt76: mmio_*_copy fix byte order and alignment
Date: Wed, 29 Oct 2025 18:41:43 +0000
Message-Id: <20251029184143.3991388-1-cjd@cjdns.fr>
In-Reply-To: <4d5fe35f-6841-4b73-9c8c-a1f3bce886c8@cjdns.fr>
References: <4d5fe35f-6841-4b73-9c8c-a1f3bce886c8@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_114215_710207_B90AA8CA 
X-CRM114-Status: GOOD (  14.69  )
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

Update functions which copy to and from MMIO to load bytes as Little
Endian, and also support unaligned buffers.

PCI devices almost universally use Little Endian ordering for MMIO
registers, mt76 is no exception. PCI hardware that is designed to work
with Big Endian CPUs often (but not always) "helps" by transparently
byte-swapping MMIO reads and writes on the wire. If this is enabled
then it cannot be turned off for a single write. On hardware which does
not support this, writel() does the swap in software. When we are
transferring arbitrary bytes to MMIO space, we need them to arrive in
the same order they were in memory, so when the hardware swaps them
this is a problem. Rather than care about how our PCI host controller
works, we instead load bytes as Little Endian - so on a Big Endian
machine this will reverse them, then we use writel() which will put
them back in the right order again. This way we do not make it our
business whether the swapping is done in software or hardware.

Furthermore, inspection of the code shows that these functions are
often called with stack-allocated u8 arrays which have no alignment
guarantees so we now use (get|put)_unaligned_le32().

Fixes:
mt76x2e 0000:02:00.0: ROM patch build: 20141115060606a
mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
mt76x2e 0000:02:00.0: Build: 1
mt76x2e 0000:02:00.0: Build Time: 201607111443____
mt76x2e 0000:02:00.0: Firmware failed to start
mt76x2e 0000:02:00.0: probe with driver mt76x2e failed with error -145

Tested on:
SmartFiber XP8421-B (Big Endian MIPS 34Kc)
  - MT7612 -> 5g / ap / psk2
  - MT7603 -> 2g / sta / psk2
  - MT7603 -> 2g / ap / psk2
TpLink Archer v1200v-v2 (Big Endian MIPS 34Kc)
  - MT7613 -> 5g / ap / psk2
  - MT7603 -> 2g / sta / psk2

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/wireless/mediatek/mt76/mmio.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
index cd2e9737c3bf..9f7e64f05b15 100644
--- a/drivers/net/wireless/mediatek/mt76/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mmio.c
@@ -33,13 +33,23 @@ static u32 mt76_mmio_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32 val)
 static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset,
 				 const void *data, int len)
 {
-	__iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_UP(len, 4));
+	int i;
+
+	for (i = 0; i < ALIGN(len, 4); i += 4) {
+		writel(get_unaligned_le32(data + i),
+		       dev->mmio.regs + offset + i);
+	}
 }
 
 static void mt76_mmio_read_copy(struct mt76_dev *dev, u32 offset,
 				void *data, int len)
 {
-	__ioread32_copy(data, dev->mmio.regs + offset, DIV_ROUND_UP(len, 4));
+	int i;
+
+	for (i = 0; i < ALIGN(len, 4); i += 4) {
+		put_unaligned_le32(readl(dev->mmio.regs + offset + i),
+				   data + i);
+	}
 }
 
 static int mt76_mmio_wr_rp(struct mt76_dev *dev, u32 base,
-- 
2.39.5


