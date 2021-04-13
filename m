Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A879C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 08:04:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6075B613A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 08:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6075B613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pWaikOtUjq6ZTBu4DCdNlo77Ef5b0guVvFi5vHfjcuo=; b=lZRpYsJCc1JmzqQritCohSCXqu
	btJq80fjiC0iqSWqk8XNIqMH+CuKovCUWvTEgREyg12fbbWFeusVqu8gz2zQxNuaVGQTvfPU8TI1c
	qiuZiMSf91tdpSC+nTQ8PgRR7m1Sv+2e4S1q88W48BexU+zPtYr00tSWwn/+/dFIYxNHKsRASneTu
	XBzChzBuHzyauRbHISg/6JXGrSlcUuDYSODgFyewt4YQeLLjsxa0cnO82bppgZY3BZjWmVuPiNLOB
	BSCllbS7zQyH54TTcDcPlOUv8EqLIK4PWW8AYSXg5/Vs08ZbS8+WiBRns8ltQwW7W/d4DMzdK4+Mp
	+3CMJW/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWE1Y-008Ydy-5X; Tue, 13 Apr 2021 08:03:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDyD-008YV8-Lk
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 08:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=VOQ8qDqO/Y2CFxbHRYf5xC+yO9l10f2Cno7ozlThN0s=; b=YEEmb4yxk8cD7Ce4RKGKkmX6h9
 695LkdIar7PjXhtb5ZwODz1Qo1F743/mLZXD4WwsRcL024vhf/hggbVTtJ6lg89CIQ4NHtyOP2cQo
 EUX+u0uO/2z++OaQ6kST6QgADkhoCfsumfVjjpFlAmF0FOp7a0k1s//pBkurZtMnwuZ+HCepUF2UE
 Akp/0w3Wtt/GdJlDSCL1+Nv+nE4Nt4EneQx5KWtRTQEBv03wj50jVfrlufd1m9AqkA9u4K+1CrNhL
 Tl/PJWDM1MRpvuCjQLd7x4kcDNucGmgEQKpUGNipAzKxx3qugHx1ANPVQKzvitxk5Jz7ysRrwi8mI
 HAcAWJ0g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDyB-006oqv-8n
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 08:00:24 +0000
X-UUID: d96ef65042c241af8e5d3ed51322ceeb-20210413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VOQ8qDqO/Y2CFxbHRYf5xC+yO9l10f2Cno7ozlThN0s=; 
 b=goOZEUEggv9J8KDNDQi/bJ4L6ZMLyEIXpoR84ZiRnvR1co0Ja3Bab29PkEIYJwB4ZjRyGeb78kPaji5TgiVJsI5tYM5jGiBhPVkDO4VDbLnDoquu80R8/adDPkFUYvccnlqacK7V0b3IJIUe7CiywLNvo2/4yovjNm+0cDF+aN0=;
X-UUID: d96ef65042c241af8e5d3ed51322ceeb-20210413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1975809354; Tue, 13 Apr 2021 01:00:19 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 01:00:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 16:00:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Apr 2021 16:00:09 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/2] mt76: mt7615: only free skbs after mt7615_dma_reset()
 when reset happens
Date: Tue, 13 Apr 2021 16:00:06 +0800
Message-ID: <f5e1b4bf7a66f4e3705bfd673e82b9dd21d41e9a.1618300405.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_010023_352910_8E27EDCF 
X-CRM114-Status: UNSURE (   7.97  )
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

In mt7615_mac_reset_work(), make sure freeing skbs after mt7615_dma_reset().

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v2: 
- split v1 into two patches
- remove original mt7615_tx_token_put.
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
index 7694391603dd..baaf734c6950 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -304,12 +304,12 @@ void mt7615_mac_reset_work(struct work_struct *work)
 
 	mt7615_hif_int_event_trigger(dev, MT_MCU_INT_EVENT_PDMA_STOPPED);
 
-	mt7615_tx_token_put(dev);
-	idr_init(&dev->token);
-
 	if (mt7615_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
 		mt7615_dma_reset(dev);
 
+		mt7615_tx_token_put(dev);
+		idr_init(&dev->token);
+
 		mt76_wr(dev, MT_WPDMA_MEM_RNG_ERR, 0);
 
 		mt7615_hif_int_event_trigger(dev, MT_MCU_INT_EVENT_PDMA_INIT);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
