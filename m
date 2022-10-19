Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB1C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aSWMexj11dFUHv4EIqD/p73rCxI5Rbm9JP/7r0sLjgg=; b=nzv6xP46vv507zlHukCCZ85EJN
	a+Py5KgT65FPxyJf6Z7g1QYbnL8cr6LLJGC2hvryZU1ax141IR+r0bFu3v6bJFSGbvZxb5ujGZ8gJ
	1TYOjRULxthIZOiTWEd4HuU6YIU2zesD2TbflsCiKWUWstOoA8tmY7hiJpVt+1WPEQTgkil/rVdrZ
	5E/LFeiOdZ49bmyk5RrOEiQM4Z/fINF/3/lYDVp39mpXIrgOH7Iqqe1Ae4a0B+Q4a15L88o1nJpTd
	hDq+oiqXhEfGnRzVy17+dmMsmOI4MSRI9KNjSZ5Cp9qmBJmvrnhlN4xJfEusahZjGYcRkxE7FnCvs
	ebyo5vRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olATs-002wFU-0L; Wed, 19 Oct 2022 14:55:40 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olACt-002pSh-1M; Wed, 19 Oct 2022 14:38:08 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1olACX-0000nH-HZ; Wed, 19 Oct 2022 16:37:45 +0200
Date: Wed, 19 Oct 2022 15:37:35 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-iio@vger.kernel.org
Cc: David Bauer <mail@david-bauer.net>,
	Gwendal Grignou <gwendal@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] iio: adc: mt6577_auxadc: add optional 32k clock
Message-ID: <f98ed7f3fc15a0614443a57427d46ce17ec2e0cc.1666190235.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_073807_113069_1060EF14 
X-CRM114-Status: GOOD (  13.40  )
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

MediaTek MT7986 and MT7981 require an additional clock to be brought up
for AUXADC. Add support for that in the driver, similar to how it's
done in MediaTek's SDK[1].

[1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/target/linux/mediatek/patches-5.4/500-auxadc-add-auxadc-32k-clk.patch
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/iio/adc/mt6577_auxadc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index 0e134777bdd248..e28e9691cae22a 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -42,6 +42,7 @@ struct mtk_auxadc_compatible {
 struct mt6577_auxadc_device {
 	void __iomem *reg_base;
 	struct clk *adc_clk;
+	struct clk *adc_32k_clk;
 	struct mutex lock;
 	const struct mtk_auxadc_compatible *dev_comp;
 };
@@ -227,6 +228,12 @@ static int mt6577_auxadc_resume(struct device *dev)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(adc_dev->adc_32k_clk);
+	if (ret) {
+		pr_err("failed to enable auxadc clock\n");
+		return ret;
+	}
+
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
 			      MT6577_AUXADC_PDN_EN, 0);
 	mdelay(MT6577_AUXADC_POWER_READY_MS);
@@ -241,6 +248,8 @@ static int mt6577_auxadc_suspend(struct device *dev)
 
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
 			      0, MT6577_AUXADC_PDN_EN);
+
+	clk_disable_unprepare(adc_dev->adc_32k_clk);
 	clk_disable_unprepare(adc_dev->adc_clk);
 
 	return 0;
@@ -282,6 +291,17 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	adc_dev->adc_32k_clk = devm_clk_get_optional(&pdev->dev, "32k");
+	if (IS_ERR(adc_dev->adc_32k_clk)) {
+		dev_err(&pdev->dev, "failed to get auxadc 32k clock\n");
+		return PTR_ERR(adc_dev->adc_32k_clk);
+	}
+	ret = clk_prepare_enable(adc_dev->adc_32k_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable auxadc 32k clock\n");
+		return ret;
+	}
+
 	adc_clk_rate = clk_get_rate(adc_dev->adc_clk);
 	if (!adc_clk_rate) {
 		ret = -EINVAL;
@@ -311,6 +331,7 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
 			      0, MT6577_AUXADC_PDN_EN);
 err_disable_clk:
+	clk_disable_unprepare(adc_dev->adc_32k_clk);
 	clk_disable_unprepare(adc_dev->adc_clk);
 	return ret;
 }
@@ -325,6 +346,7 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
 			      0, MT6577_AUXADC_PDN_EN);
 
+	clk_disable_unprepare(adc_dev->adc_32k_clk);
 	clk_disable_unprepare(adc_dev->adc_clk);
 
 	return 0;
-- 
2.37.3


