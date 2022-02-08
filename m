Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZ1RVn3GgYiCE7vPaSGdedMMGjH0le6RJluIk9e3kUQ=; b=RQl5O2H3oh6Mg1
	EtzSk75djgjUQNNQ5OLYec5cR79E0aQ1WF81uuSpBMkeu8hOZtCEFvd/DOq+ZpIh3krINSYlLFGEI
	8m+R6DmicZ8Urkio3acUVB49zUxvjcXkzwGNlD9q3xeDAi4bs/mcvZBe95Fcob5yoDIwh7CXth47F
	wnPaNKUcJkCEx+ZFZohfagZmVRVUoqajTGEHxXseB931DBPa7gExAc5ETfkDB7WWsRsXo1OtD7l7W
	YHRSjyfUQPS8Idw+MX1LDAJqkgZIDSTgRstTaHIEQ29jpRmhZRvSOx5RFRInB+gBm06VPu+zvhilL
	z0mfJdUixA4+Hrfpa1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPrl-00DpTI-RI; Tue, 08 Feb 2022 12:45:05 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPnz-00DnPm-4Y
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:12 +0000
Received: by mail-pf1-x431.google.com with SMTP id e28so18649222pfj.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QqCKqTMNdoAp7+sGE2nBPkF6G+PqsK55lVYsLHkGo/c=;
 b=ldnpoFu3DD5eloRyku85uykx5dM7xP/9mliT08SVLlpMajfgHSGH62rCzJ7c2wiNU9
 tLL99iJhWybm+mEdugFj5TJyCm7plg0oChYxRHmaGsrtcDKb/ToB6sgRmlJ5IYoL4AiX
 +T3px2SJjDdQxkj9GahSUkyDg6YawanCTC39Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QqCKqTMNdoAp7+sGE2nBPkF6G+PqsK55lVYsLHkGo/c=;
 b=MQV2pY8cLzZwRZItDMOM3nCgjPaRcCt4ORGRIcKw9mMdCEY/I9YT+t54zEzl1WN0eJ
 yeL7e2Ir6odiAOI/ACrqI0c23zTEEpG6jnFKyKgb47pwV2mGpVXS9hwQIWAVg07k1Zmr
 7tz9IvRNgaWG9/m8Xm1wX16Msdx7E5vgpJ3o9xyrrkKG2SVMR2SFKOkrhgyh/lI216Bl
 Dck/uzj7yUJk5BHdei0ZZb3cSsPYZnjQhdevsCj+aTi+iojzvXtPuQNxijTkDYmXKwR8
 9ghuJxKlBqheCw2z6uH9zUqEyAfPHkcj4x7uIXE6Pzzrzm2pLMqjmf1915SnN5zadP1C
 g4Dg==
X-Gm-Message-State: AOAM53209/sX4rLwLdjLXhGZcDIgro3grzYVFlPNWPPIeBx9tZzAEJvU
 tWL/6hOSozNGCh6CMUtxgF2CPw==
X-Google-Smtp-Source: ABdhPJxWcJrY0ZpPqfzhQI+lhqCGqXjIUU+JarLsOFyR0SfIZyB4euS/X0UN+worLnBp2w2IQ1isSg==
X-Received: by 2002:a05:6a00:2283:: with SMTP id
 f3mr4248506pfe.24.1644324070536; 
 Tue, 08 Feb 2022 04:41:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:10 -0800 (PST)
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
Subject: [PATCH v3 10/31] clk: mediatek: mux: Internalize struct mtk_clk_mux
Date: Tue,  8 Feb 2022 20:40:13 +0800
Message-Id: <20220208124034.414635-11-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044111_217857_F80954C9 
X-CRM114-Status: GOOD (  12.56  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
