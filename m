Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56F2C6FA86
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/piew8Fp8myCT2H8kL5OBdjHwCVZfK2/VXVhRTmvrA=; b=mKKi3Nonzow2hM10RI3lwcC/is
	MQvbfYjgLLAelsB9Wj+gOAT/TY68NYwAuMyZgvBpAajWYYG4r11MNNuSwZqNeL8PYrknF9GPnHlHV
	efyYt9QAVcuZCWmDAN5y2ZO+xtb2hUFOxwmxO6hbTsLplc5kQQSNtNLUSzhPjeVKozFxkQrrV847H
	c3IRPKNfPm2IoR2nSJhCxI/J1o+YRc7RpGJpaRE77qf3nuMw9rHUn2hOHomkrDSeloFIM/7btUcfm
	AqdMptzu7aU7XGxUaP3u4dd+mWw8EnY9MnpKaZWACsmM1HivAv90xLX/ya0DU95WWfGUNNYyjhilQ
	Q9GedV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJa-0046MT-Kx; Mon, 26 Sep 2022 10:26:18 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJ1-0046BL-67
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 10:25:44 +0000
Received: by mail-pg1-x52d.google.com with SMTP id r62so2316965pgr.12
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=A/piew8Fp8myCT2H8kL5OBdjHwCVZfK2/VXVhRTmvrA=;
        b=QZE3s8uY6O3BJZAekWSS/9P/kvQFZmhBge/VrG6u8e1drv/yDzwLtC1XSjk4XpTPO2
         nt3wgJn/zYSSxkBu7vCt8GdORaOm9mUOv0by5SOZZPG/Lxst3srJU0lIC0GX6OhQtbEY
         EMTlRzW9Dihz3h/rW6QMpgIKvSOqZwbwmX7QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=A/piew8Fp8myCT2H8kL5OBdjHwCVZfK2/VXVhRTmvrA=;
        b=MVHsCFubbwHuR0uDmHwEGCT0Nfl9J0onzZwjdVvWxJ2E5YpY0I3LBbTJG6bS7lrYzf
         CaI6P2I5pDZ6uHvxdlkLKj9qIN8r941RhKa3b5CVnyNdIZVLNeInSg4zuKB3Y9a9n2k5
         LkGtkQXTPZ6ZJ2FIY3BqhnUTkUYWj4GacygrK8Z42Ft9lHoXEFkvZWO/fOIat5PwfAB6
         n3jA95S/AS16lyTFtUf3FxTBXq7JYalJxmSSnIVQaOGWR6Ml5yj/C2ftHR/AvcKBqBU/
         ET707US8bbJEXLP/nvInwVsRnz3EskYIYCCGc9rjthO3LC4lieMnO6Hd//S8FNdbYtWF
         JuXQ==
X-Gm-Message-State: ACrzQf2BfRAVpbHY/iiFqEYUpnK9EyyZrgiPLMGyTQHQJfMUZis7EInL
	XrxM5QWF6qPpwLK+hfT3Y6Yc9w==
X-Google-Smtp-Source: AMsMyM5LeLpH/v+lk+tfYQJnPOUrdY5XAVfRKUVAvafdYHbHQUM9imjsantKF6FAiXJ+CvJvmxQhGg==
X-Received: by 2002:a63:6c08:0:b0:43c:7bd5:2d3c with SMTP id h8-20020a636c08000000b0043c7bd52d3cmr9778327pgc.145.1664187942786;
        Mon, 26 Sep 2022 03:25:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1340:7319:2f7a:3be9])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm11750236pfp.163.2022.09.26.03.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:25:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miles Chen <miles.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] clk: mediatek: Migrate remaining clk_unregister_*() to clk_hw_unregister_*()
Date: Mon, 26 Sep 2022 18:25:19 +0800
Message-Id: <20220926102523.2367530-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220926102523.2367530-1-wenst@chromium.org>
References: <20220926102523.2367530-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_032543_282392_6C283AEB 
X-CRM114-Status: GOOD (  10.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

During the previous |struct clk| to |struct clk_hw| clk provider API
migration in commit 6f691a586296 ("clk: mediatek: Switch to clk_hw
provider APIs"), a few clk_unregister_*() calls were missed.

Migrate the remaining ones to the |struct clk_hw| provider API, i.e.
change clk_unregister_*() to clk_hw_unregister_*().

Fixes: 6f691a586296 ("clk: mediatek: Switch to clk_hw provider APIs")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 174d0645be38..a8ae65302837 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -80,7 +80,7 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 		if (IS_ERR_OR_NULL(clk_data->hws[rc->id]))
 			continue;
 
-		clk_unregister_fixed_rate(clk_data->hws[rc->id]->clk);
+		clk_hw_unregister_fixed_rate(clk_data->hws[rc->id]);
 		clk_data->hws[rc->id] = ERR_PTR(-ENOENT);
 	}
 
@@ -102,7 +102,7 @@ void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 		if (IS_ERR_OR_NULL(clk_data->hws[rc->id]))
 			continue;
 
-		clk_unregister_fixed_rate(clk_data->hws[rc->id]->clk);
+		clk_hw_unregister_fixed_rate(clk_data->hws[rc->id]);
 		clk_data->hws[rc->id] = ERR_PTR(-ENOENT);
 	}
 }
@@ -146,7 +146,7 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
 		if (IS_ERR_OR_NULL(clk_data->hws[ff->id]))
 			continue;
 
-		clk_unregister_fixed_factor(clk_data->hws[ff->id]->clk);
+		clk_hw_unregister_fixed_factor(clk_data->hws[ff->id]);
 		clk_data->hws[ff->id] = ERR_PTR(-ENOENT);
 	}
 
@@ -168,7 +168,7 @@ void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
 		if (IS_ERR_OR_NULL(clk_data->hws[ff->id]))
 			continue;
 
-		clk_unregister_fixed_factor(clk_data->hws[ff->id]->clk);
+		clk_hw_unregister_fixed_factor(clk_data->hws[ff->id]);
 		clk_data->hws[ff->id] = ERR_PTR(-ENOENT);
 	}
 }
@@ -414,7 +414,7 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 		if (IS_ERR_OR_NULL(clk_data->hws[mcd->id]))
 			continue;
 
-		clk_unregister_divider(clk_data->hws[mcd->id]->clk);
+		clk_hw_unregister_divider(clk_data->hws[mcd->id]);
 		clk_data->hws[mcd->id] = ERR_PTR(-ENOENT);
 	}
 }
-- 
2.37.3.998.g577e59143f-goog


