Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0C8C31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCSz8cUWGD3Jpbgh3b2PR3W+Co/hw9DDq4m/R/ZmJnU=; b=u2/g3l/o1e5aOrgtIBAqag12op
	Pd9+Qe8jMNToJAcW1ixJYdVM0hj9kb3JSktjWIfrHATfHpMGF3VGqvxcr2lB8BtMJN0je6mihRCNZ
	B1M7U5oIx0t6SHPPrEGbbWtBqtEdbLxcJFYtilpZRIlvDatpbQ/PruNb4FvBazfA785FpjPC+q5tE
	wpU/CmZSzfkp3e9TDcc4L/PvixbdilGH20BV6U27QTEVF2sAkE1DYtRoGz3bOsKvriEljiYB2FBuI
	6NgmacOQFVFoeS4luc3A0JyiyqEcUIBtQ20ZS7QPXt0AuW9DUnKZAMAxsJawsSHcdTMpKhE3ebSW+
	MkS78VFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lE-0000000BXJ9-2Fcs;
	Wed, 03 Jul 2024 21:43:32 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lB-0000000BXHI-2cyo
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:30 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25d0f8d79ebso8171fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043009; x=1720647809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCSz8cUWGD3Jpbgh3b2PR3W+Co/hw9DDq4m/R/ZmJnU=;
        b=NatHqI7L4U+t+AtXJrZBMt2N+XV8Ztb8j8hnKFCEQ2ArdrwW9JQ1M5Lnrw5ke8AdMW
         TpAv+TC1yUg6wDxmqz/Y0hAI1D8JdWQXYlWdJDSL551x5fJ+Nw/86W+1gLfmACq6tdR6
         mrRdSBnJTMFvfRCirfBzyXvgU3/bWhPSkUgyzXhcWStvSEGhNOFK3EYo02QW/1m8UtdB
         fnrQmj86M9UNIzvYejUzM3YAOHiq2CHSpNaF+qzYba/7FderzO8VzrmDHIJ9FKYvf82Q
         2BkUb7qcwGjko1q55S1vFH+9gTMEQJSTp6SXzv9COq72SX0FGB2FECLTOVtW6ASEfBs2
         FyGw==
X-Forwarded-Encrypted: i=1; AJvYcCXlvuTw5jbVfMGz9T7+oj984rQ+ewPN6AQVX2zcEZdzCxM3l+EILyxQYnoLwpVgH7su2dxpxlBDLzqR+IWGnmFxMX59s3sQ2iyPkyN1WoX5niG/
X-Gm-Message-State: AOJu0Yz4nn3zQzgg8PN+MLzCinhCtRF+sfoI2fAlDNjwcKrhLiBwmQ02
	WyiA7HlMEYiL1mrx9wNw1SKqo09n0dxfqYpA/n+/J1g7kfgRu2zF
X-Google-Smtp-Source: AGHT+IHHdwjRum0Ixy2aektx2Alqi2y35iYb/E46T4+QqCxUIGi/GS+D5lOna7bDGqNjEWMqIfYCRA==
X-Received: by 2002:a05:6830:68cd:b0:700:d697:6ca7 with SMTP id 46e09a7af769-70207554355mr12585381a34.0.1720043008866;
        Wed, 03 Jul 2024 14:43:28 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:27 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 19/29] wifi: mt76: mt7925: update rate index according to link id
Date: Wed,  3 Jul 2024 14:42:24 -0700
Message-Id: <c3a8a5d70fe792aad6b90e0a9d0c7dfb07b2c1d7.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144329_706322_238F38B9 
X-CRM114-Status: UNSURE (   9.46  )
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

Update rate index according to link id.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 265ef7ade6e4..173934ec1e71 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1768,9 +1768,12 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 				     struct ieee80211_bss_conf *info,
 				     u64 changed)
 {
-	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_bss_conf *mconf;
+
+	mconf = mt792x_vif_to_link(mvif, info->link_id);
 
 	mt792x_mutex_acquire(dev);
 
@@ -1784,16 +1787,16 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_MCAST_RATE)
-		mvif->mcast_rates_idx =
+		mconf->mt76.mcast_rates_idx =
 				mt7925_get_rates_table(hw, vif, false, true);
 
 	if (changed & BSS_CHANGED_BASIC_RATES)
-		mvif->basic_rates_idx =
+		mconf->mt76.basic_rates_idx =
 				mt7925_get_rates_table(hw, vif, false, false);
 
 	if (changed & (BSS_CHANGED_BEACON |
 		       BSS_CHANGED_BEACON_ENABLED)) {
-		mvif->beacon_rates_idx =
+		mconf->mt76.beacon_rates_idx =
 				mt7925_get_rates_table(hw, vif, true, false);
 
 		mt7925_mcu_uni_add_beacon_offload(dev, hw, vif,
-- 
2.25.1


