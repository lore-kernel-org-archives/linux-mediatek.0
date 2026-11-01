Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9657B606A324
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2026 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=con9LFiV;
	dkim=pass (2048-bit key, unprotected) header.d=mtu.edu header.i=@mtu.edu header.a=rsa-sha256 header.s=google header.b=QDcImI6q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VzoqmSGTK2p7iNyBmDYghxEoApvenhg3wCg4KbKbjoQ=; b=con9LFiVe0/wMc+wy/fcm6iJAX
	wyx/4nLzJsWTl8BRmqRVCU7BtAjN/0GsmNKsocf5eYrKoVH+5vdIZR6TCXMu0FTO0H7ODmcusV0vb
	TROGLdbJpVFb1vTRF1/34aGjLrcO0k5XxIEWiftjOs2IIkApmCO6mfdsdAsOTRA1GFECGfcNFSXcr
	rpKQtJpfLnAtyjkkRGHfgCGaXe2120GeGNI12SztqsUoCFWIA7S2rsGRcRvbEr8fyenzsBZSFLb5v
	99K2WV/Go+E2iZ/JUiW1C07BeC9pQ4qaXfSfyHKtBqEdzs5tj+tbzV+pTIr1j/CiXdzZLbeK5Ju1k
	fsgo6M8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNc9f-0000000EsWA-3VHE;
	Sun, 01 Nov 2026 20:27:51 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNc9c-0000000EsVk-2DFy
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Nov 2026 20:27:50 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67990a45e02so1935713d50.3
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 12:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mtu.edu; s=google; t=1793564867; x=1794169667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzoqmSGTK2p7iNyBmDYghxEoApvenhg3wCg4KbKbjoQ=;
        b=QDcImI6q6thT43ZEDTDCoouT8dXFpHgZRYLCKSRsGrrQYKp+Cl+hK+KkMSnNLosBED
         f1bvE++pSTIUw6GkgidaMoT0BhrCRBlxlLWXijhl8563osCKCKLv+PMDcOz67B9VMtfc
         xTCEBOBZ/QbA+nEiccqHoDKXrvZolsnyerSWCDhEI5XUezZKaSmw7Nl2mYdKrlhfAdJt
         jgKT2/2O97eOmNioaP2eN3STb+Ej4B6Q6pORtpSsCHkTRB2leJ4y0dQb3YWsjPvvumfY
         Ejn0/maM1rnRwsE1u195ayfg/vOEpm4nSN8jeQb0ELV0YkbQXW3+0z54fzteIU+Nx5rF
         Q5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564867; x=1794169667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzoqmSGTK2p7iNyBmDYghxEoApvenhg3wCg4KbKbjoQ=;
        b=DSPE00FAe0blImWH4SZo73Z6ax/STpq13IBwoPE13J9OMV50k4osxLRSafe/JrWw2W
         T3Q0xeGeRI3+8xOUXeTH/BZXtPNQLgDWpiDWDY638DeSeEaa+8ZV7/kz+EohwN1ugyMI
         WVtie0Qd65SmVLfoXh2fiK4Lqx9EdcT88TfIK0Y3EHbnUZRmpRkwsjTsbke11SyF/SUQ
         q/M8Q8jbPrNNzJtPYxoWMVOALzTlh4nNt8wK0/oIlf0CaFsYUxZiTmaMGEUvxpuKwz3E
         o48Eu7/x1ltjPi2MHvw799iK7xqRteDZJduE59BgvquX+fxNpJVjwjz+IP2JiCWlyHSp
         4HcA==
X-Forwarded-Encrypted: i=1; AKwUvByY8z9AzdQmX11DIejxVp/Rqa3repu6SAPiOom0P76kZ8sQlV5AbXrJJzAJSksxxQLcIh+Wdj4aJJRKywSANg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9Cp0LLYDYCEph6gkAiPNmJoj3cpPqYU++tD42RwTVgBGSQLpKU
	TZXx47FoK5w9zA/5qldQLI7y1dB98MIVEK+4DF9e4UYdqmWYCoGrp2+mInRZyJRDMw==
