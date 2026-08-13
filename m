Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1294EC5DF65
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9a1oE+xZzthJ4yfyqZ4rZ0cQw4Jw7Q4c7EYOaL87J0=; b=I4WROqp0ZEpM2fgXu9oDUjQjly
	X0r5yCPtG9RAfLBlrVCr4A5anjbTP/6bXzg1yuneASAaRS24wPnjAoaWtpp2Q9XQ9e7QExIRi1GE5
	Kq8T095blrV7E4HJmkQfq53BW97WUnf9Ptpwar8LQcW/F/Qg5ZcYmluHSyHxFjDKjy/HeM6aX5cD2
	4Y7sE7UUkbSSUBC5iW1613q4ovl1Sww14PxIS2RKoUvTA4cMEJSvmQsb2RYLwmmtuzrA8xFXob2Jd
	et2vqDvWWNhqnEqQ5eH0PkaxsXvOY6hnfHj3v6BMHkOmrx3EnlfBPOxLpgKbgTnTGLkCxDFbwAhxT
	TpDCBcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR8g-00000000DAJ-3A8F;
	Thu, 13 Aug 2026 08:50:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR8d-00000000D98-1bTk
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 08:50:12 +0000
X-UUID: fb49fea296f311f1acbe4559397dec65-20260813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f9a1oE+xZzthJ4yfyqZ4rZ0cQw4Jw7Q4c7EYOaL87J0=;
	b=lP4bzoximNi/ZRiS6TngHXmCMqkvMATDryw36NamjWGAHUdhk6csa7o/slry13tfOoCxeAb9fXKSmVaansHmnDpbDiq0Zgg6pKAt3rSzfHtTTwVyQJ6soT3f3/ZFCSqc1VMdKpvnA/S4KT33Y7sESYVUBT5w5dHCaALo9ApI7uQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c1084ae9-9435-4eaa-9187-12c107ba61cc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:22130c34-bb4a-455d-af32-a6c2bf6107de,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fb49fea296f311f1acbe4559397dec65-20260813
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 53286795; Thu, 13 Aug 2026 01:50:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 13 Aug 2026 16:50:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 13 Aug 2026 16:50:03 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Tony-TC.Lee@mediatek.com>,
	<jb.tsai@mediatek.com>, Tony-TC Lee <tony-tc.lee@mediatek.com>
Subject: [PATCH 2/3] wifi: mt76: mt7925: report an error for an unknown testmode query id
Date: Thu, 13 Aug 2026 16:50:00 +0800
Message-ID: <20260813085001.1927426-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260813085001.1927426-1-jb.tsai@mediatek.com>
References: <20260813085001.1927426-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_015011_428156_4BDFCC9F 
X-CRM114-Status: GOOD (  11.34  )
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

ret is preseeded with 1, so a padding[0..1] matching neither
MCU_UNI_CMD_TESTMODE_CTRL nor MCU_UNI_CMD_TESTMODE_RX_STAT falls through
both branches and leaves it at 1. mt7925_testmode_dump() returns that to
netlink_dump(), where a positive value means "more data follows", so the
dump is held open and retried rather than failing.

Answer -EINVAL for an id that is neither, and drop the initialiser now
that every path assigns ret, which also lets the compiler check that.

Fixes: 0a41b6751e4f ("wifi: mt76: mt7925: add test mode support")
Signed-off-by: Tony-TC Lee <tony-tc.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/testmode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
index 6ff261dfeedd..bf9516bc7bd1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
@@ -90,7 +90,7 @@ mt7925_tm_query(struct mt792x_dev *dev, struct mt7925_tm_cmd *req,
 	struct mt7925_rftest_cmd cmd;
 	struct mt7925_rftest_cmd *pcmd = &cmd;
 	struct sk_buff *skb = NULL;
-	int ret = 1;
+	int ret;
 
 	memset(pcmd, 0, sizeof(*pcmd));
 	memcpy(&pcmd->ctrl, &req->c, sizeof(struct uni_cmd_testmode_ctrl));
@@ -101,6 +101,8 @@ mt7925_tm_query(struct mt792x_dev *dev, struct mt7925_tm_cmd *req,
 	else if (*((uint16_t *)req->padding) == MCU_UNI_CMD_TESTMODE_RX_STAT)
 		ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_UNI_QUERY(TESTMODE_RX_STAT),
 						&cmd, sizeof(cmd), true, &skb);
+	else
+		ret = -EINVAL;
 
 	if (ret)
 		goto out;
-- 
2.45.2


