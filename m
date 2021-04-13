Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC71C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 07:30:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA28661249
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 07:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA28661249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mmC3pkCogdh6xuNFTucVeHcLakt+FeQa7hpFPdGWTiM=; b=HrvOpqTpffwt3QMpuWnTdL/99
	+5Jfy0OW4Ip29DinC4GaYjX6Tx77WmBX8frcmGEzvWWJenGcQiB9JOkU8W1d+LFzNX8ixs7UNV6es
	lBpD0xbOWWQVpWqGGS5EioxpDqHhdAH2XmMl5oJDRP3nfPdKeXLlPqYkdB5/ifk+e0d0zDC7LvNfO
	wJKplezuwV55PHe0sfdQ83Q1Vpj3R0yjzu6o9zLvnYb3kZ8fcUp+hBoMbZIqEaVZl8LeYOV9vip4T
	KmIX4Xinr0torjHqGmqVgQ9jMmIiyQv90Xm/VvhE4ZuHfpfmanukd27sFJRqOpfdUCsfQzBGdcAer
	6yBAN2qcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWDUZ-008VTZ-I4; Tue, 13 Apr 2021 07:29:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDUX-008VTJ-Lg
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 07:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Un7Nw1zz30ohY0sv/x7sErRMIdondZtotxrJMmmI0G0=; b=DJSy4iniuJgq45NTRen5avPRQR
 MaHcxHANnLeFLBbbZ1idoJ03Kf7pz3zQTMATYHRH7ULTuWN7qpfdKfV2hOtrOou6PpuN3TSqqQ2jN
 r1cL6N/dW2byabHVb67GbKGOimOBCXVCRMSF613MNUILPZzHBI+HedAizFD4TRsv/3n17eHuO6Xsl
 C2A6v1SlBFPxXVMM0B8kO+fLbWCtDrnhnkRfwxpt9DIBbBaw8F7sCID01J+4g3cZRn1tPHdqslj5C
 r65vXo9iSawvmcKXHUSZ1K9V3GqHEHpmZBWhO6slKyF3K3a3UTeGOa9YFbtXiSHHvNHZxC7nLh0c+
 6Ir83tvw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDUT-006njq-8X
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 07:29:44 +0000
X-UUID: 450926a7a0d04ef9921f97e1b0ace427-20210413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Un7Nw1zz30ohY0sv/x7sErRMIdondZtotxrJMmmI0G0=; 
 b=mZgEewO7GSuLmNei4es1FMP9M2wnEDVg5vk/e8DbfOmMCWmVoWPyIiyLy/3RMMY5VZPcPOFZ5ENSf2dPiFGvisXwfM4cP+i0+ZCLmddPKIlUYwgTP/2IcmRxDatdtd5Di2In2W87YH0jDLE01vumTKXMiTpnWi6plDnvFsVwg3o=;
X-UUID: 450926a7a0d04ef9921f97e1b0ace427-20210413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1930191940; Tue, 13 Apr 2021 00:29:37 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 00:26:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 15:26:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Apr 2021 15:26:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7915: only free skbs after mt7915_dma_reset()
 when reset happens
Date: Tue, 13 Apr 2021 15:26:20 +0800
Message-ID: <6f531ab347f2c95ccc979b905e1882811dbf88fe.1618297567.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1fc26bda42fcd85b4bcebc8520601c70b882aa34.1618297567.git.ryder.lee@mediatek.com>
References: <1fc26bda42fcd85b4bcebc8520601c70b882aa34.1618297567.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0FBF8B1C5867ACE187B03BCE64CBA3125AD649F31450D63B2D80902F88F920552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_002942_741530_24491425 
X-CRM114-Status: UNSURE (   7.52  )
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

In mt7915_mac_reset_work(), make sure freeing skbs after mt7915_dma_reset().

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index e61dfe966f0a..423f1b9202ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1627,12 +1627,12 @@ void mt7915_mac_reset_work(struct work_struct *work)
 
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_STOPPED);
 
-	mt7915_tx_token_put(dev);
-	idr_init(&dev->token);
-
 	if (mt7915_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
 		mt7915_dma_reset(dev);
 
+		mt7915_tx_token_put(dev);
+		idr_init(&dev->token);
+
 		mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_INIT);
 		mt7915_wait_reset_state(dev, MT_MCU_CMD_RECOVERY_DONE);
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
