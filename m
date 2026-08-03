Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8842EC55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K3Yx6VzHM8GIbCrqX9zZGoEb/ITQ0QyQysBjSMYncA=; b=bg1EYj4pCfqYbZyU2EFlkXeXLH
	PGpoYn+SJBFRwV0zLlRtw/WlZO2Tf7J5QaMjlN11FE7b5Jb96F7b4W4oN3b0xQC2NAnjEglxb/oai
	UIk2dg9d0r9lSgHaXafp+jqfbVhFnpMQduRKDvqXoxXdw68jLlUKpf4hUzhlug1y7dFWr8fYYHizU
	ev5z8ewx8F2059uHa0Nom0pzJlsjl+M8XE9cmV8mAxCK1nI4A71k0eizjUjBICR5v3zaaAnCQjZbu
	6MyzImMu7tC0xV1/NDl+uHmXujzzMf30K+5OYd2wFXBdvOKup9yvuDvrnl3HWhuIUw1v9K09ywMjv
	AsyCtwjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtV0-0000000HL1i-3Ejd;
	Mon, 03 Aug 2026 14:18:38 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUx-0000000HKxK-33rE
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:37 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3408079a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766715; x=1786371515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K3Yx6VzHM8GIbCrqX9zZGoEb/ITQ0QyQysBjSMYncA=;
        b=LUwwILH3Qd+dURaexrzcuL4/ciJwKkHO5IwG8VDTYUDDfSOKcTCX9BsYjbqTJGOk0C
         HbARE4ECjzMaqYSax4uCMo8/Osa6oBJ/xD9pNx9P2mBC1hQqPruKdVEaoRQqJv8siJ/0
         Pt9Q329aii3txRZ9U79VCR+axXfytqfpdMCGgM2n8B9DhwgVeBACYUqeql6w/ZMt3rzA
         VpwaPBLFGUm6H4KQuMlegktBLSexdZrcAC/11/IkmioyZIQNu/q6gauorQ6mfuJsd2Vv
         jkTeAkVFnsOYB5xhPn1YpiA6CYWQY8awAIEt7s9xTln9bXnaj/XZnzIroVvg+YESUf35
         NJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766715; x=1786371515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K3Yx6VzHM8GIbCrqX9zZGoEb/ITQ0QyQysBjSMYncA=;
        b=bvmTQ9sef0tLF258eQIWUea2SUOO6r6T8hh4jfzErZP82W4cL/vB0+lkjcfFTjgKPW
         EahHzlPBVqLW/MZ+Lqpz+quB5uG96BpcZeFdynP+MgQfPvbW7oEJfVEiiZ+L55nD+MRj
         Eann6CjoKFl9U9nAOUAjQ75H+beQv7LJmwqRX7z6GN4lkWxB+TfJk/8jYUQJfAQ19lhH
         49CiItExpNwA53XQJfFFYdDFJJLGSSLvNhhzkD8j81Tm5fXIChCxXEhTxB9l+e2A1196
         G1qV2ImUZ94qY95iMhOm/pLYTPPF0MEnhUck9b9WGO2ycpJsJZlJ02DIw1PzQdcX1cgb
         jy5g==
X-Forwarded-Encrypted: i=1; AHgh+RoaDfS5N9rK17oPmPMzVv2Zx9VsAVIeeulZ9rgV4R8S77DukqViXUWT+2e5Nyipw9gOtfxsSLQ598chhcag2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAULmb0csYQXEMo83B3mmERyKhwFyiQh5h20K0KemMYTeT1u6z
	eJkq1av8iBlvU2lyv4uJ8n6dtI1nW312ndBtouNbae/0s49lE4NcmYKN
X-Gm-Gg: AR+sD12C6bDjkbKVMrlLkL4nDaBbJWSLKSxu+RchXPcRbMR1uhJMgPan0gUmmEg5C22
	+JdBu4nADHX8zVA/2GX8qwpghFEPmkUkjZD+UaUOzAFlbyxK40bSiQg294PXhBzvQZin3Q/9316
	HUZFM2D0MeZLkcT3WN2QB+nLDNFsPsMQDoD7LiAfoSiQR7D4Y+IC2QYUzplvYMOkow2cipA+a4X
	ATbL6WybgjoNDa5DSbXCkwsrj44kgeVKFOeMPA6t0UkYpNSWmm+0Jc7IBcoKmtPNgx161zwYYoU
	r3KMIl4fuLcf4f3wRtAOkGqoXLrvFl+Cg7HzL2rU5nMj9rimodSZ6/GqwM5fQfRbrQIFre/ztsG
	eGhv/ci+2uTQoxWnF2rjs6Ldndiyqk4VKsPN0XnvZDesv97fif5q48akaWCkuvBIsEC8eSP/3bY
	buMkwtGIWLs5/kD2vHEFXv1Uq/PPLYRwKcHfGJSpWV1aL3WpatvLOaLgVy7rQT6K3RIUtsJLdsD
	7AFUwcHTZPZHP6OBw1P
X-Received: by 2002:a17:90b:280a:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-38fbc4542edmr8751782a91.13.1785766715117;
        Mon, 03 Aug 2026 07:18:35 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:34 -0700 (PDT)
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
Subject: [PATCH 15/32] clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:42 +0900
Message-ID: <20260803141659.559129-16-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071835_793228_EA5EC3E0 
X-CRM114-Status: GOOD (  14.08  )
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

The MT6735 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 48 +++-----------------
 1 file changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a209..94cb0bee8bb4 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -77,54 +77,20 @@ static const struct mtk_pll_data apmixedsys_plls[] = {
 	PLL(CLK_APMIXED_APLL2, "apll2", APLL2_CON0, APLL2_PWR_CON0, 0x00000001, 0, APLL2_CON0, 4, APLL2_CON2, AP_PLL_CON_5, 1, APLL2_CON1, 31, 0)
 };
 
-static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct clk_hw_onecell_data *clk_data;
-	int ret;
-
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(&pdev->dev, ARRAY_SIZE(apmixedsys_plls));
-	if (!clk_data)
-		return -ENOMEM;
-	platform_set_drvdata(pdev, clk_data);
-
-	ret = mtk_clk_register_plls(&pdev->dev, apmixedsys_plls,
-				    ARRAY_SIZE(apmixedsys_plls), clk_data);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register PLLs: %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
-					  clk_data);
-	if (ret)
-		dev_err(&pdev->dev,
-			"Failed to register clock provider: %d\n", ret);
-
-	return ret;
-}
-
-static void clk_mt6735_apmixed_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls), clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = apmixedsys_plls,
+	.num_plls = ARRAY_SIZE(apmixedsys_plls),
+};
 
 static const struct of_device_id of_match_mt6735_apmixedsys[] = {
-	{ .compatible = "mediatek,mt6735-apmixedsys" },
+	{ .compatible = "mediatek,mt6735-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_mt6735_apmixedsys);
 
 static struct platform_driver clk_mt6735_apmixedsys = {
-	.probe = clk_mt6735_apmixed_probe,
-	.remove = clk_mt6735_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6735-apmixedsys",
 		.of_match_table = of_match_mt6735_apmixedsys,
-- 
2.55.0


