Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57558606A327
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cn2wInqm;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AccT0Gtp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iqFD1Dy0PA5Hv/7kVoTZRvbdlmdkVu9y//K9Cw3fKM8=; b=cn2wInqm9sqfH+Rblg+kGLtcch
	Rm4E4/0OhW+KIPXCywsa0oY/KVWNsDehIxsrnM2jci9yzhdaoN/XDMD+xwuckf4Jt35bnIQhiTvgD
	RvpSdgDEwx/98lnLuQau9IQgeEKuv+0U9rvzOK+Tj4roRSeNvwUflROTQnJoz7hVrdGZaAoN3gusF
	o0lfOj/2F2bAHJCi2FiRvsZvrthET2H0wHKoUElZlMdeWvEmBaQPyD3nRe7gsI4RJoF/qxUXMxFTL
	M1S9wVXla3Gk0eK9r9IJSFeuZS25zMVy7CiQiZlvZapQaN7cwCf9ims2J/abBIQb0VqZsVRvfb376
	kRtEmd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVCV-0000000HD4v-0GKj;
	Sun, 15 Nov 2026 08:02:59 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVCS-0000000HD35-15WR
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Nov 2026 08:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iq
	FD1Dy0PA5Hv/7kVoTZRvbdlmdkVu9y//K9Cw3fKM8=; b=AccT0GtpYOmkgHaMbw
	qgk5oDQiS2+F1HIJtb+ZKtzUXFiXh54CYN9I5QXybfghSl07ssNJFR5CUN9Sr2O9
	aVHMcfKssWn8Cj0UVh6X01X72wBDJjRvjdSp/NCAU8/CWDTJauu5jt6RiNq4crHu
	XhmT7y22CyAFlzxkKRUhDaVxs=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBnbpcfZ_lqTjp7HA--.27549S2;
	Sun, 15 Nov 2026 16:02:39 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
Date: Sun, 15 Nov 2026 16:02:39 +0800
Message-ID: <20261115080239.910402-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnbpcfZ_lqTjp7HA--.27549S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF18Ww4fWFyktFWUGw15Arb_yoW5tw43pa
	yjk3y5Gr1kXrs5Zw18Cw4j9FWava1fKFyIkryfG3Z5uFZ5tr18JFsrXry0vryYkr4kuFnI
	yFW8tr98Gayq937anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkpnQUUUUU=
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7QD6S2r5ZyCuOAAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_000256_745710_42D4A48B 
X-CRM114-Status: GOOD (  10.75  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For unicast frames mt792x_rx_get_wcid() returns the wcid of the
receiving link. Since commit 43aa4033eb18 ("wifi: mt76: mt7925: add
mt7925_change_sta_links") the wcid of a non-default station link is
embedded in a separately allocated struct mt792x_link_sta, not in
struct mt792x_sta. mt7925_reverse_frag0_hdr_trans() still casts
status->wcid to struct mt792x_sta and derives the ieee80211_sta from
it with container_of(), so for a frame received on such a link it
reads msta->vif past the end of the link allocation, dereferences the
result as a vif, and copies sta->addr from memory in front of it into
the rebuilt 802.11 header.

This path is taken for the first fragment of a header-translated
unicast frame, so it is reached when the AP sends fragmented data on
a secondary link while RX header translation is active there.

Do what commit a3ea1c309bf3 ("wifi: mt76: mt7996: Fix
mt7996_reverse_frag0_hdr_trans for MLO") did for mt7996: get the
station through the sta back pointer of the link and wcid_to_sta(),
and take the BSSID from the bss_conf of the receiving link.

Found by LLM-assisted source review. Not tested on hardware.

Fixes: 43aa4033eb18 ("wifi: mt76: mt7925: add mt7925_change_sta_links")
Cc: stable@vger.kernel.org
Signed-off-by: Ziheng Wei <zihengw03@163.com>
---

Notes:
    The changelog was drafted with an AI assistant from my analysis;
    I have reviewed the code, the fix and the text.

 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 7af996abe..e00c04cf5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -184,7 +184,9 @@ static int mt7925_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct ethhdr *eth_hdr = (struct ethhdr *)(skb->data + hdr_gap);
-	struct mt792x_sta *msta = (struct mt792x_sta *)status->wcid;
+	struct mt792x_link_sta *mlink = (struct mt792x_link_sta *)status->wcid;
+	struct mt792x_sta *msta = mlink ? mlink->sta : NULL;
+	struct ieee80211_bss_conf *link_conf;
 	__le32 *rxd = (__le32 *)skb->data;
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
@@ -201,8 +203,11 @@ static int mt7925_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	if (!msta || !msta->vif)
 		return -EINVAL;
 
-	sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
+	sta = wcid_to_sta(status->wcid);
 	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+	link_conf = rcu_dereference(vif->link_conf[mlink->wcid.link_id]);
+	if (!sta || !link_conf)
+		return -EINVAL;
 
 	/* store the info from RXD and ethhdr to avoid being overridden */
 	frame_control = le32_get_bits(rxd[8], MT_RXD8_FRAME_CONTROL);
@@ -215,7 +220,7 @@ static int mt7925_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	switch (frame_control & (IEEE80211_FCTL_TODS |
 				 IEEE80211_FCTL_FROMDS)) {
 	case 0:
-		ether_addr_copy(hdr.addr3, vif->bss_conf.bssid);
+		ether_addr_copy(hdr.addr3, link_conf->bssid);
 		break;
 	case IEEE80211_FCTL_FROMDS:
 		ether_addr_copy(hdr.addr3, eth_hdr->h_source);

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0


