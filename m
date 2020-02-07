Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C6FC2D0B1
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 683B922464
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwxccuRJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cbwJqF5L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 683B922464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzzAKPHiXf1QrDS9HZxOBVOoNzyoMjBJ6+VJsk77yl8=; b=OwxccuRJrv8I49
	CHh1HZivyvrOX8D0sAMQe4WSZD4LbRCBL9rg9Vf5OJQ73l0eeE6PwzAyYipA13yIzuEmXD+r+OYWs
	gTOBV64knWZCZxO31WNRv/7A8BBwqhuMCPvtas4Pbo/wgCCRPLw4lGeE0BwKHQ3n4Rm1wqZUXh4pK
	N4CrEtbnjm6SxjtAiFqC5tyK+n3uEdBgilE1p5YBkeOd3RbA860ly6yQB8WgAw03z/S1eGNTbzEt8
	qgu/nEBDr3y9YeW9ZINtJHrvQ7ncvjMGcGYlaWFLQZgEGvQqipq2XaNXQ8hcRUj23pYZaNlXPNVR/
	SKX1h74ZhDe7PZHanlMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izwBI-00086S-5V; Fri, 07 Feb 2020 05:27:56 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izwAS-0007A0-3U
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 05:27:06 +0000
Received: by mail-pg1-x544.google.com with SMTP id l3so512357pgi.8
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 21:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Rktj1UzaVTSkLAiSen06jzBit+83cktzj3fD0HD7kE=;
 b=cbwJqF5LdFmJ/qXT+P2U0kEE5RjtyUrY9kFyxSui8DMhufpe3CsI7cvyTRJ5BH3wmV
 Wly6zDD8M8IacIvvz0SYuOT32xvt7F2yfDBhtBgFgUr/9dWrWOp8jK2DIJXKm+CV6oHV
 mGHCyfaIDixtoqBxdigSxQloXlo4reyzcyV50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Rktj1UzaVTSkLAiSen06jzBit+83cktzj3fD0HD7kE=;
 b=cH0ZO3Asn61qVqAI0cU3hF+i1Y9Wv7U0fgsGgYNJwaRkDHt+FNp6duTOUZpwyuobM/
 kEovXo3vEsh+vA6PCeFImyO3SMIy+CB5XVxoIOIqVAriQbSGMCM+wJba513f28dvlmev
 NCs59i+C9OCc6atxVO01ygHrTs4W25xlwZZTtZWtSqZwwrQurWnC+9E3EL9dTDQbsrJi
 Vkkw1xXxk4GnhUlm8jGaA02U4AWHDt0BtHxEyrEMyprJCL+nbcjmaG5t3KKN+BpU5YeO
 6PAUn968buVfRlV2d8DaMy3MX+f+fkPGKWsUVN6gKAlCXa/KnJ5Fv3iY52dhwron9vrw
 +vpA==
X-Gm-Message-State: APjAAAVYoP2j/X78M1IW24q/IZjGCDvfgg0uYhvJrDzzaRstXG7WM+uV
 2i7Iqxip9P0oFP+p+EPi/WHzcw==
X-Google-Smtp-Source: APXvYqweXTNpROSTv7zsir5SSka6HJp1fyZGesiOgZVLLXFyBkt1Z0NiUrzjpRO+VoSF5vO+0tIKcw==
X-Received: by 2002:aa7:9145:: with SMTP id 5mr8064993pfi.74.1581053222926;
 Thu, 06 Feb 2020 21:27:02 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:27:02 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 4/7] drm/panfrost: Add support for multiple regulators
