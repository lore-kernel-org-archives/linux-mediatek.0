Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A495C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35MPZYKLCACvIdbhYzSIWcM8WhL87zoy/9oei4fzDb4=; b=x13gExyiK7L+Nn62OAV+C19itn
	gc4rbT2aNnKYQgBN5byVP92uagNRU5t0XCpSyC2cvoZBXFAg0klIx0wY7hLABnfjXBcR7+LAqGq8/
	Sjq/72YXJK3w73SOWWBs3tcwSd45GOjDTDikqRXOEnxLbV07iQu0TmlnyV6b3Y6zcU/McXbALyWnk
	mivD4cuWiTNPSOdH/N6otPducSCj4MpynbDSJU946bhzAjvEIFmWYbmTl/LWaRTDFiJN1ROQmwLl1
	+wItLmg42T5Z0XnX3jL24rsSacheXOHIekcHu0QombKC705fBxqTN/l5PfHmoWNOz60RJTR0NTQ7U
	f37qEcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUd-0000000HKSX-44dY;
	Mon, 03 Aug 2026 14:18:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUb-0000000HKNG-0e53
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:15 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cfff5f88dbso38747835ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766692; x=1786371492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35MPZYKLCACvIdbhYzSIWcM8WhL87zoy/9oei4fzDb4=;
        b=cfy7WyX3q5Byrl6DMZONIHjBjqb/PmDv79jy9D5qyrwZcgXXzpsjKuFuX8936cQFsG
         boWhrGERJrQyHeSLZn2qC12q3ve+ijC/bdslx6accDZlsi3aUsnZQ1HMcOZ/Q3rZoU5y
         i9DF4tVZGCDdhhaS5TT9pM749l8iqSQYnqSH+Fi7p61dgZ2+hmlamgTAuYX7J6SJ2BmY
         reBxr2Wv0G0rWdaFA8L91bv5pFVRKqRhV2FQKBE/Ovun2oTILTP2fdzkb/gyLrkn4Sd1
         jyUV+TgxWs9pMO6Nx3eOpzJeHW1gCWWrsINL+hEB9xYDyOQpf6whD/4vsDClbolUWdai
         KUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766692; x=1786371492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35MPZYKLCACvIdbhYzSIWcM8WhL87zoy/9oei4fzDb4=;
        b=XQtAsYodDfdcHysa29fbfyOlwbECLjzdByXpfHibF4oQdnQlDOqxb+JHBVUP9klu7X
         peanmZ05IsNmx4dPQWSWcbliJ4gG6ZB96eM4/7cJ64VlqUucmijxzIUrljTdIkhKtZko
         sHXflR/OZOc/q9u+6HAMRycK7+ZQxEVg+g6ynf0DLzkLEOxpn6gjPzUT/dp/yC/3zJ37
         UOlrava6j/xlyGBW/cRODspJbJ/TvwsVivTMWoRzl4liDKlFNTAovXjGkhFLVWBGWgx7
         0wHz+JJAkknNzTzMyykmWjiV8scc+Gjk8bgUeZ+w7W4MaE9ckjoM1g6nh2rN8cm72yg9
         su7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpOHeaEmdPdo1nmRIFFNe2ZJmXKgtwNf8Dr/Q0s6FFVKda/GHpfPqkMFj5RCGPn/5W39l7Jkap6h3YcGov5qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI7cmEMnl0bhoLvaH0LHixVJaxS6ej2RDKJbMp4LaBiDZHFOj7
	yx3GKBSKRcmz6vbIQxaxTN8JLeMfmZHl82xEcycKER/jQqCdvMTLm1KU
X-Gm-Gg: AR+sD10jCLA7cRr4hzQdOji6d378e2M7B1bInDd7GI92dus6PEYA7aQPiw80ae8Dwmp
	ZfWUnYKtD1+zAXP8SEoeNSeEBpm6ot31eCq1HHBjMmLmPTpw93T4vVEZlbKQRLIaBXJ0/BrfmYX
	NUJZfyOGomlbB3mU7vTtI75Podx6DOB57XjQnmj2Xgr+JSG3lZ4tPXBpk109I4whSel4HMO4zxq
	vUkB2luLb0kZfS7uX5dHrMk9auN6ZyuYUZ0Ww2wakh98UsczsoyHp8nhNTMoUgIMUJkVKlRMIBv
	JF16VCwKyKGQJmPAnkCMXZUFKJvK6gk6CEHRiXZIsyJA378NBglkthmg+7RgVHLGKN1WxHGIGg+
	UxckQi0zG4iYxixGB6za251Q73T6Z+JGazd5Iwdvb7OloPIFxKQcyI5l15P3CoV+JBt9LmUcVus
	01x3hfgx8mhu61/w4zIfeTSuHT1952YFmKi87lYcaZOTCTa/Rf3B1mxJ5+J/NxzS6b7rKJttUHd
	0cL/ZZJqhPoxpvcuvxBQg==
X-Received: by 2002:a17:90b:3e8d:b0:387:e0cb:c8da with SMTP id 98e67ed59e1d1-38fbc57a3b2mr8948527a91.35.1785766692243;
        Mon, 03 Aug 2026 07:18:12 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:11 -0700 (PDT)
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
Subject: [PATCH 10/32] clk: mediatek: Add PLL support to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:37 +0900
Message-ID: <20260803141659.559129-11-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071813_202375_B8D005F1 
X-CRM114-Status: GOOD (  17.08  )
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
support PLLs. This reduces boilerplate code in apmixedsys drivers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 19 ++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h |  3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8148c21e6099..c3369a04cdec 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -20,6 +20,7 @@
 #include "clk-gate.h"
 #include "clk-mux.h"
 #include "clk-cpumux.h"
+#include "clk-pll.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -486,7 +487,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	/* Composite and divider clocks needs us to pass iomem pointer */
-	if (mcd->composite_clks || mcd->divider_clks) {
+	if (mcd->composite_clks || mcd->divider_clks || mcd->plls) {
 		if (!mcd->shared_io)
 			base = devm_platform_ioremap_resource(pdev, 0);
 		else
@@ -514,7 +515,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
-	num_clks += mcd->num_cpumuxes;
+	num_clks += mcd->num_cpumuxes + mcd->num_plls;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -522,11 +523,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		goto free_base;
 	}
 
+	if (mcd->plls) {
+		r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
+					  mcd->num_plls, clk_data);
+		if (r)
+			goto free_data;
+	}
+
 	if (mcd->fixed_clks) {
 		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
 						mcd->num_fixed_clks, clk_data);
 		if (r)
-			goto free_data;
+			goto unregister_plls;
 	}
 
 	if (mcd->factor_clks) {
@@ -630,6 +638,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
+unregister_plls:
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
@@ -668,6 +679,8 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
 	mtk_free_clk_data(clk_data);
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 02fab4b166f2..b6504b3e77ed 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -23,6 +23,7 @@
 #define MTK_WAIT_HWV_DONE_US	30
 
 struct platform_device;
+struct mtk_pll_data;
 
 /*
  * We need the clock IDs to start from zero but to maintain devicetree
@@ -254,6 +255,8 @@ struct mtk_clk_desc {
 	size_t num_mux_clks;
 	const struct mtk_composite *cpumuxes;
 	size_t num_cpumuxes;
+	const struct mtk_pll_data *plls;
+	size_t num_plls;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.55.0


