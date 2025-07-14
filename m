Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE52C83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1IQRumnzzeSy1ndkQbyF1/FpHcxP9Wbq4fKLXhPX4U=; b=NGOMVAL06nT1VkbRiyhcSvKd/c
	fr2sv5G38svxBWm/sOJNsDI53R0YeVy+nB8EceMUz88FgYja51tQHTJptb9IhLelKTdqHMhBEwftX
	NBiNlfXvcP9iYUak2BNuPgUJGX6xwgqdcPv8WyN+15Jh8a5kRmLHzF6BGJaUmEKGr5u8DFl+m3yNt
	TfnJvVf7Qk9hkwHSoc9hL7sgSKuMJnFioUsPWumvvbosOnrMQlqZ0OohodHMaHfVCuNRZIezsy41i
	ZujfS+uhYWCZGF+IuO2BYOCadd2CFLbbmgp9RfU/Wm5fsRK3n0OsJmTCpZAXSNfx/PZuzgMzjD6Py
	LIBoSYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMgr-00000002vCX-0yxr;
	Mon, 14 Jul 2025 17:10:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKvM-00000002cxX-0hdB
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Jul 2025 15:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA4BB5C5CF8;
	Mon, 14 Jul 2025 15:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4579C4CEED;
	Mon, 14 Jul 2025 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506219;
	bh=H3mnst5PJ8yNkfvT4AUb7ofM/mh624lIAEQ/llNlbfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YZHKVqaCHe0d7nIOYk/dFqDtpZnNMC+YFG1oTSdbItmc6LOR4F3BAc81YenfeNFmz
	 GvP/BjZia5IVxXcXUTjNYLqFHpAoPJ/mqi8dFf4azH0iqt0aFU539/XpCwIIRhhti8
	 1BbCMjzAEkLmeiOxajnUIOyvcRoIlzih5lP2yZY5QFGmjPAQmWpGFP6+ngYEoR06eO
	 LoB/imSCbNFVWiLWfgLdyJTMooHbABJwi+WDqQpGht/Pci4MdZeQtgSCMS2792Sm9p
	 lG/L1ZCl+wFuZhc3Q9/Eg/+nVwchJWs8sqadjcm3w8RH1z7EWoccg7ghe6foUhzeYu
	 HDghe8dmOxhWw==
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
Subject: [RFC mt76 1/4] wifi: mt76: Move Q_READ/Q_WRITE definitions in dma.h
Date: Mon, 14 Jul 2025 17:16:19 +0200
Message-ID: <e7f8cda2eafe3bb1c04779f05fc58d52c2838fd9.1752505597.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1752505597.git.lorenzo@kernel.org>
References: <cover.1752505597.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081700_284672_CE50F3DB 
X-CRM114-Status: UNSURE (   9.79  )
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


