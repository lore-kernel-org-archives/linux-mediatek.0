Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B43C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnEXqm6Z6m0jY1TWvDNIM1QzXnTOqUOC21RFOmJrGOA=; b=m/Oxou5K/LqiGV
	L8HMZMMzkdpZePiEsDXOi63QM67DNcrAcpisLhoC+DF47gilBQIObvhY1xHVQqLHWWbfsL9cRt5LZ
	eRaNFnhmMEREOyKO/NZsWIDuLr1ZhQ8HAeM0K1M31vTMBrVvHJgsx0SUmDaEDZMQvIpme9cQ8BhyM
	LIm2qq6rwwWa2BZOIa9ayaD8IIYwsmTRrR+3Vd4wfjPIMiq7Vsc6pRLoBs2JCYYZauwNGBU0L9rOi
	qDVCLTlwawiZ0ps22GlmDkO0QoJrGRo6PvQvWebn3+ZhK8rhjRWCJWjxAvg0h+X0XuQEHK/0VzPBs
	tMpGd0B7L2OpLCfsEDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCn1-00GyUk-4U; Sat, 22 Jan 2022 09:34:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXg-00Grrt-Le
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:42 +0000
Received: by mail-pg1-x52e.google.com with SMTP id q75so10262620pgq.5
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eaTeWNEgjqwSs85dnefGHTIT7+UhSwDVAnPu0tdvvQE=;
 b=PRKpymQV7xWUkT5i0Ifjesb20aljfmowZM4+SjVfERsyMOTucgZNAUD9YO7ar8zJfr
 d1WarJMewlgGgzEyuoKB/jwrxIOHkjlYILVfH25V+Psn2PnnJ4re0cugZPIspYaWN82h
 YROLc5AQFk+7TBATAuWCjd8/uH4WAnKtYdXk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eaTeWNEgjqwSs85dnefGHTIT7+UhSwDVAnPu0tdvvQE=;
 b=c54xour//I30BWBgYvIOVldtQ508AYZ6LIVlw2YTw1T4Ai/W9tec43/z8+QjoJhgon
 QHxvMVgWEMc6zNwbMf0j1fScv53JEjp1f8QEExailD+iebWFCOBIzO5uN+0Izce92VjO
 aqPW+WOB6lGfIWitTrowDgNNH2UaLhXEWHBcD9HG/5LfnTZy766ou7GGCs4MLaJ5yv8p
 tzXf6OTOLrJBnMLvrIRWAVVx70hYDx3Q/Ox81t37oztjVgul7sl1kH54TYht6l7y4ate
 Vt56/2Tq3+lsaWwB7PTNCSn+TNxRMSZqtKYZwpVZMKYyDl5fPlUsqF9cgtzg8pn8Dyeu
 8NWQ==
X-Gm-Message-State: AOAM531QzvzLyFf1CK+DYDt11jO1Aj16qBzQOCN8/DDjtoyU6TwFoofL
 SE4Fc/mGR7t5vOGEkKB9c4FqlQ==
X-Google-Smtp-Source: ABdhPJwRjgaufhTqOLp2a5KJoAsvUWYZrG3/EkFjCr5zSjeJlit/D9oY598PALMqVYEQeylLybPljA==
X-Received: by 2002:a65:610b:: with SMTP id z11mr5646889pgu.205.1642843120168; 
 Sat, 22 Jan 2022 01:18:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:39 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 25/31] clk: mediatek: pll: Implement error handling in
 register API
Date: Sat, 22 Jan 2022 17:17:25 +0800
Message-Id: <20220122091731.283592-26-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011840_778517_E7D98875 
X-CRM114-Status: GOOD (  14.51  )
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

The pll clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, and unmap the I/O space, is done in the new
error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 23 +++++++++++++++++++----
 drivers/clk/mediatek/clk-pll.h |  6 +++---
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 9698d1c97cd6..1dd15f560659 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -369,8 +369,9 @@ static void mtk_clk_unregister_pll(struct clk *clk)
 	kfree(pll);
 }
 
-void mtk_clk_register_plls(struct device_node *node,
-		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
+int mtk_clk_register_plls(struct device_node *node,
+			  const struct mtk_pll_data *plls, int num_plls,
+			  struct clk_onecell_data *clk_data)
 {
 	void __iomem *base;
 	int i;
@@ -379,7 +380,7 @@ void mtk_clk_register_plls(struct device_node *node,
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
-		return;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < num_plls; i++) {
@@ -389,11 +390,25 @@ void mtk_clk_register_plls(struct device_node *node,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", pll->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[pll->id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_pll_data *pll = &plls[i];
+
+		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
+		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
+	};
+
+	iounmap(base);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index a889b1e472e7..bf06e44caef9 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -48,9 +48,9 @@ struct mtk_pll_data {
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 };
 
-void mtk_clk_register_plls(struct device_node *node,
-			   const struct mtk_pll_data *plls, int num_plls,
-			   struct clk_onecell_data *clk_data);
+int mtk_clk_register_plls(struct device_node *node,
+			  const struct mtk_pll_data *plls, int num_plls,
+			  struct clk_onecell_data *clk_data);
 void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 			     struct clk_onecell_data *clk_data);
 
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
