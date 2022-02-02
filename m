Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FD9C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JM038s07j+GRiSvFRFz3Oam9RDoXt3GBDNGisJ2A6hw=; b=rnT4DLfK+QnHG5
	OfSkHmiSEst0ZDbtk/jAd3xRuuBB03k6nn54sW1A/jNg+ikH9Ersba5fw59nOL2SUYP/MOmSSwkAK
	OgXZOqOZmBGYZ0jZAtZTOiUsiUG528m/L51y6WgC4Ij+Q+LoS98sf1b2wzVbkLxxndko+vxQCvhhz
	WxYDme6DykTfiIfKBorbgIll9OUIA5xufn4UrASxtguO9uZnX/Ephs6dbJuLweMq3u+zAiQKGzrEw
	Cix+t4OjBGrJZEIOd0IKysvdgfOCcvckNVr+Yx0G6akUtVpE4YmPMQJUJp29t07dBOEzx/HSnrmL+
	SQPSnq6KH+X6dMc57A4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG2h-00FQ5D-BE; Wed, 02 Feb 2022 13:51:27 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG17-00FOwb-70
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 132so7342656pga.5
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnC5wd+W1Uub0jyBTii0bw1jKUM0SD+MmltxaETPxmI=;
 b=ifkWBdljLlCdQrsnHb2AaA0xiVXH5i/9qcSv1GL6LW/PoUV26HY1RZyR5xcnjsOr+z
 uhIw6zBd7oLaRiZv9+E5Nf7YQ9SgfnPGAFRR4NBLw3veNFLU0UCkMO55TcQkWkEoldYV
 0nhn7rMWunukBQmGpuPAbvZXiLDhoeuy/Ko8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MnC5wd+W1Uub0jyBTii0bw1jKUM0SD+MmltxaETPxmI=;
 b=rYVS6CGmQLYhyNY1WsIM1TjVZB2bUuV+UbsXB8cu1UZ0szq7Azr7+OYslMsq3/nvdH
 aec1PqHkkfqPap0neD1O4KAp4Zl/5N0YSM9gunIJ47U3CV5TK/yJNjHhAa2DP2vlslu9
 ukDfWC6xvM08BPawfnEyHRGyg8ZXIwtfINia1bg6LQq8vW0I+IBOs+DPFEgvM/TeyaKB
 BrXyNgy7HHiOIhAquAsTBuCBDffFCu8I95lVSZBZxL/fbF0fZU26pnNLbX9ZaT3klOGb
 8v1ktXGxhllbympqA+fdIqqaGw+vdBAXB17Gp4SB8PIkIMe6xGKbVEaYHacVTazfGjri
 hHrQ==
X-Gm-Message-State: AOAM53377S+cGqRMVUv36mr4Oa09c31hbfRHBqbR45DzflkHZTHvafvf
 j4qUh4OQJRBo3GpBRNydI6sAzg==
X-Google-Smtp-Source: ABdhPJyE1fU1DE0Y18OMUQ3BYgMoazVLDzDLvc5zUeGVpD74dfmN2S3rdVUMXCpYNy7oMRTOlZT5Ow==
X-Received: by 2002:a65:400a:: with SMTP id f10mr24302297pgp.161.1643809788467; 
 Wed, 02 Feb 2022 05:49:48 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:48 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/31] clk: mediatek: gate: Clean up included headers
Date: Wed,  2 Feb 2022 21:48:08 +0800
Message-Id: <20220202134834.690675-6-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054949_283709_FE056985 
X-CRM114-Status: GOOD (  10.90  )
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
---
 drivers/clk/mediatek/clk-gate.c | 11 +++--------
 drivers/clk/mediatek/clk-gate.h | 10 +++++++---
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index ed1ad5535d41..e8881ae1489a 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -4,18 +4,13 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
-
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
-#include <linux/container_of.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/printk.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 
 #include "clk-gate.h"
 
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 344adffb6578..6b5738826a22 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -7,9 +7,13 @@
 #ifndef __DRV_CLK_GATE_H
 #define __DRV_CLK_GATE_H
 
-#include <linux/clk-provider.h>
-#include <linux/device.h>
-#include <linux/of.h>
+#include <linux/types.h>
+
+struct clk;
+struct clk_onecell_data;
+struct clk_ops;
+struct device;
+struct device_node;
 
 extern const struct clk_ops mtk_clk_gate_ops_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
