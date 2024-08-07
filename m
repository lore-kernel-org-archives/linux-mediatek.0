Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A3C49EA1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 00:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tqvFLsU38AQ4ZsYa+GqPZqwxYkXOtirMZ+Qc0V7lbbI=; b=IXcg3rb0PdIsX1odSr2/EHZH45
	iq0pswGqdGwDbmHbUwgN+Jzw273H/W7eq9zwtnDg/d9F7NsraySg/4vWtUl+Q91X1SfPSiSDxNelG
	Omkkpcchwjl7TrnNArylGsZAoFNK1TGKfj4tX6kh3T7Jq2+abF1dnq/ks5tKwFijyqtyDJCYqzNDL
	4LOVzUKGZGDvLVTLZnF8rZkkW06WisdcuJqXbiZP1ooJ/b2O4UkcVw5y0C23xqZ3Fd609OhVVLcal
	ipAMGTqMM0HZQPu4tV2YuBCVIEWa/Pz0JGmzT0ZeftLo33XyUB4BC0jIIKsv00+IY6ivNVjHYqT28
	x+JquN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbV1r-00000003UQh-1QhE;
	Wed, 07 Aug 2024 00:59:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbV1o-00000003UPh-2D3n;
	Wed, 07 Aug 2024 00:59:49 +0000
X-UUID: 55b43438545811efa6c87f6b4542ff6b-20240806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tqvFLsU38AQ4ZsYa+GqPZqwxYkXOtirMZ+Qc0V7lbbI=;
	b=TLXvPhoKbi6Iusbo3Urm069p1bmhTk210O663SwdHjbZVRuBjn8xMHg4vpb+m2xU0LSBJrbhX02TEfMwuiW6A+TPyjSJhVw3U5FGuKK7+msugFwmsFY+uFKaUzqq6Xk+c5/4UImrff/cYz0ShVZ6+id11tKj5aVLZM50K4yXhNE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:d0603bbc-36c8-4502-96cd-d7d534735ea1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e88246c1-acff-4a0f-9582-14bcdf4ed7e0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 55b43438545811efa6c87f6b4542ff6b-20240806
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <chaotian.jing@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1588944524; Tue, 06 Aug 2024 17:59:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 08:59:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 08:59:09 +0800
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, Chaotian
 Jing <chaotian.jing@mediatek.com>, <stable@vger.kernel.org>, Bart Van Assche
	<bvanassche@acm.org>
Subject: [PATCH] scsi: fix the return value of scsi_logical_block_count
Date: Wed, 7 Aug 2024 08:57:59 +0800
Message-ID: <20240807005907.12380-1-chaotian.jing@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_175948_574725_08E3E432 
X-CRM114-Status: GOOD (  12.11  )
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

scsi_logical_block_count() should return the block count of scsi device,
but the original code has a wrong implement.

Cc: stable@vger.kernel.org
Fixes: 6a20e21ae1e2 ("scsi: core: Add helper to return number of logical
blocks in a request")
Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 include/scsi/scsi_cmnd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/scsi/scsi_cmnd.h b/include/scsi/scsi_cmnd.h
index 45c40d200154..f0be0caa295a 100644
--- a/include/scsi/scsi_cmnd.h
+++ b/include/scsi/scsi_cmnd.h
@@ -236,7 +236,7 @@ static inline unsigned int scsi_logical_block_count(struct scsi_cmnd *scmd)
 {
 	unsigned int shift = ilog2(scmd->device->sector_size) - SECTOR_SHIFT;
 
-	return blk_rq_bytes(scsi_cmd_to_rq(scmd)) >> shift;
+	return blk_rq_sectors(scsi_cmd_to_rq(scmd)) >> shift;
 }
 
 /*
-- 
2.46.0


