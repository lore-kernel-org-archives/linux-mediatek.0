Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F02C3ABBC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 May 2025 04:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O3InXEk3eeMPg88Bbl7ExC6WZ6duJi1MWLlEMwziyOo=; b=pDMBdpVKLN3gmPbIQbGESm4Hlo
	Zmoe9ISGg0oADipHSMYz8gNBXEMKJ/JByDxxKp42d6ao6n9HX0u1srtXqpwHCvqKKIJNRLId3HoIU
	xTFA2MxQLorlXd0vzEnYsnpPBp2PSOWSFTiPv1zK3Oxvzs65JAtbJOuF3Kf67LAEDLR909bKF+Y25
	90N0ns66kNfTAgIr1igyIwG+VhrKlJfyisZauod2HLTHoXz2ubBinzfhLyLOj/542GtD/e+Qc9iQw
	mjxtXo6QU+eSeo2hZbXYYl5bd43XoUpxQuP4xx0Etfjooe1CZnvA/NRU3LuN4vgF0YfPZEyGh9xqz
	UL/EMzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAOs-0000000AKcx-15fU;
	Tue, 06 May 2025 04:59:26 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5MF-000000095qq-27Ei
	for linux-mediatek@lists.infradead.org;
	Mon, 05 May 2025 23:36:24 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-400fa6eafa9so3745961b6e.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 May 2025 16:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746488182; x=1747092982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3InXEk3eeMPg88Bbl7ExC6WZ6duJi1MWLlEMwziyOo=;
        b=ird2wn3nxS8TEJB6q49wJj2thbuK6LxSwVdy4WTPExaR278PNohGmgUhPjrzCk9vQm
         yngdwgjkPAaBnyGhXt93InR4I5LPAx7erXY1lSijsSIElmjuGXMKEerSBBB9YsUQb606
         P+FO4iVselnF97IYOjV6xFmHqydaLQXR74cSZHgNz1TILKzRjwolFWWoIXm9LJsosI2t
         eH2ANG5erbpW5oQfhUmzKU6tVVSZQjicXgRGK7ZljC6L3t61ugjAuy1U/8dst/6/6HT0
         yr3nhR7dojvgaThOokghy/c5YyF5ZSNqyfKLwBgY3fn4pHjBPgDzjDMHY/Jep96/5j73
         qecw==
X-Forwarded-Encrypted: i=1; AJvYcCW9oV8G46m7gXZy04I7rHDJoNrNU8ciG0YH/iWxkPXVRecfF4k2emsuyeUWyg838UfADFHiHKz6vzoxIX8RYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnRLFrsgrYHynoNFBc6XlIL/RljfvqaFRxkm6cZA8RCrxmR8xT
	hh4GY0b0wcrZhV4yWganD7GWnly/3kXWVe/h7+BZHhe5og2utlBv
X-Gm-Gg: ASbGncsK7OxZfEI00HTVDdQmyfzcPo+wbCF+/SrBRAZUAnOVMmJtqjfqY7AsXvVORo3
	5216nU6r5xv3x3oAPOMEpuHoGf2N9XRXKPm3IswHNwkJRM3jf6+op3YbYbS5JBzAajWvCBTY97S
	9vbK6BMGpIgECt1vUfZg0afOdDs89/i3VIshi5knPol5Bu1JD/2rsMt4XoOSmR/JgWKebAewpo8
	HCBNZ/yhWu0s4hmStS07kJjEy3U5S4kudu+GxI6Ck/Yhctqc39DDJ7GjJcYUz+rkLfrM7msK/Ug
	M4xcKceNrLHnWFVamt6iqyBiNs/LUtdzivdUA6ixHcC7OXvcUlaT3UAPEA==
X-Google-Smtp-Source: AGHT+IF8PocL0oUQHtGFXCQvytLe0iLxExx/tdYg9SuEchZO1ZNOhs9sP6b0x2iq0mY6pE5lKcpEtw==
X-Received: by 2002:a05:6808:3448:b0:403:50e7:83e1 with SMTP id 5614622812f47-40350e78733mr7927204b6e.11.1746488181776;
        Mon, 05 May 2025 16:36:21 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dc83025sm2157543b6e.43.2025.05.05.16.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:36:21 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Michael Lo <michael.lo@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7925: extend MCU support for testmode
Date: Mon,  5 May 2025 16:36:17 -0700
Message-Id: <20250505233618.1951021-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_163623_542153_C39229F5 
X-CRM114-Status: GOOD (  11.76  )
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

From: Michael Lo <michael.lo@mediatek.com>

