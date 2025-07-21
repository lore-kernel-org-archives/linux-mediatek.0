Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E2DC87FCA
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSPjWjnXK1p7ouwQNXUsmhbVLQ9zcrsQ+wS0Gsfao50=; b=b3HBbU+w/vwpi68llF6UtvgQY2
	CXMA3a801yRcwGbjPZkNqXlFcXQtZNEyrqu08vnKZNiqcVb/2CgxpfOkICkAyQ4LR062YR0cCHbOz
	W+nH+SJL6qOZ01368UO8Eb8ANPCFbV87ojGss8nIAIZiTBlpRclunfSw2xCVhXlLOQrO+k5znOzK5
	sRyeSsGXzS5MgqWpLgg52idMNRX+YvpQeqFcnCdNuojwH9y5VAx4VdmIRpl5fghsby+hxAOIUlFVY
	IZ4h8Rt0amC2I8RgWdeYWoiQonTv794pK2xMoQtgU84wTacXUcVXaCXo4Y1/y7u7sWw8YXhiYDLB9
	gp+KVMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmhD-0000000Gmy0-1sEQ;
	Mon, 21 Jul 2025 09:20:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udm0o-0000000GgDI-05xj
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 08:36:43 +0000
X-UUID: d163e1b0660d11f09eb0dd999d3936bf-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SSPjWjnXK1p7ouwQNXUsmhbVLQ9zcrsQ+wS0Gsfao50=;
	b=bpy1b5hvBYw304UMD/21r2JQTdczpMX05C8zv81gZ/B5nE0wE9Q3uQa/eyf6dMScRh04Uzqq8xh3Ge6D90gnqei7wIouy0BR+fiZBMsMF2AZ1v3vWRLM+YdqEXKyKmu4uFDLDDXWIeONjnTI7fZuwfW9f2x0uajyPz1/4hLT8Iw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b8088134-636f-483d-a867-a5b4e8662e2a,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b6db3b73-f565-4a89-86be-304708e7ad47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d163e1b0660d11f09eb0dd999d3936bf-20250721
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 888080471; Mon, 21 Jul 2025 01:36:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 16:36:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Jul 2025 16:36:29 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v3 9/9] ufs: host: mediatek: Support FDE (AES) clock scaling
Date: Mon, 21 Jul 2025 16:35:18 +0800
Message-ID: <20250721083626.1801668-10-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250721083626.1801668-1-peter.wang@mediatek.com>
References: <20250721083626.1801668-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_013642_079764_D629863C 
X-CRM114-Status: GOOD (  16.53  )
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

This patch adds support for scaling the FDE (AES) clock to achieve higher
performance, particularly for HS-G5. The implementation includes:
1. Parsing DTS settings for FDE min/max mux.
2. Scaling up the FDE clock when required for enhanced performance.

These changes ensure that the FDE clock can be dynamically adjusted
based on performance needs, leveraging DTS configurations.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 54 ++++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-mediatek.h |  3 ++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index a0c53d796a60..91a2f3428b9f 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -953,9 +953,23 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 			host->mclk.ufs_sel_min_clki = clki;
 			clk_disable_unprepare(clki->clk);
 			list_del(&clki->list);
+		} else if (!strcmp(clki->name, "ufs_fde")) {
+			host->mclk.ufs_fde_clki = clki;
+		} else if (!strcmp(clki->name, "ufs_fde_max_src")) {
+			host->mclk.ufs_fde_max_clki = clki;
+			clk_disable_unprepare(clki->clk);
+			list_del(&clki->list);
+		} else if (!strcmp(clki->name, "ufs_fde_min_src")) {
+			host->mclk.ufs_fde_min_clki = clki;
+			clk_disable_unprepare(clki->clk);
+			list_del(&clki->list);
 		}
 	}
 
+	list_for_each_entry(clki, head, list) {
+		dev_info(hba->dev, "clk \"%s\" present", clki->name);
+	}
+
 	if (!ufs_mtk_is_clk_scale_ready(hba)) {
 		hba->caps &= ~UFSHCD_CAP_CLK_SCALING;
 		dev_info(hba->dev,
@@ -1758,14 +1772,16 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct ufs_mtk_clk *mclk = &host->mclk;
 	struct ufs_clk_info *clki = mclk->ufs_sel_clki;
+	struct ufs_clk_info *fde_clki = mclk->ufs_fde_clki;
 	struct regulator *reg;
 	int volt, ret = 0;
 	bool clk_bind_vcore = false;
+	bool clk_fde_scale = false;
 
 	if (!hba->clk_scaling.is_initialized)
 		return;
 
-	if (!clki)
+	if (!clki || !fde_clki)
 		return;
 
 	reg = host->mclk.reg_vcore;
@@ -1773,6 +1789,9 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 	if (reg && volt != 0)
 		clk_bind_vcore = true;
 
+	if (mclk->ufs_fde_max_clki && mclk->ufs_fde_min_clki)
+		clk_fde_scale = true;
+
 	ret = clk_prepare_enable(clki->clk);
 	if (ret) {
 		dev_info(hba->dev,
@@ -1780,6 +1799,15 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 		return;
 	}
 
+	if (clk_fde_scale) {
+		ret = clk_prepare_enable(fde_clki->clk);
+		if (ret) {
+			dev_info(hba->dev,
+				 "fde clk_prepare_enable() fail, ret: %d\n", ret);
+			return;
+		}
+	}
+
 	if (scale_up) {
 		if (clk_bind_vcore) {
 			ret = regulator_set_voltage(reg, volt, INT_MAX);
@@ -1795,7 +1823,28 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 			dev_info(hba->dev, "Failed to set clk mux, ret = %d\n",
 				ret);
 		}
+
+		if (clk_fde_scale) {
+			ret = clk_set_parent(fde_clki->clk,
+				mclk->ufs_fde_max_clki->clk);
+			if (ret) {
+				dev_info(hba->dev,
+					"Failed to set fde clk mux, ret = %d\n",
+					ret);
+			}
+		}
 	} else {
+		if (clk_fde_scale) {
+			ret = clk_set_parent(fde_clki->clk,
+				mclk->ufs_fde_min_clki->clk);
+			if (ret) {
+				dev_info(hba->dev,
+					"Failed to set fde clk mux, ret = %d\n",
+					ret);
+				goto out;
+			}
+		}
+
 		ret = clk_set_parent(clki->clk, mclk->ufs_sel_min_clki->clk);
 		if (ret) {
 			dev_info(hba->dev, "Failed to set clk mux, ret = %d\n",
@@ -1814,6 +1863,9 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 
 out:
 	clk_disable_unprepare(clki->clk);
+
+	if (clk_fde_scale)
+		clk_disable_unprepare(fde_clki->clk);
 }
 
 /**
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 0b25ce5aa836..e46dc5fa209d 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -149,6 +149,9 @@ struct ufs_mtk_clk {
 	struct ufs_clk_info *ufs_sel_clki; /* Mux */
 	struct ufs_clk_info *ufs_sel_max_clki; /* Max src */
 	struct ufs_clk_info *ufs_sel_min_clki; /* Min src */
+	struct ufs_clk_info *ufs_fde_clki; /* Mux */
+	struct ufs_clk_info *ufs_fde_max_clki; /* Max src */
+	struct ufs_clk_info *ufs_fde_min_clki; /* Min src */
 	struct regulator *reg_vcore;
 	int vcore_volt;
 };
-- 
2.45.2


