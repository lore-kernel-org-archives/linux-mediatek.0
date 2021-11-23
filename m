Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D13C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQRAe+I/OKhJLjSP375F6CB3NwAAKjhbvFSA3huRmyU=; b=fP6vfJ7fTx5fOm
	2nzw85XRABtCJWWv4z+r536xptbKt4zCiJ7ygXZ78ORI/X7MO5uP4tGzKgGnkv+vQWE8t3HjnOFJI
	ql7R3gx5dmkD0PphHEfzUQmUlhrQrOSRRzLiCJ6vrfnPUe2gH4y85VFBgswRqRAJEy5dFc+jBGmKG
	PmGmhMlwYQxXw0xyQj4znqO1dBTWvaHh4cQZSFuQCu45ciIwAdbCfF7JT9GI9hr4S+In5mFnde7c6
	IujuwD4QgvitbPuLCpnksIunvgk0YZWcu4JzG7w7C+Eyqv3WYXMME7pwtI1pqljjowsfkUHPMmaFU
	P7UeNYU5CwtNhID+FxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpQvo-001DHL-8u; Tue, 23 Nov 2021 08:13:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpQjL-0019o6-1w
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 08:00:45 +0000
X-UUID: f47da1647f954724b687b40c3b8e5b92-20211123
X-UUID: f47da1647f954724b687b40c3b8e5b92-20211123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 925464307; Tue, 23 Nov 2021 01:00:38 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 23:50:38 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Nov 2021 15:50:35 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 23 Nov 2021 15:50:34 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v3 10/11] mt76: mt7915: add mt7916 calibrated data support
Date: Tue, 23 Nov 2021 15:49:54 +0800
Message-ID: <369ff3d8db30ea1a6da665d5ef2ba05148173819.1637652742.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1637652742.git.Bo.Jiao@mediatek.com>
References: <cover.1637652742.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_000043_217506_B34B2118 
X-CRM114-Status: GOOD (  14.22  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

Adjust proper eeprom size and add default calibrated data support
for mt7916.

Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 11 ++++++++---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c    |  7 ++++---
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  8 ++++++++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 40dcbeb..6aa749b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -35,6 +35,7 @@ static int mt7915_check_eeprom(struct mt7915_dev *dev)
 
 	switch (val) {
 	case 0x7915:
+	case 0x7916:
 		return 0;
 	default:
 		return -EINVAL;
@@ -52,6 +53,9 @@ mt7915_eeprom_load_default(struct mt7915_dev *dev)
 	if (dev->dbdc_support)
 		default_bin = MT7915_EEPROM_DEFAULT_DBDC;
 
+	if (!is_mt7915(&dev->mt76))
+		default_bin = MT7916_EEPROM_DEFAULT;
+
 	ret = request_firmware(&fw, default_bin, dev->mt76.dev);
 	if (ret)
 		return ret;
@@ -62,7 +66,7 @@ mt7915_eeprom_load_default(struct mt7915_dev *dev)
 		goto out;
 	}
 
-	memcpy(eeprom, fw->data, MT7915_EEPROM_SIZE);
+	memcpy(eeprom, fw->data, mt7915_eeprom_size(dev));
 	dev->flash_mode = true;
 
 out:
@@ -74,8 +78,9 @@ out:
 static int mt7915_eeprom_load(struct mt7915_dev *dev)
 {
 	int ret;
+	u16 eeprom_size = mt7915_eeprom_size(dev);
 
-	ret = mt76_eeprom_init(&dev->mt76, MT7915_EEPROM_SIZE);
+	ret = mt76_eeprom_init(&dev->mt76, eeprom_size);
 	if (ret < 0)
 		return ret;
 
@@ -91,7 +96,7 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
 			return -EINVAL;
 
 		/* read eeprom data from efuse */
-		block_num = DIV_ROUND_UP(MT7915_EEPROM_SIZE,
+		block_num = DIV_ROUND_UP(eeprom_size,
 					 MT7915_EEPROM_BLOCK_SIZE);
 		for (i = 0; i < block_num; i++)
 			mt7915_mcu_get_eeprom(dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 42a9135..668c617 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3514,7 +3514,8 @@ static int mt7915_mcu_set_eeprom_flash(struct mt7915_dev *dev)
 #define PAGE_IDX_MASK		GENMASK(4, 2)
 #define PER_PAGE_SIZE		0x400
 	struct mt7915_mcu_eeprom req = { .buffer_mode = EE_MODE_BUFFER };
-	u8 total = DIV_ROUND_UP(MT7915_EEPROM_SIZE, PER_PAGE_SIZE);
+	u16 eeprom_size = mt7915_eeprom_size(dev);
+	u8 total = DIV_ROUND_UP(eeprom_size, PER_PAGE_SIZE);
 	u8 *eep = (u8 *)dev->mt76.eeprom.data;
 	int eep_len;
 	int i;
@@ -3523,8 +3524,8 @@ static int mt7915_mcu_set_eeprom_flash(struct mt7915_dev *dev)
 		struct sk_buff *skb;
 		int ret;
 
-		if (i == total - 1 && !!(MT7915_EEPROM_SIZE % PER_PAGE_SIZE))
-			eep_len = MT7915_EEPROM_SIZE % PER_PAGE_SIZE;
+		if (i == total - 1 && !!(eeprom_size % PER_PAGE_SIZE))
+			eep_len = eeprom_size % PER_PAGE_SIZE;
 		else
 			eep_len = PER_PAGE_SIZE;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index e8fbe69..4cc2666 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -37,8 +37,11 @@
 
 #define MT7915_EEPROM_DEFAULT		"mediatek/mt7915_eeprom.bin"
 #define MT7915_EEPROM_DEFAULT_DBDC	"mediatek/mt7915_eeprom_dbdc.bin"
+#define MT7916_EEPROM_DEFAULT		"mediatek/mt7916_eeprom.bin"
 
 #define MT7915_EEPROM_SIZE		3584
+#define MT7916_EEPROM_SIZE		4096
+
 #define MT7915_EEPROM_BLOCK_SIZE	16
 #define MT7915_TOKEN_SIZE		8192
 
@@ -483,6 +486,11 @@ static inline u16 mt7915_wtbl_size(struct mt7915_dev *dev)
 	return is_mt7915(&dev->mt76) ? MT7915_WTBL_SIZE : MT7916_WTBL_SIZE;
 }
 
+static inline u16 mt7915_eeprom_size(struct mt7915_dev *dev)
+{
+	return is_mt7915(&dev->mt76) ? MT7915_EEPROM_SIZE : MT7916_EEPROM_SIZE;
+}
+
 void mt7915_dual_hif_set_irq_mask(struct mt7915_dev *dev, bool write_reg,
 				  u32 clear, u32 set);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
