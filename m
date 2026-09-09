Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC91C79F8C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 09:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iP/g9ahtWFz32AWQSZf1e2PFs3q6pndlDLw358dWbM4=; b=NyAnfGujOmPzk8ZEa52yhBotph
	581zxIpuaOarfMEuL0PxwQo253rdiDAMkYr9TV5JHGt+wA5+ovSlJpmh/UhCSwOrjOWDcUSjipF4n
	4Kf6ra4J9hO2i5RVpTw3pkh9oHtM7iEnwoC2ZWiWGjxWYC48QtUE5+f2FUxn+CXjcje2ZyKZFOywv
	IyVMKv/swVIwZUATCC2UI+8V+Qpeu3ZpC02lJaa0OeBls+uMBvB9XFMANPCGx6KdV+umDbCV4caDk
	5IvFnh1cnoZFbfuvKSso8xcsObAWQ39KJqPCyKfgs7cTtzOuUsfCJJsMcA/fiWbI6WBctfjiGECNF
	5iCvkNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EL8-0000000BFp7-3Asf;
	Wed, 09 Sep 2026 09:11:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EL6-0000000BFo6-2HjW
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 09:11:33 +0000
X-UUID: 7026b6bcac2e11f1acbe4559397dec65-20260909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iP/g9ahtWFz32AWQSZf1e2PFs3q6pndlDLw358dWbM4=;
	b=Zj1l9Vgolz82Nxja95y/DMZOyVOA0UZNiZ4+hNlhVq48h3RKuOFBAPttIW/sa2e5TX+ZuV4LrI41FZ1T9OUmDs26C6rPM0AJdc3vID0qPEF0fztQCvByORr2FztTxxdRiINv6EU1eLUk2JIXK/f2YtpFbwDAWD+1VQjv3eLvcs0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:48eb162b-591b-4486-8fbc-05c0ab5a78f5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:9b21b3f5-c9bd-4ff5-a126-6b6a0f326815,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7026b6bcac2e11f1acbe4559397dec65-20260909
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <naomi.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1832478752; Wed, 09 Sep 2026 02:11:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 9 Sep 2026 17:11:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 9 Sep 2026 17:11:25 +0800
From: Naomi Chu <naomi.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <mkp@kernel.org>, <avri.altman@sandisk.com>,
	<alim.akhtar@samsung.com>, <James.Bottomley@HansenPartnership.com>,
	<bvanassche@acm.org>
CC: <wsd_upstream@mediatek.com>, <naomi.chu@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ed.tsai@mediatek.com>
Subject: [PATCH v1] scsi: ufs: core: Hold a clock reference across the probe
Date: Wed, 9 Sep 2026 17:10:45 +0800
Message-ID: <20260909091045.1134956-1-naomi.chu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_021132_595316_75DB6535 
X-CRM114-Status: GOOD (  16.48  )
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

Clock gating becomes possible as soon as ufshcd_init_clk_gating() has
run, and from that point on the probe keeps accessing host registers
without ever taking a clock reference. This has been safe only because
of the state check in __ufshcd_release(): gate_work is not queued
unless hba->ufshcd_state is UFSHCD_STATE_OPERATIONAL, and the promotion
to that state used to happen after the last register access of the
probe, at the end of ufshcd_probe_hba().

That is fragile: it only works while the promotion happens after the
register accesses. Commit a390e6677f41 ("scsi: ufs: core: Expand the
ufshcd_device_init(hba, true) call") changed that ordering by moving
the promotion into ufshcd_init(), which schedules ufshcd_async_scan()
afterwards. ufshcd_probe_hba() therefore now runs with the state
already promoted, and it accesses host registers without holding a
clock reference:

 - on hosts with UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH it calls
   ufshcd_hba_stop() and ufshcd_hba_enable() before
   ufshcd_device_init() sets the state back to UFSHCD_STATE_RESET, and
   both read REG_CONTROLLER_ENABLE, so gated clocks stall there instead
   of just losing a write.
 - it ends with an ufshcd_configure_auto_hibern8() write, which its
   other callers do take a clock reference for.

Take a clock reference as soon as clock gating has been initialised and
keep it until the probe is over. It then does not matter who drops a
clock reference while the probe is running, and the register accesses
of the probe no longer depend on hba->ufshcd_state. The reference is
dropped by ufshcd_async_scan() once the scan has finished, or by the
new out_release label if the probe fails after it was taken.

Fixes: a390e6677f41 ("scsi: ufs: core: Expand the ufshcd_device_init(hba, true) call")
Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index ee21388e74f5..7d63287b5ca9 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9550,6 +9550,7 @@ static void ufshcd_async_scan(void *data, async_cookie_t cookie)
 	ret = ufshcd_add_lus(hba);
 
 out:
+	ufshcd_release(hba);
 	pm_runtime_put_sync(hba->dev);
 
 	if (ret)
@@ -11272,6 +11273,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 
 	ufshcd_init_clk_gating(hba);
 
+	/* Released by ufshcd_async_scan(), or by out_release on failure. */
+	ufshcd_hold(hba);
+
 	ufshcd_init_clk_scaling(hba);
 
 	/*
@@ -11292,7 +11296,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);
 	if (err) {
 		dev_err(hba->dev, "request irq failed\n");
-		goto out_disable;
+		goto out_release;
 	} else {
 		hba->is_irq_enabled = true;
 	}
@@ -11308,7 +11312,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 		dev_err(hba->dev, "Host controller enable failed\n");
 		ufshcd_print_evt_hist(hba);
 		ufshcd_print_host_state(hba);
-		goto out_disable;
+		goto out_release;
 	}
 
 	INIT_DELAYED_WORK(&hba->rpm_dev_flush_recheck_work, ufshcd_rpm_dev_flush_recheck_work);
@@ -11322,7 +11326,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 
 	err = ufshcd_add_scsi_host(hba);
 	if (err)
-		goto out_disable;
+		goto out_release;
 
 	/* Hold auto suspend until async scan completes */
 	pm_runtime_get_sync(dev);
@@ -11342,7 +11346,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 
 	err = ufshcd_link_startup(hba);
 	if (err)
-		goto out_disable;
+		goto out_release;
 
 	if (hba->mcq_enabled)
 		ufshcd_config_mcq(hba);
@@ -11359,23 +11363,23 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	/* Verify device initialization by sending NOP OUT UPIU */
 	err = ufshcd_verify_dev_init(hba);
 	if (err)
-		goto out_disable;
+		goto out_release;
 
 	/* Initiate UFS initialization, and waiting until completion */
 	err = ufshcd_complete_dev_init(hba);
 	if (err)
-		goto out_disable;
+		goto out_release;
 
 	err = ufshcd_device_params_init(hba);
 	if (err)
-		goto out_disable;
+		goto out_release;
 
 	err = ufshcd_post_device_init(hba);
 
 initialized:
 	ufshcd_process_probe_result(hba, probe_start, err);
 	if (err)
-		goto out_disable;
+		goto out_release;
 
 	ufs_sysfs_add_nodes(hba->dev);
 	hba->dme_qos_sysfs_handle = sysfs_get_dirent(hba->dev->kobj.sd,
@@ -11386,6 +11390,8 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	ufshcd_pm_qos_init(hba);
 	return 0;
 
+out_release:
+	ufshcd_release(hba);
 out_disable:
 	hba->is_irq_enabled = false;
 	ufshcd_hba_exit(hba);
-- 
2.45.2


