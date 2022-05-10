Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1E1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wF4ZkfCX+TniUuz6NL6cu6qwwnCRvTdUSJMQbYohSw=; b=dkozPNFGJ5FVLC
	wH/rgzfafL2UPMd+i55ramZdRzOWgO58wtz3w4kzu/5771Lpptbt+S29JyhsFjWicAhb5tSeiqIgM
	BjXyt9okAqmlJB80HgxWBoStgCISS7VqU7CmYW307awUgrxRfuzCLyE7F2t9folH4y90BnrW3mMPv
	7AYeRdIAqLkzhk8CPFM9+V1Va7S9Qq9C3Eh6N8qzLWLutZCqhedkDttm7xp5Gfe6fQu27yyIl+zE8
	kzGWITOYQirkGYgqKrMfMqYur6I6Ua0NUTUZ650BnAFEBoD82krpm8GX8J1lahEf6Sly+sz7RcpmF
	HkNoKBwlzX0aDcWq/ToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNRf-001K6s-RR; Tue, 10 May 2022 10:50:23 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNPp-001Iyh-3C
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:48:37 +0000
Received: by mail-pf1-x430.google.com with SMTP id d25so14609708pfo.10
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YtMNs/jsRQtekNIdKszbSj1QA5li/3j1CWHQXlVls1g=;
 b=MoRgUMkkYWjjEm/I4qn+v1qhgiSPTcQssJzYYSVg+viG/5VGZo4ElBgtQNTUbpBXEC
 vubw0er/vBOICxz2nTPvjH5baGrID4jS6uQFdXo+q6FOWFpjIlQ4kHMCuHFcu/S7PN5N
 J75ebU32OwU8eVpEqOEMCTnlPKq8nZPYU2bGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YtMNs/jsRQtekNIdKszbSj1QA5li/3j1CWHQXlVls1g=;
 b=mEbxUytiHKD03G9gRmPt2mxGDGJX8ua9GyzVFsu/5JVdJ32A7g89IC8ny7GX8rGadd
 5UcbM8rZR9+N3YE6zo4AtjOZlBWpbnSpZO8UqTGBs0qXwG1fR9aKSgcFJyc031haelke
 HCA2oiq3aud9qPtz6bIauyCJ5oLYKD7idLd6BYuHg9OtQmwNrlSfn9AptzerjyKtGNgD
 36N9k6yy4cL68vLzm5h9gHhjxo/os/ppXWU6L1+oWL5iymvVhoKOtWXt0t3HiXxIEhuR
 vaoAUs1HdqL5kQvITVp8ML2/zRZULdWSwP5oj+RvVGplbCIQIC2yutuBPXu2bYWYwVim
 42IQ==
X-Gm-Message-State: AOAM530MU6V9taBPYF0csZZ3djWnw/dD9uzemcq1wF9Xux9CcZWA0JZR
 j+7FUqR5AtNVbCA31f4eF/zi3A==
X-Google-Smtp-Source: ABdhPJxsR5CQtfeCZz9xCIbph3uiX67srKo08jJx36vEZW2PiCunSxDbFWfOnpk0IlTfpltQ81dubA==
X-Received: by 2002:a62:be14:0:b0:505:a43b:cf6e with SMTP id
 l20-20020a62be14000000b00505a43bcf6emr20113435pff.33.1652179706108; 
 Tue, 10 May 2022 03:48:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:48:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] clk: mediatek: mt67xx: Replace 'struct clk' with
 'struct clk_hw'
