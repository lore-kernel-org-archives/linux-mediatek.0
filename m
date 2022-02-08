Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51297C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJx0OCWOfJR+CdaS1g1N1Cgv5GyzSHXqkUAanayC6GI=; b=QnuBvrXJqEkUzB
	87xPObGjF0J2QBNN3U4+WRa7gR3iDtLG0bkwg1NJ7CeO+KBqSErwJu8mW7unRa2MahlCq0zjx4s3K
	ppda+gDxHp7887f/poDSk11JSptbAIuMwOwHJOZyDOnBu312c7vTMBr2a0cj3oYmTyZzR8FtYk6gj
	spQTn/phNRiC4af2dnhL0Qe0HJrnNstVn4Ri/FGtTaK4f2VSp9+D10INlpS9yYwEG0DPcN6jP+Qi/
	pr8W9rnDRRRyRI8mSl+r4YXTjpGWalI6SQZ4Na1dkrmpLJHEKZkOHkMMW2Eczh0pawtD0covycF9I
	I1uFXvIY6ehVka0ugXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPpV-00DoCD-9P; Tue, 08 Feb 2022 12:42:45 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPno-00DnKU-DI
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:02 +0000
Received: by mail-pj1-x1032.google.com with SMTP id y9so8503364pjf.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rg7A4+9l27NSY42Qe+sFkyiXBBTKwVjr3yLAs4KlFxg=;
 b=mlwzzpOJIyTPenSMBs+vzWOWF4s11a2iKpFwkjBFPNJ2wIbzWSCm8BTUlwqJX+N1Cu
 DAaDL0V7f8HlDhF8CB7YxNR7wAJCaLZbAsPEdi1EBt+rrzIFaTDaUeoFbcQryratNDJV
 YBaoXUES6ZVTjN7uqH5rf2Bc0DEByC092aAME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rg7A4+9l27NSY42Qe+sFkyiXBBTKwVjr3yLAs4KlFxg=;
 b=rR4nGH+JSsm9B5Vzrm5/EAX81JLA30V/5V1FIMftFIAWFDDg9hNFS93Oj1kbHGZxAI
 5QfxtCkc9RlmZeQMldj/a1fH3RyuL+akqckw8/hqDntEvPy9ZrPJ90Imbik/M5pbqzpp
 Uv56eLjDSHQRLt6FJbR2bRhws8OmgjC7EnjNgN06NjMr5xAl0vChoURwPyOcnUWUGJyt
 4kboDQNbJyJXMWVL42B0FNN+l+tSA92YfpgNgBPiMhru2F2ZOwcQn5E/9QiCG2xsdMGu
 5ZcGqp+7XXCtvRcXU4BftnXs6mA/3y9qhqCaRosC5ZpBAwa83VjPN69Oi+YhBgjOdU+2
 SN2w==
X-Gm-Message-State: AOAM530Z7UKdd0gczxljgSp/8ZQ21xUca6kgzSr9rV31l38obe2dqCqy
 TdYJwB0mhPD22wIZlVneUW3i9g==
X-Google-Smtp-Source: ABdhPJwyIYewICHmp67Gv493qjDoHahQ0wtK5N12U7VeDgZpqQE8uKBp4aXA9WxD/jUC6YVuudwbvQ==
X-Received: by 2002:a17:90a:7a82:: with SMTP id
 q2mr1183088pjf.40.1644324059938; 
 Tue, 08 Feb 2022 04:40:59 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:40:59 -0800 (PST)
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
Subject: [PATCH v3 05/31] clk: mediatek: gate: Clean up included headers
Date: Tue,  8 Feb 2022 20:40:08 +0800
Message-Id: <20220208124034.414635-6-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044100_480839_1F736181 
X-CRM114-Status: GOOD (  10.59  )
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
