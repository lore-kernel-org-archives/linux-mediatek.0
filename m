Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89440C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8HH5g9CrxDDIkevGDqVubZk3Zy2h11RIiM+NpG21nw=; b=dmvw3KerekgXIbHuWRzTO96Pse
	QRcLoM1U+kTxL4GYwbdVUDRQDupmB6E7XSf2z7Y1v142Z99uOIoxyJFQ6+KJ2eARaGjhtrgCAHw35
	qYOizEVURVICWwd9piLhb9NKWmFXzKU2fXBU16Q/rdwjDF8pAxIIXMjoO4WgV62Jbv+0xOvPaWgBk
	YeSSV8hLGyZRXctlgSn4d8xav6nFvjCRDd2pJ6xdTqGaCqtASsWlgJz68UrsaRWpXVI/Cjwamtq6B
	WZlbcOGcAgWQInvwu5qUlf95DgPA0DQ2kkOsQ0OGjJPaHh5K+DnxeGdgQmRR/gy0xwpzPPvcsIcyf
	H2AITdAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mZ-0000000HXkc-0NeG;
	Sat, 06 Jul 2024 08:28:35 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mX-0000000HXjD-05qH
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:34 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25e19660ffeso38927fac.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254512; x=1720859312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8HH5g9CrxDDIkevGDqVubZk3Zy2h11RIiM+NpG21nw=;
        b=TpNtmoCpIztsPi5ueDQU/F4Z4PtETiE5qI9zW+Hr7JBuprSWlNnjCrVkIBQZgofXJl
         feteAtIhxVFIWSlG6pHvPbJLcmXPLJh9XfkHGXwrFNRn3/hSzhF3B03ru3oB4pKMgaoR
         idxXUzYOdR/bjJZEWYr1FchlAQQD8jLqiE9Dyr/jH+yPullo9sV2IBCfJFdDUfDZly/L
         hwUv3WB/JkYNi4o2xRgfqqvWYI11igdU71zvRRmB0DP0fMbNkjeTj2OccsM4w5eA2pXK
         2o61wBWLWADHG2NpNYqUrck7I0ZphXhUf7ZJdqFkmhwRgDfhD4Sn+rAK1bAfxRXE4ms3
         nLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV22nYf/2UsPJtXmmNOH6lnjT8P5ukNwJvuPVR6Ud5ESj8ozkdClmiTUCJ3nUlx4dMCszCLY8ncdYzoDGYnru4XysidHMErcbB9qoUjbBLZp0Gq
X-Gm-Message-State: AOJu0YzzRJn9oSsLE50CNm41BSdwAz8Fa6R8aS8QEpZw5HZbBVagBYTk
	jLGVFihtVXl3cpt/2zlY5CtbHzuxVZBqUcc85g3WmZqGqJQkqgjZ
X-Google-Smtp-Source: AGHT+IELUobtU/tVmxvpCBwgfoU9MuC47Dl1sziXTOJx86m3iSk+c4RQTj/vErvNnxbqtl3bSuUB6w==
X-Received: by 2002:a05:6870:d892:b0:254:cae6:a812 with SMTP id 586e51a60fabf-25e2bf101a2mr6994918fac.3.1720254512168;
        Sat, 06 Jul 2024 01:28:32 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:30 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 06/37] wifi: mt76: mt7925: extend mt7925_mcu_uni_roc_event
Date: Sat,  6 Jul 2024 01:27:46 -0700
Message-Id: <4be7b34904034d521dab147883b898b5402fd29f.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012833_089832_656F6136 
X-CRM114-Status: GOOD (  13.00  )
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

We extended the function to be able multiple pieces of information
in a single event, supporting the future MLO-enabled firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 31 ++++++++++++++++---
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  1 +
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 1db81cf4d71d..8069b27ce61c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -313,16 +313,14 @@ mt7925_mcu_roc_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	mvif->band_idx = grant->dbdcband;
 }
 
-static void
-mt7925_mcu_uni_roc_event(struct mt792x_dev *dev, struct sk_buff *skb)
+static void mt7925_mcu_roc_handle_grant(struct mt792x_dev *dev,
+					struct tlv *tlv)
 {
 	struct ieee80211_hw *hw = dev->mt76.hw;
 	struct mt7925_roc_grant_tlv *grant;
-	struct mt7925_mcu_rxd *rxd;
 	int duration;
 
-	rxd = (struct mt7925_mcu_rxd *)skb->data;
-	grant = (struct mt7925_roc_grant_tlv *)(rxd->tlv + 4);
+	grant = (struct mt7925_roc_grant_tlv *)tlv;
 
 	/* should never happen */
 	WARN_ON_ONCE((le16_to_cpu(grant->tag) != UNI_EVENT_ROC_GRANT));
@@ -340,6 +338,29 @@ mt7925_mcu_uni_roc_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		  jiffies + msecs_to_jiffies(duration));
 }
 
+static void
+mt7925_mcu_uni_roc_event(struct mt792x_dev *dev, struct sk_buff *skb)
+{
+	struct tlv *tlv;
+	int i = 0;
+
+	skb_pull(skb, sizeof(struct mt7925_mcu_rxd) + 4);
+
+	while (i < skb->len) {
+		tlv = (struct tlv *)(skb->data + i);
+
+		switch (le16_to_cpu(tlv->tag)) {
+		case UNI_EVENT_ROC_GRANT:
+			mt7925_mcu_roc_handle_grant(dev, tlv);
+			break;
+		case UNI_EVENT_ROC_GRANT_SUB_LINK:
+			break;
+		}
+
+		i += tlv->len;
+	}
+}
+
 static void
 mt7925_mcu_scan_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 7750049c42f2..b7f8802b9cd6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -41,6 +41,7 @@ enum mt7925_roc_req {
 
 enum {
 	UNI_EVENT_ROC_GRANT = 0,
+	UNI_EVENT_ROC_GRANT_SUB_LINK = 4,
 	UNI_EVENT_ROC_TAG_NUM
 };
 
-- 
2.25.1


