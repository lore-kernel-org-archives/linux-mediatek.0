Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB3C87FC9
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 09:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysmpjW5BTVqezou9kbe5JRwYmcOd4yJa3z19eEs+BgU=; b=blsdeag/m2uPIGv37YXLNUvLHV
	8ZcNAiBAD+4YSkDvoQvleHbg5+pQPUYJmUwi5DppWm5njLXuCQSiyBRoJhdbXMbsg/ByZfwO7dKYh
	V988E0moqpOO5luGhdPcXVr2XDtZoxgEazowRVpRfJPRDqSrXBUsQGvjJ4drf5Kg64Q/nWjas60nF
	rA8Ny3EEpLs7CDqdU5DjI+GSuNAgWvMPBDsvdvNzslsm5qKtD/vfftIh0JSrrQLfT257G9Ui2HL9r
	NqZ9BMUhVx8x0PWjhCH6VxRj95yz9Dxqwy4ekon/ki1MZ3J6zrsJ7Wtae1df6AXNUq/qe5hPELF50
	xFmLP/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmep-0000000GmAa-1l44;
	Mon, 21 Jul 2025 09:18:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udm0m-0000000GgDI-3v5R
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 08:36:42 +0000
X-UUID: cf2b2c50660d11f09eb0dd999d3936bf-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ysmpjW5BTVqezou9kbe5JRwYmcOd4yJa3z19eEs+BgU=;
	b=BdW8PsfnlxjNUIJr7C2O3eIhkD4xN69vnbjlrDB8GGF7DcC1sbZzXd8+t7v3pSbqi27axptCdJuCkUTg/iHsFM3w+iwljF8j1gIwn02m+Gpvr71tdg34oQ0O5Wcnqct2FsQ/BDvsFIE4ITGEf9veKVTvNb9pzv/Li31B50nVHc0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:96449415-3a4b-47cf-9599-ace62b0452ee,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:45d7199a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cf2b2c50660d11f09eb0dd999d3936bf-20250721
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1442945979; Mon, 21 Jul 2025 01:36:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 16:36:29 +0800
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
Subject: [PATCH v3 4/9] ufs: host: mediatek: Handle broken RTC based on DTS setting
Date: Mon, 21 Jul 2025 16:35:13 +0800
Message-ID: <20250721083626.1801668-5-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250721083626.1801668-1-peter.wang@mediatek.com>
References: <20250721083626.1801668-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_013640_985222_7C508B0E 
X-CRM114-Status: GOOD (  11.75  )
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

This patch introduces a mechanism to handle broken RTC by checking
the DTS setting. The configuration is specifically required for
legacy platform.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 8 +++++++-
 drivers/ufs/host/ufs-mediatek.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index b30203d83ef1..112056e5d8e0 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -679,6 +679,9 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-rtff-mtcmos"))
 		host->caps |= UFS_MTK_CAP_RTFF_MTCMOS;
 
+	if (of_property_read_bool(np, "mediatek,ufs-broken-rtc"))
+		host->caps |= UFS_MTK_CAP_MCQ_BROKEN_RTC;
+
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
@@ -1035,8 +1038,11 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	shost->rpm_autosuspend_delay = MTK_RPM_AUTOSUSPEND_DELAY_MS;
 
 	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
+
 	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_INTR;
-	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_RTC;
+	if (host->caps & UFS_MTK_CAP_MCQ_BROKEN_RTC)
+		hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_RTC;
+
 	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
 
 	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 1082f761bb44..abb4a4fd4402 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -133,6 +133,8 @@ enum ufs_mtk_host_caps {
 	UFS_MTK_CAP_DISABLE_MCQ                = 1 << 8,
 	/* Control MTCMOS with RTFF */
 	UFS_MTK_CAP_RTFF_MTCMOS                = 1 << 9,
+
+	UFS_MTK_CAP_MCQ_BROKEN_RTC             = 1 << 10,
 };
 
 struct ufs_mtk_crypt_cfg {
-- 
2.45.2


