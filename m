Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9837CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S2E/Dy2w6ortPriAK1av9RdRN/CI3NUf43JeugdDCvI=; b=ohdexewSA+/0qZIGaeXedaE3Mm
	L+kbYXIURLnLw1nTQobvCcq1ondNZem9vshRHrltSI1KUvzIK+zx5ZBd4r3jgWnury9UpTHVnI7Md
	urQrV/RxX8exHfaZPTDqKpn7sDcRVtRDCcXSQuH+zWCiq124lRlEWSmoyduAMVZtRUzkrC2NydlZx
	0qc1fqkxLFsVoLmByeghbLTuUFqw3eLmsjhSGdSyoo1z48tXXUAqg84G/n/FQ1SXc01PrtnBFRZP8
	koOyKKjcVMcYM1zlJsADMoKxJ3hBRzK9q3xtSHXBTUZt3Ppw95m+VRo6cDuoFDlGPcR6+KUG2yB56
	PvCOMR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpg2-0000000H9xn-0hcd;
	Mon, 05 Oct 2026 20:52:50 +0000
Received: from out-109.mta1.migadu.com ([2001:41d0:203:375::6d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpfz-0000000H9xC-21gJ
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 20:52:49 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Wog0iRSGKClsxMyBudxgkKM7R3EtgCsLpg841Y7blQ8=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791233563; v=1; x=1791838363;
 b=nEKZGjN7wlOHxGzRSTtaE0ho3DibDAUgw9qNi94cRcFnhVTXC3w4J4BO2ufMxeFKtoPnviYK
 Y7gZx/JPzy1vm6aDw//xVFEktBhPNZV7itWTbXWAChJEyqsmccwh/O3tPL4xNc7DF+/66F2CnBK
 Wh3j9hDsultdxNZfbnJQec6uabwFeGOH1l63+G3PMaP8227Pvzs9IQx/HPt+dVIrul5z5v12WAA
 bTjQzhNXfBuGZqA9UkTFoeDM/IT1y9Vstecomj+bmxX1a6Rd3pOxb1nh0VIXmhLvocPmzXPdYW6
 vFGt/gpKdJzimG9ohnTSVA+siyKXHgdETD1NQnLPLXkmg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 12bd7bdb79995992;
	Mon, 05 Oct 2026 20:52:43 +0000
X-Mizu-Trace-ID: 12bd7bdb79995992
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt76_connac: scan 6 GHz wildcard requests passively on connac2
Date: Mon,  5 Oct 2026 13:52:40 -0700
Message-ID: <20261005205240.241136-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_135247_936652_C2C1292D 
X-CRM114-Status: GOOD (  14.44  )
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

With WIPHY_FLAG_SPLIT_SCAN_6GHZ cfg80211 puts the 6 GHz channels in a
request of their own and lists the APs it wants to find there in
scan_6ghz_params. mt76_connac_mcu_hw_scan() does not read them, and the
connac2 scan command has no field for per-target data (only a single
bssid), so a wildcard request is sent as an active scan with an empty
SSID. On an MT7922 the firmware then listens for about 58 ms on a
single channel, shorter than a 102.4 ms beacon interval, and the AP used
for testing does not answer a broadcast probe request, so the beacon is
often missed. A scan of channel 37 (6135 MHz) found the AP in 9 to 17
of 30 attempts, and wpa_supplicant, which scans 6 GHz this way after
the legacy bands, ended up on 5 GHz in about four connections in ten.

Send the wildcard-only 6 GHz request as a passive scan (scan_type 0, no
probe requests). The single-channel window becomes about 119 ms. The
6 GHz stage is identified by sreq->scan_6ghz and not by counting
channels. Requests with a directed SSID stay active, legacy-band
requests are untouched, and mt7925 builds its own command from the RNR
targets and does not use this function.

Tested on an MT7922 (PCIe), kernel 7.3.0-rc4, one UniFi AP with a PSC
channel 37 BSS, same boot, random order, 30 scans per cell:

                             before    after
  wildcard 6135 MHz           9/30     30/30
  5320 + 6135 MHz            10/30     30/30
  explicit passive           30/30     30/30
  directed SSID              30/30     30/30
  5320 MHz only              30/30     30/30
  2.4 GHz channels           30/30     30/30

wpa_supplicant cold start picked 6 GHz in 18 of 30 attempts before and
in 30 of 30 after; the 6 GHz stage takes about 0.35 s longer. Sending
scan_type 1 with no probe requests behaves like the unmodified request,
while scan_type 0 with probe requests works, so the effect comes from
the scan type and the listen window, not from the probes.

Not tested: non-PSC channels, scheduled scan, other APs, MT7921 and
MT7902 parts. This does not fix the 4-way handshake timeout in #106.

Fixes: 0e5911bb7cc9 ("wifi: mt76: mt7921: fix non-PSC channel scan fail")
Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2f925d22b9aa..d684fd306fee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1850,6 +1850,18 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	req->ssid_type_ext = n_ssids ? BIT(0) : 0;
 	req->ssids_num = n_ssids;
 
+	/* cfg80211 splits the 6 GHz channels into their own request and
+	 * describes the APs to look for in scan_6ghz_params, which this
+	 * command cannot carry. As an active wildcard scan the firmware only
+	 * listens for a short time per channel and often misses the beacon.
+	 * Scan the wildcard-only 6 GHz stage passively; directed scans stay
+	 * active.
+	 */
+	if (is_connac2(phy->dev) && sreq->scan_6ghz && !n_ssids) {
+		req->scan_type = 0;
+		req->probe_req_num = 0;
+	}
+
 	duration = is_connac2(phy->dev) ? 0 : MT76_CONNAC_SCAN_CHANNEL_TIME;
 	/* increase channel time for passive scan */
 	if (!sreq->n_ssids)
-- 
2.55.0


