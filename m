Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3FCCC6B12
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGzT5/jTF65aiyHnTqzngY4HAwKOHWD3aDXsWBDpp8I=; b=St3K+Ta+zv1krbjmeO1Bjc3dK6
	M+Yw7kiqRM4QYRwrgzLKiQtP2xW882UpkvtWzKsg/KDH5RyxInMCvEz24G/2g3kFLU/67tVf7Hya0
	Ka+i0JmugZIV6qlVvsf23U+67Yw+P6U3UOrMZiHpGygzt3xjHLTebSRAkd55VQUPzqigukPknf/UD
	krmNlKl4TytAFd2NXXFghDmO3mNssnIx+V2oFel1FHCeVbGbRyJzV8GDiubqIXUMjBXW/vxjQvg1D
	J+Is8bLlhVDA/dLTQGS4+pGNltsslLXbd0yMx6nIessVBWRIFmm8t4XjjXc83ti1Vkp7+pz/UU7ab
	3rOAxOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHv-0000000DH6e-2X0R;
	Tue, 13 Oct 2026 15:19:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHt-0000000DH2g-0mTh
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cGzT5/jTF65aiyHnTqzngY4HAwKOHWD3aDXsWBDpp8I=; b=CytmClMrJTeOoPbLyOgXTRavSu
	eF6p0PhLzF1nDoCLo7X9rFLCxL8b2V476klnxdSILdHhZdrBVWE1OEQnm7PgCejc44fJ5EnH+0yMQ
	Qh9YW731ovNFbwxIVlk+LY45YWSJNs7ncKt3Q8MFhQmuSuelXXUa2MIfXtiPug1p9kJbfzTqKRHnf
	d8pFZJLesUsUThZn0mQBTerWkKmqLRLgSl1aYTYr8Q5BRYRuVx/6P+H8HE0qgwHliYsa9S/S65RFW
	XwaMUKXst+3nLYA5mMmc10u4CANFK4jGPbeySc3Uu3t0oNODCdOwpfQpfWq6mrt9IbjaBGHaeGrT7
	Iv9MEB3w==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeHo-0000000FhTF-2mSK
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:31 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-887beafb714so1549140b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904766; x=1792509566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGzT5/jTF65aiyHnTqzngY4HAwKOHWD3aDXsWBDpp8I=;
        b=cXyFnLAAP4Jf1pYdvnekkJ4gg+JK3RuKwOiNsWlFEjQ5FyFKeXOPLqvGuoqYjbl8Kj
         H6I2pehd6EX7hVi/CWK2GKL+nNU8S9JTEpKLZM7kytvQMZG9nj1NjzWOzVXK3KVDfTJ5
         nor5bjAR9lxdAxQcPuTBKXOBYEaBT+OX/4mFriIBlvMuvh1pLcP3Z24kk1FT1EEYLeGL
         ygtDRLaH35QNZVQjraz4NZQ6thKjsiiroXcrMRxjTnUmZFdBNPZ2BjcQvys1/Bu2oyL1
         zjZPXvO0il5ST1QyvgNlvapVH4xL27jhs5YErLdKxyqwDPvnrZbny2GMlJRsi6sZdB2i
         Hq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904766; x=1792509566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGzT5/jTF65aiyHnTqzngY4HAwKOHWD3aDXsWBDpp8I=;
        b=vHptXoa6lQJswyFIer181tPcJAmZBI7xn99hQzn2dXsDdgyPgE5fW0TNvHsNs4bo1I
         0huLBv+vWwiJdzGY+ueKAEECCpml66g7IMooWKNpDPucPqjsykKneWjNQiTkgeZdQKWt
         G7aI28OjQ3ZsG/aTsMP/t7J3R/oi1GR64K2QfkXVfNeYQATkIxadmUAcfRswUoGq91No
         3TqeYoXA3W36sBi+VU1/Q0+c6JKgZeySTcWupbQBG7TewCIKBVA7m8NmIfD0WU7C0I7X
         IVNN4b5gsKzpKhxsuK1R5N8vyTFJbYJ78txKAyHf2P56Qv4LyNNxhT0ATysrVCL2zlCt
         Duyw==
X-Forwarded-Encrypted: i=1; AKwUvByHmJr8yaFotVp1eSltB1IS1/Xa4sSewQ1fAahFv6eli1oYuCQhTb2qUSU2yyto2AORwRjneSfDkiCiLICMRA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKh0FBRdKBIwifkgPFYwkVYUNi0dWAdUmXAKpeyxWBTZogOSwBc
	Pd4YldTYy9+19YA4z93wtnmQd1qSZ0RyYjcSvRkeBXGI858dmjW4uHXg
