Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqQORo3F5cSiwIoJpXL0IaPgeshlZ0JuwtCDzPVPWTw=; b=nLEKxGQR+EU+XS
	hs/LUOFz6j0tYSG3dm5ZwTpy0Ji8ndw3zXTbT3u7JGM7L+pK9dAVuT5Yg4XWdyAQBGHzzv0m7aTLc
	XyVSCnCWShbFak/ofl6ujcUftrn501O2T/+x7eC1WSNBcoYpypKNxrdVi4Oxf5LolmJuIg5VcrV0w
	g7BhQT0cKVigbyXM/SPsul4gCA/yAu/lBVWS24g+UEAUbPW8ez8kBhBMWg2YSTkW27Txevyambee5
	HpmuJ69ya5Ky0IZ8AoIMz4thDGZTqA6ZCnYSWF/Hg1ZkWdQEiffHF4llrZc3OuPUjxtsykylw5E5R
	nigk3qS7hRH6bDTa8FjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCpJ-00GzTR-G6; Sat, 22 Jan 2022 09:36:53 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXo-00Grp1-3E
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id w190so4880787pfw.7
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yYGXqDxo/eWqrROn24aC9cA0IymJmQ8zZXIQFx6Mzg=;
 b=E3fL9k4nB0J+U7dhnH/244EmdfdD1ulLNX+eG5dBwQJtHMj/EcLeIsfa2TRUuWcGd9
 oiNAiHupmkNXYOFsXFJ6LIF2ndolec9H7eZ97eKqnFFN80k3IizBuZjLwuQ1VELWkx31
 mochVNtqJ50lh6iJe00VnTcom/Wyt65N6eHLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/yYGXqDxo/eWqrROn24aC9cA0IymJmQ8zZXIQFx6Mzg=;
 b=YEYCLujAyPaNa+B5/W7hQBOxba0SmsJKa55NuxjdnILWcEr1r6WBFjBeJ+Yugaa6sp
 y8NPBG91irr2UkQ4YJLhEKnF8MajNNDIrcpBG3qB3lscjNArU9QlA32KvKHB8qCaGARu
 XsuhGmnAgGFJboyKanpucl75akcjXa/X/1WwIm9OV27N/PA12kCAo52YEhP8/dV6mMjb
 r8PFyAvKnscb4VOhCij1rG2HN0B7wGxr/8EP7MFEXDfho5hJ8uZa9puZxgYm2JcpoetS
 K9IaLcN/hETPrLEHqRgx763nPEYaihY1UPr+taO8FJG1ieBLewzsDxu1IjQxYEy3vJrG
 xFsQ==
X-Gm-Message-State: AOAM530WxI9yUrIVh3xk1s4b7xH7urplfGchLKGa5PXmDRigoqrc0tXw
 TX9df+mohNcuBWE+l5oyyO+acw==
X-Google-Smtp-Source: ABdhPJyf9HKfNksySR0iObSvFPhmBF8ZKz+iwD2Gd4unIv10qS1uI5MvXPoHzlLDKI0sSrcTb0B6jA==
X-Received: by 2002:a63:6845:: with SMTP id d66mr5494690pgc.199.1642843115668; 
 Sat, 22 Jan 2022 01:18:35 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:35 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 23/31] clk: mediatek: mux: Reverse check for existing clk to
 reduce nesting level
Date: Sat, 22 Jan 2022 17:17:23 +0800
Message-Id: <20220122091731.283592-24-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011848_169736_5B6518C4 
X-CRM114-Status: GOOD (  11.85  )
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

The clk registration code here currently does:

    if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
            ... do clk registration ...
    }

This extra level of nesting wastes screen real estate.

Reduce the nesting level by reversing the conditional shown above.
Other than that, functionality is not changed.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 01af6a52711a..70aa42144632 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -208,16 +208,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 	for (i = 0; i < num; i++) {
 		const struct mtk_mux *mux = &muxes[i];
 
-		if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
-			clk = mtk_clk_register_mux(mux, regmap, lock);
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
 
-			if (IS_ERR(clk)) {
-				pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-				continue;
-			}
+		clk = mtk_clk_register_mux(mux, regmap, lock);
 
-			clk_data->clks[mux->id] = clk;
+		if (IS_ERR(clk)) {
+			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
+			continue;
 		}
+
+		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
