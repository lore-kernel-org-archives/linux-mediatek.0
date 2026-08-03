Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EE4C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on4B/LfqkHipeTiwMXYITPpUbegoRxXk89rke8WT6Ak=; b=y/shIcmPl43Tf/aRLN+We0MMYN
	z8h+lPJ+5286R26cD0hb0PPFTY1DdP+W5MXqxNke2YEqm/saaRGTiR/G53ggnJPpNNNQBM7Et0CM+
	pLcHXgAerwhfLcHHnGC9xX6L+T1EwqxykTW5FTQSUUiNjUj2+IbtvOS213AwS1V4r9UB0WkrjFjI+
	94P9iU539OMUjxxtNaRjDxOH2ApQh0CRxbPE6SYluh+3v5a/tkaNVWAdM/Hp+ijLZnf0+2XVUbkD/
	2qxBrAf0Sfu55qZ5riwxIdq9mo/cB0+5Lgz31+h7eD/7XEpih1LDDjNQy2JxixBShXZ+1zlLOhGDe
	pvLa+Pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUa-0000000HKMy-2xcy;
	Mon, 03 Aug 2026 14:18:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUW-0000000HKHc-3Jga
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso4337503a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766688; x=1786371488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=on4B/LfqkHipeTiwMXYITPpUbegoRxXk89rke8WT6Ak=;
        b=aU/CTWFNK0GlZLC4QAmmLQl7TVNBK2Sm/xj016LROioduLoT5+mtnMcx3Dxu5nk1q6
         fFU3ed8h0IOExgiztpRYJD64S3f7HFWoiqiB2w2WYdjNAA3dr86qI8eD65eTeqQOOT4M
         oH8AJ838LODl7/2uC4e/b+mYjIA7gZBhWY6hpPbGrpXeXuBRZw9lKQ1xUFbrhdY9Kwob
         oJJtCFr/8bkxAnl3/xQR7O6cixotKlXTlXn++PoxkDKKtisAaTFfeByAS4VRUkiW/WZJ
         rbn218m9O1osysbEE7kBsBAclZyXyc8rHQeLHYdqXpj5dZZYp2TcwMHVr/gRmCxbgZjU
         QOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766688; x=1786371488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=on4B/LfqkHipeTiwMXYITPpUbegoRxXk89rke8WT6Ak=;
        b=In30XvvtKjhEM6imLHiTkuADbB2IA3DHAFqjTpfXt79+9Kr6GwQ+5iaX3yj8lXTT40
         7ODrAegaTrjYUjEjc+TLTOIkM5SFgDSoeJyVUlvSA0v4VpxVv+gvSoEoZYPByhFG8JFx
         ZeY6N6akQCv0EHrJbPydcmewHq8nYYotbOmmQTEt2bnFxLjGbp6pLVLdIgHNnDbJN5Xo
         Tee8vnfq2T4SNJB60KXumMZqaYKAhcbR5Hu4njMZ0lv0lig6kstswZ2vZ7zdHIEAEf6a
         Fe2DllWp8F95LMhxn0U18zxhCZrBs8gyAvoouOZ7lOH4Hg0t+PRnMQJlz8DhkAUFw+7e
         HN7g==
X-Forwarded-Encrypted: i=1; AHgh+RpFyLT3z8AN3z2n7BEXKqcSkHvwm80NgRT5fGxjnexHpHcyVWUoiAcLlFSk3OUsAo0M/NxJ82mc+baOkM4yjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzARSTdFMuKuk/kRwubjLC4JyLKk22CX3Arrs9OY58QllGayjce
	XUPdkeOYdpA7HKzggjGBekB9HPT4rZfNjn5cZfQhWB4J7gp+Nu2rQrkq
X-Gm-Gg: AR+sD10yAhw6tXCqyeD6+qm7Bu0oZgbu91CHsEhLDfwFps5shtgZYulI9UuoTkPF6F9
	v6e5U+hminvFjG2Q+EMuK1MtzUsqbi57ikj3GQ5MTE6BVMSJH2q85+ekIUibtWu4AchntS2XtM6
	ui4+oaBzFOrpoucmgP+DJdQeDszXOObtwRna9RctrDyZmdRju6RRW+V//hp2B3mMKOJp6dxwTQv
	lnRR84RMduDBAMXnB3rs9mkNwjrfgeqpcZPyJeH+81wPGcqb9NQ/nSLm31tDZibieI1hPdc6EMZ
	1KD/Q0f83WgkbCZLEwEbiEWirFd64P5JKuTEG5ouEcWK/FieL37fVXiiP/QRcQRAiQudckbuPVa
	bTwW2++gRhQstj9MceoIFUpBwQkONn1SYI/xs8tRzB+KSFprZpQuwC2IilcB1JW1w4WV1wZh6KI
	lN3HNosBbVqW5lkvyyOYWtwlHgYVJOHXHxlREAPNlydlg0oGVDeMTmL53VxWemIdlkhMA9ARK1r
	67CTWzrdJsiqlWTnb5G
X-Received: by 2002:a17:90b:5643:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-38fbc4cfde2mr9523866a91.21.1785766687657;
        Mon, 03 Aug 2026 07:18:07 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:07 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 09/32] clk: mediatek: Add cpumux support to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:36 +0900
Message-ID: <20260803141659.559129-10-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071809_030339_A6ADE71C 
X-CRM114-Status: GOOD (  14.85  )
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to
support cpumux clocks. This reduces boilerplate code in drivers for
SoCs that require cpumux registration, such as mt6795-infracfg.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.55.0


