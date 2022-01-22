Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130B8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeFb5QwN3eNd1FI5jdJfzbi1pulDe76qVzgC0+5kzi0=; b=yXOz9GgmQJUI8u
	EMgP3rGrmu6fwCaiR9Hc+4BZr+ak/7nv7YFfoHcame6xaiaD177b7iyst9RYG0w8F6ZUkr683znYo
	/WmHcCtmUdPSW0hQszpgc8D46bkE4I2jMTAFIS8pHAxyzCplAxbFXUBOceeuAOQ9h98TAKBwdXu3V
	9JC0VZRiLpPKcWb97zMFLTQj6BDNcZNLP87eSZT9iuWfldWWFi9lwEaTP3vZnUc6dHTr/yKZfzrLB
	UPU/gNAHVW6QV3NVG5is5b0/m5Wf8h1Xz0IF23S4JLmle/eSKdWICPSCmuPBeaTtg2uk1h4DyWHpy
	lBHWbiyOCu1PmTWf3SRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCbR-00GtmD-Qw; Sat, 22 Jan 2022 09:22:33 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCX9-00GrVG-Kh
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:09 +0000
Received: by mail-pf1-x435.google.com with SMTP id n32so1967737pfv.11
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=14oekTz2jUCC4Rr83R46NSrxudxWdrVi94PXUiSTUWo=;
 b=GeAKiZ2qXHpjbTDaTxRsRAPhrwtnHAA+bWWAfvB5SGpNEdh8lhBHUGNYuoupKevK1T
 Y1DokCz7jgKK/gFoPLRlk56KWjfEhKayjq8b46VW1cPzJgdVxvR88PhQMdqcXmxMrtYG
 msQvy9arKcOZ9bj1HBHL7oTz0Q0jt8ncHRvoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=14oekTz2jUCC4Rr83R46NSrxudxWdrVi94PXUiSTUWo=;
 b=w65qRAMWw6FxGSsvQSen9BkKs87U4HNkqOoBGIL8x01QyEUWfK1+Pojr/qKxbDGBG+
 taLrIOBor8i2DUYU4gh6DVf3inbSGQoyD2ThZpQVxfBFkc4VNq0HUp09k5o9KJ5kGJ9q
 e17Mk7KHDKryc1ppcnmsZphOn3L6VknbmB4ZrWBgzQ93pZ6WPduSuj9t01sv227MNX42
 fft6g03lExluPFEze8VBpKNy5T3TJUoP4bWK7JDD0QZj02V1jOJbOS9JPTnxGKfvdud5
 4xjdsTg7KJUrDy/7h00VYCFXv1UIRF7EUdbmQ0daLSodYJGGE0YS4h8+dNfxeJK61hYm
 gHmg==
X-Gm-Message-State: AOAM530FVnwBh05d1/CrxI7Yj0ttwCIKon+gIK/Rv+JqgSB+TuS5QMD2
 txtcGqMAiZq5y1Dzt3qu0zh61g==
X-Google-Smtp-Source: ABdhPJxBLmizlDghIjkDDcRjYFNdvmbFT8l691jjnPT3Ies6TSVELhgwbCd9IWZYQ6kTQCL8f7D04Q==
X-Received: by 2002:a63:6905:: with SMTP id e5mr5462412pgc.543.1642843086828; 
 Sat, 22 Jan 2022 01:18:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:06 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 10/31] clk: mediatek: mux: Internalize struct mtk_clk_mux
Date: Sat, 22 Jan 2022 17:17:10 +0800
Message-Id: <20220122091731.283592-11-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011807_715662_82DFCADE 
X-CRM114-Status: GOOD (  11.72  )
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

struct mtk_clk_mux is an implementation detail of the mux clk type,
and is not used outside of the implementation.

Internalize the definition to minimize leakage of details and shrink
the header file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 8 ++++++++
 drivers/clk/mediatek/clk-mux.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 6f0c22a699c3..2d4d8dc0120a 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -13,6 +13,14 @@
 #include "clk-mtk.h"
 #include "clk-mux.h"
 
+struct mtk_clk_mux {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	const struct mtk_mux *data;
+	spinlock_t *lock;
+	bool reparent;
+};
+
 static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
 {
 	return container_of(hw, struct mtk_clk_mux, hw);
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index cb2ac4f04c58..38a2b6014b08 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -9,14 +9,6 @@
 
 #include <linux/clk-provider.h>
 
-struct mtk_clk_mux {
-	struct clk_hw hw;
-	struct regmap *regmap;
-	const struct mtk_mux *data;
-	spinlock_t *lock;
-	bool reparent;
-};
-
 struct mtk_mux {
 	int id;
 	const char *name;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
