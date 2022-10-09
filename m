Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C13C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Oct 2022 22:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Apy39xOBNOKvZBMvGTZiif4O+hjOB3HF+1RUkTw7cpA=; b=4WAbjbZ8oxnVvVEc6fvhEV/23v
	E6v63lsfJhrsHsKw9jHYaRXeRIwl0KdE7rSgqtsJsLb54RMn4OkjIw9a3/SKPtLt5coeVl+7mmiwY
	xxWBMG3CKFLQLFw2hcBxoIP3+cmi2GdnIELH4/HHWHax6j7PheL8slBwtu51EVLo29JFoq4Qe1llK
	wWTRrhW+Hjm8WTg1qasyRlTYzlrUv9192hkuWiycWC1GikfIVgmq9LSbB3LDy25EVcYVInYL9+wfO
	G9W0rWegH5V6iDkSZyCCdbmKDKlTSeOtXnvH1XfY53UEViL3ttgsidc6P2e+E+P+Q9h+Lf4MHv4xN
	XJJmSllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohecA-00GIP4-76; Sun, 09 Oct 2022 22:17:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohebu-00GIIX-8z; Sun, 09 Oct 2022 22:17:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0D8760C99;
	Sun,  9 Oct 2022 22:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F08C433C1;
	Sun,  9 Oct 2022 22:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665353845;
	bh=K7t5p5OeCI3fv+lAN/nupgl7vlsdFfIYzFCzulu1peI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OogdH78sPZllc8BQAuTr2aXcwjFZCYFC0Atg9VciEEu5m6DhfqR9sB3aGSup61jBN
	 yLZ2mhjzlsk+zpaeusDl+oPPC9fnpMgMje1YBsKwoKV4mhoQkCliguPdg9w/BY52pz
	 7G4s94p78bae6kzP5oHS5RWgOa7J/VKgbO1Z4P+3qSX8vSko2aYmvsH/+McICLHjsQ
	 SSp46gsNpYfcw9txPFqYX3XCDbqKppMCT0nZJIvrZjdZgge0OyACXM3slry8GiQz+f
	 106qrbiqvCgX4KU4iwFYBxTbgoz3LHoZDOVFMXl5Hanw75DMRxY+cJRNtjh3ZgILBb
	 dzjHzCmaz/amA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	johannes.berg@intel.com,
	deren.wu@mediatek.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.19 38/73] wifi: mt76: mt7921: reset msta->airtime_ac while clearing up hw value
Date: Sun,  9 Oct 2022 18:14:16 -0400
Message-Id: <20221009221453.1216158-38-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009221453.1216158-1-sashal@kernel.org>
References: <20221009221453.1216158-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_151726_401961_368B95A3 
X-CRM114-Status: GOOD (  11.67  )
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

From: Sean Wang <sean.wang@mediatek.com>

[ Upstream commit 1bf66dc31032ff5292f4d5b76436653f269fcfbd ]

We should reset mstat->airtime_ac along with clear up the entries in the
hardware WLAN table for the Rx and Rx accumulative airtime. Otherwsie, the
value msta->airtime_ac - [tx, rx]_last may be a negative and that is not
the actual airtime the device took in the last run.

Reported-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index d3f310877248..05c654c50d57 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -738,6 +738,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
 
 	mt7921_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
 
-- 
2.35.1


