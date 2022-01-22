Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C40DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0GHiP+4//Vx9+v1qLApsrM62FMFL4nksYJv/uxR2y4=; b=M8CO1bbcZHTRPH
	w4zgfF1XoKKCb1kZai3bvQmu/mPLBXv+azg/+YxJFN2iUgh+KhVGBj8cb05w2cQsVtPVWfTcpMhj5
	3v68V/oMxXnqD0uvOVBrpePconrvRopOVpPor1B2gVY+Dw80j6vitwpuyNZQ4oSPCWcoafLUrKYwR
	gxEM6oRNU7ktRq/7kqZHd0bXC4FiNv0QIsxvUQW3kQ2Lu4lHL4KL0nO/NjG752ddy8gkKZJzi8hp3
	WNX3x3SGdq+kDAh+CX/D+WAiyHNZ/aSi4I2tRVsxJ/jolckICQGot7BYgnTLpVVEwjcsFlfEaPQDZ
	cjYty39elUbRzqXBAZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCZg-00Gsvk-Kz; Sat, 22 Jan 2022 09:20:44 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCX2-00GrRR-VD
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:02 +0000
Received: by mail-pf1-x42f.google.com with SMTP id a8so5711845pfa.6
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nd/CF8vqUX0IATJQuscxS8huseCWfTQmqbhI4UY9O64=;
 b=KVC2hzrkkazjCViKrnLOLBAg7/PZhZuW5n9ZbxaTdZNc2UauGmE3xhUVMdsM3+gF7P
 5BINxyVk+h4ChrIE0lwrtNomRSDTXyw59Ab+fEt2P3Mx9KQwMf7/dy49G5HR1+ZLEFWL
 Hh+vsa23bWhFlOaOnSJRCnrXlGcXx0JP+09JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nd/CF8vqUX0IATJQuscxS8huseCWfTQmqbhI4UY9O64=;
 b=j67TyA4M9Q+VCNUhEk7uDuZnPGjMRvFncMWMWW3b00kd6KACEq2OOwK/cmlu8LJyuG
 vbHf83dUi+abUkAE/5E6KBrLDiFu6a6ruTcfnm5aWt2533zO/NvBg3zeHapCyjqjNYRf
 P8v/JIl93gKAjFiy2wdCBwH0ghfVKyVmCjilpy7k01bxLYmMpI7RhElIcwPtJXLgHHOg
 UJLHQNo9Z+ljiy0ghELbcrwBrezlj67ehBo60OpldWVho7/riBhvc+tpJBOwmaxZ/7Wk
 frZe0F9yI46K4ZESz1cV3+Nf17fhCUgJPch+ElHKl3VPC0KsfogN8nATC4OgZGD4+jhA
 FkmQ==
X-Gm-Message-State: AOAM53277xnFlhU2n+VOwzvO8I3+MyJpTUpJroSvTP+UYoXsOn+wVeQs
 f4HaNoM8CD8nvubZ4gK1OLcM3uWzfC6eNQ==
X-Google-Smtp-Source: ABdhPJzd4uJC769zjxpDoJj+Uzr12VPezjLug+Z4gJO2U3vcZi3VyPGrSQvRsXfDx9Fr1H4uSYC/1A==
X-Received: by 2002:a63:3509:: with SMTP id c9mr5401711pga.332.1642843080226; 
 Sat, 22 Jan 2022 01:18:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:17:59 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 07/31] clk: mediatek: cpumux: Internalize struct mtk_clk_cpumux
Date: Sat, 22 Jan 2022 17:17:07 +0800
Message-Id: <20220122091731.283592-8-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011801_061488_E388B958 
X-CRM114-Status: GOOD (  11.19  )
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
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
