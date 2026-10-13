Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03A2CC6B16
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=; b=UUccYDYMGZJDGLM7sEi2vtiCMu
	Mk4AZg9d5IhG1wge1T0rhzWk6lXk1PVrOqb9RbnUz7W3vrJgDEkwTweOnMDtmpATZnMSMWknZTyzg
	MGv4r+uSQi8qwMVYL6CuHJvTVI+fV+rEzqAIKlV0i6psdYyaVvRyuKOOOGoR0LZ2D2tAnGKCsPz6r
	Tb+9kpBK0z00DjzCyqihCKho0Sss+AaSnfx9OBOmHObKQITULHpyGLoxrMDt0KrE9piBGZxZW16N7
	FFdrm0UhGiBNjsrAlIiI4dssUvt91LEyPueIleoruY03Y4HylqbkXn6RVt4XVVQfVwoGFy+EKovkC
	Cs7tEfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHX-0000000DGuR-1sGd;
	Tue, 13 Oct 2026 15:19:11 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHR-0000000DGlg-2mLN
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:07 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso1238743a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904745; x=1792509545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=;
        b=o1sypVLq2NaPomA+2f1+pYUkP4jlGk/ng27z7INE8ZjcJSdq+xdGf6SaC7ca2emB/6
         bOugQRB1exe7+gqKOlfbPAxdivwB4RrRMmG6CtYHmK1zRCXZNDoxOEAy7Mlt3gqggaqU
         xLOCd4ugcnag3iDoSB+O2LdrGEker87mW/Z+CkQyX8wnw/nRy6sqveXuUs6SuA7CQkub
         83lHXfwKfHirCcVWxWWtA+lig0eGFycd185bzPFDFN8qyM8C06uRFn1gFe+W454YoRc8
         t3UIZsamZzLwVQD/HUcrE2GHjTen5cc15IHClNaXLe7vfHh5vKWkNK981TKHXLFDoN++
         fChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904745; x=1792509545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORoqp0TiDdQwa9wpTiAA54Y/Pj/AMJOiVqcIlCpQukE=;
        b=hnfwdKAV3Emw4w1Oh932E3VOprl003hYg0fvcaysgleS+vWBN88DlpYVe1sf/QFGjj
         h0wm4w0z7er/VVbiZz18PAfY6oAs2uTMCx2tYE8RPvIlabypdDkkPFxEZElxvB8CvrbQ
         CzkQIDKAZxWt2ednva1kqTfLoSSWIi+ECesOg6PH1l6gu6vncynbFpN0lON8F9brP+46
         pFhpT8hHkXbpCR2UclEt6wGvR6wXvs6T+gHx24goPg0TB3YHnw7ttPcFhn1kg/fbIKP1
         vN0tOKo3gO8IltLMUWKCCLqtmqqcIQlusqqsfiYigb15fA+k9ML8C8Bt9fk5A8ANQMRK
         s4ew==
X-Forwarded-Encrypted: i=1; AKwUvBzMmO7z5PK7862KHdSY9GuyBOW6czVYm8aCxU4CBR+6kW/Pc3uocSEAQifJ8rMhZxZxqCGRMUdu6cWmt3CGpg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLa1cdZ2dOEYt2Bo+5F7KrzIka5hHn08x2ADQZ0ibTyQeaEO5Ft
	OQ1OkqxBgZ0n0NaIYaOUzQqIQ6pXjTvJalSFnkpFk+TbLuwjg7KJ/DcT
X-Gm-Gg: AYBFou2spnfgBynYymDXduyfI5KgmcwO4A29nT8lVh1xxG8ziCZtN65bTa4d/5Xdat/
	bb+Ydjuk1f1HnQg93tu+XyrhY4Yb9ePwwqx8GXB47W4wxA0LiJTtfmyFwRDgWO7c8e42yZa6kO5
	/H+x8c1iUQ8u6kojjya6TQf6PlXUNmarIA4I48qZK05n18GsW6TqS6f3IRtYpFb5e9+/S9Bc8Nu
	JqvgFps8m566gyCK2fkQwdmqA2HCWL8Jua3ZCAJkMbEsosTMYcKKhl9CzJwrAXAGx5/dEdLpSL5
	jjsjJmwZjVr/SjyaFh2+MPi9l18N2ps0CvfOuw7T+FIIJ/D+iWyMob8SJ1L76npgb9bN+rd0GVD
	DER7CgBNImkzEPGUEj4lAwgi58UM8En4UcYFiuyu/4SZkBW1kAjTGjfLRE9nj67iSeebS0RjE6S
	ND/rxwNgRg6gBwoWyTwMiiNNWrmZFnWvL64+kk739wsZN58qbMQBL0jJ41bEOYtswkoSXBD0oxd
	iXPxo10bpbBSJBzyVpzayDCv1VK
X-Received: by 2002:a05:6a20:1455:b0:3e0:e349:f672 with SMTP id adf61e73a8af0-3e16bf5d17dmr6698639637.82.1791904744725;
        Tue, 13 Oct 2026 08:19:04 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:04 -0700 (PDT)
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
Subject: [PATCH v2 12/35] clk: mediatek: Add cpumux support to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:11 +0900
Message-ID: <20261013151734.3177690-13-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081905_705293_CB2E6863 
X-CRM114-Status: GOOD (  15.06  )
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
No changes in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 11741cc6ccc7..004098a839b2 100644
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
2.56.0


