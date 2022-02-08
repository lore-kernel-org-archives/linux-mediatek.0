Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfIOyrVtwhs+IxCMkCYLrce1pgq9b6TcKY8H3RcnPkw=; b=VxqqB1DzLfVMma
	v9BgyMi1eFrUeakNsHOIuuK3U13CHE6TEkYz4tcnuj9SvkUdB7FPW3oekdlyWERzUMaYCSD0qvIb1
	qdblSkwld6FT7KqBW/psvNFRt/yX2UyGgOr4zUUcpmmDmvcJAX5Q0aKDuaGQnbPbFnqdPmbhHBgPS
	bSCuJ5AJeB9r4NjH2c51DCh2e6mULdQ/c3oDUkxlar/7fTiwP3lnKR2ByGxqc/OaeqNfq/QRZxG4R
	FgMPstbikao7o4j+aEtOISTfKYIt8lpn992C09Dy/SwEgR2Y0GHGnbg1pfoEZ2q/juVwggWP05tcw
	YFoAHKuUSVUWkSQbpP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPun-00Dqyh-Me; Tue, 08 Feb 2022 12:48:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPo7-00DnTt-TN
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:21 +0000
Received: by mail-pf1-x42b.google.com with SMTP id n32so18630104pfv.11
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHqh/ijWzTkcfpqZcH5Nz4N1ISUlPyaJ60Q4OawbBT8=;
 b=VnE41xebylDSIYGhpkKNh6ZSVZj7DTmMZVRnyN0MXW4J5q0SI5huCttg3YkTT/ADYt
 3DheENGasIAUHE7ketk881llrCYZtC31y558+C3G/eh93+rEmIPR374s5tVphnYIuS50
 EcGL+mY2csHY5WHy0gsEFrhBXtCv3+HUfvyEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHqh/ijWzTkcfpqZcH5Nz4N1ISUlPyaJ60Q4OawbBT8=;
 b=fBTB4I4S/1QUvInfduVG/d2pARiSj/ccwgo35wzdbAB6W1QeaxZeWPr159JsebqJB1
 jZb9ty18gZaggv3d9s0rIqMRjF/rqqB/BxHsN9XV03O737PoRkwuQYyPio7yweVv+5Dl
 gbuGPBTYBG25xbua7KJDD8L0ZpF9LG6k1rHUa7rPMd8dlQvu0WiS3YMnEY8EQrf+ue80
 Js+D0+3K1qBwYs156zuHgkUgInorosenCIfTCZnNGJrb4LAu0BvVGqmIeKrasUhRO2AX
 vdRKxklGuO0CMh1T3/u6jjrsupb+6v4f64Y/hY9nvouJplubbAfjYP4vfjE/yD3H1FGA
 Bsag==
X-Gm-Message-State: AOAM532tvbx5AOtD1Of64hSBXddYDlzUqvcK/W363oDqXyezV79rUjgC
 D7fIkdD2TmZWxf04zn1UFExxdA==
X-Google-Smtp-Source: ABdhPJzo0Dp/SCBcUkYHyRIcTeVZXRqv8ziFNxicZ9SLxGT7dPNBKPsfl76t0sK8wZgzQsmDxW8paw==
X-Received: by 2002:a65:4b82:: with SMTP id t2mr3342176pgq.607.1644324079445; 
 Tue, 08 Feb 2022 04:41:19 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:19 -0800 (PST)
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
Subject: [PATCH v3 14/31] clk: mediatek: pll: Clean up included headers
Date: Tue,  8 Feb 2022 20:40:17 +0800
Message-Id: <20220208124034.414635-15-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044119_997215_04599DB5 
X-CRM114-Status: GOOD (  11.51  )
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

Also, copy the MHZ macro from clk-mtk.h, and drop clk-mtk.h from the
included headers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index b54e33b75d4e..8439d37e354d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -4,17 +4,19 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/slab.h>
-#include <linux/clkdev.h>
-#include <linux/delay.h>
 
-#include "clk-mtk.h"
 #include "clk-pll.h"
 
+#define MHZ			(1000 * 1000)
+
 #define REG_CON0		0
 #define REG_CON1		4
 
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
