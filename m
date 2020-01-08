Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0383C3F68F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 05:25:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBB62070E
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 05:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r2Fd+bRI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FDcmjcfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EBB62070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=af5q34ZmrGcc7W/9KokNNgsFID/2aEp6R6P9aOjeXU0=; b=r2Fd+bRIzSmahD
	aaPpSFH/wzGkE219qusq22M+jpVio8Sdxq/Dhi8zOSQDZIfpAbDe/oMswDR6iQi0SZMGTaChOg9IT
	giaceVDAFBFycnHix22ru6lstr68lCX3uUOYD84va5UqjXdiTkxtfJaYCCVQyguWRgs1BMrfIWJg6
	WjGxSCQOXED9pSpmeEvFMGE5+Zmp+/PvHF9rCHlhFcpDWKjTJ3u/FbERgkoDqn7qEbS5reJmIIOWD
	smef9h3A0z537NtItRho14G5Ic/2ImZ1k7eMGM5jFhAZXWBUEhz70W/b36GZIstKM8YmTlH16Rj/x
	40ucyp2QmhXaigilkl0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip3qU-0007Oc-L0; Wed, 08 Jan 2020 05:25:30 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip3pC-0004u9-Ek
 for linux-mediatek@lists.infradead.org; Wed, 08 Jan 2020 05:24:12 +0000
Received: by mail-pl1-x642.google.com with SMTP id c23so636949plz.4
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2020 21:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ra+20wVCtfatvw0K5yioGbAxlT9AXOAj2fQq6fBwVqo=;
 b=FDcmjcfuosKrI1aVlpORYzf8ILvaDJIrH3VeYHavKxE5uksMP8wy+dqr+rtKJisPrE
 xlYwd3lJXAmmyLWii0G328QSVx2jDBV4cxAewFF92xHO+tmLrnXLqN8Ecyy75QFduPs7
 CEirAlKXuTSmlbnNiX0sxmPpxKElpSFVyZKcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ra+20wVCtfatvw0K5yioGbAxlT9AXOAj2fQq6fBwVqo=;
 b=c0eks0s29g98ZdZrm2R/66U3TXpTHZAuo4Huz4vc3/e/rruNiAY3p3WBgZaUVd3ENJ
 n0kJ9+jnvuC6K7XGTmg1oiHeCNgFpwLeRummZPM9P6iyKv4+zRZ00J1A5SVW9jPyGeq2
 b5A7+Oa17FMpqBJcisNNBRZKXjFmpXY4QouThFHv0zt/VwjFviElzwj69MFLWBEo9+BR
 S+HNorkt8rm3QcLUpUqje0MnGRgq8PtK0aNhn/4KZIrUK3hHo5U4u6Dg/2WDoCLAiHv0
 eQbtECbm2JqNcoBXLbw6YdXFJgi4GJPgz9i97e9xmEjZ5AFc+Qc6H4aC+1p2Pr87CXKj
 Olpw==
X-Gm-Message-State: APjAAAURmNAl5ruV1OckCfx1A7cXRwswFuVCIE0R72lxvCgzc61Ib2v5
 KRnI/KSne6jiz5oPVzuDtFcy6g==
X-Google-Smtp-Source: APXvYqxY4WiSpt87/FZwdfEEf+Pbv809uvPrWp4yZnui6jFSnmuTtOBb/0vcAlWflwuVhfVm7OsonA==
X-Received: by 2002:a17:90a:e389:: with SMTP id b9mr2426783pjz.7.1578461049926; 
 Tue, 07 Jan 2020 21:24:09 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id n24sm387505pff.12.2020.01.07.21.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:24:09 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 5/7] drm/panfrost: Add support for multiple power domain
 support
Date: Wed,  8 Jan 2020 13:23:35 +0800
Message-Id: <20200108052337.65916-6-drinkcat@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_212410_526266_C1217C48 
X-CRM114-Status: GOOD (  16.82  )
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When there is a single power domain per device, the core will
ensure the power domains are all switched on.

However, when there are multiple ones, as in MT8183 Bifrost GPU,
we need to handle them in driver code.


Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

The downstream driver we use on chromeos-4.19 currently uses 2
additional devices in device tree to accomodate for this [1], but
I believe this solution is cleaner.

[1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#31

drivers/gpu/drm/panfrost/panfrost_device.c | 87 ++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_device.h |  4 +
 2 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index a0b0a6fef8b4e63..c6e9e059de94a4d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -5,6 +5,7 @@
 #include <linux/clk.h>
 #include <linux/reset.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 
 #include "panfrost_device.h"
@@ -131,6 +132,67 @@ static void panfrost_regulator_fini(struct panfrost_device *pfdev)
 	regulator_disable(pfdev->regulator_sram);
 }
 
