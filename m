Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A19BC3ABB6
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 May 2025 00:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzia+S1ES6wS56JBcdjpLnraB+Zr+k9Iw6veKO9RkyM=; b=C2Z2nwq7tuTZlAHTKDh/1D4cJ8
	Kb//CcSt/8txQQWZcO+ORFa8NR9UzSdT64D/fUx2oMhS6CSpSRij40OwsKyv+3WLk1Nr7DsTran9I
	SZfNuPrxXArUMOkOXuszT5zhNYXbNhySwot2Ady6V/nxnq1PRvetNGrhTjMwLu2h2cC3dtuvbASH2
	Ty3nuEvKb6bVXZeCNLfS6vs0e9qpXlO48gcoz4NNqWup58oxm0Fp7sKBdFHh1niVG0BQnf8pPhFWY
	EwVISZxP86xkvbNZOUEbZLxBIN+oDob7m01vCZ3f5o3xcoOKTFQdbrQeZHWX5IVxyNqzlAM7OL3SL
	5J+f5LWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6ZN-00000009OFI-37lc;
	Tue, 06 May 2025 00:54:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4V3-00000008pew-3RmD;
	Mon, 05 May 2025 22:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA48629C1;
	Mon,  5 May 2025 22:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDD3C4CEE4;
	Mon,  5 May 2025 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484885;
	bh=0YrSew3NfA+7HZmbdS+TzG3l2EOfWNfGj5GGAJeLDVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yya8OAkwl3EW44tJxtE20ayqMzYvUs1rpyk7Ejzava9LPqZJol8m/pqF0SugDXCS7
	 OKG1hvauZeAcy75PPyEcQl32HYEwbwevofUb62TrNBjUfgy/1N62zxg/P5JToC8Cle
	 Gp/h+AUmhzDvgU2Um3Se2Qg0oNGuURp9jYxgMWYsv58V9mNR6q3/ODbKYiZutqAVMH
	 YUh5kA7siw9mCsOwMtecIUgqCTZVKel/9Yf3zMz4t8d7+fw+L9+0vcTXsneUD3HoHa
	 aY2P+bqiYzY2HZaG0TxVrvO63i+O4PyQXVHL7MTT7LNzltSIsTsOp9OgYXJyPF3OeU
	 m+KPrUyy78pUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rex Lu <rex.lu@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	shayne.chen@mediatek.com,
	razvan.grigore@vampirebyte.ro,
	wiagn233@outlook.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 061/486] wifi: mt76: mt7996: fix SER reset trigger on WED reset
Date: Mon,  5 May 2025 18:32:17 -0400
Message-Id: <20250505223922.2682012-61-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
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

From: Rex Lu <rex.lu@mediatek.com>

[ Upstream commit 8d38abdf6c182225c5c0a81451fa51b7b36a635d ]

The firmware needs a specific trigger when WED is being reset due to an
ethernet reset condition. This helps prevent further L1 SER failure.

Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Link: https://patch.msgid.link/20250311103646.43346-2-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h  | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 43468bcaffc6d..a75e1c9435bb0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -908,7 +908,8 @@ enum {
 	UNI_CMD_SER_SET_RECOVER_L3_TX_DISABLE,
 	UNI_CMD_SER_SET_RECOVER_L3_BF,
 	UNI_CMD_SER_SET_RECOVER_L4_MDP,
-	UNI_CMD_SER_SET_RECOVER_FULL,
+	UNI_CMD_SER_SET_RECOVER_FROM_ETH,
+	UNI_CMD_SER_SET_RECOVER_FULL = 8,
 	UNI_CMD_SER_SET_SYSTEM_ASSERT,
 	/* action */
 	UNI_CMD_SER_ENABLE = 1,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 442f72450352b..b6209ed1cfe01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -281,7 +281,7 @@ static int mt7996_mmio_wed_reset(struct mtk_wed_device *wed)
 	if (test_and_set_bit(MT76_STATE_WED_RESET, &mphy->state))
 		return -EBUSY;
 
-	ret = mt7996_mcu_set_ser(dev, UNI_CMD_SER_TRIGGER, UNI_CMD_SER_SET_RECOVER_L1,
+	ret = mt7996_mcu_set_ser(dev, UNI_CMD_SER_TRIGGER, UNI_CMD_SER_SET_RECOVER_FROM_ETH,
 				 mphy->band_idx);
 	if (ret)
 		goto out;
-- 
2.39.5


