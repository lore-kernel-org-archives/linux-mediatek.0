Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C02C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diuTMSMrV3iNMtz0nEtwxS/E/kRTCxbVbpqO2+K3jSY=; b=QRb7HCjWw/4nHf
	AqM+8TSJqaZD5g8Iar00Czu151Vgx+E9S03ayZewAPL7F4ZjyrQ/Cy5XhU5s0mIihBWCvMp9JyHH5
	+UoO9E3I6XuTL6MpJvChSv44ztrfnuaBPYNqN/5fKFfgQIwqo6WJFJInCyb+Xqq3F+EDGhG34JX+J
	GQV2oOreeUFB/jHlRgCkUmgrfMWHgquIw8Q1dzM+PXZasIPTIQRxxrcuSOMZWvp8/f8W9aJ8xaakU
	4zPNH3Rxi0GWhcKxed35+0P5k4JH3EnwFhd3Kjg+oy/CcWjY2gxetxgyJZ0WweEgOJ0xmbE73hJNB
	UF67fhSkJLm7Ca6tX2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCf1-00GvOU-9h; Sat, 22 Jan 2022 09:26:15 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXK-00Grcx-IE
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:20 +0000
Received: by mail-pf1-x42f.google.com with SMTP id a8so5712244pfa.6
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=09dDye5BTCvVOx6QTdRmbLqERJKxycNqJsPrVtKKxIE=;
 b=X3nIg5syolDA5HTdP7//AqfI4DJhbQGH46eWBgE4YrqJbpegvuy5ySZCOWf+X4wydK
 PNoitdzRr/Dmxm9+e3Den/5btX1k/CCClXLx7nT9PJ0XmJCJfRhD9wzIfRps3y2eGcp4
 tsPfpIzu5etmcDeibSN0H6wmhO6CcAKJ6YS94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=09dDye5BTCvVOx6QTdRmbLqERJKxycNqJsPrVtKKxIE=;
 b=rKGTD+4eZVzImpYHKi212elJ3qGkiQYuxdEq/Px3ZmYaRqZJXj3b+WTiFEnyuTG4QZ
 ypG/IyawPZdKGjLglkS/SbhO7MC2YBqwU1+XVvKna2A3Axn/swwKHXeiZeLgw40DfUUW
 2DS7eR32XwpxfiMhz+/wlYplAvzKI/7T8JXMw2ray85IYPFBaHsTNQgc2TfFueQ6krgY
 IMb6BR8oQnKcTBqIIuy8SC34NdJaFzTIu2m6SNNjRSqGAGVTSo4OvNvrVdI+ZvePiR4X
 cUFZeOXD/HAMm/dtsznGOvugt9s7fAvhiuRopzn3YfsHfqBCnaNStbUN/kfhi7vigrsk
 tN0A==
X-Gm-Message-State: AOAM5327hUo4wUHCyIL6aoGkusFy20a92qKVjHM6eg00rCsnR2kKwbvU
 GYyl5AtXnJ1YIMO1en8ShWuIww==
X-Google-Smtp-Source: ABdhPJxMWFtklW2XRMgutkF5dkiCv5I5Xs1QlLxCtE78BQzj9qwRiqQ5OKon4OfL+/Wvz2V100nLCA==
X-Received: by 2002:a63:8f4a:: with SMTP id r10mr5515957pgn.414.1642843097972; 
 Sat, 22 Jan 2022 01:18:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 15/31] clk: mediatek: Implement
 mtk_clk_unregister_fixed_clks() API
Date: Sat, 22 Jan 2022 17:17:15 +0800
Message-Id: <20220122091731.283592-16-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011818_677593_A7FFBEF6 
X-CRM114-Status: GOOD (  14.06  )
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

mtk_clk_register_fixed_clks(), as the name suggests, is used to register
a given list of fixed rate clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 0c5db3c71fdd..7c0d5706eed7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -80,6 +80,26 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
 
+void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				   struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_fixed_clk *rc = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
+			continue;
+
+		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
+		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
+
 void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 		int num, struct clk_onecell_data *clk_data)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 168220f85489..cc7f920eabb4 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -34,8 +34,10 @@ struct mtk_fixed_clk {
 		.rate = _rate,				\
 	}
 
-void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
-		int num, struct clk_onecell_data *clk_data);
+void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				 struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				   struct clk_onecell_data *clk_data);
 
 struct mtk_fixed_factor {
 	int id;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
