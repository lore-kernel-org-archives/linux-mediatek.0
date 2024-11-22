Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686AAE65D10
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 02:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yR4nQ8FcC5S0oePaY8aJ51ztZct7g8GnoM20tznO0Mw=; b=tQfvJL/8LFfHvim7r9ZGF4HLed
	0A4dnAzaAZ0ND5qWlFFPulZXtopEFPZQAbtNOr4GHej0k7C1qgxVO76q1nga7EI4jR9dUvk2H50kf
	gU0dRo24An7iTj/hVq2bEOcvym3NxjpU9UBxlLf+xFrlLD42SgQIWhsO2S5LjuvK9Embpd4gy3LzM
	wGYm9pxOo3GjMP/enG38XcRvrojCjXTaPcmD6Lu5gvgScBMOE7TfCd9kn0VmEPFVbnw31Jq3MY5di
	VRvYOslZ+6E7PHDJPSHSw3N1QFHnChX5dRohNcM9Hd/PwWolo3Ux8qNzIEkhxkVTpCUpKsWFHkRFm
	6JB9Pgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEJk8-00000001U2r-1t3S;
	Fri, 22 Nov 2024 02:50:00 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEJk4-00000001U2M-3R6F
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 02:49:59 +0000
X-UUID: 6fd745bca87c11ef82ff63e91e7eb18c-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yR4nQ8FcC5S0oePaY8aJ51ztZct7g8GnoM20tznO0Mw=;
	b=DZJyjhwEtmiOo/jZz6dJyo3rKGz+kR0DJl3DWuqyHHiXx4aXdRBd1lJbIZwf0BoEC+0KA9PvrSvh7MdqZAuj59GLJSA39V+t38t58YlMrMQQ1VHT3CYHZ45v5WxiWJnFJoLLMqYoUCtge4uB+ec2qWf5o43dkBEj73C60NBTXtM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:2847685a-525d-48fd-9462-9a34754b5230,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:464815b,CLOUDID:887435b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6fd745bca87c11ef82ff63e91e7eb18c-20241121
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2054158646; Thu, 21 Nov 2024 19:49:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 10:49:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 10:49:45 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
	<draviv@codeaurora.org>, <stable@vger.kernel.org>
Subject: [PATCH v2] ufs: core: add missing post notify for power mode change
Date: Fri, 22 Nov 2024 10:49:43 +0800
Message-ID: <20241122024943.30589-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_184956_870572_0758E43B 
X-CRM114-Status: GOOD (  14.16  )
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

When the power mode change is successful but the power mode
hasn't actually changed, the post notification was missed.
Similar to the approach with hibernate/clock scale/hce enable,
having pre/post notifications in the same function will
make it easier to maintain.

Additionally, supplement the description of power parameters
for the pwr_change_notify callback.

Fixes: 7eb584db73be ("ufs: refactor configuring power mode")
Cc: stable@vger.kernel.org #6.11.x
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c |  7 ++++---
 include/ufs/ufshcd.h      | 10 ++++++----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index abbe7135a977..814402e93a1e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4651,9 +4651,6 @@ static int ufshcd_change_power_mode(struct ufs_hba *hba,
 		dev_err(hba->dev,
 			"%s: power mode change failed %d\n", __func__, ret);
 	} else {
-		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, NULL,
-								pwr_mode);
-
 		memcpy(&hba->pwr_info, pwr_mode,
 			sizeof(struct ufs_pa_layer_attr));
 	}
@@ -4682,6 +4679,10 @@ int ufshcd_config_pwr_mode(struct ufs_hba *hba,
 
 	ret = ufshcd_change_power_mode(hba, &final_params);
 
+	if (!ret)
+		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, NULL,
+					&final_params);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ufshcd_config_pwr_mode);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 3f68ae3e4330..1db754b4a4d6 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -308,7 +308,9 @@ struct ufs_pwr_mode_info {
  *                       to allow variant specific Uni-Pro initialization.
  * @pwr_change_notify: called before and after a power mode change
  *			is carried out to allow vendor spesific capabilities
- *			to be set.
+ *			to be set. PRE_CHANGE can modify final_params based
+ *			on desired_pwr_mode, but POST_CHANGE must not alter
+ *			the final_params parameter
  * @setup_xfer_req: called before any transfer request is issued
  *                  to set some things
  * @setup_task_mgmt: called before any task management request is issued
@@ -350,9 +352,9 @@ struct ufs_hba_variant_ops {
 	int	(*link_startup_notify)(struct ufs_hba *,
 				       enum ufs_notify_change_status);
 	int	(*pwr_change_notify)(struct ufs_hba *,
-					enum ufs_notify_change_status status,
-					struct ufs_pa_layer_attr *,
-					struct ufs_pa_layer_attr *);
+				enum ufs_notify_change_status status,
+				struct ufs_pa_layer_attr *desired_pwr_mode,
+				struct ufs_pa_layer_attr *final_params);
 	void	(*setup_xfer_req)(struct ufs_hba *hba, int tag,
 				  bool is_scsi_cmd);
 	void	(*setup_task_mgmt)(struct ufs_hba *, int, u8);
-- 
2.18.0


