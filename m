Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3D1C88E6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvwXZoaVVI3llVKEiJolksnzD6nYquYciue03eFu2Ec=; b=Ny9eca6e8Amngnev6IPFpT3lIV
	pBJI0geCLAEz47eMW39Tl+Pn7fKjXdZEbI2bzKZG94K9cf6wICy/C7sX+4P4VxwT/iNy/sjkZlX9D
	9o0TdQsINZ4ynmYzlJUAe7J7AeUbR1st3tEUi2wNOBCzL0Ojsmf4HA2x9DmuRYjM4Fxm5uiumN7R5
	JfAAvNVnonMDSx/tx71MkG+ugYdDust2ONYl+4P+USfrSj3GXS1iQydq4p+BP5dSHCI42tL87niCb
	AQ+u2ljEBFMDBuqxeo+quB+zYMbtgdxYSR0VEvLA4MgBJa7VppOxoQSEMTwOYMmKgwZioDX1cF2Ou
	k9YLe4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Pz-00000002pW7-3dAv;
	Mon, 14 Sep 2026 08:52:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Pw-00000002pTY-40SX
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 08:52:02 +0000
X-UUID: 887cc3fcb01911f1afed4741b24580c9-20260914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yvwXZoaVVI3llVKEiJolksnzD6nYquYciue03eFu2Ec=;
	b=B74cx2OaDPQIxIYqhZQAMtWRpCHrhD9yfj23hwiDaxVDN8RBEuh6AXtEYSQDriWvw4Di4pnFYvhd0NCE0L7v2A81DBSWMuWbEZzF6bzbap7B2GqmBaIyXc1y5EANfgLnjrYFjX3GYFZd02fForW+zKO0x4wuI/5rEovHYitF7kM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:98632c6d-1bde-448e-b6b1-a75e19aa5217,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:9986cfe2-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|123|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 887cc3fcb01911f1afed4741b24580c9-20260914
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1889439577; Mon, 14 Sep 2026 01:51:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 16:51:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 16:51:49 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@sandisk.com>, <alim.akhtar@samsung.com>, <bvanassche@acm.org>,
	<santosh.sy@samsung.com>, <h.vinayak@samsung.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v2 2/2] ufs: serialize AHIT register access between sysfs and host driver
Date: Mon, 14 Sep 2026 16:49:25 +0800
Message-ID: <20260914085148.136429-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260914085148.136429-1-peter.wang@mediatek.com>
References: <20260914085148.136429-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_015201_008682_69816AC5 
X-CRM114-Status: GOOD (  18.48  )
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

A race exists between ufshcd_auto_hibern8_update() and
ufs_mtk_pwr_change_notify() when both paths concurrently access
REG_AUTO_HIBERNATE_IDLE_TIMER. Additionally, the static local
variable used to save/restore AHIT in the power change path is
not re-entrant and may hold a stale value if a sysfs write races
with a gear change.

Introduce ahit_mutex and ahit_disable_depth in struct ufs_hba to
serialize AHIT register access. The depth counter tracks how many
host-driver paths have forced AHIT off; sysfs writes are suppressed
while it is non-zero and the register is restored from hba->ahit
only when the last disabler drops it to zero.

Fixes: f5ca8d0c7a63 ("scsi: ufs: host: mediatek: Disable auto-hibern8 during power mode changes")
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c       | 14 +++++++++++++-
 drivers/ufs/host/ufs-mediatek.c | 16 ++++++++++++----
 include/ufs/ufshcd.h            |  8 ++++++++
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 39a4bdafc1af..c54ff35b4196 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4748,7 +4748,17 @@ void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit)
 	if (!pm_runtime_suspended(&hba->ufs_device_wlun->sdev_gendev)) {
 		ufshcd_rpm_get_sync(hba);
 		ufshcd_hold(hba);
-		ufshcd_configure_auto_hibern8(hba);
+		/*
+		 * Serialize with the host driver's AHIT control. Skip the
+		 * register write while the driver has AHIT forced off; the
+		 * driver programs hba->ahit back when it re-enables it.
+		 * Mutex is taken here (not across the rpm calls above) so it
+		 * never blocks a resume that the driver's path may need.
+		 */
+		mutex_lock(&hba->ahit_mutex);
+		if (!hba->ahit_disable_depth)
+			ufshcd_configure_auto_hibern8(hba);
+		mutex_unlock(&hba->ahit_mutex);
 		ufshcd_release(hba);
 		ufshcd_rpm_put_sync(hba);
 	}
@@ -11272,6 +11282,8 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 
 	mutex_init(&hba->wb_mutex);
 
+	mutex_init(&hba->ahit_mutex);
+
 	init_rwsem(&hba->clk_scaling_lock);
 
 	ufshcd_init_clk_gating(hba);
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 814c1b7343b9..b6279edde176 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1507,19 +1507,27 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	int ret = 0;
-	static u32 reg;
 
 	switch (stage) {
 	case PRE_CHANGE:
 		if (ufshcd_is_auto_hibern8_supported(hba)) {
-			reg = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
+			/* Block sysfs AHIT writes while we force AHIT off */
+			mutex_lock(&hba->ahit_mutex);
+			hba->ahit_disable_depth++;
+			mutex_unlock(&hba->ahit_mutex);
 			ufs_mtk_auto_hibern8_disable(hba);
 		}
 		ret = ufs_mtk_pre_pwr_change(hba, dev_req_params);
 		break;
 	case POST_CHANGE:
-		if (ufshcd_is_auto_hibern8_supported(hba))
-			ufshcd_writel(hba, reg, REG_AUTO_HIBERNATE_IDLE_TIMER);
+		if (ufshcd_is_auto_hibern8_supported(hba)) {
+			mutex_lock(&hba->ahit_mutex);
+			/* re-enable only when the last disabler drops off */
+			if (!--hba->ahit_disable_depth)
+				ufshcd_writel(hba, hba->ahit,
+					      REG_AUTO_HIBERNATE_IDLE_TIMER);
+			mutex_unlock(&hba->ahit_mutex);
+		}
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index dfd302f2dc7c..be62165b785e 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1132,6 +1132,14 @@ struct ufs_hba {
 
 	/* Auto-Hibernate Idle Timer register value */
 	u32 ahit;
+	/* Serializes AHIT register access between sysfs and the host driver */
+	struct mutex ahit_mutex;
+	/*
+	 * Nesting count of host-driver paths that have AHIT forced off.
+	 * Non-zero blocks sysfs AHIT writes; AHIT is reprogrammed only when
+	 * the last disabler drops it back to zero. Guarded by ahit_mutex.
+	 */
+	int ahit_disable_depth;
 
 	unsigned long outstanding_tasks;
 	spinlock_t outstanding_lock;
-- 
2.45.2


