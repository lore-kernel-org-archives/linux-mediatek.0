Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6F7C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Oct 2022 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4uKGLVoIsnIr2GGIUA54OTHEodxsnC2qk/wxdx/2ak=; b=4mdkP5tHD6IM70dPjnN7PEtH/o
	jymWNLJtySoR/vVnwxkOJu6zRwL+8aEEPJASXHpqcJf/f/3mBfREmvLZfC6waKaL5R2fIjcS+0Bo4
	+uDWarsdRS8iNDu8LwT+JwMQ2RrpeR3i4KYPLDYlyXqAX3QlF5VyfSNvNDLa+WHQqzEPDDpgoU+yK
	qykeQHLKi1yK9HYHhJO0ZPHI/ZxJgPcXfWDfh3ZYKyNQd++/j2mulMY2lsKIQ1FXTk8yRLYjH5hPj
	rdU3TJSvt8gfs06HoaszyS6n1rvv3s3gLeTMJEMAaPxfIXFUuE8kXh1xeMNID7ws7qqfDyHTd/ZHR
	ZayxoROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oheew-00GJTj-5c; Sun, 09 Oct 2022 22:20:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oheel-00GJQ3-7S; Sun, 09 Oct 2022 22:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E4E2FB80DD2;
	Sun,  9 Oct 2022 22:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74C4C433C1;
	Sun,  9 Oct 2022 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665354020;
	bh=5wnxw6C7mEaBmctzT+ji9b0d4mmzMnevfMMXcjoG3Xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bmmg8Pa08vDOskyMYO+KQDnzqVb6fqcYzsF8TB9TIS0i5IRoZMhCj8+lRnholcWro
	 ppmNF3y4uRAAeYesgNkg7L9jMnLQdnuEMHd2p2Co+ahKdHrlh115+fH6xxB6wNkSGv
	 CwzWESI4HJ/0NL9JpZJO0rQ9fylfgHCR6J9wQf/2QN4bqmU0XXy403Wrqmmptdvuwr
	 eWmxGF3z3NfJksqSIbImjW2PwqVpKsVreomeBK+JP31Wzn+LjQjYF7oeaoNhHzaJuo
	 f7DaxqXrOK+o4Vkl3jQFDvFYTJRGlCFf2gd4nj9q1R46wHhXzs/5ZucPJAFI5V30VY
	 9KDPe1n/+WJwQ==
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
Subject: [PATCH AUTOSEL 5.15 23/46] wifi: mt76: mt7921: reset msta->airtime_ac while clearing up hw value
Date: Sun,  9 Oct 2022 18:18:48 -0400
Message-Id: <20221009221912.1217372-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009221912.1217372-1-sashal@kernel.org>
References: <20221009221912.1217372-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_152023_434189_3826E452 
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
index 6cb65391427f..7b48df301079 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -627,6 +627,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
 
 	mt7921_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
 
-- 
2.35.1


