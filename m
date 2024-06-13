Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D547C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biE13+3PSSXUiakyN44C2L8O3X99s+HJgpD9eJi/PQg=; b=rYX8uK+88etsKDITlKR0HZyIQs
	MEpFRpSK0avH1BQ692AmbcRgOU/vHXbuWjgSeqsmBYxiVMATeXSREtMPLWR2sKaEb9y0kVzR/+u5V
	0+L3798zP9gioIbQSYNGxIcGjedwnsOx1DMUadNWWHnmlutttQCXAODpELeQ/UxUpPK7jqCoLxOXA
	0e3bAXDHVIrqTU/e/3onucyEm256mqMcn2MeFBwGVzVpsOkXpjC+kYlQGHiAHU5pu11pLZ0ppF9b2
	62Y8cEkfuMef6g1QSlV30j5adfALbXuDNanpiM2lIgdD31Upg/IvrshoABmt9w6+kFolrlI4mgJMv
	Bx+gyPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakX-0000000Evx5-3lXx;
	Thu, 13 Jun 2024 03:03:41 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakS-0000000EvtR-2Kt7
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:40 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b3356fd4f3so38467eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247816; x=1718852616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biE13+3PSSXUiakyN44C2L8O3X99s+HJgpD9eJi/PQg=;
        b=an7VpW4sZiRVNTfaQgLKlSomb/93y+i+D8EKw01il6vHMXpE5Fm2WmGMPDGp+3wFGZ
         C6ulzDV1t3VIFIW1jZl36m4oCrjBhC5tYi7eDoiV/3gksohELAgMWNhnQdQy1c9gGS1W
         9y1Ejsm4R93+2PiOrgUcKFqWgV+UeMeiTRVsaCEqrZXnO72pP5RNF3CPXbBjhWsYCqJM
         iL5f7sjiM5Ozs5dgop+2KtF0YfDTH7+ox5WiBC3TnbbOqK7I2QrxSO5qEx4ky9sl50/j
         UPXtoAkcV7syZYigBInLIhyL8faaXdQXZnZB7jnl97VaIW4amPrZ9Z5DTvxxgn6BVU0P
         RYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXRL/paLyI//L6OViAuGqfBPAw2+hU+Ygn9yk2EqXTyAbNzivmjLep6vHosDJqAZt5/PqCagEVnjCrb5zs0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ZwsWRKFh0BCl6Occ5q/im65pG7MYqTznvEjnRRpt2PCe81Tl
	3bg51UPctB2VZGkMonQwPGKrwos138HwNtTiY3ao64h6J612vKFq
X-Google-Smtp-Source: AGHT+IFkFw7WYMSBH32cZ5CQVdLeLQ+zq1uxq9mqpQa/H0Fd8SFtYYvVtzEcbAScavH1J1ZMgB2CvA==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr3996561eaf.0.1718247815634;
        Wed, 12 Jun 2024 20:03:35 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:34 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 23/47] wifi: mt76: mt7925: mt7925_mcu_set_chctx rely on mt7925_mcu_bss_rlm_tlv
Date: Wed, 12 Jun 2024 20:02:17 -0700
Message-Id: <20240613030241.5771-24-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200336_694212_4F413DAC 
X-CRM114-Status: GOOD (  12.76  )
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

make mt7925_mcu_set_chctx rely on mt7925_mcu_bss_rlm_tlv to get rid of
the redundant code.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 95 ++++---------------
 1 file changed, 16 insertions(+), 79 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 96b7a9df17d8..9d56013b2f55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1974,85 +1974,6 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 		req->sco = 3; /* SCB */
 }
 
-int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
-			 struct ieee80211_chanctx_conf *ctx)
-{
-	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->chandef;
-	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
-	enum nl80211_band band = chandef->chan->band;
-	struct mt76_dev *mdev = phy->dev;
-	struct {
-		struct {
-			u8 bss_idx;
-			u8 pad[3];
-		} __packed hdr;
-		struct rlm_tlv {
-			__le16 tag;
-			__le16 len;
-			u8 control_channel;
-			u8 center_chan;
-			u8 center_chan2;
-			u8 bw;
-			u8 tx_streams;
-			u8 rx_streams;
-			u8 ht_op_info;
-			u8 sco;
-			u8 band;
-			u8 pad[3];
-		} __packed rlm;
-	} __packed rlm_req = {
-		.hdr = {
-			.bss_idx = mvif->idx,
-		},
-		.rlm = {
-			.tag = cpu_to_le16(UNI_BSS_INFO_RLM),
-			.len = cpu_to_le16(sizeof(struct rlm_tlv)),
-			.control_channel = chandef->chan->hw_value,
-			.center_chan = ieee80211_frequency_to_channel(freq1),
-			.center_chan2 = ieee80211_frequency_to_channel(freq2),
-			.tx_streams = hweight8(phy->antenna_mask),
-			.ht_op_info = 4, /* set HT 40M allowed */
-			.rx_streams = hweight8(phy->antenna_mask),
-			.band = band,
-		},
-	};
-
-	switch (chandef->width) {
-	case NL80211_CHAN_WIDTH_40:
-		rlm_req.rlm.bw = CMD_CBW_40MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_80:
-		rlm_req.rlm.bw = CMD_CBW_80MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_80P80:
-		rlm_req.rlm.bw = CMD_CBW_8080MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_160:
-		rlm_req.rlm.bw = CMD_CBW_160MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_5:
-		rlm_req.rlm.bw = CMD_CBW_5MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_10:
-		rlm_req.rlm.bw = CMD_CBW_10MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_20_NOHT:
-	case NL80211_CHAN_WIDTH_20:
-	default:
-		rlm_req.rlm.bw = CMD_CBW_20MHZ;
-		rlm_req.rlm.ht_op_info = 0;
-		break;
-	}
-
-	if (rlm_req.rlm.control_channel < rlm_req.rlm.center_chan)
-		rlm_req.rlm.sco = 1; /* SCA */
-	else if (rlm_req.rlm.control_channel > rlm_req.rlm.center_chan)
-		rlm_req.rlm.sco = 3; /* SCB */
-
-	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(BSS_INFO_UPDATE), &rlm_req,
-				 sizeof(rlm_req), true);
-}
-
 static struct sk_buff *
 __mt7925_mcu_alloc_bss_req(struct mt76_dev *dev, struct mt76_vif *mvif, int len)
 {
@@ -2070,6 +1991,22 @@ __mt7925_mcu_alloc_bss_req(struct mt76_dev *dev, struct mt76_vif *mvif, int len)
 	return skb;
 }
 
+int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
+			 struct ieee80211_chanctx_conf *ctx)
+{
+	struct sk_buff *skb;
+
+	skb = __mt7925_mcu_alloc_bss_req(phy->dev, mvif,
+					 MT7925_BSS_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7925_mcu_bss_rlm_tlv(skb, phy, ctx);
+
+	return mt76_mcu_skb_send_msg(phy->dev, skb,
+				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
+}
+
 static u8
 mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			enum nl80211_band band, struct ieee80211_sta *sta)
-- 
2.34.1


