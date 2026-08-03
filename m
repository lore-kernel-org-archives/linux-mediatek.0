Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FDDC55AB9
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBdhWQzJRHYryE9WZhMb9eq0tPTuw8+xNI5NcLDCCxE=; b=CGscR6U/gkUommf4TbIZx2rDqa
	odehNVvsYu3chg1rC4im5j04jz4OhD9miUb5UUWZ+oydsyXKYdQ7QZ+B08JkE1wYQ7F3JX+Xyw6PN
	uBQBuQeeeXVVmSHu66I93q6DxO8I5IWVvHCCecmcwKpSdqKpLnAjOsNhgiP7aDP8s45f7qX8j6bue
	jYCdCYORbMyPmcR0lBypzCK+d42LdLYopnH1VzDT9n86b7q0AD3v3Nh8E/NmA71W0vfII7gUoZdR1
	xUkzwhyQXQalEZmVy+8njQxq2/QnE4a8nKQlNeDv9qqvf2lHyhW2YEH4n4NMV3kUZzBL9k3dBu75+
	4fQPlgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVW-0000000HLm2-2ErO;
	Mon, 03 Aug 2026 14:19:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVT-0000000HLh1-3RKL
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:09 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381b831d535so3845955a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766747; x=1786371547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBdhWQzJRHYryE9WZhMb9eq0tPTuw8+xNI5NcLDCCxE=;
        b=Obm+HmXCctnNPdmzNOEdXpXa13wV92o1mAH5yHJCN4lrIvF/pwLIDcs14YX9jM1FhJ
         wsotLPSiY23vtNwWeuPrXe1RPK73A2ygKdMwRI8s6nLQT1djU5CYeRCkbTTjjlyCgMOF
         Y+kr7sGAOfSe8JePqTmDGv8xnBVHPDp809KFBOlV9MGuOwOd+bKM2QxLfNFsUz5XYRb2
         DNqmZpViZWlFfTxe20jZtKCLMQ9/F0Gsj79tOI74lLkg2ZJtzFIMico39AXC4XdDggEz
         OWbqHZ0ddycZnYN6QZcaWmwZKhA9ucDos8WmMJByc6rKwpoGj3Fh2IhiVJ2ErCrlmZ/a
         gbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766747; x=1786371547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBdhWQzJRHYryE9WZhMb9eq0tPTuw8+xNI5NcLDCCxE=;
        b=ryEhaIpuxq5tX8B7Ve+dXRy7jfn5DWrPO9l6OpvS0JTmPyqFO6O0C8NScUCQIbcVV2
         0TiTRAOrMsC0iC9SBYP90Y3im906H7VzLxyatHuiJyeffkxSrdm73P8ECkSoLyro9GlZ
         7P0H1GJaqpG2Odn7KQ59JGemtrhHcgpKCzADQk+Q1HJJl11segEdYHCWGXgOJrHcPz8D
         ODFze9yechVAvg4sZioJfgjBSgy/GtrzT0mGqZXMW/CK0zqX0ry6zuPauaDKlPD/lNu+
         g3pPAWCL8b9RbN3/uDKyDCfV/JOKQXiSf2D0FPxDkBqTKdChAgIyZ+xQLxFcdskukthb
         AQDg==
X-Forwarded-Encrypted: i=1; AHgh+RqKhvowP8NOhHG+adeuE4KL567wuesTE3RJpvaqr1CxxsOsND2UPw7/T9o4ebdo32VNzapRyPW7DfH8b4SJcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Rjxc0uVBqNjUDJV5jwvKOfYWF39yxtVcJYda7GkAlwcU7lmg
	QmVfWTrX580OcYGuqHjrUhwVEwZG8TcTdrtxN5dc//NA1sabTfxsCZOU
X-Gm-Gg: AR+sD12jr3vJXKh7UstXtBMlj3dSjsF/qWg4ESgUI/IeqVdoppd4A8Ktlpo9Ke4zTsG
	MSQZPBbpor91L0lGRMwJIe5TemZbFr6sM6HGsFMy1XT3mL6rr0gUQ2Kk1rLqQWdCZxgfXwcHT9O
	u0D2r8S+qEwgYUY5KXc4Z1yUAlWxVjlwigMx8xggcLz125TzzcrAghPTNXWb+R3g8EwVG2vxnhz
	j1Ns8cNPDEXLB9xOH1ocnKja/OUChXr7zIz4JflupSZMYeLw+SXA45/xNPvVA/ysR39EbEmqIzm
	Xo2aGk8RvGU5RJipy+iGCg9HZJSUAL3xxwa99JgEdX7TlLEfPfAsdUSQF0NjWq2t5KYAcdaUf62
	9l5f9NsJzfBnKTd7qXYrYiwxLUcjxWeFt4X3DFDiNMHGmCyO6Yf9Q/PtYrfBpi7USBkLXGVM+OE
	99djdVxZ0I9IoyjyvUSNeTOOIIK4MI4ey2VI/8Vp4hdWjI7VFvVFfsTHBFO5Q/C0+IqsrXN49Ja
	ZX+RFbeKnekO8Sef3PP
X-Received: by 2002:a17:90b:2ecf:b0:38f:e6cf:4d6a with SMTP id 98e67ed59e1d1-38fe6cf4e03mr949891a91.41.1785766747241;
        Mon, 03 Aug 2026 07:19:07 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:06 -0700 (PDT)
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
Subject: [PATCH 22/32] clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:49 +0900
Message-ID: <20260803141659.559129-23-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071907_890222_8DE7B29F 
X-CRM114-Status: GOOD (  13.69  )
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

The MT7988 apmixed driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
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
2.55.0


