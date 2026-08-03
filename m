Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1DDC55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyBWGAUwgPvbG+kxK54yT+71Lwi1XH6IM529yhUdCDI=; b=dZvJQVP41HJNhfzgZJBJ7vCm6M
	EUPGfHBgDxgaKOvyMUgJB/Kn5qWEgxyAMCwzW1lb4PbTubnpjTmrz/b25ZfAX9uaJBF9BYx64w/RC
	LAxDnnj2sAGUDcphQleScx6Gc+3Tw9HiI8Qp+/zq4XFT8FmvijWzP3FDJnsL4pXfVfigI3Do94KZA
	XFXPsdJUqxL0EypjnjmObAWFnQz4vNA7Pmnlz1sg2uxgeDMgISzATeD41AajpWqVhvKKrTpYiAVCF
	Ce3tDpLdp+AWZ6nMQ4pco7q2eqI/ww98hlp9qSlOdol6lGi1JtZImiijUQfZqftKJuvimyZpNIwrT
	c9Hsp5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUz-0000000HKzy-2LpS;
	Mon, 03 Aug 2026 14:18:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUy-0000000HKwm-0Lgb
	for linux-mediatek@bombadil.infradead.org;
	Mon, 03 Aug 2026 14:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dyBWGAUwgPvbG+kxK54yT+71Lwi1XH6IM529yhUdCDI=; b=ozT0LxN+0rH2+6wKjXPtChk+N3
	K0mNZx+TMvXqJblcKy6LEJ/6RCTQGYfU2WWqOv+h9byEFHef41yWr5fItdGyPqwk/DjI8SDuMBbMb
	snECWuAtiSpPoAl1fUYNicgOWjv6AvzYcJykA2uzEAT6OLW5kJ2n4H7Z2tkdqQtIpPBvXg8rEPb52
	0evzpnxIyOhvpIXBXRuhyc+S2tX4l5MkPrKgCSWwSekuJiwuFojrRSypC2njRmgGs1ZRQePxCQfjV
	5+X62vEDTR90fsrrvoCfS75xpyA25vhD17WxI36Tl4hoSXeVPobtr4xpy8hrKZdGzKfYoHnN27kZ8
	YF23Gh4w==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqtUv-000000092D6-0lZT
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:34 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2592514a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766711; x=1786371511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyBWGAUwgPvbG+kxK54yT+71Lwi1XH6IM529yhUdCDI=;
        b=Bi+V725vydSi7Cxsrjsb2eviiAAIqeo3siBA4MEFx1sG2l2/n96Aiya/95476rvo0r
         RIZE4TO52sECehcbWc4swm60yf/TRPKVHTcOR/TChTjrDrrrZZ/UfgwuWu0EKkXlWGb+
         2NHskWYV+oqancdiO6eYnCNFMvH0jgNflHZltijPXHGDrI2IyrOJJhTNMAzjBI1vycI4
         zGwOfsP5vCbUmMcr0mc2tjGeMTWJSS75ZjCtWm6+RcCiSsH3zPorQOj5n9RaE2zkCOKm
         IuTTT9LpNi4XIsv8Hw9DLpHwZYSvOkqli/BcSPmO69G4rbvmD13DxXC5CZAYY/LYNX0m
         aKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766711; x=1786371511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyBWGAUwgPvbG+kxK54yT+71Lwi1XH6IM529yhUdCDI=;
        b=h2hwgRoP4h/MQg86cGoO/oysSGYyQVREWOverFBlmYa6h2UoinGlPvJ0px9PJT/pWR
         zqywf4/UkGigUgs7YUGNUIS7Rm1VX8vTuHDm0EgVhGl3L2GL1YpuFcLOIYhmMGwn6oOm
         2kqukeCqxcB4WC8YYNom1mvErREsKE5rwsgbni6crt2aeFK/jriI3akTNscNYRjiD9t8
         32LR3/eg92UTolwqcNXXXEsA0EojlxJ//V45tCnSh0pBxhbClhzshe7HGF72gIjRhpEq
         EblUAfKmN0ObRmvjcGb3Ye8KRw4KPh6WOz29vnJ+zQTYy4Nbgab4OgNL99WRoiFR16nH
         5NUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjrvGDZHdblN2yXRV5mUZoCyul3wWaXiI7klEfBMQ7kQUQaKXnX5WFdcL9KV17Co2c/8nJUGeW4KKOlHZk5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxynNY6A9VgNeUIG5zaoLqbf+LNTvrU0ttRgr1SL78o+lOc0yjV
	7MDuvS4Kojir0kMgSpMROG+qgvdy2F467pImgAXQPn1MeDor9RK51tBK
X-Gm-Gg: AR+sD13/8EjMTCEb5WRoIlldsge0dTSnQfEx5lbV1ZdN9LGO+nSMR1QG1Fk8c+fexpH
	rsro2A80CphFjTTPcVKJWDR0Zw9JhmsEKVO1JvYvLbeXOsO1MIWxY7A4DLFYY2HeqSNHQX+CPI/
	mez/GO8BImOV2+bnjc4bhn2dPCRjZhsPFYf5UWIx/qGw274P76T7XZgOuMu88MTnHZL025zd35y
	Il84JuUFrztN9PLb4cp7OpcVOcrMsa89FMRrelPfK5zJG6UusS5QBx5BYj+Bdu519zdcAuuTDPa
	UantzmocqRbArSnmQBZVbF1fCgY+6SM5cZXHnZ9rYltvKxgghO69sLmX2zGoQO//kyuN+eMsuJo
	fwMycklGyWLm++o7fVg7k83z2/cPjZvXbu1i782biyZmyDvwDReDEgJEXL2NoJliX6j7D+EuJmq
	EcZWR/lTiSmKi0NFoiZAvgM0aaO2i/t0NjRThZ/Ej+ij+KBq9oT4Y0wbVhUY3MMM/pWI20XQ0df
	NKqmmrzctDG8N4Xqbp2
X-Received: by 2002:a17:90b:4b12:b0:38f:57f3:4dc7 with SMTP id 98e67ed59e1d1-38fbc4c66c4mr9869202a91.26.1785766710548;
        Mon, 03 Aug 2026 07:18:30 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:30 -0700 (PDT)
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
Subject: [PATCH 14/32] clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:41 +0900
Message-ID: <20260803141659.559129-15-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151833_314694_C10B0ACD 
X-CRM114-Status: GOOD (  13.72  )
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

The MT2712 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 50 +++-----------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 087cf574bcdc..1e06f87e71d0 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -109,56 +109,20 @@ static const struct mtk_pll_data plls[] = {
 	    0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
 };
 
-static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		dev_err(&pdev->dev, "Cannot register clock provider: %d\n", r);
-		goto unregister_plls;
-	}
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt2712_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
-	{ .compatible = "mediatek,mt2712-apmixedsys" },
+	{ .compatible = "mediatek,mt2712-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_apmixed);
 
 static struct platform_driver clk_mt2712_apmixed_drv = {
-	.probe = clk_mt2712_apmixed_probe,
-	.remove = clk_mt2712_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-apmixed",
 		.of_match_table = of_match_clk_mt2712_apmixed,
-- 
2.55.0


