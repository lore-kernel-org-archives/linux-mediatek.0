Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848DBC61DC7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3MKQPh2C4GF9FMSVOY2+ZQfDuvG76VBsD6KML05fJ6E=; b=BjOXhfsd1ZOmI5WjciSeQ8JG1F
	ihlrasxLSNRJr2JeJ2qp5WuSGQzo5koVyl+AiHk4lM76LMzwShGjkfZHcR1BXIfrdEDz8meZ41csr
	AT52UBnDqCQzVD8TxfGyF0K9bT+I/y3ywpVNAnL6ixyyzZuB6bqYfEZpnBIjDnwY3So0f51+dgfGr
	xIS4ylGAjo4bv/08BtqCoJlY8iXyO99LFG8srKw0dsUPxv6aCFkD80JDyuACyxHdAP4fK6jMWSn3I
	v36fM2hxPhtcJiLGLGdW/IAyJJMSTeXZbiB4nM1bi465L8/dpUd7ZpEiIfqKP5F4yWiR22uwvxdtI
	2+FirUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9lt-000000029tX-3hnK;
	Wed, 26 Aug 2026 09:18:14 +0000
Received: from mail-qv2-x01.google.com ([2607:f8b0:4864:33::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9lq-000000029sJ-13dL
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Aug 2026 09:18:11 +0000
Received: by mail-qv2-x01.google.com with SMTP id 6a1803df08f44-8ef118ead8eso5780566d6.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2026 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787735888; x=1788340688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MKQPh2C4GF9FMSVOY2+ZQfDuvG76VBsD6KML05fJ6E=;
        b=bXz9neiiMbmL2txgI7M4WRM+l6Pnc16rGTzufuqaFAedC8+JjHuR4Q92XlzPbX1Vfd
         2cpbPPNUu1YxyL2IKtqJC+HqDXDUJIQAdVDopF9Q5SDDv4bYjGdy3GmT3JfpARNxvKGn
         84GofVxkS45f56zsd2LDxx5Yb5ozEao5PbzVT1BacJlvAeQFGpZymrjNbQTh1oHCa3mO
         SPeZS/SPs8cm8+IAGq49H1/Qe/wgmhVDYYhsWDYxJ5FzAWIktcQ1lni0UFm0KicmkzNb
         Iu4k1cAsL42vb7ziLoQ2eeC8e1/9DOXeP+jRY/1PuePwUEZeDGpf5+Z3u9LXpZmLqtcW
         fSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735888; x=1788340688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MKQPh2C4GF9FMSVOY2+ZQfDuvG76VBsD6KML05fJ6E=;
        b=G1VjIKDL/2DEnp7oX2AfpdDeKkeHZaX1yaGnKN4h8UpB6rNothR0ZJtXOkmgiczXB0
         AjBB6U3ynsCpco1jmXD6ErBmwdoguuX3lrYvDuiYFsdtbJvHZY6KSxyx7jZGUEYn5kSO
         +tEep+DXl/1ABaKB7+Ua3Ca4FYRlZAqxtHrcKDM15FEOyWrMDm2KTfMk+ihBIddjM3Pj
         3pbXZ+2SIPpoAJqwoXvAYsMulZwqCN5gw3HM5kG9rWCdMBy5yGN/VZqXaZsbXl+8WmXq
         oIS02LozyHOgByFDToxYWGKcGnwd9Ih9SUu/YbLQElEEXlT7PfxQ8lUo7qZl22EGc+pR
         Z/Vg==
X-Forwarded-Encrypted: i=1; AHgh+RrXa7SPKSJ7DRIyGetABF9KefXQfhxSuFvpumBd1FPFy8NVmd1HNepHlq8nq92xQXUDg4C/dvUkwA4E384lzw==@lists.infradead.org
X-Gm-Message-State: AFuF++kBAh6iG0PdpHlDzdk9rwz7u2w1cjnNwCqQUTzlghkE/WmLAmPu
	GDTs5fXd8wm08gl8f9s4s+xB4ZtZ9vFTN4JBr9Aa+ZeG5GWxRKzHzxd0
X-Gm-Gg: AR+sD10+8xwyFGC4F8XThDklhA4+lBBnafqS8oH617Cq4ZUhgv8EuFQnSJmud7J0qPt
	Yt/uQEER99RapyCfQZdzTLC3k6YntYaBPwSkwP0tRJMArJX9QxUV3JoIPnnPCw9I9UGTAFVfvLg
	lJL2bOn+VUbzPsHTbwsMeGorUmmyQ7flFEOWDLTyb4gZXcEnJGQ8hgkue1+mvs99WUu6NSPsikH
	wu4u0s/Mv2BKn5Zq5pbeVbyT7iFYCctnQkdEdHhziZr9PyJsm7x/3ASM5EiP403OAfGWcK3JEyC
	MXFiJU2nQfcgEW4NLSLXY54b+zPFjMv91xC3AIqviNIDosvkZXhYLscJ4lRo2VBGcwtelP+13fr
	m5O94cmhU1MBXRTaHRPQGGrYhze48EpKQmNeKqVIyxLND8O5Zju1wakAjkeIZvKE8RNKRbXkEVg
	pIMsAMcgQuu/uqKO4KjzEF6sF/ZisB+ac/EvhgNg4CuRGrZ7qYf31c/nXX5kAT5dKQAUSw7IKAT
	M1dJceHk2adWg==
X-Received: by 2002:a05:6214:260d:b0:907:94e6:f8bc with SMTP id 6a1803df08f44-90cc79998c3mr49398766d6.15.1787735888267;
        Wed, 26 Aug 2026 02:18:08 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:39f:4500:5acb:2301:2b5a:c076])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc65448f5sm20748926d6.45.2026.08.26.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:18:07 -0700 (PDT)
