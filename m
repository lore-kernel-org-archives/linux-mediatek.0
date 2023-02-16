Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE02C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3PAcKwKR56X15WnNWigLtK2CQoO70A8cfeBgYyEtq0=; b=PPoWs+VF1tuY/dWaKxfVxl8LP8
	ISB2wWSGhGUBWG1qmaSStyAi9N2+AQpVEHgsq596Ur0SnAO1PmnLVLVuRHZ5wy3rvBAQqr/3x8Vhc
	8lzFVOzkX7e6PxWiiF3DOeK/0P26LBXRBFkLHTjvo3CS+dcbjjsjWo/G0dGxwrzfH+qQgmM2jbLgW
	SPrSadqQyCF5K7Im9OI9579avLQqoVoOtiwS46thbD1usAuX+dXaZ9MAlRgpG0nyTzrqtPdDapjfm
	AkHPTy3QbhtKd/cXJSKhTycVmnnKDN3kWtroYquvPnB8aCVjd7mE6I99PRH8Es3Mj5EA6IsNSO9r0
	b1ti5Nrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsT-00AE9n-S2; Thu, 16 Feb 2023 13:00:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsG-00AE37-Jq; Thu, 16 Feb 2023 13:00:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF7F166021A8;
	Thu, 16 Feb 2023 13:00:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676552428;
	bh=akKsNWR5T+Lv1H5lxALji7s6hzqhOq0hzyQywZA1KxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cWy8JSqxDFC+vrCbBbLvJLBzpjUhLpwI000YFJ/nt88WfbpXed9qQQUGTfxOVquhK
	 4bvLeXlyB6AUiZJcFJ9s4NyVDeqRa0H1hijpHGnYvqnu8LezJSNiTlpex96224zqI+
	 MNdn9ak+BA/oBubolhXyc7MJlavl30TkstyMRYj4MNxl1yNUnyjBL8lwm3BAHn21gr
	 HGIrbvlit/obWtnnzQ8kpmXH6FL0SAOjRxFDqc8/QBWVVxlUqaDUjpwy7RmOFMnAWZ
	 lM5FbNih59+3d6iY/ZGVjD7fu0NSFybpgviQeTSdfhclSIV8L8IYIb/ikDf82/eF5d
	 xextHCvrDFBSg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 2/9] soc: mediatek: mtk-mmsys: Use module_platform_driver() macro
Date: Thu, 16 Feb 2023 14:00:14 +0100
Message-Id: <20230216130021.64875-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_050032_837273_099D27A5 
X-CRM114-Status: UNSURE (   8.96  )
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

Instead of open-coding init/exit calls, switch to using the
module_platform_driver() macro instead, doing the exact same.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index af22f3490034..1a574de9484d 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -447,19 +447,7 @@ static struct platform_driver mtk_mmsys_drv = {
 	.probe = mtk_mmsys_probe,
 	.remove = mtk_mmsys_remove,
 };
-
-static int __init mtk_mmsys_init(void)
-{
-	return platform_driver_register(&mtk_mmsys_drv);
-}
-
-static void __exit mtk_mmsys_exit(void)
-{
-	platform_driver_unregister(&mtk_mmsys_drv);
-}
-
-module_init(mtk_mmsys_init);
-module_exit(mtk_mmsys_exit);
+module_platform_driver(mtk_mmsys_drv);
 
 MODULE_AUTHOR("Yongqiang Niu <yongqiang.niu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek SoC MMSYS driver");
-- 
2.39.1


