Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE08CC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHQfDfVAG+zH+Zezl57mlF3FkhhDLa4SwRr4U7LlRF0=; b=HIpUMrsUh3ZMnWo0fFER4HSRTi
	nFFc5qJxBJ+z22rjMoyoLHGUO6v3MAVXWfYaNVy0KDhrxgonRtP1rZ/3sXxZtV1WOEm13+xGlNiFg
	dldejA3jiUcYOGYRTVM09OJiPk4uGVypT9uzYI0eO1Ioftdx65dmfalT/ZGz+9sa/ZSVEia2mISHg
	XhUwY9KaJjq6RzP8O7N8qRF+hri9eG76pGzOggiTFMNGkcqpzfbsHE24Gn0Bbq9tYJbYmR1IijbiG
	EPSLCc0tVNUhA9YL0Qjcan/p2nwRYeqCMGi/tmQWEoRKBWl7dwHnKvtOynCg4DusBsCEwzhaDwG9r
	B1QUc6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shREq-0000000GFdO-0tYl;
	Fri, 23 Aug 2024 10:09:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRD1-0000000GF3l-2E7O
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 10:07:56 +0000
X-UUID: 8c917b8c613711efb3adad29d29602c1-20240823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BHQfDfVAG+zH+Zezl57mlF3FkhhDLa4SwRr4U7LlRF0=;
	b=bG9VRaXjDU2agL2JNvJ7ue5OewAsjAgX5CapZ+AdPvEcXshNV7Bry9RA2qyxfubVaydFPci3cSsVBruXAZxq4KcPqNrribw7irCnnc9LQJhPlcSk9SzohQEoDcOAqi+rfirw7lGV95a3VTrNRKUTVvfTI2hb2kqDZ73KAUlKt0M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:65854bc0-e9dc-4318-b074-204d3904c03a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1bf3af14-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8c917b8c613711efb3adad29d29602c1-20240823
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 195863055; Fri, 23 Aug 2024 03:07:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 23 Aug 2024 03:07:10 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 23 Aug 2024 18:07:09 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v1 2/2] ufs: core: force reset after mcq abort all
Date: Fri, 23 Aug 2024 18:07:07 +0800
Message-ID: <20240823100707.6699-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240823100707.6699-1-peter.wang@mediatek.com>
References: <20240823100707.6699-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_030755_580143_0DB33400 
X-CRM114-Status: GOOD (  10.34  )
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

In mcq mode gerneal case, cq (head/tail) poniter is same as
sq pointer (head/tail) if the hwq is empty.

But if command send to device and abort it,
no response return and cq point will less than sq.
In this case will have unpredictable error.
This patch force reset for this case.

Below is error log
[   34.976612][    C3] ufshcd-mtk 112b0000.ufshci: OCS error from controller = 3 for tag 19

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4bcd4e5b62bd..d9ef8f0279da 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6519,6 +6519,8 @@ static bool ufshcd_abort_all(struct ufs_hba *hba)
 	/* Complete the requests that are cleared by s/w */
 	ufshcd_complete_requests(hba, false);
 
+	if (is_mcq_enabled(hba))
+		return true;
 	return ret != 0;
 }
 
-- 
2.45.2


