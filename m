Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD146C38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPXD+qcLYIZlSplWWRhXiQpzkJn0MvNcUYDTnCW+WRA=; b=LYG6MGUhGhF2EgwwrIvNbkkU1A
	rCR//oojQq1RWPAYknKasVJuwo2ywRRS0TC9ZdOyBRZBIGuXji+ZQWEM7Z9wYCMUZ8SRuUysZBhoa
	g4HD9Z3hrJbBqJVgtUtOpum+L36zQzHH0WFoWFw+xN79WGBGJW8Kkj5ypreiRKKclhPRsAeRBWeJb
	b3KlXkBaDMK2VXBBt46rs/c0VT3ODraO5Lrj9ZjQ8vVO13Undxk72jL0aG0+5Kig1mOD+GVpWf3ja
	Ch9txM+gyWWnLwPCHHtu5BzZcb5BtE66sTobZyXub17epc10KrNKO/gbz4NBzmt2lbunWfG2Bs93x
	Z2FUrtcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nQ-0000000HYMH-1lSp;
	Sat, 06 Jul 2024 08:29:28 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nM-0000000HYJa-2Hl7
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:25 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-254939503baso94617fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254563; x=1720859363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPXD+qcLYIZlSplWWRhXiQpzkJn0MvNcUYDTnCW+WRA=;
        b=otk0ibmwhJ7XggQfFdqgz4/OnZpVZFO0mYBGIoQYN3r4okRroPYR48P07UpI/id3EF
         HR5EzKLz6PyxMP4kbnHbMBCCLmJGutmYEFG4hmgB7jNx5Nr9eLOdxG0/yZaoVHWtRzDW
         V0f0HnQsgoGeBpPxzEi2aCf5u9gExH3Kor6qDI60jKY5vZKGEzhH0JGJyg7nNf2l7oA9
         iHbJKBO49PoGw8RBPlFwbK1glPE/at17yeyqsUPOb2G9490tkfdy7NcrVxCniLka30r5
         6vvr28dNXKDqgBsDcsBUk4lrS4OUJAONt84mL/lxlyjzX/yWXbZyl4yEY4tEM3j8k0Nx
         jfug==
X-Forwarded-Encrypted: i=1; AJvYcCXu6GuxOWOvcQujbnefN+rH9EA9gWe2SpO90qCoZjE+SFP4msiVM3OQtKqCE8jPNOsonD+Uiu1XU4x9b/QUArkd9n4vgTS8uZA/G4rAJeCaC9pV
X-Gm-Message-State: AOJu0YxyOQHADz2HhRxVjR8yc3n2cDgG3DexN7roDaFjbQ4wKXQ9lbvD
	EZN/yDsM7Tqo7Hsg/wUnrqZsFkl8/JYn9KVYieDr6Y0v5azXoSSM
X-Google-Smtp-Source: AGHT+IGSumjq8WH2euzBlt3u6CQIhacQboPCctwrhsnbLP+bFEVWpWgi5grP+bQyszbsoNsnemKBbw==
X-Received: by 2002:a05:6871:24ca:b0:254:ecbd:1815 with SMTP id 586e51a60fabf-25e2bffce48mr6347097fac.5.1720254563614;
        Sat, 06 Jul 2024 01:29:23 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:22 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 36/37] wifi: mt76: mt7925: remove the unused mt7925_mcu_set_chan_info
Date: Sat,  6 Jul 2024 01:28:16 -0700
Message-Id: <0aa0abe7fc661380ae812c6bc879a7705de401b2.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012924_620587_9107185D 
X-CRM114-Status: UNSURE (   9.77  )
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

remove the unused function mt7925_mcu_set_chan_info

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 74 -------------------
 1 file changed, 74 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5f2f866e3ce7..cb5c607b9260 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1274,80 +1274,6 @@ int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 				 &req, sizeof(req), false);
 }
 
-int mt7925_mcu_set_chan_info(struct mt792x_phy *phy, u16 tag)
-{
-	static const u8 ch_band[] = {
-		[NL80211_BAND_2GHZ] = 0,
-		[NL80211_BAND_5GHZ] = 1,
-		[NL80211_BAND_6GHZ] = 2,
-	};
-	struct mt792x_dev *dev = phy->dev;
-	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
-	int freq1 = chandef->center_freq1;
-	u8 band_idx = chandef->chan->band != NL80211_BAND_2GHZ;
-	struct {
-		/* fixed field */
-		u8 __rsv[4];
-
-		__le16 tag;
-		__le16 len;
-		u8 control_ch;
-		u8 center_ch;
-		u8 bw;
-		u8 tx_path_num;
-		u8 rx_path;	/* mask or num */
-		u8 switch_reason;
-		u8 band_idx;
-		u8 center_ch2;	/* for 80+80 only */
-		__le16 cac_case;
-		u8 channel_band;
-		u8 rsv0;
-		__le32 outband_freq;
-		u8 txpower_drop;
-		u8 ap_bw;
-		u8 ap_center_ch;
-		u8 rsv1[53];
-	} __packed req = {
-		.tag = cpu_to_le16(tag),
-		.len = cpu_to_le16(sizeof(req) - 4),
-		.control_ch = chandef->chan->hw_value,
-		.center_ch = ieee80211_frequency_to_channel(freq1),
-		.bw = mt76_connac_chan_bw(chandef),
-		.tx_path_num = hweight8(phy->mt76->antenna_mask),
-		.rx_path = phy->mt76->antenna_mask,
-		.band_idx = band_idx,
-		.channel_band = ch_band[chandef->chan->band],
-	};
-
-	if (chandef->chan->band == NL80211_BAND_6GHZ)
-		req.channel_band = 2;
-	else
-		req.channel_band = chandef->chan->band;
-
-	if (tag == UNI_CHANNEL_RX_PATH ||
-	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
-		req.switch_reason = CH_SWITCH_NORMAL;
-	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
-		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
-	else if (!cfg80211_reg_can_beacon(phy->mt76->hw->wiphy, chandef,
-					  NL80211_IFTYPE_AP))
-		req.switch_reason = CH_SWITCH_DFS;
-	else
-		req.switch_reason = CH_SWITCH_NORMAL;
-
-	if (tag == UNI_CHANNEL_SWITCH)
-		req.rx_path = hweight8(req.rx_path);
-
-	if (chandef->width == NL80211_CHAN_WIDTH_80P80) {
-		int freq2 = chandef->center_freq2;
-
-		req.center_ch2 = ieee80211_frequency_to_channel(freq2);
-	}
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(CHANNEL_SWITCH),
-				 &req, sizeof(req), true);
-}
-
 int mt7925_mcu_set_eeprom(struct mt792x_dev *dev)
 {
 	struct {
-- 
2.25.1