Add MCU command and its handling needed for testmode support on
MT7925. This enables low-level chip testing features such as
continuous TX/RX..

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Michael Lo <michael.lo@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  7 +++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  8 ++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 48 ++++++++++++++++---
 3 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 478cd1886736..f93f58eb9bcf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1183,6 +1183,11 @@ enum {
 #define MCU_UNI_CMD(_t)				(__MCU_CMD_FIELD_UNI |			\
 						 FIELD_PREP(__MCU_CMD_FIELD_ID,		\
 							    MCU_UNI_CMD_##_t))
+
+#define MCU_UNI_QUERY(_t)			(__MCU_CMD_FIELD_UNI | __MCU_CMD_FIELD_QUERY | \
+						 FIELD_PREP(__MCU_CMD_FIELD_ID,		\
+							    MCU_UNI_CMD_##_t))
+
 #define MCU_CE_CMD(_t)				(__MCU_CMD_FIELD_CE |			\
 						 FIELD_PREP(__MCU_CMD_FIELD_ID,		\
 							   MCU_CE_CMD_##_t))
@@ -1288,11 +1293,13 @@ enum {
 	MCU_UNI_CMD_EFUSE_CTRL = 0x2d,
 	MCU_UNI_CMD_RA = 0x2f,
 	MCU_UNI_CMD_MURU = 0x31,
+	MCU_UNI_CMD_TESTMODE_RX_STAT = 0x32,
 	MCU_UNI_CMD_BF = 0x33,
 	MCU_UNI_CMD_CHANNEL_SWITCH = 0x34,
 	MCU_UNI_CMD_THERMAL = 0x35,
 	MCU_UNI_CMD_VOW = 0x37,
 	MCU_UNI_CMD_FIXED_RATE_TABLE = 0x40,
+	MCU_UNI_CMD_TESTMODE_CTRL = 0x46,
 	MCU_UNI_CMD_RRO = 0x57,
 	MCU_UNI_CMD_OFFCH_SCAN_CTRL = 0x58,
 	MCU_UNI_CMD_PER_STA_INFO = 0x6d,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 286f602623c0..df38009e0036 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3342,6 +3342,14 @@ int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 		if (cmd == MCU_UNI_CMD(HIF_CTRL))
 			uni_txd->option &= ~MCU_CMD_ACK;
 
+		if (mcu_cmd == MCU_UNI_CMD_TESTMODE_CTRL ||
+		    mcu_cmd == MCU_UNI_CMD_TESTMODE_RX_STAT) {
+			if (cmd & __MCU_CMD_FIELD_QUERY)
+				uni_txd->option = 0x2;
+			else
+				uni_txd->option = 0x6;
+		}
+
 		goto exit;
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index d55ea59bda7d..aed2a1eceac9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -104,13 +104,6 @@ enum {
 	MT7925_TM_WIFISPECTRUM,
 };
 
-struct mt7925_rftest_cmd {
-	u8 action;
-	u8 rsv[3];
-	__le32 param0;
-	__le32 param1;
-} __packed;
-
 struct mt7925_rftest_evt {
 	__le32 param0;
 	__le32 param1;
@@ -602,6 +595,47 @@ struct roc_acquire_tlv {
 	u8 rsv[3];
 } __packed;
 
+enum ENUM_CMD_TEST_CTRL_ACT {
+	CMD_TEST_CTRL_ACT_SWITCH_MODE = 0,
+	CMD_TEST_CTRL_ACT_SET_AT = 1,
+	CMD_TEST_CTRL_ACT_GET_AT = 2,
+	CMD_TEST_CTRL_ACT_SET_AT_ENG = 3,
+	CMD_TEST_CTRL_ACT_GET_AT_ENG = 4,
+	CMD_TEST_CTRL_ACT_NUM
+};
+
+enum ENUM_CMD_TEST_CTRL_ACT_SWITCH_MODE_OP {
+	CMD_TEST_CTRL_ACT_SWITCH_MODE_NORMAL = 0,
+	CMD_TEST_CTRL_ACT_SWITCH_MODE_RF_TEST = 1,
+	CMD_TEST_CTRL_ACT_SWITCH_MODE_ICAP = 2,
+	CMD_TEST_CTRL_ACT_SWITCH_MODE_NUM
+};
+
+union testmode_data {
+	__le32 op_mode;
+	__le32 channel_freq;
+	u8 rf_at_info[84];
+};
+
+union testmode_evt {
+	__le32 op_mode;
+	__le32 channel_freq;
+	u8 rf_at_info[1024];
+};
+
+struct uni_cmd_testmode_ctrl {
+	u16 tag;
+	u16 length;
+	u8 action;
+	u8 reserved[3];
+	union testmode_data data;
+} __packed;
+
+struct mt7925_rftest_cmd {
+	u8 padding[4];
+	struct uni_cmd_testmode_ctrl ctrl;
+} __packed;
+
 static inline enum connac3_mcu_cipher_type
 mt7925_mcu_get_cipher(int cipher)
 {
-- 
2.25.1


