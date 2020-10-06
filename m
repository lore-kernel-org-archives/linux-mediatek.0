Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59ADCC41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 19:34:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15E6206BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 19:33:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x8YOj2d/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15E6206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i09sJYs5uhbfMGxva01928LytREx4KWtuQYwioPioRM=; b=x8YOj2d/fj/bu31qQIfYefcsV
	abJrjtNxMR6IbzgrOr7wbPftzrvrGkZ+5mQdTzyybanZb+K1aqhsXqZ0QRRnab3MRUym/tnQGMduU
	oLFNXAYQgGHguDvnXxI0OODvUHmLBaDr0WOCKj61zuAN3H6/GdyWIhJIrrRMrLZtXhYl8MN8iuj3I
	NoFEdMwQc4G8TsZuCOroCPUbhBDHcG5ztHVBan7PfJGoMj+HMIusUm2a62DK5+9T/3gySnxrXRPbl
	ta3AXXeFueDnJLBX8eq79R7bL8hFZlDjT+F/3SPo8OMR9A7LH8pY2WkJHC8fOaOMESYnPWb1ExPGt
	oUPU9/APQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPsib-0001ZB-RU; Tue, 06 Oct 2020 19:33:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPsiK-0001SU-7y; Tue, 06 Oct 2020 19:33:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A560C29BD8D
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] soc: mediatek: mmsys: Create struct mtk_mmsys to store
 context data
Date: Tue,  6 Oct 2020 21:33:19 +0200
Message-Id: <20201006193320.405529-4-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006193320.405529-1-enric.balletbo@collabora.com>
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_153332_396400_3E38F37A 
X-CRM114-Status: GOOD (  14.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

Apart from the driver data, in order to extend the driver to support more
and more SoCs, we will need to store other configuration data. So, create
a mtk_mmsys struct to encapsulate all that information.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mtk-mmsys.c | 47 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 18f93979e14a..da2de8f6969e 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -101,6 +101,11 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
 };
 
+struct mtk_mmsys {
+	void __iomem *regs;
+	const struct mtk_mmsys_driver_data *data;
+};
+
 static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
 					  enum mtk_ddp_comp_id next,
 					  unsigned int *addr)
@@ -259,21 +264,21 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
 {
-	void __iomem *config_regs = dev_get_drvdata(dev);
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	unsigned int addr, value, reg;
 
 	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
 	if (value) {
-		reg = readl_relaxed(config_regs + addr) | value;
-		writel_relaxed(reg, config_regs + addr);
+		reg = readl_relaxed(mmsys->regs + addr) | value;
+		writel_relaxed(reg, mmsys->regs + addr);
 	}
 
-	mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
+	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
 
 	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
 	if (value) {
-		reg = readl_relaxed(config_regs + addr) | value;
-		writel_relaxed(reg, config_regs + addr);
+		reg = readl_relaxed(mmsys->regs + addr) | value;
+		writel_relaxed(reg, mmsys->regs + addr);
 	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
@@ -282,44 +287,46 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next)
 {
-	void __iomem *config_regs = dev_get_drvdata(dev);
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	unsigned int addr, value, reg;
 
 	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
 	if (value) {
-		reg = readl_relaxed(config_regs + addr) & ~value;
-		writel_relaxed(reg, config_regs + addr);
+		reg = readl_relaxed(mmsys->regs + addr) & ~value;
+		writel_relaxed(reg, mmsys->regs + addr);
 	}
 
 	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
 	if (value) {
-		reg = readl_relaxed(config_regs + addr) & ~value;
-		writel_relaxed(reg, config_regs + addr);
+		reg = readl_relaxed(mmsys->regs + addr) & ~value;
+		writel_relaxed(reg, mmsys->regs + addr);
 	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
 static int mtk_mmsys_probe(struct platform_device *pdev)
 {
-	const struct mtk_mmsys_driver_data *data;
 	struct device *dev = &pdev->dev;
 	struct platform_device *clks;
 	struct platform_device *drm;
-	void __iomem *config_regs;
+	struct mtk_mmsys *mmsys;
 	int ret;
 
-	config_regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(config_regs)) {
-		ret = PTR_ERR(config_regs);
+	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
+	if (!mmsys)
+		return -ENOMEM;
+
+	mmsys->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mmsys->regs)) {
+		ret = PTR_ERR(mmsys->regs);
 		dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, config_regs);
-
-	data = of_device_get_match_data(&pdev->dev);
+	mmsys->data = of_device_get_match_data(&pdev->dev);
+	platform_set_drvdata(pdev, mmsys);
 
-	clks = platform_device_register_data(&pdev->dev, data->clk_driver,
+	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
 					     PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
