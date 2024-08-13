Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07CEC52D7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 05:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/EL4a84+ewNtTbFzf9olvVO+ScQrjy5OcNClP3jBT/Q=; b=xATw2pMHLKXgQEJ0hbHXzoegST
	y9OCJ/IlIYrBc6CkPLr8sPjh5+rBxktjiILYKwoLhzdZnmdaiSexS1qI6xfpGzEvR+9j5Wk3eP3XL
	kkVhhOAKXtyJqX0pB2qnyGe6ecZ+PYklseMBjx943K9+Rkry+jiEeYxI01gSWI4DqdOrsAl10ReNz
	897hXxX/HTpnKb1frjzLI6TESy15uI2gZ0j/k5gmlP8L7rATlsSwXaaM85JuhLPgZrMlR/vnZqoim
	3y6sPKbsQVOewLgYwQCBIujzckThG8v/4e3vWC0EyYi0zdvYDKRsUle11YH+W9taj4FM3cASR32H2
	bNE0DA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdkVt-00000002VER-3473;
	Tue, 13 Aug 2024 05:56:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdkVf-00000002VA1-2Xqi;
	Tue, 13 Aug 2024 05:55:56 +0000
X-UUID: b02f40e4593811ef955bff358274dad2-20240812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/EL4a84+ewNtTbFzf9olvVO+ScQrjy5OcNClP3jBT/Q=;
	b=ur8dWJqmragf9F617NZtYGjGQtSSzzxU40yoM9n7DWZTWflVJhj1cM87HwEaGozfeYtonb4ovyBFQH3P/hDWItachhAjiDzOIIlKhC1VI7uqJ1b5HLCFYSMl25DAO6NYADGdBUSSVF9j1K4v+I8GcEvBY4K5mC/tE+Dc0fNHzE0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3ff0ce77-971b-41ed-98f3-ab47ce636d8e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:7d0b183e-6aa5-4057-84d5-0e7d47251781,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b02f40e4593811ef955bff358274dad2-20240812
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chaotian.jing@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 927822187; Mon, 12 Aug 2024 22:55:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 13 Aug 2024 13:35:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Aug 2024 13:35:43 +0800
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, Chaotian
 Jing <chaotian.jing@mediatek.com>, <stable@vger.kernel.org>, Bart Van Assche
	<bvanassche@acm.org>
Subject: [PATCH v2] scsi: fix the return value of scsi_logical_block_count
Date: Tue, 13 Aug 2024 13:34:10 +0800
Message-ID: <20240813053534.7720-1-chaotian.jing@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_225555_676025_87683F1A 
X-CRM114-Status: GOOD (  12.53  )
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
index 45c40d200154..8ecfb94049db 100644
--- a/include/scsi/scsi_cmnd.h
+++ b/include/scsi/scsi_cmnd.h
@@ -234,7 +234,7 @@ static inline sector_t scsi_get_lba(struct scsi_cmnd *scmd)
 
 static inline unsigned int scsi_logical_block_count(struct scsi_cmnd *scmd)
 {
-	unsigned int shift = ilog2(scmd->device->sector_size) - SECTOR_SHIFT;
+	unsigned int shift = ilog2(scmd->device->sector_size);
 
 	return blk_rq_bytes(scsi_cmd_to_rq(scmd)) >> shift;
 }
-- 
2.46.0