X-Gm-Gg: AYBFou2h5/bNJ8/iqmqbQhCdGAsPEsqk4bTQXRYnKchlbdV38qd1jsxCxF8nCiPvOw3
	c3gCQKgZ7u1An+nwjj7pUxPvC0757frFJ8N2G7ZvDrt+1ax3IprNDjipCoEzbelsvTPrzZKAOMb
	inhmygJYz3W43J3V6jJJDyDZqtl97nhM29GZsySKnlNrMPtOHFieksMx+sa1+gWyRakjEN9Nvlx
	Y/+hMpWfe6EHRxcX+pyYY5QKZ34v38OuZriNPmPBFhSzmicpmw3VY5MefW9bIEmedcS4NhsKWZF
	a++lxH5L+jhLWB7sW5lYzisx4CGU9+FEKKhnuzti54oRVcYBZbCyiQsHetgRc8EUtkuQ7TVVOgL
	74iqrmZkBy0WEBc362ibjzraFeFOtU7r7ofDWsLtXVHbnbMOJtBKdQaLKFl8cuGKigNU6ldgz9s
	iwyvFAj+6km/kHrNHwBPEdVRsT+skqabJ91C4XqLXUwiFZhjBpPDyqBWy6XgsMDcWi+0MayOM5P
	Ao2iIJJHVmW//FUQKM2oSzelvQZCx9F3z5IwQZtF021VtmH7DPA0VWGb4o7WZ/dB3wJxbc/20Yv
	dXKiaxMxDIpcidMxvauLH8OslF+hhdFD89Yg
X-Received: by 2002:a05:690e:4887:10b0:679:a190:cf25 with SMTP id 956f58d0204a3-67ba4f913c1mr3978327d50.53.1793564866791;
        Sun, 01 Nov 2026 12:27:46 -0800 (PST)
Received: from agent-virtualbox.mtu.edu ([47.6.6.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714cb1csm41251707b3.18.2026.11.01.12.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:27:46 -0800 (PST)
From: Aaron Beckendorf <albecken@mtu.edu>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Aaron Beckendorf <albecken@mtu.edu>
Subject: [PATCH] wifi: mt76: connac: honour injected HT/VHT rate and bandwidth
Date: Sun,  1 Nov 2026 15:27:27 -0500
Message-ID: <20261101202727.392683-1-albecken@mtu.edu>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_122748_681466_CA060BB6 
X-CRM114-Status: GOOD (  11.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On connac2 parts (mt7921u/mt7925u) the fixed-rate TXD path uses the
basic rate from mt76_connac2_mac_tx_rate_val() and ignores the rate
carried in an injected frame's radiotap header, so monitor-mode
injection always goes out at a legacy 20 MHz rate and cannot choose the
modulation or channel width.

When info->control.rates[0] contains an HT or VHT MCS, set the TXD6 rate
from it instead: mode (HT/VHT), MCS, NSS, and the 40/80 MHz bandwidth.
Legacy injection and the normal (non-fixed-rate) data path are unchanged.

This makes 20/40/80 MHz HT/VHT injection work on mt7921u/mt7925u.

Signed-off-by: Aaron Beckendorf <albecken@mtu.edu>
---
Tested on MT7921AU (MT7961, USB): HT and VHT80 monitor injection select the
modulation and 20/40/80 MHz channel width, spectrum-verified.

 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 8481eac8d783..e593d1bb5623 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -602,6 +602,38 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		u32 val = MT_TXD6_FIXED_BW;
 		u8 spe_idx = mt76_connac_spe_idx(mphy->antenna_mask);
 
+		/* Honour an injected HT/VHT rate and bandwidth from radiotap:
+		 * connac otherwise transmits at the basic rate picked by
+		 * mt76_connac2_mac_tx_rate_val(), so monitor injection cannot
+		 * select the modulation or channel width.
+		 */
+		if (info->control.rates[0].idx >= 0 &&
+		    (info->control.rates[0].flags &
+		     (IEEE80211_TX_RC_MCS | IEEE80211_TX_RC_VHT_MCS))) {
+			struct ieee80211_tx_rate *tr = &info->control.rates[0];
+			u8 mode, mcs, nss = 0, bw = 0;
+
+			if (tr->flags & IEEE80211_TX_RC_VHT_MCS) {
+				mode = MT_PHY_TYPE_VHT;
+				mcs = ieee80211_rate_get_vht_mcs(tr);
+				nss = ieee80211_rate_get_vht_nss(tr) - 1;
+			} else {
+				mode = MT_PHY_TYPE_HT;
+				mcs = tr->idx & 0x7;
+				nss = tr->idx >> 3;
+			}
+
+			if (tr->flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
+				bw = 2;
+			else if (tr->flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
+				bw = 1;
+
+			rate = FIELD_PREP(MT_TX_RATE_MODE, mode) |
+			       FIELD_PREP(MT_TX_RATE_IDX, mcs) |
+			       FIELD_PREP(MT_TX_RATE_NSS, nss);
+			val = MT_TXD6_FIXED_BW | FIELD_PREP(MT_TXD6_BW, bw);
+		}
+
 		/* hardware won't add HTC for mgmt/ctrl frame */
 		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
 
-- 
2.53.0


