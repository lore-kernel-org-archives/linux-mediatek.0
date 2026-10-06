Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7674DCA5FFD
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 03:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ePDX/Jy5LXCj2eR69AARLee6n2woWI2SDFWyzAeSubY=; b=v/uXY1Grg1HMCmZnTWX0Vp9Hio
	aIJWnCBMNyPypRbShmcEmzdvsOr6da4JSBTro/M1Y2dy2dxkFEBgsjoK/MHPElBaaAEKV8xq8Gz2D
	lbZEFaEqc0C6agO5jCEMg5yP+VcQAppl1OKjuBX/xSsRIsYL4YPZNG6LdrIn+wiDPONRkQrZLakIZ
	LxQ3Hy9fP12J9owWOAwssVQjG+S6BO+00zWR4xd5grB6DXv4+211M5dsqSPERD+pRxf+tb+9yBowE
	dCTn0zmohpFExF0GJmAxLKjyF3DiYRENDfO4bHP/eo/cc7xCdBFVj4obQa9QXyfPX90VQqV0Kb4e8
	becDUDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvdX-0000000HYIx-3od0;
	Tue, 06 Oct 2026 03:14:39 +0000
Received: from out-17.mta1.migadu.com ([2001:41d0:203:375::11] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvdS-0000000HYIO-3wgM
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 03:14:38 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=iNqFz5VVYLu8BOKksEYSpdAHzluhTXveXGhG/FJMs7I=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791256469; v=1; x=1791861269;
 b=vDnxcwCM5nkwYZwdjbGKg/lffMGpz+Dy2QPvOHOQIiU0erkZFmGQZobci29FZHzrkVlFuM5Q
 y5NhwQ6O3PkrOzCUTJePwhUGk6icHSXLq6ApHu5TRvfdy9qDFDRf8k0hg3ivAXF6c3eM2wwRrjj
 Se01PWEqRqUii9CjCMB2mTRR9uPPmeNmVxvAInr30t3T4nfoL3WGvnM0lzCKEbEO1rcWd8aMD49
 0SHMroDbI1aqM5OgoJof2U+4Opi4wirioa+y5AHX2wCa83fC33CAcM4AwfOv/4QAualL9xVg9VL
 5X1RPkVPX+MfYXgiW3IjJG8RlBOtA2jNmyIHptlNxNCLw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0cbea5d174a8d1de;
	Tue, 06 Oct 2026 03:14:28 +0000
X-Mizu-Trace-ID: 0cbea5d174a8d1de
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
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Mark Junker <fubar-coder@live.de>
Subject: [PATCH wireless] wifi: mt76: mt7925: keep the join ROC until the station is authorized
Date: Mon,  5 Oct 2026 20:14:25 -0700
Message-ID: <20261006031425.20922-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_201435_530750_B55A4662 
X-CRM114-Status: GOOD (  19.50  )
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

When a non-MLO station associates, mgd_complete_tx() aborts the join ROC
as soon as the association succeeds, which is right before the supplicant
sends message 2 of the 4-way handshake. With the abort that close to
message 2, the adapter acknowledges nothing the AP sends for the next
several ms: the AP sends message 3 and its seven retries within about
5 ms, none is acknowledged, and the handshake ends with reason 15
(4WAY_HANDSHAKE_TIMEOUT).

Keep the ROC after a successful (re)association on a non-MLD station
interface and release it when the station is authorized, on
disassociation, or when the station is removed. The ROC timer still ends
it if none of that happens. MLD interfaces keep the old behaviour: there
the ROC that is active at this point is the MLO ROC set up by
mt7925_mac_set_links(), and holding it makes mt7925_set_mlo_roc() fail
with -EBUSY in the link activation work, which leaves one link instead of
two.

Tested by a reporter on an MT7925U (USB) against a FRITZ!Box 5690 Pro on
a 6 GHz-only, non-MLO SSID, kernel 7.2.3, from traces and monitor
captures taken in separate runs:

                       handshakes   first M3 acked   abort before M2
  unpatched               8 of 84         0 of 83           84 of 84
  this patch             30 of 30        31 of 31            0 of 30

With the patch the AP sends message 3 once and the adapter acknowledges
it straight away; the ROC is released right after the station is
authorized. A 20 ms delay after the abort instead of this change gave
15 of 15, which points at the abort timing and not at the delay.

Tested here on an MT7925 and an MT7927 (PCIe), kernel 7.3.0-rc4: on a
non-MLO SSID neither build showed the failure (1 stalled handshake in 110
unpatched, none patched), so no effect could be measured there. On an MLO
connection the change is inert: 16 of 16 link activations succeeded in
two rounds per build, with two active links and the same ROC order as
before.

Not tested: other APs, other USB parts, MT7927 over USB, MLO connections
beyond the check above.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Reported-by: Mark Junker <fubar-coder@live.de>
Closes: https://github.com/morrownr/mt76/issues/106
Tested-by: Mark Junker <fubar-coder@live.de>
Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
This goes on top of the mt7921 version, which adds the flag both use:
https://lore.kernel.org/linux-wireless/20261005203846.239445-1-lucid_duck@justthetip.ca/

 .../net/wireless/mediatek/mt76/mt7925/main.c  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 5993b31e1aae..6b0a09e2f6cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1243,6 +1243,13 @@ int mt7925_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct ieee80211_link_sta *link_sta = &sta->deflink;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+
+	if (mvif->roc_join_held && !sta->tdls &&
+	    (ev == MT76_STA_EVENT_AUTHORIZE || ev == MT76_STA_EVENT_DISASSOC)) {
+		mvif->roc_join_held = false;
+		mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
+	}
 
 	switch (ev) {
 	case MT76_STA_EVENT_ASSOC:
@@ -1438,6 +1445,7 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		mvif->wep_sta = NULL;
+		mvif->roc_join_held = false;
 		ewma_rssi_init(&mvif->bss_conf.rssi);
 	}
 
@@ -2089,6 +2097,25 @@ static void mt7925_mgd_complete_tx(struct ieee80211_hw *hw,
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 
+	/* The AP starts the 4-way handshake as soon as the association
+	 * succeeds. Releasing the join ROC at this point makes the firmware
+	 * unresponsive for several ms right when message 3 arrives, so it
+	 * can be lost and the handshake times out. Keep the ROC until the
+	 * station is authorized; mt7925_mac_sta_event() releases it. If that
+	 * never happens, the ROC timer or the station removal does.
+	 *
+	 * Not for MLO: there the ROC active here is the MLO ROC set up by
+	 * mt7925_mac_set_links(), which has to be released before the link
+	 * activation work sets its own.
+	 */
+	if (vif->type == NL80211_IFTYPE_STATION && !ieee80211_vif_is_mld(vif) &&
+	    info->success &&
+	    (info->subtype == IEEE80211_STYPE_ASSOC_REQ ||
+	     info->subtype == IEEE80211_STYPE_REASSOC_REQ)) {
+		mvif->roc_join_held = true;
+		return;
+	}
+
 	mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
 }
 
-- 
2.55.0


