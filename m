Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D09CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUVlV+vhLjIQrP3bbkKeQ0Jq6SHWLpYiSeav6Y7dNZM=; b=Uz+Gbwx+poiaMXSbiCQBEdCiuV
	ZSfhlzheXHjsvukeJyvJpOkBBBnlSDO4TBQ14CKry7JdMTxR8AcFRAN9KRg5btQpqTLmqXK/o+f2d
	yxu9uVvLPTQ4X4hL9AqyAxfaIlpyVjTQIzqcJHuiiXkL2XbDC+r5C89DXNmK4gLCO/cc+MrfJxg2w
	E0N9qX8vwEAvO5An4D4GPxaLmmfcHwYZ+hnnVvYsJM/xjSopR4MvNCSlLeaBjsifd0xRt2Smi0x83
	moU67KbFBf33HWPahTNCNzBE1t1IaPdvJyiIotPTUzgZ1FbxWgYZGTA0NSK8ReqWc6SuH3NODjbf0
	x4oV2fQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnZa-0000000AlWk-0dKr;
	Tue, 26 Aug 2025 06:54:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn5b-0000000Aggn-0E2w
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 06:23:30 +0000
X-UUID: 2a7d5580824511f09f706fa2197c6ceb-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eUVlV+vhLjIQrP3bbkKeQ0Jq6SHWLpYiSeav6Y7dNZM=;
	b=HWMrwTdoLkGtLLgv0iZ09k+GDOB3fKKV4nEWe1DP9oR3xZcQ3vIQtVXr0lOh2RvJNrPSHD/fHabPQ/ZHR19mga9N/PFyoDGo4bztZARDzH2XQoalhuVk5oIQusasHuL2KoX9/wncgx+e2umoh1EDyFKUdPNwzAjYTOqML72qvzc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:ee62e1f3-19f5-4ef8-9976-f46ba7d3f032,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:e5e09d6d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2a7d5580824511f09f706fa2197c6ceb-20250825
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1365515572; Mon, 25 Aug 2025 23:23:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 26 Aug 2025 14:23:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 26 Aug 2025 14:23:18 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <sanjeev.y@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2 07/10] ufs: host: mediatek: Return error directly on idle wait timeout
Date: Tue, 26 Aug 2025 14:22:21 +0800
Message-ID: <20250826062314.3070425-8-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250826062314.3070425-1-peter.wang@mediatek.com>
References: <20250826062314.3070425-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_232327_139856_A46EF832 
X-CRM114-Status: GOOD (  12.93  )
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

From: Sanjeev Y <sanjeev.y@mediatek.com>

This patch optimizes the recovery flow by returning an error code
immediately if a wait idle timeout occurs, rather than proceeding
to wait for the link to reach the up state. This change shortens
the recovery process and improves error handling efficiency when
idle state transitions fail.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Sanjeev Y <sanjeev.y@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index e42e9b97810c..a6f812713345 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -416,7 +416,7 @@ static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
 	}
 }
 
-static void ufs_mtk_wait_idle_state(struct ufs_hba *hba,
+static int ufs_mtk_wait_idle_state(struct ufs_hba *hba,
 			    unsigned long retry_ms)
 {
 	u64 timeout, time_checked;
@@ -452,8 +452,12 @@ static void ufs_mtk_wait_idle_state(struct ufs_hba *hba,
 			break;
 	} while (time_checked < timeout);
 
-	if (wait_idle && sm != VS_HCE_BASE)
+	if (wait_idle && sm != VS_HCE_BASE) {
 		dev_info(hba->dev, "wait idle tmo: 0x%x\n", val);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
 }
 
 static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
@@ -1437,9 +1441,13 @@ static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 	ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
 
 	/* wait host return to idle state when auto-hibern8 off */
-	ufs_mtk_wait_idle_state(hba, 5);
+	ret = ufs_mtk_wait_idle_state(hba, 5);
+	if (ret)
+		goto out;
 
 	ret = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
+
+out:
 	if (ret) {
 		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
 
@@ -1614,7 +1622,11 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 		return err;
 
 	/* Check link state to make sure exit h8 success */
-	ufs_mtk_wait_idle_state(hba, 5);
+	err = ufs_mtk_wait_idle_state(hba, 5);
+	if (err) {
+		dev_warn(hba->dev, "wait idle fail, err=%d\n", err);
+		return err;
+	}
 	err = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
 	if (err) {
 		dev_warn(hba->dev, "exit h8 state fail, err=%d\n", err);
-- 
2.45.2