Date: Tue, 10 May 2022 18:47:59 +0800
Message-Id: <20220510104804.544597-7-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_034829_286081_0C3F5CBF 
X-CRM114-Status: GOOD (  19.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

Instead of adding new APIs to the MediaTek clk driver library mirroring
the existing ones, moving all drivers to the new APIs, and then removing
the old ones, just migrate everything at the same time. This involves
replacing 'struct clk' with 'struct clk_hw', and 'struct clk_onecell_data'
with 'struct clk_hw_onecell_data', and fixing up all usages.

This is done with the following coccinelle script.

To avoid a really large patch, the changes have been split into multiple
ones. This patch covers MT67xx.

    // Replace type
    @@
    @@
    - struct clk_onecell_data
    + struct clk_hw_onecell_data

    // Replace of_clk_add_provider() & of_clk_src_simple_get()
    @@
    expression NP, DATA;
    symbol of_clk_src_onecell_get;
    @@
    - of_clk_add_provider(
    + of_clk_add_hw_provider(
	    NP,
    -	of_clk_src_onecell_get,
    +	of_clk_hw_onecell_get,
	    DATA
      )

    // Fix register/unregister
    @@
    identifier CD;
    expression E;
    identifier fn =~ "unregister";
    @@
      fn(...,
    -    CD->clks[E]
    +    CD->hws[E]->clk
	 ,...
	);

    // Fix calls to clk_prepare_enable()
    @@
    identifier CD;
    expression E;
    @@
      clk_prepare_enable(
    - 		     CD->clks[E]
    + 		     CD->hws[E]->clk
      );

    // Fix pointer assignment
    @@
    identifier CD;
    identifier CLK;
    expression E;
    @@
    - CD->clks[E]
    + CD->hws[E]
      =
    (
    - CLK
    + __clk_get_hw(CLK)
    |
      ERR_PTR(...)
    )
      ;

    // Fix pointer usage
    @@
    identifier CD;
    expression E;
    @@
    - CD->clks[E]
    + CD->hws[E]

    // Fix mtk_clk_pll_get_base()
    @@
    symbol clk, hw, data;
    @@
      mtk_clk_pll_get_base(
    - 		       struct clk *clk,
    + 		       struct clk_hw *hw,
			   const struct mtk_pll_data *data
      ) {
    - struct clk_hw *hw = __clk_get_hw(clk);
      ...
      }

    // Fix mtk_clk_pll_get_base() usage
    @@
    identifier CD;
    expression E;
    @@
      mtk_clk_pll_get_base(
    -    CD->clks[E]
    +    CD->hws[E]->clk
	 ,...
      );

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt6765-audio.c  |  4 ++--
 drivers/clk/mediatek/clk-mt6765-cam.c    |  4 ++--
 drivers/clk/mediatek/clk-mt6765-img.c    |  4 ++--
 drivers/clk/mediatek/clk-mt6765-mipi0a.c |  4 ++--
 drivers/clk/mediatek/clk-mt6765-mm.c     |  4 ++--
 drivers/clk/mediatek/clk-mt6765-vcodec.c |  4 ++--
 drivers/clk/mediatek/clk-mt6765.c        | 12 ++++++------
 drivers/clk/mediatek/clk-mt6779-aud.c    |  4 ++--
 drivers/clk/mediatek/clk-mt6779-cam.c    |  4 ++--
 drivers/clk/mediatek/clk-mt6779-img.c    |  4 ++--
 drivers/clk/mediatek/clk-mt6779-ipe.c    |  4 ++--
 drivers/clk/mediatek/clk-mt6779-mfg.c    |  4 ++--
 drivers/clk/mediatek/clk-mt6779-mm.c     |  4 ++--
 drivers/clk/mediatek/clk-mt6779-vdec.c   |  4 ++--
 drivers/clk/mediatek/clk-mt6779-venc.c   |  4 ++--
 drivers/clk/mediatek/clk-mt6779.c        | 12 ++++++------
 drivers/clk/mediatek/clk-mt6797-img.c    |  4 ++--
 drivers/clk/mediatek/clk-mt6797-mm.c     |  4 ++--
 drivers/clk/mediatek/clk-mt6797-vdec.c   |  4 ++--
 drivers/clk/mediatek/clk-mt6797-venc.c   |  4 ++--
 drivers/clk/mediatek/clk-mt6797.c        | 22 ++++++++++++----------
 21 files changed, 60 insertions(+), 58 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6765-audio.c b/drivers/clk/mediatek/clk-mt6765-audio.c
index 4c989165d795..9c6e9caad597 100644
--- a/drivers/clk/mediatek/clk-mt6765-audio.c
+++ b/drivers/clk/mediatek/clk-mt6765-audio.c
@@ -66,7 +66,7 @@ static const struct mtk_gate audio_clks[] = {
 
 static int clk_mt6765_audio_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -75,7 +75,7 @@ static int clk_mt6765_audio_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, audio_clks,
 			       ARRAY_SIZE(audio_clks), clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6765-cam.c b/drivers/clk/mediatek/clk-mt6765-cam.c
index c96394893bcf..2586d3ac4cd4 100644
--- a/drivers/clk/mediatek/clk-mt6765-cam.c
+++ b/drivers/clk/mediatek/clk-mt6765-cam.c
@@ -41,7 +41,7 @@ static const struct mtk_gate cam_clks[] = {
 
 static int clk_mt6765_cam_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -49,7 +49,7 @@ static int clk_mt6765_cam_probe(struct platform_device *pdev)
 
 	mtk_clk_register_gates(node, cam_clks, ARRAY_SIZE(cam_clks), clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6765-img.c b/drivers/clk/mediatek/clk-mt6765-img.c
index 6fd8bf8030fc..8cc95b98921e 100644
--- a/drivers/clk/mediatek/clk-mt6765-img.c
+++ b/drivers/clk/mediatek/clk-mt6765-img.c
@@ -37,7 +37,7 @@ static const struct mtk_gate img_clks[] = {
 
 static int clk_mt6765_img_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -45,7 +45,7 @@ static int clk_mt6765_img_probe(struct platform_device *pdev)
 
 	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks), clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6765-mipi0a.c b/drivers/clk/mediatek/clk-mt6765-mipi0a.c
index 81744d0f95a0..c816e26a95f9 100644
--- a/drivers/clk/mediatek/clk-mt6765-mipi0a.c
+++ b/drivers/clk/mediatek/clk-mt6765-mipi0a.c
@@ -34,7 +34,7 @@ static const struct mtk_gate mipi0a_clks[] = {
 
 static int clk_mt6765_mipi0a_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -43,7 +43,7 @@ static int clk_mt6765_mipi0a_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, mipi0a_clks,
 			       ARRAY_SIZE(mipi0a_clks), clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6765-mm.c b/drivers/clk/mediatek/clk-mt6765-mm.c
index 6d8214c51684..ee6d3b859a6c 100644
--- a/drivers/clk/mediatek/clk-mt6765-mm.c
+++ b/drivers/clk/mediatek/clk-mt6765-mm.c
@@ -63,7 +63,7 @@ static const struct mtk_gate mm_clks[] = {
 
 static int clk_mt6765_mm_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -71,7 +71,7 @@ static int clk_mt6765_mm_probe(struct platform_device *pdev)
 
 	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6765-vcodec.c b/drivers/clk/mediatek/clk-mt6765-vcodec.c
index baae665fab31..d8045979d48a 100644
--- a/drivers/clk/mediatek/clk-mt6765-vcodec.c
+++ b/drivers/clk/mediatek/clk-mt6765-vcodec.c
@@ -36,7 +36,7 @@ static const struct mtk_gate venc_clks[] = {
 
 static int clk_mt6765_vcodec_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -45,7 +45,7 @@ static int clk_mt6765_vcodec_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, venc_clks,
 			       ARRAY_SIZE(venc_clks), clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index 24829ca3bd1f..b6278005d1e6 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -773,7 +773,7 @@ static const struct mtk_pll_data plls[] = {
 
 static int clk_mt6765_apmixed_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 	void __iomem *base;
@@ -791,7 +791,7 @@ static int clk_mt6765_apmixed_probe(struct platform_device *pdev)
 
 	mtk_clk_register_gates(node, apmixed_clks,
 			       ARRAY_SIZE(apmixed_clks), clk_data);
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
@@ -811,7 +811,7 @@ static int clk_mt6765_top_probe(struct platform_device *pdev)
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 	void __iomem *base;
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	base = devm_ioremap_resource(&pdev->dev, res);
@@ -831,7 +831,7 @@ static int clk_mt6765_top_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
 			       clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
@@ -848,7 +848,7 @@ static int clk_mt6765_top_probe(struct platform_device *pdev)
 
 static int clk_mt6765_ifr_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 	void __iomem *base;
@@ -864,7 +864,7 @@ static int clk_mt6765_ifr_probe(struct platform_device *pdev)
 
 	mtk_clk_register_gates(node, ifr_clks, ARRAY_SIZE(ifr_clks),
 			       clk_data);
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
index 9e889e4c361a..97e44abb7e87 100644
--- a/drivers/clk/mediatek/clk-mt6779-aud.c
+++ b/drivers/clk/mediatek/clk-mt6779-aud.c
@@ -96,7 +96,7 @@ static const struct of_device_id of_match_clk_mt6779_aud[] = {
 
 static int clk_mt6779_aud_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_AUD_NR_CLK);
@@ -104,7 +104,7 @@ static int clk_mt6779_aud_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static struct platform_driver clk_mt6779_aud_drv = {
diff --git a/drivers/clk/mediatek/clk-mt6779-cam.c b/drivers/clk/mediatek/clk-mt6779-cam.c
index 7f07a2a139ac..9c5117aae146 100644
--- a/drivers/clk/mediatek/clk-mt6779-cam.c
+++ b/drivers/clk/mediatek/clk-mt6779-cam.c
@@ -45,7 +45,7 @@ static const struct of_device_id of_match_clk_mt6779_cam[] = {
 
 static int clk_mt6779_cam_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_CAM_NR_CLK);
@@ -53,7 +53,7 @@ static int clk_mt6779_cam_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, cam_clks, ARRAY_SIZE(cam_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static struct platform_driver clk_mt6779_cam_drv = {
diff --git a/drivers/clk/mediatek/clk-mt6779-img.c b/drivers/clk/mediatek/clk-mt6779-img.c
index f0961fa1a286..801271477d46 100644
--- a/drivers/clk/mediatek/clk-mt6779-img.c
+++ b/drivers/clk/mediatek/clk-mt6779-img.c
@@ -37,7 +37,7 @@ static const struct of_device_id of_match_clk_mt6779_img[] = {
 
 static int clk_mt6779_img_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_IMG_NR_CLK);
@@ -45,7 +45,7 @@ static int clk_mt6779_img_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static struct platform_driver clk_mt6779_img_drv = {
diff --git a/drivers/clk/mediatek/clk-mt6779-ipe.c b/drivers/clk/mediatek/clk-mt6779-ipe.c
index 8c6f3e154bf3..f67814ca7dfb 100644
--- a/drivers/clk/mediatek/clk-mt6779-ipe.c
+++ b/drivers/clk/mediatek/clk-mt6779-ipe.c
@@ -39,7 +39,7 @@ static const struct of_device_id of_match_clk_mt6779_ipe[] = {
 
 static int clk_mt6779_ipe_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_IPE_NR_CLK);
@@ -47,7 +47,7 @@ static int clk_mt6779_ipe_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, ipe_clks, ARRAY_SIZE(ipe_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static struct platform_driver clk_mt6779_ipe_drv = {
diff --git a/drivers/clk/mediatek/clk-mt6779-mfg.c b/drivers/clk/mediatek/clk-mt6779-mfg.c
index 9f3372886e6b..fc7387b59758 100644
--- a/drivers/clk/mediatek/clk-mt6779-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6779-mfg.c
@@ -29,7 +29,7 @@ static const struct mtk_gate mfg_clks[] = {
 
 static int clk_mt6779_mfg_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_MFGCFG_NR_CLK);
@@ -37,7 +37,7 @@ static int clk_mt6779_mfg_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, mfg_clks, ARRAY_SIZE(mfg_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static const struct of_device_id of_match_clk_mt6779_mfg[] = {
diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
index 33946e647122..eda8cbee3d23 100644
--- a/drivers/clk/mediatek/clk-mt6779-mm.c
+++ b/drivers/clk/mediatek/clk-mt6779-mm.c
@@ -89,14 +89,14 @@ static int clk_mt6779_mm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->parent->of_node;
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
 
 	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static struct platform_driver clk_mt6779_mm_drv = {
diff --git a/drivers/clk/mediatek/clk-mt6779-vdec.c b/drivers/clk/mediatek/clk-mt6779-vdec.c
index f4358844c2e0..7e195b082e86 100644
--- a/drivers/clk/mediatek/clk-mt6779-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6779-vdec.c
@@ -46,7 +46,7 @@ static const struct of_device_id of_match_clk_mt6779_vdec[] = {
 
 static int clk_mt6779_vdec_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_VDEC_GCON_NR_CLK);
@@ -54,7 +54,7 @@ static int clk_mt6779_vdec_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static struct platform_driver clk_mt6779_vdec_drv = {
diff --git a/drivers/clk/mediatek/clk-mt6779-venc.c b/drivers/clk/mediatek/clk-mt6779-venc.c
index ff67084af5aa..573efa87c9bd 100644
--- a/drivers/clk/mediatek/clk-mt6779-venc.c
+++ b/drivers/clk/mediatek/clk-mt6779-venc.c
@@ -37,7 +37,7 @@ static const struct of_device_id of_match_clk_mt6779_venc[] = {
 
 static int clk_mt6779_venc_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_VENC_GCON_NR_CLK);
@@ -45,7 +45,7 @@ static int clk_mt6779_venc_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static struct platform_driver clk_mt6779_venc_drv = {
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 7b61664da18f..a2246d62e491 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1214,7 +1214,7 @@ static const struct mtk_pll_data plls[] = {
 
 static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
@@ -1224,13 +1224,13 @@ static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, apmixed_clks,
 			       ARRAY_SIZE(apmixed_clks), clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static int clk_mt6779_top_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -1253,12 +1253,12 @@ static int clk_mt6779_top_probe(struct platform_device *pdev)
 	mtk_clk_register_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs),
 				    base, &mt6779_clk_lock, clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static int clk_mt6779_infra_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
@@ -1266,7 +1266,7 @@ static int clk_mt6779_infra_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
 			       clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static const struct of_device_id of_match_clk_mt6779[] = {
diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
index 908bf9784f03..25d17db13bac 100644
--- a/drivers/clk/mediatek/clk-mt6797-img.c
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -39,7 +39,7 @@ static const struct of_device_id of_match_clk_mt6797_img[] = {
 
 static int clk_mt6797_img_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -48,7 +48,7 @@ static int clk_mt6797_img_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
 			       clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
 		dev_err(&pdev->dev,
 			"could not register clock provider: %s: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
index 01fdce287247..0846011fc894 100644
--- a/drivers/clk/mediatek/clk-mt6797-mm.c
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -96,7 +96,7 @@ static int clk_mt6797_mm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->parent->of_node;
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR);
@@ -104,7 +104,7 @@ static int clk_mt6797_mm_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
 			       clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
 		dev_err(&pdev->dev,
 			"could not register clock provider: %s: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
index bbbc8119c3af..de857894e033 100644
--- a/drivers/clk/mediatek/clk-mt6797-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -56,7 +56,7 @@ static const struct of_device_id of_match_clk_mt6797_vdec[] = {
 
 static int clk_mt6797_vdec_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -65,7 +65,7 @@ static int clk_mt6797_vdec_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
 			       clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
 		dev_err(&pdev->dev,
 			"could not register clock provider: %s: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
index 2c75f0cbfb51..78b7ed55f979 100644
--- a/drivers/clk/mediatek/clk-mt6797-venc.c
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -41,7 +41,7 @@ static const struct of_device_id of_match_clk_mt6797_venc[] = {
 
 static int clk_mt6797_venc_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -50,7 +50,7 @@ static int clk_mt6797_venc_probe(struct platform_device *pdev)
 	mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks),
 			       clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
 		dev_err(&pdev->dev,
 			"could not register clock provider: %s: %d\n",
diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index 02259e81625a..6cb720926e37 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -383,7 +383,7 @@ static const struct mtk_composite top_muxes[] = {
 
 static int mtk_topckgen_init(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
 
@@ -399,7 +399,7 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
 				    &mt6797_clk_lock, clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static const struct mtk_gate_regs infra0_cg_regs = {
@@ -556,7 +556,7 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
 	FACTOR(CLK_INFRA_13M, "clk13m", "clk26m", 1, 2),
 };
 
-static struct clk_onecell_data *infra_clk_data;
+static struct clk_hw_onecell_data *infra_clk_data;
 
 static void mtk_infrasys_init_early(struct device_node *node)
 {
@@ -566,13 +566,14 @@ static void mtk_infrasys_init_early(struct device_node *node)
 		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
 
 		for (i = 0; i < CLK_INFRA_NR; i++)
-			infra_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
+			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
 	}
 
 	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
 				 infra_clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, infra_clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
+				   infra_clk_data);
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
 		       __func__, r);
@@ -590,8 +591,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
 	} else {
 		for (i = 0; i < CLK_INFRA_NR; i++) {
-			if (infra_clk_data->clks[i] == ERR_PTR(-EPROBE_DEFER))
-				infra_clk_data->clks[i] = ERR_PTR(-ENOENT);
+			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
+				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
 		}
 	}
 
@@ -600,7 +601,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
 				 infra_clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, infra_clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
+				      infra_clk_data);
 }
 
 #define MT6797_PLL_FMAX		(3000UL * MHZ)
@@ -659,7 +661,7 @@ static const struct mtk_pll_data plls[] = {
 
 static int mtk_apmixedsys_init(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
+	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR);
@@ -668,7 +670,7 @@ static int mtk_apmixedsys_init(struct platform_device *pdev)
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static const struct of_device_id of_match_clk_mt6797[] = {
-- 
2.36.0.512.ge40c2bad7a-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
