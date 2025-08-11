Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0667FC87FD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4ByMA2i57dW91+nFyI17BlRwhij8fMihptY17VG9Kk=; b=ClMsMo0pUcFtMU8e7ihyH+3nnE
	kBLftUx4MC8Gg0+yA0E+zBFG8N+apBfgpEg7LlRSDGbMGC8EcBpIJIo6dgNbEktC2C8MFYEdCJek+
	XDEWm2/F5wi1rlgs3sWG60dPILVUbh2yYF5ahnXr5Djv3ox5/NwEZlBWDTwxsDU3NcpznkEInG8/o
	fI0NLVlqyHRNlmPbiq128U5cmCWUh4ZOBRIig7eJiV0x3PAH2LPN3mi1mCydXZBm8BkOuMNvlL5Kp
	WLWTd69cMUG9W0J8udJ3skyxX9ZzTvHYHHjZgBMRldF4HL0PaLfPXD0h6Wkijop1iGV3E/FZsh02x
	md//RCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSS4-00000007nS2-3lA4;
	Mon, 11 Aug 2025 13:20:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSMD-00000007mkU-10JH
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 13:14:34 +0000
X-UUID: 1c8a638276b511f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R4ByMA2i57dW91+nFyI17BlRwhij8fMihptY17VG9Kk=;
	b=lxLsqFfRLtGMYpnisF2TktO6ZNpxgmWv0Wd4KhkBIweqWvQgSSNA750CJnZakyoCazf3rtR5/L5GvAa6BqEgDUAjiIXgo1/gC+GTbewOm6y/A3sU2xpr0cbxp6OQqCn6U67xtf9gpNFUoZn5BYVIxxnKSCpxaZG7UFF4DuOe76k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:c4d1d275-f8ff-411d-9cc8-ecc54f57efa3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:7cdb4fa1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1c8a638276b511f09f706fa2197c6ceb-20250811
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2018446421; Mon, 11 Aug 2025 06:14:28 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 21:14:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 21:14:24 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 03/10] ufs: host: mediatek: Add debug information for Auto-Hibern8
Date: Mon, 11 Aug 2025 21:11:19 +0800
Message-ID: <20250811131423.3444014-4-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250811131423.3444014-1-peter.wang@mediatek.com>
References: <20250811131423.3444014-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_061433_278706_851146EC 
X-CRM114-Status: GOOD (  11.30  )
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

This patch enhances the clock gating logic by adding debug
information for the Auto-Hibern8 (AHIT) register.
This additional logging aids in troubleshooting by providing
insights into the AHIT configuration when the clock is not
turned off as expected.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 3e661494fbb6..3d50cd3a01b3 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -798,8 +798,14 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 				clk_pwr_off = true;
 		}
 
-		if (clk_pwr_off)
+		if (clk_pwr_off) {
 			ufs_mtk_pwr_ctrl(hba, false);
+		} else {
+			dev_warn(hba->dev, "Clock is not turned off, hba->ahit = 0x%x, AHIT = 0x%x\n",
+				hba->ahit,
+				ufshcd_readl(hba,
+					REG_AUTO_HIBERNATE_IDLE_TIMER));
+		}
 		ufs_mtk_mcq_disable_irq(hba);
 	} else if (on && status == POST_CHANGE) {
 		ufs_mtk_pwr_ctrl(hba, true);
-- 
2.45.2