X-Gm-Gg: AYBFou0odd57fb+cKL3vM0+kPM1ER4KD8qJnJJO2w8Wo8Ga8nBNQXaAIzo2tNYncgjG
	GZNQG8UIiMX0wcjb7VRJf4UZmvLwcXObWOmcLOLzGYAFP7U9H1NN0BFi2CpSg8C7aBzyn59GIAe
	h5v0G2MAs13zIYvtK6qrdCVkzYSX6gCy0SsF0Wc950jal7jh99YxIB64mkZDw2WYXj7fqGF8Bxf
	6MZYKvI+aeqpFeFFCFRddr6yR1FzzLYccpy/ZmXQPrl9d7iXk6YCZ4LUG3eyIrjn8QV3Z3ISI39
	QbsqrLZt5vGZr0fin/egWwURTRHOWQtc50NueMeglega5XFUFsV4aDT7bm4rt1Sq521tcd97Pfp
	u1kmfseFrcg68uQS8xPPxRZPLI81v3qlpTCycjhnFcnHuLHigqCIC0rSo0N2WZ154BdCTiCX6Hu
	W80y7eK/jg4VRdUQ+VRorJ7Z+ci8951xJZZfU05Oe3qgBwFukiDsoAa0b6N4KDrJ58ZKkFZU+Y4
	F68Qr90Hqjx9/gXORzEz759EvwS
X-Received: by 2002:a05:6a21:4014:b0:3de:61f3:33f8 with SMTP id adf61e73a8af0-3e1d2702722mr364903637.43.1791904766472;
        Tue, 13 Oct 2026 08:19:26 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:23 -0700 (PDT)
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
Subject: [PATCH v2 15/35] clk: mediatek: Add FHCTL support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:14 +0900
Message-ID: <20261013151734.3177690-16-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_161928_868881_C4D295B7 
X-CRM114-Status: GOOD (  17.03  )
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
support FHCTL.
This reduces boilerplate code in apmixedsys drivers with FHCTL support.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Handle PLL registration and unregistration correctly when
  CONFIG_COMMON_CLK_MEDIATEK_FHCTL is disabled.
- Use "FHCTL" insted of "pllfh" in the commit message.
---
 drivers/clk/mediatek/clk-mtk.c | 43 ++++++++++++++++++++++++++++++----
 drivers/clk/mediatek/clk-mtk.h |  6 +++++
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 1172e76516c0..8fa81a8671ad 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -23,6 +23,10 @@
 #include "clk-cpumux.h"
 #include "clk-pll.h"
 
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+#include "clk-fhctl.h"
+#endif
+
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
 
@@ -525,8 +529,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	if (mcd->plls) {
-		r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+		if (mcd->fhctl_node) {
+			fhctl_parse_dt(mcd->fhctl_node, mcd->pllfhs,
+				       mcd->num_pllfhs);
+			r = mtk_clk_register_pllfhs(&pdev->dev, mcd->plls,
+						    mcd->num_plls, mcd->pllfhs,
+						    mcd->num_pllfhs, clk_data);
+		} else
+#endif
+			r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
 					  mcd->num_plls, clk_data);
+
 		if (r)
 			goto free_data;
 	}
@@ -652,8 +666,17 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
 unregister_plls:
-	if (mcd->plls)
-		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
+	if (mcd->plls) {
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+		if (mcd->fhctl_node)
+			mtk_clk_unregister_pllfhs(mcd->plls, mcd->num_plls,
+						  mcd->pllfhs, mcd->num_pllfhs,
+						  clk_data);
+		else
+#endif
+			mtk_clk_unregister_plls(mcd->plls, mcd->num_plls,
+						clk_data);
+	}
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
@@ -695,8 +718,18 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
-	if (mcd->plls)
-		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
+	if (mcd->plls) {
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+		if (mcd->fhctl_node)
+			mtk_clk_unregister_pllfhs(mcd->plls, mcd->num_plls,
+						  mcd->pllfhs, mcd->num_pllfhs,
+						  clk_data);
+		else
+#endif
+			mtk_clk_unregister_plls(mcd->plls, mcd->num_plls,
+						clk_data);
+	}
+
 	mtk_free_clk_data(clk_data);
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 11939e3e0b38..4e959ec68da0 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -15,6 +15,8 @@
 
 #include "reset.h"
 
+#include "clk-fhctl.h"
+
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
@@ -266,6 +268,10 @@ struct mtk_clk_desc {
 
 	bool need_runtime_pm;
 	bool populate_children;
+
+	const u8 *fhctl_node;
+	struct mtk_pllfh_data *pllfhs;
+	size_t num_pllfhs;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.56.0


