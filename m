Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41A6C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 May 2022 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TTmGfiHr5DjYFA2xqlXaTWI50h99PNGnZ9U4sYBmraY=; b=zx5B5niO91FdGo
	hZQ1BF7qA1iMDOMdPAWekdYVq5+QnQKIt5hVjKXKvyABVJlgdL9401KbY7ged5Lt+JMCKbIR/Ho8B
	dtiTSY4xzdognbiQeNud5alUREDpjt7uvV6BoWcBFr9zgkEpC0blco+iCNE6UJWBpZ6haSAB+RMDM
	orEl5Tk/NwOgpWxuUQdDFFQEwuKn0RsfqSV/hcg77Dh7RjawQyIX9jyhqsP4DOSY92puLI3QiRRy0
	wkjK03ZVJp0938rZqgchHy31+yrTW5bsIAWvMKPf8jy0XxAA+CN3DUsyItn0MbJ7pOJOWPCIboF5D
	/1L3O2jvKRF4JMGP+PcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nskbT-001IhH-FV; Sun, 22 May 2022 12:22:35 +0000
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nskbG-001IbD-2Y
 for linux-mediatek@lists.infradead.org; Sun, 22 May 2022 12:22:24 +0000
Received: from pop-os.home ([86.243.180.246]) by smtp.orange.fr with ESMTPA
 id skb3n6umQV0xUskb3n9oTi; Sun, 22 May 2022 14:22:14 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 22 May 2022 14:22:14 +0200
X-ME-IP: 86.243.180.246
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dan.carpenter@oracle.com, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] i2c: mediatek: Fix an error handling path in mtk_i2c_probe()
Date: Sun, 22 May 2022 14:22:07 +0200
Message-Id: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_052222_309253_142CDA3B 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The clsk are prepared, enabled, then disabled. So if an error occurs after
the disable step, they are still prepared.

Add an error handling path to unprepare the clks in such a case, as already
done in the .remove function.

Fixes: 8b4fc246c3ff ("i2c: mediatek: Optimize master_xfer() and avoid circular locking")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-mt65xx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index bdecb78bfc26..8e6985354fd5 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1420,17 +1420,22 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Request I2C IRQ %d fail\n", irq);
-		return ret;
+		goto err_bulk_unprepare;
 	}
 
 	i2c_set_adapdata(&i2c->adap, i2c);
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret)
-		return ret;
+		goto err_bulk_unprepare;
 
 	platform_set_drvdata(pdev, i2c);
 
 	return 0;
+
+err_bulk_unprepare:
+	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
+
+	return ret;
 }
 
 static int mtk_i2c_remove(struct platform_device *pdev)
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
