Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C96C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKwldFY9txLWHuCGk9z/Z6LlLEuNCyfnr//ke8kPLDM=; b=mPp5bg0RrZJ59C
	X52idlJtqJb8GQEzlXqfaun8xGoGjTcX378iNGL+qDJJu/LhOcYjaVdzsJ364E2Tfiwisws20kV/p
	IVc5ZCaj/ifCli4DwgdAQaHYQQSJHOB+6CKk2gNfXt9e3U6hqCl+DgbRJBonM0/Z8Sw4Zl0+NhNDJ
	aK6UoOCm+ZK7ELjgObYl2RduoFBQZwyVKFyNIqXyvmJZWCR+NY36gZij3waHJV2paI0LWc5irkxwo
	+iNEGBmNoDyzAnY9W1ymv77gvqPzVy/T2Kgtk/f3AiXbUAkfA950P/uhFsyEeGGhkrJSf1TNzApMB
	NxwDJ5m70UvnBQg6aPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBClZ-00Gxu5-H0; Sat, 22 Jan 2022 09:33:01 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXX-00GrlY-OU
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id p37so11069630pfh.4
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WfZgCCKhWWL4g9b63+UJL7GvGCEBOJx3TOX6o+D52NI=;
 b=BsAVCGC9C4UCU9w4e0beBa1T1K3NEh7vcM+upT9wdmY25oE2j+R+CPgkeTRHf5YF0U
 2HLwzn10mw+DqT20c0YkpYAow643YIWjQZXE/tqB9DuFeaRY5JLeEKvdwGTpttT9fxD1
 xl8Jem+89eo2oglIvf1Hx3HfDHQHmamvRvEmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WfZgCCKhWWL4g9b63+UJL7GvGCEBOJx3TOX6o+D52NI=;
 b=rSpd98h0bTGOqRKp2JrIC8dFVuwWbVW8Odn4wARv+c7U7yt1l8h2kDVyEqmXCIC134
 2t2MLMf25JnkS5rLsXV/RfE/5nBN6w08FsdJ6su4RJDEgwRyVkuLvboGwm8DxAlAyoe3
 +6+Tb6zEfS88B5/OGeVJkHK1g/YcqYKtJQTD2rT5rt+pHiCrUMi2yDZb8Wis3INscg6l
 jCr2DPyRGfcGv7QmQ8teYpmP7KeUR9D86fa+wCCyKAYxT5Evyn2RBXzRcX2DkYQSw5x5
 BQSTIXTBAthBiZ2YJmUAbXE2YqQrtrBrKQVM6NNuiEcGOG4kct3FHFZ0fMMgZ8M+njFJ
 7RSw==
X-Gm-Message-State: AOAM5307g89GYlfJPhFYCqW0rVfJuqXeQyqxcpciiz4wfolwvh9ZUgKT
 JLEWtuR0K7gkdoMsRZnHHnGEvg==
X-Google-Smtp-Source: ABdhPJx2VhgGVxkpCD6c4pBfWLcAfhPTpc4I2h8LOcFbzz4iFjf2yJpC7rnNN2p2KTBfDDh2j2J+Lw==
X-Received: by 2002:a63:2b84:: with SMTP id r126mr5552900pgr.624.1642843111330; 
 Sat, 22 Jan 2022 01:18:31 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:30 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 21/31] clk: mediatek: cpumux: Implement error handling in
 register API
Date: Sat, 22 Jan 2022 17:17:21 +0800
Message-Id: <20220122091731.283592-22-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011831_837145_2CCD5635 
X-CRM114-Status: GOOD (  12.35  )
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

The cpumux clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-cpumux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 658aee789f44..499c60432280 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -123,13 +123,26 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 		clk = mtk_clk_register_cpumux(mux, regmap);
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
+		const struct mtk_composite *mux = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_cpumux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 
 void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
