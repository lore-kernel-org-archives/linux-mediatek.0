Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C5AFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUG8ggOsQ0rrnBThrPNo+HKNnFOqSCMI0C+rNZSf4UI=; b=naRBceQV7/GwyGNYCEvXNuvNA1
	l7aV3K5tQhOIrAG2jiZFRtHPV6E1gpzvAIAzSxFLa57b6dRWGrxK7UHyb6Iu5t4yJ759w5WFeeynz
	ejDL7Qg/yADBre+GKzKhDOLHAWNXtsBJlZsPvOKRVGLVoxU2yhz5xutt8Q6DTkX7Mv/7aG9ilZP1U
	FIAudXQdqDpocBxWBlWr7oAwK8IZT+FhfurvEfFE58flAFHMIaA3XHde2Pa5xgBhTfABTWDKexrhi
	1hj3FgvMsDaJlARKnkA0cvklFdjp6Encyu8IzG/bIIjhOgeZQRvv5DRaZfxtBf1F6b6Q9OSCz5IFq
	hmn1nosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2E-0000000EmNW-21hy;
	Sat, 25 Apr 2026 19:51:26 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2B-0000000EmMO-3bRm
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:24 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dcd17e19b6so3397147a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146683; x=1777751483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CUG8ggOsQ0rrnBThrPNo+HKNnFOqSCMI0C+rNZSf4UI=;
        b=dS0UqZVZuAzUDnJV3K2Orc61UcvVFNK7UX4Hf3LqY5hPvMLL7gmcZlklJVw9dwL1or
         VxfEQ/iWowQ1d7EMcwj97rCON1Q22JZffHGQE/eoDxMyWTpebULZkUQXNn1wsx4ndQSh
         7cnEbaxk5UvsfYf3d1embLvVJFPd1dd1PGDnYMiWukYyDhql2akdw6QmMyj2n2bOcXsv
         2HXDKZQIXSi2vmBa1CevtSebeNzQ/r8IysbIecJhJjdzTYr+Oa1ezfdWzWrn+T/gGUQz
         ZS8cZqidvALH/fSu/Xp0lhX2ml5QYgj2x4Yaj9UhcmmBBcEDoYJ7e06Qent3v+5JyD6P
         Cwgw==
X-Forwarded-Encrypted: i=1; AFNElJ+owxNrHJNv5v7wWzS5wp674l5FL55wRK6HlseJH/EH0cZIb2LjN7MaJhhv/XclUNrLDvdvP53GcxuFpY+xtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzP0UWRilRgu16Yl/0divuqtnOCojcjn20P7tC6/o3k2Ar/kKOy
	+CP81ZQLz7iWZieIz/mSv8NaiyGnf9If5yWoQafzSasXIh3pxqP//tnB
X-Gm-Gg: AeBDieuehRHJntxhxRk0/IMe0/1p5p5E8MOk+nvopg/uz7yiWbPNGLoewmCYcYjFhce
	lPPCJa+kUzzEr+EBh1guVv94w9G/yjhDJ1qTts70GKmN1Ra5lqTRSQDOEmC41C5O1oBbcB19y2y
	w1qpbQS2tI/hTn1gv2jj1oTUT9jKJHU72YUV4C82lEmK9q0GwDtkshwRgBMIA5Zq5C7B7mXK8ct
	VS5+HmmrwR5MdkvdbK93+syHON+cZGXncvQfe47tAXsZtoQ95ZDPRp4N1TgE61GOh62c/qtBx+0
	l0w/5eQvzlk+sOKZIqXSCN/9lcTCB4oI/hK3VrdlH1+xv0x3DMvpXOz4xLXjIyyLQxHAH6gvXMz
	i22AI8/+rygg8tz0KfZjnBvSbTEAFdm73vkEBD7pyHNu+1ZVJwCvMGd8lXOtSOUoAV+sAlFLFil
	nuDTKX+nePgquszmvwqdItfrJoRK5ZjXQE7jGOCCDfLdbjq8MvJkNBmhVFz+soDxAaZF+tCt/8D
	5PPygw5dK4K
X-Received: by 2002:a05:6830:6acc:b0:7d7:4a7d:fd40 with SMTP id 46e09a7af769-7dc9525302amr21505453a34.22.1777146682918;
        Sat, 25 Apr 2026 12:51:22 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:22 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 10/21] wifi: mt76: connac: replace is_mt7925() with is_connac3()
Date: Sat, 25 Apr 2026 14:50:00 -0500
Message-ID: <20260425195011.790265-11-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125123_902338_E1F34D7C 
X-CRM114-Status: GOOD (  11.03  )
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

