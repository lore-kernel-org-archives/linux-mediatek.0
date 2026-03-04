Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AAEEFCE38
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbrHSPPxep6X+vivH1+ezOTNFT57/EKHgyG9LJdna2A=; b=ABHmgoVFPhKh89qxBEJq1ekclh
	RdmoufRDsTyjH771G4CSKWANZi98iXSNY541w++WMHlgmS2HGLHFnyPxh1H8nOYgT5nXx9BvHHokP
	2sNdICTn45J+IcZzFNYx9MTwT8xU9M1OXtCue5cgHPItAW4sw7OpTD/v+n8Iw8YFp6q/OgBKKH5rs
	vERogPgVJBT/atLXH17MjfkGKqR7Zo+hhA+SxoBWOBMhyB6ZfrNwtsQ8dSr407AbZ4yInwU5itdGq
	yJLZOnDAAOuzeQNomO5wVz1oivgk3dx6K/Kv+mfzV/wZMUt0ENL4KN8KbJLyZ9lN4cSCtY5ZQJLNi
	VRdv9cgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqhA-00000000JMg-2e7z;
	Wed, 04 Mar 2026 18:11:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqh8-00000000JLB-1x49
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 18:11:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-827270d50d4so7526031b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647898; x=1773252698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbrHSPPxep6X+vivH1+ezOTNFT57/EKHgyG9LJdna2A=;
        b=Ips51icFPPsiluaIGBhc2dpzkqm5ElP0mSlJs4MHGDarssEJO0/gGhVo2yAUfzOq0x
         EnAcAHW2JvSwmxs5cR68gO0Zi6+iBJgklnjL2sP8Dlg6CTcq0dPsGSDEb9Ah8CNVQ36+
         i97dvpkgJFoBkKl3gnE8HqVqjN3bSdfRNhIFkP8mJ5cpCBzEBQ1vatnFSw//Kz0dUR0h
         sk24yjIjeu/6slPZCLsvHYYIS6PnOVmDGOT0KJzMA/Rw0Z1l07ynVZkMjSzTRKV0p7Im
         Ia7Jn8cOdVvcQ9AxR17xhaCGQU13YEWHLw3WR//EyFt+WqhpSwomMArqzSuRYX8e3Mkv
         T0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647898; x=1773252698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IbrHSPPxep6X+vivH1+ezOTNFT57/EKHgyG9LJdna2A=;
        b=ndDc9/BHiYrroB+nbneJVcZljbOvdOwbgMRIfdlclwHAkD63AzoKz2OHB85fQdDWwY
         6rVtls4bK0sOy1fbjgcRUwh42UKZ4PjW9itKfXp6JBeBILtI+zEFgg/jh+RTNciJzLW1
         w7obKWPIVSAw0SRFFazCE3r3qKC802xVdZvEZinLqigqU2ChNrgWCwQHR4ufCbJsx7uZ
         9xJv9vUn9lEshLLYLrBlldgliVtjh8LWAn/+KBXiVwf9cJKQ8MUdttBXKUGpqzEHmTUA
         ggNhfVWjZ3CLNrig+3Cx5JesOzKlQcJ5AcUdxwwaGb13j0av//QHC1bM4CgSaqkmbCGZ
         bGgw==
X-Forwarded-Encrypted: i=1; AJvYcCXDx2e3BKR5n5+XNr8il6BSp9MuEzzfoChiQdWnDpzjn82ubcDAxyQyIM2PrT6swycaCuQJfNjFc5zBJI3qag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYoHBN0W8RY+mzAAcCeNJaXnP6f11ZQf1Z2/HLfidJV1iJCseP
	C+gkstKwPo7ygzU3CVEjCDkn7h/UczmabbfV2WRP5TFUkppinNOZABkf
X-Gm-Gg: ATEYQzxytU/WAdR6p2Q1ZToV/bHNUkBEUlONwDGbuOMHaJgmY4De1IKfvYKe4xCLok8
	QtTDPay/e6q3xDLMDfAzGDX0mnAHg2ogbtF0N3HPEmU0O2iY80KCQnY4UqnBc+03b3mWKbWlv4K
	FhI/R5uaoQb4JroEOkr9/+3PPV7VFQadqpfmWk4OvA/jPuLSy+ckrVMdPQI3LR0zJppqF181CFQ
	28C57X3CWOIXuTBwPe0J+FEvX6wX4QJugJ4hYgFplrSajOyCjUtGnJLx38yAw+v5uEjo2AQUmOY
	52XkR+OwIKxH872iTdKGyB19LBs7eQba0xIRCcF2kNpT/d6mLR+o5ay4pzLItZA4yLvbEHEnez2
	622C+g6rqJNtqh2X/tILRzN3G3y2LIltQS0KJ48mXQCilYdY/lBdfPS/1pxblK9hjYHdCXXuyg8
	mwOc3X5ICjPTiP+Czle0SU65EtODeT58aP+H3ybXGtXKrIvUI/jv5RZjoSTEtesSP3BWiHfk/nq
	iuUBTW1lJfG3Fn9mA==
X-Received: by 2002:a05:6a00:130f:b0:81e:2bca:d133 with SMTP id d2e1a72fcca58-82972b49983mr2518364b3a.24.1772647897597;
        Wed, 04 Mar 2026 10:11:37 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:32 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common probe/remove helpers
Date: Thu,  5 Mar 2026 03:10:22 +0900
Message-ID: <20260304181024.738391-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304181024.738391-1-akkun11.open@gmail.com>
References: <20260304181024.738391-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101138_501901_0BB67990 
X-CRM114-Status: GOOD (  14.05  )
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to support
cpumux clocks. This reduces boilerplate code in drivers for SoCs that
require cpumux registration, such as mt6795-infracfg.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..8148c21e6099 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -19,6 +19,7 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 #include "clk-mux.h"
+#include "clk-cpumux.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -513,6 +514,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
+	num_clks += mcd->num_cpumuxes;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -542,6 +544,13 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_factors;
 	}
 
+	if (mcd->cpumuxes) {
+		r = mtk_clk_register_cpumuxes(&pdev->dev, node, mcd->cpumuxes,
+					      mcd->num_cpumuxes, clk_data);
+		if (r)
+			goto unregister_muxes;
+	}
+
 	if (mcd->composite_clks) {
 		/* We don't check composite_lock because it's optional */
 		r = mtk_clk_register_composites(&pdev->dev,
@@ -549,7 +558,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 						mcd->num_composite_clks,
 						base, mcd->clk_lock, clk_data);
 		if (r)
-			goto unregister_muxes;
+			goto unregister_cpumuxes;
 	}
 
 	if (mcd->divider_clks) {
@@ -605,6 +614,10 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+unregister_cpumuxes:
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 unregister_muxes:
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
@@ -643,6 +656,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
 					 mcd->num_mux_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..02fab4b166f2 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -252,6 +252,8 @@ struct mtk_clk_desc {
 	size_t num_factor_clks;
 	const struct mtk_mux *mux_clks;
 	size_t num_mux_clks;
+	const struct mtk_composite *cpumuxes;
+	size_t num_cpumuxes;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.52.0


