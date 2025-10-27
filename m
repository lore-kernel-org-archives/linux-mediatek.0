Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135A5CCF9EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b8+dgXV3WJv5lmeh/9J2OvWUpTiG7OLoFwtgYBjv4o=; b=CaEHZUct7ng0dNw/7BEWAZmSsp
	8RQX87gjn/LHTy4yjgkcnSOik3Ec9N9XFxYXn57V50RnCXDW7TVuQXTg0VihLPwX7MqBgITIntrS+
	qQ51VikJsmeG4d1vyhqEYPChNUyP/zlniJaeiSNF3NStsYFv1TU6m23CoWi0xH6M1rVQl24qPJmQT
	ZRzUaQHRcftP3IEdm+xmEVb4Vy/bUWTknA9ow+3Oe0x2fOe+iB/VSOSO9jKKgFh66tkuM4PirUGND
	IkJlP2aPTQNgmy4dq/8rAHBsD7tpWSuosWqXTQDo/gSpE2/W2JwjoqpgswU7qiHkltL3Wc+BVSX9t
	EVYiQR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLGg-0000000Dl0O-3vjN;
	Mon, 27 Oct 2025 11:20:06 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLGd-0000000Dkyl-2veN
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 11:20:05 +0000
Received: from debian.intra.ispras.ru (unknown [10.10.165.19])
	by mail.ispras.ru (Postfix) with ESMTPSA id EC9094076720;
	Mon, 27 Oct 2025 11:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru EC9094076720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1761563998;
	bh=3b8+dgXV3WJv5lmeh/9J2OvWUpTiG7OLoFwtgYBjv4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i4KoaIb1fDzMVyDm880+cH551/IhKGdpfS+LuzVRllkeNSTsjqVvnKqU9Tztzlasi
	 4jWfOoQyS8DQGdpxGsJTNNN5B6pCVvHTgEE6O17ydXNQSPaysRF/e6vPyla9mY1slh
	 PKYWTBc+0of8I9G5lwPkgnOdOeaBy6oyM2a2Z3KU=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matvey Kovalev <matvey.kovalev@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: [PATCH mt76 2/2] wifi: mt76: adjust BSS conf pointer handling
Date: Mon, 27 Oct 2025 14:18:40 +0300
Message-ID: <20251027111843.38975-2-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027111843.38975-1-pchelkin@ispras.ru>
References: <20251027111843.38975-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_042004_234403_485F6405 
X-CRM114-Status: GOOD (  13.89  )
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

Passing a BSS conf pointer to mt76_connac2_mac_tx_rate_val() currently has
two inconsistencies.

When called from mt76_connac2_mac_write_txwi(), BSS conf is got by
dereferencing a vif pointer.  A NULL vif isn't accounted for though the
function itself supposes it to be NULL and tries to handle this case in
previous checks.  This looks like a cosmetic change since the drivers
calling the function (namely, mt7915 and mt7921) set WANT_MONITOR_VIF flag
so judging by info->control.vif initialization inside ieee80211_tx_*()
routines it can't actually come as NULL here.

The same holds for the BSS conf pointer handling inside
mt76_connac2_mac_tx_rate_val().  It is dereferenced before being checked
for NULL.  The function supposes to handle the case so reorder the check
and dereference of the pointer.  Again, this looks like a syntax issue
only.

Found by Linux Verification Center (linuxtesting.org) with SVACE static
analysis tool.

Co-developed-by: Matvey Kovalev <matvey.kovalev@ispras.ru>
Signed-off-by: Matvey Kovalev <matvey.kovalev@ispras.ru>
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 7af6a578562f..3304b5971be0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -297,16 +297,18 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
 				 struct ieee80211_bss_conf *conf,
 				 bool beacon, bool mcast)
 {
-	struct mt76_vif_link *mvif = mt76_vif_conf_link(mphy->dev, conf->vif, conf);
-	struct cfg80211_chan_def *chandef = mvif->ctx ?
-					    &mvif->ctx->def : &mphy->chandef;
-	u8 nss = 0, mode = 0, band = chandef->chan->band;
-	int rateidx = 0, mcast_rate;
-	int offset = 0;
+	u8 nss = 0, mode = 0, band = NL80211_BAND_2GHZ;
+	int rateidx = 0, offset = 0, mcast_rate;
+	struct cfg80211_chan_def *chandef;
+	struct mt76_vif_link *mvif;
 
 	if (!conf)
 		goto legacy;
 
+	mvif = mt76_vif_conf_link(mphy->dev, conf->vif, conf);
+	chandef = mvif->ctx ? &mvif->ctx->def : &mphy->chandef;
+	band = chandef->chan->band;
+
 	if (is_mt7921(mphy->dev)) {
 		rateidx = ffs(conf->basic_rates) - 1;
 		goto legacy;
@@ -584,8 +586,9 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 		bool multicast = ieee80211_is_data(hdr->frame_control) &&
 				 is_multicast_ether_addr(hdr->addr1);
-		u16 rate = mt76_connac2_mac_tx_rate_val(mphy, &vif->bss_conf, beacon,
-							multicast);
+		u16 rate = mt76_connac2_mac_tx_rate_val(mphy,
+							vif ? &vif->bss_conf : NULL,
+							beacon, multicast);
 		u32 val = MT_TXD6_FIXED_BW;
 
 		/* hardware won't add HTC for mgmt/ctrl frame */
-- 
2.51.0


