Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DE5CDB47C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kv79dqtnd7K7KyZqWwESbiQtv3Ep1j7XGjVimvSOdhE=; b=KX2Q88YYqo9GIXOoocFcJG6TWk
	U1qBd1kYkvqChMAJN3M9o/Or0HUTPLFx3a+RSTYA1D/2r1ISJKKdlIsi10WbRQh9Xq4LQdKAlPKnU
	3AdMOyLUx6XRWq+aXS0By+23yhleW8goELm54BonB013L1jQNP+SWwHMxklQ1q0iL/oQZR9tQLpB/
	cDpcp3gdU409rh6galgVUvpi6vtR8HGGIf8LpLubgHJZDtYTdBdGSWTqx/4L+yh3r3nqZcPLLWNXV
	/PJcCAQ6CccSbYcJvlsTyIN0elcRzzymvTqJgw2+52BY3NygGSNXXf73zDYEUUFkeKO5Ewkx/On2C
	hmDsna0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXoj-00000008Sbu-0hRj;
	Thu, 25 Jun 2026 00:19:41 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXog-00000008SaZ-20Za
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 00:19:39 +0000
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c86214eead7so142594a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 17:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346778; x=1782951578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kv79dqtnd7K7KyZqWwESbiQtv3Ep1j7XGjVimvSOdhE=;
        b=DDYZBhkimXTDbsF5+8Lq7AM5lU/GGhgcxAgXxmqyuGj6WpuJS3YYR143ksVfhHUxwW
         AbnVgBV7CgosrTH5BZ+S4Xc/x4Fnyb5O4QCkQhh8IjoEbuiqyJLWdRFQtkcAZlMrDb3k
         lMKpsKQKwDbpINmz8Jf8JuJ7GIYd7Ej52yHeQuwN+l4IJkETZjEDahmweEbUmeLlVi5s
         UCqSPBTiZwWWjcUn0Qk66FW9QtZH5saQM3G6nGoTjxYv0D1isvt1C5IgNQQd+eP9hP0N
         aCTwpbjqpjHGZk08IMjci6/2ztnOllyMj8FPfrVrwfwDg+aYG1vxFAjic5kXY8R/JWPB
         wnpw==
X-Forwarded-Encrypted: i=1; AFNElJ/zfPaLAJSvHm9dwnTOJB2dA9XT5B5XcjzpnkskbWY9tR57c/gJ0KK61qs48yjyyS3gmcxMM/DcDgxE6KuM7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxA6pn+TcBihdqkpYr++7Eh1gHTqTHWSMkBia281yNwRbD5gsnp
	onbOZATpc1Wvga5E9lRBkzb3pz5dtD3D58DmfHCMotiCBL7pJvBOKekH5F65qEFr
X-Gm-Gg: AfdE7cm8DVUGkjVDNQCI/EXzNF02Am3+ptVrJGfpErX9xzwT7CnrA9d0l6Ga4RSl7J6
	DXOFSM2Ve5Unq6zHjFhMW8UiM/5/aDmMb3LY6iEUWpETkvuLRoN+QnMXDtXjG4STiKbW5Tql+wk
	5hIjZ5k6r6EXZ7d9RcqoLjwF4YhCJ71zDHBhG4WAXO1mCMqUwH5E2P9begUzaQ0HIqTZzgMOb8A
	RzfWTeKKW9p+uhEfgOzRltoJ93pue1mtnLAjaxCAysfjOvspE6GmJxBfKhxTaaZVvHAYAXzECch
	DmtT5yeBvZ5AMTHSerTahji317HRkFC6mwQ3MhkpbyjhCnCvM8ohGC9+PlHbcrDisQi520WQ1X3
	nhtDxoD2FDanADKG1s5Yn9xWYHIhEqoBn1i8+eYhkpuTVaJzj1UARe7Lo00DWAiMN2scp4/XcaF
	ERAi2qo1jJNk17R5uCRE7vC/0FUHPEyh7MLNAC/RKmfLCubn2mbkMNiNHbujAMz/Y+2qAQy0MmT
	Lx1pb5g+Ti2gdJ20YJSVjwTg8kcOQ==
