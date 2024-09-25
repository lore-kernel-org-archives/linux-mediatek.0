Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F513C369D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybNwTs+ssYc5Tr4V968nCw3iJyQ5siWelTcxDkie7AI=; b=oAySJJrr7qOL20ddnm/XLjWtB5
	K8hd2Zf6E2YeN7qHHxfIhA5oG0lBHhNzq7Q6FT/Dz9PZ1NervrtnleOO0tXyyCNQ407cu9kik/akt
	mMvEw/VhLptqPS1I5oKVkE2Q8uw3icEbRYUFIYm4KhrIjiETh50ahSOjWi4GCIfL7hsSxNXGlUSg2
	URc2/1pAfnzW41COCZTZM/Bi1JqxfeTse6Wa9nJORt0YMuN+5Ar3W7HWxlF9nmR0PwZWlV1uHRarY
	rvYMV5RvY8cQU48aQsy1FSGz22QWpPad3/6tn1JGSqh9pD9NuMlzeV58YaPJ4RKFDdSa/J7wc/9CC
	4ycwenXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQpz-000000053HK-2iTH;
	Wed, 25 Sep 2024 12:09:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQhq-000000050On-0hbp;
	Wed, 25 Sep 2024 12:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 504DBA44057;
	Wed, 25 Sep 2024 12:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B63C4CEC3;
	Wed, 25 Sep 2024 12:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265677;
	bh=VEIQZWdTQ9dg2khM6hUR5xSlsXQRX0LggRkXcpNBBSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZR4JTJ5FiF4QC2JXi3mYMjKw/KKJ8OUpyCKX3vMEC2kQ9qxtbeTRNz1AAHujDU7b1
	 /xGw5Az43uEj27u/FraajUFuv8G+F9nGg9LQc8I6QEQA35cikjqvZVXJdJhYjaJRpV
	 23Z7oE4na77TGrtCt08LFKeossUUbE/ZptNoWEh2yAPlGxxXHFf3ZD/V6qXAKePH4U
	 ly+Kft5qXIK35ojB2YQmMy4/Gm/F+EFcY5V4YCAaYTNNGOs05HRCm6CU38/o2Wq84k
	 +Oe/KlwBcfb9eoIo6UGvPOXaw4u4qS9Vpx+MrQlIolwQsDg8utRBx7Bu6SVqSJAX1z
	 omNkaW+YekEBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	allen.ye@mediatek.com,
	yunchuan@nfschina.com,
	shayne.chen@mediatek.com,
	henry.yen@mediatek.com,
	Bo.Jiao@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 068/197] wifi: mt76: mt7915: hold dev->mt76.mutex while disabling tx worker
Date: Wed, 25 Sep 2024 07:51:27 -0400
Message-ID: <20240925115823.1303019-68-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_050118_315578_40B2E8CE 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 8f7152f10cb434f954aeff85ca1be9cd4d01912b ]

Prevent racing against other functions disabling the same worker

Link: https://patch.msgid.link/20240827093011.18621-17-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 8008ce3fa6c7e..387d47e9fcd38 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1537,12 +1537,14 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		set_bit(MT76_RESET, &phy2->mt76->state);
 		cancel_delayed_work_sync(&phy2->mt76->mac_work);
 	}
+
+	mutex_lock(&dev->mt76.mutex);
+
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	mt76_for_each_q_rx(&dev->mt76, i)
 		napi_disable(&dev->mt76.napi[i]);
 	napi_disable(&dev->mt76.tx_napi);
 
-	mutex_lock(&dev->mt76.mutex);
 
 	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
 		mtk_wed_device_stop(&dev->mt76.mmio.wed);
-- 
2.43.0


