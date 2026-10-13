Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E305CC6B12
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8YZz6YHs+YnhWOB98iSQEya+TM/J9HiEFdEjzFss5E=; b=ssxd7wBX9EoLjff1HVAaNU9GHN
	2b3a2zP3luxZElE5SAm3wvGjbG0G9/v8hClikOp1iKbWODLGkPafYYC5M+EKYEqD1tewRvTelEG4X
	6oLMQ+wsOa7HZvg4kN2ZPVjzexql+HhpwVzTwGXFraVVGuOIRZ/GCE6+b9EOWv5CYdmrtmlYiPaVk
	msuTrZEe8B96utuDE1oMiMrRjwswNgdHDrfShrG4llI4kqYLZWWTgM+gxYvqvncNC4Yq+RdVbVeiu
	vjETVakFU+a/gXj/xpVEdgARnTgejGSw0slO9/OYRNj82U7kfp9J1m0DGGPIEHR5heJKjAuanWGJo
	wXzhP9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJb-0000000DIdT-1psQ;
	Tue, 13 Oct 2026 15:21:19 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIk-0000000DHza-3XGL
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:42 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1785336a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904826; x=1792509626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8YZz6YHs+YnhWOB98iSQEya+TM/J9HiEFdEjzFss5E=;
        b=o4+Lzkm80nyyl2WUXBAeB39uhSUJLbOpwD6LUXuav/5kQvWbz/1Te6Lf0m1VeGva8s
         QkAezYK7VgpPR7mMRB601+W05KSbd9iRTXEYUacuB6qYAkCNp7/OLysCzgicNXkj1544
         JUkyppd6wWYXkUXIGQxm+EQjNYkt7+pbZ2HkEZzGZoYZ5jmYrrpLc4wMmE8C+5IxJKSj
         GlYb4/nMGdZWOXr/cHgcuWFMX0q7mgs45odFztjU1+yubeUd7mz7cWbg60aZPLRRS747
         9yY1CHm5VL8idowD2TL62Hqc4YLiHOnutNtcOFqPx784MYukIE+aDoliAH93jLQ/GK0J
         bLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904826; x=1792509626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8YZz6YHs+YnhWOB98iSQEya+TM/J9HiEFdEjzFss5E=;
        b=L4+3tbeTdI5UEKDYPU1Y5Tt9lHZN9s5ykdm4YvojpJbB82+zxjqAZiSlFSZmKG0jH8
         vDbb4f+9oDG61HzJpkVXWAy0XRO8Pc41TzFdBla0NfXF1Z4ZtBaa7MhdQK40NbQqtPle
         U7UQOlHpmaLDQKr87NZGgeE1bSD0tj8lVHhw4Bn7ydU1KMXOX1lJSzmTxpVd1PUGBE8W
         gb5833MlTvNNEXILYM21RgZ8ymLcIU1R/yXcJPwJQW5C8L9M/WtcZrcV5dwT1yW1q+Ky
         TgadbgfJRhLkC6ZXIqCxdj7WC77Kt0ux2LTStBdlLKdLoOeno5Xm8AioIld2jfz+Iun2
         7WpA==
X-Forwarded-Encrypted: i=1; AKwUvByc3JAPsNcPqIt4EVVBq8MbHLWtzIH4f760D2zX0uwvJX3LTq09WrJLsusf+tRZ2MPRaXy/8ZQ6YsOSFjN7CA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKnYeyQP0hMp0LBTeQVqDtB36SzBv+E+9Ju1/DKd0lc00VDfoWq
	PTHrRd6VFa5mDmV5zvU+rDP2Nkg5UdG7zWBIxJyFnVbOeZwSf1s/ZUKc
X-Gm-Gg: AYBFou3y3E7lFTCQ9ZfssH2mRLPKv1Yg5gqdjtShWB8Ori4/G1vzJn8NTTE2j1z+F6i
	QBuHPVAcXXdhO5EkSy8crxVDbYQTqBd9EMtRrUgNpcI7B8DkFJxuQzhRHmtP1y8uLZK5GEnYgnm
	GkAivL6fAdevBJzeKUSKQutnfyB5yHkeXr4FK78fPMnQkVH23T73P1Iqg7uB3p4oqvqn2vV/1U3
	Tn4FQY+HSf2spyNaISSKc2LTR2TJxKhiq/vwXm2UuXrBlDbhS2+lSEuz1jZGnFKMewfpGgjqoIQ
	In/uj4CJZOGOU/gtlq9sljcnrU2FkbhZEKiJatGojeHXIkEXb4B3Yj9XkOQNMup1kINULNlsTB4
	kinzrXlY1zyFkIWo0F3R0rFVIYlK39UKNJmc9suGTf3hkR7J92IanrCPIVSQFwbwq1lcz2rqnOQ
	2taoFVvlpPxsgZ/VOKm7DJgTU+WO87WyEenXNaT6IA86RD80AFUyMY8red+uFXjQppB2uOAfawU
	XWpeZgAc721ZhyXawvQROt+FYs6hFOCaoolhxY=
X-Received: by 2002:a05:6a21:4ea5:b0:3e0:c2ce:3f71 with SMTP id adf61e73a8af0-3e16be71fe1mr9198126637.37.1791904825086;
        Tue, 13 Oct 2026 08:20:25 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:24 -0700 (PDT)
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
Subject: [PATCH v2 25/35] clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:24 +0900
Message-ID: <20261013151734.3177690-26-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082028_056252_01D996B0 
X-CRM114-Status: GOOD (  15.00  )
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

The MT7988 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading
and ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 39 ++++++-----------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 24f4e7b87a31..f7bb00e7d17a 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -71,47 +71,26 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0x0318, 0, 0x0314),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
-	{ .compatible = "mediatek,mt7988-apmixedsys" },
+	{ .compatible = "mediatek,mt7988-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
-static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7988_apmixed_drv = {
-	.probe = clk_mt7988_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7988-apmixed",
 		.of_match_table = of_match_clk_mt7988_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7988_apmixed_drv);
+module_platform_driver(clk_mt7988_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7988 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


