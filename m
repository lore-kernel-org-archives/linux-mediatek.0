Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3642C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QAkjfhyoIPR6Vb+L3NfYO8tmTHl6uWWMMzTGSmrHCoE=; b=rx9+3bRa3xzCCYHvmzOnpdbFxF
	Y2k0ZY4U+wToc4/YaW3JeUn0yoFr11o8flhT+BVTejv9BAKmsmYOjdGKxBTlQmYJbqvU8fVbOnWyj
	mEB1ZPnA/N9kRVfyuPYnThZslam1vUkER5JCZS/tt06fobPJBFsys6po4biEM/ZbuTyO7ZWiEqHQc
	0eGd0+2hrQuk8vYpacJbpewtiPlZx6ihR79dFL3nmVr8RZJufsuyEdJWvYuI3k7ah1zcEHUnFXOcl
	ZzcUTtKsC28d3Lw9OHFczbXU9I0dXOyd4qZqZMn7at9oK4Z9yBAD1eXpfm+oA4Q/Ro/Lm9G2j6TW4
	M6acqaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1SWG-008vbW-2W;
	Fri, 10 Nov 2023 14:30:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1SWE-008vaF-0a;
	Fri, 10 Nov 2023 14:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75919619F8;
	Fri, 10 Nov 2023 14:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA8BC433C7;
	Fri, 10 Nov 2023 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699626596;
	bh=nLlP5zYhWe9W91LWYdUOANl7JYKJxORxVdmkjcwH0Fs=;
	h=From:To:Cc:Subject:Date:From;
	b=qxa3WiwlZU/JYQmPYD4XnuPogZqrblGFEefjgDc/LBLt0n3SAtxDGBwMrw5zi5QeQ
	 /ze1SQmOpav4e+VBgWN97fcnudCWzsL6zaqzYT+SWuUF3Q0ba7KXIhANddvQkKm2VA
	 lj9rGCIVCEGuIej00dRE1LiXkyc4f5OsOeCVM44z1tUXAIVM7laGJOOrDdsnUj8iFD
	 NvjlJt1XfuXm52Zu8yUdBbTZdg8xObKvFgVqPUdLyqZhv3GCTmZxIwQPRp4nXi8rfJ
	 e3KAEvn6G3hX06UVnBv1maxNmFjqvVRrDhSuCPB0jNeNSdMzsDBkm8luHnTiyqWtOj
	 ZK8D1eHHtqdLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Money Wang <Money.Wang@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Bo Jiao <bo.jiao@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7996: fix mt7996_mcu_all_sta_info_event struct packing
Date: Fri, 10 Nov 2023 15:29:30 +0100
Message-Id: <20231110142948.3841137-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_062958_265295_C6BF0B2D 
X-CRM114-Status: GOOD (  10.24  )
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

From: Arnd Bergmann <arnd@arndb.de>

The internal struct and union inside mt7996_mcu_all_sta_info_event is
marked as being aligned, which conflicts with it being unaligned
within that structure:

drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:165:2: error: field  within 'struct mt7996_mcu_all_sta_info_event' is less aligned than 'union mt7996_mcu_all_sta_info_event::(anonymous at ../drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:165:2)' and is usually due to 'struct mt7996_mcu_all_sta_info_event' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]

Mark all three as being packed as well to ensure byte packing for
the entire thing.

Fixes: adde3eed4a75 ("wifi: mt76: mt7996: Add mcu commands for getting sta tx statistic")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index a88f6af323da..e20c38f17827 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -168,15 +168,15 @@ struct mt7996_mcu_all_sta_info_event {
 			u8 rsv[2];
 			__le32 tx_bytes[IEEE80211_NUM_ACS];
 			__le32 rx_bytes[IEEE80211_NUM_ACS];
-		} adm_stat[0];
+		} adm_stat[0] __packed;
 
 		struct {
 			__le16 wlan_idx;
 			u8 rsv[2];
 			__le32 tx_msdu_cnt;
 			__le32 rx_msdu_cnt;
-		} msdu_cnt[0];
-	};
+		} msdu_cnt[0] __packed;
+	} __packed;
 } __packed;
 
 enum mt7996_chan_mib_offs {
-- 
2.39.2


