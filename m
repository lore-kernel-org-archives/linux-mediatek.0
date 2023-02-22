Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42E7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+lNjOww9VGCqfvbV7mnLsn5TFFFbEQ4qKu2TXJI3XI=; b=lSBiwfATJ+BkJ5976D5YZ38gPo
	yzJe6PhO6/35R74cmUqOPVOoL1mnd7EEeWvrmlzK1RR8d8CykdLBnRFLys3ZwhC2mrvrywH2GTd2i
	UEVmmvtXRshb21re+o+S4BHK7p8XIGOH7WCBOT5P6G0h84p7PszZoC8SFrq05zkEuaD9nL8rSg5Jz
	xHCUGjLVN3dusAUj+SmXhRPyOgIDnV3A+OsqroijvEASm5dfbLeCzfv0rFBqTD+kPlrXCQYE+wMKb
	67OulJ8A1SGfvjpRHldZb8puKDLqdgjP8D4Vb5mLendUTJII4AAyZP241qlNMZEQKOpVUfp5NBzMX
	qx4Qd2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmNI-00BvkP-OY; Wed, 22 Feb 2023 10:29:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleT-00BYhn-Pw; Wed, 22 Feb 2023 09:43:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A8DF66021D0;
	Wed, 22 Feb 2023 09:43:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058984;
	bh=W3yq5QP4VSIp5kuNHWkTn9ITtbb/6KY6TaV3sJDTiN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Npvg6e4prXO4gcc0DXYI5ohzflUH1du/8pA8tgxw0rxzh7TEUPb/Ae2kzyj/FnwB0
	 pI7Gf0c9ob4sKINxhGmpGLNp5kjZ37BUhg5DJotm8UQSdCS0ii31AqADnNYjF9Q5Ct
	 4xvi9SLp6B6TsdEqUekc2lahepdB7W0MoyU1pD9wctvu0fRan/aCzstzGMay6L4vy+
	 VSCHyosMm5d8LV2Ysa5PzmftGBdrftP3nU6Yfr6QzD6g6PUCKJMot4Ydaxf5ZFU2em
	 6ivphDJBKG9cOir6/GMi8xtTdBB5d4aetKVZnITmc6M6Cyicq+vaBvbVQaNa+ZD+IA
	 V0erBJYFq04Ug==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 7/9] soc: mediatek: mtk-mutex: Use module_platform_driver() macro
Date: Wed, 22 Feb 2023 10:42:51 +0100
Message-Id: <20230222094253.23678-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014306_106692_3564AE54 
X-CRM114-Status: UNSURE (   9.08  )
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

Replace open-coded init/exit calls with the module_platform_driver()
macro being equivalent.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-mutex.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index b68bb87bc365..b106f3d23e0d 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -1067,19 +1067,7 @@ static struct platform_driver mtk_mutex_driver = {
 		.of_match_table = mutex_driver_dt_match,
 	},
 };
-
-static int __init mtk_mutex_init(void)
-{
-	return platform_driver_register(&mtk_mutex_driver);
-}
-
-static void __exit mtk_mutex_exit(void)
-{
-	platform_driver_unregister(&mtk_mutex_driver);
-}
-
-module_init(mtk_mutex_init);
-module_exit(mtk_mutex_exit);
+module_platform_driver(mtk_mutex_driver);
 
 MODULE_AUTHOR("Yongqiang Niu <yongqiang.niu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek SoC MUTEX driver");
-- 
2.39.2


