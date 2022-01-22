Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E819C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVM3fT2VQ5K52Z1IcJQFD5V6MrITMj44nkTNdpwljdw=; b=mOdvfts84knc4U
	/5DCWWUFzLuIsEjonYcIbKUiTUG1lY0whM0PQBIzcVKo7eGOBFbkx7RVZp4efGxJ1V+V6oYXF7sxw
	B3OAh+4Z1Equ3sqbvn2NqrYsMwWWCk411CfZDokPvNJ409GYBg3luSmuu9L4KtafVdgRujhW+m5t1
	kvE8aRQcKoGCGJxRrX4wmUuHW16VcZWByV2W0AeSi6pF7A25sJLHKmiE4aOeVU7RGAKGsyf0Za9wc
	mOqgWexObqjPXs6mqYjwZf21RgVand1n2MLVmUh2JL4vmokhP4FpFnU+bnDstISjhKDcGcqq2P6eT
	4PFUr9HLoho+GN+i0Mbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCmI-00GyAl-59; Sat, 22 Jan 2022 09:33:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXZ-00GrnF-UC
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:35 +0000
Received: by mail-pf1-x42d.google.com with SMTP id e28so6621648pfj.5
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1TEZ0MfngpjieBK0SXrIypAK0YzHVKnAErn4UHbTrxk=;
 b=G89iIeSLYaSHnG28ej39jy7C6u1UfWz4foTwDQ3HDtc1rwz7fX2NqHJAzXQGdhTaM7
 7dkLHYZsAY363xBWB4t2vrJVLdsj7YQorPuqazaY1Zwn/+TUsRlc6Ic7+WjjdaooeKuk
 gURdzHetX2DAxi4E6qBVou42HNmx++CcJTDEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TEZ0MfngpjieBK0SXrIypAK0YzHVKnAErn4UHbTrxk=;
 b=SQADzzelnLItfC66jRSL8AMbNHN837+w1Ps0qrSCZhjVjlcLpqk2cr4l3NNGsxVzRW
 WAZ32SaqlGgu9o1qPOe3V62ZkZJcmVtEIA6nlFR7WtaHdp55bZazO5koMkrtMDjxwjjB
 1a37Y+Ej2u419iKZ9UUJr9/84yRPQ1HALXM7E03Wj/F+6x8tVkOqYI6n5NnbWDu/ATlj
 +G9HYULkYoynCwzDuPhO8H/qMPCzDaaChVlrPp80FUMhVUE2ZtIj2FKxDFlbK9SxbhSJ
 1Dm9XN2Ymx809iz0duWYQxWt/lXsof0879VryxNCEZ+J4Wtt6pa4DvFZE8rGiBKPhU7c
 pOMA==
X-Gm-Message-State: AOAM532/ZXKelVjASQSbJ98hBAbJ0PnDrh8NeBbm/LXGd8nC0WqkhMPj
 8UB0uHT4yzwFFVkxNrpW3P6bEg==
X-Google-Smtp-Source: ABdhPJxJiShS15jsyBrH2j+XqBNlWH2MNjyeLX7mBslEBYwQ2NuEg6RU8qADx6ysHah6+FMDvsbf+Q==
X-Received: by 2002:a63:4e5a:: with SMTP id o26mr5497546pgl.272.1642843113500; 
 Sat, 22 Jan 2022 01:18:33 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 22/31] clk: mediatek: gate: Implement error handling in
 register API
Date: Sat, 22 Jan 2022 17:17:22 +0800
Message-Id: <20220122091731.283592-23-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011834_032484_05D07F23 
X-CRM114-Status: GOOD (  12.35  )
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

The gate clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-gate.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index e8881ae1489a..631ff170b7b9 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -237,13 +237,26 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[gate->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_gate *gate = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+			continue;
+
+		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
+		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 
 int mtk_clk_register_gates(struct device_node *node,
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
