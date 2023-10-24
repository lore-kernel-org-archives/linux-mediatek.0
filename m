Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA16C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 05:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PfAUTnXWgmubMD55oBXowoonH5R6qeZ5OH5Z0vIY35g=; b=U4U5Nb2bMfzfdic8pgsK1NNtTB
	wUYtTDNgB6yOOngPTV4aZFCWnU1mx8Sq0ZCGBTQJIiVm7J+opLuNxTEiw8CbhZ3CqlGayEedlRo5m
	VO4677K9XhQZh1YcQKAFPSwaPSW0uCKjWQnSNN1ADpJ2t5nLM6V2xzVFa/nkYcGyJnHpit8FjQ5B+
	3Oh733x0tvUJ51T9SasbsryJdvEnz0kjylregt/L7JjBXuc60P7j7s/vdMXTmGlwMaV3dModAX4lG
	whf2RPzgL61slQCHus5lNjr+R1eg7Jq2icuLHow8h9c2IQhJugCazC+hAJElQ4UzxmYhTUy+/7QvP
	h+FYxRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv9XM-008r41-1v;
	Tue, 24 Oct 2023 05:01:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv9XJ-008r30-2B
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 05:01:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so34626185e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 22:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698123658; x=1698728458; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfAUTnXWgmubMD55oBXowoonH5R6qeZ5OH5Z0vIY35g=;
        b=xJHaFjkzPyMB+EOeTfzur34SYeVyY6vDs+tljb8Zf6ErINwjPbZFPbltLUoxK1siZf
         /nOLwN790OUAB1oXeVLEs7XlaR9CXOqsigMVtHzq7rZMJVUM9gRHtEUZyW7F3E+wRg1m
         1M3jYYnaK9i3UeB3OYKcd1UYgCoFFZDL/pybwg5Mnl3NgQ7hqoUE9a9nahNJQj+bChNS
         YWaGntudmSRRX7Jm8UtYqR8QzsaUQNqF6tkWTcc44n4T/27MyuZmIYoPBR2gpsnBv0Bq
         BpsV1RtxHha69UJvmUlkJJNiUu2YUoiWbEFXoavHGKNJn36ouDAkM2/fL54mD/Ea3saS
         aTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698123658; x=1698728458;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfAUTnXWgmubMD55oBXowoonH5R6qeZ5OH5Z0vIY35g=;
        b=wGBH61qJoPyijZUWcHekntGd8NPVqTuF7oZQhquwlEbEv+7rzBY/q84YC6m5G6VXTu
         lvZ/KY1yRxyQ+kVfzTUNsKgRpONTM3AGv6AnB5JKndD/vBFK4h7TT7GxD/jmReKG2Nra
         O6Guk8Mwbz1VGlfxe6vzcmxXaJXcKsgcqNMdl1nwJU+LFRDKmlwQbk6UZrUgwwD4KfEZ
         9gvykpCxAM3zxnk9JZwa1KJm6I2Q0kz8w87z8cSfT4NzSZgotcnmBqEAz8qFnvu1DJvq
         fuJmRTJiG7kxwAmr4UyzmWFBDcsD0OKUP6WpLf1Vkyh/kJZQgQNUvyX+bm2GpThautoW
         grNw==
X-Gm-Message-State: AOJu0YzO/Acv7NSQBT+lh5WPc05KDXDkdRjus8idoTVfAX/eq8ReWuFy
	L3FHq3YbPeSEe9deOwhBdLWS/w==
X-Google-Smtp-Source: AGHT+IGCxa8zVvugVsfJkL9J6ZS+nuttr3UC3F3P4N8AKS3AC9nbGPTuSL5sW9pl6CVyGpEEPy2M/A==
X-Received: by 2002:a5d:44c8:0:b0:32d:83b7:bdb3 with SMTP id z8-20020a5d44c8000000b0032d83b7bdb3mr8294329wrr.70.1698123658157;
        Mon, 23 Oct 2023 22:00:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6451000000b0032da022855fsm9020793wrw.111.2023.10.23.22.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 22:00:57 -0700 (PDT)
Date: Tue, 24 Oct 2023 08:00:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: mediatek: fix double free in mtk_clk_register_pllfh()
Message-ID: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_220101_821320_EA033D44 
X-CRM114-Status: GOOD (  12.51  )
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

The mtk_clk_register_pll_ops() currently frees the "pll" parameter.
The function has two callers, mtk_clk_register_pll() and
mtk_clk_register_pllfh().  The first one, the _pll() function relies on
the free, but for the second _pllfh() function it causes a double free
bug.

Really the frees should be done in the caller because that's where
the allocation is.

Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mediatek/clk-pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index a4eca5fd539c..513ab6b1b322 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -321,10 +321,8 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 
 	ret = clk_hw_register(NULL, &pll->hw);
 
-	if (ret) {
-		kfree(pll);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return &pll->hw;
 }
@@ -340,6 +338,8 @@ struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 		return ERR_PTR(-ENOMEM);
 
 	hw = mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
+	if (IS_ERR(hw))
+		kfree(pll);
 
 	return hw;
 }
-- 
2.42.0


