Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07186C5CFEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pNIT/tNOK9sW/rcuT+Bg8F67Y7BjyxTyHyIw82ypq+c=; b=b4ytUJwDZ6PKPjXifV0q0e6HBP
	Dw2fxTC0otvvCBBFsiG+oUOZFqS9mXPXa5aa3XoiH6ortcLknlGA6axKP4ZZ736HXxuluSnppqd0k
	J9ZGd2LH0D62hWk5UyXmQ/+XjoquJAXW0MMQf9AW4XzGp4LtAlqz3xDxpC1qymD1802nkCbxnfL7d
	dlphDILJA9TP24krH51zC4RS0Wo+4NaM5Aa65UV7nQV93aYd8PiPCQSM0eiJfriNUlwmU6E8d0oFq
	7Wj4LGYPQzi87vodOntRGFFlNqK8Ai2DThe1gptNO+4ijLU8Cd9HAMnKtAYbCLeMlpQwWUfUElKh1
	NEtD0BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR8g-00000000DAN-3Nec;
	Thu, 13 Aug 2026 08:50:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR8e-00000000D9i-0iSn
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 08:50:13 +0000
X-UUID: faa31b8296f311f1afed4741b24580c9-20260813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pNIT/tNOK9sW/rcuT+Bg8F67Y7BjyxTyHyIw82ypq+c=;
	b=PvOl19lLbSElced3PXyatwSOdvFDEIv1tbE0lYfmL4LyfWtxDDOeGwyp14ekbKcrtmz77N8DAxVusd6OiBe0ViIaLJnP1nnCyMQNzOE3otttLcIKqP/c1jYcEfndKf2myHj0mRnebIEC8mirkzQ2cxc+0A2Mc5DqzzpSi9YlI6Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:479c9d5d-fa8c-41c6-8ea7-f30c00cd5e99,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:6e644541-051c-4757-9871-8fe24bc417f4,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: faa31b8296f311f1afed4741b24580c9-20260813
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1739227227; Thu, 13 Aug 2026 01:50:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 13 Aug 2026 16:50:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 13 Aug 2026 16:50:02 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Tony-TC.Lee@mediatek.com>,
	<jb.tsai@mediatek.com>, Tony-TC Lee <tony-tc.lee@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7925: zero the whole testmode command buffer
Date: Thu, 13 Aug 2026 16:49:59 +0800
Message-ID: <20260813085001.1927426-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_015012_215196_C75F0C43 
X-CRM114-Status: GOOD (  10.45  )
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

From: Tony-TC Lee <tony-tc.lee@mediatek.com>

pcmd is declared char *, so sizeof(*pcmd) is 1 and the memset clears a
single byte rather than struct mt7925_rftest_cmd. Everything the memcpy
that follows does not overwrite - padding[1..3] - reaches the firmware
as uninitialised stack content.

Use a correctly typed pointer, as mt7925_tm_set() already does, so
sizeof(*pcmd) covers the whole command. Addressing ctrl by name rather
than by a hand-computed +4 offset comes with it and is not optional:
pcmd + 4 on a struct pointer would advance by four whole structures.

Fixes: 0a41b6751e4f ("wifi: mt76: mt7925: add test mode support")
Signed-off-by: Tony-TC Lee <tony-tc.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/testmode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
index 22a8f1ddc321..6ff261dfeedd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
@@ -88,12 +88,12 @@ mt7925_tm_query(struct mt792x_dev *dev, struct mt7925_tm_cmd *req,
 		char *evt_resp)
 {
 	struct mt7925_rftest_cmd cmd;
-	char *pcmd = (char *)&cmd;
+	struct mt7925_rftest_cmd *pcmd = &cmd;
 	struct sk_buff *skb = NULL;
 	int ret = 1;
 
 	memset(pcmd, 0, sizeof(*pcmd));
-	memcpy(pcmd + 4, (char *)&req->c, sizeof(struct uni_cmd_testmode_ctrl));
+	memcpy(&pcmd->ctrl, &req->c, sizeof(struct uni_cmd_testmode_ctrl));
 
 	if (*((uint16_t *)req->padding) == MCU_UNI_CMD_TESTMODE_CTRL)
 		ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_UNI_QUERY(TESTMODE_CTRL),
-- 
2.45.2


