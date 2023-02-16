Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38031C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CPDJKv1rr0bTdUCpIuuUBYZuNpaubUl9o8nQuo99ks=; b=cXhCzA7alE5KKnjOcDIZefRKI8
	I97fY27MWIHtVyvH1OVXFaMBpJC2hdgeb869NOJrYj3y1G3FywO5CxIMueYBk+CnVwZPx+9jXKTyu
	Iw/I14art9w22i1j2MTfO2O2Ns61ASr1am4Xk8IU311UNxxdfYxypstf9qQhUM4DbBYQ8xAWhRXDO
	otsfdKtCOnF1X/Dxpkl/LirigWMaSngvD7lxrt2tgq9Zfz3MfFl4tPKRUmrnBABlr3VkjkzXGEBJ9
	V9yJPEOLghWBUGonIx4V3n3Mkry/hBUeylFIB1UYqZTn6FXvTMYHBAx59RS42FZIN4ebkbI0UQmfh
	E6z6LKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSduM-00AFMB-Bj; Thu, 16 Feb 2023 13:02:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsK-00AE5n-LI; Thu, 16 Feb 2023 13:00:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EBB7C66021AF;
	Thu, 16 Feb 2023 13:00:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676552431;
	bh=yWsDegXzrt0NSHPWIjXZg1Uds3E0S8tY1ojJP+FXBNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XcvILqurET3s+UI5b49eLjsRGssUji2kiyzxl28cwUgZDmtNLneuWp1HMHhZazQyV
	 9O2ubb1dYrZx+w240KedoGcfdC9lAlMtxvRum3Ev3Ud8Fw/AmSdr1naTxVijASinDn
	 AZycf2BDwQeWG745RLcvbywluJ2V9wuaml45ciP6ecJkXxBn/xSk7x/WY7NYFXjaA4
	 2h1sJpYUsf1TPIeXQ41Oz7rObI2qVi97sH7qg7qSn2BtkPskuV5+0M4ObErOaT7aH/
	 Vy9O1Ud5m5gtA9pWfOsyihdqfqtPmXNfTofiI96wgsOJJdftJa3UiYUcjH0oxl1kVZ
	 /510M6G/gBeJQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 7/9] soc: mediatek: mtk-mutex: Use module_platform_driver() macro
Date: Thu, 16 Feb 2023 14:00:19 +0100
Message-Id: <20230216130021.64875-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_050036_846243_1AA77F03 
X-CRM114-Status: UNSURE (   8.73  )
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
---
 drivers/soc/mediatek/mtk-mutex.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index fb6bd0838892..07eff509580a 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -947,19 +947,7 @@ static struct platform_driver mtk_mutex_driver = {
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
2.39.1


