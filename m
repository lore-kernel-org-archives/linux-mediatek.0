Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA623EDEC6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtO7l74MiDOCASn4v8QtrTO68migCuNl/oaqN3ri9ic=; b=kz/G6r5/Y8TKYkZJvUKmboIc2+
	MW24eWWttA7QIHJrenvt4Y+VkUXEwIzEAWCwaL46PcTY0fDoYR9nDIhg+0HlwD+SOk35kf4Q68Oj2
	nkUxnWSPBRyqiiGLUhBZQvri6Pr3dJ340Eb38XCchzYRBbSJJs6M48Itlrv7ut5W2+LLcZN8DY/EJ
	FEqPs+Jp8Nkc4O/6GQvxfAJX7foD9zdd805UQ9AWnJXTqjuy5pyGA3cMkvEaRiB6Fdd6W8V2T+cJB
	UXk36n9T6TG+ii8iKo9vBNZKfrtRN8/ynA1IhSxM+7Tbm+mAqmSzwdSt5/p1scUB0NHt7jSBuc3jE
	nGPt7z2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR77-0068zv-2P;
	Wed, 13 Sep 2023 14:45:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR73-0068wy-1d
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 14:45:06 +0000
X-UUID: 1b74ee0a524411ee9b7791016c24628a-20230913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GtO7l74MiDOCASn4v8QtrTO68migCuNl/oaqN3ri9ic=;
	b=DZkCffg5/qPTibTv63VRmuY75p9N7xJ7hEqKSUj0HJ9G6hpu9L0AA4awjEShkV2Z7DvWO6nJxELn4SUk87eTOkSh5ZEOUdre83wc40d10miEgH4sOcW3zKVBgY6X+IImtEY+OpXurIOvviwGg7EhQkdL24PChYjPBhAn0xfg4As=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a5fe36da-f5c8-40df-942d-fa4dbd1177c1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:04f5cbbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1b74ee0a524411ee9b7791016c24628a-20230913
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1137304752; Wed, 13 Sep 2023 07:44:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 22:44:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Sep 2023 22:44:23 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2 08/17] wifi: mt76: mt7925: add mac.h
Date: Wed, 13 Sep 2023 22:43:36 +0800
Message-ID: <40f14854b656ee26926a5ffa6260db6b95ef418b.1694595134.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1694595134.git.deren.wu@mediatek.com>
References: <cover.1694595134.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_074505_574658_9CBE6B54 
X-CRM114-Status: GOOD (  11.25  )
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

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.h   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/mac.h

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.h b/drivers/net/wireless/mediatek/mt76/mt7925/mac.h
new file mode 100644
index 000000000000..b10a993326b9
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: ISC */
+/* Copyright (C) 2023 MediaTek Inc. */
+
+#ifndef __MT7925_MAC_H
+#define __MT7925_MAC_H
+
+#include "../mt76_connac3_mac.h"
+
+#define MT_WTBL_TXRX_CAP_RATE_OFFSET	7
+#define MT_WTBL_TXRX_RATE_G2_HE		24
+#define MT_WTBL_TXRX_RATE_G2		12
+
+#define MT_WTBL_AC0_CTT_OFFSET		20
+
+static inline u32 mt7925_mac_wtbl_lmac_addr(struct mt792x_dev *dev, u16 wcid, u8 dw)
+{
+	mt76_wr(dev, MT_WTBLON_TOP_WDUCR,
+		FIELD_PREP(MT_WTBLON_TOP_WDUCR_GROUP, (wcid >> 7)));
+
+	return MT_WTBL_LMAC_OFFS(wcid, dw);
+}
+
+#endif
-- 
2.18.0


