Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5E2C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=avL8CU6kY5CS4NKIn08+zcUBC0UI/MDg7QxLShqe7BY=; b=Tu+LiW/+BVFRT0aj+2BKKuAG1i
	qcEriQXfYlvLfa7Lv3WERYSh/yuPYFU5p6BiCc9z5EBY0h5QPYRkn3FfjSfEVd2r6HaneUjQGCnMl
	XysXib2meWwOc0d0l6C7qqemWWTviaksOsUCEuPuTi9Bq+VBNn+fY64Cu7fYKg1CpYoHwP2+16zOV
	Hu9Rn59XtQT91en0lupU79R1oFFEV6N4UinwNJAj8yeOlU2GdPu7x+Yw4+IQsXAgKQQHqUEtIdVye
	3ytjHFNsGxD6tzIf4ZMw2QAfT450EJLgh0mF5azm3q02yQCmj66h+4AdRrTd8/Lrnqqq6ugYptRoU
	l1F8zS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piB2z-006fsV-0o;
	Fri, 31 Mar 2023 09:27:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piB2w-006fpU-2n;
	Fri, 31 Mar 2023 09:27:48 +0000
X-UUID: 47e67646cfa611edb7d8d11f642b8e78-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=avL8CU6kY5CS4NKIn08+zcUBC0UI/MDg7QxLShqe7BY=;
	b=aRLXWOtfC9pfQlrLiiVitZq7A9juNIhcu8H9DoRQ1gzuQ4/xPZsN17/an3iMuvQiX8iPxnr8wFQPB2siAwY8XvldVFDsK2ATVo+J7pcK+OT/AtzN2zH6Dk7sjIrGp3GJFCaLpORy9TQitex6E746XLuB/B/UldCSm35StA0axNc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:dc0f6d4a-3c23-4583-b98a-ff0fd19226af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:11b184f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 47e67646cfa611edb7d8d11f642b8e78-20230331
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1536151633; Fri, 31 Mar 2023 02:27:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 17:27:05 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 17:27:04 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <yongdong.zhang@mediatek.com>, <peng.zhou@mediatek.com>,
	<browse.zhang@mediatek.com>, <light.hsieh@mediatek.com>, Qilin Tan
	<qilin.tan@mediatek.com>, <linux-f2fs-devel@lists.sourceforge.net>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] f2fs: fix iostat lock protection
Date: Fri, 31 Mar 2023 17:26:56 +0800
Message-ID: <20230331092658.72386-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_022746_912930_767FF1D8 
X-CRM114-Status: GOOD (  10.60  )
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

From: Qilin Tan <qilin.tan@mediatek.com>

Made iostat lock irq safe to avoid potentinal deadlock.

Deadlock scenario:
f2fs_attr_store
  -> f2fs_sbi_store
  -> _sbi_store
  -> spin_lock(sbi->iostat_lock)
    <interrupt request>
    -> scsi_end_request
    -> bio_endio
    -> f2fs_dio_read_end_io
    -> f2fs_update_iostat
    -> spin_lock_irqsave(sbi->iostat_lock)  ===> Dead lock here

Signed-off-by: Qilin Tan <qilin.tan@mediatek.com>
---
 fs/f2fs/sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 0b19163c90d4..fd238a68017e 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -575,9 +575,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (!strcmp(a->attr.name, "iostat_period_ms")) {
 		if (t < MIN_IOSTAT_PERIOD_MS || t > MAX_IOSTAT_PERIOD_MS)
 			return -EINVAL;
-		spin_lock(&sbi->iostat_lock);
+		spin_lock_irq(&sbi->iostat_lock);
 		sbi->iostat_period_ms = (unsigned int)t;
-		spin_unlock(&sbi->iostat_lock);
+		spin_unlock_irq(&sbi->iostat_lock);
 		return count;
 	}
 #endif
-- 
2.17.0


