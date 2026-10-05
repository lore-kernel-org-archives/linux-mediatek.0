Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABFDCA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 20:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7CIz5GCzQTx1u9zSREPXq6K8PDjPziXPtPA+hC7sFVE=; b=qVEb1xNiSKy/Bw54NZbRTAUFKZ
	pr7hW+xOBQlY4IjpD5SvPjPyMmoKcYd64WbAf88f+atp3b6rz4sqAysElWKutvowWqt9CB+Syg9FH
	LJ7D0wuSXIK9Yuco2UYco7dSBj5FQt58P7S3LcdroeIM+vSFJpdrVwWC23vvMdYNo8CsQy5taKyY6
	2xAxNYyw9wUbpaMZONzicbKl7Vof70fQ7GIi3VS48erd8yUn7Ef8dt8uz6t+7KzjuV8QnPFrJywbL
	uuBfq7VQ+a4hUD3m3NrQnpJm8uRiCRnUW6T3PCWPTSCwLyd7VA8LIcVjIZlAeayKD8d9hf++ljybr
	XYTmfdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpSb-0000000H98c-46yG;
	Mon, 05 Oct 2026 20:38:57 +0000
Received: from out-84.mta0.migadu.com ([2001:41d0:1004:224b::54] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpSX-0000000H98B-1wEg
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 20:38:56 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YrYyR/6BX+th5kqG38wmrgA+/1vrNlDI2jJdQhFFI3w=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791232729; v=1; x=1791837529;
 b=DvE0DMbmUyYPAkBFz0mJ6mSEb8FoLLrSgc9o5+pphOeXczzfnRv8aqNVlUBKhGdNpfk98qN8
 b+pNk/fth+D6G0Mt7cO1THxrVBJocVnms6hUsUEAwsP81HhP/qL0NqyuxM0aXu+WQj3UCeU69Uq
 sLKoCkh0/+SdGCgPrLExC2XUUn5haC6MYD44hG75/xrdCYHIuGsq+ZpUx7TJQzgMBy5F+DuUFma
 DoFHeGLPiiFqfkvhyMp9iWoX/IKAht1K/ScmWu2uLSo+lGf9FXgDux51Ua3Edw3l+u5XaDmpcue
 sB7S0ggUnhcPJqrrboUQ1zUekcqQX1GM2CYy5/4/1aXAg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fcdd8944095dfdfa;
	Mon, 05 Oct 2026 20:38:48 +0000
X-Mizu-Trace-ID: fcdd8944095dfdfa
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7921: keep the join ROC until the station is authorized
Date: Mon,  5 Oct 2026 13:38:46 -0700
Message-ID: <20261005203846.239445-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_133853_924895_46FD9ED8 
X-CRM114-Status: GOOD (  18.21  )
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

From: Mark Anthony Agarro <markanthonyagarro@gmail.com>

When an association succeeds mac80211 calls mgd_complete_tx(), and
mt7921 aborts the join ROC there. The AP starts the 4-way handshake
right away, so the abort lands where message 3 arrives. On an MT7922
this loses message 3 often enough to matter: the supplicant sends
message 2 (acked), never receives message 3, and the connection ends
with reason 15 (4WAY_HANDSHAKE_TIMEOUT) after about 3.3 s. The mt7925
capture in the linked issue shows the same ordering: abort, message 2
out, then message 3 retried by the AP several times without an answer.

Keep the ROC after a successful (re)association on a station interface
and release it when the station is authorized, on disassociation, or
when the station is removed. The ROC timer still ends it if none of
that happens. The state lives in a flag in struct mt792x_vif so that an
unrelated ROC, for example a user remain-on-channel, is never aborted
by the authorize hook.

Tested on an MT7922 (PCIe), kernel 7.3.0-rc4, WPA3-SAE AP, two rounds
of 20 disconnect/reconnect cycles per build in the same boot, unpatched
and patched in ABAB order:

  unpatched   34 of 73 association attempts: M1 rx, M2 tx acked,
              no M3, reason 15
  patched      0 of 40

Delaying the abort by 20 ms before it made no difference (8 of 29),
and delaying 20 ms after it removed the failures (0 of 20), so what
matters is where the abort lands relative to the handshake. The
firmware behaviour after the abort is inferred from these outcomes, not
observed directly.

Not tested: MT7921 and other connac2 parts, USB and SDIO, APs other
than the one above, open or WPA2 networks, scheduled scan, suspend and
resume.

Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
Link: https://github.com/morrownr/mt76/issues/106
Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 21 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 68a059504e83..828b5b5df343 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -865,6 +865,12 @@ int mt7921_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (sta->aid > MT7921_MAX_AID)
 		return -ENOENT;
 
+	if (mvif->roc_join_held && !sta->tdls &&
+	    (ev == MT76_STA_EVENT_AUTHORIZE || ev == MT76_STA_EVENT_DISASSOC)) {
+		mvif->roc_join_held = false;
+		mt7921_abort_roc(mvif->phy, mvif);
+	}
+
 	if (ev != MT76_STA_EVENT_ASSOC)
 	    return 0;
 
@@ -906,6 +912,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 
 		mvif->wep_sta = NULL;
+		mvif->roc_join_held = false;
 		ewma_rssi_init(&mvif->bss_conf.rssi);
 		if (!sta->tdls)
 			mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
@@ -1447,6 +1454,20 @@ static void mt7921_mgd_complete_tx(struct ieee80211_hw *hw,
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 
+	/* The AP starts the 4-way handshake as soon as the association
+	 * succeeds. Releasing the join ROC at this point makes the firmware
+	 * unresponsive for several ms right when message 3 arrives, so it
+	 * can be lost and the handshake times out. Keep the ROC until the
+	 * station is authorized; mt7921_mac_sta_event() releases it. If that
+	 * never happens, the ROC timer or the station removal does.
+	 */
+	if (vif->type == NL80211_IFTYPE_STATION && info->success &&
+	    (info->subtype == IEEE80211_STYPE_ASSOC_REQ ||
+	     info->subtype == IEEE80211_STYPE_REASSOC_REQ)) {
+		mvif->roc_join_held = true;
+		return;
+	}
+
 	mt7921_abort_roc(mvif->phy, mvif);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 9efc251cb745..d4bbfaeb54b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -191,6 +191,7 @@ struct mt792x_vif {
 	struct mt792x_sta *wep_sta;
 
 	struct mt792x_phy *phy;
+	bool roc_join_held; /* join ROC kept until the STA is authorized */
 	u16 valid_links;
 	u8 deflink_id;
 	enum mt792x_mlo_pm_state mlo_pm_state;
-- 
2.55.0


