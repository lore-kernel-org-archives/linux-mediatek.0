Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EFAC7619A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 02:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zKNnmllVUA9h7Pu0RJiwcwpL9K76ysrtH28pnwCevCQ=; b=cKPvzoYHHbVguRqNxNA5xlqtzX
	Pg39P/lybXDj/dmTmUO5hHHht4uN7H8i/B9FGzXHwX7Gp8U1QVbjMyIdU4lsQNsZYFfKLk6Kme9vh
	4LOGMKSLl9cw3sBZvkAgBUQ9EtOSU+LZSEE+rzQ6vhIEQMJuxa50No6kYhGNAj66c+BlPi0sZmBJz
	q7YY2LLMS4p2OzHVAG0reuizE2+phex0vT/uDSxgWyUikDjA5CaNj7I2YUGlEGEZ3pTVfAIF+mdIV
	1z8opiHj/KezNNd4h3d1mwUIPLZdlVwWFfSKqInufo6Y5BFEj7DyJvmaK22RB2beya7Xxy1Li2tBc
	ZE7PNmMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWzs-003N1G-39;
	Fri, 24 Mar 2023 02:17:40 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWzp-003Mzd-0Y;
	Fri, 24 Mar 2023 02:17:38 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PjQpR5MFJz6FK2R;
	Fri, 24 Mar 2023 10:17:35 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 32O2HSAr099065;
	Fri, 24 Mar 2023 10:17:28 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 24 Mar 2023 10:17:29 +0800 (CST)
Date: Fri, 24 Mar 2023 10:17:29 +0800 (CST)
X-Zmail-TransId: 2afa641d0839310-a3de9
X-Mailer: Zmail v1.0
Message-ID: <202303241017290414354@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <matthias.bgg@gmail.com>
Cc: <angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?B?W1BBVENIXSBzb2M6IG1lZGlhdGVrOiBtdXRleDogVXNlIGRldl9lcnJfcHJvYmUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 32O2HSAr099065
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 641D083F.001/4PjQpR5MFJz6FK2R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_191737_365783_96656451 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/soc/mediatek/mtk-mutex.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 7751527fc30d..05c8ad3c2664 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -1014,11 +1014,8 @@ static int mtk_mutex_probe(struct platform_device *pdev)

 	if (!mtx->data->no_clk) {
 		mtx->clk = devm_clk_get(dev, NULL);
-		if (IS_ERR(mtx->clk)) {
-			if (PTR_ERR(mtx->clk) != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get clock\n");
-			return PTR_ERR(mtx->clk);
-		}
+		if (IS_ERR(mtx->clk))
+			return dev_err_probe(dev, PTR_ERR(mtx->clk), "Failed to get clock\n");
 	}

 	mtx->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
-- 
2.25.1

