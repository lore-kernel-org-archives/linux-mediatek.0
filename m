Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB96C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 12:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sFjsyP8ZKZS0F9t1VR6XE2dkw5z7AQiMIr8WnQjyVtY=; b=460QFDtqg7XD++aIkZnVczOU7U
	S9pIu/T3IxgCdhrHiqige5BlMLjY4XKz7bfC5wYxpAQoqvTihZIrk9JhsjQOE0pVRbC9HduMt8gQZ
	BykNij8LTFycTQqfDAvXL97gADKRRZWgFuRkUVKm6Mo72Oy/OrToK9EU5CcbtrJiPYokcubRn6TZk
	KIdgD0l5lOw39x1uB9ZN6YZVPy2ULm6PWwOOICT1DVqyD2YKw83kA6vJ9VcIla7xd23Miyv3kAzVG
	DK4nd+yvlcvwvuR+pL8V83RN222iXCHACbDlgTPKXVr+XWflvPNgqFkYukKQGdm4FO+dikEbjbJDG
	u0KQZHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwE3-001HRC-FF; Mon, 24 Oct 2022 12:06:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwDz-001HOX-HW
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 12:06:38 +0000
X-UUID: 5175e53f653e4a61a819ff8152c390d3-20221024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sFjsyP8ZKZS0F9t1VR6XE2dkw5z7AQiMIr8WnQjyVtY=;
	b=efs0JhyieJVELkYHwe9neZdl0pc+/ISG3YNll4VYweOOxZqxXU3KwSVZKl+63mhAil5K+7JBKkLzoMrrwKLRRUnxb6ODCyP1SmvB6rE+hX3E2tKPP6FGHFXPoIu+bLnXDobKj1zP+QAVCoKc0RkZeJaK7DYsLF2yroi7wMGRCjk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:2106f243-d833-44d6-a1c2-576abb09e9e3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:75e4eb6c-89d3-4bfa-baad-dc632a24bca3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5175e53f653e4a61a819ff8152c390d3-20221024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1204399341; Mon, 24 Oct 2022 05:06:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 24 Oct 2022 20:06:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 24 Oct 2022 20:06:04 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v1] ufs: core: print more evt history
Date: Mon, 24 Oct 2022 20:06:02 +0800
Message-ID: <20221024120602.30019-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_050635_609265_3F6FF8A7 
X-CRM114-Status: UNSURE (   8.26  )
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

Some error event is missing in ufshcd_print_evt_hist.
Add print for this error event.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7256e6c43ca6..ed354febed29 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -486,6 +486,9 @@ static void ufshcd_print_evt_hist(struct ufs_hba *hba)
 	ufshcd_print_evt(hba, UFS_EVT_RESUME_ERR, "resume_fail");
 	ufshcd_print_evt(hba, UFS_EVT_SUSPEND_ERR,
 			 "suspend_fail");
+	ufshcd_print_evt(hba, UFS_EVT_WL_RES_ERR, "wlun resume_fail");
+	ufshcd_print_evt(hba, UFS_EVT_WL_SUSP_ERR,
+			 "wlun suspend_fail");
 	ufshcd_print_evt(hba, UFS_EVT_DEV_RESET, "dev_reset");
 	ufshcd_print_evt(hba, UFS_EVT_HOST_RESET, "host_reset");
 	ufshcd_print_evt(hba, UFS_EVT_ABORT, "task_abort");
-- 
2.18.0


