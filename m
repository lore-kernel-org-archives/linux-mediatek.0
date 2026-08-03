Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270F8C55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg8Jme5PexkyEgenMV9ZNSXBG0k75+HQtQ7Cc373Klc=; b=r44+/M804wnvNam4xETJKMjalJ
	ocvbfWIgekqXjowt2G5rcJOOk9QsXQW7GfUXECPKn2t0L4t1/PFMqj5B7hSizunAqQ7HzbhyzwcXZ
	dS8I2DnC6TrBrjl0D0KZRBmR9QZwXJgyfeL9rEkLvBEbYIS9+i5F7wH8xzoaKv5sEdrlr0G+4lo8y
	fHrLXLj5TR/n8SrgYiBcNpYUZ3xno+RQoymY0310+Gzp/KUzGzORrHFhc184SwN7udEAuCL6PBwMF
	APUsSEH9sdz/UQWApA9jXJvmH4tBx5IfXe3eJQFQqHQCYfZ8dMngcLCGWG9DR3Xf/HMvxMJfz8sCc
	JsPWGRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVj-0000000HM5N-1SyV;
	Mon, 03 Aug 2026 14:19:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVd-0000000HLyI-11Ah
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3627374a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766756; x=1786371556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg8Jme5PexkyEgenMV9ZNSXBG0k75+HQtQ7Cc373Klc=;
        b=QdTdaiq5x4xTu9sLtIrUljZA0BvlOE1danQ2geBcvCOmRWNY41eLnllLDZ3iZH8eai
         gVDsamLOdaghzDRPTdH/AYv1J/VpxT6xucV/roEptihRLk1uGS64xx5uk+BbCfXzy4rk
         mNAqjw1C6jBTtJmzTLVrtfZyDKMVRNFSgn+qAHin3vtL5Jew7j6v/+klGrEx7Inr5M22
         9rKHYJTPqTz52cAQXV4XtUKUixEVid8HRYCDHQoow8KLYE+B8TtyeQQpL0OnJdOtSJs6
         PZqCxsG64U+YkRSiYhLNciKQH59NLC/9cUE6b/tWUoaYznFxwRi85LIi2BOp1shzjrZ2
         aRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766756; x=1786371556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sg8Jme5PexkyEgenMV9ZNSXBG0k75+HQtQ7Cc373Klc=;
        b=Mz6PFOPXsp1B2rG7pkJ9FjvAtpSBdh6mE561+NrX1IdJRysLkv80s3qr4OLrV5a5mt
         Jb+HupNgMsPcWxQXWWEL6ZBaSRt6zmKiNDtz4gtTACR82Yw+P8sqs/p97NxB2plHkYlt
         W7++HTB61uTjOAyY0NoWglrNJDL/p//Z5YIdRmJwnm+5G9aCJbReIxM7P4ccT8ROuN0N
         S0pCUCxJTQljSFGJRyldWwLEVR4Ul2O4bwd2nGo+NVpibXCLGYgopnSWLmi7JngASiQj
         Swx+cYEHeDpgJogVdsCRZuzLP4GbmrEAJFf6bwTv8nJzh0wIZx9bKHpDkBNMRZRgom5d
         ahVA==
X-Forwarded-Encrypted: i=1; AHgh+RpB5HDAdwA/HpwIQarh3KsEOG9Rd2d3xeUVr9nTe0f3HGKChKYMN1M0tPRVb43W7BaWKRZzJE9Ys6/Hrnwucw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYkGwXVEF/pjzci92jbjC260OehgSHu6Zg7ozjWOkbLpgpzaEP
	ELU0xQOHVM9L/N/zepDSm88evsX56B/ejj8xIK4hMFMNUiViBphlaLt2
X-Gm-Gg: AR+sD101xOAB0XrFGn2sGM/b1MdVp9bnrkPvQ3g98FMg1p0NJ1yK14Bh+b/rezaxRl+
	uky31kEAwZFeN3WKog3/3/CWiHi5L8RhEyH3vx/U6H+e2e0SjGQtlU+Wm2zQQYKSTKh/5anKfHm
	G+KzrfVzEvPnKEDlb9F3YxAm60Fo5FUMm3NDrvg657wqPq4xgmK6A0dyDa11vUzo3bMSw8BP628
	VhHfDUbZEjQwK3PqE6nXFptE3G7QILTdyuZty1861z5dpt1pwICm4O1JoEhA/giVvhc6E7Uv3ik
	eTjhJGvAJdm+0oA++9Yuo66NQ9XpYb9ObpU+odWGejsh6ackkvtSLAiJuGX7LOZ1j+oh2Hpgeig
	QIwgqt0VyX4Cfcf3ELkepAvVDgqUix7KR01Lav4qPLFTA4lG3EReMbp8ow5SXzYfgmP/1hPCVQw
	LewQpW/M8UNPtt1RJVv8ncaX4CeKtSHUx9nwfCaffEqV0LHNHpUc3MGw83Y962PilQ48ood01kC
	hJKTIL1sg6PC/WxooaS
X-Received: by 2002:a17:90b:1b07:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-38fbc438047mr9182294a91.11.1785766756347;
        Mon, 03 Aug 2026 07:19:16 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:16 -0700 (PDT)
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
Subject: [PATCH 24/32] clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:51 +0900
Message-ID: <20260803141659.559129-25-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071917_322985_E2DE798D 
X-CRM114-Status: GOOD (  13.68  )
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

The MT8167 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
Also, add a remove callback to properly support module unloading.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 50 ++++----------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..2b1d1de74cdb 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -89,44 +89,13 @@ static const struct mtk_clk_divider adj_divs[] = {
 		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
 };
 
-static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
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
-	clk_data = mtk_devm_alloc_clk_data(dev, MT8167_CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = mtk_clk_register_dividers(dev, adj_divs, ARRAY_SIZE(adj_divs), base,
-					&mt8167_apmixed_clk_lock, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_dividers;
-
-	return 0;
-
-unregister_dividers:
-	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.divider_clks = adj_divs,
+	.num_divider_clks = ARRAY_SIZE(adj_divs),
+	.clk_lock = &mt8167_apmixed_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 	{ .compatible = "mediatek,mt8167-apmixedsys" },
@@ -135,13 +104,14 @@ static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
-	.probe = clk_mt8167_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8167_apmixed_drv)
+module_platform_driver(clk_mt8167_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8167 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


