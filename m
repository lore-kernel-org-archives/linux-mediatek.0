Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D92C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjeqvbxZimYk89OvxODLCWwcyPpI2suCS9QOzJcTMhA=; b=Npqc2qkZrb7Ikd
	ebup+BGK4ByoMFS1v3/sOuG+RG5udAK0pBYQB/6KhT5w09zCu69YYzzWqiH0/p0pyh0qXGGqnW4Q8
	1sdlRY9tSPixVGXnQH4LcXjSbpXyH2we4mNgFoaivfm87YwblB4IWu4tZM2EjUEfUg0EYpjeSir2B
	eu5VtBGXr5r6GatOHb1JLeP15R+pYc9K7mkynTS2pZ3YP4SbeMPmB1Za0+KPFO4OahlHA+OQvGCKP
	9PsZOE9ddAOczYB85n+qPA6PRC6nuibxOBCT50tnskSMWLYpvbn3PnTn+Y+5hmJGfX9huIftdOOoe
	5dQUkFPPU5h1n36uGLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPsK-00DplT-3Z; Tue, 08 Feb 2022 12:45:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPo1-00DnQr-5g
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id b3so150594pfg.7
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1TZM8PREBca7FhBIqkK5TTjacax9psRQ+lcxgoGzOac=;
 b=IZq5kTRtSIhS2WplXP6OWmMM9gugZL0etNS2hOiiAKeUTokmQNLVM3QCZUd+xo6w1b
 vRhhg+kgnMMqqvJQ3MJg3SeG7GhOho2JnIxPw15s1+uVDvVltw9+xVruBsV1ATn3GY8M
 8TFoRv3HgNjLs4CFru8cGPXiRQzotHrFeftDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TZM8PREBca7FhBIqkK5TTjacax9psRQ+lcxgoGzOac=;
 b=KQgRITmXHcHWuS0COjMq3jDqNOMndcgHeR9DAPVFJUAzoH57OSLyR8QiHLNezKg6/+
 pYAfmRLZgV2q5NMOap5TgRulxB3Qyl9ifl3NF14pA07eQm5jOk7Omdmwkr2bt03cmYXT
 nqcMDM33DCguMYd9kU2DbIWs4axrLtUw8WDluEEu3aiZC/filrzvMpu6oa4xrI1Gsx5R
 uITsVGmN6aMHxPOalSAQeaH/P36C5mKYsBLP+OUc8dZGspKYSV7txh8UpdeT68mXum1j
 /QJ16oP8/UeYSyOgrxi1WnFxfs4aSLTnCOEnSyVbEWcIvhfjMN/UnvVCKe9goy0o64RL
 Kb/A==
X-Gm-Message-State: AOAM5306u/PbqVFxk/woJSZy+cXLaYhIqTZOCJngqXEGUEsDHHgou2bv
 uUOcS2CczprJ22tS9GtvqrOiFg==
X-Google-Smtp-Source: ABdhPJzGbRmwB7Ijypv5ad/Be1a0AHal20/jqqhu5PrT8YWb6VHkulJZxUxHpXwmHTgsZ58Jrbt7Ow==
X-Received: by 2002:aa7:94a9:: with SMTP id a9mr4258241pfl.78.1644324072723;
 Tue, 08 Feb 2022 04:41:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:12 -0800 (PST)
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
Subject: [PATCH v3 11/31] clk: mediatek: mux: Clean up included headers
Date: Tue,  8 Feb 2022 20:40:14 +0800
Message-Id: <20220208124034.414635-12-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044113_256441_242461B0 
X-CRM114-Status: GOOD (  11.02  )
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

Some included headers aren't actually used anywhere, while other headers
with the declaration of functions and structures aren't directly
included.

Get rid of the unused ones, and add the ones that should be included
directly.

On the header side, replace headers that are included purely for data
structure definitions with forward declarations. This decreases the
amount of preprocessing and compilation effort required for each
inclusion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mux.c | 11 +++++++----
 drivers/clk/mediatek/clk-mux.h |  8 +++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 2d4d8dc0120a..01af6a52711a 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -4,13 +4,16 @@
  * Author: Owen Chen <owen.chen@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/compiler_types.h>
+#include <linux/container_of.h>
+#include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
 
-#include "clk-mtk.h"
 #include "clk-mux.h"
 
 struct mtk_clk_mux {
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 38a2b6014b08..903a3c937959 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -7,7 +7,13 @@
 #ifndef __DRV_CLK_MTK_MUX_H
 #define __DRV_CLK_MTK_MUX_H
 
-#include <linux/clk-provider.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct clk;
+struct clk_onecell_data;
+struct clk_ops;
+struct device_node;
 
 struct mtk_mux {
 	int id;
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
