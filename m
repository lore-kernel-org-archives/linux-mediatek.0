Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eILmAINe7Hvyua7TM3We+/2dC+SHttAFCGH9hIcXUFQ=; b=pW/fgXLIgHBivt
	cXtrUVHt+w0tLP6AdlEyPun2hmFgZo0H3Cg+zX8Qq9Eoln+J6TakUi/pwb1HWqh6jhQ8XR4HWk52+
	n6JZ4D/zXN2q9W+UYk2Jv2eMyNyAaP6DrSVXW65CvmMIS+iEE9cTYoFxt5zE2zdVrujnvUJoNTOfJ
	p6kAwlp7A6Clk9Krq5gpnhBRCG65gtW+e0clbd1d/jlVFUAo0oissynaxybnEjxZ24/pl6dAMPMNc
	DCx1F8HNuW7wxY6lD0689PeT7fnMch+7FQQQB0TcdPIH4zTiybqFCKO1wGCF01MSRqwfaip1e0A+d
	LMwW5zYsyr7+E8dp0irQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPqx-00Dp1u-M1; Tue, 08 Feb 2022 12:44:15 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPnu-00DnNP-Nq
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:08 +0000
Received: by mail-pf1-x431.google.com with SMTP id x65so4130875pfx.12
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3RinXQyHKb00TzypPmHwtAZLN3N95NjRwsCDNBAlwr4=;
 b=YZFeequlV6N1Zm6zx7AjhJ88s7J6s6lm6hq4eZItcgFo8pOMuTMvZ3hzVnj93mM/dX
 wFnDMu6mWWqvp29XUfzBr/4uMQmuOz5VTOtSzqPo+a2U6tTImCdnPb+fMYPH/Zv/Jw9S
 1JOy9pLaEPyxVRAAQJ5IQs+EJiibHDKam75NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3RinXQyHKb00TzypPmHwtAZLN3N95NjRwsCDNBAlwr4=;
 b=cTUVl9zp4lh8ez15+u+qHyZiCU8D+vabPdkYmnVuUXYIc2Xj8TnO3KLXehfAA53yVc
 1xBHh9/UICr/6kBPDZwpBo3f0JjNgd75Uuvzbj3h4MWU31x0efk6EECW2BqaaL1Xk7/g
 JqXdaE2FbUfuo2DoPIzZTGNVKTIEPi51KQKhX55cerxQwyomaZI2+tJUqFxADURolkvi
 84zUXR+/LWEJHfP2y4zbLIqoUzvvgz8Mn7CmTVYKGZC4K3q0rqvjgOWNx/4RONHSzE6M
 GV2+RZc5p1xDwQrPMByZ0jgmuLmUqnetMAWfsqp7bHg3c5hvqV/vdLCEJW7ympH1vATW
 MN1g==
X-Gm-Message-State: AOAM533B7DmDaqb5+BAHtTsqsBmhry/mIa2FDaLnp/NaGt2GcfCCe2Mk
 JQfNpXDIwPjrx1Za/IkJOe2xQA==
X-Google-Smtp-Source: ABdhPJyVR6nI8dkkBw1DN8QU+KXFRS3jfBjQoqHIXzT0wpt+HFO/COZLgDxQ8jisVm0UKOLWRVS5qA==
X-Received: by 2002:a05:6a00:d72:: with SMTP id
 n50mr4229384pfv.51.1644324066273; 
 Tue, 08 Feb 2022 04:41:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:06 -0800 (PST)
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
Subject: [PATCH v3 08/31] clk: mediatek: cpumux: Clean up included headers
Date: Tue,  8 Feb 2022 20:40:11 +0800
Message-Id: <20220208124034.414635-9-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044106_821565_D546010A 
X-CRM114-Status: GOOD (  10.56  )
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

Some headers with the declaration of functions and structures aren't
directly included. Explicitly include them so that future changes to
other headers would not result in an unexpected build break.

On the header side, add forward declarations for any data structures
whose pointers are used in function signatures. No headers are
required.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 3 +++
 drivers/clk/mediatek/clk-cpumux.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 344c6399b22f..658aee789f44 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -5,8 +5,11 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index a538f2bbef0d..b07e89f7c283 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -7,6 +7,10 @@
 #ifndef __DRV_CLK_CPUMUX_H
 #define __DRV_CLK_CPUMUX_H
 
+struct clk_onecell_data;
+struct device_node;
+struct mtk_composite;
+
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
