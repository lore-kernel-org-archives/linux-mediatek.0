Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA17BD0BB4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 01:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3CpmCRaf0iN6t3tO+rXWbvSp6h4e8oWCGaYzYX07O2A=; b=1W+16qc7o3vatUW/idTC5JbHNi
	eLtigv/NKgh6C0VqkvBaUMRK/svcDz/SmlE/Nv2mwx1CDQhIiUqL77aJCR7REAQ02NSOBBxs5SitX
	avoOoojggWh/n8Mcpp7Jl6ewqUH16NgSj03cxA00ejw/3CWyaG6pNswct9l/283WWRqzt4/J/lZZo
	UhU/H+yT2hA+vZcWxEWjLT++v5uxzcjiKe9pd5qz7oKexDoc9zZWsNSPQSj0FKYWQTNf7S3tInoag
	qYOoh3XovwoxvDNiO5G5EHeRm9H2S2Aox+66A12WtDTIbMJbeSnHyjqzerlKexw076z2NTeFvVQJb
	Gjek3G3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3n46-0000000GT5q-3i81;
	Thu, 24 Oct 2024 01:55:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3n43-0000000GT57-2Xjx
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 01:55:04 +0000
X-UUID: f8b36c5091aa11ef9048ed6ed365623b-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3CpmCRaf0iN6t3tO+rXWbvSp6h4e8oWCGaYzYX07O2A=;
	b=Z0awVBZks7GuVW/SHkBi3mRApiP49nHwGW4yll79KuZnr/qlvqakGKtjlNdfLrqR9qkOMBAOAr50l0IiJbI2/1JqCfNOcnFb5ICOKmk3WukZFEGrSpwN4//RRRNEeduHWVto93JtZnrw0i77p2DfObmsvHqSxPgHuiEnAMUo5+A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:b99bf87b-1b3c-4046-97dc-cf76f9dfeeec,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0fcdc3,CLOUDID:e25c042e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f8b36c5091aa11ef9048ed6ed365623b-20241023
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1020648889; Wed, 23 Oct 2024 18:54:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 18:54:55 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 09:54:55 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
	<beanhuo@micron.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v2] ufs: core: fix another deadlock when rtc update
Date: Thu, 24 Oct 2024 09:54:53 +0800
Message-ID: <20241024015453.21684-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_185503_753662_948BB822 
X-CRM114-Status: GOOD (  11.20  )
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

When ufshcd_rtc_work calls ufshcd_rpm_put_sync and the pm's
usage_count is 0, it will enter the runtime suspend callback.
However, the runtime suspend callback will wait to flush
ufshcd_rtc_work, causing a deadlock.
Replacing ufshcd_rpm_put_sync with ufshcd_rpm_put can avoid
the deadlock.

Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
Cc: <stable@vger.kernel.org> #6.11.x
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a63dcf48e59d..f5846598d80e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8219,7 +8219,7 @@ static void ufshcd_update_rtc(struct ufs_hba *hba)
 
 	err = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR, QUERY_ATTR_IDN_SECONDS_PASSED,
 				0, 0, &val);
-	ufshcd_rpm_put_sync(hba);
+	ufshcd_rpm_put(hba);
 
 	if (err)
 		dev_err(hba->dev, "%s: Failed to update rtc %d\n", __func__, err);
-- 
2.18.0


