Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C30C83F17
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jG9Ppd2qnuWgSBa/UiFctNI3f0OAqsHLFTkvkud8wLg=; b=YmpkJd51kN3jmEKeRAKdg+MqIk
	KvBRaX2iKmE+wlRidrDGOld53bCqMPtJ/KhKB5GOFbCGuW4xDY+ZhU2aekBhvuUnVWmIOkt7j35wI
	Gz/cswCDGoCos/X+qZ7qqMZ7VZgk6OW4sXlFyMQ7Cu8ErNtdYioXRzFIz0ix9flgvdA8+NiHcUuos
	k/pNBULa/LdzSXDQg7D34sDCicTGcIObpj3/r7WhXA2TxS1bmHyqXzdjqX5sq1I7cyKIaHtLbUZZM
	Xtfup82jbx2ZRs1Bv7ILICJhAxZHKmxMOfQRqJO8EVTqCJP3iJ+fr8Crf58dvbEkQQwwRB6nYJNQK
	gf4eC/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciQG-0000000CJL1-1Scx;
	Fri, 18 Jul 2025 10:34:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchoX-0000000CFAK-0sd9
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Jul 2025 09:55:38 +0000
X-UUID: 571d817e63bd11f09f706fa2197c6ceb-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jG9Ppd2qnuWgSBa/UiFctNI3f0OAqsHLFTkvkud8wLg=;
	b=a9hX8vBJe7BiAV7kXSGDB/ACxtpKxljxm9JXw7DuZpYt/o6sEu0ZRLs3ko65p5E22d72vGbqudfq/7Fg4niVmXyS2NwtOMb9uDdFrVy/pZpme75UqF8XcUcmaDD4A/fPe3ZGJ5wqBNWokqZEwb+my77ctYc4CnkoBDUna4UoSOo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:dcbfbe5a-ccf6-4745-a7e7-c3705d91627b,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:f95f059a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 571d817e63bd11f09f706fa2197c6ceb-20250718
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1844894585; Fri, 18 Jul 2025 02:55:30 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 17:55:26 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 17:55:26 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 3/9] ufs: host: mediatek: Change ref-clk timeout policy
Date: Fri, 18 Jul 2025 17:51:46 +0800
Message-ID: <20250718095524.682599-4-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250718095524.682599-1-peter.wang@mediatek.com>
References: <20250718095524.682599-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_025537_271420_FD138629 
X-CRM114-Status: GOOD (  11.26  )
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
  will eventually turn off. The 'ref_clk_enabled' flag is set directly.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 53702e74947a..ffc4a27aae7b 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -351,7 +351,16 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 
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


