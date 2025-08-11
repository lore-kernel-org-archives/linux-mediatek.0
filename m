Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B64CA0EC8
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0U7WXC3SmAyoXuFVjoEaiQcznGfmIvYEkSXnf8K72EU=; b=AyUVmIo6bUltZXgufqvqvHGoi5
	cm0g/nXLB5pg4Tj7RwhD9Vab7HvxckAhMiwQtzLQfkEtxa+8bGgU55dT4XoOrkyRt31JngqVwb0br
	yPtT36VUZD6lW8H7EmSpsYNbf44jfPEjgmyxWIRcnU79Tb7xYLvLHz9MSgxCPZoCCPgj6mZ08Ok9O
	3GAjkimAubOSkkIw3AwOitFKht0Crvs1cagZvDJWW4beFSE2cYabWFCoXQPnemJVPOwsvOrzUUvId
	FvGMMBsSVAClfnL0BgCjql1sWVIPIxG2BDBfxraBlm7eecq6bnftskls0MtkiJSHpmA6vOxcjBCGe
	3pr0/MSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSS7-00000007nWJ-2Aqy;
	Mon, 11 Aug 2025 13:20:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSMG-00000007mnH-11ST
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 13:14:37 +0000
X-UUID: 1eaabb8076b511f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0U7WXC3SmAyoXuFVjoEaiQcznGfmIvYEkSXnf8K72EU=;
	b=koOBXkXZ+vCUlm1QUv2Tx1OdYDVxAcaa6VMLWlxW4GStFyMzxn8xCHyz0Xx/bFm+bFePzP91JpADcwFe2xHwtwRo57HaSDjMdZAtHtHdLGourlDVx9p0Ld7XiXsQ57ocdawDa2AF0zgdkKyWlAITDKD8Ks1iz5ih5VKqWb+jGqI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:807a793e-065e-4b6c-acb2-e74240e1bf54,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:12494951-d89a-4c27-9e37-f7ccfcbebd5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1eaabb8076b511f09f706fa2197c6ceb-20250811
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2069414333; Mon, 11 Aug 2025 06:14:32 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 21:14:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 21:14:25 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 09/10] ufs: host: mediatek: Change reset sequence for improved stability
Date: Mon, 11 Aug 2025 21:11:25 +0800
Message-ID: <20250811131423.3444014-10-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250811131423.3444014-1-peter.wang@mediatek.com>
References: <20250811131423.3444014-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_061436_285380_74165B42 
X-CRM114-Status: GOOD (  12.43  )
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

From: Peter Wang <peter.wang@mediatek.com>

This patch modifies the reset sequence to ensure that the device
reset pin is set low before the host is disabled. This change
enhances the stability of the reset process by ensuring the
correct order of operations.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 6db75683bbe8..ae458c4a7a46 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1543,11 +1543,11 @@ static int ufs_mtk_device_reset(struct ufs_hba *hba)
 {
 	struct arm_smccc_res res;
 
-	/* disable hba before device reset */
-	ufshcd_hba_stop(hba);
-
 	ufs_mtk_device_reset_ctrl(0, res);
 
+	/* disable hba in middle of device reset */
+	ufshcd_hba_stop(hba);
+
 	/*
 	 * The reset signal is active low. UFS devices shall detect
 	 * more than or equal to 1us of positive or negative RST_n
-- 
2.45.2


