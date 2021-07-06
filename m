Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A054C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:38:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0931861D8B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0931861D8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQXog+HRW0ck4jwMwGpLiZIx5m2B9wJZrBeHOtwCsHE=; b=ywT6U8FvvANUew
	diPfdujj0y+4boEwWr/0oBFHorHZDeEhS3eCvPfNOgs+yQzYX0W2I4h9C6bCTCKsgKGnfHcFKYuB5
	tFztb+NPzLsA4YTINzyizdZtwaLMrE6p7l8tTBIiLh1QTipwpTb6JUer78bDxyzs+Q+yUHlhoSQOV
	S0BVdYhsu1Ev+6s371hl4fG4MRMi+/EEX24cQaek2+9IAEI9901bHcMZU1WKLWiPNQ9dUf7iqyady
	Q9xmVY/g9SQlY1fNE+PQZdOdGbCqv7bQNmuBo+m0xo24ICaWsxZLenOIK8GqgneWNsrKRrhPa5tq1
	z3PCZfhh2TmOuhAL0NKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jOi-00BRK7-VU; Tue, 06 Jul 2021 11:37:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j87-00BGr5-O0; Tue, 06 Jul 2021 11:20:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85C9E61D9E;
 Tue,  6 Jul 2021 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570443;
 bh=2jATZ63rO3C43mSyubCECRk6B6rF9AcE4slxIXNEiWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MvjHEY+KLUznkvGm6NfRTnuh7X1jxePBNbIuXFBNG4KXfhjSrnS48Y7jRxw2q/Ogf
 YNkVnLoMoEE/eIJ5/AGGdD5176RtqdqHRuGlt+YtyxK/RmKqk2owXv4UyoI3ffHXzQ
 RVQkNkHFWdM4EqNFrXYa5kl72g+pdTA8c/BtbdbjvZnWKssuiASdUgxB9ht3MLRh5y
 z+S5huHAjIF2O/zD3x1Br67xLo9+HiZ79GdnIdM7WjpvorGyzGuoDdLUVn3hdtL6Uf
 2TGji/e1eBzh8Qvf+0/gcpbrSgMFYmCs6vG4tjyGyCbiQdhwzCl0I1J+bdK1FTiSTx
 QRNWEFdkZd1UA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 102/160] mt76: dma: use ieee80211_tx_status_ext
 to free packets when tx fails
Date: Tue,  6 Jul 2021 07:17:28 -0400
Message-Id: <20210706111827.2060499-102-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_042043_838107_AF7157B5 
X-CRM114-Status: GOOD (  10.97  )
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

[ Upstream commit 94e4f5794627a80ce036c35b32a9900daeb31be3 ]

Fixes AQL issues on full queues, especially with 802.3 encap offload

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 7196fa9047e6..87ee1b305a93 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -340,6 +340,9 @@ mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 		      struct sk_buff *skb, struct mt76_wcid *wcid,
 		      struct ieee80211_sta *sta)
 {
+	struct ieee80211_tx_status status = {
+		.sta = sta,
+	};
 	struct mt76_tx_info tx_info = {
 		.skb = skb,
 	};
@@ -351,11 +354,9 @@ mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 	u8 *txwi;
 
 	t = mt76_get_txwi(dev);
-	if (!t) {
-		hw = mt76_tx_status_get_hw(dev, skb);
-		ieee80211_free_txskb(hw, skb);
-		return -ENOMEM;
-	}
+	if (!t)
+		goto free_skb;
+
 	txwi = mt76_get_txwi_ptr(dev, t);
 
 	skb->prev = skb->next = NULL;
@@ -418,8 +419,13 @@ mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 	}
 #endif
 
-	dev_kfree_skb(tx_info.skb);
 	mt76_put_txwi(dev, t);
+
+free_skb:
+	status.skb = tx_info.skb;
+	hw = mt76_tx_status_get_hw(dev, tx_info.skb);
+	ieee80211_tx_status_ext(hw, &status);
+
 	return ret;
 }
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
