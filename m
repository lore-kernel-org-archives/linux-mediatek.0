Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D46C6FA90
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcjMxa2oa+nNSgVobg8BYi3nOn8RkspzQwdQr25nofU=; b=iw9+tNwwigWXMlvmy9a/1Bv2gU
	6ucPkoHebFUp/QzEYP1QtTfnKHfb558sEZcj+RT2I8AK+M/Sl0aaAWyh0wCtTDvjljpvOLvTZCmwW
	YshkAVPEFK3O8V743qMePB3gav1EgWoUPJM/JZ5Y+QtYw+r9gB9JiWaAesD6HX9jRsyqvwDRqd79t
	tr/PDpQokJkZLSoSwib7eLCcVUUtq9Gt14fEd847b78IffpgMar0RYvVuZfbn57ElkLPLYD3uKpQt
	tQ7ODMFHGrhe1jY+zEt6BvVxLdU93eXGCFGZ4PjR7Uno8+fAjqHI9y7QD+J49/Kcb8VjK6qdtx+YT
	i2zBPeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJt-0046O1-4O; Mon, 26 Sep 2022 10:26:37 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJ9-0046D4-4M
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 10:25:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so6266765pjh.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZcjMxa2oa+nNSgVobg8BYi3nOn8RkspzQwdQr25nofU=;
        b=OMxiqQX8klwSiTnH9e9oVMFD2NRMrLyCvdOnToTR9NqWO8Xje08UhWK3SnMI7HlfEv
         ZqBipRTznMLPjzOZ5r4GDjpC8pG8OM/dmLUNbzZoT9ZhDagkPSMnRlwbwTrUyhHRpTRn
         XrYyoxSWMX3clEunMXnmZ1a8x5VnLM46a9gms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZcjMxa2oa+nNSgVobg8BYi3nOn8RkspzQwdQr25nofU=;
        b=dRoKmrEu+AtRaAAK+ahBoeTMYpK//6lhCcbHYZFERXtcOEmWSHCTBUuFQl/dT9rLh2
         usuxdjp0iU1HFvSdjwd8/tV2gWNoOyeqLGFguri8zcQ92ckcilfq8/yHbSFSq6N+6Qi9
         Bcyd2niHNGEPdQlhbgWpe+fyUwd5NAEI6pXEMf1P6G4Yx3hbSHn15cBwThCQnKLNgY2d
         5OrwnwJzXwq5P0McuiIXiatG5nE8PbXWPVxwGnT9NHpAGV0DfhvUaTncQy0M+Xe5P9N3
         WW3g4eBYqT6o09fJ2vqicO860rkCgiM7AYrCctec4fVT8FA479zWyBVK11NlHZ5UZyS0
         ALyg==
X-Gm-Message-State: ACrzQf2IzoCHgThqzWUy4jNyaXxGNDAwAyTm2W3ygCcBK7jflmwY9914
	I5mEwpCq45mGgaJeDdKw36MvLQ==
X-Google-Smtp-Source: AMsMyM7rm/4uF8tsgKbxdB8WUvp8S7VPaRGhX5QYj4RqmRAMsvZnozyIL13tvcR0AVrdkEnDbmUMqw==
X-Received: by 2002:a17:902:d4ce:b0:177:fe49:19eb with SMTP id o14-20020a170902d4ce00b00177fe4919ebmr21053793plg.170.1664187950840;
        Mon, 26 Sep 2022 03:25:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1340:7319:2f7a:3be9])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm11750236pfp.163.2022.09.26.03.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:25:48 -0700 (PDT)
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
Subject: [PATCH 4/6] clk: mediatek: mt8192: Avoid duplicate OF clk provider for topckgen
Date: Mon, 26 Sep 2022 18:25:21 +0800
Message-Id: <20220926102523.2367530-5-wenst@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220926102523.2367530-1-wenst@chromium.org>
References: <20220926102523.2367530-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_032551_256456_AF64F664 
X-CRM114-Status: GOOD (  13.82  )
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

The MT8192 topckgen clock driver is split into two parts, an early
CLK_OF_DECLARE_DRIVER() part which registers one clock solely for the
system timer, and a standard platform driver part that handles the rest.

In both parts, of_clk_hw_add_provider() is called, causing the clk
provider to be added twice. While this doesn't cause issues, it isn't
clean either.

Remove the existing entry before calling of_clk_hw_add_provider() in
the platform driver probe function. This ensures that there is only
one entry, and the OF related code still runs on the full set of
clocks.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8192.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index e39012583675..c2ce72df6db0 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1246,6 +1246,12 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (r)
 		return r;
 
+	/*
+	 * Remove clock provider set in clk_mt8192_top_init_early() first
+	 * to avoid duplicate entry, and re-add it so the OF related code
+	 * gets run again with the full set of clocks.
+	 */
+	of_clk_del_provider(node);
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				      top_clk_data);
 }
-- 
2.37.3.998.g577e59143f-goog


