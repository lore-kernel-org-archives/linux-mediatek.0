Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69F2C64EC7
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4PBi2mvqWqsHQPg9K9rk+oelG9TcjukgW7WIAxwFds=; b=RNTfYPjvHXXqykAuy2Ixk/l7a/
	rkD/73zLTelTU/ZFawBBmRth5vbs+0alJ4KoVN+JkwpeP/r2orQ6X23d7siBP9Vr38OlxXCuuZmwk
	DCAt9Py6zCejPSw3jAkYVCQej/Cvsj9lA7p0c5O7XABoug/kB+1yzMBR6POTFNCMNWuKCHG6hcq3i
	jlwQC4FXvGRx9WCkaxrP8UsZzCZhBoOo8fhkbGnAaxdZGOHmU5pg6A2SZkbw0WpbAMTvXlFkPIFPD
	QIHfjtETkVXzS8RIGsC1fKfIh7V1ZE3i3G8Q72tSsJyaZRZ1NAJNw/NG7KTIVr5lNH9VIKR2HK4j7
	dYozaHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7fc-004NJf-4K; Mon, 20 Feb 2023 15:01:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7fO-004NC3-Ue; Mon, 20 Feb 2023 15:01:24 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F54F6602166;
	Mon, 20 Feb 2023 15:01:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905277;
	bh=l5BdwmfyxbZlaujYTSJF7PTIlSpQy1drDejxx2IavtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q9k3WpRwohnh0ddpZBv2F8RzE2vZ8ybMmqPZ3Ol+zbDQ8DevqOR15+5wuoRGu/L/X
	 hOowa9m7SNzaY51EuCVlT17vgVyhGWbWGEogWs076oXe6Fp21dWj576jUOFVaMM1ed
	 Q+Xtl27e0I5oWtH+ZWCh3up7LxbSqAYsYP2Py3Vdho7H+U8/i4U12Xel5vfX90Vx3f
	 V7z4B1Et8q3j86dr5yXgY/udJTrGa8IxpG7LWaLjbpoxpKa8GnNzvGvcPhSVHHy9YN
	 Y6nkeZvlH0yQxC/e0dzYE+QibiSHiWAUaMteXYqnTUrU+MtAGyPuavQk3xIhYmDEci
	 3f7vka0niC4xg==
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
Subject: [PATCH v3 01/55] clk: mediatek: clk-mtk: Switch to device_get_match_data()
Date: Mon, 20 Feb 2023 16:00:17 +0100
Message-Id: <20230220150111.77897-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070123_238831_42B9DB4E 
X-CRM114-Status: GOOD (  10.88  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
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


