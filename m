Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA8C83F36
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44y2wfwgFvKP6zkfIlXnC3M+8sjV48JJGIJc56I9ATE=; b=BS+tiDY+ceAs4scLcwwG1IqDPQ
	Dvqu1B6jGfgiHBOcg+q+Uhs/VI2MDvwnRokTY9uP8J1wAejC+9+/7kFflV0CpM0HGUJUUpbGazBWS
	KXE7YffDwJ2s/q6HkW/WUh/LXRfmgN6HbAw9eNFgILd681SgrOxxHf9JloYbvf6EYhZdvjg6DQ2Mt
	k5sapNiPr+zAp0W0m2iqxH91KkaMK8urE5YizSdvT3nYDeOD3aVDCKjSF2dyqQZFPFyNYQ4Bnq4cg
	WnyjUBvfi47W486cCv+zRXF0aHPppZp82Ae/RTdld1AI/wMyP3i2Q6jPiKhT1QudNKAMngV7ZzNjw
	FZMdFBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvva-00000006v9i-1261;
	Wed, 16 Jul 2025 06:47:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvdD-00000006tIZ-26lE
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 06:28:44 +0000
X-UUID: 1b0d061a620e11f09eb0dd999d3936bf-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=44y2wfwgFvKP6zkfIlXnC3M+8sjV48JJGIJc56I9ATE=;
	b=Jh3dMlohUqIrLparYcrwV1zdq0kRQXa7zr5qA/5Zoie2PF9EmrDbK4hbk/k91v/JJl7+DUbSYF382we9xpuqGKLUpd1VSrcmnGK9BbDeRCj2YCXOVQYY5FAmT0RDJrh6RnOXHwHkc3DSljpbSAR/MC5eGdTW3wu8OVgJByRfIcQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:504e61f0-cecf-4b11-8841-96d97cb8036e,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b61836df-2070-40bb-9c24-dfabef7c07f4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1b0d061a620e11f09eb0dd999d3936bf-20250715
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1643148992; Tue, 15 Jul 2025 23:28:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Jul 2025 14:28:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Jul 2025 14:28:32 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v1 04/10] ufs: host: mediatek: Change ref-clk timeout policy
Date: Wed, 16 Jul 2025 14:25:29 +0800
Message-ID: <20250716062830.3712487-5-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250716062830.3712487-1-peter.wang@mediatek.com>
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_232843_544046_DCCAB018 
X-CRM114-Status: GOOD (  11.74  )
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

This patch updates the timeout policy for ref-clk control.

- If a clock-on operation times out, it is assumed that the clock is
  off. The system will notify TFA to perform clock-off settings.
- If a clock-off operation times out, it is assumed that the clock
  will eventually turn off. The 'ref_clk_enabled' flag is set directly

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 1e5cc88127b4..b4d063ade0ec 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -357,7 +357,16 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 
 	dev_err(hba->dev, "missing ack of refclk req, reg: 0x%x\n", value);
 
-	ufs_mtk_ref_clk_notify(host->ref_clk_enabled, POST_CHANGE, res);
+	/*
+	 * If clock on timeout, assume clock is off, notify tfa do clock
+	 * off setting.(keep DIFN disable, release resource)
+	 * If clock off timeout, assume clock will off finally,
+	 * set ref_clk_enabled directly.(keep DIFN disable, keep resource)
+	 */
+	if (on)
+		ufs_mtk_ref_clk_notify(false, POST_CHANGE, res);
+	else
+		host->ref_clk_enabled = false;
 
 	return -ETIMEDOUT;
 
-- 
2.45.2


