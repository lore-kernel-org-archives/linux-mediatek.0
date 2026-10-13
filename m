Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C772CC6B12
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCl/6qeMZv3v3Pu317P8LnfQYMKKlWKvO4QJGZKNwak=; b=WElpqIINjGWwm+meeH7hehxlh+
	W9CQpBLcMJ6pyLyOttjvXB7D1Nhk4J7a4uhKkM4wefSMcoqNETtx87tuTWH5XEyC0D/OV96eH01LB
	EWzWNjom///EbcTfekjFG+UgVleNOr9D4KLEPxHKsecIEAuGkR7sCvKMy9j9eEZxqIOx6/cj7pTNV
	EdB7YmJuvEmlL6nzV3upeNggfDJeD8KrpdEx7dW2QNgxZZ0QvrBxJTKxUu6xB5opwl/6xOqbZ5tQO
	OkwaK9/EwyDTo54b28mKl2JUmXytpf77vYq+evWUFiPf2WVgwYCljCJX/5v/2LbzsBAeIBVY9VXCH
	2sIqy1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKN-0000000DJ8D-2GmD;
	Tue, 13 Oct 2026 15:22:07 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJC-0000000DIIg-3CyD
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:21:04 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so1668474a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904854; x=1792509654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCl/6qeMZv3v3Pu317P8LnfQYMKKlWKvO4QJGZKNwak=;
        b=CU2D3lguQZKx9j0M9OC2fbPiF7ZZAic1YxI7d4b0XUdmmmK7wgb1gz6HigFkz/hn5i
         P+RgMpKu4diVjG3DIe4aZBA9D0mhLOGq3AlhXJq9zua+zCCu75kZes6i+IKoQ9Lurz2I
         08WTErTZQhF7g0XTTYf3IcYRJNnlhaljFIQ8Lvp23aJAajVz8sR+5jgdxsGX9/xFpuyy
         IHF0mn/noAxU/S2iTEXpQ0At9TS6JXVVeXXjH015lxWAH3xNzbKqjLF2bLXoIA/14Q41
         QgxQj6+Vl3IUziNTxd9dhn3G4x8NpqMp80nSP2/QMGp0sUKhtcEM9Vvr51bAcNOHqQxj
         +qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904854; x=1792509654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCl/6qeMZv3v3Pu317P8LnfQYMKKlWKvO4QJGZKNwak=;
        b=Omm+h87RRvqJjhLB5zurusHkJFq4OPCJ4hxT1UMQZL3wflG/IfcLv+Rr/f2F9LKQw/
         3GRe0PBWtkHb1bQ5qzU39n9GNsZxqV2++f2RtvvLWhlo2qdvjnow/csXoNZ4FywtKIlk
         dyQgXStg31/USDV9Acs8iI1a5klfZ4SKBUoYuZEthkBeQAReYX2F1sLuoj+xLPKSUAd1
         kSKTGE9gRzo2yvoS4Bn9NGz4no8rE5j6tWert5ScGSS950UT2vmi+TGDxzzIrS0dmgF5
         M2WtATJoV/+v7BX5dcJG/LpM2THkAebiIU+ANFtLohLfLSW2myvxiMYMlwbVKp+GOAlH
         1D9g==
X-Forwarded-Encrypted: i=1; AKwUvBxrjOAfgDs9li1K6Zwbv1uHEgZJdML18VT2C/XWc9wqOsl+lADix9rFnhgwDYQJFfKvXaAGFDA/Pv5sB9kcJA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIlka2itkz5QxcVhxu4pQUrU5hGQVnl0Sl7shTlp4aK4TAB8fGO
	wj4A1JUh5N90LkJkW2C0lD63FmAYO5bVykmS4p+KpwuQouVqc9o2w6QH
X-Gm-Gg: AYBFou0OsPi+fXmPczhxcVj8hFZPAaljT+7xQ3idzv0CK4lWpVDtEJL0CZfAsqmoXoz
	ziYq+wM6a19vhVtQTNggjD97cSaM6+WeAzOkmHpB+nXjBmjACWM0Axv7M8XlkZgnIFvFDL7jbWa
	hFfvY69Hf+uWkns/4F0nHxCq6pRkTNdegYPUTnhtUSfRBUYpSVig+CdyytahHcpDU85Mo8RkspR
	RBDAt6XYuouM5nHmNtG4A4IN93K5UDeTeW3bR3vFdrh2T+bqkiAjSm9AfPM6syLi67zpX8DTh9Y
	MOy8oGdeem2eKUwHbrSLzMjFIPn22wKG6z6ppifhqYXgaiWzsVUQVsA8TgvyG2yKLSe9AAQCf8r
	+a2uBplsmgKjkCLknZv/oDr9ZQVVvi11Yh65dvfevN1tWK318wevcOWIrUEVIw3kGT0V2VyE2oD
	HW/7+9IUzVbVDZsCjf/WbZnr1VV8VLiXXEa221VFNXJeUwv4tAJzLEB7CmhHbR/uOcf/XbmuuUX
	TIPXOc5SuCC2VlRRaWRc+ACq00X
X-Received: by 2002:a05:6a21:a346:b0:3e1:bc0e:196c with SMTP id adf61e73a8af0-3e1d253c104mr365944637.37.1791904853915;
        Tue, 13 Oct 2026 08:20:53 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:53 -0700 (PDT)
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
Subject: [PATCH v2 30/35] clk: mediatek: mt8186-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:29 +0900
Message-ID: <20261013151734.3177690-31-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082057_862087_C8EEECBC 
X-CRM114-Status: GOOD (  14.98  )
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

The MT8186 apmixedsys driver previously needed custom probe/remove
callbacks to configure FHCTL for PLL frequency hopping and
register/unregister the affected PLL clocks. With PLL and FHCTL support
now available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c | 59 ++++----------------
 1 file changed, 11 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index d35dd2632e43..b674b1e581a5 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -132,60 +132,23 @@ static struct mtk_pllfh_data pllfhs[] = {
 	FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x0118),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.fhctl_node = "mediatek,mt8186-fhctl",
+	.pllfhs = pllfhs,
+	.num_pllfhs = ARRAY_SIZE(pllfhs),
+};
+
 static const struct of_device_id of_match_clk_mt8186_apmixed[] = {
-	{ .compatible = "mediatek,mt8186-apmixedsys", },
+	{ .compatible = "mediatek,mt8186-apmixedsys", .data = &apmixed_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_apmixed);
 
-static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const u8 *fhctl_node = "mediatek,mt8186-fhctl";
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8186_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8186_apmixed_drv = {
-	.probe = clk_mt8186_apmixed_probe,
-	.remove = clk_mt8186_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-apmixed",
 		.of_match_table = of_match_clk_mt8186_apmixed,
-- 
2.56.0


