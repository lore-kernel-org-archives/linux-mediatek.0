Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB76C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xktvB24hfKlYnv/0T/ExzIF5ZRfZEKt/rf0IkbZYGCs=; b=m5KTkfu7/JKUYg
	ZBOOezqTFK5qt10+83YCBzMJ07HTQj6tbw+Yoi16GvqDyiQqjfOe7AxsZKgD63bPDdOeUXGdpgqZT
	qzam0wdUT+MWL0O3bYbCque4Q39PEUcgzImb9SqxAO+n+eviuMg52DpZygTIaxE8MQpfZ6OIx1ccC
	/e63sakHjjXI6IMtzPU2SZh8DIJTniW7FWTxiv8R9Lp1w9IxjLN87/LmR1r1rxGmLhOVVQH2P0n02
	KYNgDG10BDx8dsIRBCD5msgcXBh7aU9cLJumg3OaoxhI6h7oqHzXNa67bL/qdyrqh70J6Bcb9a/bl
	yDde+r62S+qd4M3nnBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngj0G-002EE8-33; Tue, 19 Apr 2022 08:14:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiz6-002DgV-2N
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 08:13:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id n18so14693507plg.5
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 01:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbHuIMp6NqIKnY64hxaFgyNKsnlZfy6+G0wX97Ig5HA=;
 b=J2PrilvtBtshJTW6tcuSuriyrmWtLh1/U8UmkNn/ZRQrKqSR7IRRW7Qqld7f55Q3cf
 rrxhVkgpCFX/NIRsKoR5V/FWv6L94yV5dO9rMil1niuqDOA1a6a+EVEsXV5pYyj1XBE8
 gzq+sQBOxYp86Ov71TzxfQDGnM28PMCBiuEHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbHuIMp6NqIKnY64hxaFgyNKsnlZfy6+G0wX97Ig5HA=;
 b=aquDIEiqz04Pr3X23KK5fc2QKoiOGe4b4RS3DhAMAPyjFfc28Tihry2zBUUg8Pv3Nu
 o6JlQpJ1woJxbzeChCPrVv7t2naq/BZz4Nbu287jRKnB+wurtdJ9rWXaMVyUB7FEa/OF
 1BnvVg3s9z1Q8ENlSFj+H4SIqljRXqgACptavW0JYusZ//PTAr0sh/9YCkyh2KwqiFYE
 ksnMXGgusXg4ne3e40aqhxshcya1BxOotho0AWt26zu5NLKm0JnXHoqqfFAv6lpDDd1e
 lUo4GtNGoAJCBa5FQ3n1poTTp1cm8mnwJfHiIE4GBcLjkG0aZTnaFwZUS/9lCh/BM9P6
 gboQ==
X-Gm-Message-State: AOAM532G+8FOAxzjf5jwKRKML0KQJo2AxEVMFQsm8/mVXzkO0Om0uZGM
 Q1EJT7WSDW0g3Ys3Nke5isXOqA==
X-Google-Smtp-Source: ABdhPJzdudJnBxIdIosCr5L+LmZy3jMnoSHD6sH5rSKWIoDdz3HtV2F81M6Us0l2M7ee5fHUZcO46w==
X-Received: by 2002:a17:90a:ce0b:b0:1cd:6fff:8dbc with SMTP id
 f11-20020a17090ace0b00b001cd6fff8dbcmr17075458pju.212.1650355982018; 
 Tue, 19 Apr 2022 01:13:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:33f6:f1e6:3e21:a253])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a654ccd000000b0039db6f73e9dsm15767448pgt.28.2022.04.19.01.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 01:13:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/7] clk: mediatek: Make mtk_clk_register_composite()
 static
Date: Tue, 19 Apr 2022 16:12:40 +0800
Message-Id: <20220419081246.2546159-2-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
References: <20220419081246.2546159-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_011316_143018_D749F186 
X-CRM114-Status: GOOD (  12.83  )
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

mtk_clk_register_composite() is not used anywhere outside of the file it
is defined.

Make it static.

Fixes: 9741b1a68035 ("clk: mediatek: Add initial common clock support for Mediatek SoCs.")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 drivers/clk/mediatek/clk-mtk.h | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b4063261cf56..52bacce5dadd 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -183,7 +183,7 @@ void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
 
-struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
+static struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
 	struct clk *clk;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index bf6565aa7319..9577084790dc 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -147,9 +147,6 @@ struct mtk_composite {
 		.flags = 0,						\
 	}
 
-struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
-		void __iomem *base, spinlock_t *lock);
-
 int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
 				void __iomem *base, spinlock_t *lock,
 				struct clk_onecell_data *clk_data);
-- 
2.36.0.rc0.470.gd361397f0d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
