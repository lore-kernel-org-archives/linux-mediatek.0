Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA5AC3ABC5
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 May 2025 02:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MKfd8pBOXHAFy3qwu17VLlqq5nJItW8E69HpXZQ5qVk=; b=3H5es2W/8GmkN+N5OEr4YLBbyC
	eVdyMCsYq2dg3MdntTotnVZeHWPHifFLgNpPJTpy7pSxk4KV4JOBMtw9rac1QZtK1hQNemBn5Y8rn
	/9I5GuJiqoVuc2IsXBGK6XfZvoUuewQrTjahRgrGBMz8SNFBlu1oGjbAijjHmyWNEyP8V7js3R6sO
	A7VhGygbLfiyqaPBg+XHmnJH+En9dQfX1P+JUw6heub136QhXdhJB+5KGMw9dTwjTfTX+wxIWqcVo
	Hz5O7b8u4LhsY1uo1xhyREhZmdZP77Xg5vHMEh/LIUKECJXPC2fTBL0B1n7orVkj/t9OZaoMOK/o2
	FemEI6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDJZ-00000002Eaj-3ZgL;
	Fri, 09 May 2025 02:18:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDIH-00000002ESU-27sF
	for linux-mediatek@lists.infradead.org;
	Fri, 09 May 2025 02:16:59 +0000
X-UUID: abaedb762c7b11f08d385d50fb11b32d-20250508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MKfd8pBOXHAFy3qwu17VLlqq5nJItW8E69HpXZQ5qVk=;
	b=rASLwYt+0+U9j1gyeauChZOtej177A/ilrxrZb20Wy84sYvoMxNe6b3qWT9Wmz6WdsyrtuDi8fXZbp0mTuRKA8AF5JHkolXXv26oJxELpiRrpJPG8Hp0p81RpEqxEi5W3DvLZRINTDD+CIw3Ld3OeyvWWUTYVOJgpgJ3xNWcYRM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:894ee398-9d78-42d9-b780-7b2bc6663d0d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:58b55351-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: abaedb762c7b11f08d385d50fb11b32d-20250508
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 310188145; Thu, 08 May 2025 19:16:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 9 May 2025 10:16:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 9 May 2025 10:16:49 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
	<quic_ziqichen@quicinc.com>
Subject: [PATCH v3] ufs: core: change hwq_id type and value
Date: Fri, 9 May 2025 10:16:12 +0800
Message-ID: <20250509021648.412098-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_191657_551931_9DFD0235 
X-CRM114-Status: GOOD (  11.15  )
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

Change the type of hwq_id to u32 because the member id of struct
ufs_hw_queue is u32 (hwq->id) and the trace entry hwq_id is also u32.
Set hwq_id to 0 if mcq is not supported, as SDB mode only supports
one hardware queue.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7735421e3991..14e4cfbcb9eb 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -432,7 +432,7 @@ static void ufshcd_add_command_trace(struct ufs_hba *hba, unsigned int tag,
 	u8 opcode = 0, group_id = 0;
 	u32 doorbell = 0;
 	u32 intr;
-	int hwq_id = -1;
+	u32 hwq_id = 0;
 	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
 	struct scsi_cmnd *cmd = lrbp->cmd;
 	struct request *rq = scsi_cmd_to_rq(cmd);
-- 
2.45.2


