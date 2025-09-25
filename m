Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF96CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t6Yl0F3CBWt6RVv26a4kHnOE9hsWbU7MfM6c5bWgKbk=; b=YTsnmfd/J0s0dQr89u3487Keyp
	vMQD7hXl8sf1YHlEkunjt1c1Zz+lEEKU/oBklt7/zm05VhhdbnH3GR2d8W77/ogKB5zcXT/tWV+Zk
	8bdkdNEhFejc+75PuKj23lHyji+9tQyXCEPaPp7zCTIUiYb1q+3kPne6NCaxhW/y+N1ZoeJOoU5nz
	+g6XeFc0oaU6kfYZYvbRAghJlzm4L11jpamz6mJ2Bt4Q/qYZj0aru4dKrvK3XONuerL8EPArLhx8l
	rid1RACO2rLUfNcfWogQDJ9M25ysI5wcxWYApGWjp2oQS0pAp1DN7K7ICEh2NgX2YyIGn3s+7O/Ah
	ifNlRz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1j9P-000000082vu-0ttw;
	Thu, 25 Sep 2025 10:24:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1j9M-000000082tb-1ckG
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 10:24:33 +0000
X-UUID: ce6ae6dc99f911f09f706fa2197c6ceb-20250925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=t6Yl0F3CBWt6RVv26a4kHnOE9hsWbU7MfM6c5bWgKbk=;
	b=DTq6BLCP1HkzNeYg4mHf7lnhRJpm9WZvG1gouUffmA4/WKEYz7RslTvB/KQQoHaP+dMpBGzKhZxqW1bAKCjda/1Cxi83ooScLZYBLDKOKjftesQ593o3i7yotQmOiqa6Z/PZ31ndIugCZg1cBY/TMUfgKbQFzrLMUNKB0Yx2Ecw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c4f884f1-ece3-4b04-8db8-6958522c48c8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:98b5ace9-2ff9-4246-902c-2e3f7acb03c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ce6ae6dc99f911f09f706fa2197c6ceb-20250925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 300769345; Thu, 25 Sep 2025 03:24:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 25 Sep 2025 18:24:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 25 Sep 2025 18:24:21 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2] ufs: core: Fix runtime suspend error deadlock
Date: Thu, 25 Sep 2025 18:22:25 +0800
Message-ID: <20250925102420.3553715-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_032432_431093_DF9B3A1A 
X-CRM114-Status: UNSURE (   9.25  )
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

Resolve the deadlock issue during runtime suspend when an
error triggers the error handler. Prevent the deadlock
by checking pm_op_in_progress and performing a quick recovery.
This approach ensures that the error handler does not wait
indefinitely for runtime PM to resume, allowing runtime
suspend to proceed smoothly.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Tested-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufshcd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 88a0e9289ca6..8185a7791923 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6681,6 +6681,14 @@ static void ufshcd_err_handler(struct work_struct *work)
 	}
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
+	ufshcd_rpm_get_noresume(hba);
+	if (hba->pm_op_in_progress) {
+		ufshcd_link_recovery(hba);
+		ufshcd_rpm_put(hba);
+		return;
+	}
+	ufshcd_rpm_put(hba);
+
 	ufshcd_err_handling_prepare(hba);
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
-- 
2.45.2


