Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808C606A31A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nt/mSV/5;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=c6ffjaSr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cJhLPFhreq0kby1+GoG6JYwvIcm4Ucp6yVaKB9f71aw=; b=Nt/mSV/5rtC0EY
	cm/P1Q+B+MMpj7MYZdZA52lu+sk4IuplbfvS8U3XGAV9LJ5Xe/83axIwlzWG+qV3yDzNpTtwdUp6c
	nmDN2LSGZ49NwTtKYNp1f6InGFteYY9OXT8vFmvMl/77t93SVEvkzvN84wDHPOdStGZg2vb4aO9Kt
	vvnhv8pch9Y+Kt5ZYxwSf4bVa6fZb/tA+tRuy85DFdBs3opMXqsGQi9W2H3DeMbqHQesp+A+t7tEH
	0ZqtP1G8b4b346fgHuCfWbohQBuTBzpHpHn/KhETLZQohayWL76r+zekodrzQQHgtXqKx8DUYs09q
	sLTsdmvySIt6oBcodsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnJM-00000005hEQ-08cT;
	Tue, 27 Oct 2026 19:58:20 +0000
Received: from out-138.mta0.migadu.com ([2001:41d0:1004:224b::8a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnJJ-00000005hAv-39XY
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Oct 2026 19:58:19 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PHDFZP89OIILUvmxSLDL3cX7w3QXqZewfsLiygSrbx4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793131095; v=1; x=1793735895;
 b=c6ffjaSrrku/ZwOxEP2VJJhWd68heNIwr4ssENvh1wq5scB3Ku7liEcBZjEVEeqJVUthueer
 R/34iK0P1ukE275iZ5+6OeSl2S93GCfZ1PhmH32EjXQSJXsnuZYTuPGcCgrk/WCSV0L0H6swXFo
 cYdGwKEiwdhq6WIjM96LQCs75pmv+/XD/C5p3rnb2BIDNc96Uhvk7wM2qVbkHjrsjsSYH40J1PN
 dPP1qcE0gxZ2HvyK8yRdrxxTptQZ/LtjYxb/dSjS5JJRjL976RzY+jhWrLNSTroFlpuVGuU1gLX
 DuqP7fLjnHjUr2hU8sFBCVo4G+8hnHQSt/tg0cbkA6/LA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id dd736aeec128e6c6;
	Tue, 27 Oct 2026 19:58:14 +0000
X-Mizu-Trace-ID: dd736aeec128e6c6
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alex Gavin <a_gavin@icloud.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless 3/4] wifi: mt76: mt792x: pass monitors to the driver as real vifs
Date: Tue, 27 Oct 2026 12:58:02 -0700
Message-ID: <20261027195803.711995-4-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027195803.711995-1-lucid_duck@justthetip.ca>
References: <20261027195803.711995-1-lucid_duck@justthetip.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125817_984827_2574367D 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mark Anthony Agarro <markanthonyagarro@gmail.com>

An active monitor on mt7921, and on mt7925 other than MT7927, never
gets a channel: its request goes to the shared virtual monitor, which
it does not use.

Pass every mt792x monitor to the driver as its own vif, as MT7927
already does. Commit 55e95ce469d0 ("wifi: mt76: mt792x: improve monitor
interface handling") did this and was reverted because capture stopped.
Commit a7d35545c2ce ("wifi: mt76: mt7921: assert sniffer on chanctx
change") and the previous two commits arm the sniffer it was missing.

Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index dbea3c2e626f..dcb244a3f8ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -835,10 +835,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
 	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
-	if (is_mt7927(&dev->mt76))
-		ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
-	else
-		ieee80211_hw_set(hw, WANT_MONITOR_VIF);
+	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
 	ieee80211_hw_set(hw, SUPPORTS_PS);
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
-- 
2.56.0


