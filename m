Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BFCC43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C3DC20675
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QkT9Yjdh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x/ttmdlj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C3DC20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+WrebN4zIyUkWnQ2pBY6P780/dnyHaXG8swQlcn/d4=; b=QkT9YjdhK3j3+8
	Jeqo26TaFZsWOu25E6iiwCoxQqV8iUupt//QLmm9PboHPAepm1lTda6F/PthA8UKKar5nSczzYfi8
	CDyU5A3HP+XF6z5iTQ9rn8hsYrzDyfkJoWPXb0CfouooKzw2v3U9lNCnWO/QkDs+lkrHQiQMdpVAn
	b5MPAmff9n58mZtNfgBPiQX+cLw12zvK9pWE52vVDPirXciGYg58vl/K0AHKcMltyLI1tMfIB6lXf
	9TfRw6Aq8ftZG9GwzHZAUo4DKB3fEPeDOhT4VLzZbOfdFTLALfO6vSJu4TLqwW4vrWzSDcttDBl18
	G/omQ0a5XxkWUgHXdi7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK4R2-0000kg-SO; Thu, 02 Apr 2020 18:19:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK4Qz-0000hN-LT
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 18:19:23 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D01B5215A4;
 Thu,  2 Apr 2020 18:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585851561;
 bh=KjppzVDV4ZXKFstxVUXkmnuy1kl9/6VwhwlFAYkoy2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x/ttmdljUoAZUkbtMDs17Ix2SbfxyaUhD+wWOKz50/m0wkK8x4TvzCCcbS7lYGtTy
 3zm7D/QvuHTcB9A7TzUbyFOqqeW/lohkSgkaoyc7ktxsgVZaPaZMyVne3hDKiatlxg
 Wi/dl4qh+0/T2IO2BRPcF40ZXcWyqpcJf+qVmqQY=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 5/9] mt76: mt7615: move mt7615_mac_wtbl_addr in mac.h
Date: Thu,  2 Apr 2020 20:18:52 +0200
Message-Id: <e1da450929d881718cfbbad2ef5da94abea34dcb.1585851049.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585851049.git.lorenzo@kernel.org>
References: <cover.1585851049.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_111921_757179_B103B98F 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move mt7615_mac_wtbl_addr in mac.h and add inline qualifier in order to
be reused adding usb support to mt7615 driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 5 -----
 drivers/net/wireless/mediatek/mt76/mt7615/mac.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index f68fa82ef5b0..e6e5c02da4fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -721,11 +721,6 @@ void mt7615_txp_skb_unmap(struct mt76_dev *dev,
 		mt7615_txp_skb_unmap_hw(dev, &txp->hw);
 }
 
-static u32 mt7615_mac_wtbl_addr(struct mt7615_dev *dev, int wcid)
-{
-	return MT_WTBL_BASE(dev) + wcid * MT_WTBL_ENTRY_SIZE;
-}
-
 bool mt7615_mac_wtbl_update(struct mt7615_dev *dev, int idx, u32 mask)
 {
 	mt76_rmw(dev, MT_WTBL_UPDATE, MT_WTBL_UPDATE_WLAN_IDX,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index 422a140fd812..2c368b99cc0c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -407,4 +407,9 @@ mt7615_txwi_to_txp(struct mt76_dev *dev, struct mt76_txwi_cache *t)
 	return (struct mt7615_txp_common *)(txwi + MT_TXD_SIZE);
 }
 
+static inline u32 mt7615_mac_wtbl_addr(struct mt7615_dev *dev, int wcid)
+{
+	return MT_WTBL_BASE(dev) + wcid * MT_WTBL_ENTRY_SIZE;
+}
+
 #endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
