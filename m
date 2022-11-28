Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568FFC43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 02:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5tXyLYBu45HCGpeDxvjCpB041vRFEj9acr1Hp6qgxE=; b=VoxSVTyUNwacpVqXVmOJwLNlzU
	GOX/PdxgOxlLFoFdgLr75d0XHCG+065LXtLq+tHHnbWcnfrcwVHMKnH4QgBmJ99Olp7dPVh8CZjFp
	JVmOPPUAXj2zwvGldKG9rlCLbDtdOWybQGztJyxxSx88lZ3DayMW8zjTc0AxkaGOvaP/A6LJp/hrt
	MsS59eKGDBcZ5wmZJiu2BkMR49TXSwCHGRDTrCvWvvP4DJjBl2e1JjBdp1DBInIhM2tuxg3GBOQWQ
	2HarwxQzkXWGikUe14lMVafNbazU057VrUymXAeJZyCOBAD77aVi1JIV/VjAG0TMyQMJjNiKCV9ZI
	vJTC9h5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTjr-00EvPh-LW; Mon, 28 Nov 2022 02:19:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTiz-00Ev3W-1i; Mon, 28 Nov 2022 02:18:26 +0000
X-UUID: bb56c298da3c48b7a927e118eaddd185-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E5tXyLYBu45HCGpeDxvjCpB041vRFEj9acr1Hp6qgxE=;
	b=cYzwKFSIr3CSmMZKDzF7rkjNkEKovE8ZAG8C6fGvUWZjyVKwXzeCkZGRACzuLC6hiFqgg9c4lN5gIz4uDz2iRcW4FtjLFkOm5e4GGXfc57ZDErHlhZDIQOiUzUHRK1ZCHIbfxNpUGqs9tYixIoPiFxD292Sz/leuxQmlGN3Ks7U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:f85868d5-3c2c-4c71-beb9-3dfcc127eeeb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:ac0962dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bb56c298da3c48b7a927e118eaddd185-20221127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 91121420; Sun, 27 Nov 2022 19:18:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 28 Nov 2022 10:07:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 28 Nov 2022 10:07:39 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
	<gch981213@gmail.com>
CC: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>
Subject: [PATCH 2/9] spi: mtk-snfi: change default page format to setup default setting
Date: Mon, 28 Nov 2022 10:06:06 +0800
Message-ID: <20221128020613.14821-3-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_181825_167822_B3035F56 
X-CRM114-Status: GOOD (  11.47  )
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

Change default page format to setup default setting since the sector
size 1024 on mt7986 will lead to probe fail.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/spi/spi-mtk-snfi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index fa8412ba20e2..719fc6f53ab1 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1430,8 +1430,7 @@ static int mtk_snand_probe(struct platform_device *pdev)
 
 	// setup an initial page format for ops matching page_cache_op template
 	// before ECC is called.
-	ret = mtk_snand_setup_pagefmt(ms, ms->caps->sector_size,
-				      ms->caps->spare_sizes[0]);
+	ret = mtk_snand_setup_pagefmt(ms, SZ_2K, SZ_64);
 	if (ret) {
 		dev_err(ms->dev, "failed to set initial page format\n");
 		goto disable_clk;
-- 
2.25.1


