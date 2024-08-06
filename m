Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89368C3DA64
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bd8GlhW9froM6GOA2YyMMX+R5JWkQRdHXG8ufSuKDZk=; b=FJhzWagWrdsF6I7IDymtO/qqKc
	Cf9+f8/B7Y9qgUj/+TVrRGuTM1HYjkiYHaysAqTfMWEY0GWarB0tml3SizYf8BPZrTrNBOQp1mZAc
	nS87s1fWBcgrXPNnsYGBoU5dukn5wBMTD2uahQhe1wouEKsLv5EH/ZOYVO23kcZWXTgCo2Nx+90S6
	gbyhMPI/LqlR5lwwumYns49ZZDgG6oaUYZPe6HdS8EB5n47mZCJLIrxYPwh6T9ZQ/74bAdM6FIXbs
	EgSSQ4UQfqv5BriWHtRV4PK7emtwxlu5YMwTtyViVE43RXMCUu2BCBLVmOl+8L985oWVFzX16/mLU
	CixV24uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEcM-00000000mwq-2eei;
	Tue, 06 Aug 2024 07:28:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEcK-00000000mwA-0pIP;
	Tue, 06 Aug 2024 07:28:25 +0000
X-UUID: 7230bea853c511efa6c87f6b4542ff6b-20240806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bd8GlhW9froM6GOA2YyMMX+R5JWkQRdHXG8ufSuKDZk=;
	b=S7lo9+CcEvbtzQeRMFP90ClQE05B2DplLGO+YHRUL8nvyWUKJvhyejiClqcIzd6kmCQJHD0F2XQlVO6AOy+n7KZ+y5vgo5forAQrx4uXCAB2WUw6P7zcD3mpJ2/KGdEVXaQ6F0fn63JGjE57gb3amP3BxZiJWQYiwBxWB16rK8g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e332fdc7-b951-4d98-a195-ed4f4ef48bce,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:28b488df-dee0-4117-97b9-64374874b616,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7230bea853c511efa6c87f6b4542ff6b-20240806
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chaotian.jing@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1717992893; Tue, 06 Aug 2024 00:28:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 6 Aug 2024 15:28:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 6 Aug 2024 15:28:12 +0800
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, Chaotian
 Jing <chaotian.jing@mediatek.com>
Subject: [PATCH] scsi: fix the return value of scsi_logical_block_count
Date: Tue, 6 Aug 2024 15:26:34 +0800
Message-ID: <20240806072714.29756-1-chaotian.jing@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_002824_263339_1774E367 
X-CRM114-Status: GOOD (  10.90  )
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

Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>
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


