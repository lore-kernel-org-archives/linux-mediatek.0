Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496EBC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1gFY3alioo5hLWRum8LaBv7avS7z7Myd6WGS9UzTTs=; b=4l2tQBOzykhusocINe79YhXJF7
	B/LNJI39Xv1zPWkmNf37B9JWTZoh7JWlMSyoCuaL5oPkJsU0LnKFyNJ8xyJ201eLBoJ9H7JxJNXdj
	KlUVw/7looYIXC+ahW3petknN4+zd2pVNEula7vBrbefJX1ApKmZv2s9GFCKcg5YUkKR+5PXx1N7a
	896t+Wu5RksPBH4Myi1p+TqVKKFyZNsBDVQGB2zr+kVyzpkDRFzF2CuQ+HbTonj34ITNBXpHalYlO
	cfgEhH8OJ0KAbUtZA0agWyKijygmz4EfB5CvENJtTMMT8dxvR9OVS3fqazNvRMuir/Rk/n2Iv9Y1L
	GRXskxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onb1l-008PSz-1p; Wed, 26 Oct 2022 07:40:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onb1d-008PP5-KQ
	for linux-mediatek@lists.infradead.org; Wed, 26 Oct 2022 07:40:36 +0000
X-UUID: 5e566ae2ad9843a39e817e467c963503-20221026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Z1gFY3alioo5hLWRum8LaBv7avS7z7Myd6WGS9UzTTs=;
	b=lBfeCWZz7JEYSQ9cW1BMNq/76yX3C3N131eOxaUlZub0928+dXzwfzM+4DzcCvMkSRNUS4186HHhQ5jjH/GVgKmAwxyGiDqcPzgMPYDeHixwhY0VsEY142GWOi4tQvLmiHaQSfH5TXTkGD2NNkfl7LxMhMaEJpxjRoPhk4wq8EE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:9241cfbf-c9c7-4f54-b5d7-1aec9d2bcaed,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:ebe7b6e4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5e566ae2ad9843a39e817e467c963503-20221026
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <eddie.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 250803138; Wed, 26 Oct 2022 00:40:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 26 Oct 2022 15:39:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 26 Oct 2022 15:39:50 +0800
From: Eddie Huang <eddie.huang@mediatek.com>
To: Asutosh Das <quic_asutoshd@quicinc.com>, <martin.petersen@oracle.com>,
	<stanley.chu@mediatek.com>, <bvanassche@acm.org>,
	<linux-scsi@vger.kernel.org>
CC: <avri.altman@wdc.com>, <liang-yen.wang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <cc.chou@mediatek.com>,
	<powen.kao@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v1 1/2] ufs: core: mcq: Add config_mcq_resource vops
Date: Wed, 26 Oct 2022 15:39:42 +0800
Message-ID: <20221026073943.22111-2-eddie.huang@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20221026073943.22111-1-eddie.huang@mediatek.com>
References: <20221026073943.22111-1-eddie.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_004033_733711_CEB88DDD 
X-CRM114-Status: GOOD (  13.10  )
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

SoCs vendor config MCQ register address resource in
config_mcq_resource vops

Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c     | 3 +++
 drivers/ufs/core/ufshcd-priv.h | 8 ++++++++
 include/ufs/ufshcd.h           | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index b51ba35..1fdb45a 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -173,6 +173,9 @@ static int ufshcd_mcq_config_resource(struct ufs_hba *hba)
 	struct resource *res_mem, *res_mcq;
 	int i, ret = 0;
 
+	if (ufshcd_mcq_vops_config_resource(hba) == 0)
+		return 0;
+
 	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
 
 	for (i = 0; i < RES_MAX; i++) {
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 6e9bec6..2f71b0e 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -257,6 +257,14 @@ static inline int ufshcd_vops_get_outstanding_cqs(struct ufs_hba *hba,
 	return -EOPNOTSUPP;
 }
 
+static inline int ufshcd_mcq_vops_config_resource(struct ufs_hba *hba)
+{
+	if (hba->vops && hba->vops->config_mcq_resource)
+		return hba->vops->config_mcq_resource(hba);
+
+	return -EOPNOTSUPP;
+}
+
 extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /**
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 506fc6e..be323c9 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -339,6 +339,7 @@ struct ufs_hba_variant_ops {
 	int	(*op_runtime_config)(struct ufs_hba *hba);
 	int	(*get_outstanding_cqs)(struct ufs_hba *hba,
 				       unsigned long *ocqs);
+	int	(*config_mcq_resource)(struct ufs_hba *hba);
 };
 
 /* clock gating state  */
-- 
2.9.2


