Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB102C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFB0wCg8FtQUSl/GMhIoIXSB7lpbf1OQPHwT9Pfa9+4=; b=yHm7uwj4ZIQA3c
	7GumyTMom+t5KVIRGvV+Rh/WRYjwfR/K6G3mFF9bZ1yniP6pCQoeZI0y3asV+9VM6gFRl/xB9R24O
	4HLAKEYg2fqfHYIFBuv1nD/s6+8RsM58NcBHkhxYasGe0UIHdWIwKHc2QhWfxGAaTPq/lS6TRmvf7
	Mm4HisRzeu9P65YlPAfsYs5xDQuBCnEk5P1BbEHgW0zkh/jOH2Bvg1aH2kUHRtx/QN+0JS8qoQu8m
	JmH6RmwntUyQcs2n+cKERtkke9GmAU17yBPUBEh0aDGU17Z07GdFk0DX/w0UtIqXu7Y4ghAbcKTwh
	GMW5uOoZu0m8UJD5e+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGFG-00FWXv-9H; Wed, 02 Feb 2022 14:04:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1Z-00FPHC-7M
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id s6so12750101plg.12
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnJY4R7pNFq+r1c9Hai8pZCAxCplMW9W4uneml+9vI4=;
 b=oWAUpCfdpiugCygrTgIA9X8C/lV3LzbqgqOMRZO7X7MfSgx4XOx/FBGQjiEP1bNdkV
 P2XpD8hAcBq+sHWNb0+VbeAN7xU9Cuc9a+imNhgeUIjXLwNyKzYfeDgonqpaKz5oGpI2
 UFpiuHKEjD3JbhenDiu1XBlBW/6fU2qYI2Fko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnJY4R7pNFq+r1c9Hai8pZCAxCplMW9W4uneml+9vI4=;
 b=zhPnFT2fIxPQrj4QoCS0fM8B2/Q3oGx8HgIcQg2tW3kTPKb6hS17xF9nAl25OFXUuj
 iw1ioL52ZmTBU+HP693pzqSsyxiLx7NN42RtY1aA86mnYAftn7ZHxR53Nbm33/O/UD6x
 CGcjU69OgS9+x+bLQWkAu4Yfxcnm55Rwhm5Y4jcyHwzl1jljSwl8I78S0l6puTEEzEAB
 b3A9cPXHo4zw7PeKDbgV99zsuih2If0Hk5PW7SfZ+SQ0nVJpHUU/CpFqHgkL5eJQs5d7
 VXutvtWUPsiiS9xBnLhR1WJOn02LiZVIhCj0Vw01AAr4P0qG8XhoSMVy483Oj1LlaR+e
 Db7g==
X-Gm-Message-State: AOAM5326ZNAhbV1+GfVEmPHueRsPQGUeq9N3lIS0YlDU71++IPU0sdKw
 sg/nnI9SelbYk4jdJE3v5efTjA==
X-Google-Smtp-Source: ABdhPJzr0WbMa8H3fmltc1g6gtQpUKUFkIR/O0axG2tZ5a2Jx5HPYVY+Zgn++LYql9+AsJykPkGzBA==
X-Received: by 2002:a17:90a:601:: with SMTP id
 j1mr8278507pjj.192.1643809816732; 
 Wed, 02 Feb 2022 05:50:16 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:16 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/31] clk: mediatek: Add mtk_clk_simple_remove()
Date: Wed,  2 Feb 2022 21:48:22 +0800
Message-Id: <20220202134834.690675-20-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055017_409226_08C00E8F 
X-CRM114-Status: GOOD (  12.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In commit c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to
simplify clock providers"), a generic probe function was added to
simplify clk drivers that only needed to support clk gates. However due
to the lack of unregister APIs, a corresponding remove function was not
added.

Now that the unregister APIs have been implemented, add aforementioned
remove function to make it complete.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 869e6ae55c82..f108786caeda 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -374,6 +374,8 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	if (r)
 		goto free_data;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 free_data:
@@ -381,4 +383,17 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	return r;
 }
 
+int mtk_clk_simple_remove(struct platform_device *pdev)
+{
+	const struct mtk_clk_desc *mcd = of_device_get_match_data(&pdev->dev);
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 3c3a934f53cd..4fa658f5d934 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -202,5 +202,6 @@ struct mtk_clk_desc {
 };
 
 int mtk_clk_simple_probe(struct platform_device *pdev);
+int mtk_clk_simple_remove(struct platform_device *pdev);
 
 #endif /* __DRV_CLK_MTK_H */
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
