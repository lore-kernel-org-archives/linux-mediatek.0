Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54328C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ai6R3h3Gt7He0ZTgxGjiKPub5Kfaf2GdPE7RG+XypA0=; b=uDLQPGDxACu9WE6ypNihaedew3
	CmBJRM2/dvziR9miZ51Lu4UQSgX9kwRcsXCY0G/kpPTINNce+R5K2ztbRSh8GvyLSQKZjdrV4MT8E
	HUTqzEcZIzyI5K5tfixQ0Pem5q3gQmXIf/hjUHEQUIaViTADc7Zthqt2+gJp8PlEWj1KryRCaVtUI
	v1nWuBaQ76l5dkZfhgwkLw3zT8NgCSKNWuYz42jFiu9/s7Aj/PG20HFFjA0bluiRFD5FdYVtXw52Q
	3SLjtC+IhXaJmi8a5Wkuyn5zipM5xQYOmo2XqcVMLg6KJK10i2sXzlSgCv9m8Rt4ruK19Lu+kivCh
	yYjQzFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6sO-00E1DY-11;
	Tue, 28 Mar 2023 10:48:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6sM-00E1CY-0R;
	Tue, 28 Mar 2023 10:48:27 +0000
X-UUID: 0f86e684cd5611ed8687db9d93187ff1-20230328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ai6R3h3Gt7He0ZTgxGjiKPub5Kfaf2GdPE7RG+XypA0=;
	b=YVcvFOqzp1V1eh/b4ox0CmD+Z9rn26O6g/cy5ifGLPDsQCbmY9zuKPgEvKTOHpKmbR2oX+kI32FKcSt+kSXrZ3S689FQph9mLOAPOWcRwiW8z83oznWeOPO5IfbHduhk0UdLo7S4jQgXAI2OdW85Igw78qtzbehI+GgV0O0eMLs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:35c5216e-a407-4a1c-86a1-8694d82da458,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:974a9db4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 0f86e684cd5611ed8687db9d93187ff1-20230328
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1045651206; Tue, 28 Mar 2023 03:48:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 28 Mar 2023 18:38:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 28 Mar 2023 18:38:19 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>, <mason.zhang@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>
Subject: [PATCH 1/2] scsi: ufs: core: Add host quirk UFSHCD_QUIRK_MCQ_BROKEN_INTR
Date: Tue, 28 Mar 2023 18:37:52 +0800
Message-ID: <20230328103801.11198-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_034826_190826_2DD960D8 
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

Quirk UFSHCD_QUIRK_MCQ_BROKEN_INTR is introduced for plaforms that
implement different interrupt topology from UFSHCI 4.0 spec.
Some platform raise per hw queue interrupt in addition to
CQES (traditional) when ESI is disabled.

Enable this quirk will disable CQES and use only per hw queue
interrupt.

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 8 ++++++--
 include/ufs/ufshcd.h      | 7 +++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index acae4e194ec4..1e1271aca1f2 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8493,11 +8493,15 @@ static int ufshcd_alloc_mcq(struct ufs_hba *hba)
 static void ufshcd_config_mcq(struct ufs_hba *hba)
 {
 	int ret;
-
+	u32 intrs;
 	ret = ufshcd_mcq_vops_config_esi(hba);
+
 	dev_info(hba->dev, "ESI %sconfigured\n", ret ? "is not " : "");
 
-	ufshcd_enable_intr(hba, UFSHCD_ENABLE_MCQ_INTRS);
+	intrs = (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_INTR) ?
+		(UFSHCD_ENABLE_MCQ_INTRS & ~MCQ_CQ_EVENT_STATUS) : UFSHCD_ENABLE_MCQ_INTRS;
+
+	ufshcd_enable_intr(hba, intrs);
 	ufshcd_mcq_make_queues_operational(hba);
 	ufshcd_mcq_config_mac(hba, hba->nutrs);
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 25aab8ec4f86..7bb9e1a17154 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -616,6 +616,13 @@ enum ufshcd_quirks {
 	 * to reinit the device after switching to maximum gear.
 	 */
 	UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH       = 1 << 19,
+
+	/*
+	 * Some platform raises interrupt (per queue) in addition to
+	 * CQES (traditional) when ESI is disabled.
+	 * Enable this quirk will disable CQES and use per queue interrupt.
+	 */
+	UFSHCD_QUIRK_MCQ_BROKEN_INTR			= 1 << 20,
 };
 
 enum ufshcd_caps {
-- 
2.18.0


