Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA54C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gu22Hx5Wm3nzcBoaW4acJiiPQrfQtbvdbnOdi4EGz7Q=; b=aqEc5/XL6XVurE
	Ee+AR4ktwa3HDXW+qTpBuFH4zG08NIEiIRA/P3aUnD+Zwav/saC1Fnwue03+oFXcPFygsTrjjcKDJ
	GWfkJMee1qtxE0GCfzvsY1Yxa1MzNZuWqscJlq5BgWTH8DSCt37d3RXuzxkORPuNu8WEysd42wFXj
	mql26flpUCjNKwDzacnxXtNhYrwRCkK22vnJyPJyTv88bKAq+ts1UUwpUlydnARMpbWEuhrYxSv4V
	HF1R73OCLp6t6UDsRDUGVb0QpM8fxNJTg1V6wilhQweef6YYes+DduBtnT2UWEdzl7S2WtIoI9elr
	6DSFr/9TtuGUtbrELhfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCjC-00Gx12-TP; Sat, 22 Jan 2022 09:30:34 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXT-00GrjG-B9
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so11298177pjp.0
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4dLgzVu3UPZmPwEvYWiLff/Jy1kChuWKg74HILKInho=;
 b=gvpLT+OdMi/dn6Dv46g2q0G1XapqMDfLybAIlxoP4Ayr5j4S/KvK9rv/+vCyBlQ1iy
 2oTd9OqTJ9lEf2gY7L2QkJr1k9eKXK4uIBF6TCpPlZw5eqpxT+obPum79TTyWO4vY00k
 /uoM9jLUdRSy39Sb3qF+pNjr3o77BCBo2yzxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4dLgzVu3UPZmPwEvYWiLff/Jy1kChuWKg74HILKInho=;
 b=5W9fO+J1gZv0JpEEVmwXgIeU7v8EZ3D2rfZ0fnGjxWQgjqTslOQY95kogCNWOmL2qh
 R9FeJVKDzSe0jEETJYL+nryEOOqz+lMmxaGCPKxmbvFDR0PzfNyGxKbp2PQXNvR0x+vl
 7ry9TPd+KVZbtfsQj5c5XXRuz5ay1mkA3KQDUjoLDiL1A7/PoHcJ0RXynuG3usI+CPDk
 0EmjN0RfQUqrLfVuRoY1JdY9daSFA+jxr0i37BPn16ohDaiUfahH13U25y9PhvZd+QSf
 cJtDe1wIKOXkm4iMmnvOfJic8wgk3h5JVRbnjfeXSZ01492g3m90mZP9LPIm6mZFkUgP
 +nPg==
X-Gm-Message-State: AOAM531J9L+pbBfpUi+tbJZKFKeLoNXrw1G2Jn4xZLJ6+CHk4r6Cnkzv
 VZgragH9UlHa+NowM5OGw69TJA==
X-Google-Smtp-Source: ABdhPJwrAq/6QES+b7lFgZS4hCPr/6p1PUXBrtNXH0twTGUh/4YxyTn0GKRlHBgLrCyy4BiumuQBmw==
X-Received: by 2002:a17:902:d2c6:b0:14a:6e28:591c with SMTP id
 n6-20020a170902d2c600b0014a6e28591cmr6956198plc.85.1642843106909; 
 Sat, 22 Jan 2022 01:18:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:26 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 19/31] clk: mediatek: Add mtk_clk_simple_remove()
Date: Sat, 22 Jan 2022 17:17:19 +0800
Message-Id: <20220122091731.283592-20-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011827_452394_6811BC20 
X-CRM114-Status: GOOD (  11.67  )
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
---
 drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 2150ed8678e0..cd76e1d80242 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -369,6 +369,8 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	if (r)
 		goto free_data;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 free_data:
@@ -376,4 +378,17 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
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
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
