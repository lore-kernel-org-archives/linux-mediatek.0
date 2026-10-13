Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8287CC6B12
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V11FgU5Hk2iknPklJqDL6cWLAqsnrkzvHZD63RZ0N2Y=; b=vGI+UK3oTGPzPICX0BynnH2+bN
	TcUsPDYqeiJc+v62U3mMR/cB/H5J0IkwsGDEUXvkiyR9u9Ev7Qkwpb2WBT+Iokjs6ZI5y1ODUXbhy
	O16fOngVgNCTtcs5D5xbYERqBQSaRnz2L4vACAOdEBFGXoxKcMq1ZgIeUS87zzpq2zaRe56SLDn21
	M2uLT7NZ7qzqlUp1hP8kM1aJ9fUFjbbXdtDH852DI0QM9q/Ogl3AXNQsp1MX9G6ASqNxuAgLZt2J1
	O4Cf4Bzp59QhwNRRkKVYkwYKwwdp4Fdf0QZgBo3qf9aXcyHhBFGGf2/CjGimRA//En1+D9vEnhQK3
	cYsJ59/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJ8-0000000DIFg-3566;
	Tue, 13 Oct 2026 15:20:50 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIe-0000000DHup-0nS1
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:24 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so1124935a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904819; x=1792509619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V11FgU5Hk2iknPklJqDL6cWLAqsnrkzvHZD63RZ0N2Y=;
        b=HXKIHcY1K4a2wbUHKyOSfREOjofXXLuz5uNsJKzfNKaqSCQm+ndOH2/m8eYjQ/dtkf
         lGDJxw5xrH6k3ieeofh3E8VSR4MHcX6AJAjMHEDSI47A1kLtjjyigM7d7D+HAusIBD48
         rrMiezZeX+dtI2WFad+Z8NkkNMSTg2C3scq3dKf60KiPiWgaeU1aOivXudfNrcJaHQdt
         sue+am9gUV26yyNiI2kmzcZM7A1KFk5nOIvq0PgfNAzeyPtN35rNsNQwb/qPTHhyJ5r/
         36U9xNgoPyQtvdqdc6c97Fgb+WQ2FgYLqhwn3M2IcOV8ia1+ghihrysj1esKC3oyJZnd
         H8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904819; x=1792509619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V11FgU5Hk2iknPklJqDL6cWLAqsnrkzvHZD63RZ0N2Y=;
        b=hn4dZ1NLx8XhsZa5YMqXB7DsSYdNbMaqRuDOAtLeI8zJrxKwVhf4pphiaVZdAWBPBx
         PjOvK37OfdgO9RXfKRp2J/IGD3bFI6BFUyeZ7QKganelavxcbAFTtD83+RX+WLkXxy6u
         +QtdtAXDRqoAiHW30CMvZvLyEpaAn5w0og3Zi7wzJximjyKsV4YoF363ElX9Eqj69Bgb
         yTZ7//d0R9gaAu8Hh502pO34UmfO5dh7k2zyP5h24iELMv8icdEj5XHC2uot/6JX9k1u
         PnFu07VFP5u45JeJpr5Y8XHbULN4xurnUMO2cLjtY2SM1DfnttGLWWjiBTsbrL/lU5bk
         veMw==
X-Forwarded-Encrypted: i=1; AKwUvBzkBror10b1fuTH8QKOTtc5YkDbX8UIIhN4jk2yrOwuq0k1Hddetn/aV6enc9Ke9FZTFCAMAgfDQSH5+BLWjw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIQQGkQbaKJvucFqQPZG92xDcnG+cbn/CfG6Q+1nRBZqd64pEbm
	N6XYjqPEs89elGa3MA3VH0UtwZA4lgns6jhY00rFSD4ZkHposWVhB3gt
X-Gm-Gg: AYBFou3RiqJsKwMdMRcCphmhSsF74RrwJo5YFNEDOHTgg7mhiWzDXsLL1gTY1nW3M4H
	Y3TQ9GU9/rPvQfiFhv54eFEALjc0ltQP3WuWo1v5fz86OEbYbn4k75s9arjho0P4Jtq8V1qpWHP
	Zs/AiIwEzeS+MGHZh39hesEY+GC7MO+G3TcoJcQ63h0rl6NTYVOf1hYcMgRkWxcoaJDvcH5dW9b
	6Yi9BvIv8DprqTN+rjseKJJ6VdsZnGBpfDGk1TSuQ8yhWmYNIvwuI/YgSJmvFOCsE0lWCFOJ4vR
	1Em/Fe63njjJwTCQmECprVPoKFA7HyL0Gc4NxBTromZEdwvSZKauoRHPa6MoV7ZCNYDpRzN1ooM
	bSxaTOcRlb11BaVaJMQZOJi5LMI5Pz9dZd+YDKNHBNyaPkWff/TcNwmvbr4TwNj8QHRIdl5dtWJ
	so0nml74prGJ3c5LOLE5en0kDHW/pHtZgOjHPW8S2seMRFevnmctbqCT+b+Jk22nYW9SXLOPTKy
	C0/XCkjN0G/3M6aRgIidueb84/XXA==
X-Received: by 2002:a05:6a21:e58c:b0:3e1:485a:8e72 with SMTP id adf61e73a8af0-3e16bb0d1e7mr10165482637.1.1791904819285;
        Tue, 13 Oct 2026 08:20:19 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:18 -0700 (PDT)
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
Subject: [PATCH v2 24/35] clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:23 +0900
Message-ID: <20261013151734.3177690-25-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082020_273894_6637A757 
X-CRM114-Status: GOOD (  15.19  )
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

The MT7986 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading and
ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt7986-apmixed.c | 37 ++++++-----------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index af3e002bbfb7..6df3e9555e4e 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -57,45 +57,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027c, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7986_apmixed[] = {
-	{ .compatible = "mediatek,mt7986-apmixedsys", },
+	{ .compatible = "mediatek,mt7986-apmixedsys", .data = &apmixed_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_apmixed);
 
-static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7986_apmixed_drv = {
-	.probe = clk_mt7986_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7986-apmixed",
 		.of_match_table = of_match_clk_mt7986_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7986_apmixed_drv);
+module_platform_driver(clk_mt7986_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7986 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


