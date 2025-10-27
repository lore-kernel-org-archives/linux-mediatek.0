Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5199CCF9EB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5v858IqBCKzHdFBFJSrUXXRl+m6ZWDsQE2+Wy791NHk=; b=pZZPEf3CC1Yd6eSZP/5umTWe/Y
	6CSwlk25INM0w9er0NSNDatcT90qVq8y0GQtkYNGm+LLDkT/mB0/djH7wY4A9GPthqMlHUt70gZks
	AkLEf+dXblCIBgbCbSJ+Nwv7dj/UAWHUZbmeA0eyUOX5zh9SFtziElm+snA1Uk5fFDOv6c60TC+XP
	s4LbH4s2u3yii/voaG6L83nAZVU1bEbKEj4ZRYx4ZklBmkywk5ImaauKHAZNmxXH/hpndoscYK3Eo
	d66blGtP8UgmPq2We7YaL+RACYx4j7QZ1GUmigGg2UcjmXYa7rlOruseR9+5yvepYipAisjmqSHWU
	I5Bl7pEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQrR-0000000EQjE-3dDI;
	Mon, 27 Oct 2025 17:18:25 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQrP-0000000EQgQ-0orX
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 17:18:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30E3F9550E9;
	Mon, 27 Oct 2025 18:18:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1761585495; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=5v858IqBCKzHdFBFJSrUXXRl+m6ZWDsQE2+Wy791NHk=;
	b=urmwCXI+p6sTAzM1plgPvyAbITmXVecUPt/MUVnrt3yVBRIzQ5O89xXzvoMReMtJ1zpFpg
	3MatFg0stEc/zmY2tiRDvV15O0s32oEkCZokP5LsQpdKQUWHg3PRZolErNZO3j7kDHbILp
	np45K7feborSAdT7f67w88TI3zpTuWMmB64j0wtWb29fJYPr7S2PzBcCSOf0odx0XBKREs
	1/GSeZmiHgj1n+myAew/mamlotbALtmKZg1lAqlRTmNoVdlxzN+wHrC2k5X+7Q1zSN7ZjG
	IhUTdGkF1nErt8tvGGeXdcmoOls+ZX7egl/qxhdpXkQlOpvpY/F63nJL6uiVXQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: nbd@nbd.name,
	lorenzo@kernel.org
Cc: ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big Endian
Date: Mon, 27 Oct 2025 17:17:59 +0000
Message-Id: <20251027171759.1484844-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_101823_435736_00BD30A7 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

When on a Big Endian machine, PCI swaps words to/from LE when
reading/writing them. This presents a problem when we're trying
to copy an opaque byte array such as firmware or encryption key.

Byte-swapping during copy results in two swaps, but solves the
problem.

Fixes:
mt76x2e 0000:02:00.0: ROM patch build: 20141115060606a
mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
mt76x2e 0000:02:00.0: Build: 1
mt76x2e 0000:02:00.0: Build Time: 201607111443____
mt76x2e 0000:02:00.0: Firmware failed to start
mt76x2e 0000:02:00.0: probe with driver mt76x2e failed with error -145

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/wireless/mediatek/mt76/mmio.c | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
index cd2e9737c3bf..776dbaacc8a3 100644
--- a/drivers/net/wireless/mediatek/mt76/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mmio.c
@@ -30,15 +30,49 @@ static u32 mt76_mmio_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32 val)
 	return val;
 }
 
+static void mt76_mmio_write_copy_portable(void __iomem *dst,
+					  const u8 *src, int len)
+{
+	__le32 val;
+	int i = 0;
+
+	for (i = 0; i < ALIGN(len, 4); i += 4) {
+		memcpy(&val, src + i, sizeof(val));
+		writel(cpu_to_le32(val), dst + i);
+	}
+}
+
 static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset,
 				 const void *data, int len)
 {
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
+		mt76_mmio_write_copy_portable(dev->mmio.regs + offset, data,
+					      len);
+		return;
+	}
 	__iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_UP(len, 4));
 }
 
+static void mt76_mmio_read_copy_portable(u8 *dst,
+					 const void __iomem *src, int len)
+{
+	u32 val;
+	int i;
+
+	for (i = 0; i < ALIGN(len, 4); i += 4) {
+		val = le32_to_cpu(readl(src + i));
+		memcpy(dst + i, &val, sizeof(val));
+	}
+}
+
 static void mt76_mmio_read_copy(struct mt76_dev *dev, u32 offset,
 				void *data, int len)
 {
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
+		mt76_mmio_read_copy_portable(data, dev->mmio.regs + offset,
+					     len);
+		return;
+	}
 	__ioread32_copy(data, dev->mmio.regs + offset, DIV_ROUND_UP(len, 4));
 }
 
-- 
2.39.5


