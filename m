Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A69CCC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=; b=r4euOO0stUomZ6dBnGKi18wk56
	56+AMMyc/hujzRuOguIffRqWUbsD8CEQ/QOfgb3BLLMaABqNPOWQEhM9qNHGd4UpRxhaaQQzhCqlL
	RO6CJuqIMZOAv548qyzgZQvPnmSRCdxhZNkeeAK9DroYBffmnEZS6zkhH/TXEGCTLm/LJN64XAYaC
	egPpBW83lhF/IiBLtoRsx4cRyNMvKwzTHL9+F6Hgo3zIIuGn0HiH0dE+oeJsbA/MIznRyyCu/951V
	k/dcRPMINqWKqDZqvgIkPTWG7w4OR4iRd6n5/nBFNihXdzbeuUP1i1mNEM2vo6BBX7I7C/2bYptjH
	ah4Ck6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHv-0000000DH6H-1oqV;
	Tue, 13 Oct 2026 15:19:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHX-0000000DGtv-1uHl
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1388159a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904751; x=1792509551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=;
        b=oG0A76lAAH5Z9sA+gdAur0mBiFRiGE7DssOFWGWiB0NMrmOq3pJMGeAyEorbFEngJ8
         8WC94mB0dr705lOd9djwignIAwDbvzbmuaN0xVr7Ve6OaqrRBnk3rAkajuDrUzbzfFn9
         W1Uki4IjNRn532CUCwtZ/dPPq/+mIUep6khLhFfROSHv+ajmzf7yhTVDywjmmlU6bOAJ
         iXwSj4HUGBuDIGY5H/2oG6X4dDUObqFONO0KBUjlBJb3vpjOKIQysZA2DcDMIg2fqXWk
         2xnnOtDcmss59FyqcPYGyujA5misAyylgQ/jCr21abcIgU3TuIDPGI9E53IVuJQwJRXX
         fuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904751; x=1792509551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VV+eqtGB9isPBsiHWAzEEpBfNpeGwRF5PnvhKsaB4c=;
        b=sM7w0H1gNKYMexMVppRqASn4U0uiO1p8KCrbMWRXHE8ZbBTt+Ll/4pS7wUi5vTb7us
         YHl1h4zyQ0pPf9y588MB72reXjwo8kFzbvbPF7Q8whncgwhjdvF+SxQfhRyk8S5AQzOt
         JVAp/KXX3JeLTA7xdzGmc4hkyGJH4SPjKV1ejjP+EYYNlViQhfoxZRGtP+1Ah7HGACzi
         yZzviC4bjm97WzBch2vGAFpUJgeNYIkww8e26JR9Pel/3LSR2UC/q1BvcW2UMaJV2gZi
         CDQeXe7uMUo4S+vjrOShGMoe0qWWWsqkZ7dWu3EPvWwLAei2K3jAiJ+jyIOkzE3Z6jaP
         M8EQ==
X-Forwarded-Encrypted: i=1; AKwUvBxof7fr6NjswgPQGjg74Z8XciEoyjTTewT033niNkWqwhnXYjnylXVhzmHbb8xVbXYgSWILITL9sbnGebmgoQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIa/s5Aamn/bbj2u8CSiBB1woKN8J53DnZ0z9X/HCOKzo0AiWMf
	Id1aT2bT6tnfi5YA1IpwgUTL7wvkrKGhn9rnaBQqqxPsNi1/ECUVsLj6
X-Gm-Gg: AYBFou3JVUB/tN5Bupqdq1ZWw67YtvmfMSWELXQqGhLZC63fb9ve54ZZGLfmve78wy0
	Xqlfj9CaUjp74oMG0LquIPhE/dar1U67Rds82WXM4wNWLCuOQU9+E8pxonyS+0KWmG6tOYgH1g3
	h25c1Cbe6RDbWI3onx/Iv1QP4st2SjYZzMnhQXcZknpYRyvjP3HfRmtsztPFWx9EpFww/M1wY0V
	hFgtbJyFJmJhMZcZmiZJHIKz/PYbKICGA9t1ZbJoVKMnskjRf4ZQ8VjgwmJ/IQoUm7zLNdjsGui
	+ZL+GL76cb4OwGsnD9TczK+F9ykiDUbQZxY8LqJvwMcfeC4eY4Zm9Uzu35XzoDepJmB05NDZiML
	+kgSBscAinLCGaWMfjnmdO4GP52Dh04JIfAJplzSrBf7X9HLDU17Vkix6PMcbXm44/HeS2sCXDk
	qNh/R1Nd5bcTyid2IRVCEoha5HtZ7+x+k7M1LnKcwR79FuSOF5cGuv4SJDaywIt5Lp1GpAHPdwr
	6a+jAAWOALD5BWfC4nO0Kznd+DzRw==
X-Received: by 2002:a17:90b:1d4f:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ab3a79d9f8mr10541804a91.45.1791904750446;
        Tue, 13 Oct 2026 08:19:10 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:09 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 13/35] clk: mediatek: Add PLL support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:12 +0900
Message-ID: <20261013151734.3177690-14-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081911_524278_9C737AB8 
X-CRM114-Status: GOOD (  17.39  )
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
No changes in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 19 ++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h |  3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 004098a839b2..e06cd40d995a 100644
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
2.56.0


