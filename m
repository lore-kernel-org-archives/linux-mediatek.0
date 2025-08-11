Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D77C87FD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ccB9MQly4klStRXD4xKsnoHFEl4apXZflGejcFCrqc=; b=Y69KuU1RnyLEiAsPquRfnh0YVo
	K4ajmmd+Y7SQLJ/5OANmA7evk8n1lA/FTZJbKSx3fwrAnKM9asLyflWjhDvCnbW03dnp8qn4fmZFA
	y+W+kEFNjs0PLF5cR9OfuQxbG7KU6awpZU+30wHAeQEPJpWP899EHTgj3IA9H+yYZFhSLWbJ9GLlW
	w3m6T0nfWjE9aTo7pXi1NInsJnFOWjcnW1uZnYYA2uQl2kjjC/VIduYsA7Mszrn+R3hi7QqXTjC3c
	NJw3odGUHU/vFRI4P3OKuowNeRmHptn4SL0qWDCjZy3eOqXklS9t7yzoHADz67cqnSCp/UJP/Qgq9
	rhAMBPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTXY-0000000827Z-3IW4;
	Mon, 11 Aug 2025 14:30:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSME-00000007mik-3JGX
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 13:14:35 +0000
X-UUID: 1d3fb52a76b511f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8ccB9MQly4klStRXD4xKsnoHFEl4apXZflGejcFCrqc=;
	b=SvAIKENPgQfGOZPmAnB1Hvz/SBH7+oOQyDH8hnmAW7L9cfQYy27fLiH5GX+gs3iu1vCRCkVmN9KlYuIBEJg1pFjUAzg5KKnFae6C34DOOjVjGF7GJK+NzE53QMRUDC8RAOht+mFczzRsYnN/P6g78Km5se0tb+wkJNYtwl8Gfqo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:623a2aef-6e34-4e10-b7e8-f1105e1a9094,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:7bdb4fa1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d3fb52a76b511f09f706fa2197c6ceb-20250811
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 789653537; Mon, 11 Aug 2025 06:14:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 21:14:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 21:14:25 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 05/10] ufs: host: mediatek: Fix PWM mode switch issue
Date: Mon, 11 Aug 2025 21:11:21 +0800
Message-ID: <20250811131423.3444014-6-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250811131423.3444014-1-peter.wang@mediatek.com>
References: <20250811131423.3444014-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_061434_850987_EFC50E57 
X-CRM114-Status: GOOD (  11.96  )
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

This patch addresses a failure in switching to PWM mode by
ensuring proper configuration of power modes and adaptation
settings. The changes include checks for SLOW_MODE and
adjustments to the desired working mode and adaptation
configuration based on the device's power mode and hardware
version.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 31fe8efa5778..e0a51b86469c 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1321,6 +1321,10 @@ static bool ufs_mtk_pmc_via_fastauto(struct ufs_hba *hba,
 	    dev_req_params->gear_rx < UFS_HS_G4)
 		return false;
 
+	if (dev_req_params->pwr_tx == SLOW_MODE ||
+	    dev_req_params->pwr_rx == SLOW_MODE)
+		return false;
+
 	return true;
 }
 
@@ -1336,6 +1340,10 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 	host_params.hs_rx_gear = UFS_HS_G5;
 	host_params.hs_tx_gear = UFS_HS_G5;
 
+	if (dev_max_params->pwr_rx == SLOW_MODE ||
+	    dev_max_params->pwr_tx == SLOW_MODE)
+		host_params.desired_working_mode = UFS_PWM_MODE;
+
 	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 	if (ret) {
 		pr_info("%s: failed to determine capabilities\n",
@@ -1368,10 +1376,21 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 		}
 	}
 
-	if (host->hw_ver.major >= 3) {
+	if (dev_req_params->pwr_rx == FAST_MODE ||
+	    dev_req_params->pwr_rx == FASTAUTO_MODE) {
+		if (host->hw_ver.major >= 3) {
+			ret = ufshcd_dme_configure_adapt(hba,
+						   dev_req_params->gear_tx,
+						   PA_INITIAL_ADAPT);
+		} else {
+			ret = ufshcd_dme_configure_adapt(hba,
+				   dev_req_params->gear_tx,
+				   PA_NO_ADAPT);
+		}
+	} else {
 		ret = ufshcd_dme_configure_adapt(hba,
-					   dev_req_params->gear_tx,
-					   PA_INITIAL_ADAPT);
+			   dev_req_params->gear_tx,
+			   PA_NO_ADAPT);
 	}
 
 	return ret;
-- 
2.45.2


