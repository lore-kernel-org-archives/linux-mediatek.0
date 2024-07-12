Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B999C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MyCBn5S/+LNlF19z+lz6uWnF1OmIIW8AgbMQY0sxCtA=; b=gZXyoJX9tdiVoaCHuJtx3pm5nm
	IMms19JJieoHd1y92jUg/Mv6ghrctl5hnpZSStxdn+5TBKA9weDWPiyHIa5Idf85Rb5Y2x9ktMVp1
	RbUKgVqIyrB47B8F5NWSe5MaUOLoQqTIGnym7LeCtr8KH9k9n5c7joI6gNrJ4D0gpdbuL4hugJt8W
	PSDH1gVV7yid71Fr+YsHfl7TqU9Z3/ixMmIiv9KWoRoWDCbQFno1GvXV49LQo4qFmsiGSLPACN54f
	V525Dxha8S7RyrPcdSI6gN14K/ftgPYTrS00bcY+DVP/moSltlZiYug4whsD3VZoNeBLRXf8uL51Q
	Zofswnfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCoy-0000000H9p0-2TbS;
	Fri, 12 Jul 2024 09:44:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCow-0000000H9oV-0ihF
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 09:44:07 +0000
X-UUID: 449ee7a8403311ef955bff358274dad2-20240712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MyCBn5S/+LNlF19z+lz6uWnF1OmIIW8AgbMQY0sxCtA=;
	b=biECPPSvytG0cyp2232u2e9tFopg/mM8drw1gRo6q8pDc1r5yuxI5bBgPZ1Mw63pMyeb6yfds8qfW7IVpaKJ5cvaybG0L/1fyhOl0SxgkAvQcn+dqo4oMbvLg7t/xYP6Ik4IlCqwCrKEbksJzdJp+hP2eTteYpORMb96Tj8Td9I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:bbcbf333-3800-436a-9597-7d4735d210a8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:2f5d610d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 449ee7a8403311ef955bff358274dad2-20240712
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877019821; Fri, 12 Jul 2024 02:44:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jul 2024 02:43:58 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jul 2024 17:43:58 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>, <beanhuo@micron.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v1] ufs: core: fix deadlock when rtc update
Date: Fri, 12 Jul 2024 17:43:55 +0800
Message-ID: <20240712094355.21572-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_024406_245306_0DA18EF4 
X-CRM114-Status: GOOD (  12.56  )
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

Three have deadlock when runtime suspend wait flush rtc work,
and rtc work call ufshcd_rpm_put_sync to wait runtime resume.

Here is deadlock backtrace
kworker/0:1     D 4892.876354 10 10971 4859 0x4208060 0x8 10 0 120 670730152367
ptr            f0ffff80c2e40000 0 1 0x00000001 0x000000ff 0x000000ff 0x000000ff
<ffffffee5e71ddb0> __switch_to+0x1a8/0x2d4
<ffffffee5e71e604> __schedule+0x684/0xa98
<ffffffee5e71ea60> schedule+0x48/0xc8
<ffffffee5e725f78> schedule_timeout+0x48/0x170
<ffffffee5e71fb74> do_wait_for_common+0x108/0x1b0
<ffffffee5e71efe0> wait_for_completion+0x44/0x60
<ffffffee5d6de968> __flush_work+0x39c/0x424
<ffffffee5d6decc0> __cancel_work_sync+0xd8/0x208
<ffffffee5d6dee2c> cancel_delayed_work_sync+0x14/0x28
<ffffffee5e2551b8> __ufshcd_wl_suspend+0x19c/0x480
<ffffffee5e255fb8> ufshcd_wl_runtime_suspend+0x3c/0x1d4
<ffffffee5dffd80c> scsi_runtime_suspend+0x78/0xc8
<ffffffee5df93580> __rpm_callback+0x94/0x3e0
<ffffffee5df90b0c> rpm_suspend+0x2d4/0x65c
<ffffffee5df91448> __pm_runtime_suspend+0x80/0x114
<ffffffee5dffd95c> scsi_runtime_idle+0x38/0x6c
<ffffffee5df912f4> rpm_idle+0x264/0x338
<ffffffee5df90f14> __pm_runtime_idle+0x80/0x110
<ffffffee5e24ce44> ufshcd_rtc_work+0x128/0x1e4
<ffffffee5d6e3a40> process_one_work+0x26c/0x650
<ffffffee5d6e65c8> worker_thread+0x260/0x3d8
<ffffffee5d6edec8> kthread+0x110/0x134
<ffffffee5d616b18> ret_from_fork+0x10/0x20

Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
Cc: <stable@vger.kernel.org> 6.6.x

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 46433ecf0c4d..bfcf2d468b5e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8188,8 +8188,15 @@ static void ufshcd_rtc_work(struct work_struct *work)
 
 	hba = container_of(to_delayed_work(work), struct ufs_hba, ufs_rtc_update_work);
 
-	 /* Update RTC only when there are no requests in progress and UFSHCI is operational */
-	if (!ufshcd_is_ufs_dev_busy(hba) && hba->ufshcd_state == UFSHCD_STATE_OPERATIONAL)
+	 /*
+	  * Update RTC only when
+	  * 1. there are no requests in progress
+	  * 2. UFSHCI is operational
+	  * 3. pm operation is not in progress
+	  */
+	if (!ufshcd_is_ufs_dev_busy(hba) &&
+	    hba->ufshcd_state == UFSHCD_STATE_OPERATIONAL &&
+	    !hba->pm_op_in_progress)
 		ufshcd_update_rtc(hba);
 
 	if (ufshcd_is_ufs_dev_active(hba) && hba->dev_info.rtc_update_period)
-- 
2.18.0


