Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E105ACFD314
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Dec 2025 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=56jr22NUXbDbudb9rLfN/cHmoGL3jIzNguY1NRuWnaU=; b=cTS+rQxsfmWK0DjDwZnknajcHq
	iqCX2MevdVSL5QnKrjaIIV44teexI//E5W+sb/yhRRkxX2lg3igC99vaEh4+48qfhpcZZYk2nkXSE
	KcuIghEg4YzO6BBHCqwu/eSfCJ777YQwX1kmoAggWS55s2BBuLGDG2n99ktXf2ZoFSNO/xOCRZ1N7
	Gke8c8HwkMqIiJYUBlH+3b6p70w3bU3km2I9bcOz7iLaActncZ4zPJA34BOlyyUsqO+w2OboyKyDf
	jGBgIz9D/DdL1fU46+1kEDAcTm3avEn1EzjMOYYeTubVocqovvoSyoRnFoaw43FIXBCUwEKWNJbw3
	80qgTRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUipg-00000002KHa-0tAb;
	Sun, 14 Dec 2025 09:56:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUipc-00000002KH1-3Ptp;
	Sun, 14 Dec 2025 09:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 451EB40642;
	Sun, 14 Dec 2025 09:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B732C4CEF1;
	Sun, 14 Dec 2025 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765706157;
	bh=RJIBcQRuLuoNlPhpOTksAxpYrDzA6I7s1hgACVIci7g=;
	h=From:Date:Subject:To:Cc:From;
	b=Sy/FOe8iVA6Dzvy1X8G+7jrlk/OkGh8QXuXRFwpM0A/d/XwVRQN4nRO2duwyZgI50
	 USqGlPOQ2Y5ApW+3/sE02QUXs/irJDr99nHe9EsJAbcVUPCwA1ITNy1Xh6dt0/I0CS
	 BOoPo5xb0V4c73Ti2QeVYrGgqFDi2k1EOOYcpehJ843VNWJFsjmh0CL1wu8PqXl3dU
	 RuuVA5pPKjnCj+kYcwC7iHabc9lhVI0KvSNfF2nwOFsxLA9vn9nOUnnSf0k3d7FO/K
	 pEqrwKr7l/C51W2GluJIuuNnJ4GI8OU/DUJ2KCgtPpwxBYnmcMTlqvYowCwLF5/ofI
	 pp9+kmoMy5JmA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 14 Dec 2025 10:55:30 +0100
Subject: [PATCH mt76] wifi: mt76: mt7996: Reset ampdu_state state in case
 of failure in mt7996_tx_check_aggr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-mt7996-aggr-check-fix-v1-1-33a8b62ec0fc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAMBRAf0X32S2bMfMr8sBcc5PRJin5d8vjO
 XXOA5ECU4Q2eyDQxZF3n0DkGdhl8I6Qp8QgC1kJKRRupzamxsG5gHYhu+LMNzalNnWpZjNWClJ
 7BEr6/3b9+36Ms0i6ZwAAAA==
X-Change-ID: 20251214-mt7996-aggr-check-fix-8379634f9b54
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Money Wang <Money.Wang@mediatek.com>, 
 MeiChia Chiu <meichia.chiu@mediatek.com>
Cc: Howard Hsu <howard-yh.hsu@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_015600_881076_87639906 
X-CRM114-Status: UNSURE (   7.49  )
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

Reset the ampdu_state configured state if ieee80211_start_tx_ba_session
routine fails in mt7996_tx_check_aggr()

Fixes: 98686cd21624c ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 2560e2f46e89a4bc46e21d796fca80b7decefa5c..b265a96c3e925233d1c410a26315efe56bde73b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1269,8 +1269,9 @@ mt7996_tx_check_aggr(struct ieee80211_link_sta *link_sta,
 	if (unlikely(fc != (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_DATA)))
 		return;
 
-	if (!test_and_set_bit(tid, &wcid->ampdu_state))
-		ieee80211_start_tx_ba_session(link_sta->sta, tid, 0);
+	if (!test_and_set_bit(tid, &wcid->ampdu_state) &&
+	    ieee80211_start_tx_ba_session(link_sta->sta, tid, 0))
+		clear_bit(tid, &wcid->ampdu_state);
 }
 
 static void

---
base-commit: 53d1548612670aa8b5d89745116cc33d9d172863
change-id: 20251214-mt7996-aggr-check-fix-8379634f9b54

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


