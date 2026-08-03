Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA2FC55838
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfu6eLISeoWLoVNrhpCX0FpFSHnnXu01Kfc6jWC5OK8=; b=sgVlNkzdIvJOagRSuHKAiGXRal
	LHsQbKZIT7nY4iNWiC1XVTXGxxd272f5yoodz4lcxNVt4jTqNu7gKaZayGfWqj9FqNADY2N0fV6h5
	oB5GY/S5SuZEyFn3xBxZ2yFXMwtoOeVhr9XNUKlbttNu0B2co5xTJvhVKdwgbBmSCOfDOnASBssMj
	0Zj5VyLQ4xMVtEdNG4aRfffgHJibT8ePR6hPd6z05rmPnNUF26Sy/TD7Wi2NRr66HMA3efbFBd+9u
	nV2uYqaZ6u2qfvYSXFgjvKPXJLOY/PDpvZvvQIYbVOEn8aJTK892I7cDcUGgqanEnWlfi8CuOcnUl
	K1+KzLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtWH-0000000HMyJ-3AFF;
	Mon, 03 Aug 2026 14:19:57 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtWE-0000000HMra-0MvY
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:56 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e347638adso4007124a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766793; x=1786371593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfu6eLISeoWLoVNrhpCX0FpFSHnnXu01Kfc6jWC5OK8=;
        b=GKDHRRPOv2HDlVpTF/9n/KIDa7YrjPvSg+wNNn5jvwKMjFL1AHXv+rAe5d8BkvpSDv
         FXxZP9Y1TBrff5cewUxstfGWTCNbcvw9GoHj+W8ulxLIN34J2ozy1AicwPWPP2HQyM3z
         DsP3+kzq9sB2Q0ZLM1bffbSCGE8fslJ9Towmz87dfYwEeNrwakpHF9zQUHpvUbCjY1DC
         kUXoncqcTKBPwnItDzz0VUVpz0zgN8YHozhElt6vn72+kA+lZwogcOKCFZONBh2s6GqY
         LDxvyNicIqhomkCwGoMkVdyGrO+YjtkhTRzBmbZ5Yzgbmyf3vFz7LLVumrouT5zN25RO
         nBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766793; x=1786371593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfu6eLISeoWLoVNrhpCX0FpFSHnnXu01Kfc6jWC5OK8=;
        b=FmqpLueHRrV83bkdjDRozwmc3HsOOpd3xo3Inl/l8WWg4tNyGl7wUYLR/HwwoSkc6r
         oEFSYPHXqsStvQsWP2YqE2UhBsL7iY3VvLWZU/51pxfRR1G8KoPx2q4EAU6a6JbeguEh
         wkN5LpgIlkIA8qZkU3OEuYMCabrtFgh1fZ4W4OALZtxJ0EQ+z7nD/n6A73jGo4oGAD1Q
         kophRy3zjR7RUX+3ACLJEoTtWpGP+APaLeN+2aa2xn7i9v8Iwfb2mjXrhommM1zOaihP
         eb1a1jY6cBb3bdkpeYX6Pi9TQNSDANOWnDcGQ+Pfb6VpYUSjxJQbSxBQpO7UnR1XJ6YC
         sGwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpymGY3uXgV/bGtobyqpg0bN7uHgYcdIOKDClAFTWV7Y2MdDfR3/5d2bAb7H4z1KV85IUzeOeFWi3U5vq7SEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdz/fIoAOaX3vYqYS/HsQa/2zfMzLD7LfholuUQcF5OLjnDVPK
	8qvGRHm8UtrpYnkMfGRZ7gswRlMgn1vrAcYPMS+pSfUYGXCwELB7PsDR
X-Gm-Gg: AR+sD13f5AsMzhpdolJ1pOakyuH8YcbYVv55gIn4eaGLOd7j9QHIKdLfbu3hT9u+nHR
	QbD2LcYRTSxN8Zw3cVnkrBD4LFpR+ZTXX7h623z3J8Q8+Jq+XSB0MgbDBc4PRA5Vx2QD5WB3E5Q
	vwBrMu/DG3nDLK/Fi0jkY12Gu60gNVxzrtOWORFSxY41TCXALkRpNJbhZJkUn8SbSnwGBGAfauV
	VoSgVClil836X83JZlYGnklYCUZA2eo+ygPOgr8+fOcbgFa8wkSuXhBbnwvPiyqtLLBMlX0TP8d
	q+nzxL+5hs8O5fI60uZGSHgCNEVxE8IykuyP71ICOCMP++cHMzw72QOST8c0BOBN397JYOVPBkb
	5PxJ7jzWLzHZdtr6MLmS2VpZm2kDfhxj+q1cHYvPd9hgoUJds+wceNZY8nADOCY8h9iN1ctrR9q
	s5u8W265f/wAXpJjcq8RSrcyN8FUaO/Y6BxvKoG2/WZzBiq9ehVKMO8dOXBH/2nz1hrrsVVx6Ed
	gzODunt2wZsDg7AMM7gQFvx3VQ4lCo=
X-Received: by 2002:a17:90b:562b:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38fbc4053e3mr8607547a91.6.1785766793277;
        Mon, 03 Aug 2026 07:19:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:52 -0700 (PDT)
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
Subject: [PATCH 32/32] clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:59 +0900
Message-ID: <20260803141659.559129-33-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071954_162035_8184C2D8 
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

The MT8516 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
Also, add a remove callback to properly support module unloading.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 42 ++++----------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
index 2a6206cae2f0..2fb09e7acde7 100644
--- a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
@@ -71,52 +71,26 @@ static const struct mtk_pll_data plls[] = {
 	    31, 0x01A0, 1, 0x01B4, 0x01A4, 0),
 };
 
-static int clk_mt8516_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(dev, CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt8516_apmixed[] = {
-	{ .compatible = "mediatek,mt8516-apmixedsys" },
+	{ .compatible = "mediatek,mt8516-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8516_apmixed);
 
 static struct platform_driver clk_mt8516_apmixed_drv = {
-	.probe = clk_mt8516_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8516-apmixed",
 		.of_match_table = of_match_clk_mt8516_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8516_apmixed_drv)
+module_platform_driver(clk_mt8516_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8516 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


