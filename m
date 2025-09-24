Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F63CAC5B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6HX2TtKgTRoakZD0tE6W91kVtZ62DR9MqHoUCCxcGo=; b=VG+MN4MiXayOkRvHSveq/Q6mMG
	Hun+kRv0arpIj1nhARnsRmJudkOqzWXhyLlRyHFs1ktp75egWwajMZv5IrfDP38FN3EYzUGlWvx6q
	f7nNUm83AtvFzcV6i5rLry9xo0GQ0WxDxKGz7g8H7De2epB4mm373sSzA93DWm5MuBi66UJ9DxnmD
	XWa6wP6EDvCTX2csZqDt3IOhk4FA0+I+S7zIT5Ev6tnCFRoW1NLiUpy7iycCpwKw13ncPpizX0zes
	AZKCF4poE3CKlgSWAqW94gk4NimotVvwMlZ/kElfhPJAZI2O/wmrKZIKad1ml/YHB/KxQk1+tnsE6
	EfT/jR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4E-0000000GAr7-3oiG;
	Wed, 24 Sep 2025 09:45:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4A-0000000GAhu-0cit
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 09:45:40 +0000
X-UUID: 366a472a992b11f09f706fa2197c6ceb-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=j6HX2TtKgTRoakZD0tE6W91kVtZ62DR9MqHoUCCxcGo=;
	b=ZeHZbcEvgsEjNBy0CFX/GNoRZ+LUtgVpHfqSXPX+j5sdght51o+2iuoeRJuRDaiv9jtnSPLaRsbTp8hw6AG/8nwIhUTyFZMRLXCq9RmU0YtF+rCjjLEVhMM5aHzE5cs4BHo5HRmBODbnOy+5fJYcJHtgYAraUmhiFggdEYn6lMc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:ba84cdcd-e030-4015-ac2c-6681e648acdf,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:1ca6b93,CLOUDID:66ffa1e9-2ff9-4246-902c-2e3f7acb03c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 366a472a992b11f09f706fa2197c6ceb-20250924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1401190934; Wed, 24 Sep 2025 02:45:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 17:45:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 17:45:28 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 2/8] ufs: host: mediatek: Adjust clock scaling for PM flow
Date: Wed, 24 Sep 2025 17:43:24 +0800
Message-ID: <20250924094527.2992256-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250924094527.2992256-1-peter.wang@mediatek.com>
References: <20250924094527.2992256-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024538_211176_7008559C 
X-CRM114-Status: GOOD (  12.34  )
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

Adjust clock scaling during suspend and resume in the UFS
Mediatek driver. Ensure that the clock scales down during
suspend if it was scaled up, and scales up again after resume.
This adjustment maintains proper power management.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 009031fee744..0622b7b32e51 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1774,9 +1774,11 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 
 	ufs_mtk_sram_pwr_ctrl(false, res);
 
-	/* Release pm_qos if in scale-up mode during suspend */
-	if (ufshcd_is_clkscaling_supported(hba) && (host->clk_scale_up))
+	/* Release pm_qos/clk if in scale-up mode during suspend */
+	if (ufshcd_is_clkscaling_supported(hba) && (host->clk_scale_up)) {
 		ufshcd_pm_qos_update(hba, false);
+		_ufs_mtk_clk_scale(hba, false);
+	}
 
 	return 0;
 fail:
@@ -1804,9 +1806,11 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (err)
 		goto fail;
 
-	/* Request pm_qos if in scale-up mode after resume */
-	if (ufshcd_is_clkscaling_supported(hba) && (host->clk_scale_up))
+	/* Request pm_qos/clk if in scale-up mode after resume */
+	if (ufshcd_is_clkscaling_supported(hba) && (host->clk_scale_up)) {
 		ufshcd_pm_qos_update(hba, true);
+		_ufs_mtk_clk_scale(hba, true);
+	}
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_hpm(hba);
-- 
2.45.2


