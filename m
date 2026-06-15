Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389C2CD98DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 21:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gl07pJdd/VP/07cwVNdl98nwOZmJlI+5GvXpYGmCuNw=; b=3CLuHIePW1P0u7TG84zmDiUbxM
	2w0MIAquSFoREybhcyEr8xvw5gkfHEB5wQFnnYKxXbDnycT916xZEUGz5Gf0bCOr6+sBSG7poVDE1
	fr93mG1p535IYpUBbMIRP122RCB/x/3xyK5YvsH+WAYi+/3YGQstExBA6wf9ZLD1E4JYKc5updMFn
	bhizYfjzAWIFcfuzVs1TSDq6d/KSzwjnmgnNu2kFt1jx/pjckOiRsQ7kD/HesSL6xGtI+Kq3rk2FB
	aFD/nkfDXkODhO0VqSUDvmIUZmgX8XXMWIY06uTVGd5s5CPEbkclTKNMmTfUtTIZbcRBn2Q0cqtXe
	ORD4Wu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZEly-0000000ErPs-329P;
	Mon, 15 Jun 2026 21:23:10 +0000
Received: from mail-dl1-f52.google.com ([74.125.82.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZElw-0000000ErPQ-1xag
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 21:23:09 +0000
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1384eb94d20so6658366c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 14:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781558587; x=1782163387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gl07pJdd/VP/07cwVNdl98nwOZmJlI+5GvXpYGmCuNw=;
        b=OVpc3SkcSox5lUj1YOAB1cHEB7uGD2Vnk4HV/P15cq9y2M3F89wRPoo/QYIOp3lzw3
         EPj35PfjXbgrOm7lJlStXPs20kuBWpjsUi3I1Mgr6idqaM2NpaKX0FPF4TrgNa0701QY
         PiYox4FjWI30bPHrXoNakQSOGmWuNMnHWPflk+TDmrQYaVWeO7PNYbLkMfgyuy/xn76V
         Tp8lWwYZyPVZuI/3eON3rnotL4MybU1vz+PgAPM6aiJndMBjEzYrW+KqrRP24/QFvRrY
         rKPFKEfuCskkFmivFiWvr9EfhBkAiCEnCK+IsFIu+ZJvr2eFr95kS7g62N9ZmH9I0BuZ
         o2Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8zDX+a9TYSEBmAaLx1fyTay5FpmPqxJOiVQJO6iHXQ8KWmPOnlXXgFtTCdmyABQMgU+whJAGcILe4tHp2AgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDYHI1zwLzzFlDz1WoMgjbabSYaXQq0ygXTT5WDhMm1mzM9jrE
	6eu6RpOR5GyeT2e8KpR0vetO01qjKCfoBkgsKwL6cr5Ns2Su2oS6k+YS
X-Gm-Gg: Acq92OE3+vqTSb9cmjw7OC3YkWBZoG76DxlEXSnebG5sTwNMfQqHFiQQ06BtunxQZlD
	AT0C10q7v2d8gq/Cz2BYlf2kwU7RyWC6kSDVe2qa+Lq1fJ/oofGl5mdVFG6ze36SeGwb/7I1WxV
	KI+ARr0RPKzZv+6wo8Q69h+D0y3xUUIQVgT0lguEHHMECX+KiSF0qxweqO/mOJJp0Oac7uXZEpH
	bYzthYKmrVReeP7eX1M6tPoL2wm/lV+ov6nnJfZwlM6UZuWvn7PA7qoARZ0H6xMjAIo22TopOML
	aTW9kbUH4asVyQUwjO5+/txpzl1qxuWGRX8L6hgKKUmcymF/VYQ1uq2W/jVgYvldpQg2wlWqd0x
	juTZG/eZ2j6mQ2IQuuiVQYLDvBuVCDyrCP5sy7QIWfnTaTTy+/VPUM6GeesofwpMQzy7XGIUDjr
	WTFwqv3AmgZJ0xL05I9YU6xzKWQC6FJzN3Vy7zBymyK2fT2SVdu/EP8D/bDcDMhIXpEfGLa5lXD
	t80ydabCHntBYNqtkRm7WjaZxn0burC7uYnh1Jb
X-Received: by 2002:a05:7301:5f81:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-3092dce2af1mr6771639eec.0.1781558586859;
        Mon, 15 Jun 2026 14:23:06 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489621sm16220982eec.6.2026.06.15.14.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 14:23:06 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Stella Liu <yu-ching.liu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: support new WoW pattern TLV
Date: Mon, 15 Jun 2026 16:21:37 -0500
Message-ID: <20260615212137.477893-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_142308_512669_51B09A75 
X-CRM114-Status: GOOD (  11.04  )
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

Newer mt7925 firmware uses a shorter WoW pattern TLV with rsv[3]. Select
the v2 layout based on the firmware build date, while keeping the old
layout for older firmware.

This also makes the WoW pattern handling compatible with newer devices
such as MT7928.

Tested-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 30 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  3 ++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 17bc7204f02a..32297f4a5e0b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -10,6 +10,24 @@
 
 #define MT_STA_BFER			BIT(0)
 #define MT_STA_BFEE			BIT(1)
+#define MT7925_WOW_PATTERN_NEW_FW_DATE	"20260414153105"
+
+static bool mt7925_mcu_wow_pattern_old_tlv(struct mt76_dev *dev)
+{
+	const char *fw_version = dev->hw->wiphy->fw_version;
+	const char *build_date = strrchr(fw_version, '-');
+
+	if (!is_mt7925(dev))
+		return false;
+
+	if (!build_date)
+		return false;
+
+	build_date++;
+
+	return strncmp(build_date, MT7925_WOW_PATTERN_NEW_FW_DATE,
+		       strlen(MT7925_WOW_PATTERN_NEW_FW_DATE)) < 0;
+}
 
 int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			      struct sk_buff *skb, int seq)
@@ -219,6 +237,8 @@ mt7925_mcu_set_wow_pattern(struct mt76_dev *dev,
 	struct mt76_vif_link *mvif = (struct mt76_vif_link *)vif->drv_priv;
 	struct mt7925_wow_pattern_tlv *tlv;
 	struct sk_buff *skb;
+	int tlv_len;
+	bool old_tlv;
 	struct {
 		u8 bss_idx;
 		u8 pad[3];
@@ -226,14 +246,18 @@ mt7925_mcu_set_wow_pattern(struct mt76_dev *dev,
 		.bss_idx = mvif->idx,
 	};
 
-	skb = mt76_mcu_msg_alloc(dev, NULL, sizeof(hdr) + sizeof(*tlv));
+	old_tlv = mt7925_mcu_wow_pattern_old_tlv(dev);
+	tlv_len = old_tlv ? sizeof(struct mt7925_wow_pattern_tlv) :
+			    MT7925_WOW_PATTERN_TLV_V2_SIZE;
+
+	skb = mt76_mcu_msg_alloc(dev, NULL, sizeof(hdr) + tlv_len);
 	if (!skb)
 		return -ENOMEM;
 
 	skb_put_data(skb, &hdr, sizeof(hdr));
-	tlv = (struct mt7925_wow_pattern_tlv *)skb_put(skb, sizeof(*tlv));
+	tlv = (struct mt7925_wow_pattern_tlv *)skb_put_zero(skb, tlv_len);
 	tlv->tag = cpu_to_le16(UNI_SUSPEND_WOW_PATTERN);
-	tlv->len = cpu_to_le16(sizeof(*tlv));
+	tlv->len = cpu_to_le16(tlv_len);
 	tlv->bss_idx = 0xF;
 	tlv->data_len = pattern->pattern_len;
 	tlv->enable = enable;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 293f173b23dd..26e9d90ad503 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -587,6 +587,9 @@ struct mt7925_wow_pattern_tlv {
 	u8 rsv[4];
 };
 
+#define MT7925_WOW_PATTERN_TLV_V2_SIZE	\
+	(offsetof(struct mt7925_wow_pattern_tlv, rsv) + 3)
+
 struct roc_acquire_tlv {
 	__le16 tag;
 	__le16 len;
-- 
2.43.0


