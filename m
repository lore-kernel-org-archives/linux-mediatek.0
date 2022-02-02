Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A013CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLII/k/VzGLlJFuS6qTeyRKkyxNq1JbMFWNBgiPsSHk=; b=cne6ky+EUSIG18
	JNzB91JC8wE9K0aNKPuNifw+8NDKTSaWIdkszgRAx7oMxH7E3gCP+4F5Ifu+8KMkQ4EJ5ceE1UXvP
	klBU7ns63H/DLtB+l3CYz7HZIjY9YHhI5P7OeJmNoJstrvFUBCJm19E5YtF+W1I4zFrx2ply43Q33
	Pu+S58AQ0XwXCkthYmoFs+TdBCLCSmABnsPJ+z/Xx9wSkmf63UKSjFykIsccG+zxKLELwIEBvz36G
	+HY51B4rQHexQh4zx8wRag/j4djDFJCzqiB95KmZbCIIAA6CKDbeIBvYm94HNIG4KB38iCKSUmY21
	Gr3Xp0YAJ10ME0MUyaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG3f-00FQga-DT; Wed, 02 Feb 2022 13:52:27 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1B-00FOz7-Cg
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:54 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so6899015pjj.4
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RrfW8Hvna1qE6lZZCejwLQWPkb90Uz2sIj+oZ4VQ2w0=;
 b=eAVTevsFRW5AshLLU6rlWfH8qccGjQxZFQ+bd1of7avCkX7/yZX5r9fzXx+7vVQOfn
 X4fidgXCTtUrs4NCMzIJWKKvOZ1lXZtoN1++lfoz3azn5qYssjtY0YS9QTKwtdaF2rTS
 hZzA6LH1AuERdElBEbB/Pzl59dRlCgQjTMRVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RrfW8Hvna1qE6lZZCejwLQWPkb90Uz2sIj+oZ4VQ2w0=;
 b=OBI0VjiHOmn16F39k/YujzqXec/RY+F3UHhQKn3KBfi3MN1GMdDARV82nm8C7PAGFO
 S9dogWP3tJ/80STmeeVZnKGu/dzBzi/rsRoMbgw7wo3dJRv3S+1TUxe+UznKIvbUQw6l
 nhDR2TtMYvPOLm5iWfJmAZqu5e0CtzsLg9238ASp7GCRdkmxm57zNDff7pgTmPJnq+g+
 IEPkjSIQe8XCVGfgMERWcVvn20eM4iYBlrjgvcgRZRV2Br2yopkWdcrlMye564XfsQVW
 AqXpq0y+YN5a6zn+ysEPDBlm2bxMOJiXDXnDQlDg8p4y9mL7VnsjM/6I8C+XHzagO9SL
 H5fA==
X-Gm-Message-State: AOAM531TCIij61mlrNToB9JQwKNzzw+64UdA9W4CTTz40aSCupeooRMC
 BrHVeG1emIpTLp9Xb7erD9CfS2hAo/x4PQ==
X-Google-Smtp-Source: ABdhPJyhaR40431uojvn+aN27kxAQL0PWlBqTRA9tg58qSu/BSHP+Xmo8SPpTCFupcg0zxUxemhY9A==
X-Received: by 2002:a17:902:ab04:: with SMTP id
 ik4mr30206215plb.23.1643809792536; 
 Wed, 02 Feb 2022 05:49:52 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:52 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/31] clk: mediatek: cpumux: Internalize struct
 mtk_clk_cpumux
Date: Wed,  2 Feb 2022 21:48:10 +0800
Message-Id: <20220202134834.690675-8-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054953_465210_2C3638F5 
X-CRM114-Status: GOOD (  12.33  )
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
