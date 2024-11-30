Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17442D73604
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Nov 2024 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OSHwRqHVpOIG2JrOXS69Jq4ftU8zIW/MyIo0a+5/w9E=; b=qY9JLK4l+g0Tuew2+WDZ0heLFn
	ZDwt2saYj0BLl2MPMVrIa1K6dswwVOcVLH4cOd0EXKVW6riM7uMT9tj5jJQpWj7gAHbMSEMOu0Rby
	ImCxOYaISOdS5hyNr6HQSIrYebUqeaMzkillPTi8/ozdtPC7UUqpWIFoXKUb6Gxcx9nagRxNtmOpX
	3FxjSjvd2YHOr3kMPcwKrjEqM8k+dsDc0g4OgTdITRfRNMax5i8DrZwoXuEjMglUJ6PdhYOicexxj
	8UuuvR4Eo8PEMWhV6AC8oc+pHf9uJw7DRQQn4/2UQFuurkwY0LunVGfyeu7inU35TioThvZULUNl0
	3bjDtbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHO0N-000000026ty-0Vb9;
	Sat, 30 Nov 2024 13:59:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHNzN-000000026p2-2Rzl
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Nov 2024 13:58:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434a766b475so25008985e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Nov 2024 05:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732975103; x=1733579903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OSHwRqHVpOIG2JrOXS69Jq4ftU8zIW/MyIo0a+5/w9E=;
        b=H/LZFoLBRgWu7XjuSWz/wgRhOH8g7gHMd2y1s/KJtGSmwGH7US7JsTzUxupaGlbKNQ
         qnIfGQeXJxD+K3HqIzVBwWXmzH6MWq/JuB8ILzEMJXjjXRMv7vA8U1g7xAZwSbGD1WHb
         lxNsdplEqnNdR/kSJuly02MIUuGGsJHRQaetkg1RDa+t+7a0OryT8Eh8Vry0v1L0NmAs
         WmSSCh2uUpXnmFjO/DJNtMTeWNNBTLf9aekkIYmzDmeGWrKYRgMoxu3Om+L4mBoq97fq
         UNRP6RRnTyiNBQ3hHQE3KnD+d/EAXUkzIxVWP9UF/tKMZ+DLfdsZIfB1IpENACwHjqRl
         tBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732975103; x=1733579903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSHwRqHVpOIG2JrOXS69Jq4ftU8zIW/MyIo0a+5/w9E=;
        b=kWe3LOzPnxSWeL/K9VR7PsQU8lIqFNiSJ2ehEtqgFrDzYcC+0wj/TUf2rwyNomeSZC
         g2oFifVcWATZwOAqCtACXn2qJfdBENionpK+AW4lDc3wZFEJqhBH0u+X2c2HCZsgf0l+
         gA4y8J4/kilIyP/1rDLFEwGE5lcDcmhyQcJNj7oQdF0HCwe6LpShrASRrJ66fBVOa9Q4
         ws2qxK99KKRWmln1y9k4oXR4CUxuH5vd2ufIGsZKy1LlWuos/hfRBEgAK1aAKuHPp7SX
         tU7oSVchjAV5l5o7F04zENLURQLQw+Zq51Ux6D4WR6Fm9ORbPOWSEM9dR2OIQ/uux945
         8Iqg==
X-Forwarded-Encrypted: i=1; AJvYcCX6YMSxUnZb4BqoCdmEfHZ6SJIJoCcihShszbQnQzln+o48wRwD9pU7d51hcZY3vMgkoZabUlQ7d/XoWQVHWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOHXvNfZq+i6VddEsRSiwVc8iMA394M59t+U67gxTfnbGoszWA
	2ppSQX3fpVjkBmhuUgyGGaA7FEMgytdQHMpQzuvdd2Ccv1XXhWeAAYnErURfZF0=
X-Gm-Gg: ASbGncuVJO+yApTrpJNCxcpNqRS+df4he2z7ay/3qEih0Qb8mVjS9vJ7kcO1kjgQR3J
	v/C+joGusLn4K3iRFd+2zB2nJBilRIbKL67zLimSVJEqzSI8yGhpYyq5PVs+om/BoJoF3sg0VKF
	BQ4wDrDJm/zKqHtMhTDPbJ4fFJEiKmroFQbJW/aYPL5dQJsaJnyTeQ4Pz1BGCMyS5yq1iwY/grV
	xL9Oeo5CigZM6ddSV3265pwnG6/9u06Up2P7uOy5ZyPAf5COEXrnYE=
X-Google-Smtp-Source: AGHT+IHHBe7d5htoj70/kfSxdm+kZQjM0tjaIphEphbFBlZoaGAn1iAgRxGbS4k2FdQNlTMpb9szHA==
X-Received: by 2002:a05:600c:1e2a:b0:434:a8ef:442f with SMTP id 5b1f17b1804b1-434a9e0b47amr130603305e9.32.1732975102930;
        Sat, 30 Nov 2024 05:58:22 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db59sm7209061f8f.11.2024.11.30.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 05:58:21 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] devfreq: Switch back to struct platform_driver::remove()