+static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
+		if (!pfdev->pm_domain_devs[i])
+			break;
+
+		if (pfdev->pm_domain_links[i])
+			device_link_del(pfdev->pm_domain_links[i]);
+
+		dev_pm_domain_detach(pfdev->pm_domain_devs[i], true);
+	}
+}
+
+static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
+{
+	int err;
+	int i, num_domains;
+
+	num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
+						 "power-domains",
+						 "#power-domain-cells");
+	/* Single domains are handled by the core. */
+	if (num_domains < 2)
+		return 0;
+
+	if (num_domains > ARRAY_SIZE(pfdev->pm_domain_devs)) {
+		dev_err(pfdev->dev, "Too many pm-domains: %d\n", num_domains);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_domains; i++) {
+		pfdev->pm_domain_devs[i] =
+			dev_pm_domain_attach_by_id(pfdev->dev, i);
+		if (IS_ERR(pfdev->pm_domain_devs[i])) {
+			err = PTR_ERR(pfdev->pm_domain_devs[i]);
+			pfdev->pm_domain_devs[i] = NULL;
+			dev_err(pfdev->dev,
+				"failed to get pm-domain %d: %d\n", i, err);
+			goto err;
+		}
+
+		pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
+				pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
+				DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
+		if (!pfdev->pm_domain_links[i]) {
+			dev_err(pfdev->pm_domain_devs[i],
+				"adding device link failed!\n");
+			err = -ENODEV;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	panfrost_pm_domain_fini(pfdev);
+	return err;
+}
+
 int panfrost_device_init(struct panfrost_device *pfdev)
 {
 	int err;
@@ -161,37 +223,45 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 		goto err_out1;
 	}
 
+	err = panfrost_pm_domain_init(pfdev);
+	if (err) {
+		dev_err(pfdev->dev, "pm_domain init failed %d\n", err);
+		goto err_out2;
+	}
+
 	res = platform_get_resource(pfdev->pdev, IORESOURCE_MEM, 0);
 	pfdev->iomem = devm_ioremap_resource(pfdev->dev, res);
 	if (IS_ERR(pfdev->iomem)) {
 		dev_err(pfdev->dev, "failed to ioremap iomem\n");
 		err = PTR_ERR(pfdev->iomem);
-		goto err_out2;
+		goto err_out3;
 	}
 
 	err = panfrost_gpu_init(pfdev);
 	if (err)
-		goto err_out2;
+		goto err_out3;
 
 	err = panfrost_mmu_init(pfdev);
 	if (err)
-		goto err_out3;
+		goto err_out4;
 
 	err = panfrost_job_init(pfdev);
 	if (err)
-		goto err_out4;
+		goto err_out5;
 
 	err = panfrost_perfcnt_init(pfdev);
 	if (err)
-		goto err_out5;
+		goto err_out6;
 
 	return 0;
-err_out5:
+err_out6:
 	panfrost_job_fini(pfdev);
-err_out4:
+err_out5:
 	panfrost_mmu_fini(pfdev);
-err_out3:
+err_out4:
 	panfrost_gpu_fini(pfdev);
+err_out3:
+	panfrost_pm_domain_fini(pfdev);
 err_out2:
 	panfrost_reset_fini(pfdev);
 err_out1:
@@ -208,6 +278,7 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
 	panfrost_mmu_fini(pfdev);
 	panfrost_gpu_fini(pfdev);
 	panfrost_reset_fini(pfdev);
+	panfrost_pm_domain_fini(pfdev);
 	panfrost_regulator_fini(pfdev);
 	panfrost_clk_fini(pfdev);
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index a124334d69e7e93..92d471676fc7823 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -19,6 +19,7 @@ struct panfrost_job;
 struct panfrost_perfcnt;
 
 #define NUM_JOB_SLOTS 3
+#define MAX_PM_DOMAINS 3
 
 struct panfrost_features {
 	u16 id;
@@ -62,6 +63,9 @@ struct panfrost_device {
 	struct regulator *regulator;
 	struct regulator *regulator_sram;
 	struct reset_control *rstc;
+	/* pm_domains for devices with more than one. */
+	struct device *pm_domain_devs[MAX_PM_DOMAINS];
+	struct device_link *pm_domain_links[MAX_PM_DOMAINS];
 
 	struct panfrost_features features;
 
-- 
2.24.1.735.g03f4e72817-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
