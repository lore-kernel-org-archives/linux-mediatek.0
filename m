Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83F5C83F34
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1IQRumnzzeSy1ndkQbyF1/FpHcxP9Wbq4fKLXhPX4U=; b=ipRkUAsGCwEc78gA9ugabGoGgg
	4vy6eeuXVPGhJhlDVrvwMJAwENOfnn5BHm60yk3945SWzuZrfYSHpYOi/Q2sZi+VGqqRZz0YL6DSg
	il86FRd2QIcEuXedQG/8wKc731i4xoB5cIIU3jxttkFC5MhZbmSWEhpO905MwCMZ6ma1eGYsR7j5I
	mkV+A0uYQqoKUKed6jIcsItNSA/93pm+tIwZagd7FkMw9MI73yBls/UE77sZiaTOKXazAvHW5b8UN
	bv9OfneY81XgILaQOZiTVmtQWkccCq4wd4MtThKpGAj34Yg4Meaeu+LqO1zgorT6MOuXoS+Ioxsko
	jXV0gzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8ag-00000001rWn-1uxW;
	Tue, 22 Jul 2025 08:43:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8ae-00000001rVv-2PFQ
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 08:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BC9745A85;
	Tue, 22 Jul 2025 08:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D80C4CEEB;
	Tue, 22 Jul 2025 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753173792;
	bh=H3mnst5PJ8yNkfvT4AUb7ofM/mh624lIAEQ/llNlbfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bio3oHXaxh7sOxAaAhWLNXkCxMZp40vNyzKyBVD8bbdzgZdr4gsi2JBMz2MyErIlg
	 /INQMOcoLHeXbzjuw3U/rn/mkBSVJA4wj3Qh3CDk34Eb2jjGVFXIk/QElgIOYQWHaj
	 FenGv1GcXurKvtkbCj0VRrM7Ois31wSBgkn/NhEPm1Kz1VKo8fyf4zGLHrawXhB68a
	 Ec1xLxlSY29migqD0WvKnQXcaXgEB44hA8O6+zCDF3BJFCq109AqIc7CNpjktdvbQ7
	 p+9Mv8zRRV7UN7EPvpBcfubJ9Fck4eirMJBCQ3YDSjAuyBUQOOHAdA86QbFtmoO+/4
	 1mImf08huf33g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	krzk@kernel.org,
	lorenzo@kernel.org,
	horms@kernel.org
Subject: [RFC mt76 v2 1/4] wifi: mt76: Move Q_READ/Q_WRITE definitions in dma.h
Date: Tue, 22 Jul 2025 10:42:24 +0200
Message-ID: <9cd964f960794dc9de569e9f22738e2bbddbe35d.1753173330.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753173330.git.lorenzo@kernel.org>
References: <cover.1753173330.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_014312_651178_88E89964 
X-CRM114-Status: UNSURE (   9.95  )
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

This is a preliminary patch to enable traffic forward offloading between
the MT76 NIC and Airoha ethernet one via the Airoha NPU module available
on the Airoha EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 31 ------------------------
 drivers/net/wireless/mediatek/mt76/dma.h | 31 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 87f531297f85..a66cda167374 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -7,37 +7,6 @@
 #include "mt76.h"
 #include "dma.h"
 
-#if IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED)
-
-#define Q_READ(_q, _field) ({						\
-	u32 _offset = offsetof(struct mt76_queue_regs, _field);		\
-	u32 _val;							\
-	if ((_q)->flags & MT_QFLAG_WED)					\
-		_val = mtk_wed_device_reg_read((_q)->wed,		\
-					       ((_q)->wed_regs +	\
-					        _offset));		\
-	else								\
-		_val = readl(&(_q)->regs->_field);			\
-	_val;								\
-})
-
-#define Q_WRITE(_q, _field, _val)	do {				\
-	u32 _offset = offsetof(struct mt76_queue_regs, _field);		\
-	if ((_q)->flags & MT_QFLAG_WED)					\
-		mtk_wed_device_reg_write((_q)->wed,			\
-					 ((_q)->wed_regs + _offset),	\
-					 _val);				\
-	else								\
-		writel(_val, &(_q)->regs->_field);			\
-} while (0)
-
-#else
-
-#define Q_READ(_q, _field)		readl(&(_q)->regs->_field)
-#define Q_WRITE(_q, _field, _val)	writel(_val, &(_q)->regs->_field)
-
-#endif
-
 static struct mt76_txwi_cache *
 mt76_alloc_txwi(struct mt76_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index e3ddc7a83757..982722b2e5a5 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -41,6 +41,37 @@
 #define MT_FCE_INFO_LEN			4
 #define MT_RX_RXWI_LEN			32
 
+#if IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED)
+
+#define Q_READ(_q, _field) ({						\
+	u32 _offset = offsetof(struct mt76_queue_regs, _field);		\
+	u32 _val;							\
+	if ((_q)->flags & MT_QFLAG_WED)					\
+		_val = mtk_wed_device_reg_read((_q)->wed,		\
+					       ((_q)->wed_regs +	\
+					        _offset));		\
+	else								\
+		_val = readl(&(_q)->regs->_field);			\
+	_val;								\
+})
+
+#define Q_WRITE(_q, _field, _val)	do {				\
+	u32 _offset = offsetof(struct mt76_queue_regs, _field);		\
+	if ((_q)->flags & MT_QFLAG_WED)					\
+		mtk_wed_device_reg_write((_q)->wed,			\
+					 ((_q)->wed_regs + _offset),	\
+					 _val);				\
+	else								\
+		writel(_val, &(_q)->regs->_field);			\
+} while (0)
+
+#else
+
+#define Q_READ(_q, _field)		readl(&(_q)->regs->_field)
+#define Q_WRITE(_q, _field, _val)	writel(_val, &(_q)->regs->_field)
+
+#endif
+
 struct mt76_desc {
 	__le32 buf0;
 	__le32 ctrl;
-- 
2.50.1


