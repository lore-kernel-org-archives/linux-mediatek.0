Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EAAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 12:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V0E7rTPa/AuKXEJXnWVOXIieUMQ2eTDz7jQkEhqUTxw=; b=vXBkQN1Qug6qw0
	1U/v/BD5mgOAp5BvwI9I3Rq0oFeGOhF6CmJnHQaG1/8rrnPpUmhE6c1/IYw0PhRMDi3qUJ0ooLimE
	PUZNKNfQHbE1khZk+dw9xOBK5b1EnkomdCNpC9HuYjHMlOC0eBBXQAD40FR89z1ObISrpSbreTxYv
	yH9BpQ84YQJPB0NqDO4VTZr2kW0ee7g1kF6SnHVboElPytO9OnhjIAGxUZHHexOAfL7y8fPgbj3GY
	Vb3XaQ+uxf7bxLCTF/OgT5IqP1N4jtdMrITtAzbLkOINkCfnuTGz9bEBLRqqetOWlTK2l8qAopguM
	c48biSVqCwyCQijORE+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naG3C-005a37-Hi; Fri, 01 Apr 2022 12:06:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naFy5-005SMj-Ga; Fri, 01 Apr 2022 12:01:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 25F001F47727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648814485;
 bh=Ok/bhlIM0JcCZb8uUTTHlofIc9Z9EPno2A7+s/1bFDQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Op+QHp0iloqxyfa1Cn2Yeh2TK3ot9GItyD/jtb9wXfbHh6TG9FzkV+O8+OZ5DQTZq
 Oy0Hoc8kqi9O5Ae7jG9rgk1jZc0gDRBbk5Sn3qdA6T9xiCX0l8/r7YVqDKEIKO/UZv
 uvbKBvyBeD/89q7D/MTrbCUWb67jqrO9Ke2/JKIv249eaMxiAiWKEy/6Iprb7ZHMs1
 dX4c7CNBQWYw3G4LKZ8E+MPNhQSawbr62f3lKNXbr3HkAbkQBj8fx11VFJhVVJOj/F
 Ff0WbpdoAQlb2R74FVVxi0I2MMlA6HS6/MlgFarMM5Y2llMWESHuBBX7mDhGqI4svA
 DU9Z/X0uCEerg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsa@kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] i2c: mediatek: Optimize master_xfer() and avoid circular
 locking
Date: Fri,  1 Apr 2022 14:01:20 +0200
Message-Id: <20220401120120.7498-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_050129_884961_A1D3065C 
X-CRM114-Status: GOOD (  14.25  )
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

Especially (but not only) during probe, it may happen that multiple
devices are communicating via i2c (or multiple i2c busses) and
sometimes while others are probing asynchronously.
For example, a Cr50 TPM may be filling entropy (or userspace may be
reading random data) while the rt5682 (i2c) codec driver reads/sets
some registers, like while getting/setting a clock's rate, which
happens both during probe and during system operation.

In this driver, the mtk_i2c_transfer() function (which is the i2c
.master_xfer() callback) was granularly managing the clocks by
performing a clk_bulk_prepare_enable() to start them and its inverse.
This is not only creating possible circular locking dependencies in
the some cases (like former explaination), but it's also suboptimal,
as clk_core prepare/unprepare operations are using mutex locking,
which creates a bit of unwanted overhead (for example, i2c trackpads
will call master_xfer() every few milliseconds!).

With this commit, we avoid both the circular locking and additional
overhead by changing how we handle the clocks in this driver:
- Prepare the clocks during probe (and PM resume)
- Enable/disable clocks in mtk_i2c_transfer()
- Unprepare the clocks only for driver removal (and PM suspend)

For the sake of providing a full explaination: during probe, the
clocks are not only prepared but also enabled, as this is needed
for somehardware initialization but, after that, we are disabling
but not unpreparing them, leaving an expected state for the
aforementioned clock handling strategy.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

This patch was successfully tested on various chromebooks with
different MediaTek SoCs.
All chromebooks are using a Cr50 TPM, trackpad and/or touchscreen
over i2c. Some of them are using a i2c audio codec as well.

 drivers/i2c/busses/i2c-mt65xx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index f651d3e124d6..bdecb78bfc26 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1177,7 +1177,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	int left_num = num;
 	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
 
-	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret)
 		return ret;
 
@@ -1231,7 +1231,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	ret = num;
 
 err_exit:
-	clk_bulk_disable_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	return ret;
 }
 
@@ -1412,7 +1412,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 	mtk_i2c_init_hw(i2c);
-	clk_bulk_disable_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
 			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
@@ -1439,6 +1439,8 @@ static int mtk_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adap);
 
+	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
+
 	return 0;
 }
 
@@ -1448,6 +1450,7 @@ static int mtk_i2c_suspend_noirq(struct device *dev)
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
 
 	i2c_mark_adapter_suspended(&i2c->adap);
+	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	return 0;
 }
@@ -1465,7 +1468,7 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 
 	mtk_i2c_init_hw(i2c);
 
-	clk_bulk_disable_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	i2c_mark_adapter_resumed(&i2c->adap);
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