From: Mark Anthony Agarro <markanthonyagarro@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>
Subject: [PATCH wireless] wifi: mt76: mt7925: honour mac80211's FIF_FCSFAIL instead of hardcoding drop_err
Date: Wed, 26 Aug 2026 05:17:57 -0400
Message-ID: <20260826091757.469953-1-markanthonyagarro@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_021810_315597_2A871908 
X-CRM114-Status: GOOD (  13.80  )
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

mt7925_mcu_config_sniffer() hardcodes drop_err = 1, ignoring what
mac80211 actually requested via configure_filter(). FIF_FCSFAIL is
computed there but discarded instead of persisted.

Persist the FCSFAIL bit on the phy in mt7925_configure_filter() and
read it back in mt7925_mcu_config_sniffer() to derive drop_err, so the
firmware sniffer only passes through unfiltered/marginal frames when a
monitor listener actually requested them.

mt7925_mcu_config_sniffer() is only reached from mt7925_change_chanctx(),
which is itself only exercised on a monitor-mode chanctx, so this stays
scoped to monitor mode.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c   | 7 +++----
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt792x.h        | 1 +
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a9059866b..cfbfd77e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -832,11 +832,8 @@ static void mt7925_configure_filter(struct ieee80211_hw *hw,
 				    unsigned int *total_flags,
 				    u64 multicast)
 {
-#define MT7925_FILTER_FCSFAIL    BIT(2)
-#define MT7925_FILTER_CONTROL    BIT(5)
-#define MT7925_FILTER_OTHER_BSS  BIT(6)
-#define MT7925_FILTER_ENABLE     BIT(31)
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	u32 flags = MT7925_FILTER_ENABLE;
 
 #define MT7925_FILTER(_fif, _type) do {			\
@@ -848,6 +845,8 @@ static void mt7925_configure_filter(struct ieee80211_hw *hw,
 	MT7925_FILTER(FIF_CONTROL, CONTROL);
 	MT7925_FILTER(FIF_OTHER_BSS, OTHER_BSS);
 
+	phy->rxfilter = flags;
+
 	mt792x_mutex_acquire(dev);
 	mt7925_mcu_set_rxfilter(dev, flags, 0, 0);
 	mt792x_mutex_release(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e94fa544f..adc137a0e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2251,7 +2251,7 @@ int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
 			.len = cpu_to_le16(sizeof(req.tlv)),
 			.control_ch = chandef->chan->hw_value,
 			.center_ch = ieee80211_frequency_to_channel(freq1),
-			.drop_err = 1,
+			.drop_err = !(vif->phy->rxfilter & MT7925_FILTER_FCSFAIL),
 		},
 	};
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 4cc259418..8fb8a4c13 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -7,6 +7,11 @@
 #include "../mt792x.h"
 #include "regs.h"
 
+#define MT7925_FILTER_FCSFAIL		BIT(2)
+#define MT7925_FILTER_CONTROL		BIT(5)
+#define MT7925_FILTER_OTHER_BSS	BIT(6)
+#define MT7925_FILTER_ENABLE		BIT(31)
+
 #define MT7925_BEACON_RATES_TBL		25
 
 #define MT7925_TX_RING_SIZE		2048
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 70073b43a..75d32a4ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -168,6 +168,7 @@ struct mt792x_phy {
 	s16 coverage_class;
 	u8 slottime;
 
+	u32 rxfilter;
 	u32 rx_ampdu_ts;
 	u32 ampdu_ref;
 
-- 
2.47.3


