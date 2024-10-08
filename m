Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63217CED273
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HQsDDSAPiB4jU3Vg6ZWxiUW1nADLbDYixnAUJAhUVUw=; b=EOa03KZgeut/rSyGVjQ/iVDtk/
	aqfjzx9p+HM2drbr3iXwy1ZJW5KwvJsBdImNAbff0r6sB6v2YJz8AGjI1TY9Nw7Yn7RZjMWN+kuBr
	gJ1jtm6aBKFZnW2YqARRuM0zf5GVcUqbmEXk5uGzSVfLAWp3qHYklL/9XZc1Ew7D1N26znRpKN4DY
	N/KwlO4pG/Ptvd9P29iv1+1Obvq8svu8gOmnvFHrB9oTvo0bexOVANe9gw2H7U1tOfdmyvEfD5BCJ
	0QANdnUfKSlpsrrQJ6vlOimX9aI03hrN1FpSl4FOdZVBL8Led//A2GFCrHX7xjvsvGJ7zvrtmMIgV
	xF2XX+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4H5-00000004k32-16h6;
	Tue, 08 Oct 2024 07:04:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4Cw-00000004jRC-0lvv;
	Tue, 08 Oct 2024 07:00:35 +0000
X-UUID: f72459fe854211efba0aef63c0775dbf-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HQsDDSAPiB4jU3Vg6ZWxiUW1nADLbDYixnAUJAhUVUw=;
	b=teXj2pPeTbdRJk8/WBpyHTF3mkAVfY1ltU584RUbOShBT+wd/XIbCJ0YGMPPyXi2eI3NUk2v7fPr0W0d/Weeylg7S70cEmE4ABcbX/kChhdAyl4rv0hpjqMN2AUDqqV8CdtqduOfcIXAyHeLsHvk0srozxrVDTsiBCsQKSjtHHc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:fca831b8-237a-4b0f-9d87-89e74e442e29,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:b228ea64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f72459fe854211efba0aef63c0775dbf-20241008
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 59623658; Tue, 08 Oct 2024 00:00:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 00:00:10 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Oct 2024 15:00:10 +0800
From: <ed.tsai@mediatek.com>
To: <peter.wang@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri
 Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Stanley Jhu <chu.stanley@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <chun-hung.wu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] scsi: ufs: ufs-mediatek: configure individual LU queue flags
Date: Tue, 8 Oct 2024 14:59:42 +0800
Message-ID: <20241008065950.23431-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_000034_259619_78D1B76E 
X-CRM114-Status: GOOD (  13.40  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

Previously, ufs vops config_scsi_dev was removed because there were no
users. ufs-mediatek needs it to configure the queue flags for each LU
individually. Therefore, bring it back and customize the queue flag as
we required.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/ufs/core/ufshcd.c       |  3 +++
 drivers/ufs/host/ufs-mediatek.c | 10 ++++++++++
 include/ufs/ufshcd.h            |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7cab103112e1..be50b86269bf 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5253,6 +5253,9 @@ static int ufshcd_device_configure(struct scsi_device *sdev,
 	 */
 	sdev->silence_suspend = 1;
 
+	if (hba->vops && hba->vops->config_scsi_dev)
+		hba->vops->config_scsi_dev(sdev);
+
 	ufshcd_crypto_register(hba, q);
 
 	return 0;
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 9a5919434c4e..0b57623edca5 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1780,6 +1780,15 @@ static int ufs_mtk_config_esi(struct ufs_hba *hba)
 	return ufs_mtk_config_mcq(hba, true);
 }
 
+static void ufs_mtk_config_scsi_dev(struct scsi_device *sdev)
+{
+	struct ufs_hba *hba = shost_priv(sdev->host);
+
+	dev_dbg(hba->dev, "lu %llu scsi device configured", sdev->lun);
+	if (sdev->lun == 2)
+		blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, sdev->reqeust_queue);
+}
+
 /*
  * struct ufs_hba_mtk_vops - UFS MTK specific variant operations
  *
@@ -1809,6 +1818,7 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.op_runtime_config   = ufs_mtk_op_runtime_config,
 	.mcq_config_resource = ufs_mtk_mcq_config_resource,
 	.config_esi          = ufs_mtk_config_esi,
+	.config_scsi_dev     = ufs_mtk_config_scsi_dev,
 };
 
 /**
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index a95282b9f743..800d79dc91fc 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -383,6 +383,7 @@ struct ufs_hba_variant_ops {
 	int	(*get_outstanding_cqs)(struct ufs_hba *hba,
 				       unsigned long *ocqs);
 	int	(*config_esi)(struct ufs_hba *hba);
+	void	(*config_scsi_dev)(struct scsi_device *sdev);
 };
 
 /* clock gating state  */
-- 
2.45.2


