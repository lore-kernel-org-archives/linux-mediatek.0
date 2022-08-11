Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDE6C25B0C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsWSqA2HL9bDCW4avw/DgO2p3E9K5sHwSFYZt6gxnxY=; b=bg3UTAnxfbafOZIS9VNxw+TfRv
	UTO1fAQcjhf3/UpUB48b6U9Dg4IIsczTbCEqGCL0uCXtWlrUA4Bb1vGZz3qb0Zv33+s/UWBi1oMvD
	Y6JpiayJt97sbzGTSUg7dLFnAKeRt35XklwJiHs1YXEnG14BLvXG0r8tN9vmkvZ86+lYDyw+yybbQ
	7M5U3CcNm2KqICvHfSRiuZzgjb5QKHy38cEuvcirB1QNWEAA7nFsCUWsIZl5cjLO3PSaPouqYp6I9
	rYzrFUAR68pkS7K/v/lcS8I0HmJFNKug6B+XnUObYGU2zVX5oNE4sshooUdj00ohrnCobu1L9xkqq
	yFgOhuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3oZ-00AQD3-0M; Thu, 11 Aug 2022 08:45:15 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3o8-00AQ15-Ko
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 08:44:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id gb36so32259584ejc.10
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lsWSqA2HL9bDCW4avw/DgO2p3E9K5sHwSFYZt6gxnxY=;
        b=T7VphdBfATr9q7YYOWkzhR2WASaWgaytkDtcX6Grl9VADQtt9aChWh3R4qsMzyEPQ2
         dOta+R31mJ90LoR4XPvs55Qt18vy0h3rwGM4Qdp/JYvSBWgHrCiaZfeDcWV9yCIiWgjr
         mSnaHa/MswRMtvqlwvezYYhyQKve0WoiETLeS/RVpK7OaKWJEcgAk/ig3kCu6L8i8ED9
         6x+qiUP+YYYy3YUzZTczw0toC6XarmTXv6TU2J+eZX5wfe1ykixiDYbooxvohS8MuqJz
         oiFQhwVt/U1qLPwN/BqD56JKn+GSbMQQ57XsoU1nyHx4agm8a6VjyiQ3ylaMjmNWhE0a
         Drkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lsWSqA2HL9bDCW4avw/DgO2p3E9K5sHwSFYZt6gxnxY=;
        b=jnw1jw3DqDDYIX65lNXAgNlxD6W7jBFPW7IaIYtU2N0YxceKdgQcaE3kpIazYigPaA
         nQ93FdWcs7CZ+oj5PIh1HDRQl22Ap0o+Mqs7rXvkI5oSGwksmovwmII2tZe99d1WwKfZ
         UehH4ytRFejJZAAia8NQxJfjk9bVmLsuR29jPo4CGVrWCxmj9zEwiezJ+V3jwUC18Bw9
         OdyiZwUB93/bJRYhKm9K6hxYOK+qISTaG9AWcLA22q6kAtjBoLTiIXZkygTuKANpCsgg
         YmHXAGWuoxgKiry9Hj/1lS22F7M056EVERF2UVZ05fQcU0o50ysMDm9cWjic/MG6ABtX
         i18Q==
X-Gm-Message-State: ACgBeo3ONqVxaVzQlmEbfidGkfC3mbqF6dHl+z9AuzRVTfvyRud6LmKW
	pCS1qUPSPhLoipYbRE1B1qGH4Q==
X-Google-Smtp-Source: AA6agR72qAJm1q+utoby0dFLib1V9rCtlj6nYjVZgz2ip4o5zEoQXrnGANfzlF2y2dp9Cy5Auoya6g==
X-Received: by 2002:a17:906:ee8e:b0:730:4a24:f311 with SMTP id wt14-20020a170906ee8e00b007304a24f311mr24182040ejb.420.1660207483867;
        Thu, 11 Aug 2022 01:44:43 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d5cf000000b0043d6ece495asm8799314eds.55.2022.08.11.01.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 01:44:43 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 3/4] clk: mediatek: Export required common code symbols
Date: Thu, 11 Aug 2022 10:44:32 +0200
Message-Id: <20220811084433.2598575-4-msp@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811084433.2598575-1-msp@baylibre.com>
References: <20220811084433.2598575-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_014448_710523_5EE3EF5C 
X-CRM114-Status: GOOD (  10.01  )
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

To make clk-mt8365 compilable as a module there are a few function
symbols missing. This patch adds the required EXPORT_SYMBOL_GPL to the
functions.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v3:
    - New patch

 drivers/clk/mediatek/clk-gate.c | 1 +
 drivers/clk/mediatek/clk-mtk.c  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 421806236228..0c867136e49d 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -261,6 +261,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_gates_with_dev);
 
 int mtk_clk_register_gates(struct device_node *node,
 			   const struct mtk_gate *clks, int num,
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index a317e69cf298..22519e7ea74f 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -422,6 +422,7 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_dividers);
 
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_hw_onecell_data *clk_data)
@@ -441,6 +442,7 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 		clk_data->hws[mcd->id] = ERR_PTR(-ENOENT);
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_dividers);
 
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
@@ -475,6 +477,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	mtk_free_clk_data(clk_data);
 	return r;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
 int mtk_clk_simple_remove(struct platform_device *pdev)
 {
@@ -488,5 +491,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
 MODULE_LICENSE("GPL");
-- 
2.36.1