X-Received: by 2002:a05:6a20:e615:b0:3a3:adea:83bc with SMTP id adf61e73a8af0-3bd4aba5255mr248086637.15.1782346777654;
        Wed, 24 Jun 2026 17:19:37 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm586839a12.21.2026.06.24.17.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:19:37 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: chengwei.yu@mediatek.com,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 3/9] wifi: mt76: connac: add NAN connection type
Date: Wed, 24 Jun 2026 19:18:28 -0500
Message-ID: <20260625001834.475094-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625001834.475094-1-sean.wang@kernel.org>
References: <20260625001834.475094-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_171938_520362_110E7ED9 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Sean Wang <sean.wang@mediatek.com>

Introduce a dedicated NAN connection type for connac firmware and use it
for NAN interface device, BSS and station records.

Add the common NAN MCU command and event IDs used by mt7925.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Co-developed-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   | 14 ++++++++++++++
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 6596c9e198f4..67eba4dd9615 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -422,6 +422,10 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		basic->conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		basic->aid = cpu_to_le16(link_sta->sta->aid);
 		break;
+	case NL80211_IFTYPE_NAN:
+	case NL80211_IFTYPE_NAN_DATA:
+		basic->conn_type = cpu_to_le32(CONNECTION_NAN);
+		break;
 	default:
 		WARN_ON(1);
 		break;
@@ -1217,6 +1221,11 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 	case NL80211_IFTYPE_ADHOC:
 		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		break;
+	case NL80211_IFTYPE_NAN:
+	case NL80211_IFTYPE_NAN_DATA:
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_NAN);
+		basic_req.basic.conn_state = !enable;
+		break;
 	default:
 		WARN_ON(1);
 		break;
@@ -1625,6 +1634,11 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 	case NL80211_IFTYPE_ADHOC:
 		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		break;
+	case NL80211_IFTYPE_NAN:
+	case NL80211_IFTYPE_NAN_DATA:
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_NAN);
+		basic_req.basic.active = enable;
+		break;
 	default:
 		WARN_ON(1);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 78f633ad81a0..a9a4a87ae0a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -876,6 +876,7 @@ enum {
 #define NETWORK_P2P			BIT(17)
 #define NETWORK_IBSS			BIT(18)
 #define NETWORK_WDS			BIT(21)
+#define NETWORK_NAN			BIT(22)
 
 #define SCAN_FUNC_RANDOM_MAC		BIT(0)
 #define SCAN_FUNC_RNR_SCAN		BIT(3)
@@ -888,6 +889,7 @@ enum {
 #define CONNECTION_IBSS_ADHOC		(STA_TYPE_ADHOC | NETWORK_IBSS)
 #define CONNECTION_WDS			(STA_TYPE_WDS | NETWORK_WDS)
 #define CONNECTION_INFRA_BC		(STA_TYPE_BC | NETWORK_INFRA)
+#define CONNECTION_NAN			(NETWORK_NAN)
 
 #define CONN_STATE_DISCONNECT		0
 #define CONN_STATE_CONNECT		1
@@ -1074,6 +1076,7 @@ enum {
 	MCU_UNI_EVENT_THERMAL = 0x35,
 	MCU_UNI_EVENT_RSSI_MONITOR = 0x41,
 	MCU_UNI_EVENT_NIC_CAPAB = 0x43,
+	MCU_UNI_EVENT_NAN = 0x56,
 	MCU_UNI_EVENT_WED_RRO = 0x57,
 	MCU_UNI_EVENT_PER_STA_INFO = 0x6d,
 	MCU_UNI_EVENT_ALL_STA_INFO = 0x6e,
@@ -1313,6 +1316,7 @@ enum {
 	MCU_UNI_CMD_FIXED_RATE_TABLE = 0x40,
 	MCU_UNI_CMD_RSSI_MONITOR = 0x41,
 	MCU_UNI_CMD_TESTMODE_CTRL = 0x46,
+	MCU_UNI_CMD_NAN	= 0x56,
 	MCU_UNI_CMD_RRO = 0x57,
 	MCU_UNI_CMD_OFFCH_SCAN_CTRL = 0x58,
 	MCU_UNI_CMD_PER_STA_INFO = 0x6d,
-- 
2.43.0


