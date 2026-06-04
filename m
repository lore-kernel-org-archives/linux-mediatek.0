Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FD3CD6E4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2026 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y62SA2SsKPoSYZRzV69KTgT+7aqhJBWj89zXq315zyE=; b=SyywLL9yiz8JgXyiQRxK/KfKGd
	vAuLxy62Cr+e30vbi8mw5K8UyKjwRohFy+YWc2PckNqT70/JQKz6C5uBcJ0ePO3R+20+ztgmTLCje
	njIVNjQpmEUmjCfaPt8Z0cxDeY/elJO/VkzRLlgSUgUvlVRHL2HGgQQpj7kDIxZ4+oELSnEX94kN2
	b/XR985yXhAzX3uWQ0yU6/60Av6UpJBuiprt2vgH9joEnI1akQFhgslx+NJ5DQAjldzsHTyi3DdTi
	rc1y7TAJ7kKUfCZJJdSf3FezGMeR97/mTPzZsO4HwrP9TI2d2csHy9ztcqRbWxPzRBMeuWChz68CW
	dXhkrf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8EB-0000000Gnta-1QF3;
	Thu, 04 Jun 2026 13:35:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8E9-0000000Gnsy-0Cth
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jun 2026 13:35:18 +0000
X-UUID: 336682b2601a11f1acbe4559397dec65-20260604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=y62SA2SsKPoSYZRzV69KTgT+7aqhJBWj89zXq315zyE=;
	b=WydqHRS6vu8OEWeqPs5Ejm2tHyWdy8twkM7UXgt51Nw071z+wM68ti6VUtnfG8ibnrW8Yt91hrLlGeRKcKfHShqQbNTQ15tvXSMHsIYAIgy2/YTj1eFuLzp9U1O+wYhhXrmrLErdi1frkYnZUHInT1VuIAiWNtn8pGWjIE7zyOk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:643aa2cf-c6ba-4e92-8e15-470cfcb8b04f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:b28d5d20-87a8-421b-982c-f5939dba7cba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 336682b2601a11f1acbe4559397dec65-20260604
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1687180597; Thu, 04 Jun 2026 06:35:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Jun 2026 21:35:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 4 Jun 2026 21:35:04 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v1] ufs: core: Remove unnecessary block I/O quiesce for clock scaling
Date: Thu, 4 Jun 2026 21:33:58 +0800
Message-ID: <20260604133503.2049288-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_063517_102165_08BFDD9F 
X-CRM114-Status: GOOD (  14.42  )
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

According to the MIPI UniPro Specification v2.0:

5.3.2.3 PA_DL_PAUSE.ind
This primitive informs the PA Service User, the DL Layer in
this case, that the PA Layer was requested to execute a
operation that requires the usage of the Link, e.g. Power
Mode change or PACP frame transmission.

5.3.2.4 PA_DL_PAUSE.rsp_L
This primitive informs the Service Provider that the PA
Service User, the DL Layer in this case, has reached
a state where the Link may be used by the PA Layer.

5.3.2.5 PA_DL_RESUME.ind
This primitive informs the PA Service User, the DL Layer
in this case, that the PA Layer has completed its operation
and the DL Layer may continue to use the Link.

The detailed flow can be found in Figure 52:
Power Mode Change Using PACP_PWR_req and PACP_PWR_cnf.

In short, when the PA layer do power mode change:
1. The DL layer receives PA_DL_PAUSE.ind.
2. The DL layer stops and responds to the PA layer with PA_DL_PAUSE.rsp_L.
3. Waits until the PA layer has completed its work.
4. The PA layer then informs the DL layer with PA_DL_RESUME.ind.

Hence, it is not necessary to stop I/O during a power mode change,
and this step can be removed.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c3f08957d179..b979f5105eb5 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1468,7 +1468,7 @@ static int ufshcd_scale_gear(struct ufs_hba *hba, u32 target_gear, bool scale_up
  *
  * Return: 0 upon success; -EBUSY upon timeout.
  */
-static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
+static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba)
 {
 	int ret = 0;
 	/*
@@ -1476,16 +1476,13 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 	 * clock scaling is in progress
 	 */
 	mutex_lock(&hba->host->scan_mutex);
-	blk_mq_quiesce_tagset(&hba->host->tag_set);
 	mutex_lock(&hba->wb_mutex);
 	down_write(&hba->clk_scaling_lock);
 
-	if (!hba->clk_scaling.is_allowed ||
-	    ufshcd_wait_for_pending_cmds(hba, timeout_us)) {
+	if (!hba->clk_scaling.is_allowed) {
 		ret = -EBUSY;
 		up_write(&hba->clk_scaling_lock);
 		mutex_unlock(&hba->wb_mutex);
-		blk_mq_unquiesce_tagset(&hba->host->tag_set);
 		mutex_unlock(&hba->host->scan_mutex);
 		goto out;
 	}
@@ -1501,7 +1498,6 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err)
 {
 	up_write(&hba->clk_scaling_lock);
 	mutex_unlock(&hba->wb_mutex);
-	blk_mq_unquiesce_tagset(&hba->host->tag_set);
 	mutex_unlock(&hba->host->scan_mutex);
 
 	/* Enable Write Booster if current gear requires it else disable it */
@@ -1529,7 +1525,7 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 
 	new_gear = ufshcd_vops_freq_to_gear_speed(hba, freq);
 
-	ret = ufshcd_clock_scaling_prepare(hba, 1 * USEC_PER_SEC);
+	ret = ufshcd_clock_scaling_prepare(hba);
 	if (ret)
 		return ret;
 
-- 
2.45.2


