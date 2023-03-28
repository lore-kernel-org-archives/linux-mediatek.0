Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E3EC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dZSNEzifW+EAseN3wIB9wa4165FEL3Zr0PtIZiGHic=; b=1T9g63RqcrfFQI54oNHlZq5PxH
	lPMQDZQzsrM9FDLftuaRsAKgYy7aY1+9xXaS2MCe3kNJuqViBrOI85EUNgBdLwDNjEFKAap6QsG+H
	hXS2f1m+GToVTHISWb5pKG7csr1+m5lDJ7DLmKWJly5lpBgSt7n13avO/sHnUQzw3NrUn2MislWCw
	oeaS5J69r/NsKt2Efk6VDQy82Hdn+9V11FI0M07NsuwPl0fKIQJK+MlPfhdGtOsFUItsTePoq4pdM
	EXKLVXCIFuCjQ7ypipkBknt6xJemsSOWKT/W1dmSxaMQcGtYWX3Gc8/vjzEN1DgBJhmhQ+s7nXJ1B
	uxfmUOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6tA-00E1Ok-32;
	Tue, 28 Mar 2023 10:49:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6t8-00E1MR-1O;
	Tue, 28 Mar 2023 10:49:15 +0000
X-UUID: 28b563b0cd5611edb7d8d11f642b8e78-20230328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9dZSNEzifW+EAseN3wIB9wa4165FEL3Zr0PtIZiGHic=;
	b=elEqt7OVRNgQjIKwn3/TK8euy0LlOSn9hX5EdPnFDrNvaUhx9UxpY5IRSxnMdQygtJ1i8AqSabowdqCNRK0kwSC2NFPJOJLRbvKlIJ5kca+XK9slXigZRqN7DMooOl+EcKMQOafet2xn4EX3UByuW5VwcWhT8D0R7hgelsISUzY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e524c32f-9b06-47d0-bf65-b87708e1bf69,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:1b4e9db4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 28b563b0cd5611edb7d8d11f642b8e78-20230328
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1271370052; Tue, 28 Mar 2023 03:49:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 28 Mar 2023 18:38:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 28 Mar 2023 18:38:28 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Stanley Chu <stanley.chu@mediatek.com>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<powen.kao@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<cc.chou@mediatek.com>, <eddie.huang@mediatek.com>,
	<mason.zhang@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>
Subject: [PATCH 2/2] scsi: ufs: ufs-mediatek: Add UFSHCD_QUIRK_MCQ_BROKEN_INTR quirk
Date: Tue, 28 Mar 2023 18:37:53 +0800
Message-ID: <20230328103801.11198-2-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230328103801.11198-1-powen.kao@mediatek.com>
References: <20230328103801.11198-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_034914_470337_5AEC9B43 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Set UFSHCD_QUIRK_MCQ_BROKEN_INTR for mtk driver

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 73e217260390..b4a4a580ad37 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -901,6 +901,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_CLK_SCALING;
 
 	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
+	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_INTR;
+
 	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
 
 	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
-- 
2.18.0