Date: Fri,  7 Feb 2020 13:26:24 +0800
Message-Id: <20200207052627.130118-5-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_212704_178204_BB247008 
X-CRM114-Status: GOOD (  21.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some GPUs, namely, the bifrost/g72 part on MT8183, have a second
regulator for their SRAM, let's add support for that.

We extend the framework in a generic manner so that we could
support more than 2 regulators, if required.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

v4:
 - nits: Run through latest version of checkpatch:
   - Use WARN instead of BUG_ON.
   - Drop braces in single expression for loop.
   - *comp not * comp
v3:
 - Make this more generic, by allowing any number of regulators
   (in practice we fix the maximum number of regulators to 2, but
   this could be increased easily).
 - We only probe the second regulator if the device tree matching
   data asks for it.
 - I couldn't find a way to detect the number of regulators in the
   device tree, if we wanted to refuse to probe the device if there
   are too many regulators, which might be required for safety, see
   the thread on v2 [1].
 - The discussion also included the idea of a separate device tree
   entry for a "soft PDC", or at least a separate driver. I'm not
   sure to understand the full picture, and how different vendors
   implement this, so I'm still integrating everything in the main
   driver. I'd be happy to try to make mt8183 fit into such a
   framework after it's created, but I don't think I'm best placed
   to implement (and again, the main purpose of this was to test
   if the binding is correct).

[1] https://patchwork.kernel.org/patch/11322839/

 drivers/gpu/drm/panfrost/panfrost_device.c | 26 +++++++++++++-------
 drivers/gpu/drm/panfrost/panfrost_device.h | 15 +++++++++++-
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 28 +++++++++++++++-------
 3 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 238fb6d54df4732..3720d50f6d9f965 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -87,18 +87,27 @@ static void panfrost_clk_fini(struct panfrost_device *pfdev)
 
 static int panfrost_regulator_init(struct panfrost_device *pfdev)
 {
-	int ret;
+	int ret, i;
 
-	pfdev->regulator = devm_regulator_get(pfdev->dev, "mali");
-	if (IS_ERR(pfdev->regulator)) {
-		ret = PTR_ERR(pfdev->regulator);
-		dev_err(pfdev->dev, "failed to get regulator: %d\n", ret);
+	if (WARN(pfdev->comp->num_supplies > ARRAY_SIZE(pfdev->regulators),
+			"Too many supplies in compatible structure.\n"))
+		return -EINVAL;
+
+	for (i = 0; i < pfdev->comp->num_supplies; i++)
+		pfdev->regulators[i].supply = pfdev->comp->supply_names[i];
+
+	ret = devm_regulator_bulk_get(pfdev->dev,
+				      pfdev->comp->num_supplies,
+				      pfdev->regulators);
+	if (ret < 0) {
+		dev_err(pfdev->dev, "failed to get regulators: %d\n", ret);
 		return ret;
 	}
 
-	ret = regulator_enable(pfdev->regulator);
+	ret = regulator_bulk_enable(pfdev->comp->num_supplies,
+				    pfdev->regulators);
 	if (ret < 0) {
-		dev_err(pfdev->dev, "failed to enable regulator: %d\n", ret);
+		dev_err(pfdev->dev, "failed to enable regulators: %d\n", ret);
 		return ret;
 	}
 
@@ -107,7 +116,8 @@ static int panfrost_regulator_init(struct panfrost_device *pfdev)
 
 static void panfrost_regulator_fini(struct panfrost_device *pfdev)
 {
-	regulator_disable(pfdev->regulator);
+	regulator_bulk_disable(pfdev->comp->num_supplies,
+			pfdev->regulators);
 }
 
 int panfrost_device_init(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 06713811b92cdf7..c9468bc5573ac9d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -7,6 +7,7 @@
 
 #include <linux/atomic.h>
 #include <linux/io-pgtable.h>
+#include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
 #include <drm/drm_device.h>
 #include <drm/drm_mm.h>
@@ -19,6 +20,7 @@ struct panfrost_job;
 struct panfrost_perfcnt;
 
 #define NUM_JOB_SLOTS 3
+#define MAX_REGULATORS 2
 
 struct panfrost_features {
 	u16 id;
@@ -51,6 +53,16 @@ struct panfrost_features {
 	unsigned long hw_issues[64 / BITS_PER_LONG];
 };
 
+/*
+ * Features that cannot be automatically detected and need matching using the
+ * compatible string, typically SoC-specific.
+ */
+struct panfrost_compatible {
+	/* Supplies count and names. */
+	int num_supplies;
+	const char * const *supply_names;
+};
+
 struct panfrost_device {
 	struct device *dev;
 	struct drm_device *ddev;
@@ -59,10 +71,11 @@ struct panfrost_device {
 	void __iomem *iomem;
 	struct clk *clock;
 	struct clk *bus_clock;
-	struct regulator *regulator;
+	struct regulator_bulk_data regulators[MAX_REGULATORS];
 	struct reset_control *rstc;
 
 	struct panfrost_features features;
+	const struct panfrost_compatible *comp;
 
 	spinlock_t as_lock;
 	unsigned long as_in_use_mask;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b7a618db3ee223e..4d08507526239f2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -584,6 +584,10 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pfdev);
 
+	pfdev->comp = of_device_get_match_data(&pdev->dev);
+	if (!pfdev->comp)
+		return -ENODEV;
+
 	/* Allocate and initialze the DRM device. */
 	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
 	if (IS_ERR(ddev))
@@ -655,16 +659,22 @@ static int panfrost_remove(struct platform_device *pdev)
 	return 0;
 }
 
+const char * const default_supplies[] = { "mali" };
+static const struct panfrost_compatible default_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies),
+	.supply_names = default_supplies,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "arm,mali-t604" },
-	{ .compatible = "arm,mali-t624" },
-	{ .compatible = "arm,mali-t628" },
-	{ .compatible = "arm,mali-t720" },
-	{ .compatible = "arm,mali-t760" },
-	{ .compatible = "arm,mali-t820" },
-	{ .compatible = "arm,mali-t830" },
-	{ .compatible = "arm,mali-t860" },
-	{ .compatible = "arm,mali-t880" },
+	{ .compatible = "arm,mali-t604", .data = &default_data, },
+	{ .compatible = "arm,mali-t624", .data = &default_data, },
+	{ .compatible = "arm,mali-t628", .data = &default_data, },
+	{ .compatible = "arm,mali-t720", .data = &default_data, },
+	{ .compatible = "arm,mali-t760", .data = &default_data, },
+	{ .compatible = "arm,mali-t820", .data = &default_data, },
+	{ .compatible = "arm,mali-t830", .data = &default_data, },
+	{ .compatible = "arm,mali-t860", .data = &default_data, },
+	{ .compatible = "arm,mali-t880", .data = &default_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
