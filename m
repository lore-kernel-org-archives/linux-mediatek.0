Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C53DC5478C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 02:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ps+ctjgSHlaJ48jdpOUAWUiCS3YICM9/AZhDjh4oT8Q=; b=D3jO203J0i5oQ2f02lZM3JeiJg
	vSu8DqFZQUp4TTTdzaRkQmDyxVU4OP7VSBLVeBM2QK63mxnw3cQfgNbAkGETX4eE+LDdNREUuC4nU
	gBFtOrIFZsJl2tk5UCkx3xo5pds7g1JBiIedPh3cqSyyRX0jPFifa52y8QXTfYcBxXM0cbm0ENNZs
	4Kffh/lDbbZflZe8T9optTXPr8PIlQ//pDnSXnWx9vzVTytZNbqVuwd4hFrGADDF573Xsm3k7fhGr
	DfO8WpDrci/eHXLh5qtLDpe1DjrPzgO2w7paL1d8Vwt0FTervxlYxtGA5+PDLVgY58iwwrjfc3mhQ
	77gRWcZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf9Fi-00000007eAw-194Z;
	Wed, 28 Feb 2024 02:00:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf9Ff-00000007e9D-0i0Z;
	Wed, 28 Feb 2024 02:00:56 +0000
X-UUID: 3072be6ed5dd11eea40fa5ac21cdad35-20240227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ps+ctjgSHlaJ48jdpOUAWUiCS3YICM9/AZhDjh4oT8Q=;
	b=se3mPeBIF+PqBgOAxPuFZkNwfjcE8pqrOpefA1S7oaRR6MrD2V8ghgdm6q36NWfIcH6M1qbuvQ3ihY2SEpCmf8RNdzt/CuKrST/mnsusTngh4tV+Fqf9UgAqrvQI12zPllEghGwV2Nx9h0D2KVGjIz+FaxxYNW2JBdGOWlqb/1I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c4b442dc-6170-4720-9584-7ec469dff4d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:6f543d0,CLOUDID:e4876484-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3072be6ed5dd11eea40fa5ac21cdad35-20240227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <qingliang.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 903329782; Tue, 27 Feb 2024 19:00:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Feb 2024 10:00:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Feb 2024 10:00:43 +0800
From: Qingliang Li <qingliang.li@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len
 Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Johan Hovold
	<johan+linaro@kernel.org>, Tony Lindgren <tony@atomide.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Qingliang Li <qingliang.li@mediatek.com>
Subject: [PATCH] PM: wakeirq: fix wake irq warning in system suspend stage
Date: Wed, 28 Feb 2024 10:00:40 +0800
Message-ID: <20240228020040.25815-1-qingliang.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_180055_237180_AEBAED80 
X-CRM114-Status: GOOD (  11.75  )
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

When driver registers the wake irq with reverse enable ordering,
the wake irq will be re-enabled when entering system suspend, triggering
an 'Unbalanced enable for IRQ xxx' warning. The wake irq will be
enabled in both dev_pm_enable_wake_irq_complete() and dev_pm_arm_wake_irq()

To fix this issue, complete the setting of WAKE_IRQ_DEDICATED_ENABLED flag
in dev_pm_enable_wake_irq_complete() to avoid redundant irq enablement.

Fixes: 8527beb12087 ("PM: sleep: wakeirq: fix wake irq arming")
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/base/power/wakeirq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/wakeirq.c b/drivers/base/power/wakeirq.c
index 42171f766dcb..5a5a9e978e85 100644
--- a/drivers/base/power/wakeirq.c
+++ b/drivers/base/power/wakeirq.c
@@ -313,8 +313,10 @@ void dev_pm_enable_wake_irq_complete(struct device *dev)
 		return;
 
 	if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
-	    wirq->status & WAKE_IRQ_DEDICATED_REVERSE)
+	    wirq->status & WAKE_IRQ_DEDICATED_REVERSE) {
 		enable_irq(wirq->irq);
+		wirq->status |= WAKE_IRQ_DEDICATED_ENABLED;
+	}
 }
 
 /**
-- 
2.25.1