Date: Sat, 30 Nov 2024 14:58:11 +0100
Message-ID: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4431; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=uZqTpKr93naOghYTr0iK9IfYdelZY2f/4l+5kxDMpfQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnSxn2/gYVC8rkX/fl3aGkXakkNgP43aHdtARV8 OWxfSCpITGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0sZ9gAKCRCPgPtYfRL+ TtpSB/4zIRpdyNmt2fGjIAeqqboAJR/YHNuFmvrjp8Drq7BhxBmFEjklrLsdnM1D8xJ5bFpqfMt 3g3BmsnnVn5Ievf+Rgcjdad0fazJd8PkmhOKtpmlxhQBHOGgdt3gIMLDcreOU0uSgchS/gRERs6 OQW82e3EqDHrAE6Vc+3Qi61FU/ZlMF1nqYl1+99RsW8bvRLfXVqfnDpu8ICue/NpESiicBfveka TqbEyaEcVjC3oB+UloPneKYxzreyyW/95x403cjGd3zjLiW0e/ZY3NfQI/fj6v+QVkJWdTBa697 6PLuqyWiHcdrpQA+5R1YdF54B/MbB273AjfAkpjaeAGRTtZx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_055825_884409_0F1F1EFF 
X-CRM114-Status: GOOD (  19.24  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/devfreq to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

While touching these drivers, make the alignment of the touched
initializers consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on Friday's next, feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

This is merge window material.

Best regards
Uwe

 drivers/devfreq/event/exynos-nocp.c | 6 +++---
 drivers/devfreq/event/exynos-ppmu.c | 6 +++---
 drivers/devfreq/mtk-cci-devfreq.c   | 4 ++--
 drivers/devfreq/rk3399_dmc.c        | 8 ++++----
 drivers/devfreq/sun8i-a33-mbus.c    | 2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/devfreq/event/exynos-nocp.c b/drivers/devfreq/event/exynos-nocp.c
index 5edc522f715c..9480a92fc265 100644
--- a/drivers/devfreq/event/exynos-nocp.c
+++ b/drivers/devfreq/event/exynos-nocp.c
@@ -283,10 +283,10 @@ static void exynos_nocp_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver exynos_nocp_driver = {
-	.probe	= exynos_nocp_probe,
-	.remove_new = exynos_nocp_remove,
+	.probe = exynos_nocp_probe,
+	.remove = exynos_nocp_remove,
 	.driver = {
-		.name	= "exynos-nocp",
+		.name = "exynos-nocp",
 		.of_match_table = exynos_nocp_id_match,
 	},
 };
diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index 7002df20a49e..a738e6145612 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -700,10 +700,10 @@ static void exynos_ppmu_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver exynos_ppmu_driver = {
-	.probe	= exynos_ppmu_probe,
-	.remove_new = exynos_ppmu_remove,
+	.probe = exynos_ppmu_probe,
+	.remove = exynos_ppmu_remove,
 	.driver = {
-		.name	= "exynos-ppmu",
+		.name = "exynos-ppmu",
 		.of_match_table = exynos_ppmu_id_match,
 	},
 };
diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 7ad5225b0381..3938878b2279 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -429,8 +429,8 @@ static const struct of_device_id mtk_ccifreq_machines[] = {
 MODULE_DEVICE_TABLE(of, mtk_ccifreq_machines);
 
 static struct platform_driver mtk_ccifreq_platdrv = {
-	.probe	= mtk_ccifreq_probe,
-	.remove_new = mtk_ccifreq_remove,
+	.probe = mtk_ccifreq_probe,
+	.remove = mtk_ccifreq_remove,
 	.driver = {
 		.name = "mtk-ccifreq",
 		.of_match_table = mtk_ccifreq_machines,
diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
index d405cee92c25..158e4bbd08cc 100644
--- a/drivers/devfreq/rk3399_dmc.c
+++ b/drivers/devfreq/rk3399_dmc.c
@@ -473,11 +473,11 @@ static const struct of_device_id rk3399dmc_devfreq_of_match[] = {
 MODULE_DEVICE_TABLE(of, rk3399dmc_devfreq_of_match);
 
 static struct platform_driver rk3399_dmcfreq_driver = {
-	.probe	= rk3399_dmcfreq_probe,
-	.remove_new = rk3399_dmcfreq_remove,
+	.probe = rk3399_dmcfreq_probe,
+	.remove = rk3399_dmcfreq_remove,
 	.driver = {
-		.name	= "rk3399-dmc-freq",
-		.pm	= &rk3399_dmcfreq_pm,
+		.name = "rk3399-dmc-freq",
+		.pm = &rk3399_dmcfreq_pm,
 		.of_match_table = rk3399dmc_devfreq_of_match,
 	},
 };
diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index bcf654f4ff96..a405bab1a63e 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -495,7 +495,7 @@ static SIMPLE_DEV_PM_OPS(sun8i_a33_mbus_pm_ops,
 
 static struct platform_driver sun8i_a33_mbus_driver = {
 	.probe	= sun8i_a33_mbus_probe,
-	.remove_new = sun8i_a33_mbus_remove,
+	.remove	= sun8i_a33_mbus_remove,
 	.driver	= {
 		.name		= "sun8i-a33-mbus",
 		.of_match_table	= sun8i_a33_mbus_of_match,

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2


