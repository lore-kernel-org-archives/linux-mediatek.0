Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239DFC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56GrzRTzL4IqyjNFK17cSt2aS1qNNZ9O5Pqe/qVyOYk=; b=CJ9wg/KMW9qdlYjZTZyhyhzSsY
	XlFR+ETisbaLemq0wYvBelZ+NCG9/QxmC3zJJuQWE5BtdwTl8aG0wqnRNwqih46RRwc3zzzVgSb9r
	UxDko1hDci6EiPCM6iZNe/6SLJNkNjkta1Js6aTlA0oOLk49/at3STQPF6HXessBlX5V9Ofoth5H0
	gPvqIFz3G0yeJT/OANSf+ICzues3H0G/GZNbWq+NlaKc/uA4ptuXQSkNon9onaWp8RRZbcqbUvZF3
	HNeEvpO13/pZCNhdV8K9r8w0+30xsXsgnVw7pxLXMsv2bi1uWhrFSp7HEm9Xq3PHYaGFKgcfWTABa
	LzBmk87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2otO-00E0b1-Av; Wed, 07 Dec 2022 07:30:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2otL-00E0Zv-PQ
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 07:30:57 +0000
X-UUID: 2a23ba770fb04355a15adb6ef6b69bf8-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=56GrzRTzL4IqyjNFK17cSt2aS1qNNZ9O5Pqe/qVyOYk=;
	b=sEaqE0nY8mpKGEcU4V6AB+VH0R8z9MdUDLRuv4OEiNlSllQS12zJ4Yzx5DR1dxuXdOEpO3ARHfeTJ23V0/ASSoTKZTKSqQmlX6nMlAvUnLc6eLfJX9O42y3aGrDY7pEfcp04Bs2rti6EsEpCL46xBajrvVbM2lQgyN92OGe+h/g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:598040c6-cbb9-4b8b-a731-d40c18b0b534,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:598040c6-cbb9-4b8b-a731-d40c18b0b534,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:b874c916-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:221207153027DKY12FOE,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 2a23ba770fb04355a15adb6ef6b69bf8-20221207
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1730829164; Wed, 07 Dec 2022 00:30:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 15:30:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 15:30:09 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7915: fix unintended sign extension of mt7915_hw_queue_read()
Date: Wed, 7 Dec 2022 15:30:05 +0800
Message-ID: <1c3c811a6f0a3ad54499729c1020e0504fea6c7d.1670396836.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <a882942479ff8f20189580a69174202b40210682.1670396836.git.ryder.lee@mediatek.com>
References: <a882942479ff8f20189580a69174202b40210682.1670396836.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_233055_849054_6F2F6F27 
X-CRM114-Status: GOOD (  10.04  )
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

In the expression "map[i].qid << 24" starts as u8, but is promoted to
"signed int", then sign-extended to type "unsigned long", which is not
intended. Cast to u32 to avoid the sign extension.

Fixes: 776ec4e77aa6 ("mt76: mt7915: rework debugfs queue info")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index a7fdcd1f3d98..5a46813a59ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -811,7 +811,7 @@ mt7915_hw_queue_read(struct seq_file *s, u32 size,
 		if (val & BIT(map[i].index))
 			continue;
 
-		ctrl = BIT(31) | (map[i].pid << 10) | (map[i].qid << 24);
+		ctrl = BIT(31) | (map[i].pid << 10) | ((u32)map[i].qid << 24);
 		mt76_wr(dev, MT_FL_Q0_CTRL, ctrl);
 
 		head = mt76_get_field(dev, MT_FL_Q2_CTRL,
-- 
2.18.0


