Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791CD606A330
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M5kKnipy;
	dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.a=rsa-sha256 header.s=uberspace header.b=KA61qEUH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=13Im6NjMRVUnMmBZBKdEmfUNzbWwvMI0PbIOHyXXUHA=; b=M5kKnipyZMJ6Q3LjS59pwJHfi5
	czgoARlPp3ycGwYR5sPnuky2j9A268tzoa6DgDuBrjC0bpwyiI4yr+gdH5V1CLPzb7yLnBAZ9bQBf
	AfvZaExHZwvKA4sAUCgn+PQLreP+wMngOX/uMx9MbEjAkX2HZbJiwGcsvoRAzhGoxnxq2TyUTMoyS
	6joxzcttSbhuFVPg5BJA6yBmK0WkrS456BJlHLIOpRETH/fnWSIESTFFLWit2TPf3Vx2zAWifTOqo
	C7kb5sjvyN0q4OYWQxqHFHw5mSA0gDGbPwE9or3olFKK/0HHZ7pQehXMXCDRcbAUALgkZiUTLL9Po
	Gzs5dvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX19e-0000000HV4u-1EUY;
	Fri, 27 Nov 2026 18:58:42 +0000
Received: from mailgate01.uberspace.is ([2001:1a50:11:0:c83f:a8ff:fea6:c8da])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX19a-0000000HUxQ-00Xm
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 18:58:40 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 4561E61B04
	for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 19:58:27 +0100 (CET)
Received: (qmail 18833 invoked by uid 988); 27 Nov 2026 18:58:27 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Fri, 27 Nov 2026 19:58:26 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76 1/2] wifi: mt76: mt7603: provide timeout trigger to mt7603_watchdog_check
Date: Fri, 27 Nov 2026 19:58:14 +0100
Message-ID: <20261127185819.1340117-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=7bfiLualbveH/vmJMKNmgItfJglWVbEZKv1+aO2WROo=;
	b=KA61qEUHitWr/v+uWQ6eotK/cLd+8/jwqFNuAn97PzcFfuXoGmU2u1jnQDcJ7sePhaNaLooEyr
	CtcJLYyPxPXPDtQksJNmI1pbK90tZ+5gyOxdxu9Y15w3ivk/TmLFacwarM9uvOQjtk+n3Xasm09j
	oj2awwLiu5iljvfhHUmOU00iCKGOjNV4lnN1ZsmIHckOOiWAlgyWSlz+UJMYJ3my74E+73E4APiG
	I9Vl4li5+lLsqngBvYDKf4m1gj+dikP22dSRkn8ypX0cva2gVXiR0xmzho/pWXdEEFaznVN5aIvi
	bNt9cpEO6KCuFt7fNX7UdsqRP0+TXQabsPtEOcO6c/QxTLpbgb7vaKqrJXpaP4bZTHX3aXPNYqWQ
	HvMgxBru+tCSXMrRadFqxADB1XcfA/BEUbV/a5EM1RbzZB/+nBAzocFWvh/n6vtWu7GSVY/x9Bmi
	OjFVaPEmbQEOG3wSVsFTvR1BT68dtn/hlQWi4eHCGJTgIdcMGl47RMM9o5AjqS2aAsj1znJjFatG
	m46eSyU6FbTNNubLXNiW31Is0SuMaJ6FYXyR4rAd2IgxYsA3yT4AqWKteR5tTmh4L6Gq/pp4gHJh
	86ByS/lEFqupKJxnrOwlugymZIo0VboDITtIXJyasfsB2FNfne+h+7zsP8vatQDiHbe3IC/XFZkS
	8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_105838_470948_0820CA7A 
X-CRM114-Status: UNSURE (   9.31  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Supply the timeout trigger threshold value to mt7603_watchdog_check.

This is required in order to define individual threshold values for
reset types.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 5940306ed3ce2..634bb67b57d52 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -1602,6 +1602,7 @@ static bool mt7603_rx_pse_busy(struct mt7603_dev *dev)
 static bool
 mt7603_watchdog_check(struct mt7603_dev *dev, u8 *counter,
 		      enum mt7603_reset_cause cause,
+		      u8 counter_timeout,
 		      bool (*check)(struct mt7603_dev *dev))
 {
 	if (dev->reset_test == cause + 1) {
@@ -1610,7 +1611,7 @@ mt7603_watchdog_check(struct mt7603_dev *dev, u8 *counter,
 	}
 
 	if (check) {
-		if (!check(dev) && *counter < MT7603_WATCHDOG_TIMEOUT) {
+		if (!check(dev) && *counter < counter_timeout) {
 			*counter = 0;
 			return false;
 		}
@@ -1618,7 +1619,7 @@ mt7603_watchdog_check(struct mt7603_dev *dev, u8 *counter,
 		(*counter)++;
 	}
 
-	if (*counter < MT7603_WATCHDOG_TIMEOUT)
+	if (*counter < counter_timeout)
 		return false;
 trigger:
 	dev->cur_reset_cause = cause;
@@ -1897,21 +1898,27 @@ void mt7603_mac_work(struct work_struct *work)
 
 	if (mt7603_watchdog_check(dev, &dev->rx_pse_check,
 				  RESET_CAUSE_RX_PSE_BUSY,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_rx_pse_busy) ||
 	    mt7603_watchdog_check(dev, &dev->beacon_check,
 				  RESET_CAUSE_BEACON_STUCK,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  NULL) ||
 	    mt7603_watchdog_check(dev, &dev->tx_hang_check,
 				  RESET_CAUSE_TX_HANG,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_tx_hang) ||
 	    mt7603_watchdog_check(dev, &dev->tx_dma_check,
 				  RESET_CAUSE_TX_BUSY,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_tx_dma_busy) ||
 	    mt7603_watchdog_check(dev, &dev->rx_dma_check,
 				  RESET_CAUSE_RX_BUSY,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_rx_dma_busy) ||
 	    mt7603_watchdog_check(dev, &dev->mcu_hang,
 				  RESET_CAUSE_MCU_HANG,
+				  MT7603_WATCHDOG_TIMEOUT,
 				  NULL) ||
 	    dev->failed_pse_reset_attempts) {
 		dev->beacon_check = 0;
-- 
2.53.0


