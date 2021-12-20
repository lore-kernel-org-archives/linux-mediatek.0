Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5F9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 13:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SvX4WAnpIFYLbdUGcTxyTgcQyJZ/cNxD1XvP9V2q5/I=; b=la03+/JESbuGne
	y3AAAH6AsJLxuCipZ4gG+LkRx2BWOG3shh0QupMjp/GWJ0KCx1/ofi+q2GDG7J7tLCZ89S8eqPv82
	4StM45lGeX/wIdaNN/BCip79LA5DiYhnFydVgSVo6VV3ssk1sVsFIpZrzGDJhLr/UFbu01sxHD0sK
	EOfJjuV4UbFeqRgipuR5GDEpcGLDeD+GpWb2trMYzndQdStq5zZMDt2TaNpvxrKvDLc77ZhutONWg
	wfjKFxEZpb6h4/t2vRgNd0V+/YLfYAJUK65QjJI6OmDSLjQiaHO/AB0PfVTUnZJYbIg8WlC+DlhzO
	3EeAS3WAtFK4Qx0BeWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzIew-002Wp0-2t; Mon, 20 Dec 2021 13:24:58 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzIei-002Wje-AN; Mon, 20 Dec 2021 13:24:45 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220839487"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="220839487"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 05:24:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="467386152"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 20 Dec 2021 05:24:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 846C2190; Mon, 20 Dec 2021 15:24:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Marc Zyngier <maz@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-unisoc@lists.infradead.org
Cc: Gregory Fong <gregory.0xf0@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v1 1/1] gpio: Remove unused local OF node pointers
Date: Mon, 20 Dec 2021 15:24:39 +0200
Message-Id: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_052444_421901_3664F0AF 
X-CRM114-Status: GOOD (  13.64  )
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

After the commit 448cf90513d9 ("gpio: Get rid of duplicate of_node
assignment in the drivers") the OF node local pointers become unused.
Remove them for good and make compiler happy about.

Fixes: 448cf90513d9 ("gpio: Get rid of duplicate of_node assignment in the drivers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-brcmstb.c | 2 +-
 drivers/gpio/gpio-gw-pld.c  | 1 -
 drivers/gpio/gpio-mt7621.c  | 5 ++---
 drivers/gpio/gpio-rda.c     | 1 -
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 176c264bb959..74ef89248867 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -704,7 +704,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		}
 
 		gc->owner = THIS_MODULE;
-		gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
+		gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
 		if (!gc->label) {
 			err = -ENOMEM;
 			goto fail;
diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
index 77a3fbd46111..2109803ffb38 100644
--- a/drivers/gpio/gpio-gw-pld.c
+++ b/drivers/gpio/gpio-gw-pld.c
@@ -71,7 +71,6 @@ static int gw_pld_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
-	struct device_node *np = dev->of_node;
 	struct gw_pld *gw;
 	int ret;
 
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 52b49e7a0a80..ccaad1cb3c2e 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -205,8 +205,7 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
 }
 
 static int
-mediatek_gpio_bank_probe(struct device *dev,
-			 struct device_node *node, int bank)
+mediatek_gpio_bank_probe(struct device *dev, int bank)
 {
 	struct mtk *mtk = dev_get_drvdata(dev);
 	struct mtk_gc *rg;
@@ -310,7 +309,7 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mtk);
 
 	for (i = 0; i < MTK_BANK_CNT; i++) {
-		ret = mediatek_gpio_bank_probe(dev, np, i);
+		ret = mediatek_gpio_bank_probe(dev, i);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 0d03f525dcd3..62ba18b3a602 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -197,7 +197,6 @@ static void rda_gpio_irq_handler(struct irq_desc *desc)
 
 static int rda_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
 	struct rda_gpio *rda_gpio;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
