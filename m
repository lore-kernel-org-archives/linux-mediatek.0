Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD89C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 07:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4TIX5Lbmsf8aXpBXl2IfuVlAji3mRbxj2Lc/urBL7M=; b=u2JUnbuulqwEAk
	wQs+VlqSZm3mdsX0ihCZ41hwPMCW1V96YQ86thM/kFGLS3yOZ7tLux4rt+bhNvlIWrVybUCf/AKG5
	svlJkK9bQRLd8ncrv4D0D3NHXPHmbQ1f9cWhFHwmhJ2nuQwbtv8fhFZQ+u6r/Ks97kemQB1qtK6Id
	zXBXw9TV0+fWKDRf5SYVZ/NlP3uiNCQSp/ylIYCTWXDmcUavgEoo59EXQMrwXbatbmMtgUypOTHfj
	sV0FgfqRpPW2RS1c9c/i+JbiCxijpWDBd0LTVrWrOeez/3MkUgLyW18oWVV31LNhN4Tb62k/UYeAK
	TxrI0nhVl1QlWK15BVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nraOq-005TNI-IO; Thu, 19 May 2022 07:16:44 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nraOm-005TKC-Lc
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 07:16:42 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso7965970pjj.4
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cH79WtLzMOqFUUnK2kn/1tBt8ZjWnYQCRSDHn3B7YcA=;
 b=mWw/D457X0Ra2tdW+bQE0qt7AbOAi0il9BcFHlNgdw4z3xU/xF+mYqyaE2xe2mhqSW
 JgR1HJ/GoTcPWVyLJN1rBYXb88vP+BmlwCw9elnK+5/r1evMK7N9E9aIADZrIjM8Uvy3
 muBGEfyPKu2NLuCCSnTKV7ThZXW2Z0knpC5D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cH79WtLzMOqFUUnK2kn/1tBt8ZjWnYQCRSDHn3B7YcA=;
 b=HcRmw+rIk/G1Vzjf5S6zBp/aGjFCD1enhcZW7VI9d7AJQBPID75Vin8SzKiKMMzsuU
 HBH7B3LJyBRtBhNIi9o7/c/crI0A6Ukj1sQO73m8lJIpjkkWHct5maFnCoq6S4gxfaZ5
 HlXtBT9t2MkP6qGclN2Pcuu4bpMVpXRKwNEzWpQkxAoauHTTarCB9H5kMoGMT8coRASw
 XWjvyijuXXxvhkaj2cXL7lKJAkccZNM5E+ypEltkxmm5m/gEXHPi6PExy9hYK2h249BV
 OLoSwO1qR4+qU8zYEY1uDBmb/rtekP0rihDapiFkwqtbwHQCNCmbQQcYDLaS1XMa3VBC
 /1UQ==
X-Gm-Message-State: AOAM530goOObS3BVsySGC4tKIAwQ6OPPrlI4srSnL44IlUQMIIUBoiFp
 rhETZ/tfFWO164JOXR+ywbM/fw==
X-Google-Smtp-Source: ABdhPJxerj/ScUFseL5P7Tfgjpgxs9ptQdEZ57VVfGNEbvfGEhzOVSdem6eKxcdXMOdcDG1cBo0esA==
X-Received: by 2002:a17:902:8696:b0:15d:946:2f98 with SMTP id
 g22-20020a170902869600b0015d09462f98mr3479433plo.82.1652944599940; 
 Thu, 19 May 2022 00:16:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:2338:2871:9320:bed0])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902dac200b00160c970eeb7sm2972945plx.234.2022.05.19.00.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 00:16:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] clk: mediatek: Make mtk_clk_register_composite() static
Date: Thu, 19 May 2022 15:16:06 +0800
Message-Id: <20220519071610.423372-2-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519071610.423372-1-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_001640_741676_6CA9BF97 
X-CRM114-Status: GOOD (  12.67  )
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

mtk_clk_register_composite() is not used anywhere outside of the file it
is defined.

Make it static.

Fixes: 9741b1a68035 ("clk: mediatek: Add initial common clock support for Mediatek SoCs.")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 drivers/clk/mediatek/clk-mtk.h | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b4063261cf56..52bacce5dadd 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -183,7 +183,7 @@ void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
 
-struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
+static struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
 	struct clk *clk;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index bf6565aa7319..9577084790dc 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -147,9 +147,6 @@ struct mtk_composite {
 		.flags = 0,						\
 	}
 
-struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
-		void __iomem *base, spinlock_t *lock);
-
 int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
 				void __iomem *base, spinlock_t *lock,
 				struct clk_onecell_data *clk_data);
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
