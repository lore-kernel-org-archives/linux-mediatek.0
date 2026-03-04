Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55B0EFCE53
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 23:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXvnDKqcGmwB0NG7zczjsoKBWgPELsqRrCKeMO4tmuo=; b=HMdkhd8FQ+tLgeewY7e/0VpbBe
	yAI8pE4dlhBonmIaJefvWqvNyo3/F7nzMts90h11saoXymklfIZbj6H6RjL7y2X6SRL4mTLy+tHdh
	L/0CCysqFk9xCzn6T2xpOduUEQKi831qB8GQ3xEFsVeDc1AEhyTUjwQDR/1FYjAPi8H5vpXb5k1qD
	XEyEA+lFA5gwuziRXfSAI9NHhW2fF8e/68rsW4U1WuEKNqJmmwk1efZLsBpCAZH4J8jpeSIQmleBR
	tyFmwOmxWtiZO+tLPR6RBTyAuYJYLptrdJKhhd/EW10UGoDJ+38BP/vaCajgHaJ7Uxhj8CgFT2Jj/
	LyJqEuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzd-00000000eGL-3AhC;
	Wed, 04 Mar 2026 23:51:05 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzV-00000000eDp-3ScM
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 23:51:03 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45f194e9a98so2821168b6e.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 15:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668257; x=1773273057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eXvnDKqcGmwB0NG7zczjsoKBWgPELsqRrCKeMO4tmuo=;
        b=KY0e2zL1rIif2VM6IONjaAsAqI9+XkbaSJI5wttVXFmZu/e6TywNr95a4Jrxx0t+8p
         csFCyv8F9MP5uiKcwvpppL0If3SzXCvurRILldvvOhiTehMQvdJ3mT29RV/Y+hx9KYz2
         LxPQwyj5kqkr6uQP7InkTSAyri9/7VTWSk4rZn2KSnYWVo0K/xQHEIcCVHCdlJ/eDPWO
         mg1FFyoTWTbyJuhm/2w/93ETdVWipe3qpmvrrRhX8P65oViTeCbDKsZdapxmlLvgVHVd
         r/p8VtpQvPuSRqI8N5F/pJ0CeAiCRtiI1UaXR3MD+Lh/gwbMM83PNkX1be8HS441X1IW
         3f7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNHzmp0skheH5Q0+WT9QueIaWRQ9I9GMRPwaIGlS3rLSG0cnj3NqDUxzv9sj9wsZrJDfuUWx0NsshJ1AJA2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGVaU2PLqIyy8nHSWbMLxvqg8S6y2vJqBo15gmpGbBnnf2FYNf
	kip+eew+PARXal5nWmnXR04MdxZ+XHaWGkbJUHoKk2jdK7hMIGPHAP4P
X-Gm-Gg: ATEYQzwXE9tj5Cxuqo6I/10O086Dxm23oDk6xYLI61AXGWvQQyyf4HNiQbT+I+VFOse
	JHwEgVAzO1MuRogNAHvHg7Q1E1zi5WDwSgJzWH6z4h5STsXgFfUqJTVQ6bBTHrB2IqNDZiDFr5s
	LVdfchPCah8TL9iX5COhDp7e8kZAl10X8Lb5mjw2g4nOifRJ0S9Ff5SWwrdKBK8Z1/2UVymFsWG
	qNH9xpAFyjQ8VPtXqjezk4EbsX75Y6H3aVxePbs/hgxcJc0a/oHedoT/Sj6QQhRQxlk56M2XG0D
	BFhOQq6KKMO1NQbIEfYoEEaeoJ9NHA/1ll1rWR71JFvlYx03r+dtMMRE7vTSxMb/Wn+pjdO7TUr
	/VbdfShDspWKecc5L0nYB0HxvHeXKDmEU0s6Jl5+UTyo9K6yJEDff2KlxG4/QFO9rmb3G7s4mEA
	UxHegPl0EfJ6gtDARntxwOLH806zn8Gilny/q1GWaINn3EfM49SnD9uhw9dA==
X-Received: by 2002:a05:6820:f024:b0:676:f8f6:3f67 with SMTP id 006d021491bc7-67b1e902872mr1929735eaf.59.1772668256728;
        Wed, 04 Mar 2026 15:50:56 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bfee3csm14410687eaf.7.2026.03.04.15.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:50:56 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	yuchi.wang@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 4/7] wifi: mt76: connac: add NAN connection type
Date: Wed,  4 Mar 2026 17:50:17 -0600
Message-ID: <20260304235020.40451-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304235020.40451-1-sean.wang@kernel.org>
References: <20260304235020.40451-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155057_873245_03E744D6 
X-CRM114-Status: UNSURE (   9.62  )
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

Introduce a dedicated NAN connection type for connac-based firmware.

This prepares driver support for NAN interfaces by allowing MCU
device/BSS configuration to represent NAN roles using a distinct
connection type.

No functional behaviour change yet as NAN is not exposed to userspace.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 11 +++++++++++
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c      |  4 ++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 89bd52ea8bf7..09efcab7d783 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -422,6 +422,9 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		basic->conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		basic->aid = cpu_to_le16(link_sta->sta->aid);
 		break;
+	case NL80211_IFTYPE_NAN:
+		basic->conn_type = cpu_to_le32(CONNECTION_NAN);
+		break;
 	default:
 		WARN_ON(1);
 		break;
@@ -1212,6 +1215,10 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 	case NL80211_IFTYPE_ADHOC:
 		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		break;
+	case NL80211_IFTYPE_NAN:
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_NAN);
+		basic_req.basic.conn_state = !enable;
+		break;
 	default:
 		WARN_ON(1);
 		break;
@@ -1613,6 +1620,10 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 	case NL80211_IFTYPE_ADHOC:
 		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		break;
+	case NL80211_IFTYPE_NAN:
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_NAN);
+		basic_req.basic.active = enable;
+		break;
 	default:
 		WARN_ON(1);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index fd9cf9c0c32f..11986e164a38 100644
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
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 261ed6528808..a41e0d2fb3f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2563,6 +2563,10 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 		basic_req->conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		basic_req->active = true;
 		break;
+	case NL80211_IFTYPE_NAN:
+		basic_req->conn_type = cpu_to_le32(CONNECTION_NAN);
+		basic_req->active = enable;
+		break;
 	default:
 		WARN_ON(1);
 		break;
-- 
2.43.0


