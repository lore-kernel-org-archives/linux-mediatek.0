Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8E5C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 08:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KCWoOkADGi3pf16iXii6gF1epRUY5KMhPNsP3Vz+1tk=; b=dwhr9aRJRJhCyxgEkJBo+Ykkj8
	HVSPZ4yd0lYNkKSjl0ZOcm2GlOTr6VGPJilKnQXplSc01NbSLByLHo05TkIVRWqDK1InmNT7eoaZr
	iwhrt/DT+gcE5Wk08N0suXaddiMr0hAF6LOjhBoYFEco7WsNDTKHid2mhDVjEPmC1AiGfRIiBQwG2
	IK+RPZ1BTTnjLXGIlpXj72gbX0cgevinSB1NEsgOHhF79a1hcKfjZhdrY5EaLJZt/vgOUSV+IaNwI
	5tIZFG8QsSJUQ/5LR9lRdMwGgtITV+lWCI9ct+v3kjmLsFrgj5JR3HsyD4dAzekfyy9wG6G1HDh2S
	isjM8Ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy6Xi-006sgd-3B;
	Wed, 01 Nov 2023 08:25:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy6Xe-006sg4-0D;
	Wed, 01 Nov 2023 08:25:37 +0000
X-UUID: 374416fc789011ee9b7791016c24628a-20231101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KCWoOkADGi3pf16iXii6gF1epRUY5KMhPNsP3Vz+1tk=;
	b=hK5vA88zhgciR6/n5SAyoEAuCOWEF8Cz10S+YZrG79UQx+3A9KeRKkdGfTWCQTs416K3VN08RCsp9Ha7fVJSRaFzNWPEtYZhLvJmP8MGly9Ln6rMCoZ8T7qlsYhNddzxtzxkbx8YkvM9nA/S3oeyA5MG19s3jy6WleTxImGdiVQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:5173933d-7f24-42e2-abe6-88bed26c8dcc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:df272572-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 374416fc789011ee9b7791016c24628a-20231101
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <naomi.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1492770950; Wed, 01 Nov 2023 01:25:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 1 Nov 2023 16:25:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 1 Nov 2023 16:25:26 +0800
From: <naomi.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<casper.li@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>
Subject: [PATCH v2 1/1] ufs: core: Expand MCQ queue slot to DeviceQueueDepth + 1
Date: Wed, 1 Nov 2023 16:24:00 +0800
Message-ID: <20231101082402.20856-1-naomi.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.647600-8.000000
X-TMASE-MatchedRID: PwZ81m9fkLaip6xhGipIWeE86+k9uTZHm7HdiLHHK2fDTXM3VzSaIq5F
	Is0KOiYRIV4u8YKdeKsO1mVtY5XA0K+/EguYor8cFEUknJ/kEl5jFT88f69nG/oLR4+zsDTt9xS
	3mVzWUuCMx6OO8+QGvqyt7lbAoL3b1b5ciGqgyyK4b9vVA7cUDFBSi7IIue1t1wsfMy1ANRCOCM
	KUG2SbSV6NqXp1TIWNF6B/icpS7PJfNYyP36YXk3mVKZusLp922v9OjYWA2uMMswg45VMfPadst
	5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.647600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 61078AB8541BEB98FED27B874E254886E6683CAA7E4EC8BE8F5C84142B73FAFC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_012534_111770_74469BB9 
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

From: Naomi Chu <naomi.chu@mediatek.com>

Allow UFSHCI 4.0 controllers to fully utilize MCQ queue slots.

Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 2ba8ec254dce..5c75ab9d6bb5 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -436,7 +436,7 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 
 	for (i = 0; i < hba->nr_hw_queues; i++) {
 		hwq = &hba->uhq[i];
-		hwq->max_entries = hba->nutrs;
+		hwq->max_entries = hba->nutrs + 1;
 		spin_lock_init(&hwq->sq_lock);
 		spin_lock_init(&hwq->cq_lock);
 		mutex_init(&hwq->sq_mutex);
-- 
2.18.0


