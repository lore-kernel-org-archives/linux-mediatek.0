Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C0CA0EEA
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB/YX4GsAIz1IbnbtiqRVmnhz51HwfzUV8S8YPMqW0Q=; b=z12kZGsd2g4cve4AKUp0T81Ubc
	yWc1ual+/577m1KtyepJ7+5In8Rc/EIhmpq1rB6b2J66l00Ivhj58umDgzdKF4vO0QwONRQPG0Cfl
	dJnGD3HOy32IUC2EpRkM1OOUMCWb//kIfFXdOFomlWb9sjIt+cknIdQrAR1PiHrixC1jvqDXVZCAo
	mW6gcChG23JqJ9e/W8t/DAF0jZibPSj82kv3P7HDgbdlcL9cXippXWKhDAHMP2BquPjQOyVcoM1LJ
	eOOZlGsGNJQ5bXqHiidxYUgkJ1v+s9B4RblkU3dlmHBcfS8EeX7TZrRygldGwjliHFZlAg/zk8x06
	HPzw16vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwJV-00000005BEh-1E1K;
	Fri, 30 Aug 2024 07:44:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwJT-00000005BEN-12AX
	for linux-mediatek@bombadil.infradead.org;
	Fri, 30 Aug 2024 07:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qB/YX4GsAIz1IbnbtiqRVmnhz51HwfzUV8S8YPMqW0Q=; b=FgzU9YixstC7UUUdhtFUix4mA8
	dpaO6jJfN4PJ434ro6s80jd5cY3vrBYBhP2tyQf4XQm3JlT0GDb1a/J/vbzQFiGeOSRIM2koMu6Lx
	ANPtrVkuhN+XYnJQvC5Ny87RQEC5JIH52LXEdWyCmayHUTge/a8T8xqopukdGGT5Xu1NEgmyn0kVT
	NofVMxbVlIY/e2CpFJUmkDTD5rIT9MO5vY7T/6n2MfnQmpqAnLA/JmIixtPEBq27NsB9WiP22KJGe
	Qd4OrCs3nEouumGTPECMCwtwTXYW0qaAOedVPM1fdZjRoMBlem9W1DnxUcuqbjJK0gNNvMixVP5Ld
	f8p1urnw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwJK-0000000BayG-0B8G
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 07:44:49 +0000
X-UUID: b1520a7466a311efba0aef63c0775dbf-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qB/YX4GsAIz1IbnbtiqRVmnhz51HwfzUV8S8YPMqW0Q=;
	b=NqxnmiIdp7+iounzjctNzKY2aE2jg6g5Emoau68kDVpqkSlM62lhaqKcUuRWVm0cTgOXC/KIRzAjlYZh7k5sIcdlyiNbQQLO6MfbOztp9ys+HiiJFc0uj2Tu8H8yajFCGiAFNTZzyXWutWbB5jtjbuGFXdN1eV8Jk8Vj300Sxsk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:ab8c322e-8c32-400f-9438-207f6bdc1d87,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:ca8c0a15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b1520a7466a311efba0aef63c0775dbf-20240830
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 484239719; Fri, 30 Aug 2024 00:44:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 15:44:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 15:44:28 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v1 1/2] ufs: core: fix the issue of ICU failure
Date: Fri, 30 Aug 2024 15:44:25 +0800
Message-ID: <20240830074426.21968-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240830074426.21968-1-peter.wang@mediatek.com>
References: <20240830074426.21968-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_084446_919983_F9BA28D2 
X-CRM114-Status: GOOD (  11.35  )
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

When setting the ICU bit without using read-modify-write,
SQRTCy will restart SQ again and receive an RTC return
error code 2 (Failure - SQ not stopped).

Additionally, the error log has been modified so that
this type of error can be observed.

Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 5891cdacd0b3..afd9541f4bd8 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -570,15 +570,16 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 	writel(nexus, opr_sqd_base + REG_SQCTI);
 
 	/* SQRTCy.ICU = 1 */
-	writel(SQ_ICU, opr_sqd_base + REG_SQRTC);
+	writel(readl(opr_sqd_base + REG_SQRTC) | SQ_ICU,
+		opr_sqd_base + REG_SQRTC);
 
 	/* Poll SQRTSy.CUS = 1. Return result from SQRTSy.RTC */
 	reg = opr_sqd_base + REG_SQRTS;
 	err = read_poll_timeout(readl, val, val & SQ_CUS, 20,
 				MCQ_POLL_US, false, reg);
-	if (err)
-		dev_err(hba->dev, "%s: failed. hwq=%d, tag=%d err=%ld\n",
-			__func__, id, task_tag,
+	if (err || FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg)))
+		dev_err(hba->dev, "%s: failed. hwq=%d, tag=%d err=%d RTC=%ld\n",
+			__func__, id, task_tag, err,
 			FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg)));
 
 	if (ufshcd_mcq_sq_start(hba, hwq))
-- 
2.45.2


