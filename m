Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41805C47095
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 16:13:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C4FF61407
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 16:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C4FF61407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkjbBHgW4qH+qmvSpsZeol68PeR7YsxNu/X8Q6dHCvk=; b=HUDuZ2Vi7q+tyQ
	Yt/W7Pv3UycwOvm04+SXL3yzVxRFYdlMP1tj/0eeTZyVCYcaUSNNf/uHfVDstRr0dTu8f1YLVSRct
	0rxrC7ZhGP1JhJ0hws0NYp+4yJLgtiRwfMYIP/ZSOo7V1Nvi4x/SEeBWFv+J5HCZbz9nG+Btx0kw2
	QYV4pZ1fAGR5O+hcKekwez2Eg5WOqB3n9VLOvXWu9gREQw2FaUtZB0bQCA0PFwop4RD+0HBNGKwVs
	15e7FWHrguNhltnMa/I277OwQf8788YnUn8V32NETWqwOL/og/hxk851AXuMG1+10dT7jo3cOH3e6
	qBHmFeL6jY0LUeXJUTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqHrv-004OBi-1c; Mon, 07 Jun 2021 16:12:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqHrc-004O49-Vz; Mon, 07 Jun 2021 16:12:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1939613C0;
 Mon,  7 Jun 2021 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082352;
 bh=Vspvsrwq+HMh5zo2lywXb+v0OGmxGRWtwUajJD+vy9k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZdwzqTAO3u8S/nTVKdhhk10WqUTx/QrYG8JSZ7LCmf8yANK3iN/jzHgL861Tpiv4D
 ObBv+i079+yoQ3a2l60E5/3Vt/fNm7GJunLb9GjyR60cHHbVzlUsxAA+EtQlINm3n4
 swtYPBmCVcJYuQefpEy/6Cs3862b50Lq/jzdLpxuiurqTyJueL9Arj9dKxrNljArfb
 tbKZloPG+G7GhY1PIoR4rU/E8FLs0FPrcPS4STEU+VRt8FhrR/rUw9SoXYMl79bjd1
 SOJc2622UoTBDNE0wFwGIOoskG09woeUWlWL5HKdj+DO9D35XoRTJT2ajpDHjtI7wb
 DJuaNPSMSUsow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 13/49] mt76: mt7921: fix max aggregation
 subframes setting
Date: Mon,  7 Jun 2021 12:11:39 -0400
Message-Id: <20210607161215.3583176-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607161215.3583176-1-sashal@kernel.org>
References: <20210607161215.3583176-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_091233_065794_56FF8421 
X-CRM114-Status: UNSURE (   9.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 94bb18b03d43f32e9440e8e350b7f533137c40f6 ]

The hardware can only handle 64 subframes in rx direction and 128 for tx.
Improves throughput with APs that can handle more than that

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210507100211.15709-2-nbd@nbd.name
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 89a13b4a74a4..c0001e38fcce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -74,8 +74,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	struct wiphy *wiphy = hw->wiphy;
 
 	hw->queues = 4;
-	hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF;
-	hw->max_tx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF;
+	hw->max_rx_aggregation_subframes = 64;
+	hw->max_tx_aggregation_subframes = 128;
 
 	phy->slottime = 9;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
