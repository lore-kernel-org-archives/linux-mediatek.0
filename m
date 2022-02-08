Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490F6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XB2G0tfPHMxkGR7DgLKC1EysQss+Qv1LVfQ05+ayLjk=; b=3t7ieA8x7RELpV
	mm1Ksy/Avczf/ZKvIa3NQToZ5i5gkMd9mZw0/fAmPZKPhBozfaAU80+4Atv6G5iY+Jj+S2JOz46en
	xdy7Wy8kDdqbX4fUGdCwUVkox40Ndl9RhOq1Fv2Babsnhya6C2kGli6Cw//mwU95IMN/siHc3N6Qh
	t6PA2Rg/hCFOIDpjrVNzEQv58IFtvyunyxIh4MSU3WooqKF/IYjXCZhRaa0XhkeM4UBAE1xe/7tlS
	/L/Hg5QvRPfxlQe+KvZYiUsoo5y7n7x5MwK9aNo94qU4hn+syk6VcRaMU0T49R195pURvNNpj6rP5
	0ngJdIuY83L4GI3rx7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPqV-00DolP-JR; Tue, 08 Feb 2022 12:43:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPnt-00DnMW-8W
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id v4so10209500pjh.2
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iNXCz8EKk1VR4agv1nk/pR4RM+PZmf+e9yRG2bvKFuM=;
 b=FaLgS8JBXSx2rVQXT64+Rqa2xv8iXnhXcaxplMpKSmYnFH93Ujylq6y4Cl6nyd/sAH
 WQfwAS1n/fUwhgBYIe1KmVkTBNXyXUHhRiExOGRjWRVg/4G87sHy17Rcuz1/8y4EO++T
 6VK2V+jUdpukhI1bpN+MT9dUVWszTMuJ5z9NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iNXCz8EKk1VR4agv1nk/pR4RM+PZmf+e9yRG2bvKFuM=;
 b=vIPC12kVboPEziGTeOmtAZh9cKDKBlLAhcEkCe6Tzlivrknhi0rddjY0Vit83tE1NM
 lDR1jDYQoCAK0C6NQ6zifIPEcU0abGiSrg27n5v81minBavPehKDSD6HEwaqybMgmO4u
 BwvRacYsC9Y/xDw3oBIKpoUfGE+/YBgZMbbue2pHH4t3jmLkIWPcmJjwog9e+H3RGpu6
 kDmPkorRIs+xSNRkRIANEhLix7cyQNabjIsAGHaPbSznIm6o01MeAlOTf9kOoXtt9RjG
 eeCNF+jD7cMRUREsu4WLqKPVuyhsl54E46633VdwRqn/x26ysLFrjNoGvFoLckTGGiQA
 AA8g==
X-Gm-Message-State: AOAM531ztlWHPbxbbCP7ayi9QCI+4sXi3ewjZnbo8z2YJIDkJOWBOPsL
 ZL76UISvmoDLrAjRJgBNbrwgpg==
X-Google-Smtp-Source: ABdhPJxCsDQjhQfSgwvXF6h1UuMsst6PTHnyW2BLFIfU9v0XAu5TwkzHqYQzzLVcalU0yaSD5TQ4Og==
X-Received: by 2002:a17:902:f651:: with SMTP id
 m17mr4251259plg.106.1644324064142; 
 Tue, 08 Feb 2022 04:41:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:03 -0800 (PST)
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
Subject: [PATCH v3 07/31] clk: mediatek: cpumux: Internalize struct
 mtk_clk_cpumux
Date: Tue,  8 Feb 2022 20:40:10 +0800
Message-Id: <20220208124034.414635-8-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044105_355616_F3177331 
X-CRM114-Status: GOOD (  12.02  )
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

struct mtk_clk_cpumux is an implementation detail of the cpumux clk
type, and is not used outside of the implementation.

Internalize the definition to minimize leakage of details and shrink
the header file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 8 ++++++++
 drivers/clk/mediatek/clk-cpumux.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 99a819e3673f..344c6399b22f 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -12,6 +12,14 @@
 #include "clk-mtk.h"
 #include "clk-cpumux.h"
 
+struct mtk_clk_cpumux {
+	struct clk_hw	hw;
+	struct regmap	*regmap;
+	u32		reg;
+	u32		mask;
+	u8		shift;
+};
+
 static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
 {
 	return container_of(_hw, struct mtk_clk_cpumux, hw);
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index fda7770fd803..a538f2bbef0d 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -7,14 +7,6 @@
 #ifndef __DRV_CLK_CPUMUX_H
 #define __DRV_CLK_CPUMUX_H
 
-struct mtk_clk_cpumux {
-	struct clk_hw	hw;
-	struct regmap	*regmap;
-	u32		reg;
-	u32		mask;
-	u8		shift;
-};
-
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
