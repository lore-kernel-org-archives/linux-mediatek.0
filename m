Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84464C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 14:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ayToVL1r+rpvC3lFumntAViOViQ4Kfx9i9nd0SmW/I=; b=PDh+9NkUCRlLaz6GYN4bbbXGEi
	gsyGNXttrffP6Y5HaE79gEnFhI7ozH2tp5KEBeGp6VNrNVktczN35xfAa4mhyYguV2LRMv8sX6hL1
	1xER0oQ8QZK6yVGbrJ2okjEZ3DcDBi3FSGc44gYcX2w4+D07rlftfvTCpU0VezPGKNzXwcjKeGyGd
	EcotehJIztKSmzd6tDlg79syKl5rcgQSfdDi6M0b6hZb32+8TclS+LNGtvodG/SGyGhbKQP6luqzc
	Nw5p3t8NSgv5V78YrAqNKvbiseJU47HiSL9MVsp/mhRJZ7RbkC10DaleGCsGVIotHtrWa0PQxoUmW
	NiOGp7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFytB-00BbOL-Ts; Mon, 25 Jul 2022 14:16:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFyt8-00BbLI-QL
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 14:16:52 +0000
X-UUID: ee24a949a82d4185981ceb62e552da4d-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:abed885b-b757-4f35-a51e-0f3dfcfe8cd3,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:73e6c529-fd69-41f1-91fc-8b8a329d3a88,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ee24a949a82d4185981ceb62e552da4d-20220725
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1284124220; Mon, 25 Jul 2022 07:16:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 21:16:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 25 Jul 2022 21:16:02 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v1] ufs: core: change comment message to popular format
Date: Mon, 25 Jul 2022 21:15:58 +0800
Message-ID: <20220725131558.13219-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="N"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_071650_881000_909C156E 
X-CRM114-Status: GOOD (  11.67  )
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

Some editor cannot display ‘0’ ‘1’ in correct format.
Change it to '0' '1' for most editor can display.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c7b337480e3e..4ffb344bcb46 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -760,14 +760,14 @@ static inline void ufshcd_utrl_clear(struct ufs_hba *hba, u32 mask)
 	 * From the UFSHCI specification: "UTP Transfer Request List CLear
 	 * Register (UTRLCLR): This field is bit significant. Each bit
 	 * corresponds to a slot in the UTP Transfer Request List, where bit 0
-	 * corresponds to request slot 0. A bit in this field is set to ‘0’
+	 * corresponds to request slot 0. A bit in this field is set to '0'
 	 * by host software to indicate to the host controller that a transfer
 	 * request slot is cleared. The host controller
 	 * shall free up any resources associated to the request slot
-	 * immediately, and shall set the associated bit in UTRLDBR to ‘0’. The
+	 * immediately, and shall set the associated bit in UTRLDBR to '0'. The
 	 * host software indicates no change to request slots by setting the
-	 * associated bits in this field to ‘1’. Bits in this field shall only
-	 * be set ‘1’ or ‘0’ by host software when UTRLRSR is set to ‘1’."
+	 * associated bits in this field to '1'. Bits in this field shall only
+	 * be set '1' or '0' by host software when UTRLRSR is set to '1'."
 	 */
 	ufshcd_writel(hba, ~mask, REG_UTP_TRANSFER_REQ_LIST_CLEAR);
 }
-- 
2.18.0


