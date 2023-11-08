Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E2C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 21:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOY/4TbWJlIh9l54tUoY6OQMnJji9pbyz4aczXm5Onw=; b=Cg0p7HTLu01oaPYTwSH2FhNJkT
	fhnVHdopezQhhfXXa/+e+mmSx+GCJhJ2prOJ4+bFoB71WqBrpW92/DFuYiooZ2pba7LXNM3275BBm
	Qonqp3unt4syQJLjSWvM3BcCOogC7s8m4/zUtfmGVCWoMXaIMg9uzyvni7a1TTaTfDEVhepiLE++W
	N08YWRY0zRp1HpAMMWQO5N/kk40UXoNV4rMtjzNH3nyo/jaxraQr8KX+3mjfSPXZMb+cOkUuDt4Ww
	w7x7Xzb6P0oY40QFdYDRivPypLgjfTg1wOsrFXIpq0EwVOtG11qwdSv2gsZclEfKSar7WW3ZH1Ah7
	ldLcob3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0qFh-004nDf-2o;
	Wed, 08 Nov 2023 21:38:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0qFd-004nCJ-2z;
	Wed, 08 Nov 2023 21:38:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso708875e9.3;
        Wed, 08 Nov 2023 13:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699479491; x=1700084291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BOY/4TbWJlIh9l54tUoY6OQMnJji9pbyz4aczXm5Onw=;
        b=cULPA2DnHuIWcIWCrSS5jBhlwJnWYhyJSaUk33LRAMSddf7qmkYylp5lQaPlWDHvcu
         vOKnWEhT1s7pHfGItk0QwvdBi4YQC8QKsMx0/MzkdYa1LSwEID1fX2jiAgvGye7aBqu2
         wWUDvcgJHXryPTaOnovHquIZRCr66qe7YQQmbdqrV8xjAlj8gYHoiJbKg69+9fMq7cbB
         whNdwHC2p+X5B50lg6OuK8h2kWAMk4InDBA2bcrrsz+erldv97S1CiED8M7HG6hh0ZpN
         Z28l8rfwXEYqp4vGeYmxGvznbyZjIVUAjmba+om47szTHjXecEJEimPzM0lsG6Q3xGAj
         7+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699479491; x=1700084291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOY/4TbWJlIh9l54tUoY6OQMnJji9pbyz4aczXm5Onw=;
        b=NDTIESwhPis0PQzZ7PR6B/kk3GrWiiuB4g9ZSTG9zG1DBx8ZplbiV4EUe4oM+xVQc2
         rpxIFdmJqpJn5NSC/oQvohjwtbp/nX22vWARSgGWs2VTQgS6B2uZuvsCNlC1pua4y4uv
         OyrDz/pj55emKXCH1h0rlMWbXmwwg77+tr4gNOSZC8r6E3f1L/0MrqtpWPaMMnKblJ3d
         DZWMrlkmAv3YLhDl5ZRYlhHYEGLlHTi7RnKSGnE0hcxLBUexg+htwXYrACnGfDMQr6Fv
         3FWW+Z1k36gd8xbOpIR7xdi5kk84TXEzHtlGXh/26QgZCGlwev8S11uGofxX5IPhBLAj
         yDkg==
X-Gm-Message-State: AOJu0YyLPbzknNgyAMV2G1YVRG022hRr/AywHgCgfGvA4XRWAYEIhBIr
	PJThLNXjM1hGmU75k/0aXKU=
X-Google-Smtp-Source: AGHT+IFaK9xQ+DloNi+NZ+EUiBL2JKwDO76WCe7486uq9CoBenof/WNhhVDU4HR5MYDs/OR/q7vAHw==
X-Received: by 2002:a05:600c:3b96:b0:407:8ee2:997e with SMTP id n22-20020a05600c3b9600b004078ee2997emr2777339wms.27.1699479491088;
        Wed, 08 Nov 2023 13:38:11 -0800 (PST)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c138800b004075d5664basm22032wmf.8.2023.11.08.13.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 13:38:10 -0800 (PST)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH] clock: mediatek: mt8173: Handle unallocated infracfg clock data
Date: Thu,  9 Nov 2023 00:33:43 +0300
Message-ID: <20231108213734.140707-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_133817_964003_87CF651D 
X-CRM114-Status: GOOD (  20.62  )
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

The MT8173 infracfg clock driver does initialization in two steps, via a
CLK_OF_DECLARE_DRIVER declaration. However its early init function
doesn't get to run when it's built as a module, presumably since it's
not loaded by the time it would have been called by of_clk_init(). This
causes its second-step probe() to return -ENOMEM when trying to register
clocks, as the necessary clock_data struct isn't initialized by the
first step.

MT2701 and MT6797 clock drivers also use this mechanism, but they try to
allocate the necessary clock_data structure if missing in the second
step. Mimic that for the MT8173 infracfg clock as well to make it work
as a module.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
I've tried adding cpumux support to clk-mtk.c then switching this over
to simple probe functions and it appears to work for me, though I don't
know clock systems enough to recognize if it's subtly broken instead.
That'd remove this piece of code, but this might still be worth applying
to backport to stable kernels.

If I'm reading things correctly, it looks like it would be possible to
add cpumux & pll & pllfh support to clk-mtk.c, then move most if not
every driver to simple probe, with one file per clock and module
support. How much of that is desirable? In what order do the parts need
to be registered?

 drivers/clk/mediatek/clk-mt8173-infracfg.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index 2f2f074e231a..ecc8b0063ea5 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -98,7 +98,17 @@ CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
 static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
-	int r;
+	int r, i;
+
+	if (!infra_clk_data) {
+		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
+		if (!infra_clk_data)
+			return -ENOMEM;
+	} else {
+		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
+			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
+				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
+	}
 
 	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
 				   ARRAY_SIZE(infra_gates), infra_clk_data);

base-commit: 2220f68f4504aa1ccce0fac721ccdb301e9da32f
-- 
2.42.0


