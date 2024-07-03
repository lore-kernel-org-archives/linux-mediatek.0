Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07E5C31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0BFel98EDVIGHnXe5DFOMwxtme8/0IpNqrQiHcZbZk=; b=xUdx+i4aY/T/wzQf4yqmdBlcGp
	uWNPBC7NeH80dJye3QSvhQ+ofjoOV5k0u1HZzC11EXubHGSwFevTiV1FravI1iJs1p9QnnTXnkn2W
	hHSpi0lAWnQY7i0V9OPsK1fdXDomdbPYc/Jgm8oFtJvK7KDgQBH91+IxmuoyqsVO0vO1zoegfr8JP
	GFwQ98XFpPiw79WmOlyBJ1cTPtQzvieX4Y/50Fc06vQODj1/KfhSghxABlyWzL2En/xSuIHZD5CG8
	y2JFEPmKWLOhmP14OGz+gRmMvFtv/YQEkx2feg1rkdTQ4eeCGmZuzB6vYDGvIAySxz1wWJsrq4YoU
	EZV4QwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ko-0000000BX37-2X0k;
	Wed, 03 Jul 2024 21:43:06 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kl-0000000BX1R-2LKi
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:04 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-700cd6afa3eso204790a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042983; x=1720647783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0BFel98EDVIGHnXe5DFOMwxtme8/0IpNqrQiHcZbZk=;
        b=L1FgFZhYyucTj0XWCiYwB/JYP9vWCnkasqim0pED1EDcFmcoy5/4xE/jbqPyoEVk/m
         VzK6jdadLenr8A9aJrgrOD86durJ9T1PdB25zUw9E60wcChiE/TF3nrtyZTFBhEMPiUJ
         fFkCape+SO5BUWcwDQCH//ATFuECKgQ+zQKvO+2+plMbB5VAkE+ftjs2oZjDl2uBdIyw
         CRs4zSiNE7l+49NXepa498o7kIVII1wYZfULIz3wv1YwGq8Vod+u3o0PgfLmvHNBnRZt
         wFcM31uVt4NVVCMnzvZLCjhZ9mVCPRmMn8bowgg63PzG/Rp8hq8OKP4VXe75LcU+HROK
         YZqw==
X-Forwarded-Encrypted: i=1; AJvYcCWUUiVRQdlRBzQ/SAkRLRy9Jq4ILqx7jB67ykeRJ/o6owsjPk45qN3vTtir+7rHat61e5fxLlll6UIN+j7wVAKIA3VAVhd3UfOi5hXtYTOUYVds
X-Gm-Message-State: AOJu0YyEuywbs96XlKddI/hK/WfRuv3DTDxKvwT6oA9Wd6TveIZ7DX7u
	HF/B+Njvwjoid9bQpTM+nHKrzXFu0+0B2ZHPEAIY6P7ylP0g5a+Ku299YdEE
X-Google-Smtp-Source: AGHT+IHIBPuhs8S/MmmkZNFJsi7Mj84zI6cdYeuYdxvyA0eRKWGxKSOxqLyhUH0gAs/hnQgh4qCzhw==
X-Received: by 2002:a05:6830:4623:b0:700:ce5f:968c with SMTP id 46e09a7af769-702077496d6mr11309998a34.3.1720042982755;
        Wed, 03 Jul 2024 14:43:02 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:01 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 06/29] wifi: mt76: mt7925: extend mt7925_mcu_uni_roc_event
Date: Wed,  3 Jul 2024 14:42:11 -0700
Message-Id: <e163127120c03ea1ba60230130e32fa3bc8e747c.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144303_621094_FD3BBE0F 
X-CRM114-Status: GOOD (  12.99  )
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
index ba91c8e37dff..5693c21bfb4a 100644
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
index 8ec5a3a20202..2de1e38689e7 100644
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


