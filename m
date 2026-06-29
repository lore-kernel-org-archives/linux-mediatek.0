Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0BBC43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=geRPSWvxvMn9jDj9k0oxQ8NVSaQtfwxbqr6vTa84l6I=; b=E+89M7LG5E8lLO/S/xlii3IbXP
	W7dApaGPVh/qGLIva7PBQGCGk1KCFHkcg58rR776heh0ZAA4tb4uHX3k2dUtRaUIknTGiHUtfzoiB
	Azcb+aJCh/IsQR2ssb5/oS9/ACuoV9TA2/Cdw50eydTssySzXYwsKTBh7O3d2AwrghOv5QHUzOD2l
	IDaWKiqF94wssbd7JeTXvHpcd3w5Rvxpe9+CJ1FaZFb8IFu+bQFF8LjxM07WKuPdNe1zIzf1G9JOJ
	w4Dp1FeuixDogRgyjc7Rqdocx4CXEk9NxV1epkAJW2PD67Atac4ljV5Fd5rhEYbILEF72sfr4zLXB
	jgOjW1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCuG-0000000Erzq-1ywz;
	Mon, 29 Jun 2026 14:24:16 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCuE-0000000EryN-17AM
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 14:24:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-37e4098e920so1291127a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743053; x=1783347853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geRPSWvxvMn9jDj9k0oxQ8NVSaQtfwxbqr6vTa84l6I=;
        b=svnKla/jiz/Fto50MswQye/+x0EAOS5ObWs39QicS8oVzdFNu1MYwOuis6sPFVpXwc
         JvO0Wov8teD7y2bMBrIWn+ivqSu999PJl8rZKcW2RJDEJbC4WLOMDNCetbe8SV+WIlWs
         YzZTFBBaEW1u3un6NcXpRF+2WqL+qCnVn6VaUb8n9lFqnmCHZbY0KJlloIF2S2UEL9Yu
         vT9bVD0UqdL3OsrIGqtzPUwpBkAnFMXNWtjD64PsBae2Gs83zoy8h9UsXVX4nfAN0pw1
         DAXy0kE9+RRW3Oiqws3JpCPresS+yCCrrihC8tSAjcLnvG2ahYpiBZASwEToj6YmBTQ8
         592g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743053; x=1783347853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geRPSWvxvMn9jDj9k0oxQ8NVSaQtfwxbqr6vTa84l6I=;
        b=b7nxsUAXlPd5NxEn9rD+kkTzf49rDnal7R3Mb0eTqd78jXUvysBvf5MT/7Rg77ISuT
         tItZjVMbY0Vtwn86Fp6vuAsaHwuEZR6qCPNizx8LuT1cd/m6xRVFbPFHnDu5l71uVOK5
         GZsLXyE23MBCQlH1PizQJu9WnGHiaXnJ2fkFEuUHC4ofwjZV62N83KsqCt9pGKg+9VLl
         c2CQxPr/2Xe3uIFfPhckmcsq31CuuMJDDhWeVITqk7/+rR178pVlnoTtFLqDn2ffhik/
         dzosZaTRPo5WzPkiOVTdj4fpDKwInOBEGQYxpw/1gtfGlM6Ij75DpqiEx4EPDF8+3K3N
         VpbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAtX7u4rkunTWWPRm9kJDM1AH3qFsVqShnkJzds8tFiV+vgwA5bEtHC62LysdSY1ZmXB1dHhl/1eQvUKmKfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWrHU6FmibCTMKQtK7WS5Vw3YZFFjqlX0HsX3hgzTfIydjPJyd
	qEK4rRjrrO7pYFOPeA99sG3GEMIgUxY0rIohzJE2HZMEFFHF4DOgjJdv
X-Gm-Gg: AfdE7cks3FCkfLLSOstrUq82uJowilXVJQkzHh9sqsP9irwkbRrmXR33KbTlFxGTjDU
	2pkJYWgpYV6SpXzFFDKBaEEXB2nhN4jpF8FqZGNlhM8cvAuAIFNLcdXI0t3hXrto4UwfXupKaVg
	xBI43XnBNqaunWjxFDcYdTXtRMPUh0FWo9jI0sCj+lo0ixAsCer3Lw9VZ9NQ95To5h+5cuvLu+A
	Ynfw1OQRW/Cz7wABLW/l0EGhENLxrn6rkBbKWmMGLYkaiA7Q2iPIOIoQOf8A5Q4wl+VzkgUVa4U
	MqE7mT3I510wSYm2rutQoAhL8XLUlCs5dJE8XFYryUH93YCG9CvENeX085OQ/XL1aBwU6l2FBWE
	iJsB9Fye0oI5UngZ6v9Ikge+X5tROaXdfL6XmyZgVD/nQzjWfRmCr1CB09kFovk573rhAHf8K/W
	LZYCuauem95QCr3OT+yMcCeoVhMTXUDIu2nn7STzWg0+ho
X-Received: by 2002:a17:90b:510f:b0:380:540:d49a with SMTP id 98e67ed59e1d1-3800540eb15mr3073658a91.7.1782743053280;
        Mon, 29 Jun 2026 07:24:13 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fd2bd0e49sm3919763a91.0.2026.06.29.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:24:12 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] clk: mediatek: fix memory leak on module removal
Date: Mon, 29 Jun 2026 23:23:40 +0900
Message-ID: <20260629142348.273766-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_072414_313926_CBE6FE9E 
X-CRM114-Status: GOOD (  10.79  )
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

Some MediaTek clock drivers do not call platform_set_drvdata() during
probe(), but their remove() callback calls platform_get_drvdata(). This
results in platform_get_drvdata() returning NULL, which leads to calling
mtk_free_clk_data(NULL) -> kfree(NULL).
Therefore, the actual clk_data is never released, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 1 +
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 1 +
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 1 +
 10 files changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..24522fc24019 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_plls:
diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..b607592a7c37 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..12146bb3b726 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,7 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..28faeb2e657a 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,7 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_composites:
diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..a9fc2e5536b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,7 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..b44baf521d2f 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,7 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..41e5cfbcbb76 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,7 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_plls:
diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..fe36d2eac3da 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..b923b73c64f6 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,7 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, clk_data);
 	return 0;
 
 unregister_clk_hw:
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..446c55b77777 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
 	return r;
 
 unregister_gates:
-- 
2.54.0


