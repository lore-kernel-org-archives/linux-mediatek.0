Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27604C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsNbEtjd5zDncOBKhjXvoY7alLwLmb6wLfD5Ze3NFk0=; b=iFyUV4f49OGJEo
	n4gqeCR4mfrr29z62XjLbbJp2fzuIsAhiw/WxkMT9CkRhD2npKwTI43EGS8eBuMhpv1Zb1VxxFeyQ
	XyLAY13nX8ism83B21s/iFNmxLF5rIiXXlNYHCeAUzGxprSS4bGdD/4r0JMn9Ah6o0M1zIK0Vl6id
	0Of0sVzbz3pDc1jpt5Sv0IdSGzKnBy4grEsTvrKsFFdeLACTJAgxPdHjeel41BBHcASvZ0wOuTmbc
	pFuAjeVxem7+Xdr/plw28Q6t63fYU+66qgK2xdIcjFtXKvZIETWgrlylfcpG0n/KmEFuenXD0uaLE
	JVF2Acd+kgqUbfImgReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGGE-00FX1k-88; Wed, 02 Feb 2022 14:05:26 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1b-00FPIz-EY
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:21 +0000
Received: by mail-pf1-x430.google.com with SMTP id i186so16368289pfe.0
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6U16I5h4NQIjHAoaMFFGHeoaBszozzi/qTuoY6Zxwc=;
 b=mW+92Gk+2VySYb/AfQ9MCdHff8aHAQmOwUwW4znhKb8lsVxKFTjYUvLHGRGAeAoufe
 ClXBe4+x/DLP2gWSqwN5azWWea5MVH52cj+FPbJB4BU6Wm9i2loDIkA2YT/eNy9PQi8L
 pFXuGZf780EuBWYfwCRlCbCHOJpKEtlPfVy+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6U16I5h4NQIjHAoaMFFGHeoaBszozzi/qTuoY6Zxwc=;
 b=XgI2WWO5LWfbLglcwYG4bT4XDUmnu6pdAZ8FTmvTmtXQikoCP4c0Gj41sYw2WpGqxH
 1htN/8zue8vo7vcFcTFkubsBx4drNi9l/n7XnqBNVpd0FxXL4mqJPNXL2J23H6ewyalE
 Hw0vPID76kzUVBa26q3njk7Pek7mVVDBC0Har3FbZYnXHsLZXe4QSUdv/dJZbvoi7tNz
 Mxiqw3xo4gxoHxbsfatHLPMwRI6siCYS19aReH98R1hIMDWfilYfMWGHq+ls3uLVYokO
 GjT0PvbVzC01CiNPUToHrkQSpKhoiWOTO0Z6Pkpf4GnuQJPIneP4KFcOMlgomdjk0RVj
 b08A==
X-Gm-Message-State: AOAM53294sAI+ZLsCdUGFCWzWwhjjyYztzyiU5exkLoy7NfY9Ngc4dOY
 jEzDXouT86dcZkrCONOi3lYIpg==
X-Google-Smtp-Source: ABdhPJxpwUACsdmtBArNe8Uc2yPifRus+Qkti7/z+fL5OuoV24IhqhLUkZIBSHII1LdUHWVjcaw8Qw==
X-Received: by 2002:aa7:9f1b:: with SMTP id g27mr30524486pfr.30.1643809818708; 
 Wed, 02 Feb 2022 05:50:18 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/31] clk: mediatek: mtk: Clean up included headers
Date: Wed,  2 Feb 2022 21:48:23 +0800
Message-Id: <20220202134834.690675-21-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055019_551757_0045E327 
X-CRM114-Status: GOOD (  11.07  )
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
 drivers/clk/mediatek/clk-mtk.c | 13 ++++++-------
 drivers/clk/mediatek/clk-mtk.h | 12 ++++++------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index f108786caeda..5618c84e4e08 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -4,17 +4,16 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/clkdev.h>
-#include <linux/module.h>
 #include <linux/mfd/syscon.h>
-#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 4fa658f5d934..7f902581a115 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -7,19 +7,19 @@
 #ifndef __DRV_CLK_MTK_H
 #define __DRV_CLK_MTK_H
 
-#include <linux/regmap.h>
-#include <linux/bitops.h>
 #include <linux/clk-provider.h>
-#include <linux/platform_device.h>
-
-struct clk;
-struct clk_onecell_data;
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
 
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
 #define MHZ (1000 * 1000)
 
+struct platform_device;
+
 struct mtk_fixed_clk {
 	int id;
 	const char *name;
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
