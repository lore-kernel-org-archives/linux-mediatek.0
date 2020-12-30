Return-Path: <SRS0=HztP=GC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E4AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 14:58:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD1621D1B
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 14:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFD1621D1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XpKiW4Cq3+bjiv9ExFV65KjgBJfEHJqmLJ4YM3GSTQA=; b=esWe8YVUk7JPTEMIUYG/VoXnKl
	cjCYl/TY80l8aqUc0PaQkuw1m+eC/cNH7rnCwjnAUpVd8/I3Tb/8jUelCPLbCfdWPoWYe3cbJiM1H
	sJm1QXJw9pmuE+dmLLCiQtxCVkdOy2+eqT+R6byqm3bQt73nr2GbqlRkpkdz+3Lni7XI3MnecU40d
	87ef+sCa2OHRQyawC65qGjLrfxm2t4AST/tDqwSEJ+0v07mvrxUYhQ5Av0vk3JcpWnvYmVKx0EA1S
	EuSdFdkhV0Oe6Y7admkb16yGnN9d2yRULWhGoYJUED1gPlnfjnvqKRUZk4GQMBf78JgfePrx5/Bry
	5fs+j/sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kucvs-0000Lt-6T; Wed, 30 Dec 2020 14:58:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kucvo-0000L9-7U; Wed, 30 Dec 2020 14:58:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1C5921973;
 Wed, 30 Dec 2020 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609340310;
 bh=YmXXZasBhC28kFabVxJRx0dXwyd4dmoFQ/gA9h33sCo=;
 h=From:To:Cc:Subject:Date:From;
 b=UW34aLh145QaqjBnp+g6dzEwT+Oueu1jffOyUTwBaoepdYBlMQ/IvRhOH0OU79Ntx
 5rc6EZOchQ394ucyO/7FRiDl/DcRRqmb8gLpoO7saF8Caju+ZNt6ojeLTpId+v2emU
 BHA6nKigaeOQRewQxVSdBRQXeg6m85l3NhHeaGQv0+DXpI2599jM3ec3Lhtvd5gsFx
 QJ59lICWsUvlUFwnIOq0FwBRQ//WeqbdqetvUW/oki/c4bNz/GinNyw++/4hK9P+6i
 Cn+H+sKLrODLDOYgaISGmsOBtqeWDiOV9HB8omGlnvObaLRXttoSMAxttec22XtU8C
 sQoYl4Vh+5+HA==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Subject: [PATCH] mt76: fix enum conversion warning
Date: Wed, 30 Dec 2020 15:57:55 +0100
Message-Id: <20201230145824.3203726-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_095832_337481_FE9A8BB0 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Sean Wang <objelf@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Yiwei Chung <yiwei.chung@mediatek.com>,
 Wan-Feng Jiang <Wan-Feng.Jiang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

A recent patch changed some enum values, but not the type
declaration for the assignment:

drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: error: implicit conversion from enumeration type 'enum mt76_mcuq_id' to different enumeration type 'enum mt76_txq_id' [-Werror,-Wenum-conversion]
                qid = MT_MCUQ_WM;
                    ~ ^~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: error: implicit conversion from enumeration type 'enum mt76_mcuq_id' to different enumeration type 'enum mt76_txq_id' [-Werror,-Wenum-conversion]
                qid = MT_MCUQ_FWDL;
                    ~ ^~~~~~~~~~~~

Change the type to match again.

Fixes: e637763b606b ("mt76: move mcu queues to mt76_dev q_mcu array")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index a44b7766dec6..c13547841a4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -231,7 +231,7 @@ mt7615_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			int cmd, int *seq)
 {
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
-	enum mt76_txq_id qid;
+	enum mt76_mcuq_id qid;
 
 	mt7615_mcu_fill_msg(dev, skb, cmd, seq);
 	if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5fdd1a6d32ee..22753fbb05e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -256,7 +256,7 @@ mt7915_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
 	struct mt7915_mcu_txd *mcu_txd;
 	u8 seq, pkt_fmt, qidx;
-	enum mt76_txq_id txq;
+	enum mt76_mcuq_id txq;
 	__le32 *txd;
 	u32 val;
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
