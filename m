Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01456CA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYVRL+Q54O3ikko3Y3stnHRSlb2QeuVLkh3yc1eQ9pw=; b=K+FXs/x6QiPWB+zHf/SsBxufq+
	jiJkx+Q+vadq21uD2ULNMPDVbIVTOIfoxkx432wiY0+1hI6mca130kMxpaG5ZQwAJCm07H4kHG5il
	m8Hgxfh9VBChBqcHKl4CwVwhdQ/jhssopAp46KrXemHoRgKggc4oF1PSuEuPFLEy5axJznDwLJ1vY
	gptz5V/8LAiUzSFccch4X37PRXD4HnIVq7WwxPR8ttfBlaxhNEkDkVNziMpg81r8xd0apCB11aNzF
	CE+Yz99H7P7sOrfmxsLnnLNXZuErkGPa7a4WMCOagcvuKI+BLjKjE3JulA81hNwvxAb0USQQ3lVqO
	RIzdP9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSS5-00000007nTy-3y9n;
	Mon, 11 Aug 2025 13:20:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSME-00000007mkU-2fBf
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 13:14:35 +0000
X-UUID: 1ce508dc76b511f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UYVRL+Q54O3ikko3Y3stnHRSlb2QeuVLkh3yc1eQ9pw=;
	b=sy1OLdjq6VWOzL1dRd61+8mfs7Ra/ior7hD/VUdB2jfGdSngG+b/qKZu4I5w5TeBu5ww/Oy6n3qkEeQZ7SNAt0UOw4I6ZXeuAFqraYR79QDh/KzVFPr3zOY0YJmfv1lRnUlhRYx9cmve2JJgxK8i9jaKQcm0EyZL6OSh6J5w3hs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:f9be97f9-697c-4069-b1d7-832836b26b0f,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:00494951-d89a-4c27-9e37-f7ccfcbebd5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1ce508dc76b511f09f706fa2197c6ceb-20250811
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 828469512; Mon, 11 Aug 2025 06:14:29 -0700
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
Subject: [PATCH v1 04/10] ufs: host: mediatek: Fine-tune clock scaling
Date: Mon, 11 Aug 2025 21:11:20 +0800
Message-ID: <20250811131423.3444014-5-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250811131423.3444014-1-peter.wang@mediatek.com>
References: <20250811131423.3444014-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_061434_707989_A7E2EB93 
X-CRM114-Status: GOOD (  11.30  )
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

This patch disables clock scaling for UFS versions below 4.0.
Clock scaling is unnecessary for these versions, and this
change ensures that the feature is only enabled for compatible
UFS versions.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 3d50cd3a01b3..31fe8efa5778 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -29,6 +29,7 @@
 #include "ufs-mediatek-sip.h"
 
 static int  ufs_mtk_config_mcq(struct ufs_hba *hba, bool irq);
+static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up);
 
 #define CREATE_TRACE_POINTS
 #include "ufs-mediatek-trace.h"
@@ -1144,6 +1145,17 @@ static void ufs_mtk_fix_ahit(struct ufs_hba *hba)
 	ufs_mtk_setup_clk_gating(hba);
 }
 
+static void ufs_mtk_fix_clock_scaling(struct ufs_hba *hba)
+{
+	/* UFS version is below 4.0, clock scaling is not necessary */
+	if ((hba->dev_info.wspecversion < 0x0400)  &&
+		ufs_mtk_is_clk_scale_ready(hba)) {
+		hba->caps &= ~UFSHCD_CAP_CLK_SCALING;
+
+		_ufs_mtk_clk_scale(hba, false);
+	}
+}
+
 static void ufs_mtk_init_mcq_irq(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -1774,6 +1786,7 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 	ufs_mtk_vreg_fix_vcc(hba);
 	ufs_mtk_vreg_fix_vccqx(hba);
 	ufs_mtk_fix_ahit(hba);
+	ufs_mtk_fix_clock_scaling(hba);
 }
 
 static void ufs_mtk_event_notify(struct ufs_hba *hba,
-- 
2.45.2


