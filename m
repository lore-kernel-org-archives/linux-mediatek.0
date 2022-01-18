Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFB1C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZCBM68OVlh7olvS3ZFyaN+8TMi0krzi/2ODRRSlROE=; b=p+UHe0wPIF7tPT
	FeY7WZmy2CjrYmfUETiklh4Lp78+3wCRkbFfa7drgryNm5kgQTQO5vf5O6fjIGTP9L4jSdc51ecYx
	agsXYDjhrs8hFXDKgtFpk+03EpM17zjN/MBUdzYUGGzszYUU1Gz0NTSuiQKFy2GBcwHW00r2hH2bW
	+WZjwpxVw+in7DWHd8oQ1dCyOsK+CSsZ1tOOpnfBSrdyK/Ep1K3+s+D8TpTVjn+x03qHl88KGgmu4
	YC+/RpvtlTzXrkZYrG8HKik0W3ZsGIl1CQW2sPrjoDntdLi8CgEO8oBxZfeb4/7v+IllJktZwtVe1
	oXVw6fDx+sWk5zgHDYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9pTV-001r4j-53; Tue, 18 Jan 2022 14:28:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9pTO-001r1a-72
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 14:28:35 +0000
X-UUID: 588f95d192d046aaa3a6c5242a1ae43a-20220118
X-UUID: 588f95d192d046aaa3a6c5242a1ae43a-20220118
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1736907133; Tue, 18 Jan 2022 07:28:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 06:28:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 18 Jan 2022 22:28:27 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 22:28:27 +0800
From: <guochun.mao@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Zhen Zhang
 <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>, "Chuanhong
 Guo" <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <project_global_chrome_upstream_group@mediatek.com>, Guochun Mao
 <guochun.mao@mediatek.com>
Subject: [PATCH v2 3/4] spi: spi-mtk-nor: add new soc mt8186 support
Date: Tue, 18 Jan 2022 22:28:19 +0800
Message-ID: <20220118142820.2729-4-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118142820.2729-1-guochun.mao@mediatek.com>
References: <20220118142820.2729-1-guochun.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_062834_270416_D10E20A1 
X-CRM114-Status: GOOD (  10.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Guochun Mao <guochun.mao@mediatek.com>

Add compatible mediatek,mt8186-nor implementation.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
---
 drivers/spi/spi-mtk-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index f5ff01f61f42..e44fdf7c9e4b 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -765,6 +765,11 @@ const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
 	.extra_dummy_bit = 0,
 };
 
+const struct mtk_nor_caps mtk_nor_caps_mt8186 = {
+	.dma_bits = 32,
+	.extra_dummy_bit = 1,
+};
+
 const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
 	.dma_bits = 36,
 	.extra_dummy_bit = 0,
@@ -772,6 +777,7 @@ const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
 
 static const struct of_device_id mtk_nor_match[] = {
 	{ .compatible = "mediatek,mt8173-nor", .data = &mtk_nor_caps_mt8173 },
+	{ .compatible = "mediatek,mt8186-nor", .data = &mtk_nor_caps_mt8186 },
 	{ .compatible = "mediatek,mt8192-nor", .data = &mtk_nor_caps_mt8192 },
 	{ /* sentinel */ }
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
