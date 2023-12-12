Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE12C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ablUvZ3rc+zTmuBuMRe8rBpWNx/pnTVFXu2uiXyW4qU=; b=wGxBG9bogwEx6dvsGBzJ8ZuLw5
	w62FpMMoy5GeSpQneL91canU9ObB9+jJkeCceVRcKnJ4lEIvRKbxVb1LsQsUHNcdaq+xiPnOSjNVV
	xmc7HQiNNg0CCZ92cP7acai2/OifJwFOIq5w0BQGXBinjlfCKQtumhsvmdTz5+rlrZZzaoP0yJwVz
	oqF6dHWJeUGR/FlltJAi/Ng4Oms641zl2B3inX5rfPgI2pnNOyvqfwDo2Z5isv8rAu857vhqF9AF0
	FFmImcy82Vn8nlZfaOgb8E1dXyDZrH4AmK/OftIOVuPVQfEJXcXq9n4RNR7NY4YaGMsjkbidbT7Vc
	yG13hcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6LA-00CLTM-2i;
	Tue, 12 Dec 2023 17:14:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6L6-00CLRL-1s;
	Tue, 12 Dec 2023 17:14:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 95068B815AE;
	Tue, 12 Dec 2023 17:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9B9C433C9;
	Tue, 12 Dec 2023 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702401274;
	bh=0is0y5MIjJZL1a2nJQ3+WOieM1cLmm0UpcX5nHtvags=;
	h=Date:From:To:Cc:Subject:From;
	b=ceS2iLLsFyMbhxsaoD2DWiCS35QLZHUdW8HSs9hsJJ7x4jreQ+qE68G0AIYt+5Yrx
	 KVwiwF0imPXk+dfes9RjhYBpvOfvxUwpumb9Cg0e2HCGl5z2+fgG8LHoGGvoDEYPYx
	 DxaqKSg5k3KJV8Jx8gd8XLg8hv4TYMghrMPKWINvNmHGNQliZOf9aAL2UmIHVwmEZC
	 oZw+rhk7ZBVdcEmiWIqL1z+71o5h4SByhC0ROCQJ86Usqzj9kdVIAawGkTsGMhfsxX
	 t46aDHMMzUfL2H4T7c46I0zHcX2osq5XL7ND93jhmAgu9J8aTVSJNb/2/mIY+tNec0
	 S+gFCOZ1tefuA==
Date: Tue, 12 Dec 2023 11:14:29 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2][wireless-next/for-next] wifi: mt76: mt7996: Use
 DECLARE_FLEX_ARRAY() and fix -Warray-bounds warnings
Message-ID: <ZXiU9ayVCslt3qiI@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_091436_928757_98492688 
X-CRM114-Status: UNSURE (   9.85  )
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

Transform zero-length arrays `rate`, `adm_stat` and `msdu_cnt` into
proper flexible-array members in anonymous union in `struct
mt7996_mcu_all_sta_info_event` via the DECLARE_FLEX_ARRAY()
helper; and fix multiple -Warray-bounds warnings:

drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:544:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:551:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:553:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:530:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:538:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:540:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:520:57: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:526:76: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:526:76: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:526:76: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:526:76: warning: array subscript <unknown> is outside array bounds of 'struct all_sta_trx_rate[0]' [-Warray-bounds=]

This results in no differences in binary output, helps with the ongoing
efforts to globally enable -Warray-bounds.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Add Kees' RB tag.
 - Transform zero-length array `rate` into flex-array member.
 - Address five more -Warray-bounds warnings introduced by fake
   flexible array `rate`

 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 3e013b20ee5e..36cacc495c75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -206,20 +206,20 @@ struct mt7996_mcu_all_sta_info_event {
 	u8 rsv3[4];
 
 	union {
-		struct all_sta_trx_rate rate[0];
-		struct {
+		DECLARE_FLEX_ARRAY(struct all_sta_trx_rate, rate);
+		DECLARE_FLEX_ARRAY(struct {
 			__le16 wlan_idx;
 			u8 rsv[2];
 			__le32 tx_bytes[IEEE80211_NUM_ACS];
 			__le32 rx_bytes[IEEE80211_NUM_ACS];
-		} adm_stat[0] __packed;
+		} __packed, adm_stat);
 
-		struct {
+		DECLARE_FLEX_ARRAY(struct {
 			__le16 wlan_idx;
 			u8 rsv[2];
 			__le32 tx_msdu_cnt;
 			__le32 rx_msdu_cnt;
-		} msdu_cnt[0] __packed;
+		} __packed, msdu_cnt);
 	} __packed;
 } __packed;
 
-- 
2.34.1


