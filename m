Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130D7C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Oct 2022 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vX2oWPlNmqiaYD2VduM5OwUs4h3HdZ+zfY5ddAJeqt0=; b=QImnbuZZU5Y4qSvggnLMUquuPl
	tDG1GDUaQfVpLapzQ/LR+REaz0VnpjgI+rKg8Vvj1vDojuPpFkcDVBUbulGSeg9+SOiwqfi2L3wCR
	3dgqQL7CDWaMJxwP5wLtVWmiUMmH8qjx6XN7rUytjJNiMddZTbkH365f12Efy43cTLaL5IM/tKBIC
	p5IRJ8CbYXB2vUUCtTALfqXeXf1eOQBa3Y/u5BsBZikBseDQh0SHApNw4nG47Q2eAC3QwFfVY3w5b
	8dJ8m6mUwnsMrkSAM47fwFVEYijykqCI49iJKrHsNYtQdqJHt/pxU0TYDPBx1lSQWz/Amz4rvHrzk
	p7/HZQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oheVz-00GGha-3z; Sun, 09 Oct 2022 22:11:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oheVo-00GGem-DG; Sun, 09 Oct 2022 22:11:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EEF3560CBB;
	Sun,  9 Oct 2022 22:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5177BC433C1;
	Sun,  9 Oct 2022 22:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665353467;
	bh=Ltf1k6nZbq/4KQz6xsOUMvd7H8pKv9s2/hbk21ToTPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFGwaHuiCdUPufA3+pk12DdJJdaFnnMX2FMzvPLv9D+OZbj7Gj9/PgF8XGvcTKsCQ
	 sEG3j6JYWYn8IIZDsW1vbqxjRHG0a5TuL/u5z+BWBE7Kf3mBpJk4vucfpKaI+iDRpU
	 ayK6uZRIhmbIrJZN07UEcGw5ZpoMgVBfU8qR2yWISYX8rlOOAfzx5EX+CxiEM/s4Cm
	 wrTZYyCkSVn21/1UuejTYmZ4bQSo6O/jpAHZU7fK63y288tXcRFmNXVRwzrEglg/KF
	 EPmzpuUVw+k0ZUZppq6GAfE/jkuqWJKCFB8dYhWhdY2FgDdcmYjccQyxRpEWlPyhzY
	 2yyoRU7nniGkQ==
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
	deren.wu@mediatek.com,
	johannes.berg@intel.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.0 41/77] wifi: mt76: mt7921: reset msta->airtime_ac while clearing up hw value
Date: Sun,  9 Oct 2022 18:07:18 -0400
Message-Id: <20221009220754.1214186-41-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009220754.1214186-1-sashal@kernel.org>
References: <20221009220754.1214186-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_151108_561702_41934D0C 
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
index 1438a9f8d1fd..33bd64fe5c74 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -752,6 +752,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
 
 	mt7921_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
 
-- 
2.35.1