From: Sean Wang <sean.wang@mediatek.com>

Use is_connac3() instead of is_mt7925() to avoid confusion
when more chips join.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 7 ++++++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c      | 2 +-
 5 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 45479cc29134..1994863dc59d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -172,11 +172,16 @@ struct mt76_connac_tx_free {
 
 extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
 
-static inline bool is_mt7925(struct mt76_dev *dev)
+static inline bool is_connac3(struct mt76_dev *dev)
 {
 	return mt76_chip(dev) == 0x7925 || mt76_chip(dev) == 0x7927;
 }
 
+static inline bool is_mt7925(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7925;
+}
+
 static inline bool is_mt7927(struct mt76_dev *dev)
 {
 	return mt76_chip(dev) == 0x7927;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 0339e2e7ab60..c341595e9138 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -173,7 +173,7 @@ void mt76_connac_write_hw_txp(struct mt76_dev *dev,
 
 	txp->msdu_id[0] = cpu_to_le16(id | MT_MSDU_ID_VALID);
 
-	if (is_mt7663(dev) || is_connac2(dev) || is_mt7925(dev))
+	if (is_mt7663(dev) || is_connac2(dev) || is_connac3(dev))
 		last_mask = MT_TXD_LEN_LAST;
 	else
 		last_mask = MT_TXD_LEN_AMSDU_LAST |
@@ -217,7 +217,7 @@ mt76_connac_txp_skb_unmap_hw(struct mt76_dev *dev,
 	u32 last_mask;
 	int i;
 
-	if (is_mt7663(dev) || is_connac2(dev) || is_mt7925(dev))
+	if (is_mt7663(dev) || is_connac2(dev) || is_connac3(dev))
 		last_mask = MT_TXD_LEN_LAST;
 	else
 		last_mask = MT_TXD_LEN_MSDU_LAST;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 89bd52ea8bf7..2b1c887d6709 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -67,7 +67,7 @@ int mt76_connac_mcu_init_download(struct mt76_dev *dev, u32 addr, u32 len,
 
 	if ((!is_connac_v1(dev) && addr == MCU_PATCH_ADDRESS) ||
 	    (is_connac2(dev) && addr == 0x900000) ||
-	    (is_mt7925(dev) && (addr == 0x900000 || addr == 0xe0002800)) ||
+	    (is_connac3(dev) && (addr == 0x900000 || addr == 0xe0002800)) ||
 	    (is_mt799x(dev) && addr == 0x900000))
 		cmd = MCU_CMD(PATCH_START_REQ);
 	else
@@ -3084,7 +3084,7 @@ static u32 mt76_connac2_get_data_mode(struct mt76_dev *dev, u32 info)
 {
 	u32 mode = DL_MODE_NEED_RSP;
 
-	if ((!is_connac2(dev) && !is_mt7925(dev)) || info == PATCH_SEC_NOT_SUPPORT)
+	if ((!is_connac2(dev) && !is_connac3(dev)) || info == PATCH_SEC_NOT_SUPPORT)
 		return mode;
 
 	switch (FIELD_GET(PATCH_SEC_ENC_TYPE_MASK, info)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ac5126ab68ff..552cb94edaa0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1878,7 +1878,7 @@ mt76_connac_mcu_gen_dl_mode(struct mt76_dev *dev, u8 feature_set, bool is_wa)
 
 	ret |= feature_set & FW_FEATURE_SET_ENCRYPT ?
 	       DL_MODE_ENCRYPT | DL_MODE_RESET_SEC_IV : 0;
-	if (is_connac2(dev) || is_mt7925(dev))
+	if (is_connac2(dev) || is_connac3(dev))
 		ret |= feature_set & FW_FEATURE_ENCRY_MODE ?
 		       DL_CONFIG_ENCRY_MODE_SEL : 0;
 	ret |= FIELD_PREP(DL_MODE_KEY_IDX,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 47827d1c5ccb..7bb9840112ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -263,7 +263,7 @@ EXPORT_SYMBOL_GPL(mt792xu_dma_init);
 
 int mt792xu_wfsys_reset(struct mt792x_dev *dev)
 {
-	const struct mt792xu_wfsys_desc *desc = is_mt7925(&dev->mt76) ?
+	const struct mt792xu_wfsys_desc *desc = is_connac3(&dev->mt76) ?
 						&mt7925_wfsys_desc :
 						&mt7921_wfsys_desc;
 	u32 val;
-- 
2.43.0


