Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CBFC636D6
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlzBceyy4+1in/8yS8lkbCv4uBXD+RS6X6w3sT47oIU=; b=C7CselRhjb9cXyn9+SZaBfRsgI
	wIPoUJpGaEE2DHGpjUgyIWGrnOGG0z4ol7UIWz/fj+pvM77XsWPYNdci6gNEVZmLIVQCmoL9DC7yR
	PtAmUtxRHpc818UoMoeVpUuN8dRYNAr3JjicvDHntXXcPSgYqabd1I5A6XKxj2x+QumWM5WW2B21G
	3XQZYtRmN7AKJNsGZn5Nqmyknc3ZmzYD2XtAP5cOL5HPFRt1z7Kl7vpAFEO+Zfj0yhKEVZimDH619
	b56KmGAB7NaVWqs/nLuDJe52wOChosKfq0XoDD2KvUqYcWPN537vJtaypOQ0oesqXwCgWzqZnt3h0
	WlOVgQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3RX-008trq-GJ; Mon, 06 Feb 2023 15:30:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3RG-008tjm-OQ; Mon, 06 Feb 2023 15:29:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B86726602D99;
	Mon,  6 Feb 2023 15:29:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675697387;
	bh=swkWEY8kPUmC2zWWUYc4N5J7rDXfV0/+hEu0W+zUe9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Td5iS2LrLOanAw1BlPPt1OtesdypXXanJOJRwYBhYx277kp+m9uyTW+mEfXbCzdYO
	 5m6rJhtVS+6BU1xNNKRCe5tkrCzayS3ubnKGdtj71DXGrjt4IwjwTIL5sw5XPXjJKs
	 znVCu87+ecRkPIPRtu5wXW2641FfjA/GIZ9dtsYCYo1WkE+A23pWgTm73YDHH19UQv
	 nbU6fRmNN0QljK6l4XaWDu5GK0ePwcyJdP6qcK/0HhrvTlJ428th9AbJNcqtp7kU4V
	 wP7Cg05jTXCC80XyvxK6EKa7WXWW8imBtEWgg4uJJJMbU8QWyWBT+PvRcqqYt/k76m
	 gicXd1HmTeNUQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 01/45] clk: mediatek: clk-mtk: Switch to device_get_match_data()
Date: Mon,  6 Feb 2023 16:28:44 +0100
Message-Id: <20230206152928.918562-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_072951_068479_74CDEE44 
X-CRM114-Status: GOOD (  10.45  )
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

Instead of using of_device_get_match_data(), switch to the generic
device_get_match_data().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index c90c0a6b501b..71eb591cd00c 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -471,7 +470,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int num_clks, r;
 
-	mcd = of_device_get_match_data(&pdev->dev);
+	mcd = device_get_match_data(&pdev->dev);
 	if (!mcd)
 		return -EINVAL;
 
@@ -586,7 +585,7 @@ EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
 int mtk_clk_simple_remove(struct platform_device *pdev)
 {
-	const struct mtk_clk_desc *mcd = of_device_get_match_data(&pdev->dev);
+	const struct mtk_clk_desc *mcd = device_get_match_data(&pdev->dev);
 	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
 	struct device_node *node = pdev->dev.of_node;
 
-- 
2.39.1


