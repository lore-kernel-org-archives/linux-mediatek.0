Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36672EA3F09
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TScqYfHnvAIcJ4R80g7WUaCVr8TpNDnfVY4ZI5GrzMI=; b=ZCK1Ydrs2QYKhLEY8Xk2hLgX0/
	3X73+VOrOeWVdLN8wVTEDrVql4eGvUy/Ett1zOVFuV8PKizp+ACf5Wpv6y4HJXpLEKuLuJDi/fNgI
	RwWeGRlecKk1a6EznkN4mAc8qT655Q/pRiVp4+/BynooXvGAfYyBhIqRw94hU2IwUX02v5UcImVHU
	ms6wYOf/Tr5b23Jirhzwnw8qqQD6zPLm1d4pplPo4higxcsY9bcdRTawcHcLjWyNem9Tgh/j5Xui7
	Z8TtNHNHy8jj3//coAHku3o0k+SghovrD/I0EdbLB/HqV+JoDc6Y9TF4LbxadXD3eGkHHWZH+reEA
	RavXEtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphrf-0000000GZle-3Us4;
	Tue, 10 Feb 2026 07:08:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphrc-0000000GZkg-3RFp
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 07:08:50 +0000
X-UUID: 55327934064f11f1a16f0188aa809bee-20260210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TScqYfHnvAIcJ4R80g7WUaCVr8TpNDnfVY4ZI5GrzMI=;
	b=XrjAN/3Rq1iqapZRmOyGEIo08ogJCdaoHsK6/pFvvALR/7E99Bx+WVuu3tl6U0Qu7nGjcgNFfVXAGb2Nv8SymfZLZCDSIUJm3Xw5gjpkv7TpKXo3TFNm3gCzZ4b5vsg6ch3ylZpxW3exDpf6HhuGi9M4Hm/7MjTBmFaOAeZMn10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:8bfd7c71-3ce5-450f-b9a4-eaf26dc3f0f4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:d77583e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 55327934064f11f1a16f0188aa809bee-20260210
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 114821923; Tue, 10 Feb 2026 00:08:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Feb 2026 15:08:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Feb 2026 15:08:40 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@sandisk.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2 1/2] ufs: core: add debug log for uic command timeout
Date: Tue, 10 Feb 2026 14:41:43 +0800
Message-ID: <20260210070837.1820710-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260210070837.1820710-1-peter.wang@mediatek.com>
References: <20260210070837.1820710-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_230849_111308_AF98484B 
X-CRM114-Status: GOOD (  12.69  )
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

It is difficult to debug when a UIC command timeout occurs
simultaneously with a UIC command complete interrupt.
Currently, we only see the timeout log without any debug
information, making it unclear whether the UFS device failed
to respond or the host entered an incorrect state.
Add a one-line log to cover this situation.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 604043a7533d..ec175a099459 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5564,8 +5564,11 @@ static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
 
 	guard(spinlock_irqsave)(hba->host->host_lock);
 	cmd = hba->active_uic_cmd;
-	if (!cmd)
+	if (!cmd) {
+		dev_err(hba->dev,
+			"No active UIC command. Maybe a timeout occurred?\n");
 		return retval;
+	}
 
 	if (ufshcd_is_auto_hibern8_error(hba, intr_status))
 		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
-- 
2.45.2


