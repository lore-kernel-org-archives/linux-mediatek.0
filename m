Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E31C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnXziMC0es7glFWavxmLNBxnYXcRnVClYyCUmdjbPW8=; b=QHAhyijbEHs35J
	WqIqSupjOJZAfNHaOA7f2mmt+d4dhnPfbXUh/njQniJnDOoX6h7DITGeWyI9ihFx3XqY+nijt2sZP
	d1c9C2Y3XUhAIcBKYvetI0Q1tA7amKnTTOE0GpYsMaWKYJnMZrGNvyiIAMvOFsp+HLVeOJ6eRtckE
	oDBW4COApS3kVXCJT70cJ7wXE6JOlq4B/Kino0qkBn+EMGP49oGyEJdeKPG+UjR9H0Qg3Vn9+CNKa
	a0Gfky53hYfKmF4IO+54dKWNdzxE8XjRtwx9opLwYW1ylaWULi3pXgXb7+wauFB432ewPwcPe62Q7
	G6e0gl7Pl88SI67aGQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQ6f-00DvxK-Dz; Tue, 08 Feb 2022 13:00:29 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoT-00DnfB-UP
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:45 +0000
Received: by mail-pf1-x429.google.com with SMTP id d187so18625400pfa.10
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UxXHG53mykHwbXXXl6QinzYax9pQXchal111embQm8Q=;
 b=oX4x1gvQjxvxSt4a/L+sGTUd80SmwHzdFN5Di9Fue38kDqvXUicpxO4zseU/lOEIYT
 cCZpokdDjO6vKZyA+BfDjWw73ltev/kGx/z465m1SrygfkxAGYV584mSARhMIv/6FS3C
 zKkYrGl7gWKvOYNIBF4QdYZIzlKskCD0Ca5v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UxXHG53mykHwbXXXl6QinzYax9pQXchal111embQm8Q=;
 b=HGiNsUb64LSfz71pDsyWR5EsFZbpVFsBArKL4nl9XS+83nhOO+aCQe/aXXImr9mP1L
 ixif3YC4o0FNYZiMt52sk2ORZU+81wEtGqFKR/zItE9LIp5+c+5kSfdDJSCXxIv8YqlA
 5bJLSXO//XMOJwYMwYL6kqbTBJ/aC9oYg5ssgvF5G8hJn7nZUUBsUXqrtqhMvCjMkR9+
 K8gmmoqrqlAqURwaHC7g4+4ADu9Ipvd1EbDTvocE9h3P07VdrlHyVTK8lsc45hqPPa1D
 73ZumZjThqSX1llVjvZyq4Y79U1JmCAlkHnZP1ubHBW4F6TnE/Yovo2SdYyWcw5dgzSJ
 wxow==
X-Gm-Message-State: AOAM5337u8uw5OLZwas16WlayVPGN5p5gfy4AOltXydDMPMLMrO9D9bj
 v2b0UA88XWr4GOWMXxEKmre40mYZ4USxpg==
X-Google-Smtp-Source: ABdhPJxTJoAFPatZ+sQYfPsLCiW0XuU5pPQ74xytkcecYomRMstYp5V5YnaiscvqnVCpRyddm8Fe7Q==
X-Received: by 2002:a05:6a00:1253:: with SMTP id
 u19mr4397090pfi.8.1644324100988; 
 Tue, 08 Feb 2022 04:41:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:40 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 24/31] clk: mediatek: mux: Implement error handling in
 register API
Date: Tue,  8 Feb 2022 20:40:27 +0800
Message-Id: <20220208124034.414635-25-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044142_067171_61539D11 
X-CRM114-Status: GOOD (  13.45  )
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

The mux clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 70aa42144632..f51e67650f03 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -215,13 +215,26 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_mux *mux = &muxes[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
 
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
