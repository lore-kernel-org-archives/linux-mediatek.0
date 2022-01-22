Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C711FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPXhUgovlVq4bUUv35zvXwLm4eorZtSQje6kotoTfkg=; b=Hr0pN5asMyeLPy
	knrZwL0FCSL4PbqwwDEwpIYNVXWk2ctl7a+fx4eBPBkwpcK6nDcn3vJNxMeeYZTyE6P2wx1qpwkgk
	Ty0owbAmaKPkzTDwNeQ3Np4FWkZagPFzY+IfOXFsK9fXnsM374pQhT27p99SxCEdHkWacTy1BIKgF
	4wXmDqDbbZzG7enfT800/rx6E85plcuDqFXWvib7MybzMjtNxwsKcdmNwa/5VRGi00PGiLbdRnCkP
	do6sDCsPXrfqZ20O6SdK5NU4o9Ny2SDuIyZG0MeVFTedTWURazriE/m3xL5tO+QSSqGUuymPa7sYl
	+kjfvywR/O0nwCpbU77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCmw-00GySt-HC; Sat, 22 Jan 2022 09:34:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXe-00GrqG-EQ
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:39 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso8178087pjv.1
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8YPN+1zbb0FLmeCLY1r05U9fmN1fkUgWhlHUKwR4SnA=;
 b=X/ZtK2SpDBNbC3Na1TLbE7R39jEjlYu+bOu8u+DNEurHjH1tbv0qDNcyqaLBDYGA1Q
 8VwLaJ/PNA2WR9RbNJ4eDR3BMD8BIyBuTAJ/WNHxn6wrfM3rexdndBFYfjpCNFiKNiqo
 E7c4AfXewebnkxmvND/e8oxCRJ21aYZY5EKFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8YPN+1zbb0FLmeCLY1r05U9fmN1fkUgWhlHUKwR4SnA=;
 b=hy2ITya2Sr82TzBqm5O0mJngWOELpT6Ny4RgMcyLXi0dMpRqsSwvvNGaBHdP5Cd6kh
 vrWxkGULGjGXBL1kZ/FY0k84aHrunRZxjkTzWOFjTpXtoepLqd6PMPtaK6VLZ4CEK9Hh
 un511NuGiD09IZ6z9+N3dTlEJlybXIO5mjgjo9tmRCWV1xF+e4h6AFMAEwFh8StpDt00
 RUU1Z/JFRPl6gTHrA+3zI2QQP9EQ6dyToWNeYTxWxcbAKNA9+eZtrs0yetnv8az/vRK/
 TeucrGjAPDldJVRJJK/70MgkIGKO1cTHZoz7J+IeeBKSidyqfEmOv7kA1MbePjYNWVnE
 h7FQ==
X-Gm-Message-State: AOAM5336pEnZc6u774z8LtJWUPKNH818SB9fOB7AnaDiYG7W3J+kU9v2
 jMNQ0XY4v8aqYkVcj7yAwIXi+A==
X-Google-Smtp-Source: ABdhPJxXOmZFL9go3UdVwQDSJBJ6fg68hKE0lBH0fAd3eIgttYowB4HFeZeVzoGLMe1c7TNtJJKpJw==
X-Received: by 2002:a17:902:6b02:b0:149:7c20:c15b with SMTP id
 o2-20020a1709026b0200b001497c20c15bmr7026790plk.173.1642843117953; 
 Sat, 22 Jan 2022 01:18:37 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:37 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 24/31] clk: mediatek: mux: Implement error handling in
 register API
Date: Sat, 22 Jan 2022 17:17:24 +0800
Message-Id: <20220122091731.283592-25-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011838_530286_C8DD2D72 
X-CRM114-Status: GOOD (  12.44  )
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

The mux clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 70aa42144632..f51e67650f03 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -215,13 +215,26 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_mux *mux = &muxes[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
 
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
