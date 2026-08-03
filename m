Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA34C55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LxMtUsp4NwM/aEkSRpWjNm7OpZObqtf98j/rMMWK14=; b=JIe9A1czPf+n7kxieycV/IA96m
	+l5dJz4m2vgfVbUe3xwa2fHMBZogUG0pW0Fstj54IjBlwrXEfpf6mzcZY0lHzXGT6wzPPMHF3SSxe
	IeLeUctpih+zbkMw7oqZoZW0myPyG+sLZngwiKajCjWF1CQkiDQIJ49LSsS94RYSEGd7A3EFWiigZ
	sEJu9te6lOCmZ3OF7nsOQ6gIIXetljuUrmNzMbIyuArTWUDzwC5pIAhITSUzLXA6zHJJcXcLqCGvc
	BdiHzmTYlIx+vr6rEhWDoyF1a7qdwB8ZDt4xrm5eGAOHjU2S6ow7snSMquW8wSwr32bPdVqHuXVMO
	ITTLnbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtW2-0000000HMYK-0HDM;
	Mon, 03 Aug 2026 14:19:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtW0-0000000HMUW-1qmq
	for linux-mediatek@bombadil.infradead.org;
	Mon, 03 Aug 2026 14:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3LxMtUsp4NwM/aEkSRpWjNm7OpZObqtf98j/rMMWK14=; b=XuuxFJ7U47XT4ctsHI16tmvZSh
	ax/Tp4eYQBQqtkSQzCsq6xNIaqQ0zdqTapsO7Spz0+1tbnBO2gD1dUgw7Ab5ODYav5DVIkHgcwy3S
	i0cL+U0VJgKE0pHbaCJqLH+w5eLgyAPBp6O8X+cGRhrpPjj+jlnzD3Psgef0ypysTexoN6CTQeEaD
	HKbHEP73fbW/SLWml6iMGx5Ka+5nbVR2hw077+togBXWN/HNic/HSiknWp8Lw4RCHPXhLA7snRwIR
	EufgQ2ePSjF/Vv8CXzApOiIPtgZYwv4dxDdR9fL8JvedAp+W2GJet3qGLDJts5r8/JJkYlYtb/SF5
	9pAaRTfA==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqtVw-000000092Jb-4A5H
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38101f85591so3266717a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766775; x=1786371575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LxMtUsp4NwM/aEkSRpWjNm7OpZObqtf98j/rMMWK14=;
        b=srl2yJeut8ZRRUhrVadN6j7pJeX9xwjC+yuawkECjmvpTISr/kFYTLUxpvqUUDG4YB
         Hu5pLfwq1nrlIN7mP2DOPBVyL2Nmr4muvkxOjN8tegGW/SeV+qPHwTiYqTg0T5VXk4jL
         5HuwnbN+V7evNAiTT0aKgxx0zcZ0ZjFS0CXahZotwQalK4kuzMg5DhMeUYP/eYJVHQKT
         ORIjdcg1J1Z+5niO7SerhE0Sq63cMFBMFhwaONH2KwJjzgVo0Os2EFTq2PkhgPkAoZkI
         6vJ/FKugU9GhqR53Hd7teTvds4BlQmFfHQIfGZD9ZjRCTzDF65isSmIwhy8UFoWGyFjq
         0k4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766775; x=1786371575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LxMtUsp4NwM/aEkSRpWjNm7OpZObqtf98j/rMMWK14=;
        b=p8Z8VFUMOsE500Gursit3WUbGL9jlK8Omw292+ZnSdHdLsNsONxki6N/+qAedY2I3h
         6MfrH03CbyVNTaFvvq5lGnQPMQMCaMsz4/oJYZeIXCFlcWD/UcptTWb8L/e5/S1rQwUE
         oFWH+vHlOabQ2cwrv1tAvjBgausZKRODk6SeJiSzVCWb5fcs6/FLRpib2m1pG4o29SRZ
         H33e+HQWfu/6/IYWWVNcxdH8lhYR4+CbbZ6MitLf2FMTcA0+mEnQKAc5TPN1MISlfOeH
         363IffSWlEJpa1B35Q47/UTjPCZC6eJojMb9raY5QhZFR/P0vVDRLsG4TgkS1512DBD7
         Fz4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJJoCTZEZsvy5LLdHiHqAsdW1NSHdDb15pFVQ62H2XBWoqd5S6xQiEpkrLLtA5T2irQztHnSazbXP6hQaTXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFimxSYFqEW5t91F5K4zpjbVvk17fZAbhAia0aNETSAfFy7Dwq
	CSlW2xAn4o0elPDhSqmXFymlUVqLLwYCTZI3BYZbOXlk66L/wsIroZAS
X-Gm-Gg: AR+sD112vHPG+xPW5REt+i2QYk+tfVgCJrkffA1lz8fTmYiKkUfZ5jxNKjOZyCoO02Q
	ZkB0tXf+ST6HE3ejRvUot7zoFM+cdFurulqjV/nkYBPH2rsrYNr6ujRhCh1Eaazyj7uVQxuM0w5
	pXGW8YmB6Qzbj/A+sFFcQuVWlGXSBvLSuEHlFxDtUdIgJVLqCATP/oHmB69bvHMP38OqKyCk+G0
	BQ4tLQ6JxOdXwq26fO5qzAzSlGePq/CbwRQ7fn4bciuYM89YUAPBv7Yvus163wSD4jjTqspUvGi
	/CJub4y923kMn4nRzQIzWhObX6Hj7lUSlsVJhm7yDZ/6pATlVmwyKnRVsWICx70pd8N6aarDfLf
	iLnf0URab6Jygl/qFu0w1ePoM9PEBx5u2+spE9OZ9YoCWsCh5DfpakMm4uQSDBLg/zEwUCG+HWS
	0EpNKiJJIfrq5f6hEar8pSS0lzJJlBUva37C3QfPfEcNwJ8OfvRxigA17Okl0btOYPHcXloDbkc
	Ey1NzwW3PsoiscMEafe
X-Received: by 2002:a17:90b:1650:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-38fbc9f3ce3mr7228127a91.2.1785766774810;
        Mon, 03 Aug 2026 07:19:34 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:34 -0700 (PDT)
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
Subject: [PATCH 28/32] clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:55 +0900
Message-ID: <20260803141659.559129-29-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151937_331294_D4DA83DF 
X-CRM114-Status: GOOD (  13.95  )
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

The MT8188 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 60 ++++----------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
index 48a2f61d4b77..3937d93cac34 100644
--- a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
@@ -89,62 +89,22 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 22, 0x0344, 24, 0, 0, 0, 0x0344, 0, 0, 0, 9),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+};
+
 static const struct of_device_id of_match_clk_mt8188_apmixed[] = {
-	{ .compatible = "mediatek,mt8188-apmixedsys" },
+	{ .compatible = "mediatek,mt8188-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_apmixed);
 
-static int clk_mt8188_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				   ARRAY_SIZE(apmixed_clks), clk_data);
-	if (r)
-		goto unregister_plls;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8188_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8188_apmixed_drv = {
-	.probe = clk_mt8188_apmixed_probe,
-	.remove = clk_mt8188_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-apmixed",
 		.of_match_table = of_match_clk_mt8188_apmixed,
-- 
2.55.0


