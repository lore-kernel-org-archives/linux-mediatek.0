Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04688C197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qpSxMQD02TbsUjTC1Qh5tk5c3aZ2Y6bmVsRYWu1ctPE=; b=PEYLOBhKTYJjH52H3kJjZ6a1zB
	uazXTJXqUvqzQNA7/jHbVDgqQ7ZWhM+cAShfTZPotA1EUkuRy0SaUf6DT5c2BUfgiPsEaWILiCbtY
	3z8XAs7Pz4G7sDbtQ3S+aYAe9VvcXlKYUtEbjV4uvGxTdx1su3+P6jHSdhT9DO3fLquNNfhfbprpC
	Udz49JSm5b/xMrBLuPrIrsFbZGxoyjCCtzxb5z5zSAgTXoTsfdBk1Yfo2Owz6cozOCHixvXk2hFvp
	c/ujP7s9XK8OhNR/0yR58w/SChTfXtOwL4ra1dhzshYH10Pj6wnlwcI7d89HZS2mTYPLO+ssBLZ/+
	tTOVBpBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3jQc-004oXV-2E;
	Thu, 16 Nov 2023 20:57:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3jQZ-004oWH-2c;
	Thu, 16 Nov 2023 20:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D93BEB81CE0;
	Thu, 16 Nov 2023 20:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB93C433C7;
	Thu, 16 Nov 2023 20:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700168248;
	bh=EjMKx5nsjR7WnKWGm9tsxjc3r1t11YJJEx0o24R8FgU=;
	h=Date:From:To:Cc:Subject:From;
	b=PMUVa2AIRiGi8EJ9pjFjU+974IoHgg3yEfJ31Q9eTjA5HYvoe/4QP4QL2J9Tenblg
	 5FJZRhqYP3RWZ47tL7qcdk86sP+MG/N68JJSpgBITaZCaL4u2XJD3hoyQ8OmoUFH3V
	 PfBT1Z4KSpHLm75VCOe7WRYrDcFtVAimRoIy3l7MqTJR+ZygB6jkZl3egpJ0iD1O2M
	 LIGs67TT1sWFvI9fzCfybzPrXyytxkGjPQnYIO0qiXtkBNS5Uo3FfSIBSWoig8xcJ9
	 wWRMUUL/LbjCZS/zA53qqnm+OsCno8mT/vBa1PQu13Q+yLWPTMzAp+izmKxXO9XRfO
	 zmU8iEHtVjnxw==
Date: Thu, 16 Nov 2023 14:57:24 -0600
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
Subject: [PATCH][next] wifi: mt76: mt7996: Use DECLARE_FLEX_ARRAY() and fix
 -Warray-bounds warnings
Message-ID: <ZVaCNAohuieMmdq9@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_125732_021379_D55FCF09 
X-CRM114-Status: UNSURE (   8.92  )
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

Transform zero-length arrays `adm_stat` and `msdu_cnt` into proper
flexible-array members in anonymous union in `struct
mt7996_mcu_all_sta_info_event` via the DECLARE_FLEX_ARRAY()
helper; and fix multiple -Warray-bounds warnings:

drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:483:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:490:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:492:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:469:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:477:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:479:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]

This results in no differences in binary output, helps with the ongoing
efforts to globally enable -Warray-bounds.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index a88f6af323da..9f516f796d63 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -163,19 +163,19 @@ struct mt7996_mcu_all_sta_info_event {
 	u8 rsv3[2];
 
 	union {
-		struct {
+		DECLARE_FLEX_ARRAY(struct {
 			__le16 wlan_idx;
 			u8 rsv[2];
 			__le32 tx_bytes[IEEE80211_NUM_ACS];
 			__le32 rx_bytes[IEEE80211_NUM_ACS];
-		} adm_stat[0];
+		}, adm_stat);
 
-		struct {
+		DECLARE_FLEX_ARRAY(struct {
 			__le16 wlan_idx;
 			u8 rsv[2];
 			__le32 tx_msdu_cnt;
 			__le32 rx_msdu_cnt;
-		} msdu_cnt[0];
+		}, msdu_cnt);
 	};
 } __packed;
 
-- 
2.34.1


