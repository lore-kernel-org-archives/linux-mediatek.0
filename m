Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42ABC10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C5920738
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EpC0ZCB+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRfpsl5q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C5920738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ISPSTbvDMvvxHfYcQD6Zp373/BBkT2Yh+PM+yms6Ec=; b=EpC0ZCB+VK+i4k
	ojRgYca+ZsUZWfL6YmQkvchR7OtD3lq8AVQdPM5W1kp936MI3X0eAbwuq/9pKuELHZwoJw+/cSwtI
	rDUjWmaouHzTh3wjX2VkmgglfIjBrX3/nUrJJt4YpAGWg1XCOqYiOUU6QvpVaXagA2U/pWRTCO6D1
	VAnKfesLHYrY+VhFLR8cUFtI/JbQ/+yjtZWDLdJPlMDqgwNQuu8+q+GTctonYWU7kapM/lHgV2CJl
	V6sUQ53h+qYS3erNMrKr5qBQTLRsHkx9IW3xhnpBR67RqvNXi5IKGcvMYCCFBctU8XnXdn5pPfTgi
	5Lu5J8aDb0VoMv3JUO7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIT-00077N-F2; Tue, 17 Mar 2020 16:42:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIK-0006vZ-Ta
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:22 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 482572073E;
 Tue, 17 Mar 2020 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463340;
 bh=y+Nfv/XK3kcsURjyKdjeMR5hp3vaUh1MU49xoSY3usI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nRfpsl5qlsHwv/u7QekqZGUulFmmK5wfhmC/R6RRGLpnZaW/7A0SOkrB2CIIl0Xd3
 4IuYK+FGgIZreMB5dgtyncI4ZAqac4i/2rOcsrJ6C5JyanJiaprVM6OwPih6JCb4HI
 /NZ2+xLDVsOBR1HgWQfKGC/R3RejjGVUJwMHHPSw=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 15/25] mt76: mt7615: add mt7663e support to mt7615_reg_map
Date: Tue, 17 Mar 2020 17:41:22 +0100
Message-Id: <e398194b0e22dec05de83b5d8733bc55a2bb4d4d.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094221_437789_E2E0A783 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Introduce mt7663e support to mt7615_reg_map routine in order to reuse it
adding support for mt7663e driver

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   | 12 +++++++++---
 drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7615/regs.h   |  3 +++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
index fb4a76270ad4..43c8b29020f5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
@@ -30,9 +30,15 @@ const u32 mt7615e_reg_map[] = {
 
 u32 mt7615_reg_map(struct mt7615_dev *dev, u32 addr)
 {
-	u32 base = addr & MT_MCU_PCIE_REMAP_2_BASE;
-	u32 offset = addr & MT_MCU_PCIE_REMAP_2_OFFSET;
-
+	u32 base, offset;
+
+	if (is_mt7663(&dev->mt76)) {
+		base = addr & MT7663_MCU_PCIE_REMAP_2_BASE;
+		offset = addr & MT7663_MCU_PCIE_REMAP_2_OFFSET;
+	} else {
+		base = addr & MT_MCU_PCIE_REMAP_2_BASE;
+		offset = addr & MT_MCU_PCIE_REMAP_2_OFFSET;
+	}
 	mt76_wr(dev, MT_MCU_PCIE_REMAP_2, base);
 
 	return MT_PCIE_REMAP_BASE_2 + offset;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index c03ad0409f43..143fa63517ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -343,6 +343,11 @@ static inline bool is_mt7615(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7615;
 }
 
+static inline bool is_mt7663(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7663;
+}
+
 static inline void mt7615_irq_enable(struct mt7615_dev *dev, u32 mask)
 {
 	mt76_set_irq_mask(&dev->mt76, MT_INT_MASK_CSR, 0, mask);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index b422a9c71089..928e5a841885 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -55,6 +55,9 @@ enum mt7615_reg_base {
 
 #define MT_HIF(ofs)			((dev)->reg_map[MT_HIF_BASE] + (ofs))
 
+#define MT7663_MCU_PCIE_REMAP_2_OFFSET	GENMASK(15, 0)
+#define MT7663_MCU_PCIE_REMAP_2_BASE	GENMASK(31, 16)
+
 #define MT_CFG_LPCR_HOST		MT_HIF(0x1f0)
 #define MT_CFG_LPCR_HOST_FW_OWN		BIT(0)
 #define MT_CFG_LPCR_HOST_DRV_OWN	BIT(1)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
