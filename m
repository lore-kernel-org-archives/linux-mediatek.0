Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C3EF513FC
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 05:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0dlhYLj8ZPQDL/ivichbm7Abi/77rG55s+eXIdgghzw=; b=Yzn2BjszyBqkSvcQHlNJCh1YlE
	UKISqq4GSRwHCGuLUJNNRPOSHCUSbITyeyumAgtnaXSnP2pdnLcFe41VY235IdHir0A1ybH25wvHW
	NTeEKFYK5d4mpRldEZirYgmcYph2AiBASpGUpxJcTnO1XaN6uHvJ+mWS9dk73wUsrjWCTpg705cnw
	7LW2j/20tGNcjak0PN9blKC6BGFKsOLymhS3Q7HMqRPuvnN3r5FsNXm0NJhVx7EDZYLHGxw6UAmpn
	1Q7C0Lu+UjDOJKvBmmCXcMs9Y4QHhDeevzowkFpYkN/LbHHkrFjqO1l8/iP+Bk8ZZhaqUp86Z4zEt
	lQRCO4aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyNzC-000000033O2-0OQk;
	Fri, 06 Mar 2026 05:44:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyNz8-000000033Na-3VKZ
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 05:44:27 +0000
X-UUID: 87699418191f11f19e7563141e833ce8-20260305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0dlhYLj8ZPQDL/ivichbm7Abi/77rG55s+eXIdgghzw=;
	b=pHpZsTp+5by2g999wbCEIMWtynj0WLat7RYbTiWCtSjmzHo7K4WLkiZyPOIklpX6T+rMTDdYITMZrwx6JGefl0Ih2zfQfOvGvrA0tDNuOSGbflGxZxmfLNpI9/gbwrMj1dnH1cKPAt0xzbwFPzEqgnXjl5eZ+cHb6hM2vsun5CM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:dbced1c5-66f3-4d38-9c8b-427bbbc5052d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:ec00967b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87699418191f11f19e7563141e833ce8-20260305
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1873458844; Thu, 05 Mar 2026 22:44:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Mar 2026 13:44:20 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Mar 2026 13:44:20 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@sandisk.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC command
Date: Fri, 6 Mar 2026 13:43:02 +0800
Message-ID: <20260306054419.3816557-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_214426_882322_8A26FED3 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

Only return IRQ_WAKE_THREAD when MCQ and ESI are not enabled
and no UIC command is active. The default UIC command timeout
is 500ms, Using threaded IRQs during an active UIC command
increases the risk of timeout due to possible preemption
by other system IRQs.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 9908375b2f98..6554e1db3343 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7200,8 +7200,12 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
 	struct ufs_hba *hba = __hba;
 	u32 intr_status, enabled_intr_status;
 
-	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
-	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
+	/*
+	 * Handle interrupt in thread if MCQ or ESI is disabled,
+	 * and no active UIC command.
+	 */
+	if ((!hba->mcq_enabled || !hba->mcq_esi_enabled) &&
+	    !hba->active_uic_cmd)
 		return IRQ_WAKE_THREAD;
 
 	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
-- 
2.45.2


