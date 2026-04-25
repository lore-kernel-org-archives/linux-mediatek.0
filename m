Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C3FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+f7hrp6zawtRyS6qyle7M+HDDLHBwXS9lZz+C1x6Y0=; b=mYjjnM5o26NcU0qhh11bVW7a+y
	2n7XWBhL1D7Bj4iKoxaMYRGwfwz9f+rFMPuMXgCs0tewpgK2/8+N+vs7Ff6cFVpAZVHCo6BagSWfT
	iinQelcWsXklKZPgiPkOLqcH8STpKjyYZugpWDtTuvl4KLojdScDjud8rOFDBxm3arQDHZgLnWkQc
	ZAdx2hGAikiGR8lHQnqg4TpmfUjjJ44lA7mZZ0w4ecyKYl995rSaDE7sXDCC1g5tbRwMoKiF6VLZa
	Gbho2PUTv6mCHdT5Y6Rs773ZpL73MS4bz17kkH8XBB1ajHIuIXAyzvYHeStjSiyd6c7hb2+nRogMK
	0gk9OMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2j-0000000EmZl-1xiG;
	Sat, 25 Apr 2026 19:51:57 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2h-0000000EmYu-2Snv
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:56 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dd73b7c757so2214476a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146715; x=1777751515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+f7hrp6zawtRyS6qyle7M+HDDLHBwXS9lZz+C1x6Y0=;
        b=ehqOpJ+X0YeHSw/57QXu5rekglt9/IdBVxo0arfxR6rzcdpWpxTuqEKpSJxP3P+8D4
         BSbSwosynSMb63gHp7uDHRQ07debUTg/fiN0OVZme8c0ZnD49f9mtMEt1wcarScER0/J
         DEF3s3KCOEb7JXoEPsKq/DORBhRtFAFzd80baRDX69LAvWjo4pdnE79dDUNdHW4xIlxD
         CvTlB2NCffLR60YGr9Y3IDr8Sw0TXVozplG2nsq59UJECcmEjnZcS5hvrkJrEzNHXzQW
         wTHDgl/al/AAWKnuL90sqNiEp/+CwA59NHfvrP/dFIb3hNyLengiTxEGe0JxJcu7b3xM
         CrZg==
X-Forwarded-Encrypted: i=1; AFNElJ+DqV8BkH2EnjzvFXUpv7TPtTY+smvy8l+kRw9RVjsQ1VchtCwAvitO93fYhzI8iI3wSREc9Tl0dVKLJubB8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiX0ADsdRvbLYdfzLtTC90ntflQbh9jGxo3HEwYOm4rYKEN50/
	FBPzm0m6EVn1Mnm80rRqt/rHwNtpGJzK+LPAsLeHjaWK0Lz7VxNqQDRb0zirNA==
X-Gm-Gg: AeBDieuwp23hjwOGo+Ue1k4uYKzzcvJ4ge2b8sWw8h5fmKM6+cJHFh9AYcjUIlOwzmI
	vAmekJIo4iHtiVyFEcOgeXiy+CeHD6b547tPhopB5WS9VAkQ+Pgwzol5/ZC9plwMvryn+fLfO+D
	AoPtNhxA6cLV1a1J53xXiFDAdB3kioUvEixhVSrRpu97STMGLe9QtjHdETko9sgmQaJHv9dPMJF
	66nHIAW/75Iqs9MbR/gyRHDf5wfK0fsrBFrUuPYruc2mJEXU1nowDJPO93jSZnO4YBth1/I509C
	0WohLkFocZKYSQGzfMJdPN30OAmqrX20sWdWMnz3QWWKB9Gz2o7lrqSwZveKHQTTnxRVRIDd6+8
	xQQzYASxplcDUGDPgdrES/z5OVVZC+HluPyyNiVT319Ax4djPbr88guMjvT+H8TGUjkP9j2TZw4
	QRJvK/UTWmRMtGcIeGyzFgDSZYBl2Dj41DEzGhK4rCLtt4ETJEjFd3yILeWSInS0VAxAHp9aMqA
	w==
X-Received: by 2002:a05:6830:67ec:b0:7dd:e032:3cdf with SMTP id 46e09a7af769-7dde03240f4mr10407359a34.19.1777146714794;
        Sat, 25 Apr 2026 12:51:54 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:54 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 18/21] wifi: mt76: mt7925: add MBMC event handling
Date: Sat, 25 Apr 2026 14:50:08 -0500
Message-ID: <20260425195011.790265-19-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125155_626301_92B5FCCD 
X-CRM114-Status: GOOD (  11.81  )
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

Handle MBMC unsolicited events from firmware to report the current MBMC
state. This helps validate MT7927 band setup.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 31 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  3 +-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 4691b9b5e2be..6d0429f40b0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1069,6 +1069,7 @@ enum {
 	MCU_UNI_EVENT_SCAN_DONE = 0x0e,
 	MCU_UNI_EVENT_RDD_REPORT = 0x11,
 	MCU_UNI_EVENT_ROC = 0x27,
+	MCU_UNI_EVENT_MBMC = 0x28,
 	MCU_UNI_EVENT_TX_DONE = 0x2d,
 	MCU_UNI_EVENT_THERMAL = 0x35,
 	MCU_UNI_EVENT_RSSI_MONITOR = 0x41,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f7e14cc53dac..4a06f0a1ce03 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -566,6 +566,34 @@ mt7925_mcu_uni_debug_msg_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	}
 }
 
+static void
+mt7925_mcu_handle_mbmc_event(struct mt792x_dev *dev, struct sk_buff *skb)
+{
+	struct mbmc_conf_tlv *tlv;
+	u32 tlv_len;
+
+	skb_pull(skb, sizeof(struct mt7925_mcu_rxd) + 4);
+	tlv_len = skb->len;
+	tlv = (struct mbmc_conf_tlv *)skb->data;
+
+	while (tlv_len >= sizeof(*tlv) &&
+	       le16_to_cpu(tlv->len) >= sizeof(*tlv) &&
+	       le16_to_cpu(tlv->len) <= tlv_len) {
+		u16 tag = le16_to_cpu(tlv->tag);
+
+		if (tag == UNI_MBMC_SETTING || tag == UNI_MBMC_NO_RESP_SETTING) {
+			dev_dbg(dev->mt76.dev,
+				"MBMC event: tag=%u mbmc_en=%u\n",
+				tag, tlv->mbmc_en);
+			break;
+		}
+
+		tlv_len -= le16_to_cpu(tlv->len);
+		tlv = (struct mbmc_conf_tlv *)
+			((u8 *)tlv + le16_to_cpu(tlv->len));
+	}
+}
+
 static void
 mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 				    struct sk_buff *skb)
@@ -584,6 +612,9 @@ mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 	case MCU_UNI_EVENT_ROC:
 		mt7925_mcu_uni_roc_event(dev, skb);
 		break;
+	case MCU_UNI_EVENT_MBMC:
+		mt7925_mcu_handle_mbmc_event(dev, skb);
+		break;
 	case MCU_UNI_EVENT_SCAN_DONE:
 		mt7925_mcu_scan_event(dev, skb);
 		return;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 56e2772f3ffe..293f173b23dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -143,7 +143,8 @@ enum {
 };
 
 enum {
-	UNI_MBMC_SETTING,
+	UNI_MBMC_SETTING = 0,
+	UNI_MBMC_NO_RESP_SETTING = 1,
 };
 
 enum {
-- 
2.43.0


